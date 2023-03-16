Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D72C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqGLsfUWM9r9GFwsBFdHl2DcbM8Q1kCpQ8mbJI5DAiA=; b=YYLQlBe6P2HEsPSpKLqJ2Me6Vm
	uV35fUuFM1TbjLpesK2QKP4cwak1tozWcQq6+3N+qVSx5U+VQAdHIRaIn/GONQx36olJEn+LEN///
	kik2mpAZCHiIGaHywdcHXQtLEbMS3Eq7fztupl/dTwX96esNnCAByGB+zYzakNyAyw+98a9LnbLqR
	sXtbyAdv3bpZc76wjwHlje62UwHHL1swWFpLJaHj/CLbb7bd3VrAUe0/7edS5xYecaPxiEQ+6QkzY
	w+lBlDiK4Z+iJ376e/dFgffe5MCEClsDDHGePmlKCrlizPvJTe7E5EmWGSA59EqAibqJN7bdG9/Ja
	78o7FDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckbn-00FzgG-0v;
	Thu, 16 Mar 2023 10:13:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckbl-00FzfA-0F;
	Thu, 16 Mar 2023 10:13:18 +0000
X-UUID: 284f1f28c3e311ed86fbcd8805c7ac66-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TqGLsfUWM9r9GFwsBFdHl2DcbM8Q1kCpQ8mbJI5DAiA=;
	b=bpqb3cebcT+uuXYwL/Kb+GRpvMTQpnIadXJuyJu50qCEGjxPagNgMq3Zw8UDLgcBuGA+0IlZFgb+TWyajaRopK/EkvwvtoZ/7PixmDjQG0zIsmFouxr2UxDuGbS+KH3CE5E//4DKX5e4SJICHnnL5Z0m1Oi1HwX6PgTGX4SkOf0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:5a73348a-8b62-4152-8086-011ca250cdcb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:b50473b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 284f1f28c3e311ed86fbcd8805c7ac66-20230316
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1735310401; Thu, 16 Mar 2023 03:13:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 16 Mar 2023 18:12:35 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 16 Mar 2023 18:12:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmZwCGGb5ZNKL7TEFvMplXRDY3+UT3yfeu9URWmg0tqwQy5Vw08OPwgnWxwViFGPNY5l9q4uHLv++EIDB/k9EUve7lNmhAFg9kvOr0e4cDURABAafAwvvmNxTOxDxqYiRcmp8yuL4yPEQdVwO2nV8nNy1P/MXjHazZSazE4Pad7WHYTOoUfZkd/Nc92YtK32ZxpG1avDMa5Sy7P/SdR+YWR0/B0sS+Ap0E0rzc+APSjLcgs4a3yqpnbRakmOh8fIstdAFMVZQEu0Hk+/7D1ff7kcpASD0tdY05gEdazP2tn7e11kgtSIUSLlCICstnv/XQUfA5M5RjsGHOk0jUBOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqGLsfUWM9r9GFwsBFdHl2DcbM8Q1kCpQ8mbJI5DAiA=;
 b=ARXRaJplH3kqNEQeX56rBsFTtMjCB98oXzkyxI/Dr7lR328ion8f8974k0P5FhrFyqmHvJQwc0d1PYMhYb3zw1urWiAygn/hBc7maEX6Irb58yp+brguCkZNAT7XvgGAM6vxi9WbRZUxmdlsuQs5fxTokY6423B43V4znxfDSOyDePPQIjDzkjeTdvvnYHkT+DpegSKLcTBeyYxsuX/gSFlRRnHdNaUdjuI/npDsYLjYoxkf1KRUHCYA+PXf6rn+ZvkbcqSU1YQ2Ph3rKtkvxDEBL1mqQaUColJQaMRNMbWKZ0Kiq/+Ll3ImRaAFZJhHaMy+Tjluh6DBjyx0TyKhkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqGLsfUWM9r9GFwsBFdHl2DcbM8Q1kCpQ8mbJI5DAiA=;
 b=fIHPLVfzD35PKmYoEsR62hcOmO15E1AnDdMsv1D8YgMvXty4tcUjzF70gLTHh+flP+5K6rnIXlGFoMwHT0Bcyu5c3RvW8aKbgpeHMqKdzAPGXBAG+vmislBYXhal3lUyJ2B0iI61AK41PrJiIXRrHB76egVcLxMtXiV5qV1/YZA=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by PSAPR03MB5365.apcprd03.prod.outlook.com (2603:1096:301:17::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 10:12:33 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::5055:f50e:65c0:6815]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::5055:f50e:65c0:6815%9]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 10:12:33 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "error27@gmail.com" <error27@gmail.com>,
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: Re: [PATCH 111/173] ASoC: mediatek: mt8188-afe-pcm: Convert to
 platform remove callback returning void
Thread-Topic: [PATCH 111/173] ASoC: mediatek: mt8188-afe-pcm: Convert to
 platform remove callback returning void
Thread-Index: AQHZV1AVRcdWIKzEh0ezhDwyq5yG2K79MQQA
Date: Thu, 16 Mar 2023 10:12:32 +0000
Message-ID: <4a7eb11c4731bf4975aa06a05f5103f656ada698.camel@mediatek.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
	 <20230315150745.67084-112-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-112-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|PSAPR03MB5365:EE_
x-ms-office365-filtering-correlation-id: 13e43f90-a13b-4cd2-026b-08db2606f552
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fIkGlp1OhiX2tF947U+HAtQVaduXX02MZOfXCncUQxwu1YmOkj2JU0zWb24ZKFKQny4ueXHhIgYOvTa0fDpHNWnp5IzzHATEBUMnAh/Dmw6J+th58zGfN5+WXzz8EWYf4c2tDpejzpnG4W+5yZzeEsOgdWewgRjVw14qYcHU9VgisAUa4kk23L/OwAdl1FLu8SW6e8hxH6uI2TczMmJSwJ9gGDA4BYlzFyNtIvc4gqaI/4rP7O4kEu1dAALHnJQEK80m9uOTyF4Md0kRbiFxuwUaxmLtwS4A8QMwieOgnia51dtkC2rKIs6wOce13R6J0YfFiBGH2fDq1dtaSYvlbbs8HqcF29yPBQ5yP9WiDpIF9ZQNUdu6q5/3659fEXONvPwWknzNSQUNCabmSYyQUWw3TwrDcE0sMVM9peAfCiNQ1R6xvtweE1KLzAK782zKEU8QWumo5blXJB3DCQXwM2TmRgz1+K6PGDM6OjOYMWZPCQDOHOoazdrqKZmxJFBQ9XgxZ3pfIhuNU7fDxDyMcorjjTttWzKdjIaqsrA7s9wEKvycAX4YakMhzQxe7cB1Pqh4JPCY0u+0Kk4UIb6REUGrGV9M7UCZh18CkorkX8I44+ZnkG01Q0mxSQvpNX4Y/Sj1ghv8odKHRPmkeYK6LunibVLb6yRiu5L5tog45PTRE1vKL1sK8D4WzY8UYdKe71zYsVlRep55tO/SVHG79x09BJYBbR5O/UBCP0x3C0o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199018)(38070700005)(85182001)(36756003)(122000001)(8936002)(7416002)(41300700001)(2906002)(38100700002)(5660300002)(71200400001)(110136005)(6512007)(2616005)(86362001)(186003)(26005)(54906003)(83380400001)(6506007)(478600001)(66556008)(8676002)(66446008)(76116006)(4326008)(6486002)(66946007)(316002)(66476007)(64756008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTRNMFdjSnd3VzJ1cjVTWjV2ejFtNEFCUTNGS25xN1VWQjlOQitSVzFiZ1BF?=
 =?utf-8?B?UWJDNkNINnVBWlJhUWZ2TTNTUDBmWlFobU5nK2R0RXR2ZERrUnpXZm9DekJt?=
 =?utf-8?B?K1pzOHgxTVRNWjN2Rmx6SzFiaFNrTEZ1dzh0a09aV3RNenNhak83NkFSQ1dq?=
 =?utf-8?B?cEE2WlNCRjhKUDR5MHZ5MjFNZW1XU2NiWWNPYWZKaGZGTlpiNURUM1ZJS21Q?=
 =?utf-8?B?SVd6Q0tsNTdTU1lBdlo3NUdrY3NFREQ2V25XTk8zM2F0dVRIMEw1YXBlU0Y4?=
 =?utf-8?B?Y3ZKZmNyakYyNXlBK1R1cFhxeXdBUlJiY3JrZkNNWEJ5UEtjazNOV3FqZnVN?=
 =?utf-8?B?dXc4TFVZeExReTVyWG5POVR1VHUxSU56TnZsRjNhdW1HSEhjL05DTFVQMHc0?=
 =?utf-8?B?OUVieEtiMEhURkx0QytuVzVjeGVpaXdUZVcybVdKYXo5T1RaaDNnd1hKSU9r?=
 =?utf-8?B?RmlyejBvcU8vdnZ1NitDNTZUdTNTYWxSTXZvTjY4Z05FOXdQS3FHWUhvaVR6?=
 =?utf-8?B?MEpOSlg2MFZJenN3UU9ienk3S2RBRUhNeUlLVWF6QS85M1NOTGlacUx2NGRn?=
 =?utf-8?B?QjhXQm81WDd2aEl1L3RUaVlXU2FNNm9ISG1ZbTVQYVFnNW0zYVM4aEo2bmdj?=
 =?utf-8?B?TG5maGRnMVVVWGhlTE1HcVIxVjFMZEFHUTc4bzJYTkVWQUR0YWNMZ2xGbUZo?=
 =?utf-8?B?MCt5bnNLY0dPN09rUUNnaEFrY1VmcC9iM2VzVFM1eVdXbWw2a2pOenBremFH?=
 =?utf-8?B?WWJXMDdrRkdmcWwzck5vcDNNL3l2WWtyUytDT1orS1NCaU52Y3pRNXBHMTEx?=
 =?utf-8?B?WWp4K0pOV2NUNUUzS2dac0tCRTV2bW9uMDZkUTN5cVFySUljOGtUaGpxWG9I?=
 =?utf-8?B?bCtVd3o5Ylg0UjZXa0FqZFNHYkJMUGpPS0hlU0FqMFJNUnRVSE5OUUM5dG5v?=
 =?utf-8?B?MW9tZWpQL0l1dmM3cm9QQzVQNWpoSytmb2F5TUIzSUhSNFExU1hxOGlrdGE0?=
 =?utf-8?B?SlFydFRXTTdHbGZ2QWZOYjgvMzRQMkZ0djcyMjVJRjluRC95TEVxNUFDSnR6?=
 =?utf-8?B?S253Q2JHRkRsK08vVGhyQUJDWWFiYnh1eHFhSXUrZjZreDFxajJCQU1IS3hW?=
 =?utf-8?B?Y2tvTWhTWVprVXB5N0VEYkZmdmgxMkxTZW5nYi83TVdqWXZOL09lUGRxdktM?=
 =?utf-8?B?a2EyN21LMmpDcFdwOTNhbHo3WWNkSEYzblNyU0pWMklrQ09Sb3pJbklteTYv?=
 =?utf-8?B?Y1lUNnF0b1BMbUltWXA4dTMzY2ZIM2NORWtkdE5oNTRLZHZTei9mK0VxUUE5?=
 =?utf-8?B?SFBFdWxLWnp4eGJjVVJOaXFaWHIyc1BIRGRWRm51ZU91N0MwY2FieW9rQkNu?=
 =?utf-8?B?MmY4MURta2pkQ05FNEZCUXhaZTZRdjRVdWRLZXE0YmNrL2FzTFBDNTI5MThy?=
 =?utf-8?B?aTQ3MmptaHE0cUUySjhrSndIMHl6WG05VGEzQXB3cWFuZDBSN3ZYdXJ1bVYv?=
 =?utf-8?B?a0VQcytCN2xOUjcvNkt3OFk5bC9DQnJQNlBDclVpMnZEZ2NJRVRrS2xxbHFh?=
 =?utf-8?B?SnI1QjVYRDRMSkJWcnN6aGozbkNIZit1L3F1RGdkRE95U0dXbmdIT2NxUGNk?=
 =?utf-8?B?QWZ0OFY4YUxLZy9aWnFIU3laTnFEL0FzRXRnSlNFYXFYR2o2NlB2VExKWnBR?=
 =?utf-8?B?MjBLajZhTUJOdjJGbU9KcDNyOXpIV3ozRGt5UDBXcXo3d2RkZjdkcHZ1cTA4?=
 =?utf-8?B?eDVMQVJEcE1Vd3R2MWltZnJtby9VdGp5a0NNM2s3SWp0Zmg1QUREUWZKZHo3?=
 =?utf-8?B?RzM5c0VFYlJsSHJSUDl6eE1SK3o1M1Rnd25KNGFLczQzSkhhUTJUeXpHcXY0?=
 =?utf-8?B?Y3VuY2hoZDFUTkl3U3d0cmMwSmdHZlMvZFBFb0ZxaXhMQWdGRndtTVgzbndH?=
 =?utf-8?B?K1pza2VQUDdRQ3Iva3ZpRHJiUERqOFlMWmlWSjZ1QTY5QU1wenpleHRUczdx?=
 =?utf-8?B?T2ZaTXB5K3RyVWVlSVQ4SENaVGFjOFFBaFdxOC9BN0x4U3Z4YjRDczByVGhy?=
 =?utf-8?B?eU1JVy85VW9UVHhmazZTNnorWDZVWkxHa0ZxcW9yUlNNTnBqVnQzdHVlOVBG?=
 =?utf-8?B?NVlFNGJIVWhUZGllei9VMUYvd3BucEd5MHJLeGVYMXRXQWMrL2V0TjFQQ0o5?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8F0C643475FAF42A0DC4B5A6B74BE16@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e43f90-a13b-4cd2-026b-08db2606f552
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 10:12:33.0196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRjnao8AuflRX1uS+8LNFI+DnNPRXq9g+9Vnn90QQpfrahLAjSaSVCUa06SnQhAjn33gRxTjB5+lJw/3+s0GPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5365
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_031317_286732_CC97E8FC 
X-CRM114-Status: GOOD (  23.89  )
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

T24gV2VkLCAyMDIzLTAzLTE1IGF0IDE2OjA2ICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJu
cyBhbiBpbnQgd2hpY2gNCj4gbWFrZXMNCj4gbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFz
c3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nDQo+IGJ5DQo+IHJldHVybmlu
ZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KQ0K
PiBpZ25vcmVkDQo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtz
LiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUNCj4gaXMgYQ0KPiBxdWVzdCB0byBtYWtlIHRoZSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mDQo+IHRoaXMNCj4g
cXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25ldygpIHdoaWNoIGFs
cmVhZHkNCj4gcmV0dXJucw0KPiB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZlcnQgdGhpcyBk
cml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlDQo+IHJlbW92ZQ0KPiBjYWxs
YmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQo+IC0t
LQ0KPiAgc291bmQvc29jL21lZGlhdGVrL210ODE4OC9tdDgxODgtYWZlLXBjbS5jIHwgNiArKy0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL21lZGlhdGVrL210ODE4OC9tdDgxODgtYWZlLXBj
bS5jDQo+IGIvc291bmQvc29jL21lZGlhdGVrL210ODE4OC9tdDgxODgtYWZlLXBjbS5jDQo+IGlu
ZGV4IGU4ZTg0ZGU4NjU0Mi4uZTVmOTM3M2JlZDU2IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2Mv
bWVkaWF0ZWsvbXQ4MTg4L210ODE4OC1hZmUtcGNtLmMNCj4gKysrIGIvc291bmQvc29jL21lZGlh
dGVrL210ODE4OC9tdDgxODgtYWZlLXBjbS5jDQo+IEBAIC0zMzIzLDExICszMzIzLDkgQEAgc3Rh
dGljIGludCBtdDgxODhfYWZlX3BjbV9kZXZfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IG10ODE4
OF9hZmVfcGNtX2Rldl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0
YXRpYyB2b2lkIG10ODE4OF9hZmVfcGNtX2Rldl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gIHsNCj4gIAlzbmRfc29jX3VucmVnaXN0ZXJfY29tcG9uZW50KCZwZGV2LT5k
ZXYpOw0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG10ODE4OF9hZmVfcGNtX2R0X21hdGNoW10gPSB7DQo+IEBAIC0zMzQ4
LDcgKzMzNDYsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlcg0KPiBtdDgxODhfYWZl
X3BjbV9kcml2ZXIgPSB7DQo+ICAJCSAgIC5wbSA9ICZtdDgxODhfYWZlX3BtX29wcywNCj4gIAl9
LA0KPiAgCS5wcm9iZSA9IG10ODE4OF9hZmVfcGNtX2Rldl9wcm9iZSwNCj4gLQkucmVtb3ZlID0g
bXQ4MTg4X2FmZV9wY21fZGV2X3JlbW92ZSwNCj4gKwkucmVtb3ZlX25ldyA9IG10ODE4OF9hZmVf
cGNtX2Rldl9yZW1vdmUsDQo+ICB9Ow0KPiAgDQoNCkFja2VkLWJ5OiBUcmV2b3IgV3UgPHRyZXZv
ci53dUBtZWRpYXRlay5jb20+DQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG10ODE4OF9hZmVf
cGNtX2RyaXZlcik7DQo=

