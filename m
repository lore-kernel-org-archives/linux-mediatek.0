Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCD5C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOw1p4diDDyOi/sjWl0yXT6bCXtfaD5O+8jn2d7h5oI=; b=Y7rFEVcABHSJmXEpC1CKrXtL+S
	tHp5zxTN1zbgQ3RiMAb03db0XA2m6elwEcZPWYvZm/o4eGKWHMMcjyfl+U/UGfsrYPcOW1pDAmFb0
	s3lt+TEOohDFDm/4XfFxontIemOIkCreoYHDIH3MwV7igcYyGFcY/vTJasP/SDu7kU6OIAdbkE53c
	XTInquB+/oYWAPr2utgc1/Bc39QKYEAeY9eyQ6gkOjtS7mgXKbXgNderqnfviZMAZlrW9NJ2VNvy2
	0RMmNUFGSB9VX8r+XMOiDhIVXRqTOVzhJWBc283cQPniif+KQb4adAAB9oR3vLJKyjaWbzzLkxBkh
	6tNwf/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p133h-00FLxF-Mc; Fri, 02 Dec 2022 10:14:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p133U-00FLqR-Fg; Fri, 02 Dec 2022 10:14:07 +0000
X-UUID: cafdc63c3e8743e590f0ddaf70734deb-20221202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=mOw1p4diDDyOi/sjWl0yXT6bCXtfaD5O+8jn2d7h5oI=;
	b=Af8YQpEDi2tt7mPCjWfrvz6w+NFVoQqfIlkfdGowl6nRxdexaK+VnuA8w85wOjn0k73Av/7FMdLx5UkI6btEcdCV8tzlxo/UtUtfrVvlxIG/JrMqrcm1aIwGqrtyp9sEoiF56Y/KnfnpdqeZUbt+GtGOlhMy7bxBZuHMMD50n3o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:05097bd3-1dca-4125-b27d-d2e640dca3a3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:4c4bfb1e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cafdc63c3e8743e590f0ddaf70734deb-20221202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2072477122; Fri, 02 Dec 2022 03:13:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 2 Dec 2022 17:43:27 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 2 Dec 2022 17:43:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOrXHxWXqP/HNgjrfT7xmZUl8phq6gv69TERryc3PjtHVnhSQx3iYg0jkfrL4P8ghBZk+7zK0clH6HjwCkIBIhWOIAO8sOZ6D8Vlc4WlHvQs1nDMAtYUYJAfnAF/wtpm2tKacvQqyTJlCjfejVCYSRWJL31oZmcJofdwiEotDhZLRJHfi7PH4zP1h1QhRp58p4r19toHF+24zKZ2+7nieeQJt6JXx9ythhmf+o4LsW+ydr4ykVsZT8X6lSrzzuMpsf4Lz7TVDFOBIdf//AQrQtmGqZLGFGH/JYhjXVdIBcFR/wFMLnBn9S44HSVhU1vRn7+L0ORKSBmsZnCBLV08cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOw1p4diDDyOi/sjWl0yXT6bCXtfaD5O+8jn2d7h5oI=;
 b=MISNLxtrr2C5XWILY4mmQkfpBoGydl7wRkWH7PJAo1XpqlMeGLObXg3mB1zXK8bafotGgBStcS8fYDCOhvuROOuQ0aCgCa0aDEOkWH/qw5ZRdNvT/ky9TXIEOWhMkPHSkByhWbq2jc2Prj8X+ZsrEwB0SSXdGRsvD0bRWTCGoNmpA8jXff6QTo0yQlWsdgbhKZD54qdEh/yyU9jx/DiirGImy9DP4eltG0gNIXLlLJwP7i71mKNPTuiGoaG80t8sKDpYPLkw3BgkYD1//n9aGIUQim4BNP2SI3PlxqYQoOVrIT0QUeVmTjZV9sVKuK5Ryp7fd5qovhR9IG2XFmLPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOw1p4diDDyOi/sjWl0yXT6bCXtfaD5O+8jn2d7h5oI=;
 b=a+LDkPlxng2FbzY+sayRLwf+bXNu9kSnPHcPEfh91aiwl77qUFE3eSlwzzuEMf5DcGqyVD3zt9kOL4XQfoDt/reywQr8pcm87z7n7iWXkL+2vdTQ4UPfZ7Yy7Ax/iI16XmakjPj1jlxgPuWzCZPMjdeBgZu0FYJKFXM0dQyn1nM=
Received: from TYZPR03MB6919.apcprd03.prod.outlook.com (2603:1096:400:28c::9)
 by SEZPR03MB7050.apcprd03.prod.outlook.com (2603:1096:101:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 09:43:25 +0000
Received: from TYZPR03MB6919.apcprd03.prod.outlook.com
 ([fe80::af56:be8f:f:85b2]) by TYZPR03MB6919.apcprd03.prod.outlook.com
 ([fe80::af56:be8f:f:85b2%9]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 09:43:25 +0000
From: =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
	<Allen-KH.Cheng@mediatek.com>
To: "regressions@leemhuis.info" <regressions@leemhuis.info>,
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Thread-Topic: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Thread-Index: AQHY9EBMG2Hs3dZcS0K63Lh/Rcrv+644BgIAgAhm7ICAGNg0AIAABQwAgAADnQCAAOcvAIAAOrgAgAAGTACAAAaJAA==
Date: Fri, 2 Dec 2022 09:43:24 +0000
Message-ID: <b1822bbc3775730c4cedf9652323c7d72e663e4b.camel@mediatek.com>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
	 <eb142a22-b35e-ec3f-ee0a-9e3e7b24cea6@gmail.com>
	 <bf8d2a8f-7654-29be-1104-a842c6657b5e@systemli.org>
	 <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
	 <Y4jHvomTrU8guBox@makrotopia.org>
	 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
	 <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
	 <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
	 <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
In-Reply-To: <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6919:EE_|SEZPR03MB7050:EE_
x-ms-office365-filtering-correlation-id: 8b4aa310-43a9-46e7-f9ad-08dad449a85f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qUydFPCMGzxJH1nWPzrX5w8pTVOLxFLz4tlMPZacyGmfxXqJ0ReyZo5R4T276xnFJ6LGu0ReK+GN6hQF5wHEKIIM4jzYS+/JpHVsZjDh0jNpOexp2GEY3xsd/8emahhkqSjDPzpRSzwWq7W8+RDgR8MHyFrBvsCmEis/3pmLAnkTW1f8LMNj6o5ddALXq3LOskaRVeZ8OTxyJm5dSUNxje7xV/d78iAWwHjodbj5buWBRRded5nzsblUk4r5Q8nVPxFq0xeVXLOxBlX9KTYncR+HFj1JMcDyTmPKAEQ5W832PwojnBY1+erQAp8KVmFoTNox9SrO6uvA9OwrWjnTSeGZZYoBj76wAbekYpFuWln51U2SarhFurrusWXQf51kpCl7L34P3GU9IkskwZAWHj3JFBTONlN6HI+UtUqC0/17Umbut8P0aNYljC2H4gSQSd3m9Yso/5tBQ20hE+jEHLOCPe7DJNxUMiW2Se4Bu6jl/xASKnyOzzYLmWhIMxUqMMXopgwOmxwmQ2Hq6LNvhwkOhXQizao7eoQCA0ok1F3WktBM5rZHtrW1ucGmQ0+HixDWWBI9PknaYnwaeQkF2PiEZh5QPu/A4B221U5JOBFtcdB4HVZ1XISIsHEpEtzQ6gRHJAa3oXSSR0D+h+CB1N1W1BBI1iTXT6i+BX5U+PwMCaa6jAhc5UGXAHAiI80+83YU0z5bQ6soo8RhvkAmiTkwaC8/YswvJU9xrRShVHk/Qo3rpMvJh6PI9Z0O5jcnP0LyQ68e1lqDV9QP6VeTvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6919.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(36756003)(85182001)(86362001)(54906003)(4326008)(122000001)(8676002)(91956017)(66446008)(66556008)(64756008)(66946007)(110136005)(66476007)(76116006)(83380400001)(38100700002)(38070700005)(316002)(26005)(478600001)(71200400001)(2906002)(41300700001)(8936002)(7416002)(5660300002)(6512007)(966005)(2616005)(6506007)(6486002)(186003)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTdEajV1RS9DQ1l3dXB2YUNuUlhIYmpHTkVycHdlMS9ReUZXWGJySGpRSHFK?=
 =?utf-8?B?M0NIbmptamxkWWJMUENuZ0FvMXNMUE5qd0hCZGJoUnVvVHRQTloxczdjcy9s?=
 =?utf-8?B?RnF4ZENlRDNHVUdJMTJCMnZOZ0VxdXZXSlRmN2I0ZmRBcy9EdGNvRXJJbzdx?=
 =?utf-8?B?SWpkUy9VaExNRCt0MTUwamdnelRmckFBLzhiS0ZSNjNwL0s5RE9ZUUVGM3Ir?=
 =?utf-8?B?bmh1RVFQMWthZTdrUk1zRVhvcmxqazhuYUNqK1M5UkM4dVBCblEwMld6eCs3?=
 =?utf-8?B?UmRuOEFtM0xsWlBHWUI3a21uRHVTUXhOZWl1K3JicGRmeEVRQmRkOEtaVHpR?=
 =?utf-8?B?Z0R0UU1DUHQ4bHNEYXRha1l6VEpjWVJ0VFROSkFWREpqVVAzN3J2dmh4NGVw?=
 =?utf-8?B?WDZrRkhMbUNaNWlCVTVsSkZOYzZUV3ZUVndQbGt6blVUc3pkS29TdFZaZm1r?=
 =?utf-8?B?TmJveXd0bnJncWZIeXRoN0h1QWRYanE1Y1VUQmh4eS9SN0hMa3dZRUtFMW9j?=
 =?utf-8?B?ODN2REpRVlNPdmJRRzljZC93cTB0a1J4akUxRitvOXZqdngzRk5aTG5xUXRB?=
 =?utf-8?B?RGFtWjQ1NHB4RnhPSFJFWUZMMGRQeVJSZm5qR3A3cFdZeWE0UTFETXdCcHhN?=
 =?utf-8?B?akFTdXB1RkpsVERCbDBwMVhBRHkwVkdUbnhDUlVMMUVhYVZURWdUM21TYWxW?=
 =?utf-8?B?ZXR2dUVRRDlDMG12aVo0QVBHOFN2Ny9pcmY0T2Rsbkt2YkIxSFZTZWg4eXp2?=
 =?utf-8?B?NjRQOTJKR24veDlubFgwZXk3OXJ1di9ReXNiZjhVLzNvbWZOTnpmWE94RDdP?=
 =?utf-8?B?b3Q4Wk53ZFJ0RVNUZmVtR2JUYis3NDMvRU9VVlNzTVFWTENqb2ZEbEpPZXJa?=
 =?utf-8?B?YXE5M05Vc2tYTkVURnVZNTA4UUp0bGx1UUx3VHBCWHpmOG4yTHFlUGxtMDVq?=
 =?utf-8?B?MHIyZG1sOFRIZFVqSXF1ZlJuMHVROW5XNGlNVUJ4Y2JUMlRmQkRwTnVDb1NG?=
 =?utf-8?B?NkZLOGNSM0ZEMGowUTRjSEowQWRzaUlTM21kTmtoMWw2Ny9JZkd0d3FTUUZo?=
 =?utf-8?B?c0JnaWRjVHkvRUhNRVRlaCtUU29adS9uSkc4LzNjR2lFZk0wcllPMWppMjdX?=
 =?utf-8?B?N3hUTmdWTHpXNno1RnZKbUZqWmwyci9MUVBVVVptU3BUcDkxQkRWWEl1R1pO?=
 =?utf-8?B?RFJXWkJxNzJ0QUMrNWZCdVg5emtyS2lWQmJUcmhlcXNjdGVMdHZITlg1Y0lM?=
 =?utf-8?B?WDVTUC9zem93cTVqZ3Y0amZGWktqNG5Hd1hzdjV1QXBlcER0OXV1cGg0NnVM?=
 =?utf-8?B?VFFaa3NMUlVLUjlZUTRrYS8zSmZhaS9ITlRCNEphdVZnQ2Y4KzZ4cjdwTVRN?=
 =?utf-8?B?Smd6cHZsdlFka0NoZDNlWEdTZnJlMmQ1OVYzVE8wa1ljSWkwVlR1RG1JZzNx?=
 =?utf-8?B?ejEva3JlTjNoZlBrd3FYUm1vWVRvdjdFbkZLaVIzNTRvZDBnaVczdVVGWVNB?=
 =?utf-8?B?VzVuSUJ1a1p3UHhVbmVqb3Fkbk50UVdvUWZ3ZmJuV1ZmVi83RVhxYkp1RThB?=
 =?utf-8?B?dkE0enMxeStjcmpQTFE5WGVBWE9Yd0hNbnhNdnkwNWR1WG9uTzljYzIxSnBq?=
 =?utf-8?B?RDZ2clRqRHZnanlBaWxncHlndXpCTThpZ3JiKytFNHYzajA0WG0vYjllYlUw?=
 =?utf-8?B?a0kwRzVIQms1cERudUVUd2ZhWml4SmNHMk9tMFA2QkZYdlNDMFVKUFVBVU01?=
 =?utf-8?B?WGY5OXVUODM0TmZEOWdJemNYRXlNeHZZSlYxZUpMV2QxT2FnalVIYU9NV2FB?=
 =?utf-8?B?VytvUjhld2NNNGhsMEZQa0U2T0pjZ20wdE81Z0dKbXRTN1BYYXNzMmZIQ3dS?=
 =?utf-8?B?YlZxSUNyRjIxYmsvYXd3ZHBaNWFlRm1ZK2tadzI0UzB4K2pzMXJIanNyWWlx?=
 =?utf-8?B?eFN6NU15bGh2aFY0cEs5Nmdlb0JPL3dxYkc2c21VNHhUZ3NGbnVDKzB5VjlL?=
 =?utf-8?B?U0JyaVBNWGpQbjMwOU9hTGt4c3VUNkpLT0FTY2lHUVJrTmVsVklQK1FZaG9q?=
 =?utf-8?B?MHE2UEx1TlJCblNHdnl3THNrblMzMXc2dEpsVW9qNnlTYk96MUIzR28zMjRM?=
 =?utf-8?B?T2hINGFyRGVsVDRYcEpiT0NwTzZNK0hNajNKUTBnM0VnUS9MVkFiTXZTckhE?=
 =?utf-8?Q?QKxDtoZdOmtRLrx+TCspvaI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21AA63F177C3B242A47B737550007D11@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6919.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4aa310-43a9-46e7-f9ad-08dad449a85f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 09:43:24.8597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VopwovKv+jmJRjhCK4eJTL2q5OVSbgImgNX2Z7gKe9r1Hcy32zsyRktonAXqkleuATjpjd+CtbaCg8C1g+uox/kT1rSnh85YljMwsjuYwBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_021404_801643_E49DCCA7 
X-CRM114-Status: GOOD (  21.33  )
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
Cc: "vincent@systemli.org" <vincent@systemli.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "daniel@makrotopia.org" <daniel@makrotopia.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "thomas.huehn@hs-nordhausen.de" <thomas.huehn@hs-nordhausen.de>, =?utf-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?= <Jia-wei.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQW5nZWxvLA0KDQpKaWEtd2VpIGlzIHdvcmtpbmcgb24gdGhpcyBpc3N1ZS4NCg0KV2Ugd2ls
bCB1cGRhdGUgcHJvZ3Jlc3MgQVNBUC4NCg0KVGhhbmtzLA0KQWxsZW4NCg0KT24gRnJpLCAyMDIy
LTEyLTAyIGF0IDEwOjE5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToN
Cj4gSWwgMDIvMTIvMjIgMDk6NTcsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIGhhIHNjcml0
dG86DQo+ID4gSWwgMDIvMTIvMjIgMDY6MjcsIFZpcmVzaCBLdW1hciBoYSBzY3JpdHRvOg0KPiA+
ID4gT24gMDEtMTItMjIsIDE2OjM5LCBUaG9yc3RlbiBMZWVtaHVpcyB3cm90ZToNCj4gPiA+ID4g
VGh4IGZvciBjbGFyaWZ5aW5nLiBBbmQgSSBub3RpY2VkIEkgbWFkZSBhIG1pc3Rha2U6IEkgc2hv
dWxkDQo+ID4gPiA+IGhhdmUNCj4gPiA+ID4gZGlyZWN0ZWQgbXkgZWFybGllciBxdWVzdGlvbiB3
cnQgdG8gYW55IHByb2dyZXNzIGhlcmUgbW9yZSBpbnRvDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBk
aXJlY3Rpb24gb2YgSmlhLVdlaSBDaGFuZyAod2hvIGF1dGhvcmVkIDZhMTdiMzg3NmIpIGFuZCBW
aXJlc2gNCj4gPiA+ID4gS3VtYXINCj4gPiA+ID4gKHdobyBjb21taXR0ZWQgaXQpLg0KPiA+ID4g
DQo+ID4gPiBJIHdhcyB3YWl0aW5nIGZvciB0aGUgcGxhdGZvcm0gbWFpbnRhaW5lcnMgdG8gY29t
ZSB1cCB3aXRoIGEgZml4Lg0KPiA+ID4gSQ0KPiA+ID4gaGF2ZSBzZW50IGEgcGF0Y2ggbm93IHRv
IHJldmVydCB0aGlzLCBpbi1yZXBseS10byB0aGlzIHRocmVhZC4NCj4gPiA+IA0KPiA+ID4gUGxl
YXNlIGNvbmZpcm0gdGhpcyBpcyB3b3JraW5nIGZpbmUuIFRoYW5rcy4NCj4gPiA+IA0KPiA+IA0K
PiA+IENhbiB5b3UgZ3V5cyB0cnkgdGhpcyBwYXRjaCB0aGF0IEkndmUgc2VudCBhIHdoaWxlIGFn
bz8NCj4gPiANCj4gPiANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMjA5MDkwOTM3
MjQuNDAwNzgtMS1hbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20vVC8jdQ0K
PiA+IA0KPiA+IFRoZXJlIHdlcmUgY29tbWVudHMgb24gaXQsIGJ1dCBpZiB0aGF0IHNvbHZlcyB5
b3VyIGlzc3VlIEkgY2FuIHB1c2gNCj4gPiBhIHYyDQo+ID4gdG8gc29sdmUgd2hhdCB3YXMgcmVw
b3J0ZWQuDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBBbmdlbG8NCj4gDQo+IFdhaXQsIHNvcnJ5
LCBJJ3ZlIHJlLXJlYWQgdGhlIHN0YWNrdHJhY2UgYW5kIHRoYXQgd29uJ3QgaGVscCBhdCBhbGwu
DQo+IE1lZGlhVGVrLCBjYW4geW91IHBsZWFzZSBsb29rIGF0IHRoaXMgaXNzdWU/DQo+IA0KPiBS
ZXZlcnRpbmcgdGhlIHByb3Bvc2VkIGNvbW1pdCB3aWxsIG1ha2UgTVQ4MTgzIHVuc3RhYmxlLg0K
PiANCj4gDQo=

