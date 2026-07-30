Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09241C54FD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lr72AC3d1+uGAz//Hkd4VH+SFQMHBHL02OOUfNaW5GE=; b=1WZLEuftPUq8eBJQXybGq6sYEL
	WK1NT0gZbVFdg6tv7FKgpBIf8BHdnp1faCNmAl5mAIeNPyHAYXyWGEFTBm4qaDlMGZmFqcRwORl2A
	nqJPhEepis9nRcrscDakmdk5E5bkVxUiSkkI4LwNmw+vmUL9u1hMGRTwCYFgdYn7wZPGhm2J1/vP/
	2KzwRaC79BoJliKzh+QB/OsAZ6jTp4+4/RiXkeRTINB0iroaH8P0b/G3JgHuThUXh1Rn4DXeHw438
	6kTK/ua1/2XquQXeiB6jgGlmo/RTDHgrAv1p7CdAaWBEk8SJKKSYpNkWXPKlERQR4NgEDQ6Di//L5
	+sPUVlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOEL-0000000AFB3-2Kjf;
	Thu, 30 Jul 2026 10:43:13 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOEH-0000000AFAC-3UyN;
	Thu, 30 Jul 2026 10:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408190; x=1816944190;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TS6FbwMEhOKyy137qvXPwhpHtdqtsJlLT/oP0kR7ldQ=;
  b=ZzeN07jfiWSaYYwZtDpjiLyJxM1YWCdBW48I9of4nmWIppw+9rJ7DbVj
   Lk+3Gb+oeVUb5+oIs0KG3nLXuO+piqN7y2TpiGgQIJ5ymvIRYEjPv1zzs
   LF4e8X0bvQu+IATXG11gkZIpa9iIUIrpgCWdg4u7W/w9yALhqFgX5a+gp
   +Tr5xlG4przMiHlZXFlkO/brmrhbeWzHxJ6gyFUQ2LjK3+ypf8jcFe3cy
   aoBVBN7L7OrBp13cwWUf+ERwVZwUjfgPz2J0wF1CpINsOm0vxc6E2cI23
   BPd2qLs1y4CBJHqc4d/QE9lKwtamBvjLcweajSJ0oj1mDk82t2JvQsFm6
   g==;
X-CSE-ConnectionGUID: rPJVKsMLQJeZzfUN4MS2bw==
X-CSE-MsgGUID: MuE0j+vlSziy1ych8CcWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86143069"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86143069"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:43:08 -0700
X-CSE-ConnectionGUID: tEOXqD9+SjWuhFIcK61xVQ==
X-CSE-MsgGUID: vgljq19lSwyRZFz09X3Mtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="298477932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:43:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 03:43:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 03:43:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 03:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNemRMIsc0WvR1dLML6dMoi6jUIL5Ag1/KwLGKoo2bexkG++Wjr1zVwdbEA0TFEq3pcQ8DwqHYvhaFAi27jG5yMv3+mbSOojyjW5n2UpzI2HgRCWqiHXqZ4zo3DxuxJix7kpza/1jGpW6/1VKa+88Pj+UEMJ47wLdgg9RESL2YIh/BJsKxOF1teSdld7KsXUXdYfAxKGxYuDpBV2kAVNg03Ptfwy4u2iiEXYJ3ZBk7YWF/zs9kjBvPxrFaCLg9Lwv6wy8Me/wATLJUzY23L0IStaWvBMFPbn1ee92QxI7ld+DXBBJBuolCybxRqVUwi74pmi5cYXZGM987eIERxY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lr72AC3d1+uGAz//Hkd4VH+SFQMHBHL02OOUfNaW5GE=;
 b=J/vVIg+6lG/snVP6kbKZOfk9pSD/LoeH4ABkuJBHYqav/SGzXmCy27iAT35NdBXWK6tHg1J8N+uSEAzNfU/uWqEKOsXIkDwrUwAN4Qi5rgEp6SKZxWEwv8xAEJFxSPXCldsnIK/5YnZEd0nouWmjK9o1GTzpFOiFni3qu43/0KgJSYake/r3rEajTQPvpHwT8fQKAn8qKYbtU4Xv1GwiXSv5zqc0zt6EmslbxZKfj5hXztHKZNN8T4W/HfaS+toQ6KI4T9guKUcMgQHlN3k1hJznRRY+jAFtP7mcBylQEWtvI+fkxJbzOM5eZDIPFUJgDncqhOADxleY2xmkPd+FqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 10:43:04 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 10:43:03 +0000
Message-ID: <d42c2ea5-e7cb-4a6b-b9ff-645908ddedf4@intel.com>
Date: Thu, 30 Jul 2026 12:42:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] ASoC: Use named initializers for
 platform_device_id arrays
To: Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>, Aaron Ma
	<aaron.ma@canonical.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Hasun
 Park" <hasunpark@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, Mario Limonciello
	<mario.limonciello@amd.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven
	<fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Mac Chiang <mac.chiang@intel.com>, "Ranjani
 Sridharan" <ranjani.sridharan@linux.intel.com>,
	<patches@opensource.cirrus.com>, Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Srinivas Kandagatla
	<srini@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
	<Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
	<nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <imx@lists.linux.dev>, Liam Girdwood
	<lgirdwood@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
	<u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <178519395804.552178.14635881416240705752.b4-ty@b4>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <178519395804.552178.14635881416240705752.b4-ty@b4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0062.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::12) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b1d19d-ec06-488d-6e95-08deee27553c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|56012099006|10067099003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: gY3QnezOtEvAU1MpEpeEcUf8yZf4E2j0H46RZdmqjtR2CMDEMFzx/2sGMzUDwQ1zK/r4OsO/gv/MS4Qbakfb/IXulc6je7TnO9x1nlwh5cPBYL0Atj1t2OnSiIWLxZOLzEbJeusx1EWssk8pzaHCl/3Jlh1zcQ6W1tpnLzYIdPc+oni3zCsH0XpYHYB8Luq8GUIo1H6h653kp8SbRy5hBatLLJEAy0Sqm5c3MkVy3tf5vcwL8jKvZ4McWu2Icvu+3z30zgTXIyNKKQsg+ZpUKte4GFwqmqvtvLU+oIYJZLH0nUBwpKKLa3MmW5SpYrQrzvdTZHpMqQYQTS/x0EWo4cOH60A1TSR/qswnE35E/pgIcfhtvGWQZ+z6cHCgvu58wqebKlLoMNagkmePt+zBVzOi559G1eCfyinpyXEYIqBplxxUDS0QTaTP/6aAnK63DVFkQ2w7je8ST0EWD49mlTuc4CDFIY6mvppPRYY1P892a/n0jhY0F0o7MI05bUaUhhItIUn9LrXDR6uwHYi3YXd5jQ3wdJCzY3HH2g3lt8LF71vjFpUUlDe0eSMyCpno1+a44pxJ1FeWlO7lHGFfM6H9BJGsoQBsEbRGQN2diINjeSvC1cJnS++vCILltiDeYsT1N6+2wcu++K8wf/P8xgmXPsJZhJkB5lnl7f2JG8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVVUMVNORitrQmNRUENObDBYNG5oc09pS0NZc1llY0pqeUhsSFp5Sy8vSUM4?=
 =?utf-8?B?WlN5T2NtWmhoN2pHNFhiR01TMmNPTWVRTll4aWdWZEdyQ2laQWk2V0x1TVVY?=
 =?utf-8?B?MFcxbWgwdHkrQkVjN0N2SnNPYXpXb1pwQTBNOEJHL1oraS83TG5FckhzTzFW?=
 =?utf-8?B?T3A1dTF2Z3c2OXVQNGhUMDZuSFphaFQ2bjFLU1pWc2hlS01aSnFkRWZRVFFw?=
 =?utf-8?B?MmVsVlkrVXlIM0JJTkpBNkxZY20wUGp2NjJjT015UkErclhITjJ4VDA2UVQr?=
 =?utf-8?B?UUs4alZ6NFBiNTRaQUExRzIzU0s4YWtXY3NnRG1Mc1Nra2w1SE5TSlh0RGpt?=
 =?utf-8?B?WUlxNkVoazNwRDBCeTY3REVhcWR2ZWRNc2RoL0xwbFpqdXNGZWVMWGpNQnM5?=
 =?utf-8?B?VVk2dnJYV1U2VnJOMFR0UjlLcWNoNmxpUlhCenRvbWkvQTQyUmgwNXVILzI5?=
 =?utf-8?B?eWlxR2JXcU1peXEvcm50UUxFSE1zcWZScWRKQ2Q2eEhGN2dETERzQmUyTWU2?=
 =?utf-8?B?Q21pRjd1MWtUQWNpcmZVVGd3VkxGeEE2a3ovL3ZFTnpkQVlraWs4alhQZkNq?=
 =?utf-8?B?aUxLamZvVFNKZEM0SkFCMm00VzQzbVZaeXE3enRaLzNkV1A1MzBQSEpzdG93?=
 =?utf-8?B?akZqNDVwdmdIeTJnQVVFUCtiUTFzbmp2ckREUTlHMy9kdjEvdGE4MjBKK2R0?=
 =?utf-8?B?V2E3cjBqd09vY2ZnTEJ3YkpMd3VPTXdxRzNhQmM4Ny9YOUVZeFI0MDN1WC9m?=
 =?utf-8?B?aXdkYndyWVI2cERadmlZSXVqQ1YvMzMxNnVSZXVxd01ZSHhNR3N6eitBTzlo?=
 =?utf-8?B?a1JMa0kwOXByNms2TjFkMVZQUXRVc2l2eElnSUdTWVRyZ0w5NlhjZFhZcU9H?=
 =?utf-8?B?SlN3WEJ0V1ZoOTRDYzFadFBzZG1LZEpqckZkRk8zVVNsbHZ0U2VZMDhsVGZF?=
 =?utf-8?B?bXptU3pCTHVkZlB0K2JDeUdmSHVvSlNpRitVMkFDdEFTeTJlS2plM3NOUllC?=
 =?utf-8?B?cU9ucWJPRGdVUWIxaCs3YWhIZFJuYnIrbk1JYjVxV25nZ0NoODFFc2lSYjJL?=
 =?utf-8?B?RTNJRkZ5RHdNRERGVXFNeENhTUhnK0RhMWtTR0lQTzlQKzNNQkN6ZmVYRmoy?=
 =?utf-8?B?UmhwSGVkQTFGYWRzc05CNk9PRmdWaGVJL09VRlVUamxtWm1BeDJYU3l4eHkw?=
 =?utf-8?B?Szg5cFR4c0NsWnpyRTlOR2htMVpMY3FrRUFBSGtHY3FtcmowbHkzRVFTaEk2?=
 =?utf-8?B?bGNweHpVNktoYU5qSisreUJNTzFhNXZkcE4vZUgwVnhnemJLUGoxbi9KV3B5?=
 =?utf-8?B?bG1EQ1liN0Z2SlM4ck03U1BLSTlnam9IYU5md1hqaEVabE9HQ0tvYnhpYy92?=
 =?utf-8?B?NnowNEdyZGhUSG5vaXJ3cWhLaHEyWnVhaHpqYStnMTE3aGZmSy8vdTlyTzMw?=
 =?utf-8?B?aVFSaTVtaVhiMHpTSDZuaWZMQ0tadjNGUVI3bWZSOU8rMHpKTDdFZDg0UzNV?=
 =?utf-8?B?WXk5UXBJdHVLYnZWTkQ4aXZ6QWxscUFsaC9vUitmYVg0RWFHOVRNSDRlKzBS?=
 =?utf-8?B?bHZFU0NGYStuZk5GMGpnY09uVlpzNmc5NGNJN0JwOTFuTndOWmg1amk5NGhv?=
 =?utf-8?B?dUprSHFqNkZacW1aMk0xUWtFNjZuYnVPaWtqcDFIMm8vdmFkUjliaW5YenZh?=
 =?utf-8?B?bXpUY29hbzFBVE9rdFIxazcreDBWbFplbFl1aXdWazZJSHVsTWoxaml0UWFF?=
 =?utf-8?B?YWFPc3RXcWRic0ljMGIvRmpVa2p4ZW1NRkYrclA1STNvNHdYVHJPWTVtRVhG?=
 =?utf-8?B?ZkcrVmFoSlVKbXVYdXpIY0J5aUZqZW5ZeHN0N29XcEZOdzBnQWlwSGdmRlFZ?=
 =?utf-8?B?UW5iTnBRY1JoenpHY3ROZXdVWi9aMFJXTGJ2MkRLTVdqbWtPbVNiLzFBZWg5?=
 =?utf-8?B?RWQzdXV1VU8zS0FVSEk3bDJ4ekYyb2hUSHpBTmJnUzNyWUZBME1LanZOYzFB?=
 =?utf-8?B?M05CeHpOMmpDL3lQM0ZZSjQza0wzMlpxMVBDNGxoVmNmQWNwSXZNZnIrNGxE?=
 =?utf-8?B?b1RzOGF0SS81Q21FWkNEYXNuMmxXeUtuZDkxK3Raa3hnL0tmeEdhZWVYdEd6?=
 =?utf-8?B?RHVnbDVFYTcydkZMN2s0dms1WGUzb3F2ZDJlR3pxbDhoWm5FeTJXTkJJV3JJ?=
 =?utf-8?B?amo5cVJaTHJ2MnY1Qy8wSW43aEt1TlV6anUyMEpicWlMQmFEQy83ODI2UE5D?=
 =?utf-8?B?Smd4Z2lDRDQ1eURHbTlyamRiNVRweXcxZnIxRGhZSG5Da0ZiMDNNTDZPOTRo?=
 =?utf-8?B?SzJ2VTA4MFNuN3JGZmI2WStTcndVZ3pYYjlsOXNOYTZZeWtaWXNUQWF3a0J6?=
 =?utf-8?Q?iISFH1m09ufSfxuQ=3D?=
X-Exchange-RoutingPolicyChecked: fZyFsHDDJr56vMv4hUOqw8T0qyRlAcEUw1SPWnUyD+LtVhAyAraVGTCNRycTRZexYBYOMCyYrR485/mAcv8PMyHll5VLPFUEk9tKZxFm6N5D8eE7pG7lVAiGvWQFXYmD5uryOpAF5UciQ7yltHllo6lOKfnq3a5A7N1WYywwvqYcO3ZLBUOflUSuwQab6MzoRuwy5FakFYnh60Z1yoCLohkywe5sC4lYQTDU6U+vDN5UeDSypqvVuZnRam2nJ7kJc4C19JR1JD70Pjl7Lda1PfGsHJWdhlXKvSau0BXnv3cJ69Ka//x90pYOm62PXZtuY+RIQdA5oYIRLBu5aBH2nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b1d19d-ec06-488d-6e95-08deee27553c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:43:03.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzPBqAPzlgnbNOQmYX2lDbBZ9YSv8Wan4f1XHQ1g1DG1+bvTQK1nnb04F/UCk1fUwp94PSHKLKgn5dga5SpQtHE+OxHhe6W3TGK+FioZ8vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_034309_921860_F31B3911 
X-CRM114-Status: GOOD (  11.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7/28/2026 1:12 AM, Mark Brown wrote:
> On Mon, 20 Jul 2026 08:23:44 +0200, Uwe Kleine-König (The Capable Hub) wrote:
>> ASoC: Use named initializers for platform_device_id arrays
>>
>> Hello,
>>
>> the objective of this series is still to prepare making struct
>> platform_device_id::driver_data an anonymous union. See
>> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
>> for the details about that.
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3
> 
> Thanks!
> 
> [1/6] ASoC: codecs: mt6357: Drop unused assignment of platform_device_id driver data
>        https://git.kernel.org/broonie/sound/c/c7a6909de856
> [2/6] ASoC: renesas: fsi: Drop platform probing metadata
>        https://git.kernel.org/broonie/sound/c/0ca8f65516a9
> [3/6] ASoC: amd: acp: Use named initializers for platform_device_id arrays
>        https://git.kernel.org/broonie/sound/c/2b26d06fd3d8
> [4/6] ASoC: amd: acp: Unify code style for platform_device_id array
>        https://git.kernel.org/broonie/sound/c/4bed1074db1e
> [5/6] ASoC: Use named initializers for platform_device_id arrays
>        https://git.kernel.org/broonie/sound/c/232725a0e386
> [6/6] ASOC: Unify code style for platform_device_id arrays
>        https://git.kernel.org/broonie/sound/c/e4dc03df1f71

I'd at least expect my Acked-by: tag replaced with Reviewed-by: for the 
AMD's patch 4/6. Perhaps it does not matter in a long run but I feel 
better pointing this out (it has been pointed during the review).

Kind regards,
Czarek

