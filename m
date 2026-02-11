Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F319DE81BD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJwZow5SZ9j6vekVDOYTNlOYtuuaVHBpUP5n5WbCkTs=; b=HC4s9ALZg1S2z+T+dtzY+qa1iS
	J6r/vvA4U5xLWn14ad0LQDjpRpxLI0bkCGtZDEYfr4FAZZ3cWjQXWpk0lRdndbCrqnB75N+jtiRzR
	2uzhTLQ0IbMRKiw/TyFr6ICFxvpWQqOff35FA9SxIha6tbjmqgaS+85s5TFRZpw39TlF1eHNOS+c6
	mJaVDrFDAmjJABBoPpATE4uYVLj1Xo2g2RGEqcKwjbKpc5xEm54AIIvMbNcbMvol01yLzTJO8mEj0
	k2e2FyA7SMiPTTyCEAR9VRvcwQRQniQD//QEXOM9KjMMy92u3TweoifRT1ABr8lERn+CqgT0E+BNS
	0IDEc65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6dF-00000000RkQ-2YSU;
	Wed, 11 Feb 2026 09:35:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6dC-00000000RjM-2lZR
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 09:35:35 +0000
X-UUID: 015f18ba072d11f1ad39f32c34db0b1c-20260211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PJwZow5SZ9j6vekVDOYTNlOYtuuaVHBpUP5n5WbCkTs=;
	b=WxmjleSf8cGe/cBRw5xEI0KpYdpF9usW9jF5tbxmo4SfZFhS25SP+OacIoR6GzZyo+zpmv7HuBPvbuxgSJOeY+mwh8vp0l8NMnKMarWAb9sHskwBMS4Wn1f8KstFd4mjj00uwOmNu7IIjaHoN+d8QqPIuTvpxg/HwK86tyRVY+Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:de4512b1-a66d-45c7-984f-45ed2c0a02ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:d712d77a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 015f18ba072d11f1ad39f32c34db0b1c-20260211
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 39682677; Wed, 11 Feb 2026 02:35:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Feb 2026 17:35:27 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Feb 2026 17:35:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObUbhwRG8sEWnC2ZUUAtuHk9fml3WxBrqPhRqf4pAtjPM0IGsTQ6V8ZVuROlRFfeTWy0X/TlhcfpmQ28s8q2zwi/8T6EPGCJyMOSpKx65189CKruL2kfOPesAjjlC99W8xIjxPkQQP4qaTWbPLHfCt/u+Ng0Zo6kW3Ku+2KvSSUGnHhvkd21GvNcBHzv0ixNBrcrEskBrtJYDwyNvYWYS9+hREk+PSmq/LIyGhKbIlt9/sCXVHLDlM/iz/wmHxGKYLgT/4Y1qTaqo7g5glu5ROL/hWsEKbMq042JyY6QNHWYupFNmX9QdQjGLNKo/DmfCip5LNQuwByPNiUR6+X6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJwZow5SZ9j6vekVDOYTNlOYtuuaVHBpUP5n5WbCkTs=;
 b=P04eG39MCIxzirqVpaVA8bmZxS77hx0Lccq5qH0cGGAXkASkEA9zjaMtqGjBnZQ86INz5qtbXYkhudhM3WnTZLAS8F6iXKW4obgXgEF2hPpv8E6gqUnR4vBtyqSbl4KtxeLMzf1F/jhZAzk5fWBcZfDr2hFpG5SIQm0b6+0SjnH9owWnPx4kMS/ye4FaXygL771bibxx/xe5HJH5PbEYvkVx9N6ocwcn7H1xv1jyMe1JIc8o6XautKeUaH9KrOj7mrp6sbo1SnUou8SvJyCzlmQfEuDZhSDLbL7PdCpxyPCGiYTi/4rrORzcHnJD75UWqwLkYXoksSQSruNEYlRGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJwZow5SZ9j6vekVDOYTNlOYtuuaVHBpUP5n5WbCkTs=;
 b=QktMdR8jCFecw/8hfg8TjR30YLCP6XQtvXsk9Y7ZfSyhZXA/9xauNBF+EoXfy5Rf3NRwKnz6kXBVLfux7U/YTlB626luB7OYh+D38da0dpAjMnIecnFsiHuPjVckH6eHUgvhW3fKtMi9Z2UETocLhBJht2T/1zgjcOD1aTNjzmo=
Received: from TY0PR03MB6354.apcprd03.prod.outlook.com (2603:1096:400:14a::9)
 by TYUPR03MB7140.apcprd03.prod.outlook.com (2603:1096:400:347::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 09:35:25 +0000
Received: from TY0PR03MB6354.apcprd03.prod.outlook.com
 ([fe80::f429:d36c:b36b:a059]) by TY0PR03MB6354.apcprd03.prod.outlook.com
 ([fe80::f429:d36c:b36b:a059%3]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 09:35:24 +0000
From: Ryder Lee <Ryder.Lee@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "nbd@nbd.name" <nbd@nbd.name>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?QWxsZW4gWWUgKOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: wireless: mt76: clarify backoff
 limit format
Thread-Topic: [PATCH v3 2/2] dt-bindings: net: wireless: mt76: clarify backoff
 limit format
Thread-Index: AQHcmrhfdLixNmzm402cr6hZjqmOB7V9Cq4AgAAcbICAAAELgIAABKcAgAACKQCAAAUHAIAAAmwAgAADGgCAAASKgA==
Date: Wed, 11 Feb 2026 09:35:24 +0000
Message-ID: <8572882240ba94be8184ce93ee0eec7ffe3615db.camel@mediatek.com>
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1770746444.git.ryder.lee@mediatek.com>
	 <69521aebefef405bad5117d4d5d5fef4a5dfb7e8.1770746444.git.ryder.lee@mediatek.com>
	 <20260211-miniature-chital-of-plenty-1a71df@quoll>
	 <bd4da0a8522db2991ec0844233efe068323c2578.camel@mediatek.com>
	 <b00c8c18-930b-4cb9-975d-b15118bfc854@kernel.org>
	 <0dceffe2e1344830c12bc1f6516d13c7bb488b99.camel@mediatek.com>
	 <23561f00-9f3f-4d4d-81ae-aab9958bd797@kernel.org>
	 <0572bd6e56ca872e285729ccd4c2201517b66e18.camel@mediatek.com>
	 <388e874d-d9ff-43f2-b010-ca7ac29aa065@kernel.org>
	 <0c7b854e342e2047fbc9fc8e8fd80b67a6ec2bec.camel@mediatek.com>
In-Reply-To: <0c7b854e342e2047fbc9fc8e8fd80b67a6ec2bec.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6354:EE_|TYUPR03MB7140:EE_
x-ms-office365-filtering-correlation-id: 057b8461-0e77-4c9b-93bd-08de6950e258
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aHBGUUxzV0Y5b2p1NFVwcHBwYUZaUFpROHhpekFMR2NKTmVlY2JQUWpLYjJ5?=
 =?utf-8?B?V3I0Wm5NcmZFdzRXejg3WnQ3LzhxcE02SERXSFVrRkg4Y2VzdkN4RGZhb2FE?=
 =?utf-8?B?V2Q2clBuaC94ZGxnRTZNSmdYVXMzdE1FVnc0a0pydzlvUmxyclkwRlo3cHRz?=
 =?utf-8?B?ZitUYzZ4aXdodU41U0FURWdQSDJVT0VETnBlVEg0cDdFdXBHZjM5Z3dDbGhS?=
 =?utf-8?B?bUFiUjBieVVQMW9ibnorcHE4ZU1WSldpa2Y5VHowNWRiemYvSEFUZWJLYXJy?=
 =?utf-8?B?VVNHZkNBVXVPNjZCekNJeThnK1pRUGpScGdVeDZRZ0VZdEt2ZmVSRnFybCtV?=
 =?utf-8?B?UmY4WXgwV3hwSml4VnFvcVU0cjNnekZTdUc4VExrU1hDaDNaN0F0QXU3cVB5?=
 =?utf-8?B?bk5hL0hrRWxDVTBwTmhCMHdmSUZkV09JeVpveWtZVmVoM0JwNjE4clhyLzlS?=
 =?utf-8?B?SFU5SUc0cVZsN0tNeDVHUTNsT1hjN28xaHlWbCtmcjBpK3N1VVVqTC96dGpl?=
 =?utf-8?B?UWJudFAxdXBiSVkwVnIxc2tQM3NCSUFRWm5ic3UvbTE2UHBIVVJJMnZlSC93?=
 =?utf-8?B?SzQ4SkIrUXV3ZXpoZUxUb2s3K1ZBWFpjQ3ZPKzhWUWlmSk5jZG5WM0dmeUdM?=
 =?utf-8?B?bUxabFhDS29LaWsxTllieHZ4ZU5aNTJ1b0NsMVpKK3hoUnl2K081K3dQL1h6?=
 =?utf-8?B?NlRMMC9mMlJNVWQ4UGZKeHFDcVB1bEZaaTdpY05PVUZYemNWenVwa0hXbTJD?=
 =?utf-8?B?R3A3SVJtVGpFV3hsSW82WFpaTC95RTJLRi9XeG82TnFlMjg2M3pST3VlL1Z0?=
 =?utf-8?B?RW9nR05LWS9wbDk5T2tnZXlEK0Mvb1phVTlORWZjUlJBRXdxbU5QWjNWdkFF?=
 =?utf-8?B?SkpXWlV0T01uSHJkTkxhSlRndTc2OGdDbHk0VTllNWVsZVVnQkY2RHE5K2ZU?=
 =?utf-8?B?NnB2aERJNjhwLytaN2ZYLzRFa0UwUDhiVlJmTmZtSFhVWGhnTDBsTmVScUtK?=
 =?utf-8?B?Qm05Vkl2aStaaFpMSC92aFFoYW9kcGNsdnU2ZmhmbVRDUzRvTmVHTCtaZ09G?=
 =?utf-8?B?M3ZjU0xNeUQ1WjAxQWt2NkdSUE8wK1dUQkZSc0k4VGs1dHZ4dTc0YzhtbTVw?=
 =?utf-8?B?WjJoVGFCU0U2bUEzcDVmVGE2Mnc0NXRJeGl5ZjFxQ0pIWGtzbWRPazlvYytw?=
 =?utf-8?B?SXJublFVZDBYTmRsdVg5Y2tYOXpIZVZvUE9oYjNTTjJMa1NoRmFnL0dENDBp?=
 =?utf-8?B?VnVzUDJxNlVpNVNIcE9uQ2xHZ0E3Y0NxYWZ6TUJnK2g0cUsyY3E1ZHpwUFJW?=
 =?utf-8?B?UFV6Rk5VUUtad0JDZnNjdC9hQmxsNVNqL3RlMS9hMngvMEFaR09xQlJLT0w4?=
 =?utf-8?B?OW82Yk9YUE1La0RHdmZ6aTRTZ2RxU1F2ak93Mm9yNVdJVTVLNDdEM1BMWlMz?=
 =?utf-8?B?aFpoaWI0ME4wNkJhanlPMnErY1g5SUdadEdmM0d1TFRFZXo5elhoUEcxTjZY?=
 =?utf-8?B?cGJwaFFyZEZqdDRsdXRFUjk5Njk3WHVUWDVldmd0d3ZNMVBhNE1PNi9YWWIw?=
 =?utf-8?B?VDVDakNMS3hWRzlKUU5YeXJDZzBQK043YXBNUUhZdThqa09Ob1RObGxQRzZS?=
 =?utf-8?B?L0x5UGxXNDdyMjYzQmN3UE5xdU9LcXlZMjRCeXpZb1NpRWRSWHJ2RzlSSGlQ?=
 =?utf-8?B?R1VJWGszRGRUQitFTWtMMDRka29zSTNUY0FtV2FCanp6WExlWnc1OVdpZzN1?=
 =?utf-8?B?SjFQNlNLOWQrWXdvMTN4dTdrZGlTWGw2dzRScE9MRUxuTmRQTEJ4RW9UNG9X?=
 =?utf-8?B?dEM1UnR4K0hWaGdrVXVyanE2YlI5T2lwcXdob05Zc3hMWUZpTnFSckRYTklj?=
 =?utf-8?B?cTl1TnY4SjBwK3BwL3JOOFNpTE1KOWV4b0VqSnAweDJtWC96SkNkamhKMkhG?=
 =?utf-8?B?MWRpVGNOd0dseUp1ejNKaGUyNFc1cDVpVTFJQkxNakRSM1FWTDhhbjdjT1Qr?=
 =?utf-8?B?Kytad2RaLzN2bUE1c1RHaytIV0hEeGZuTzdmelZsc1dSWHZUeEg1UWZ5TEdt?=
 =?utf-8?B?WG9Kd3BkcVpRRlFwRk5rWEVuMkcvVjZSV05NVm5XRS9mVEwraEg1M091eVRG?=
 =?utf-8?B?b0xXRnRVV2k5NTliL1MrWW9kSk1JU0NQSlFaWFlYQUtjYXlSR3FPMm52UzM3?=
 =?utf-8?Q?ZYeib7tQJoKmHG0YfmCOS4A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6354.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWp4cy9UVVljbkNEYzBmRGZvbjFxZFlEL1NFQVF2QzZPL0QzZVRXYmRzTEFH?=
 =?utf-8?B?d0RvQnpXZkxyeVlabDN3N2RmOTQ4b1VvaTB6RU56MHJBUVdaa1VJclBGRElC?=
 =?utf-8?B?UzFPa0VZUGdRMS85azIzMzNNaEI4VDExcnUzQ3JoenIzdHJBNHZGa1ZVYS9V?=
 =?utf-8?B?SGpkNmJoc0svYTBJbWhEb3pJZUNzaXlXVGZiaG5VNjQ5bVRGK0VjOEYzWGU3?=
 =?utf-8?B?ZENHaVZVblNTeFhDa3VFMll1VnE1bGU1WEhtK0l6VGR0bllwVGh3QWtyRVh3?=
 =?utf-8?B?VjhCUytiUnBCOXFodjNvUVlMS1ZPMU9GODgwSTU2SFltWnVINDUxV0VPT2Ir?=
 =?utf-8?B?M1hJZDhycTBIQlg2aFdBVzQzbXNNQTQyei9UTi9GN3RCNmZHWVc0bW9lMCtI?=
 =?utf-8?B?SzkyZUNDTkJISlJSRXF0Zk42MmhxdGRiY05mMWlYWU9FRkszdTlQT2xaaDBj?=
 =?utf-8?B?ZnZ2M3pzR2duYVd3RGgzNGlHUUZuc0c3OUNnWmtSaU44cXVOTDYwTEJ6QXBm?=
 =?utf-8?B?amxZcDg5aTZyN3pCaldMSUxJWWJsaFlwdVJ0QTlNbWZneTUzTi9ndFFhdmh0?=
 =?utf-8?B?U0dvYXcxdTJtOUNFeFpFQUU0UDJjT3VMMVFzSHFMcjY1QjBCZTY0TzFNUDlM?=
 =?utf-8?B?bDhqN2dsa3VacTlCdFR1NEJ4QS8wZGkvMkkyOXFKa2k4Q3liVERCc0QwZ2kr?=
 =?utf-8?B?S0JKSzNZeW9jOWFaY1dCamcrYm9wd3FxWjdXNnhGL3lnaWNYWlYwdUNZandM?=
 =?utf-8?B?ZGZYbGc1ZzBBMkc5Q1pLWHhPWjdqRUhrUjFRZ0NPRVRZaTFaK1RIWVdPNTlv?=
 =?utf-8?B?WEdWc1NSZnE2OEhydEVESFFSQnhkV1I0U2NpRVNab3hlWDZxL0MyVng1OUU1?=
 =?utf-8?B?bUd5Y3VFTGRzeDRKdUFnc2ptTlBFZzVob3U4Y1cycFFIZUlTd1hLMVR3b3lv?=
 =?utf-8?B?YjZqQWdMVE4xQ3ZQbFVtNU1NVnltNUJpbTljdURPQWtCZngyY3Z5VHUxZlZH?=
 =?utf-8?B?S2psUjgvZjN1aXU5bGh2Nm9MbkduK0FFNUp0Y1pveDNBRjE2N2IzZWgyZnl4?=
 =?utf-8?B?M3F0bG03TURXa0hUNWsvdHRQalRrQU9QNEk4QW5Wb3dza1V0K1lUNC82dFd0?=
 =?utf-8?B?Y2ptNFFQRmV5WmNvOXZHTU9wT09iWk1ncVIzSE9Pb3AwMlErd2pYSk8xTXo4?=
 =?utf-8?B?SkdMZkZFNnNGUERNMlJkYWtVbTZqMzduN3oyazVrMXVSa2xBV0JkekZnSHgx?=
 =?utf-8?B?WVNoU0o5Mi9uL1Nock5EL2NraDBzaTh4ZGphbCswUFRJcG1PcXpRcXYyc0Q2?=
 =?utf-8?B?eTZXd1J5eHRZYXdzU0RldzBBaWhLeXk2QXZhVFhhbUhjemZValFwS1hEUmM1?=
 =?utf-8?B?NFlVUnh4RjA3QVNzY0RwM2tqN2lQUFA3anlmbmsrMENWMVVzeVZabXdRL21E?=
 =?utf-8?B?bTc5MTBRWkRmMnZnU1JaT0ZwYWxPc2VOYThaUi9pRFVScFVwOE56QWhDWDdy?=
 =?utf-8?B?R01WRitaaTMwcHBWNmVyaHBqZDZBRzVFNG82M2VDdFhIN3FyQmY0RFVNWWd4?=
 =?utf-8?B?VzBhM2Z5UGJxRm9aKzU3eDNhWTE0YWxYb2g1V1hMVExiU1Q0WEZVWjlxMXMw?=
 =?utf-8?B?SGhlWDhvNjlGNk54dkNpYS81ODBOVGw4OWxvS2p5NEQ4TkxQSktMWlYvOE9y?=
 =?utf-8?B?OXRobG1vbHl6OFI5VUVDYmJTbEl5ajZGcUc0T2llOGRsZHF1bGRqVC9nMkpr?=
 =?utf-8?B?TWZGVzlBOVhINEUrVzVpM1B0MmxjRUNYdld5SFBRQXpuWFVtU002RlpUejR2?=
 =?utf-8?B?c2t2NUtQdTloNnJpNGg5YXBQYVd6SzdFWlppZkwvTXBhVFFwQkVwWHJrb2Zo?=
 =?utf-8?B?OG1vYlR1ZHBIcmdUem1nSG13N2hVUVkzK3RpZDZ5dnVBbDV6ZkMyM3lXZ1Y5?=
 =?utf-8?B?MGtRRVo0M1hjaTVHK0NpbVpTeVhnK1JGOC9qbW8rUnJ3U2gwMlRGSFVpdUow?=
 =?utf-8?B?eFg3alJNUENCaUJIWGNIS1JCdjBxYkNhcVJKTlAxNEZObVYxUGtPMDFmOXk3?=
 =?utf-8?B?b0F6SUlFZldackc4dkNUbmtFYVB4RW12Yi9DRWhqcHpHZHFnWTlFMmpvVHBu?=
 =?utf-8?B?Q2Z1dEVsQmZPN1JZSnl3a3dyUnhFYnBiblRmZlJUZ3dWd1hBUlQ5RHI1aWs2?=
 =?utf-8?B?c2NrOHYzSFVUd1pFSHhDOStlUUkrYjlDVERvWkZlSHpPZlVRMFJ2dlVubmxZ?=
 =?utf-8?B?aWxhNCt2NDF1bWxaMXQzUzFjUWlHODlFQUtkbDlkcUVKczZ1L1U4aHN3dDNa?=
 =?utf-8?B?Sm13SUcyZUNYZGoxQ0JnYnBaNjRWaDgvT2FLUVhSVHBBU1hTaTAreGkyY2J4?=
 =?utf-8?Q?bXdbWydns8Gr8QtQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B794C1403E39548B5126CE0858EC1EA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6354.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057b8461-0e77-4c9b-93bd-08de6950e258
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 09:35:24.8556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBK/zkF/Rz2qfGZ5NDb7KSCLxFq3nzS5kncMhMF8yw3j2WOUwrp3X7On8AS4JIBfwsugOs2YcZ9PkDWcOKrDeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7140
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_013534_709015_FA9BE0F1 
X-CRM114-Status: GOOD (  26.65  )
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

T24gV2VkLCAyMDI2LTAyLTExIGF0IDA5OjE5ICswMDAwLCBSeWRlciBMZWUgd3JvdGU6DQo+IE9u
IFdlZCwgMjAyNi0wMi0xMSBhdCAxMDowOCArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToNCj4gPiBPbiAxMS8wMi8yMDI2IDA5OjU5LCBSeWRlciBMZWUgd3JvdGU6DQo+ID4gPiBPbiBX
ZWQsIDIwMjYtMDItMTEgYXQgMDk6NDEgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6
DQo+ID4gPiA+IE9uIDExLzAyLzIwMjYgMDk6MzMsIFJ5ZGVyIExlZSB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gPiBXaHkgdGhpcyBjYW5ub3QgYmUgYSBzY2hlbWE/DQo+ID4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFdlbGwsIGFjdHVhbGx5LCBpdCdzIGFscmVh
ZHkgYSBzY2hlbWEuIFRoaXMgaXMganVzdCBhbg0KPiA+ID4gPiA+ID4gPiBleHBhbmRlZA0KPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBXaGVyZSBleGFjdGx5Pw0KPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gSG93IDFUMXNzIGlzIHVzZWQgYWNyb3NzIGRpZmZlcmVudCBnZW5l
cmF0aW9ucyBpcyB3aGF0IG15DQo+ID4gPiA+ID4gZXhhbXBsZQ0KPiA+ID4gPiA+IGFib3ZlDQo+
ID4gPiA+ID4gd2FzIHRhbGtpbmcgYWJvdXQuDQo+ID4gPiA+IA0KPiA+ID4gPiBXaGVyZSBleGFj
dGx5IGl0IGlzIGFscmVhZHkgYSBzY2hlbWE/IFBsZWFzZSBwb2ludCBtZSBsaW5lDQo+ID4gPiA+
IGVuY29kaW5nDQo+ID4gPiA+IHRoaXMuDQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+IGxpbmUg
MjQzIHBhdGhzLXJ1DQo+ID4gPiBsaW5lIDI2MSBwYXRocy1ydS1iZg0KPiA+IA0KPiA+IEkgZG8g
bm90IHNlZSB0aGVyZSBhbnl0aGluZyBsaWtlIHlvdSB3cm90ZSBoZXJlLiBZb3UganVzdCBsaXN0
IGFsbA0KPiA+IG9mDQo+ID4gdGhlbSwgbm8gZGV2aWNlIGNvbnN0cmFpbnRzLg0KPiA+IA0KPiA+
IEJlc3QgcmVnYXJkcywNCj4gPiBLcnp5c3p0b2YNCj4gPiANCj4gDQo+IFRoZSBvcmlnaW5hbCBz
Y2hlbWEgaXMgYSBicm9hZCBkZXNjcmlwdGlvbi4gTm93IGEgcmV2aWV3ZXIgd2FudCBtZSB0bw0K
PiBkZXNjcmliZSB0aGUgZGlmZmVyZW5jZXMgZm9yIHZhcmlvdXMgY29ubmVjdGVkIGRldmljZXMs
IGJ1dCBJIGRvbuKAmXQNCj4ga25vdyBob3cgdG8gYWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9y
IFBDSWUsIFVTQiwgb3IgZXZlbiBTRElPDQo+IGRldmljZXMNCj4gZm9yIHRoZWlyIGNvbnN0cmFp
bnRzLiBTbyBJIHVzZWQgdGhlIGRyaXZlcuKAmXMgZ2VuZXJhdGlvbiBuYW1lLi4uIGNhbg0KPiBJ
DQo+IGp1c3Qgd3JpdGUg4oCcbXQ3OTk24oCdPyBPciBkbyBJIG5lZWQgYSBjb21wbGV0ZSBhbmQg
bWVhbmluZ2Z1bA0KPiBjb21wYXRpYmxlDQo+IHN0cmluZz8NCj4gDQo+IE9yIG1heWJlIHRoZXJl
4oCZcyBubyBuZWVkIHRvIGNoYW5nZSB0aGUgZG9jdW1lbnRhdGlvbiBhdCBhbGwgYW5kIGp1c3QN
Cj4gbGV0IHRoZSBkcml2ZXIgaGFuZGxlIGl0LCBzbyB3ZSBkb27igJl0IGhhdmUgdG8gZGlzY3Vz
cyB0aGVzZSBkZXRhaWxzLg0KPiANCj4gUnlkZXINCg0KSSB0aGluayB3ZSBzaG91bGQganVzdCBk
cm9wIHRoaXMgRFRTIGNoYW5nZSBmb3Igbm93LiBJ4oCZbGwgZm9jdXMgb24gdGhlDQpbMS8yXSBk
cml2ZXIgY2hhbmdlLiBSaWdodCBub3csIHdl4oCZcmUganVzdCBtb3Zpbmcgd2hhdCB0aGUgZHJp
dmVyDQphbHJlYWR5IGRvZXMgaW50byB0aGUgZG9jdW1lbnRhdGlvbiwgd2hpY2ggZmVlbHMgYSBi
aXQgZXhjZXNzaXZlIHRvIG1lLg0KDQpUaGlzIG1ha2VzIHRoaW5ncyBzaW1wbGVyLg0KDQpSeWRl
cg0KDQo=

