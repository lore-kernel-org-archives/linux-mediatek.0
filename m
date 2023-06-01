Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5194C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 01:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9X7ljo9Ivr1f7IHCPLyv7nu+bDKVeLDhLcQTGZ/wlLA=; b=dVq5UhbhuaczOYtZ50E2CkHe4c
	7DPj8EkKfLRqv7YgALNvjCVE3nxHNajXe1Sw9IXLtuTtTVvUHb1eP/fgqgU00FfpHWjbb3zsgU6PZ
	XUTwFwkmtQ2yYyguhqsJcS3VF6s+QxDVrKLi3gBu3k8J2ugj0Cfzl74ogA9lDO8bmPpUTe7JP5AC2
	cExs9D/GF0JYhLELHprYvO0OpeMw5arCHm1p9N2SxWgFjo7J4hUm79Bph9lQeyTcLOxF0cIoRKLtv
	StuqGVkIVEwpwiC+qqNhQltNqKUsT+qI8c0GHEzMEzHKiEJDMrzrlnY2coAxZxCgYSYvejmginnq+
	9sEyo58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4XHk-001eNT-01;
	Thu, 01 Jun 2023 01:39:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4XHf-001eMW-2W;
	Thu, 01 Jun 2023 01:39:26 +0000
X-UUID: 1df894c0001d11ee83ed1395ce914268-20230531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9X7ljo9Ivr1f7IHCPLyv7nu+bDKVeLDhLcQTGZ/wlLA=;
	b=qp2uWroD9wFJnGTpDE2GFeZdQUZ+ajf0xFodr6NJgBGG28j85RmWlLrF0HdVsz3EIOvsdha/77RFBBeflPFtZakFSVncTNjfHsol4b1AXeXh//4nvE+4GYhlnPVyCY1TCrTVZWbLYS5zzy8pqCuQVnDElD3ds6vUEzDOov2K+Uo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:b4564a1b-8938-4559-b931-e9e217d871f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.25,REQID:b4564a1b-8938-4559-b931-e9e217d871f6,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:d5b0ae3,CLOUDID:5358ff3c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:230601093845WKJPD1F2,BulkQuantity:2,Recheck:0,SF:17|19|48|38|29|28|1
	02,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 1df894c0001d11ee83ed1395ce914268-20230531
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2082230757; Wed, 31 May 2023 18:39:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 09:38:41 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 09:38:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbBMU9+3FU5Y6ZqKmeeeY5joVDjFoSePpP+1VU3xRjOjpY6ZqiOkVpeQj3qnMEnSZAGIqqBIdFei+57mdKEgUGVT9BAS9bHpAFTK/YjbtU0mrMY095jAyZMm59eZycIRjRSRPrWP+fSKDfui6vt64R0/zjsrV1SkZC0ljokfvKIru/Jk3/y2H/mm8kbJ/zAQUs7Y40ZV/X9539fSYJ+/Ia078wiyGWHRezR4jiz35vqM9SOrOPoMK/hvEkjPNpJ5cnhE4w0BvhGZIQj2dg0l3qipogXYuFh4Grsy26U8BZy2L1ATUncamZHqzoikyQJ3u8ot0J7VXpiU37p690KlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X7ljo9Ivr1f7IHCPLyv7nu+bDKVeLDhLcQTGZ/wlLA=;
 b=PKmRHLX2QQeAl6aPsVKkNQAh5Yqq/zayR8qbTzvXJtwoF3tlftqVP2ltcty3sH+xyaBCUfH0rq+P9A4c2Jfk4xY+r+XgFCGAX7G4vEZ5nPIhSL4/WxvM40xKw7A0H2stglXzYI6LrqwCjGm00X6wcbP+ZROognPLnx6UW+UYG34NkQDGzt6TPqtOcZT27brnkJswRWKNl3AxL9mMSpKupIs5JOKg0MqJir15EocPhE/5unQJ/KLNXIfbRTFjolYud/8h8IUTTRX9ogvVlkTn40pTMmOkaQOta6ckqh9sNKEn7qPxem0BPsfTvAPfd0DCikjNjiUnEW2Vv/aKzHbReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X7ljo9Ivr1f7IHCPLyv7nu+bDKVeLDhLcQTGZ/wlLA=;
 b=Z224xTN8kwQPCma4QoMip7Ia/ltvnYk9mgvTljcVIm4/j9umR5T4TENiQI9pHsL6VBFkZs6iL1oJTd/kzm4Lu6LClgZ/1tHAFXvKD+VIy6e/pg+a5VDjIi2ghbYswu25BQZV7R1jfzgX0D+xGjOyhrXsVNMwTCzPUS4hFh4Pmvo=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by PSAPR03MB5752.apcprd03.prod.outlook.com (2603:1096:301:81::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 01:38:39 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 01:38:39 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?WUMgSHVuZyAo5rSq5aCv5L+KKQ==?= <yc.hung@mediatek.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"tiwai@suse.com" <tiwai@suse.com>, "ranjani.sridharan@linux.intel.com"
	<ranjani.sridharan@linux.intel.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>, "daniel.baluta@nxp.com"
	<daniel.baluta@nxp.com>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>, "perex@perex.cz" <perex@perex.cz>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"sound-open-firmware@alsa-project.org"
	<sound-open-firmware@alsa-project.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Thread-Topic: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Thread-Index: AQHZhu3Sn+0oo178vEumn/jQJPYWz69bMh4AgAA9awCAAAZFAIAAySuA
Date: Thu, 1 Jun 2023 01:38:39 +0000
Message-ID: <418beee83eb239645f1d59b263b891d3cf17ea8a.camel@mediatek.com>
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
	 <20230515052540.9037-2-trevor.wu@mediatek.com>
	 <7c784932-951a-65c0-c48f-bfa4c098b2e1@collabora.com>
	 <ZGJKPuf1FX4AYLXl@finisterre.sirena.org.uk>
	 <8f57c62f-c427-f5df-d517-d4025fe7c65d@linux.intel.com>
In-Reply-To: <8f57c62f-c427-f5df-d517-d4025fe7c65d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|PSAPR03MB5752:EE_
x-ms-office365-filtering-correlation-id: 5e54d47d-56c5-4c9d-87c6-08db6240ecd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: //FckOHeJ1S3aEv0oGk3oK0XscuUoEX18ExBMa9LDP8i/2yHV+4FY9M0lmQqZ/RtttaydYakz9WrGO96bZRtP6dDSH9z/EkGiISN7E1oSe5rVLUMMutaI67w4b3d+aMiot2dz2wIGW7Up0vZjLNKC217i8Ec23KVRMa8R+cekd+rD+kS3zm8JPXpwYcwp8HdkM2cZ0zhuyyHY3kk+HlMdwov0BkijloRzZwSMyNG4VhbDVXGy5heUGRUD0hvLYdBdWYnxm66XEhWZCw4FSKxqRXR2HSze4PDyGW8Ri/2jS+9esVglZIni9Yb1rK45N2Q3aT2RB81SUrFWGI0mBmIUbwj7Fyf5JZahCh5NU/Wyd6MznQ+txujTMfKr9qtBigCdulLkwkYvO81SMkliCH33qSRx7hSNgcrqZOAwki3E4j6weRQ8wh6f/ZrGEN4zJU5qiXqdxkb0qi95wxXDhz6r6vNe8RDh+UdOSS41xlfivKmeL3rpPB+OpWVxAGXbwHJFXI4EB+oa3MBJNatdBjazbPLo7xZ6FkUAYDWKgEu1FXscnV6MpWW+4sBc8qXrzxK06xzHVCXDT4PfomJjuFGFlRfppT/+moCARwu6WVYe3vDuf5yiI1q2tl9vW2ULvQQkFE4C0Dzr0yHAd8RZsqxgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(478600001)(54906003)(110136005)(6486002)(71200400001)(66899021)(7416002)(5660300002)(2616005)(41300700001)(38100700002)(8936002)(38070700005)(2906002)(8676002)(83380400001)(86362001)(85182001)(53546011)(26005)(6506007)(76116006)(64756008)(66946007)(91956017)(4326008)(66556008)(66476007)(66446008)(122000001)(36756003)(6512007)(186003)(316002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjNVS2xnWVZ3S05DTWxGNndEcHlncC9EWHR2S0JNOUphL2p6M1FIbk43V1c2?=
 =?utf-8?B?NVlFc0s5THVzcS8rY0tsY1QvalgvOHMwZWQ1aEFxU1MydEF0THBXcFNiQm5M?=
 =?utf-8?B?emZZV3YxMG9wS2dEV2tnN2dKUDVXNWI1N0lZVG10eStjK1pWajl3MjJjSmVN?=
 =?utf-8?B?aWYyamNaaHhxUVBwd2h0ek91OENUWmxGbHEwWlhjRmszVEtnOTZJd1l2VzdM?=
 =?utf-8?B?UVFjdnFHSWRjL0o2Qkxkbm5GUDljR3k4N0owOTNqVUJJamprbC80YWdDOWNi?=
 =?utf-8?B?RW94U2o0T3lSeVQ4WEp3Y2dQWndlVlRSbmF3bU5Fa3RVcDNSSXNEbnVBSGUz?=
 =?utf-8?B?cDNHTVVpeUI2dVhHWVA1SC81dEtQRUZ2aXFSLzQyY3U0V2J5ZHhDenlscHdN?=
 =?utf-8?B?aW5tc3JNTnRySlQzOERyY21yME44UDBXbG5aSFFpcUZySERZUkxTYmtKZ2p1?=
 =?utf-8?B?QmZUVEExbVhGTEJIUmNxSGdubTFFTC9uUWpaSkV6cndhY0NRcTZSVzYrMllu?=
 =?utf-8?B?REhPUDAwckIvZHREQkxIc2JhRG9pVkIyOEpOeTJoYUw4bEp3L3loVS9vamln?=
 =?utf-8?B?ZHVwdDV6NEo3S1FKVzJGQk80MStwbDRoajNKbTFHeVRpd2VLdCs2cm5aYy9S?=
 =?utf-8?B?N05YRjMyb3oxdjlSbUZ2aUtXK2RCVm0zWVh5dGZxRWVVV0lBaGQ1cHpkWmNG?=
 =?utf-8?B?R0Z4YmJaM2Naa2ZsbjRvMFQrWjJsUnBwVlBIRDVod2drQitxb0poa1V4MmNa?=
 =?utf-8?B?UDBxQ0l1Rm4vaHJLTVYyUGJGRkF0VER3dE1oNDYraVhCS1ErSUdNNExKbGYv?=
 =?utf-8?B?YXE1ckJrYzhqMUgxb3g3dWVLNlhISm9YR0dvWVFrSU9Ub3dMOWs5Q0M3T1k2?=
 =?utf-8?B?Z2FYWjd1a3d1WURDclJJZFRaVHNLSlNmRElia3dIN1pPM3dPNUdjWUVQOG1m?=
 =?utf-8?B?N0Y3SHF3Z0t2U2lnWWV6T21nc0w5bTg0L0ZOd0luU1V0UkZ4dHBPR05iTE1y?=
 =?utf-8?B?d0o4OFJFUjhuMXNPQktpL0M4WEhuOFF0enR2M1F5S29icU50L2d3djRIMlRU?=
 =?utf-8?B?Z3FwS1N3dGN5ZzA2Q2NlU085M0NCUGQ1VkVuZEo3ZHlhRkJQVVd5MWpKaytn?=
 =?utf-8?B?K3hORWZKLy8xay9nSk02Q1NZR3JjNE56ejIzMUhnR1plK29FYVFJTEpxMHlX?=
 =?utf-8?B?bFB5UHR1Q2FwTkxRUFJiZ2VhWm0yQ0dDY1hjbWRteEY1MGxJWGx1Rm9TdkZt?=
 =?utf-8?B?dVhKcmc3V254UlhQN3JXUjRraHhrM3Zvd2ZFYUtIWUtjUUdYSk1NbUEvaFlp?=
 =?utf-8?B?d0diVndtV1ZNV3E4dmc0TjFnamVxa3dlOUxqdjRLV1VVZUthRVBkL2Y1OTFW?=
 =?utf-8?B?WHhpazFvaEJ3d2pUM0RyTVQ4OVJneXFtNlFOQjRDYk80NnZubUhoZFU0WitT?=
 =?utf-8?B?bFhsYnJOalNhd0kyK3dHZFJwSUo2c2FGRXh3ZXhtVHpqR2R5Nm0rM3ZiS3hz?=
 =?utf-8?B?V1pQQ244L3FoeVEvRzJ2TUxHbzNVR2NMcWV5MFB1aXc0MjNsQWc2dUdZM2ho?=
 =?utf-8?B?SmNHQmw3T3V2d0lZZGhHbFRVV09qQXVFbFV3U05MNmpRdXBMY3ZVazg1cWZu?=
 =?utf-8?B?RnZkK0w5NlZuWFcxc0xqUXNoYy9NRElOcDRIdm1mSTR2RmVIZGJCRTRqQlNI?=
 =?utf-8?B?UzJaNVlMdGtBRy9BN1hONEFWS2U0Vm0vZmJncER1V21GUVF5TU5aMFFPUnF5?=
 =?utf-8?B?OC9HeGVrTGVzTE5OdmVUOHJPMjJaMlVZcVNBNHdRZUdqeGhPWEwxYnB2aXJx?=
 =?utf-8?B?U2lyMCsxSjFxcGZZNUc3STdXdUl5MEJGMzI0TnI2b0JTWTdiTjRRS3JId3Rn?=
 =?utf-8?B?MzJzSytJRGJTV01oYjBQdXhKc3lERTd2MmgweXJ6bXVtdDhkRitiSVlFdjUz?=
 =?utf-8?B?VWVJZTJWTWFSNk1hSDNZbXpycGdsbWp1dS9sd3dScDJuZU4xSU45WWlJZzdJ?=
 =?utf-8?B?NkVLUGNTRFZFKzBXK1MyckpJM2NHOGd2TTlqbVZ1eWs1ODlVY3prMW9ocXF5?=
 =?utf-8?B?UGsxbTcvQ2Z1RjhxUm5jSExzekhnYWhxSmVyTGxsd29CN0RkSVpvVDFGUHkz?=
 =?utf-8?B?NVVSK1YzejNzTDRKQ1lHejN2WHZ4YTdZbDhBYzY1Nm5ucHZ4cm1mUXVUZ2c1?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <979138333575454EB8ABF7DD36C6B8BA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e54d47d-56c5-4c9d-87c6-08db6240ecd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 01:38:39.3401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DuxPwrE8e7zMZuNm4bJu/kOYVwbh5Ahms1CfmHwaOqbmOnXAYU9fBgVcwQjtSJCvebiz4uQKP2AYsY2ijIdVtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5752
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_183923_831173_3F94F26E 
X-CRM114-Status: GOOD (  26.22  )
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

T24gTW9uLCAyMDIzLTA1LTE1IGF0IDEwOjI4IC0wNTAwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3
cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiA1LzE1LzIzIDEwOjA1LCBNYXJrIEJyb3duIHdyb3Rl
Og0KPiA+IE9uIE1vbiwgTWF5IDE1LCAyMDIzIGF0IDAxOjI1OjQ0UE0gKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsDQo+ID4gUmVnbm8gd3JvdGU6DQo+ID4gPiBJbCAxNS8wNS8yMyAwNzoyNSwg
VHJldm9yIFd1IGhhIHNjcml0dG86DQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsgICAvKiBjb21tb24g
ZGVmYXVsdHMgKi8NCj4gPiA+ID4gKyAgIG1lbWNweSgmc29mX210ODE4OF9vcHMsICZzb2ZfbXQ4
MTg2X29wcywgc2l6ZW9mKHN0cnVjdA0KPiA+ID4gPiBzbmRfc29mX2RzcF9vcHMpKTsNCj4gPiA+
IE5ldmVyIHVzZSBzaXplb2YodHlwZSksIGFsd2F5cyB1c2UgZGVzdGluYXRpb24gdmFyIHNpemUh
IEFueXdheSwNCj4gPiA+IHRoZXJlJ3MgbW9yZS4NCg0KT0ssIEkgd2lsbCB1c2Ugc2l6ZW9mKHNv
Zl9tdDgxODhfb3BzKSBpbnN0ZWFkLg0KDQo+ID4gPiANCj4gPiA+IEkgZG9uJ3QgdGhpbmsgd2Ug
bmVlZCB0byBwZXJmb3JtIHRoaXMgbWVtY3B5OiB3ZSdsbCBuZXZlciBzZWUgYW4NCj4gPiA+IGlu
c3RhbmNlIG9mDQo+ID4gPiBib3RoIG10ODE4NiBhbmQgbXQ4MTg4IGRyaXZlcnMgb24gdGhlIHNh
bWUgbWFjaGluZSwgc28geW91IGNhbg0KPiA+ID4gc2FmZWx5IGp1c3QgdXNlDQo+ID4gPiBzb2Zf
bXQ4MTg2X29wcyBmb3IgbXQ4MTg4Li4uDQo+ID4gPiA+ICsgICBzb2ZfbXQ4MTg4X29wcy5kcnYg
PSBtdDgxODhfZGFpOw0KPiA+ID4gLi4ud2hpY2ggb2J2aW91c2x5IG1lYW5zIHRoYXQgdGhpcyBi
ZWNvbWVzDQo+ID4gPiAgICAgIHNvZl9tdDgxODZfb3BzLmRydiA9IG10ODE4OF9kYWk7DQo+ID4g
DQo+ID4gVGhpcyBkb2VzIGhhdmUgdGhlIGlzc3VlIHRoYXQgaXQgdGhlbiBtZWFucyB0aGUgb3Bz
IHN0cnVjdCBpc24ndA0KPiA+IGNvbnN0DQo+ID4gd2hpY2ggaXNuJ3QgaWRlYWwuICBJdCdzIGFs
c28gbm90IHRoZSBlbmQgb2YgdGhlIHdvcmxkIHRob3VnaCBzbyBJDQo+ID4gZG9uJ3QNCj4gPiBo
YXZlIHN1cGVyIHN0cm9uZyBmZWVsaW5ncy4NCj4gDQo+IFdlIGRvIHRoZSBzYW1lIGZvciBJbnRl
bCBkZXZpY2VzLCB3ZSBoYXZlIGEgY29tbW9uIHN0cnVjdHVyZSB3aGljaCBpcw0KPiBjb3BpZWQg
YW5kIG9ubHkgdGhlIG1lbWJlcnMgdGhhdCBkaWZmZXIgaW4gc3BlY2lmaWMgU09DcyBhcmUgdXBk
YXRlZC4NCj4gWW91J3JlIHJpZ2h0IHRoYXQgaXQncyBub3QgY29uc3RhbnQsIGJ1dCBpdCBhdm9p
ZHMgY29weS1wYXN0ZSBvZiBhDQo+IHJhdGhlciBsYXJnZSBzdHJ1Y3R1cmUganVzdCB0byBjaGFu
Z2UgYSBjb3VwbGUgb2YgbGluZXMuDQoNCkN1cnJlbnRseSwgSSBwcmVmZXIgdG8gZm9sbG93IHRo
ZSBzYW1lIGltcGxlbWVudGF0aW9uIGFzIEludGVsIGRldmljZXMuDQpJdCdzIGVhc2llciB0byBz
ZWUgYSBkaWZmZXJlbnQgb3BzIGV4aXN0cyBmb3IgbXQ4MTg4IGluDQpzb2Zfb2ZfbXQ4MTg4X2Rl
c2MgYW5kIGl0IHJlYWxseSBhdm9pZHMgY29weS1wYXN0ZSBvZiBhIGxhcmdlDQpzdHJ1Y3R1cmUu
DQoNCg0KQWRkaXRpb25hbGx5LCBJIGZvdW5kIGEgdHlwbyBpbiB0aGUgbmV4dCBsaW5lLg0KDQpz
b2ZfbXQ4MTg2X29wcy5udW1fZHJ2ID0gQVJSQVlfU0laRShtdDgxODhfZGFpKTsNCgleDQpUaGlz
IHNob3VsZCBiZSBzb2ZfbXQ4MTg4X29wcy4gSSB3aWxsIGNvcnJlY3QgaXQgaW4gVjIuDQoNClRo
YW5rcywNClRyZXZvcg0KDQo=

