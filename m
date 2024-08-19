Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2D6C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppk4/Q+Vahctc7Kdtar/bEDTZavW0wvoQEWjT2LYP2o=; b=jFzZy77KWET3wZMSiqdhSITJHK
	pjt5awWTpYLGJ+VUcnb7su2WpRm/bB3KZoumtyYen8QqCFCQB/+s0PWhondPV9mlJ4cIhoTw5Epbw
	utJGFzMjYuL03nujHuhx0Ic2zQSUgJgbMbyJONxjqkciG/qq4QhljaL1dq026Y1nwefEDYUsz3gBL
	7rOwDf5VlN/3Uy3r5M7mJRhbJRBMSOf/D3QJviqkGAcmStN8FWt2YqrsK2luMq1Y834n8aeRBHQFF
	JobnB6d3N0oHVQflCOsxlOk5M9tL76s1MTwUOlElotSFLPhBqihSlLazknzOpBYdAO/GxVCkl+GL6
	H9nZmjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfzIQ-000000013IN-40aj;
	Mon, 19 Aug 2024 10:07:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfzHk-000000013Bm-1rey;
	Mon, 19 Aug 2024 10:06:49 +0000
X-UUID: bc9d5d825e1211efb3adad29d29602c1-20240819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ppk4/Q+Vahctc7Kdtar/bEDTZavW0wvoQEWjT2LYP2o=;
	b=tL4TS3PlDO74d2zFDc2HiW99dwfdL9pybz8/D3pyC69WEvpQhW2bgUREVUFHdQ1ADbh89ysNcmHaVd52np+dpSEhJlctMk0i/BSLxr8UNvdRkRIOz6ZdI6Vjsz5KxR7DKRkjcehQMS16bSzHhzlPFcaIozDrlsPZr/CVbPugyGk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2c7b80ed-2249-4435-8f23-225cc8d56bcb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a23c95be-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bc9d5d825e1211efb3adad29d29602c1-20240819
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1646270126; Mon, 19 Aug 2024 03:06:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 19 Aug 2024 18:06:40 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 19 Aug 2024 18:06:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cfmy/3rhwWdQpjgH0di7MLJp2QQsV1SCqMUhfadpD52Kg1BjJB37ujmTmZXC6AuTs3roFNVSBa2KqSD7hWbZaObvNHrD3W9Y7MnreX4if2IrC0Ofmd+jYU1WUDEPlss3LeQGuQNcggQvdu5kX4fTQGyVOOdV69Gj+Vb9O7nNN6nkdjyr+Z9rYV9Psoqg+loaFkK6mxQ5iBN5cIU9scKZFm/8ssqoDtwU/OrKC5JW92wV2NDtHO/3Fd4AujEqu+qK8IavRpQNrwgVOTmCFlr6eAH7h3NvHDlSpGo2tuPfdGRc83QJ1vxEc8/QwRPe756gaHKaZMplR7pvCPLv8Yja0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppk4/Q+Vahctc7Kdtar/bEDTZavW0wvoQEWjT2LYP2o=;
 b=t+7EUlePcTNx7V01lGTG4NWUcvpTCUUUAHmPECbAenYLiGOkszKfSwP5IAwOfTYD7rWYYJYYwKxX0KpzPcSVArPQrd+H+dpUCnkLPepABG3gT95CgziboxtCBbJfi7kEA7fY/woRS8SsGh+KAtkbhMPvENzV2CTQ5gQ8HUmtI9qAYnWnA8LB7Ft32Z3ZcHtZqWQQx/kk67RO5y7U69di633i6agwcBbo7klhZHQDVFPmrfH6wLDMhc9nl4nqPO1Kfz9VKKeqVNyKU6TVRcb1bkdQ8Sx6BG3mEYXCo8XbLAqFIWdOmPgwVIYLDEK+OHrBoqid/Bzte2/alMHF32r2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppk4/Q+Vahctc7Kdtar/bEDTZavW0wvoQEWjT2LYP2o=;
 b=UkcDI0kM0vzK9LdvcRSigmiQSki3H5e+1cDzY0uGAhelzQUv/OCTD1bkVCVDOZoI7slRn0CQH3xmCGlsztKU9CrqCV6MLFwFQJPiJvSfr01x9O5ncdGdvppuS9hUUgbI7fA7kn1GziULfw/hFhupIQjqIxpKfP7nB/A7tAu2Xlk=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI2PR03MB6614.apcprd03.prod.outlook.com (2603:1096:4:1e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 10:06:38 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 10:06:38 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Fix missing configuration flags in
 mtk_crtc_ddp_config()
Thread-Topic: [PATCH] drm/mediatek: Fix missing configuration flags in
 mtk_crtc_ddp_config()
Thread-Index: AQHazTRqvcguJzpVYEGN9WuzArW0ZrIpiAoAgAUcgYA=
Date: Mon, 19 Aug 2024 10:06:38 +0000
Message-ID: <4c0867e2a53b70638504438e12fb55651fe4f0d1.camel@mediatek.com>
References: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
	 <CAAOTY__xOVgdF1iEtcbXrmnM40og8XJGZ+-5K02q58XbYY3GGQ@mail.gmail.com>
In-Reply-To: <CAAOTY__xOVgdF1iEtcbXrmnM40og8XJGZ+-5K02q58XbYY3GGQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI2PR03MB6614:EE_
x-ms-office365-filtering-correlation-id: baf7e65c-380f-48a4-d566-08dcc0369d74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UXlLcVhRSUM2a2hvTU9TYlh3eXgzdEdtb2lXUDlPRk1iU2VmSC85OXVmZ0hL?=
 =?utf-8?B?UnIrRW5OTzdOd0thMzhjOGgzTWw2aE5GWXdGWGpXbFU5VlhYeTEvRWhJaDc5?=
 =?utf-8?B?YThkWEl2VlFmRWdTOUpwSDVHYXpBT2I3VjFaSTBwc25OZ0xSaTY2aHlUL21B?=
 =?utf-8?B?MkRiSzNsRlVhUXFMTDY2d3RDdWJsNlhYTWo0OW03V0NQMUVqa2xVTEZDT0d5?=
 =?utf-8?B?VWx4eDNEMEw3ejdYV210bE54bkd1WkNpY0xmTGNodkx4aW9kV1F2ZjRmT1dN?=
 =?utf-8?B?U2R1RmJ4bU1Md3M0cnp0VlQwdjl1T3R3ZnFVbnF6SGcyUlZ6YlZFb0pGSG1w?=
 =?utf-8?B?Q3VGQm9lUEVwVUtzMnB2OVh0Y1htS09LZjQyNHE2UFdHS0RyZEJCRkZMeklh?=
 =?utf-8?B?cGpPdExWTklaUjlHcFpVcElKQUJOMnV4bm52SWlBc3padU00S1Y5SUZ0eVp6?=
 =?utf-8?B?UXB4RnBDemp3clIraHZmbStzaDZ3SVYybWxUVUdGVTM3NEJSSEJ5ZzdjaTdx?=
 =?utf-8?B?VWhjdFEyc0hlU2VTaGJ0dUNucnU1dGpDcDY5VDYxbnZRbXl0bDI0dnJGMGIx?=
 =?utf-8?B?NlAxQzFCelVxMFpsOEZ1YjR0amQvQkV3WmppVEw5aFYvaUNrV2lyR0UwT1Mr?=
 =?utf-8?B?Wm5YeUczSytnSGMwVjVjYThhamZwLzJMWDlpRUVFVXZ6bjNibkdpYURyb1NN?=
 =?utf-8?B?cVBkMzV5SFNxMTd3c2FZSFdqcHdtTU82b2FIdm9mc1pzSWx6T1JuQjFTdXhq?=
 =?utf-8?B?V055dW5wbGJrWUN4UE9ac2o5dHM2bTVkZWN4YlZPaU9UUDkwNmZzZnZNTkxt?=
 =?utf-8?B?a3FpMzJHY09CczFJRU5KeWVDdFJzVms2ZFR5M2lCU1BWT09LYUFoNDlic1Rn?=
 =?utf-8?B?WVZhc0dTc2Qzc3U0M2txZHc1RmhqUE52WWJKc0lxaXpNdStybDU1N1Uvd1Qx?=
 =?utf-8?B?L096aVYzdEZPVGZRbFlERUJtOHpzbFg3WWV4T3l3bWl0OG5zUnRKci8rdGlv?=
 =?utf-8?B?YmVjT29JSFgzWWd2UGYyaW1sZmVPWCtmOWJtK2ZOSkRPOHJrVStNdTl2b1lM?=
 =?utf-8?B?Rk5QUm5SbHRCME1vWE9ZdFpLN3lUQzRCaC9hT3FsZkhuTWlIYkR4QmdCODFp?=
 =?utf-8?B?cUtSa25YMHJHTGpWSXBnN0JaZ3plcCsxdnJWT05iaGJ4MHZKbE5id1kyUGdY?=
 =?utf-8?B?c1NUNWozYStuSjAzSnNpQThhVUdHRjVYcWpRSzUrcjJKMi9ObzZtYVdOVFZD?=
 =?utf-8?B?SzRFdnlvNkxBTVRCcFZtT0xDL1FuNDVGZUxEa3p2dFJjMVBFWGd6a2tBbC9y?=
 =?utf-8?B?ZUk1a09CZEw3UklPY0NMZHdvWlFpaUkySUJuV0hIZFR2YjA3OGdqWWxTU1pE?=
 =?utf-8?B?V1QzbEoyT0I2eXpZUXpiZ01hWUdBRWpHWjZVanRWOE9lQi8zZ2hSQkxnNXRR?=
 =?utf-8?B?dXNaSVJGNW9pTW9mc05vK0lmK3o1YzgvMVdvSkNRTzF5Ri9xT3IycFJYTVN3?=
 =?utf-8?B?YUMrNHNJOHRRd3NyemQwYmZGQUxYSlhzSXhUakJ6ZGFaU0pMaVlHUWx4ZCtv?=
 =?utf-8?B?bEFRL3lNbXBLUVFldTBDZWpwNFdMd2l6NXFib1FaQjdVVzE5K3k0WmlzTk5m?=
 =?utf-8?B?cjN3b29xQ2M1RUhUK0dBVXNpTCtMQXljNm1zclhrMit2YzJnMitKK0t2OVNJ?=
 =?utf-8?B?eXRtQW5ua0hSWEJIeUxLbFpwbEpvaHVWM2ZzSDF6cWpNVW94L3FvTGhMRnVN?=
 =?utf-8?B?LzJyQnpyTktqSytFclU3SnRmS1pFVlZnYnNYK0hxSDRBdmhyQUt4bmx3MkRi?=
 =?utf-8?B?TmhqRTRLTVp2TjVTYm94U0U4NGs5enNGWE4xNlFkNDh0NHArRnd3MTRiOTZ1?=
 =?utf-8?B?RmFXYkl6bVZaOXk2dWJ1N25tcC9mNnlVZUdPNEcxZ0NsQ2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0x5aitycWpNLzJndjA1Y3lBelJhRllULzFCUXl1bURsenVnby9qRFpHU0Ja?=
 =?utf-8?B?cVVuUGx0VzZnc3hYWFlZazJrNlpqVWZ4VUdkVzlwNUFMMDFaZXVDNnl6WTFE?=
 =?utf-8?B?ZDJQTWozSUJwak9EZG9DZit1TlNrRVdOTFR4M3dLakRXdnE4SGxYV0RuWU1s?=
 =?utf-8?B?U0NiS0I5V0JPdlhnOUFHZm9yTnFjMlNUVkRneWhEQ25lWDJrQ1ZwTVhYTG1z?=
 =?utf-8?B?V290ZmJibitQNG5sVmVjMjFIVU9PeUxxd2U5WlAvZ1c5TCt2Vi9lK1ZmK2Jk?=
 =?utf-8?B?ME1jZGhmRnU0aEJEQm5TZjBoanQvaTUrczNSdVRjVFVOaUsyTWV6VSs5Tkls?=
 =?utf-8?B?ZlA0VjB3MmcvblFxU0xpOTZiRWthTmV4UVM5anRkK2hCVnV4MWJQZWdDSGRl?=
 =?utf-8?B?Z29PaiswWHU1QVQvUDQyYndnY1A0cXdjbVkzeHVFN3hRbUZnQ3lJdTV4N21S?=
 =?utf-8?B?M2doWWVsR0lhRHRpejVRWVc0SCs3VmJwSG10ZFhTRWVPSzJMQmFCQzhNN0Zo?=
 =?utf-8?B?Z1oyK1FzdHZhSFZzaHdISklhdmF5SHNYdmhYQ2x2YWRSYW96VXJISUtKaElF?=
 =?utf-8?B?ZFBYc042b01IRnU0SmN0ZkcvUHhSY1Zyb3ZRNUhLSVMzZUdBVWk1OHRlWk8x?=
 =?utf-8?B?WUVqemFaYWpCN1d4NXViVWFwK2tEVXBhSVZpdG1mSllHZy9QYlE2TGhlMkgr?=
 =?utf-8?B?S1FoL2xPNmZiV3hxMkRnUmgvYU04aVV6TmZxbHU3MmsvVi9FRlpQeHFKUUQv?=
 =?utf-8?B?RWVKem1OZGdaeldIVnRWWGZhQzBzeVR6ZE81K2ZSYkN4dEo4WXhrR3R5dEhQ?=
 =?utf-8?B?RmdxVVZzSXBPQzZ4R3VGMDFNVjk3Y3FBRG1HaDY1eGVZWkV4aTJsc3FBcXRG?=
 =?utf-8?B?THNIcXBqUklQMmxLZ0JyMUxJWjRsZ1oyWGdRZGowTjJYbzJGejJHeklxNU1Z?=
 =?utf-8?B?RU9VMUdPM05nL1I4M0owUGY0OEMyQUE5U3BtRnl3Ym42djY1Zng2NmcrNEE5?=
 =?utf-8?B?Zm4wUFVYTkZ1VS9jbnVwWnhEK2NaYWJaa3NrelNpeGtaejNibkNLSThCVVZZ?=
 =?utf-8?B?aGxwQUVvai9pVWRJeGhUNVI1ZDFWWWk5d0dWYXZoVzZqSC9SUTJHZXlHa0Ur?=
 =?utf-8?B?TjNmN3lMa29xK25lVkhPdjZJNEo3U2JmOFphajJHUmlVOGRsVUQ1OENhVE16?=
 =?utf-8?B?Y3F5QWZDZUlLL21vdDg4dlJpdWZxUzE5a2pIZGhDV2wrMjhIbHRDSDFuU1Nr?=
 =?utf-8?B?T2R6eWtWeGhZaWN2bTYwdTl4MXNleUVPNFNRcnR2VGc1T2Y4TDQ5NlNqdHc5?=
 =?utf-8?B?bm1XV1VRL3dMaHN0c3o2Y3lIUUR6dTlNSVVsQnBubHlDTXlydUh4RzN0eXZE?=
 =?utf-8?B?NVRHYW1nMVVHbzBKKzZ3VUNKcGdxRWs4NnJ6cXBWTm9idUNRcnRueVpGTytN?=
 =?utf-8?B?bHBaemFNU1luT29FQ01pQmZLQzFZUURUMHFEYytIOWYzR3BpVHhOdVIxSUt0?=
 =?utf-8?B?Z0V6VVdoWW1ZK0E1bmpzT0luMU1FcmVGVFpxNDZXbGVoTGhHL1h0ZzVxYXNm?=
 =?utf-8?B?U0NVYmJ2TU40U0FQVUdENmMyc0JuNWRycWV4VkpzNDBTWjI5YVBTQTZmamE0?=
 =?utf-8?B?WHNZT2hURWxwTGZTQU9BMXdGR0p0WXA5MHRxN0xyM2pmaW5vMmV6bk1hYUsw?=
 =?utf-8?B?QWN3OW56Y0RKRTVzTGU1M09laFErYk04VHVZb1E5SGd5bXAzMHNxSjBsbDJD?=
 =?utf-8?B?ME5xWTZRbDhsZGI2dktRTTdKdUticzBrVEdwNHlvMXlwOGFHVGRTUkNFdWNH?=
 =?utf-8?B?ZjZVdjA0V3RndkZrTy9TWDVJbkNGTTJYYS9UVURYL0dWTDZoY3BEczBOb3M5?=
 =?utf-8?B?Uy9XMkJHeXlFc0Q0R2I0VldqRTQ0cThNY0VYMzVoU1JGbll5MjhMaHRXSHJP?=
 =?utf-8?B?UWpTZ0JCem5vMCt5RUF1WDZzYll2bHJMMWo1S01SelgrWHAzYkhEVytFQytz?=
 =?utf-8?B?QUNhZ0FPc1l2NE96R1lBZFcvdjVIbitLTG9TSUQrRjczQXZuRWZOYkJaanZu?=
 =?utf-8?B?VVRIaDVrM3dtWlpvOE1rT0Y4a1JZM21OU0pha0QyeEdKTGhqd0hpRGVsRnBn?=
 =?utf-8?B?ZGZmeU5JWjBxSFZhNEJqNXFhY01MUVpPWCtUeXBrczJBLzE4eCtxME8yRUEy?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D4460E6F6680C40833AD89C9F5918F9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf7e65c-380f-48a4-d566-08dcc0369d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 10:06:38.2006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P09Iqwkd1PEtfUxqVgJdvnVzYLqusx2NBA6OXnbNU73fUCYOLY8DVBvy8MWStA7u5G+ONYIrTon0rTg5shPFkpWnxP0HKT1AYFRJUrDKNBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_030648_528353_DDEADECF 
X-CRM114-Status: GOOD (  16.18  )
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

SGkgQ0ssDQoNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+ID4gQEAgLTMx
NCwzMCArMzE0LDMyIEBAIHN0YXRpYyB2b2lkIGRkcF9jbWRxX2NiKHN0cnVjdCBtYm94X2NsaWVu
dA0KPiAqY2wsIHZvaWQgKm1zc2cpDQo+ID4NCj4gPiAgICAgICAgIHN0YXRlID0gdG9fbXRrX2Ny
dGNfc3RhdGUobXRrX2NydGMtPmJhc2Uuc3RhdGUpOw0KPiA+DQo+ID4gLSAgICAgICBzdGF0ZS0+
cGVuZGluZ19jb25maWcgPSBmYWxzZTsNCj4gPiArICAgICAgIGlmICghbXRrX2NydGMtPmNvbmZp
Z191cGRhdGluZykgew0KPiA+ICsgICAgICAgICAgICAgICBzdGF0ZS0+cGVuZGluZ19jb25maWcg
PSBmYWxzZTsNCj4gDQo+IEkgdGhpbmsgaWYgbXRrX2NydGMtPmNvbmZpZ191cGRhdGluZyA9PSB0
cnVlLCB0aGUgd2hvbGUgY2xlYXIgam9iDQo+IGNvdWxkIGJlIHNraXBwZWQuDQo+IEFuZCB1c2Ug
c3Bpbl9sb2NrIHRvIHByb3RlY3QgdGhlIGNsZWFyIGpvYiBpbiBpcnEuDQo+IA0KPiAvKg0KPiBz
cGluX2xvY2soKToNCj4gaWYgKG10a19jcnRjLT5jb25maWdfdXBkYXRpbmcpIHsNCj4gICAgICAg
ICBzcGluX3VubG9jaygpOw0KPiAgICAgICAgIGdvdG8gb3V0Ow0KPiB9DQo+IA0KPiAvKiBjbGVh
ciBqb2IgKi8NCj4gDQo+IHNwaW5fdW5sb2NrKCk7DQo+ICovDQo+IG91dDoNCj4gDQo+IEluIG10
a19jcnRjX2NvbmZpZ191cGRhdGUoKSwgdXNlIHNwaW5fbG9jayB0byBwcm90ZWN0IG10a19jcnRj
LQ0KPiA+Y29uZmlnX3VwZGF0aW5nOg0KPiANCj4gc3Bpbl9sb2NrKCk7DQo+IG10a19jcnRjLT5j
b25maWdfdXBkYXRpbmcgPSB0cnVlOw0KPiBzcGluX3VubG9jaygpOw0KPiAuLi4NCj4gc3Bpbl9s
b2NrKCk7DQo+IG10a19jcnRjLT5jb25maWdfdXBkYXRpbmcgPSBmYWxzZTsNCj4gc3Bpbl91bmxv
Y2soKTsNCj4gDQoNClRoYW5rcyBmb3IgdGhlIHJldmlld3MuDQoNCkkgdGhpbmsgdGhhdCdzIG1v
cmUgc29saWQgdG8gcHJvdGVjdCB0aGUgdXBkYXRpbmcgY29uZmlnIG9mIGNtZCBidWZmZXIuDQoN
Ckkgd2lsbCBhbHNvIGFkZCBzcGluX2xvY2sgZm9yIHRoZSB3aG9sZSBzdGF0ZW1lbnQgaW4NCm10
a19kcm1fZmluaXNoX3BhZ2VfZmxpcCgpIGJlY2F1c2UgY29uZmlnX3VwZGF0aW5nIGZsYWcgaXMg
Y292ZXJlZCB0aGUNCnBlbmRpbmdfbmVlZF92YmxhbmsgZmxhZy4NCg0KUmVnYXJkcywNCkphc29u
LUpILkxpbg0KDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KPiANCj4gPg0KPiA+IC0g
ICAgICAgaWYgKG10a19jcnRjLT5wZW5kaW5nX3BsYW5lcykgew0KPiA+IC0gICAgICAgICAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgbXRrX2NydGMtPmxheWVyX25yOyBpKyspIHsNCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSA9ICZtdGtfY3J0Yy0NCj4g
PnBsYW5lc1tpXTsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX3BsYW5l
X3N0YXRlICpwbGFuZV9zdGF0ZTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKG10a19jcnRjLT5w
ZW5kaW5nX3BsYW5lcykgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7
IGkgPCBtdGtfY3J0Yy0+bGF5ZXJfbnI7IGkrKykgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUgPQ0KPiAmbXRrX2NydGMtPnBsYW5l
c1tpXTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfcGxh
bmVfc3RhdGUNCj4gKnBsYW5lX3N0YXRlOw0KPiA+DQo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtDQo+ID5zdGF0ZSk7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZSA9DQo+IHRvX210
a19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOw0KPiA+DQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcGxhbmVfc3RhdGUtPnBlbmRpbmcuY29uZmlnID0gZmFsc2U7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZS0+cGVuZGluZy5jb25maWcgPQ0KPiBm
YWxzZTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gZmFsc2U7DQo+ID4gICAgICAgICAg
ICAgICAgIH0NCj4gPiAtICAgICAgICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0g
ZmFsc2U7DQo+ID4gLSAgICAgICB9DQo+ID4NCj4gPiAtICAgICAgIGlmIChtdGtfY3J0Yy0+cGVu
ZGluZ19hc3luY19wbGFuZXMpIHsNCj4gPiAtICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8
IG10a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUgPSAmbXRrX2NydGMtDQo+ID5wbGFuZXNbaV07DQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG10a19wbGFuZV9zdGF0ZSAqcGxhbmVfc3Rh
dGU7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChtdGtfY3J0Yy0+cGVuZGluZ19hc3luY19wbGFu
ZXMpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbXRrX2Ny
dGMtPmxheWVyX25yOyBpKyspIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0NCj4gJm10a19jcnRjLT5wbGFuZXNbaV07DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlDQo+
ICpwbGFuZV9zdGF0ZTsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHBsYW5lX3N0
YXRlID0gdG9fbXRrX3BsYW5lX3N0YXRlKHBsYW5lLQ0KPiA+c3RhdGUpOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUgPQ0KPiB0b19tdGtfcGxhbmVfc3Rh
dGUocGxhbmUtPnN0YXRlKTsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHBsYW5l
X3N0YXRlLT5wZW5kaW5nLmFzeW5jX2NvbmZpZyA9IGZhbHNlOw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUtPnBlbmRpbmcuYXN5bmNfY29uZmlnID0NCj4g
ZmFsc2U7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIG10a19jcnRjLT5wZW5kaW5nX2FzeW5jX3BsYW5lcyA9IGZhbHNlOw0KPiA+ICAg
ICAgICAgICAgICAgICB9DQo+ID4gLSAgICAgICAgICAgICAgIG10a19jcnRjLT5wZW5kaW5nX2Fz
eW5jX3BsYW5lcyA9IGZhbHNlOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICBtdGtf
Y3J0Yy0+Y21kcV92YmxhbmtfY250ID0gMDsNCj4gPiAtLQ0KPiA+IDIuMTguMA0KPiA+DQo=

