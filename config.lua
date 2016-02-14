return {
	bot_api_key = '186819075:AAHvgUdRHeLJ_VCND_1oGupKaY27nkd_urA',
	google_api_key = '',
	google_cse_key = '',
	lastfm_api_key = '',
	owm_api_key = '',
	biblia_api_key = '',
	thecatapi_key = '',
	nasa_api_key = '',
	time_offset = 0,
	lang = 'en',
	antisquig = false,
	cli_port = 4567,
	admin = 157337513,
	admin_name = 'John Smith',
	log_chat = nil,
	about_text = [[
I am otouto, the plugin-wielding, multi-purpose Telegram bot.

Send /help to get started.
]]	,
	errors = {
		connection = 'Connection error.',
		results = 'No results found.',
		argument = 'Invalid argument.',
		syntax = 'Invalid syntax.',
		antisquig = 'This group is English only.',
		moderation = 'I do not moderate this group.',
		not_mod = 'This command must be run by a moderator.',
		not_admin = 'This command must be run by an administrator.',
		chatter_connection = 'I don\'t feel like talking right now.',
		chatter_response = 'I don\'t know what to say to that.'
	},
	greetings = {
		['Hello, #NAME.'] = {
			'hello',
			'hey',
			'sup',
			'hi',
			'good morning',
			'good day',
			'good afternoon',
			'good evening'
		},
		['Goodbye, #NAME.'] = {
			'bye',
			'later',
			'see ya',
			'good night'
		},
		['Welcome back, #NAME.'] = {
			'i\'m home',
			'i\'m back'
		},
		['You\'re welcome, #NAME.'] = {
			'thanks',
			'thank you'
		}
	},
	moderation = {
		admins = {
			['157337513'] = 'You'
		},
		admin_group = -315733751,
		realm_name = 'My Realm'
	},
	plugins = {
		'control.lua',
		'blacklist.lua',
		'gSearch.lua',
		'greetings.lua'
	}
}
