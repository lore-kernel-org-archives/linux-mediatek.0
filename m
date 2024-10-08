Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14724CED273
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9/CjbP41gcgJbXXMJ4KwAMRIeISleXDwEWc/3iTwks=; b=2divsO+uJD03EjOXsP5MmjPIdE
	tqz0z1cVL/A7J1L9lTSK50fa32kdHmUXYgrdMYLj2R1GkHSieMVheKavBZeL3AjMmJ7A8Emc7NZju
	kH3a+3xkqEYmF9qtdFcNkEZVwPjHm+iKTrt4bPBCMxYSJss7t1DRJ/sWoIwJtgXEvw9TtAsa3qoUw
	HsKbvq5DM6IaTRjOsWWfdQu26vdyHxe6Ib2PpAz7hQdMiDiGp9YWeJAWKEvzPQk0pR8YwZix6yK09
	A5QSPxxtTMaqJQvakI78FAwxyzOt0ybULXFUL85tNyx4Ys90QZvb4g5Cne9Z2NP/UwVhs8xpndOD/
	TsiqOmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4L3-00000004kq4-0R50;
	Tue, 08 Oct 2024 07:08:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4Jf-00000004ki3-1xiI;
	Tue, 08 Oct 2024 07:07:34 +0000
X-UUID: f99641b0854311efb3adad29d29602c1-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=W9/CjbP41gcgJbXXMJ4KwAMRIeISleXDwEWc/3iTwks=;
	b=SXA2x+0Be8P1y2hTMVhafs8aHrzumgl7D4WGVyLicx8+BFe48tu/ZhtkjKyEl8yKJZNa4kaBzTu4m1W8F2KvwKfLGMdlIdA8Ry4XQ2xilCsEkJTXSQjCoKHe0NueYoLZrHv/SufiJAmpRxjsbTIYFVT/YRUkK49uqB30Fhk3OCc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:54c5e08e-ba2a-47e4-ad56-27bbca22ba17,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:a34fea64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f99641b0854311efb3adad29d29602c1-20241008
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1557571515; Tue, 08 Oct 2024 00:07:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 15:07:24 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Oct 2024 15:07:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwYBBbhlSNCRX0mAQcCu9ijOnnClBnHV3o/5bVw/Wx+vzAdlCE3dhg8kkdvjRwL4fU+18boNJ2385Bn3MCfPYWnnForleWD7tzLz9qpab2JKmmM46PElYXDNgkEw47lemOhpOrzEEFMNJZf8ZYDqrVGLeUKGZxZfN1USDc+M0Da1ypgc2l0X7EnAQ6epiFAzqC/fnIz292HEdyR5BNs4Rz9jOV3TZCKgrHPIUOQGtRKCpcG08hwBO3F0p10DKJvA5gwii5t9RR6bTVLMLndQZB1KB6k/Yl+4SaFbROnG5/aF2rRbhiZ71yQnk4gKGoi2x7uxsDY3ilBq3ncaqZpRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9/CjbP41gcgJbXXMJ4KwAMRIeISleXDwEWc/3iTwks=;
 b=xVmo28eU/SpbOppWRfiHam+HLqdwfq6axiDgXvh8vugb4/dx65l/X9wsXGQGhzgvblXI/xfa+QWcszMOg+Frhi4g6MWsI6qa4fguTXcm6Kaco0Ak1BgND+AVsC52lgKjroceclmb2f1/UtWI26/l/51FUEievVaQO/F7NLidJvb3bVuXqASGy15rkZu57AWtZKAbYdUWbYeTX412QAMUwUh9a3w0FPJR+adhv91Lj5VXCfN0IXzRbzxLrD/M/iCAWKLY7riZResvDkelezCFz+LPojp5CjmZakY3c0M0zUBOLmtD08GNd5Djdo220dooamBmDxxIi+phQoeHXCVP2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9/CjbP41gcgJbXXMJ4KwAMRIeISleXDwEWc/3iTwks=;
 b=VIMmHLy3yVUcc5IVcFhZzqP0Qzt2ig9CIAGEY2lrHhEyuyiALfm1ffnNlJmX8uiIzoDlny05O9k09Uup4P+mS3MHJMeySenZPPy/qK0x4xrozcuCOWoIbxbZbsUrdEFgJdKZ0ntuPRp9d3BmLm8OX+gzggQyIEBxJvR5ztaqiqY=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by PUZPR03MB6987.apcprd03.prod.outlook.com (2603:1096:301:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 07:07:21 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 07:07:20 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "wens@kernel.org" <wens@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>, "me@adamthiede.com"
	<me@adamthiede.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v10 0/5] Fix degradation problem of alpha blending series
Thread-Topic: [PATCH v10 0/5] Fix degradation problem of alpha blending series
Thread-Index: AQHbGU3u+xecq+b7rEiLwWPa0B6a77J8asMAgAAEDoA=
Date: Tue, 8 Oct 2024 07:07:20 +0000
Message-ID: <6d5e9a84a3b91c82a8f16965872f7485236cd3f2.camel@mediatek.com>
References: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
	 <CAGb2v67qnJ=ZNYziKe_4WU9KeMUpWLsOn2uoze1FLq4mH8m7Rw@mail.gmail.com>
In-Reply-To: <CAGb2v67qnJ=ZNYziKe_4WU9KeMUpWLsOn2uoze1FLq4mH8m7Rw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|PUZPR03MB6987:EE_
x-ms-office365-filtering-correlation-id: 4534cf32-b40d-4372-5f42-08dce767da18
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SFYzMzYxcGY3OFZyL29pTWc5b25hR2U3Y3VucnJkUzNiQnNuQUdpRXpQME8x?=
 =?utf-8?B?TmtuM2tSSElkeGJZTXV2VW9YSFQ1Um1PakRNbHBJRlhZR0ZSWmdDc256NXRZ?=
 =?utf-8?B?b3pEYU5zU0g4emN0K2N4RVIrV3o4aE13NUJJOGF1UDlZaUsyOG5NeDZpa0xH?=
 =?utf-8?B?VDFrNk9CY2NSR2Yvcjl4ZWQyRkFnZUlDV1RwazRkelZPa3lmUTMrUUJ6K1Rm?=
 =?utf-8?B?UGRHTFh2ZjJIYkdCNmR2Rmw1OU1Rb1BaRjM0aVZhL3BHcHZGWjE5K0JRdHNO?=
 =?utf-8?B?M1BYaTdVRGRyVG5qd05WMUlHRzdudGZNZzlsclI1WUdyTFdvZmRSMENOcEJY?=
 =?utf-8?B?cnV1U0ZTNUFVaFJ5ekpLN2NRdGg1bGMxYWI5QU9DeUYxWFFGN3ZSZ1M1c0Fs?=
 =?utf-8?B?dDU5YWhmU3VkZ3JiUGI4RmZEaGdsYWZvUko0OFAyV295T3JpeU5UK1FFOXhY?=
 =?utf-8?B?RHRTSnhZQXBkNnBDSlU4QlNYK2tIQmo4R3VUSWs1Q25WOEE1Z2FIZk9QQW16?=
 =?utf-8?B?R1FZQjN4a2lrS3Q2Yi9kd3QwMU1ZU3NrUlMxbjRjSlBKV0IwTDRCeGRqMGlL?=
 =?utf-8?B?T3pYNExqMFF0MlFuTFZWdTFucUFSOHRlNDMxQXRGUGY3aW9YV3Y2QmlJcjlF?=
 =?utf-8?B?cXk4clpRbm96Yk5FVVlySXNiUzhJNER4b1pPa3FsOWlhRU5lYjcySXlGUUxn?=
 =?utf-8?B?U25CY1N5cGFxR1ZQU1lWZlVuVlR3eGRna1RidmhYaHFIMmkzTlRkUHJpY0FS?=
 =?utf-8?B?aitjZTFCbjdsWTJubzZackZWWVMvelNKT2NnS1dWZnFQNUlrSUJsdjJ6bS9a?=
 =?utf-8?B?cVN3OUFKT1M2MU0zbC9yN2lOblVZV3ltK3A1K2tLNkFFcloyM1B1b0pCekJB?=
 =?utf-8?B?NURZSDUyKzJJbEZNanhtLzJaazUyS0MxN1c2ekxZU2RLWXlQdDRReloxMXVG?=
 =?utf-8?B?cFcwUnAxcUlWQjJxSmdWbWV1T1JhVDFQY3F2bC9HVzBDTkpDemd5UC9MenBa?=
 =?utf-8?B?MndHcUVEaUN5ODJkczE4REdvaGsrbks0SURGZnJ3ZWZBVnZVcUp2a2ZwS2JF?=
 =?utf-8?B?cTBBRmVYa2t6VTVIQkNuSVBSWjAwbVkzeEFCYUdYcmJFNXE1bkkxQzBVUG5Q?=
 =?utf-8?B?dUNLYUh5eldINU1ZQ1E1V054a24rS2plaXBjSlNtdC9tVWtTdGdWU2x3NTMy?=
 =?utf-8?B?YkRuQ1RpN2l1TlNDa2NRNEE5eHg2UTJtWVlHRnhKODlUbnJHc24zU2xjTXdi?=
 =?utf-8?B?WkVhYnlCcngxTzRpelgyMVdiWjNmanRzWVluVXNGTGo4dlhBRjM3RFgwWW1R?=
 =?utf-8?B?S1E4eGdkQkpNa0RjNXhvWmN3U2lNb05RakkzRFJKQVBlY1lUWUtJYlQ4cmpC?=
 =?utf-8?B?Z2h3Yld1bVl5ZkZLTmJwM1ZLbEgzZUJwV2E3cU0vNS9GSlU5MmpzUXY1eFpv?=
 =?utf-8?B?cEY4dEtqQUZHZHliRlRTdGJ1YkRtcUhoNHQ3bzJuTmFZZHlwSGRGWUtEWVg5?=
 =?utf-8?B?Sm1RdnJEMU1ldFo0VE45N3Q2OXB1YXJ2VFMvY2pZOTVma1ZhUzN2WVdyRnZp?=
 =?utf-8?B?N1hGaTNTSG55bkpyblVpUjNJeVlBOXNrV0tXbHN6aEkyZE4zU1JHanN0VEsv?=
 =?utf-8?B?S05iQWNEUHBKMFdMSDhCNXNJMGhZMDBIcXpNb1luK3h6WStMUUFlSmVTbkhE?=
 =?utf-8?B?Nm9RWWdLL25GenBMS3ZKcm95aktZQjBKYzhwa21rUEphVEN6enVlZXZyY1Zp?=
 =?utf-8?B?ZkVrTUZyMklraDZDMTB1N0JBMnN4Z3dycmxXMXFjZ1lQZmo0RFU1UE04Zmtr?=
 =?utf-8?B?d3dVa3VPVXdDYWVTWnFzQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajQyYWhsRHNCMjIxdjZmVlpHOHpmOEI4UHRscXM4M1FyckZEa1htWFF6RzJ0?=
 =?utf-8?B?dTdTQjU5NGV2WEhJN3cwaHlENTI2WlhXZUlIVllLS3lMcll5K3NBTnNBSmlj?=
 =?utf-8?B?dStGbXZsTjF4YytrOFZNQ2o5OXliS0pCYXBwNE9mZjlKTG1lRVJjMkVKSVJt?=
 =?utf-8?B?VjMwRHlSeUgxUW5YdEFDTmNHTnpQNlBUS2RBemZpNFVFa1ZCaGdySHhzeGgy?=
 =?utf-8?B?UDlHeU9rQXpSMWtFYkRmd0dlQTJJSzdyS2k5NWJGQjVJNVltTmZPWXNXVmhH?=
 =?utf-8?B?RTRZdnNJSkNWK2xGUlNzTGxWVGhGcTRFNzdYUldXZ0RGRUl4b3gzSmpPNG4z?=
 =?utf-8?B?bFFqdWxRRTBkVU5TMEk1bmZzSTNJMHA3RkZJSHFmeE8yZDBjL0ZRNDF5cFJB?=
 =?utf-8?B?eXpBQ1psdDhxUGtTRUtSMFA3YWlxYXhTbXk4Z0p1YWswSEZ1MGRRS1pOQUdr?=
 =?utf-8?B?Mzc5YVY5anJvdGdhaW8zemQ3NG1xVVFsbDdIRVhKcWNyeFpQNTBwdEJJRWk2?=
 =?utf-8?B?eGs1dzRqWmJCTzVxcXVhM2R4T2N0cmltQ3JOeXdiRExYZVh4SVhqQWl5QWQw?=
 =?utf-8?B?OVJwMk50VkdFcE9ieVlLb3ZEdjhOVWZtaWgrVnhzL1dPellWUmJJVkhEQW1I?=
 =?utf-8?B?K2h6UFl2Uk53T2RJcmVleENvN3hZTTJhY3pDTTJZUkJ0aU5KUDJuN1ovSWFN?=
 =?utf-8?B?dGcxdk9RNTNhbHNHcUpPaW9DQ0NYL0tmUkY3WnVrSm82WE5CdTM3Yk84Q1VO?=
 =?utf-8?B?MFd6TkMwZEJtVmhKeHRQdWZZVlpzcmlQT1FiL0ZFRk9ORzYxVHJQdm1pSFJl?=
 =?utf-8?B?eW5SK0lDTEM4djRBTytQZ28wNlUyQ1dWZE5mNFhoQitRalNTTkEvcHlzR0l3?=
 =?utf-8?B?VlYwOXFsTnAreWVFS2RobWZocXNvSm4xMlIzbGVKQUdGa21Tc2xaeTNmaHRn?=
 =?utf-8?B?ZmRkZHFLajQ4UURPK3ZnTkRaV1JoOFViQStGM3VESFliMzVTVjNUN1gvT3Bn?=
 =?utf-8?B?QWMyN0YySjJHK3V1bTN3aGtZM3lzWGtMdE1XcFBjTmpHck1rSksveE90dHhZ?=
 =?utf-8?B?c0NRZHhEZ0NUelRuWXBLVFhGMWRvaTRoRTdOd1ZMSlI5Um90ZldUc3VlbzlY?=
 =?utf-8?B?VXBrU3ZMN0ZBQTZxVm5aU3N4RjZYR0F1bkRJaGI4eFNrZG1KQnEza3F1aXBS?=
 =?utf-8?B?aDFhaktxNjltbHhFdXZ0SWRub1B3Yy8rcWVWeVNPc3dHWWl1TmxTRzc3a1ZR?=
 =?utf-8?B?Sm5UL0tzOWpXRjZrckV5eXZ3U2dpTzV3K2hSWE50STR1WWdITmFnb3ZjaHpv?=
 =?utf-8?B?cDZZcDdqdm5OV2prSGFJMEhSZU80dmFJVEJSNldQa2dvTWZ2b1YvSnRBUEMx?=
 =?utf-8?B?U1VEdTVoZUI0Z0kwb2dzWHV2WEplZmFmUlNMZ0ZFR2VkTk1QR1lidlVMRFVU?=
 =?utf-8?B?dmk3WDQxYllYdzNQRTAyamVMN2FlMDRseThka2R2ZjBBRWx3Y2VaRmVJTDYv?=
 =?utf-8?B?V0ZoTG02YlpHTHJiZ1NmWlUvOUhSazZDMG1iNmhCL2ZGdCswelR0VWRCZFFE?=
 =?utf-8?B?TFhCUXY0aGtzb2NTK0g3d0IrSUJHb3Qrbm82c2d4aUtjdDdLbEdIVFV6bitQ?=
 =?utf-8?B?Q0tSdTB1Smw3WHczMFAzMnluelc5NFl1bElTVHUwOTg1OEl3ME9LeHJaS3o4?=
 =?utf-8?B?WDUrOUM4akpVVDcyYmRaby9kdUloSFNOQkwrd21NTmR4WlZqaStFK0VDTjc3?=
 =?utf-8?B?Um5KbGQza3FOK0YvWWZHWVMwUXdNOHdCTUl0cjZiL0RDanMyQmN3T1VKbnBU?=
 =?utf-8?B?WnZ3WXBPdm1GWnJSQ1dQeXhYaVU1TTRYd0hhbW5uR0ZVSk1PN29Td2tnMFVw?=
 =?utf-8?B?bllHaHhBeGZpN2RJaGJqSko3OC9IVjg3WkhGOEdxU2dTWWRZOC9VRnRtcGpu?=
 =?utf-8?B?RDI4MnE4SzVWb3ROSVJrcHh2UytTcnhidUNZUzZsUXRuME8wWDFmbUZDWlNr?=
 =?utf-8?B?clR2a3dIRzRnNUphUERvMWxoNXBXbzZ3eGZXcWNMSkcvaG9DNmNRTzkwMUZk?=
 =?utf-8?B?TlRlK205OUlvem1kQ1dOQ2tHcityT2owSElTeDhCZS9mOUZkejhVekVMTG90?=
 =?utf-8?B?OUdEWG5GdEpVM29XeDZOeE5IM1hWQWo3eEQ1ZjMxNmVkTHFwR0x1OUxjc21K?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CAAA0ACBE0C374E8935C5C2E62BBC11@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4534cf32-b40d-4372-5f42-08dce767da18
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 07:07:20.5918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NXUoGtRZBI2ci/Q70btRqNkkW3y6X8Z1OGLnGvyBQAoURLBV7Aw9zashFXKjNAsYGuzSwvVuwCBQMGpcafLVh8Jm6NLD79/n8fsvb6SSFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_000731_579251_75E4EB95 
X-CRM114-Status: GOOD (  15.88  )
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

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDE0OjUyICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiAgT24gVHVlLCBPY3QgOCwgMjAyNCBhdCAyOjQ34oCvUE0gSmFzb24tSkgu
TGluIDwNCj4gamFzb24tamgubGluQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBTb21l
IFNvQ3MgZG8gbm90IHN1cHBvcnQgdGhlIGlnbm9yZV9waXhsX2FscGhhIGZsYWcsIHdoaWNoIGJy
ZWFrcw0KPiB0aGUNCj4gPiBYUkdCODg4OCBmb3JtYXQuIFNvbWUgU29DcyBkbyBub3Qgc3VwcG9y
dCBwcmUtbXVsdGlwbGllZCBwaXhlbA0KPiBmb3JtYXRzDQo+ID4gYW5kIGV4dGVuZGluZyBjb25m
aWd1cmF0aW9uIG9mIE9WTCBwcmUtbXVsdGlwbGllZCBjb2xvciBmb3JtYXRzLA0KPiA+IHN1Y2gg
YXMgTVQ4MTczLg0KPiA+DQo+ID4gRml4IHRoZSBTb0MgZGVncmFkYXRpb24gcHJvYmxlbSBieSB0
aGlzIHNyZWllcy4NCj4gDQo+IFRlc3RlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1
bS5vcmc+DQo+IA0KPiA+IC0tLQ0KPiA+DQo+ID4gQ2hhbmdlIGluIHYxMDoNCj4gPiAxLiBGaXgg
dGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBjb21tZW50IGZvciBPVkxfQ09OX0FFTg0KPiANCj4gUGxl
YXNlIGNhcnJ5IHRlc3RlZC1ieSB0YWdzIGZyb20gcGVvcGxlIGZvciBjb3NtZXRpYyBjaGFuZ2Vz
IHN1Y2ggYXMNCj4gdGhpcy4NCj4gDQpPSywgSSdtIHNvcnJ5IGFib3V0IHRoYXQuDQoNCkkgdGhv
dWdodCB0aGUgY292ZXIgbGV0dGVyIHdvbid0IGV4aXN0IHdoZW4gdGhlIHdob2xlIHNlcmllcyBn
byBpbnRvDQp0aGUgTGludXggbWFpbmxpbmUgdHJlZS4NCg0KQnV0IGl0IHN0aWxsIGNhbiBiZSBz
ZWVuIG9uIHRoZSBwYXRjaHdvcmsuDQpTbyBJJ2xsIHJlbWVtYmVyIHRvIGRvIHRoaXMgbmV4dCB0
aW1lLiBUaGFua3MgYWdhaW4hDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg==

