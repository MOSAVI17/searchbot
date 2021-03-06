local command = 'github <name>'
local doc = [[```
/github <name>
Github addresses based on the name of the Search.
```]]

local triggers = {
	'^/github[@'..bot.username..']*$',
	'^/github[@'..bot.username..']* ',
	'^/github[@'..bot.username..']*',
	'^/github[@'..bot.username..']*'
}

local action = function(msg)

	local input = msg.text:input()
	if not input then
		if msg.reply_to_message and msg.reply_to_message.text then
			input = msg.reply_to_message.text
		else
			sendMessage(msg.chat.id, doc, true, msg.message_id, true)
			return
		end
	end

	local url = 'https://github.com/search?utf8=%E2%9C%93&q='

	if msg.from.id == msg.chat.id then
		url = url .. '&rsz=8'
	else
		url = url .. '&rsz=4'
	end

	if not string.match(msg.text, '^/g[ithub]*nsfw') then
		url = url .. '&safe=active'
	end

	url = url .. '&q=' .. URL.escape(input)

	local jstr, res = HTTPS.request(url)
	if res ~= 200 then
		sendReply(msg, config.errors.connection)
		return
	end

	local jdat = JSON.decode(jstr)
	if not jdat.responseData then
		sendReply(msg, config.errors.connection)
		return
	end
	if not jdat.responseData.results[1] then
		sendReply(msg, config.errors.results)
		return
	end

	local output = '*Google results for* _' .. input .. '_ *:*\n'
	for i,v in ipairs(jdat.responseData.results) do
		local title = jdat.responseData.results[i].titleNoFormatting:gsub('%[.+%]', ''):gsub('&amp;', '&')
		if title:len() > 48 then
			title = title:sub(1, 45) .. '...'
		end
		local url = jdat.responseData.results[i].unescapedUrl
		if url:find('%)') then
			output = output .. '• ' .. title .. '\n' .. url:gsub('_', '\\_') .. '\n'
		else
			output = output .. '• [' .. title .. '](' .. url .. ')\n'
		end
	end

	sendMessage(msg.chat.id, output, true, nil, true)

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}
