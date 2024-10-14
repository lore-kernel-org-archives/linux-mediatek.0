Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269A2CFC52F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrcAGVXZpqI4mJeADYSH4eEkh3mixj1MudnhP7IXhUU=; b=AvHEnAbQXaruep9+UF0tDudSZW
	IeJ/2GfusbCLhhHchsv+PVaJlaKCsW1boBQU0YQ3CVdqX9qyGhWOswMGeXQpE+iW+MXFUGY7fC41T
	uFP/m1YJb3vfr1bETrwzLEUIq6jy4wA2SuFaOeQXRry9apY8Ey2JyOKSajrxCKRIdeoAyYYCXUZiY
	taJ0PPu96y5B/yM+nFqZkCz7Ar3zzoJLW6vPbrKQ2vcxXntwSVW4wWC5189wTU71foAQiCQLuheXd
	bKFuyW4HD8bvjeiOCbT6fdC+MAn+oqODB9DQjDB9H4CL1A6O957GFDl6lmEdkLGXDSBh0Wd3YIizu
	zRf2ExDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Hfm-00000004aj2-0LuM;
	Mon, 14 Oct 2024 09:47:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0HKx-00000004Vls-1OBa;
	Mon, 14 Oct 2024 09:26:01 +0000
X-UUID: 4ece61528a0e11efb3adad29d29602c1-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SrcAGVXZpqI4mJeADYSH4eEkh3mixj1MudnhP7IXhUU=;
	b=rTtdBraHH0A6u44z35qfLX3AuMZVYqNqqXmLs0kRBT6n/X7B6xJBLlUWCyJN69wzAK05E7iyghKLPq9HGxM14zKxZLfTiazytQnVudhIi434J+eHr0Nt69RB68PvPKoXWZyJgxXmJS96ypFpY1OxJ5fFNE5V4GdejMK079n32Go=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:363b8ed4-1339-4b4e-bc61-84a44effe225,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8d843841-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4ece61528a0e11efb3adad29d29602c1-20241014
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1409374676; Mon, 14 Oct 2024 02:25:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 02:25:50 -0700
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 17:25:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PETsJghtKY00aMJyF5MSzP8Nk9QWJj4LnKcUfznTIIeWBgk96KlmgPlgRxyEDMgGS/LCOKHVHZX0r3uVFapjn81NkBqNCYs/HHlGEn68ctg4vgmNw47WDc6dnRpfTTfjBQdvffQ7xP9iOvvzqIIxRoE0BPtSggdSeokdD+sHGhsGsfsO3xOP+CENlVbB/hkOdsWZucqERHx90556ixUbXGKXe1YMHdFRjQt2JCUWGocRTFQGxbSdOlypnzcmzzAzGeYUFKWkQ/3zdVW2ut2k0oJxd5AUA8kxUgPpag2OehAPEA22x8DBoXU4RgvqduLeYLApouPkcKaOkyXSGou5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrcAGVXZpqI4mJeADYSH4eEkh3mixj1MudnhP7IXhUU=;
 b=hCF0ntgrRwVWgvekYAP1akWWIV8nF8lLw4+2xoAc6DVf98V0Raz8em7j4ek5ramvAtrdxh44dORrsyHk36z0YtGA0ELZtUt/HBuBTYk5dE4VngmPLjzKiPmdVaMx9eNEEbavAPbqwkrQhogK5pFqVvZx+9AWSR4YypoaXnjxgCPoysjOC7ZjRuEz0rtEFfEqTn5y4z3eOjBOGmSeV+NNii2eACKbA+VeuDsofl8j65czrVQ/2eNmestyyrPCbN39DlJMJAuLjePXzD75VREAXeMo/u6hMIhHAKDnkz0mF1Yniqi2mHcZpLS+93pITzlidf3C9FI4lCA0Z/3epKtYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrcAGVXZpqI4mJeADYSH4eEkh3mixj1MudnhP7IXhUU=;
 b=LxDS0K0p5ud+7z/mQ3SILz2f9bsUHckkbeiJ5VaV9RLml7onFWDLsWrg51JuZRlxq3l8F/3Evj5p49CWVQXA0z/i9MolmXiWzCspNCM73ClWgwyAb48kvJ3g6UdYVq5bY94tP04LsFVDgHMwc5gUfr/YTcbTB+4XtiK3sKvpTqM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7908.apcprd03.prod.outlook.com (2603:1096:990:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 09:25:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:25:47 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Topic: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLKGAZ2A
Date: Mon, 14 Oct 2024 09:25:47 +0000
Message-ID: <42224ac92b95b3fec2c7df429d3f1016b67b38a3.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7908:EE_
x-ms-office365-filtering-correlation-id: a73d1e4c-39db-4296-8c6a-08dcec322f8e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V20rY09uQVRlM3MrbEQ0d0s0MncxK3FFeW92eHM5NUVuODR1OFY0bVVwMzB0?=
 =?utf-8?B?aVIzblpWUDN5ZmZMVU1TY0ZYcUNRQ2c1YWMzeDJvR2VWQkk4NmVhcjZGOUhv?=
 =?utf-8?B?Vmp6UXFkY1NnQnZ1ejBUdzFLeEllUzFDQ0lNSXZMWkxzNXE4bFdXRWsvL3pJ?=
 =?utf-8?B?dmpLZ05SR1VlK0lDZlZHY3NBd3BNNXdnQ1RrMnQ3cnBycndhMlhXSEFHWmh2?=
 =?utf-8?B?eXBYL0ZLaFJWSkI0SFZvMnRJbTY4SFNVbXlOdUs3eHZrdGZhSUg1ZVdaenFK?=
 =?utf-8?B?OE5NdFAybVdSYzdueldVNksyTGIwdTY0T1B6NkF6VWpBMlVudUNFdFRGMmxq?=
 =?utf-8?B?WlpGSG9aWjQ1VVBNaFMrV3lRUFBzL2hDd2FkKzBUbmNtV2ErdHFBTmlQWE5F?=
 =?utf-8?B?OWF2MzJJenQ2RVUycW1CMTV2VU9uSk9aMFAxbnEyb2ZEU2krT3l1dCthY05K?=
 =?utf-8?B?ZU50Mkp2OHBWN3pxY2tJM0FkVWhyaExnUEFGYzJCbzBTSlk5bUQ3a1ZjdnBj?=
 =?utf-8?B?MGM5WG9Db0JuQmlCSE54UjlUbzliSXZSeHBsNm1KU3VRQnFRYWM2OTR0d1Zj?=
 =?utf-8?B?ZVhxM21jOXIzaEJwOWljUzFCS0tSYlZKSTFTQktVU0V3NHNtU1hqT3cxNk5Q?=
 =?utf-8?B?WUd0TVJleE1NZGx5am1DVXUwbFNhaEVqOXV6a2FYVFNCcjJYMkcyQlFSWktD?=
 =?utf-8?B?alhHZnpDdTl4NUtNVTk4UkZvUFR2dUFsZnE3TjBNL2hIVkYxVytDMWd6YnZ3?=
 =?utf-8?B?b2lTWUE4VHJySFhrZkxieTN3cFlwbGFtL1YrRGhGZ2c4TTlnbFZlclBURms5?=
 =?utf-8?B?d1ExcmdzakFjVjhMbVhudzJsSisyQ1ZGMitXU2FRTjZ4enBBY2NBTWFNTHJo?=
 =?utf-8?B?RTNkTkdpdHNkYUdSdklRK1I0VDF1M0x5TzNEaGVTOU9RVnp4WUt6ekJzTGhT?=
 =?utf-8?B?UXJQOWdJUnpWQ1IzNFVLR1lONXhOa2JpbzlSMXhqV3dPRVpKbHQ2MHpLemdV?=
 =?utf-8?B?Y2FrT3BuSVAvWmtiWWpyUW1BSURGekJFVDRhc3pFY2FqMGZyL2pia1doUWh4?=
 =?utf-8?B?V0VaT3hIV1Q1TGE1K012MFdickdYTzJNRnhiUlFpMjlvRjlnVVBFbnY5dHNz?=
 =?utf-8?B?SG1XTjhNdTJ5ZXJLSkw0SXo4M3ByVGM4bldFTWtVeWlzU2p6a0dMRUdKN0xS?=
 =?utf-8?B?YTRmbFZUbzA3RnlKVkdmcHpjek1OWjFzaTNiMEhLTlozUnVEUkU0Sm9WbFd2?=
 =?utf-8?B?cmtRK3FyZGp5RU42dmJ3b2tPaXU4K2FHOVlFemRlajBYTUw3cmJEanBtbi9s?=
 =?utf-8?B?alJQOVlXYXlydlh2SjkzVklrZzVqdnlGaVNJV3Y5UURaVW5OZW9zWHF3Nk5i?=
 =?utf-8?B?KzdXTjh3ZGtNRnM0dUE4R1puK0Y2K0FsN3VNN2t5ZzQwQ0JiajlSS29yNVVU?=
 =?utf-8?B?cWZidWhDMVhhV3NrbjgrSGI5REJsbDZaMmg0MGkwL0hVWnJlOUZ3RXZCVVBI?=
 =?utf-8?B?SWZOalhzVXRJT1VWT3lCeWZ3MmlOTkg1cVdlcWp1dTk1UnhNcFNpYWFVRjFh?=
 =?utf-8?B?NCtZYzBrYmVtUmlQVUQvNksyS1JTTTEyOWRzMzlvWS9jai9GeDVEYmh6dVdl?=
 =?utf-8?B?dy9EN1B6Q0UzTTFkQVdNRFUvcnJoY3I0c2NyaTRoWG1ld00ybkdIeXljRDBu?=
 =?utf-8?B?UmlpNFpxaHhBbzdQMFlSRW81Sk9QVGdDTHNwYk5qR3VIZ1l5VTNQQ1RLWFRu?=
 =?utf-8?B?bmYxRHBnM0V6bXZvSkxZZDRnR2xYODNJMUJSV3EvdmdJWitKZXY5cXZRWUFK?=
 =?utf-8?B?b3JzdXNTN3RiZmlHSnorUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUJTanZNaEdRelF0YVNUOW9KaU9idTY2cmZCbnZwTDlRbUY3QnMrK1Nxd0lR?=
 =?utf-8?B?bzVzcW1hMDRtRlRQYStXK3I4OHZsWkV0RGpRRUFRWmpFVHRuWEJIMWo5ZWpZ?=
 =?utf-8?B?bzVoRTk1akEvVkZyQVphTXBKZmRabnFMTERmTTA5aytSN0dxdzkrK0ZBM3By?=
 =?utf-8?B?TzhCTUthMlY3emtRTDByL0QzNVg3am4rV2l5QlJnZ1JJUC9hekZvY1VxbXV0?=
 =?utf-8?B?Y3Y2RFk1Z21ZTUFzQU0yRnByZnBBQ1RsWGNzMklyQk5xVWZhMkxaRzlNUWNC?=
 =?utf-8?B?MUVsQWlIN0M1Q1VERG5reEhhdUlOKzJEVm52YlpmRTk3Z0JQTnFNNlF1VFFZ?=
 =?utf-8?B?ZHZvdjNDbEd0ZWtEZittVUlVeDVGdC9CSzNCTnorREY5RUFEbHVBYU1weHNy?=
 =?utf-8?B?Q2JJLzN0N0R4TkRGM3FQSTJ6V1BiR0xrN3NFYmkySTdwVGVaeGV6MzBsc0Uw?=
 =?utf-8?B?SWZGK3dyeWVUdUNxREcxRHRFLzZWcVFtVHVwd2h5Wk9pS1VZWU5JUms0NVJy?=
 =?utf-8?B?SnVwNXdCbG0zc0t4Q3BFMDM2RURrckJDeXY3bm9aT3dCdjlQM1JXSDdNN1h3?=
 =?utf-8?B?dkY0SUxPc1VKR1hzQ1lXQXNKTk5qSWV2b21PbGVRWjJtbG01TnNDQmdrS2dQ?=
 =?utf-8?B?TXoxUHJGTEVTNm5KbVlwZGIrZEE0R05FSC9oMVRLMVJQdHgvdXdxbFJJWFM5?=
 =?utf-8?B?TUFrdWRRYXJ3L2xNTTQ2K1QrU1orYW1Zd0JacHNrV2YyVzRHQlRJNGdMRzEv?=
 =?utf-8?B?elhadmxtZGZNdVdrSVRvWXJiN016bXJHWTEyUlhod0ZhRE5XLzVEanErU2RU?=
 =?utf-8?B?Z1Ftd2hyOFpqWFJIbHlOQnpSblRrbW1oWmJJcDZKMnIvUFVSbFBlTEFnbHJu?=
 =?utf-8?B?V3RZK0o4ZDJIM2pINkYyTXI3MlZPYktQQnFzTGcxNmdGcEZJNm1Gc042VVhs?=
 =?utf-8?B?cGxJTHdHQUxZOFJtbG0rYTFZZnJXak4vc2dGVHpvVkEvWCs4cUpJTCtPUEpk?=
 =?utf-8?B?M1pMeVBSR2d2WndMN2VoLzBQTVlvS0lmWWhYbFJBZ240ajFPbjhxSGdoRnpr?=
 =?utf-8?B?dnNYTk80QnZXUTZHbjJrSGZXSC9WR01qTUZtSndFQncyZWYwVVFmcjVjRWsw?=
 =?utf-8?B?VS9JZWhBdE44YmwrWWpydFdCN0FiaUxwUk5FNnhKUnhGM3B2V3dWZmhIaE5T?=
 =?utf-8?B?QmxkbU5INGdmbUJyOUlnTElKVjRlSWIzK1I3aXBzOThGZmFLTVNiQkRmR1J3?=
 =?utf-8?B?RnZBTHRjY2pzSjduNk1IT25yYk40VUZ5VjBLRmRYL0tPSTJscUdqdXdueHJO?=
 =?utf-8?B?T1owNTFTNkJuVFc4R0I1Q3NoZ1VWSnYwTkwrZEdRMHRRaTU5dmt6WkkxMlBn?=
 =?utf-8?B?RFVoUUY2akNyd1hBWXRkVGhsdmp4MzBhOGNFcEhOUEJ3Q3BoR1RtZkJ4OGVi?=
 =?utf-8?B?T2dXZjd0MWV2cFJqaGt1QWk5U0NDdFA3NG5jUFBKdnZ1YWNzZnIwOUJXa2w3?=
 =?utf-8?B?NDNLNzdrMkhoWUlJVTJka0NuSnU3WDRYZVlMdHJ2WXhhUDFOM1hFM01vcWVt?=
 =?utf-8?B?NExGUk91eUZSTlZSMEJzVXpTRHRUVTFFK0tMMEhTMzdFMWRjdmxvdy9td0g2?=
 =?utf-8?B?bTdONEROdDNZT2JGOVVhc0ZveU4wSmJxMG90amdNVWs1azdVRUJqbi9UZDlR?=
 =?utf-8?B?blByUUlCWTNMYllIbWFHSzd0cFN3RkhFeXpjYzNLTm1vejdDK29rTXVnQ1hM?=
 =?utf-8?B?amlPOHpNeWJpWkFkM2Q2WDc0VmlPb1R4T3lkMzl0M3o2RG5ZOVE2MmliWEdI?=
 =?utf-8?B?Nkh4SkpCSjE4SVN6OXNLNStENHNyOVpuczVuZTNtRzR5dEx2RExXaUF4Nmlv?=
 =?utf-8?B?MFhvWFdFd0RhbVdwdjZNNUhMc21USmtpRGZBdW1oMHI3M0tsR0ZxQWRLU1Nu?=
 =?utf-8?B?a2p4TG9uWjBESlVzS0NIV3V1cHE3NC9wRWh0dVc1aG55ZUdPMkQvU0ZBaGFy?=
 =?utf-8?B?YXFsaUNFN0dnbVRRdlVEaEdhTHAvMkJ6KzY1Y0RmdlFCcDN2WU9aR2w1ZG1Q?=
 =?utf-8?B?dVdUaXA4TmE4YmxMMUNYRk40cVNzNVNRQ245RTFndWJzT2J3ZTFkRFhZZkJY?=
 =?utf-8?Q?vaZwTH6Np1Jp1nHaSddYyfzYl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6022AAFAB36CD4B8233E20C9A55AC29@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73d1e4c-39db-4296-8c6a-08dcec322f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 09:25:47.0130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2daBHXKYN2QVFqnhb7cD+VzRxd3sePpfHGBRT5zkCt6hNYgi3MkLVbqJ1KIt9deRYlE7nxtcCHcAZk/lQ9GRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7908
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_022559_462898_5927373D 
X-CRM114-Status: GOOD (  15.63  )
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

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gK3N0YXRpYyBpbnQgc2V0X3Rlc3RfbW9kZWwoc3RydWN0IHNlbmlu
Zl9jdHggKmN0eCwgY2hhciBlbmFibGUpDQo+ICt7DQoNCldpdGhvdXQgdGVzdCBjb2RlLCB0aGlz
IGRyaXZlciBzdGlsbCB3b3JrLCBzbyB0ZXN0IGNvZGUgaXMgYWR2YW5jZWQgZnVuY3Rpb24uDQpT
ZXBhcmF0ZSB0ZXN0IGNvZGUgdG8gYSB0ZXN0IHBhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAr
CXN0cnVjdCBzZW5pbmZfdmMgKnZjW10gPSB7IE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwg
fTsNCj4gKwlpbnQgaSA9IDAsIHJldCA9IDAsIHZjX3VzZWQgPSAwOw0KPiArCXN0cnVjdCBzZW5p
bmZfbXV4ICptdXg7DQo+ICsJaW50IHByZWZfaWR4W10gPSB7IDAsIDEsIDIsIDMsIDQgfTsNCj4g
Kw0KPiArCWlmIChjdHgtPmlzX3Rlc3RfbW9kZWwgPT0gMSkgew0KPiArCQl2Y1t2Y191c2VkKytd
ID0gbXRrX2NhbV9zZW5pbmZfZ2V0X3ZjX2J5X3BhZChjdHgsIFBBRF9TUkNfUkFXMCk7DQo+ICsJ
fSBlbHNlIGlmIChjdHgtPmlzX3Rlc3RfbW9kZWwgPT0gMikgew0KPiArCQl2Y1t2Y191c2VkKytd
ID0gbXRrX2NhbV9zZW5pbmZfZ2V0X3ZjX2J5X3BhZChjdHgsIFBBRF9TUkNfUkFXMCk7DQo+ICsJ
CXZjW3ZjX3VzZWQrK10gPSBtdGtfY2FtX3NlbmluZl9nZXRfdmNfYnlfcGFkKGN0eCwgUEFEX1NS
Q19SQVcxKTsNCj4gKwkJdmNbdmNfdXNlZCsrXSA9IG10a19jYW1fc2VuaW5mX2dldF92Y19ieV9w
YWQoY3R4LCBQQURfU1JDX1JBVzIpOw0KPiArCX0gZWxzZSBpZiAoY3R4LT5pc190ZXN0X21vZGVs
ID09IDMpIHsNCj4gKwkJdmNbdmNfdXNlZCsrXSA9IG10a19jYW1fc2VuaW5mX2dldF92Y19ieV9w
YWQoY3R4LCBQQURfU1JDX1JBVzApOw0KPiArCQl2Y1t2Y191c2VkKytdID0gbXRrX2NhbV9zZW5p
bmZfZ2V0X3ZjX2J5X3BhZChjdHgsIFBBRF9TUkNfUERBRjApOw0KPiArCX0gZWxzZSB7DQo+ICsJ
CWRldl9pbmZvKGN0eC0+ZGV2LCAidGVzdG1vZGVsJWQgaW52YWxpZFxuIiwgY3R4LT5pc190ZXN0
X21vZGVsKTsNCj4gKwkJcmV0dXJuIC0xOw0KPiArCX0NCj4gKw0KPiArCWZvciAoOyBpIDwgdmNf
dXNlZDsgKytpKSB7DQo+ICsJCWlmICghdmNbaV0pIHsNCj4gKwkJCWRldl9pbmZvKGN0eC0+ZGV2
LCAidmMgbm90IGZvdW5kXG4iKTsNCj4gKwkJCXJldHVybiAtMTsNCj4gKwkJfQ0KPiArCX0NCj4g
Kw0KPiArCWlmIChlbmFibGUpIHsNCj4gKwkJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dl
dChjdHgtPmRldik7DQo+ICsJCWlmIChyZXQgPCAwKSB7DQo+ICsJCQlkZXZfaW5mbyhjdHgtPmRl
diwgImZhaWxlZCBhdCBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0XG4iKTsNCj4gKwkJCXJldHVy
biByZXQ7DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoY3R4LT5jb3JlLT5jbGtbQ0xLX1RPUF9DQU1U
TV0pDQo+ICsJCQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoY3R4LT5jb3JlLT5jbGtbQ0xLX1RP
UF9DQU1UTV0pOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQlm
b3IgKGkgPSAwOyBpIDwgdmNfdXNlZDsgKytpKSB7DQo+ICsJCQltdXggPSBtdGtfY2FtX3Nlbmlu
Zl9tdXhfZ2V0X3ByZWYoY3R4LA0KPiArCQkJCQkJCSAgcHJlZl9pZHgsDQo+ICsJCQkJCQkJICBB
UlJBWV9TSVpFKHByZWZfaWR4KSk7DQo+ICsJCQlpZiAoIW11eCkNCj4gKwkJCQlyZXR1cm4gLUVC
VVNZOw0KPiArCQkJdmNbaV0tPm11eCA9IG11eC0+aWR4Ow0KPiArCQkJdmNbaV0tPmNhbSA9IGN0
eC0+cGFkMmNhbVt2Y1tpXS0+b3V0X3BhZF07DQo+ICsJCQl2Y1tpXS0+ZW5hYmxlID0gMTsNCj4g
Kw0KPiArCQkJZGV2X2luZm8oY3R4LT5kZXYsDQo+ICsJCQkJICJ0ZXN0IG1vZGUgbXV4ICVkLCBj
YW0gJWQsIHBpeGVsIG1vZGUgJWRcbiIsDQo+ICsJCQkJIHZjW2ldLT5tdXgsIHZjW2ldLT5jYW0s
IHZjW2ldLT5waXhlbF9tb2RlKTsNCj4gKw0KPiArCQkJbXRrX2NhbV9zZW5pbmZfc2V0X3Rlc3Rf
bW9kZWwoY3R4LCB2Y1tpXS0+bXV4LA0KPiArCQkJCQkJICAgICAgdmNbaV0tPmNhbSwNCj4gKwkJ
CQkJCSAgICAgIHZjW2ldLT5waXhlbF9tb2RlKTsNCj4gKw0KPiArCQkJaWYgKHZjW2ldLT5vdXRf
cGFkID09IFBBRF9TUkNfUERBRjApDQo+ICsJCQkJbWRlbGF5KDQwKTsNCj4gKwkJCWVsc2UNCj4g
KwkJCQl1c2xlZXBfcmFuZ2UoNDAsIDYwKTsNCj4gKwkJfQ0KPiArCX0gZWxzZSB7DQo+ICsJCW10
a19jYW1fc2VuaW5mX3NldF9pZGxlKGN0eCk7DQo+ICsJCW10a19jYW1fc2VuaW5mX3JlbGVhc2Vf
bXV4KGN0eCk7DQo+ICsNCj4gKwkJaWYgKGN0eC0+Y29yZS0+Y2xrW0NMS19UT1BfQ0FNVE1dKQ0K
PiArCQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGN0eC0+Y29yZS0+Y2xrW0NMS19UT1BfQ0FNVE1d
KTsNCj4gKw0KPiArCQlwbV9ydW50aW1lX3B1dF9zeW5jKGN0eC0+ZGV2KTsNCj4gKwl9DQo+ICsN
Cj4gKwljdHgtPnN0cmVhbWluZyA9IGVuYWJsZTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0K
PiArDQoNCg==

