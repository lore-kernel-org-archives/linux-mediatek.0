Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43971C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvEdrJjSyIi9FmqtnTFdOEweRyNMcuNEXxqemkImADw=; b=QlM8ao/jQ4jvUzxxOc4vadZmn0
	3UyqMJPtvO4GcRVc03Eep1JqsQbgSSiRIJtwffFvuzd25QB66/qWllRw1Vxn3a78xu0Oc8p/cT62M
	J3lJ1HniIvFkZ00oDjKMH+3UWo+t1jFYmW4AbXbeQqj6j3ltHukmt/RCDz3TerQuzaMhOGTbudWz9
	gCYZOmmhFPtRp3iq9gsg5vNz55Ul6HNxBZFRESnSpcAjEpB/cjaX+Ir4Yzh92x2xf72L1f3wOhdFW
	B9Oll1uyaDlRIPpGaJrGiZF/G7y325PGZJnmA812EklHd7cEVZ/ndH9MLd0zg90ogNyVrlTxwrjal
	Oo2B4LJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqt9k-0037F8-A0; Fri, 04 Nov 2022 09:38:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqt9i-0037EA-5h; Fri, 04 Nov 2022 09:38:31 +0000
X-UUID: 8fea570da1f94211898dbbc74cef93f1-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=EvEdrJjSyIi9FmqtnTFdOEweRyNMcuNEXxqemkImADw=;
	b=eJKArHsFxxuUuyvsiiqZeTZoNDLynuHjPH6PXltPk/CDpaaG56r+C6skTG3aVqtj1zEDyax9GO56dVwVyF6PsGbq8UPpxFrCB0cxTpoUa9R7+szQhaje/Oh6jctWnvNm+mzzihv+VsXQo5O755heaBs4k2MdH5uH2tHdLIH+Lck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:3b26e49e-65c6-4ffc-9a23-c67afc950013,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:1cb29990-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8fea570da1f94211898dbbc74cef93f1-20221104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 456223710; Fri, 04 Nov 2022 02:38:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 17:37:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 4 Nov 2022 17:37:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbWsKdIL8vXdYOm2j1sWvNpTDLSLpVfjfMaozSHTwrAqRe3wjhZCcT/xkYToLfTj18qMjW0Zx5G7bPhM9CgEhhxazRJ0ion2OOmbSES6mKP2dnlv4qZxy+aab36ZUT/nOZ/kbejZ43J7qI3EXkIvcZjGN0rPXkWZZAILZX8QR8SLpELKPyS2fQAgAiXIQNss7J8Rg/VWZIQZnIDgSmYfyoucaJfR2nzF6ziOGPlwDsoBiMICI4WxVCxtXUlgVMRW+aSUgWA94bZw3WvHRIrsvL0MGio52bdR80wURsiwvD6fUmPr/3deRtW7imzlyeu2AQKrme2+Q7POqvAyEufbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvEdrJjSyIi9FmqtnTFdOEweRyNMcuNEXxqemkImADw=;
 b=O25DoypCM7cbPiI8GAzG+bOohsqOVKC29a9Pqh6QsQYEP23ejTu/hsEfJU6xnwZIBrBYC2IzlDXlnjZhqR+gCkStAPBI5L7Jwha7bLHkkLlAyXSG5oACbNx3o7Y346MrVksGMzOzir2hprOzpwpyVM1YQ9LNI4fwpIVD3WTEQVvY9dxL5qkycaWoH2b4nOVNS5Y+gotvEqK0r4TKVleiGx3Xk9O4LjIE5kdsVU+Tx36+pC6QLEqnbr/xGtD5VF8lS7XJYt2ZqOHk8Jk52R574z7AtETR/mzcJX4agPjPAbjv65OKntMwc4Dv2dXpiKsO6dJ0fmjiTlSJhrAInUPIsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvEdrJjSyIi9FmqtnTFdOEweRyNMcuNEXxqemkImADw=;
 b=fY1+MKxJH3n8+t+CfFM83HHXfkg4d/1kVt9K468Q/ra8RQ6tYCmAePiF1rDriU6lW9rwjyFqQGbnT8IbrNKBB2FgmZaWDH63u4u1+7NGZxwpyOnUcZbJsg8Ftf2vHzV9+nLgwWM+PFgUgTEVZexYKsz4ix/omCpGW22RByNoWLY=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by PSAPR03MB6234.apcprd03.prod.outlook.com (2603:1096:301:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 09:37:29 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19%7]) with mapi id 15.20.5791.020; Fri, 4 Nov 2022
 09:37:29 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "nfraprado@collabora.com" <nfraprado@collabora.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel@ffwll.ch"
	<daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>
Subject: Re: [PATCH v27 2/7] drm/mediatek: add ETHDR support for MT8195
Thread-Topic: [PATCH v27 2/7] drm/mediatek: add ETHDR support for MT8195
Thread-Index: AQHY7zQjpIVEF/5XUkm/CB1yRDcjA64tsPmAgADSuQA=
Date: Fri, 4 Nov 2022 09:37:29 +0000
Message-ID: <aef16e8fb787491e4cdba4b472f73aec38efe21c.camel@mediatek.com>
References: <20221103032610.9217-1-nancy.lin@mediatek.com>
	 <20221103032610.9217-3-nancy.lin@mediatek.com>
	 <20221103210315.lm2d3n4uolra44no@notapiano>
In-Reply-To: <20221103210315.lm2d3n4uolra44no@notapiano>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|PSAPR03MB6234:EE_
x-ms-office365-filtering-correlation-id: 1a63af73-2cb5-4b5e-a4e6-08dabe4830ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P7qEI5sDZNWP/rKeZtlrXBYfX4Z4IdGUqsWrUur24MssKQtHUtzRM+uxG55ZBMoitGavvgJQzd94Jwc01XacNUDQ7ZH5DJPAJ8OB8b/1Sk8tKIt6ENfiMjYwWJ4iC+qeV8y2yMB1/EwOejwwt8U1H/REkuyIDdJG8cuaYTwRsCp6mYcM8MD14M0y+HbT0VEQ4ZMvdvI20rWzntZ31Av5yCc5oB9HZoQGzLcGp0X/R9UitjpKw7iih2nmq31gIli6AowWD9iQH4IOfDHFbBiuWg042ibAfKBF7ocXDEp0epoDj+aybC7AahNXR0e8KlXV1DtawZ7HAvdU71ErkL3TF6IQrvup+k2Ljj7v+Cj4I6vVwQADM51352wOaQbSm7YfviKTr7rVvjDkZEMrwUqtn/AhclwEMd3GcAvuu6wz7HZqR/vL62lBVBWpPdArZiASNZVy17MuGNyyYnLc/MSJjWFoX8oBOlPUKyGokid01q5EPFPbQegIFq73Us31xPpxzSYOpgIpYA+dHS/Jc12G7L2fn+WwVCJ6of72WUf+sRTgjjXXt9g1LN4qP87LtrxC/L2TyYE0F3G3TIzqtB4ImZNIguTNGvAFxbQk56kn9RXaNdbJZp73CsMfDY7Wgf8IJUCWUw1OttDkfNgwGdYo015cS+/x725B5z1xa0JUOyvwnJnvzAZrn0viCZRIAQ7PrlQF1mUVQQ4TkJZqvBut+TenJ87dSbPB8O0Ep0patXcMg1SFxie45dQK6SM1rJqIe9tn3kReYuoyV4ZLxF2TsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5175.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(38070700005)(86362001)(8936002)(4326008)(41300700001)(85182001)(36756003)(8676002)(66556008)(64756008)(76116006)(6512007)(66476007)(66446008)(66946007)(4744005)(186003)(5660300002)(2616005)(7416002)(6486002)(478600001)(71200400001)(6506007)(122000001)(91956017)(54906003)(6916009)(316002)(26005)(38100700002)(66574015)(2906002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGo3RVl2MHBES2V6SDR2cUdWdGxxZ2VITnVCa2FFckZXRGRBU0NnRE5YRDd2?=
 =?utf-8?B?TEt1aldQcnI1MldiMm93Y2s5YUt2RUlocTFnQVhMNUwvSWFVbTNJYThTZmVv?=
 =?utf-8?B?ejM3MjJrb0Y0SGYxVTZzV1g5dGZvQUgzS3hFZjRQWDdRcWdTaEhvUG8rNTRR?=
 =?utf-8?B?M0ZKbWowV3pPMXErMHpUYnI5TTRERUJ3aXZsRVl0Vk5sY3NhTHZ3eXFlOXpP?=
 =?utf-8?B?SDV2cmdoa3NLUWJWYkFXSzIrcXZiSWFZaFhyd1dBNmpZKzNOZHNWVitIMXQ3?=
 =?utf-8?B?SWwyZHJWb0FKLzRuMUY4ZWRUcitxdVlpYWZ4U3oyYzlIclB0TG1DV3B6NVJV?=
 =?utf-8?B?ZExnaFBteU5adTBNWnpXT3lPd2JzYWJNYzVlVGVLUzVEUHBMd0tuZnhSNU9H?=
 =?utf-8?B?UzN4LzRRRlV6SkdMS1JKY2VzakZvTW5JV0dlSHFNTEtyNzltZEMwT21IdndB?=
 =?utf-8?B?clNld1QwTnVNUERWdm00VnpwSFVLaUwwOFkvKzltbFVSTjRETU9lOFhhdUNI?=
 =?utf-8?B?blNybkN3S2ZYcm9FSDNBV1ZSR04xY1d6a2djQTFrVW01SkNKMWsrV2hEQmJh?=
 =?utf-8?B?a2JuNHA0cjgvQ21veGRGcy85RXh2NEszL1paMFBqc2t3dWJ3U1NrOThnUVpM?=
 =?utf-8?B?Rk9jL1V5ckc0WWRuR01CQU9BNmRuaDQ5c0xPMXBJMjMyaVU3a0pJTFFVdlBP?=
 =?utf-8?B?eTRCQTZLY0w1eWRuR1RxUTBKRDZUY2RRMWxmTWpXVk9oeTN5VUtSajBLeGFa?=
 =?utf-8?B?RHpDQUtQZWpDTDVoNnF1UEZydlJldE1aYUEwcCtaa3F0VEFJREhSblNubzVn?=
 =?utf-8?B?VzlSd2RJVjJJeVFIMWpIL1VmQVI0RDFzcVU3MTRFL1BrQkNueWJsWDdBQkxo?=
 =?utf-8?B?R0Exd2pGVW43d05iU0gzVDUrcVFXdGp4bDI3QjV4TldXVUVGOEZHTkt1aFg0?=
 =?utf-8?B?cmRMN2E2clhTUGJ2dnRlY0xKdnRRVm0vSkdOYXhpUlR5bitiNGVYelFWOGtV?=
 =?utf-8?B?N3RJSnlmTC9IalBrWGdwQU93VTZranlDRE8zOTZ4TFZhYVBwaHN5aWZielBk?=
 =?utf-8?B?dWhqL1lvNGdNNUFyak1LZk1MNEhiR1l6d1FsempRQWE5VGJIdGNUakR1aWtC?=
 =?utf-8?B?WFdINDdsV2hoVlB2ZFoxeUd4Zk1aRG44L2E4bHBlUU04WUZFVUIyQlFHWE5M?=
 =?utf-8?B?VlB3cjRhaGZ6dWgxbGYxM0VhZGNyUzFnN3MreVRhYnZieWY4SUtieXhNWGFp?=
 =?utf-8?B?RDBWVDYwYzdNem03dGdhRngxOUEyL3ZBT05kbG50dTQveExUcUREVnBYVmsx?=
 =?utf-8?B?ZkdMRE01WE5BZ1dyQTIzMmNzUUNhVUZjQzhuR3V3aHdrWVFjdkorYXJFRU9K?=
 =?utf-8?B?a3RSQTdiTWhjeEZoZjhJTU1IcHZ6UzdoOEowMEtHdWRhdHV3c3UrQ2hCall2?=
 =?utf-8?B?R00xY3lyYTFGRitFaU5sWkdzMlFXdXRSM3VQemVhNXVQa0wzU1dGYnZvYVYv?=
 =?utf-8?B?RDR6S2FpcGRyaXhUYi9mRW5ZY0h1SHV3N3VXZ2UrdkxIcDRFY1F6ak1IZW9K?=
 =?utf-8?B?MWZHOERrSVk0R0ZsSTRoNHBtdS92VFk5eldQVW1BMVMrcXhnY1RrWERwVWVy?=
 =?utf-8?B?NnJkTzJJWm9HZmxqK0MzaWkzNXBGL1pZTmZvWjdiSjNocDAxcm9yOUFHcTRK?=
 =?utf-8?B?VXA5Sk5RKzV5RWhsc1psK2RmSjhORTJOTXZFeXViTkRMUG1mRkh3ZGV0aU1o?=
 =?utf-8?B?OHlKelVjVSs2YmcyQjMzdUw0cC9wQlZxcG9hc2xMYU4rb0laV0RqNFh0NW82?=
 =?utf-8?B?MzlaOS9RdFlNRHlPR3hmdTJFYmNwQ3RyUjhZRG91UisxZTdWeWVBcE9XTml4?=
 =?utf-8?B?Y0tnUk9ubCsvaTVQNWNIYzkwOVRYWVhtNUhWWlhxV0hib0N3QWlTMm1JNDdL?=
 =?utf-8?B?NHlkU1Z1WWkyYVY0Z1JMeWtrTmlySWpXUngwR0JKYVgrVkpONHBWcTNqZjEv?=
 =?utf-8?B?RXMzdyt5QzdXcVlRM1dKT2Q4bW9DNFlHekFCdTFJandtSkY3Ujh4a2luZXZm?=
 =?utf-8?B?TzdSb0tQbzVYeEN1cDZMVHQxS21SVGpGbGlLTHZiMDhUV05YQ1dsUjhJdVlU?=
 =?utf-8?B?aWFRN1IyZDYrUURRRnM0KzNxOVZHQzhPTFozQ1JwR3l6Zkx3T0ZjeSs0ODBl?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A89DB71564C5348B6DF978C5F613121@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a63af73-2cb5-4b5e-a4e6-08dabe4830ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 09:37:29.3484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fam0k0yYLZHPmuCN945u/HdnUlp/7BvhpLiT4UCszAlSYYoXepuHhUpThCC4auh5WkHRmHWSR88hUrI86uv9WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB6234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_023830_239948_2196AA9C 
X-CRM114-Status: GOOD (  12.58  )
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

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMi0x
MS0wMyBhdCAxNzowMyAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IE9u
IFRodSwgTm92IDAzLCAyMDIyIGF0IDExOjI2OjA1QU0gKzA4MDAsIE5hbmN5LkxpbiB3cm90ZToN
Cj4gWy4uXQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2V0aGRyLmgNCj4gDQo+IFsuLl0NCj4gPiArdm9pZCBtdGtfZXRoZHJfdW5yZWdp
c3Rlcl92YmxhbmtfY2Ioc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiArdm9pZCBtdGtfZXRoZHJf
ZW5hYmxlX3ZibGFuayhzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiA+ICt2b2lkIG10a19ldGhkcl9k
aXNhYmxlX3ZibGFuayhzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiA+ICsjZW5kaWYNCj4gPiArDQo+
IA0KPiBBcyB3YXJuZWQgYnkgZ2l0IHdoZW4gYXBwbHlpbmcgdGhlIHBhdGNoLCB5b3UgaGF2ZSBh
biBleHRyYSBuZXcgbGluZQ0KPiBhdCB0aGUgZW5kDQo+IGhlcmUuDQo+IA0KPiBBcHBseWluZzog
ZHJtL21lZGlhdGVrOiBhZGQgRVRIRFIgc3VwcG9ydCBmb3IgTVQ4MTk1DQo+IC5naXQvcmViYXNl
LWFwcGx5L3BhdGNoOjQ1NDogbmV3IGJsYW5rIGxpbmUgYXQgRU9GLg0KPiArDQo+IHdhcm5pbmc6
IDEgbGluZSBhZGRzIHdoaXRlc3BhY2UgZXJyb3JzLg0KDQpJIHdpbGwgZml4IGl0Lg0KDQpUaGFu
a3MNCk5hbmN5DQo=

