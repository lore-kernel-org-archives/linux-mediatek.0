Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6261FC76196
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 01:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3W6N0qkF3YwSvXvEa4Kl++XT/ZynILmhk/d2SaZjvpY=; b=AJ4t7XLm2Orce/ufuLl4A72F5p
	71iC0t/j89Qay1H8sG9tRnyA9Wsj0teP6woZKQBxTkhDS97ym5xuHVF0BrqgKVzayVfnx9TwFIxxl
	AG5agEr6ot3eEU3bpLV8D2aTH0oVcFnRGjKaCfJidl3hEZE5kpOUnqErlu7UFkC2dN3jsdf0S55+m
	/Ul1zDWsIhJz73bNKfmu9tL4wf0o8+BQf1XWm7TrXGvxkfrO+yTs5XX5g/Y1fXDkOMKWx4T4u6IMP
	/4u1sjCOsquO2wJZx2bEIQbrI2ZfNzAUvuV9PD6Qz3yhNNBql0KjEjpb75VYS3swqEtQVXMjimz3H
	zh21GWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phKzH-00GIjw-2x;
	Wed, 29 Mar 2023 01:52:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phKzD-00GIiN-1V;
	Wed, 29 Mar 2023 01:52:28 +0000
X-UUID: 5700d730cdd411ed8687db9d93187ff1-20230328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3W6N0qkF3YwSvXvEa4Kl++XT/ZynILmhk/d2SaZjvpY=;
	b=rS5FNolAZj4SJ1Sx6aMWj9T6DWFjchkoiRP6AjzDA01Na0BXtIWfupV2QTekNFRBlZBuNWHK3kZkjnZ+jG1N2NAxMt/oC4IcCECN9n2QJElZVkpKssBB3C8xbqwk6BOdNSLTyjk7lWIRgTAFqcQm3ikI0ntrAzhwGIkynyReD9k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:f534d6d8-af33-460a-bbb0-12996d8fe086,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:47b4aab4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5700d730cdd411ed8687db9d93187ff1-20230328
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1588986245; Tue, 28 Mar 2023 18:52:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 29 Mar 2023 09:52:17 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 29 Mar 2023 09:52:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=memGXyHSVSYkQzo0i40qIIaZPe0Q4WtF+R66wUDP4jMGQyvxt9Vuy/HcGtGAGr2VufWUeiTpYRJgb57/LzJZjLiwyHEWY8gkOGsiH4Vnx5qQuiiIJXBhOv/i4fYZqyOS4k0gkRXV6/A5hms7cCnxacpFYdhoAvFg7NErXjwoTQHLtBA1xYwuqa2lzAVkoyt/oSP1t0yj9Fqlvo/hODcYoM45yWuJE57Km6I0MUeB2ZMVCn07iNIjKPglMA4214+yDF3oRT59TzYR9TsgtjI52GSgYm8bXin57HepgCAxPxXWFyDKR6X1l3BelIaDRJmIrt+V+QUmRF1/JsN7Mx7jMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W6N0qkF3YwSvXvEa4Kl++XT/ZynILmhk/d2SaZjvpY=;
 b=VzNo7WIWbw5EACxKkMGBFEvgzl616VEw8hGufGKBB4ne5CE3T5+Q2TWul+w+FaRgQFPMf/7pQxFlu1xY1mV9TkXv1Wn1K12Ad98xS6dEc3px5jFt0Jtno4yImiCAA7g0TlGId4zpwoCuho3lgSuF3yxpBS2JdVhl5WPGWHsVBwAJaV1Eu7++07JBReEN8f9teL1+HvxMFSeH2hi0f1QKYpXxV5SDxSCxK1PkOmAamOrgugJk+AbbZXxh0Cp4NcwSqa7Zg6ZVFrAgOylxYPcRW+N4F7J1XwkJq/EdQYcqqBybH4+s0rzpyhC3Kugh38/Vmll1POgnitG8buC/UTHpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3W6N0qkF3YwSvXvEa4Kl++XT/ZynILmhk/d2SaZjvpY=;
 b=e+HEvzsp6Wng5t2R6/IyXDSDCV9K9wypBK+ViQN2SxJNLIxGm4/+a4+1junsM+kaMmm3aM8j22Fc7D5FcVXHnyogxdSm8eH+6mZ2TH/FJQKzbWEDuFFgYcrvVuazbob29kSMl2uyAt6/2sYXVA5ldeG0PzOZnnNGenyVdZN5Rrw=
Received: from SG2PR03MB5182.apcprd03.prod.outlook.com (2603:1096:4:de::17) by
 SI2PR03MB5596.apcprd03.prod.outlook.com (2603:1096:4:123::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.33; Wed, 29 Mar 2023 01:52:15 +0000
Received: from SG2PR03MB5182.apcprd03.prod.outlook.com
 ([fe80::70ca:c2e7:1c06:e3d4]) by SG2PR03MB5182.apcprd03.prod.outlook.com
 ([fe80::70ca:c2e7:1c06:e3d4%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 01:52:15 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: Add ovl_adaptor get format function
Thread-Topic: [PATCH] drm/mediatek: Add ovl_adaptor get format function
Thread-Index: AQHZYSBD6iSut3c50kOWkOkxk0bv3a8QUYgAgACuYgA=
Date: Wed, 29 Mar 2023 01:52:15 +0000
Message-ID: <b33a4298a0954fd6c949160d20e9430419ba974d.camel@mediatek.com>
References: <20230328025126.30341-1-nancy.lin@mediatek.com>
	 <fa638276-81d0-734d-92c1-3b72cd70c1ef@collabora.com>
In-Reply-To: <fa638276-81d0-734d-92c1-3b72cd70c1ef@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB5182:EE_|SI2PR03MB5596:EE_
x-ms-office365-filtering-correlation-id: e3fa6e3d-6c3d-45f1-6136-08db2ff838ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J6koqdO7988YeQGR5XaD3ugiIpdMFdHHwa1ErH/5beVJhlbIc3g+0H2kLh52pfgmQ2TqH+60tNXqmHUa+rtFk0Y7pzfVk24k5lSvZnPvE93i9a4B8qe08o4EoxeZmcFyVHZdYUr3uos5Zg8saz8BY6pMghQ6xdyNiFVMQQzrYPvmRg0aSjRAsiK6iRTUb6nGdaWQZ4aAK0S2aHf7gw/v+/uXFMXoHmje1GNn9TU5GCW1wy1VAYYq9voFJ9dCfMOKGWBu3j2IWffRmqJLvymqNt2vsfrPHOHirBRfYGPVlkG5kA61Yn8PjRrWp6hnLpAzc63HrOtIQBD0FKVW1N2J24nqM4Opt1vNv18n/a3Z9TJtUbzwvoktWzWiiI+K+3EQjoS+qxB1rUciVnMHXfk5mLTVtloFrIABOUMhNEOe/+kbezbqAdDLV8+Ahg1VwXnRVjkp2SlbZs1r1GfKaPENfPjCnXbRV+f4hlHq8RlVpgZExMlSjCfjWlyGNoYUBqPFoYPjVncffbTthSxzrdM8fA9s3oG9o7Gr9KoLOt9xpeyS2O+8m3WBjgGGrx0Fe4r4QEP6V8+ek3GUrc/rjv6DVsWZs/oskRatKmOfdZvSqUQqp9qQUB+HMmCLuZO8CblZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB5182.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(6486002)(71200400001)(66476007)(4326008)(66446008)(66556008)(41300700001)(8676002)(76116006)(85182001)(66946007)(64756008)(2906002)(36756003)(5660300002)(38070700005)(8936002)(4744005)(122000001)(478600001)(7416002)(86362001)(38100700002)(316002)(54906003)(110136005)(2616005)(186003)(6512007)(26005)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1NyNWZFdlVENzBlb09raTFvem9RMTZJOVBkUEN5UUxvUkRLM21URW05SDNk?=
 =?utf-8?B?SFh3RDZKUU1QZGh4YXlnTWtGSzhjTEtHLytqYUlLd0F1YkVSU0ZDT0dmWjZC?=
 =?utf-8?B?SU9vc2ZvTmVPMFIyT1FDTmc4cnFFS1NQeU5lbzM3S1hzOUpQdWxoRlF0b25W?=
 =?utf-8?B?WXNHYThQZ1R6WWkwS21sZGZHc3ZmWXMxNFU3Rm9JN0RKL3JqMU4xYWdQUlFh?=
 =?utf-8?B?VWRQOXg2RUU1QURMV0Y2VXhpQzRvZnYrcGVESzVyOURJMS9UWkhVUkFXUEh2?=
 =?utf-8?B?MklFVkI3b2JQaFk0eU5weWV2VCtGV1BaUHBiaEpnbEdqSHE3UVJVQlNTeTR3?=
 =?utf-8?B?cjg3cWdjWWQ2Q2h5RzZVWWlWQkE0VUdSUjNabzNBYWNibGliaExVVTdaQ0ZN?=
 =?utf-8?B?cDByL3AzZzVTZzFET09kU29jdXoweUlMVU85RG1MbnkxYlZUQzBsNFJNWFVk?=
 =?utf-8?B?QjhsV3U5TmdZOUI4R3hCQlIxSHVQUDRCQU9TSkZKU1hPTHdkWlFBS25QYVBK?=
 =?utf-8?B?MU1rcVoyNkY1LzZqWlZwUGdVY0RMaGk5SlRZNVJxK0I5THd3bk41WnRyQnp0?=
 =?utf-8?B?ZTlLTG9FVzVFM3UvWHhpTm5tUUFJMHpSTk5iTXJqMVFjZWZtcnZHREFrZE91?=
 =?utf-8?B?SkpveWg3RzVvc3BFdHFJNFYraVluNTVhZkRvb3NvOGxEUEFSa21sdEo2K0ZY?=
 =?utf-8?B?ZHpqdzVtaUdFalBWNmd1ajlxZVZ6K3ZjdVlDSGdKZGM2QVgyeWsvWnZtcENy?=
 =?utf-8?B?T1dXY2ZnRmpnRXNwMkFxWnZ2T2tUYUVZcCswa1lnOUdRZ0Fwc1FzNGxxS0xV?=
 =?utf-8?B?cWFPQnp4ZFdWODIrakUreHJSUE5RT0JtL2lWK3RoMHp1Y2JIbFRUZEROT0w1?=
 =?utf-8?B?Qyt3dDdFWnJ0Y2pvQWtPZGtjLzc1UFlhaVpUeUZYdXpUdkV1UVNQMXplY05G?=
 =?utf-8?B?L2xEc0ZSbWdtZFpzaU8vejQvMnp1MWkrNnRMYytDWnpxNGVscnBVaUdFRDJT?=
 =?utf-8?B?VUZqTkV4V1c1RktiQnFJaDFnM1JOb3VTOEFwNkVRdWJWUGVtUlZXNXNHNW4r?=
 =?utf-8?B?cmZaaThabmd5a2t1cnpKLzN3TDM2ZkwrVEp3Y3c3a0VqTWw5TlloTnJndVo5?=
 =?utf-8?B?K1h0NXE0MHFNSVlBbDg1ejJQVUFOWTc4V2JVdzNHbVl1YlVocWlCK1kxS05q?=
 =?utf-8?B?cWlDaVl2TXNxUHNOS05yMnk5RDdIc2h6WjJqNUpoQTA2VExZWUFIcFJQMDgr?=
 =?utf-8?B?RVJEM0wvS1oya2VJQlRjdHJldTNQQ05KalZlL2JCWU9wd3ZyaWhqVElFOGND?=
 =?utf-8?B?bjRZd0E1dXdIQlFMNDBnOWtncnpwV2NiQ1JNeXdBNC9FRlY5WGJQWWFBRTFl?=
 =?utf-8?B?YlVIeDJTdnFVTEMrRmc4OFpJdU9CNlZjMExWUlRzV2FKZ01peTJSWHdqQndM?=
 =?utf-8?B?UjBXTE4vSUNWUkRKTnkyVUZFQTdlMUgrVmNQcHJ0VG5reVdMTDFqektoT0xO?=
 =?utf-8?B?aUxsMXNRUHRjeWxUczhjQno4aTAyUVMyT254VStMOFltSDFhZEZPTkJsTS9X?=
 =?utf-8?B?dGNyaVJTbGF0aXVUV0hMbDNEaE1sYXNnUW9EYnRjWjE1SFlHWm43dU03V1B5?=
 =?utf-8?B?UW1YanJ3OHVCOFRmNGFxanQ3UzNDUVpYRUxXeEN3YTBySERiN1E0QlY1S1RB?=
 =?utf-8?B?aWNCaXlRaGZsQXREeFd2YXlGOU1DWHE0Sm54RkRGU09CN2N4NHhjbGtYUjNP?=
 =?utf-8?B?QWxEM3Q1UXNza3JwM0YvaVAvQ1NhUUYxUUVGYXpNSHpzbUQrWjRaYVpsK25J?=
 =?utf-8?B?V3g5N0F3NkhwMEhHYWNDUXNGU2JZeDJ5ZmY0MTUrMm91a094TW9XWnhNVExv?=
 =?utf-8?B?Y3BmUVVEcTVQVEcwSTlQZ2dvU1NJTUNaZ3pmT2tLZlEwclY4UXBsL3lpeWth?=
 =?utf-8?B?SlNVRzZJaFlLOEZBdXlWNnJuR1U4eXkxeFNCcGlibEcybGZmVmErN0E4Tjh5?=
 =?utf-8?B?QzNQNEhyeUU1VW91aHhXYWJwc0RCQ2lnK2tuWDd0SlUyQmo4bEx3L093Q3Vp?=
 =?utf-8?B?bks4TE10Z2pvNHVoZkFhU0oybXlNTmhwRVBZdDhJaEpyRmREa3I1YXlaTFRp?=
 =?utf-8?B?QzlpelJIdmJOUm81Y3B4SlF1YnlUTEpxa3RUcm9IZ1JqUUVPOERnL2M0TnFq?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B507A90010E1D549B68BD0F0CA43F8EE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB5182.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fa6e3d-6c3d-45f1-6136-08db2ff838ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 01:52:15.3913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gxO8WaIUs+cXuD1u9qxJxZjSZ94cJGMz3NPZoXgwKXxLHvp6XHU3VwCGZTTNSVDUktcXLI/MizLFQGZA653v7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_185227_714669_72A385E0 
X-CRM114-Status: GOOD (  13.03  )
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

SGkgQW5nZWxvLA0KDQpPbiBUdWUsIDIwMjMtMDMtMjggYXQgMTc6MjggKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IElsIDI4LzAzLzIzIDA0
OjUxLCBOYW5jeS5MaW4gaGEgc2NyaXR0bzoNCj4gPiBBZGQgb3ZsX2FkYXB0b3IgZ2V0X2Zvcm1h
dCBhbmQgZ2V0X251bV9mb3JtYXRzIGNvbXBvbmVudCBmdW5jdGlvbi4NCj4gPiBUaGUgdHdvIGZ1
bmN0aW9ucyBhcmUgbmVlZCBmb3IgZ2V0dGluZyB0aGUgc3VwcG9ydGVkIGZvcm1hdCBpbg0KPiA+
IG10a19wbGFuZV9pbml0KCkuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxu
YW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IENoYW5nZS1JZDogSWE4ZTlmNmNhYmNjNzFiMjYy
MTU1YTAyMmIxMDNhZTgxZDE2MTZiOGYNCj4gDQo+IFRoZSBjb2RlIGxvb2tzIGdvb2QgdG8gbWUs
IGJ1dCBwbGVhc2UgZHJvcCB0aGF0IENoYW5nZS1JZCB0YWcgKHdoaWNoDQo+IGhhcyBubw0KPiBt
ZWFuaW5nIHVwc3RyZWFtKSBhbmQgcmVzZW5kLg0KPiANCj4gVGhhbmtzLA0KPiBBbmdlbG8NCj4g
DQpTb3JyeSwgSSBmb3Jnb3QgcmVtb3ZlIGNoYW5nZS1pZCwgd2lsbCByZXNlbmQgc29vbi4NCg0K
UmVnYXJkcywNCk5hbmN5DQo=

