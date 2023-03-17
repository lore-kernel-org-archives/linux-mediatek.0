Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3AEC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 10:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRnjvJM/d5t+hNkhEbUK0wMlxFnr0KXf49brPrYZiFE=; b=l+6xQ7ZpVFUO9ok9qD0nejZlJi
	+oGUEYZbeMcizYQ86J8DVLh/0tl2sokWKONGboV6TWtHZ4B7AmEweAM39p3piU7aGYJLuoMcKAM67
	nIs7DI6A4dfrquAqhOBGXbIWcC0NHzJw7LYTImT6ZE2H/gckbKOBQHW8WdAmnoV9SxWbISkSLA4bd
	M+r/k6Jqcxkp388LT7jhjtMIzkpVX7c527eflRJJqr1Fz9OIvDdCNmGPtZaOiUv5/4Vs4W9fqCQQs
	IjnS2KvoEyzlYKjkr3hGfY7LlLVJfQeFvpjUvv6LdOBtDskmvIGMebY+mRew1ODT+VId+ybp3+4vX
	7vF/jfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6v3-001pfh-1q;
	Fri, 17 Mar 2023 10:02:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6uy-001pbB-1h;
	Fri, 17 Mar 2023 10:02:39 +0000
X-UUID: d34380b4c4aa11edb5598346aad47b14-20230317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cRnjvJM/d5t+hNkhEbUK0wMlxFnr0KXf49brPrYZiFE=;
	b=twUynwj62vxBjSgDG/kI8jcXePfsJFWovL+KxJj048JMs3MgR1gyc/XMPGTEkVeGsNFJf0BADI3zgpEutKSwkUkfkOM3vsbZ/X5RatTzNd6aV9d+rSdwDc+1EFTL2rAC5JcQGm10IIuk/yBMOj5SJUoyRsZEc58LRYw0ilPQSSs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:5c6d1151-76e0-4000-9b87-7355043accd4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:c7a590b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: d34380b4c4aa11edb5598346aad47b14-20230317
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 229066229; Fri, 17 Mar 2023 03:02:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 17:52:25 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 17:52:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkuaTuuZukmSBGbRTkdkI21RiM1qBEdVCj8DLzrSprlDSmrBY3abaEmvtSYCdfvomJOUbXc5uQeDr5u8BBHG6kEl5WIADMvba0dogs0m5xG6G6a1SKWmOwBmhrOT4zGp2+MVIf+09XRBvXNnIIYBr/S9gYPMbJ5YYr/jZhB9SU13e1FNy5knl1I9U6a+H/7DDGGBh2J62NU4+COh2XVBJ8ivnCbPlFpBP7Vdir4ZnIIf1n9ll2KJRPQYVGQzT62IO3XpV6HG3HNijAbp8/w8o1lhOBTDmG3SyG6OM3KPv4GDM8vt4CNPuD2kP7LZBlsB6ZwfThBpbW0GMUw+XjhXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRnjvJM/d5t+hNkhEbUK0wMlxFnr0KXf49brPrYZiFE=;
 b=SpMzdmJc3A+5m3VRBbKqcofcTvx/+z7SNr+YbHEo8qQlpFd6PJQGPGgus6N2z1oAd2/eZhdPcLc34kC2vS+GjZ+kIGMhO37P1SSjcG3maxI7ycPA+z5F8fo6lrFhFFC+P1UYaWrwr6D2LdAvZ3amfmlsAq2ZyFCNxK8C2TwCcbpOkp4wUXF6I1QPHlAP5YLdSotXayQ2Z117KJNgGV+xQLc4O/1VEOabKaw8RWfob+GGsSthrvN9ja8F68KsjFFvZEPTS3F7bUVRCtR3XZBeNU1WxV64fITMT3znBpu5ZrA1MJfElQsnLSrQN/WkQNhgtdCmZZDqy5E1vFWoRjrf4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRnjvJM/d5t+hNkhEbUK0wMlxFnr0KXf49brPrYZiFE=;
 b=MOS4T9dXsNe6p+fRiTGix6SWA9/uXtt+Kqmyo+87dMQHImm9l6OWQgJorcPRCAbrBizy9LzvncwWED99W82QQmz/a6K0DXf39mwMV0/LOdOol9W8hYuhU+0BZ1fXLMXmL7ZlZaTUA860hcL+tr1h3bvSCk42QRwTQz2wl7lU+Oc=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by SI2PR03MB5435.apcprd03.prod.outlook.com (2603:1096:4:ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Fri, 17 Mar
 2023 09:52:23 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::dd54:60c1:df32:bc65]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::dd54:60c1:df32:bc65%4]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 09:52:22 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "clang-built-linux@googlegroups.com"
	<clang-built-linux@googlegroups.com>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Thread-Topic: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Thread-Index: AQHZGcrXQb/1V2Icz0ST2hH4Pb2de677rZiAgAA66wCAAYJcAIAAA1eAgAA4mYCAABzVgIABVIIAgAATFQCAAAmAAIAABASA
Date: Fri, 17 Mar 2023 09:52:22 +0000
Message-ID: <5695b8e5ab8339764c646ee581529cb6cee04346.camel@mediatek.com>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
	 <20221227081011.6426-2-nancy.lin@mediatek.com>
	 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
	 <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
	 <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
	 <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
	 <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
	 <0ebf187d-972e-4228-d8a0-8c0ce02f642d@linaro.org>
	 <72cf6344a1c5942bff0872d05dce82b787b49b76.camel@mediatek.com>
	 <4027714e-b4e8-953b-68e2-f74f7a7f0e8e@linaro.org>
	 <fdd0a157-eedb-bf21-c632-79b02a4cd6b0@collabora.com>
In-Reply-To: <fdd0a157-eedb-bf21-c632-79b02a4cd6b0@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|SI2PR03MB5435:EE_
x-ms-office365-filtering-correlation-id: 78ac7168-1e59-499d-4a5f-08db26cd4e45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7/0H2MkgJrK1QvAShYMaK6pJzotLLxJo/lfegRA/K5/2qrTbZQNBOgh8qGAfQQ5V74WffmmEj6OX2VuShLKWJbs8/VuePA7nzizEYGepTFXdQH3C4/UglkNpo4O9qnwH6x80WHOJz/RttaLti7+70YaO3gAIwuMuqIqEl38schcceOW6wpXKGCsnkqrM6OrNUKZM3XA3gX76Fy4qL2sEkzPOyW1FOzLJImFsajNFw3Rsv/BjvVPqDd52/J/I87sCr6XQ/fOonE8061o/dyO9CnEHURFc+MQ2KqpEG/6YiXrexcPbAZQPPF+Y4aMHRKSi/OVvWSOWrPN3s2l+sRY7+tZklJK30+wxaH/lnnelv7b/LcLzXi0SOyPnMdK8s0sCj3i/BeSFLC46JOe5cGPNK0YLGqWHfWTRmQeZqJSZ5fjum7mHQlB0Biic9zuce2bsBdM2syg6mxQCkaNnrTmyI/KAazuz8PKe7kkfHRp5MCvIVdsso+Nues6rcN7q3jeudZAMW5jzxlLiWWItzmxS5d+zjGlni7otTtyKWodvIRL57qudfj6Kf4deWM+ZasX+WLVwXhbft9iNpuimvGCwTBHqpCUCgiLEwYNmIuZ79dlweXGxCIf5AqD2/KVbuKOU5XMZjBwkQ3KclJYhJS04LcGokjIOrQCXw0l2MVm/rvMhTLoelNt9ckG9ipro86i4bQRmeOXA6lkoOCY2vwghvA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5175.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(7416002)(5660300002)(110136005)(83380400001)(85182001)(36756003)(186003)(91956017)(66476007)(26005)(6506007)(53546011)(478600001)(6512007)(66556008)(6486002)(2616005)(38070700005)(316002)(4326008)(71200400001)(86362001)(38100700002)(8676002)(41300700001)(66946007)(8936002)(64756008)(66446008)(76116006)(54906003)(2906002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzlsWnNCUys1eS9xMWxpdzRGcEdRclozQmc1YjJiUlE0YXJSSjNlSk5naWl4?=
 =?utf-8?B?RmQ5Y2VnSXZQckwzem9aU09jOXdMWEVQczBFak9lYW12djFXU2FqTkRIWkdW?=
 =?utf-8?B?YlpTTVRVcHNia0J4NUl2ZEl1WHdBSWM5ZWFhRGpXZlcwYmNFdWwxOUlqYngv?=
 =?utf-8?B?RzNVV2FsYWU1SzgrK3l1R3Z4WEt6c2ZGamRlL1lMYmU5MitmK0JHaUoxRUVY?=
 =?utf-8?B?S2pSR1I0Njh6MDFPdjhwRG1DaG82RnozU1pLV2ZrcEdkUjFZc1BmeGYrUS82?=
 =?utf-8?B?L2NkZzZob2tza0ptUVBPUzhCSk5uNExnMmZ2My9PSDlUL0R6NjRsUDRyeE1D?=
 =?utf-8?B?UFl6Q1hZdHR4KzZYK1BTR21QT1NORmJDZ2ZORmRYYW10b2hCY1hXTlNmTXdi?=
 =?utf-8?B?VGZQaDlncjRKdTFPcjhsWnBIeDEwRW9jZG0wanR6S2k0ZzBMNWhyU1F3VDBl?=
 =?utf-8?B?cWI5UXdSTEIzV1cxQk5rVTdMTjZpaEpOV0MrL1ZjOGNFWFd2UXA1TkVpSkdw?=
 =?utf-8?B?OGxRb1MwSW5kczRmQ1VqWnp4eno5bG1VVUtWZzZnVFNvY0Zxc1RtSjlvSlN0?=
 =?utf-8?B?OWlRZXZDQ2xnMklqWUFZVXF6QzhhUytTeEhqVHZDWXNCbDdER0J2WWJvY3Fw?=
 =?utf-8?B?a3c5NFNZTmVTMGpodGVUbVFRSXYxYVFXejhGQjBLenR5VnlnNW92OEJ3K01q?=
 =?utf-8?B?MkE0cW14dkY0dGpQRGQzN1ZUM29Oc1Arc3RreDZWWlhnM0ZlQ2FlKzVubGZK?=
 =?utf-8?B?MjVRaG1KZ2k1anBmZ2hrQUlEaGd2L3A5VlV3aFdKNGhMWTlTSE14TmtYdzNM?=
 =?utf-8?B?R2JHZWtrUi9tczNXbXZHU3BzcU5kbXlyZUs3NWI5YjdDcW4xMm9razMyTWNG?=
 =?utf-8?B?RDd6MUo5Vm43cmU1QW9lTlJQTXBsU2lUNEFOanhFK2k5UUYyVFl5TFFVZk1W?=
 =?utf-8?B?bDdHdEZDTGZ3RTBXV2NBcTVybWQ1OXBpek1LQmdHTXVkTnpKOEd2aWRMMnN6?=
 =?utf-8?B?MGR6ODBmMmVZZ241Vm5mZXUyOTJnR1BPY0dtak1SSXVlUDlFM1dGYVpOcDZl?=
 =?utf-8?B?Ulh1djMxVkRtbEVpZy9zVUNmWU9CcldaOW5pR3RJVzA5Vk9iRi8wd2lERlFI?=
 =?utf-8?B?Y0toVnk2Yk1PZmlmTlpIajd0L0RwaUt1Vm5hdFN2aDErNllqYysya0Vjc3lz?=
 =?utf-8?B?NkltMnVjQ1VuSDE3UUlYTHdsaXIxV0E4UDNWSjdWTVlkcTZteVlBS1NhRGR1?=
 =?utf-8?B?d2dGbm9TS3ZSY21lUFNqQkg5Z3ZacTFTeWdCWSsrU3F6bTRwUlJSZU1oZzBW?=
 =?utf-8?B?VTdoNlBxZURWOXNGMUpJWlIrNUhQK0QyYU5rVk1xbTg0YkNMSGNxYUs2NGlp?=
 =?utf-8?B?Sk0rY2ZLdmJEZi9yQ05JdDk2YUJkdlBQaUl4cHRRZk9qUGVsMWN5RjNxTTNq?=
 =?utf-8?B?a0xWaTZDSUtTbmFzdmhacFNvcmdTRXFBd3Bvb1oxUmptUVkvZTdFUE5OSklN?=
 =?utf-8?B?L3BxM0t5UlZWdnBOT1pDZzNHOGxlbU9zZmFzVkZsaG8wdG9iRm1FcVJVS3BP?=
 =?utf-8?B?SXNEQTNQYmszd1YyNFEyQVYrS0JrWUNydSt5OVpyUk1ianVrS1daUnVhWVZC?=
 =?utf-8?B?dWg2Q0dFMHlkZ3h3YnluL2diSFZMNmZsbjVJVnl5cnVFWVFMRnVNVWdiVU4z?=
 =?utf-8?B?UXBYYTY0eXEyZS9xc2pDdVNlRm4zZEdsUmxlamd0K0xNMFNmYkFDb3RNQWtY?=
 =?utf-8?B?K1FuZFdVV0FJNWxKaGt1RjF0VkZKeVJvb1haMGZOVTNwNUxDTEpKK2JMSmNQ?=
 =?utf-8?B?SUhuNEhWbVJzTnNoY1BVVXNYZXZlOGVCQXBkN05QK3lzQlpKUU9halVNYzlq?=
 =?utf-8?B?ODFjZXlkSE9uTG8ra1pCUEsxRk1zMzV0MVVTMFpWVEdMR0pwTGtRaU5nSS9S?=
 =?utf-8?B?b09uY0lzZGJpVnhJc08yWjBUNGM2V1ZBOFVkTW1FOVdpR3E3R3FxM285cEtX?=
 =?utf-8?B?YUw2TGgzekZOaEtnL0JXb1lFQWxVdVF1RmlFRENFTWRoWkJWZm5JREcwdU5y?=
 =?utf-8?B?eERGU28yaXF0TWNpTnN5ZzVGLyt6eXArcVl3Z2kxKzR6YzZPWndVV2QwZXhP?=
 =?utf-8?B?NGhMK3JZS0lPdDBOUUtZOEpjZ2hRN2l3cGtmcU1SM243bVkwTUpIbXpGZWdx?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <119F44B48FEF214294A2E36F45B577E4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ac7168-1e59-499d-4a5f-08db26cd4e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 09:52:22.5903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X3iPqHpNBRas7NFea0wq3Yyh9TGBpgOdmcYosnCvPnOGeMJTEvvTRkOCF1zP0sre/X1TUHC1HGp2WmTBXkXi8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_030236_581438_474CF553 
X-CRM114-Status: GOOD (  24.10  )
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

T24gRnJpLCAyMDIzLTAzLTE3IGF0IDEwOjM3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTcvMDMvMjMgMTA6MDMsIEtyenlzenRvZiBLb3psb3dza2kgaGEg
c2NyaXR0bzoNCj4gPiBPbiAxNy8wMy8yMDIzIDA4OjU1LCBOYW5jeSBMaW4gKOael+aso+ieoikg
d3JvdGU6DQo+ID4gPiBPbiBUaHUsIDIwMjMtMDMtMTYgYXQgMTI6MzYgKzAxMDAsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiA+IE9uIDE2LzAzLzIwMjMgMTA6NTMsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4gPiBIZWxsbyBLcnp5
c3p0b2YsIE5hbmN5LA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpbmNlIHRoaXMgc2VyaWVzIGhh
cyByZWFjaGVkIHYyOSwgY2FuIHdlIHBsZWFzZSByZWFjaCBhbg0KPiA+ID4gPiA+IGFncmVlbWVu
dA0KPiA+ID4gPiA+IG9uIHRoZSBiaW5kaW5ncw0KPiA+ID4gPiA+IHRvIHVzZSBoZXJlLCBzbyB0
aGF0IHdlIGNhbiBnZXQgdGhpcyBmaW5hbGx5IHVwc3RyZWFtZWQ/DQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gSSB3aWxsIHB1dCBzb21lIGV4YW1wbGVzIHRvIHRyeSB0byBnZXQgdGhpcyBpc3N1ZSBy
ZXNvbHZlZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAjIyMgRXhhbXBsZSAxOiBDb25zdHJhaW4g
dGhlIG51bWJlciBvZiBHQ0UgZW50cmllcyB0byAqc2V2ZW4qDQo+ID4gPiA+ID4gYXJyYXkNCj4g
PiA+ID4gPiBlbGVtZW50cyAoN3g0ISkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgICAgbWVkaWF0
ZWssZ2NlLWNsaWVudC1yZWc6DQo+ID4gPiA+ID4gICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQ0KPiA+ID4gPiA+ICAgICAgIG1heEl0ZW1z
OiAxDQo+ID4gPiA+ID4gICAgICAgZGVzY3JpcHRpb246IFRoZSByZWdpc3RlciBvZiBkaXNwbGF5
IGZ1bmN0aW9uIGJsb2NrIHRvDQo+ID4gPiA+ID4gYmUgc2V0DQo+ID4gPiA+ID4gYnkgZ2NlLg0K
PiA+ID4gPiA+ICAgICAgICAgVGhlcmUgYXJlIDQgYXJndW1lbnRzIGluIHRoaXMgcHJvcGVydHks
IGdjZSBub2RlLA0KPiA+ID4gPiA+IHN1YnN5cyBpZCwNCj4gPiA+ID4gPiBvZmZzZXQgYW5kDQo+
ID4gPiA+ID4gICAgICAgICByZWdpc3RlciBzaXplLiBUaGUgc3Vic3lzIGlkIGlzIGRlZmluZWQg
aW4gdGhlIGdjZQ0KPiA+ID4gPiA+IGhlYWRlciBvZg0KPiA+ID4gPiA+IGVhY2ggY2hpcHMNCj4g
PiA+ID4gPiAgICAgICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvZ2NlLzxjaGlwPi1nY2UuaCwgbWFw
cGluZyB0byB0aGUNCj4gPiA+ID4gPiByZWdpc3RlciBvZiBkaXNwbGF5DQo+ID4gPiA+ID4gICAg
ICAgICBmdW5jdGlvbiBibG9jay4NCj4gPiA+ID4gPiAgICAgICBpdGVtczoNCj4gPiA+ID4gPiAg
ICAgICAgIG1pbkl0ZW1zOiAyOA0KPiA+ID4gPiA+ICAgICAgICAgbWF4SXRlbXM6IDI4DQo+ID4g
PiA+ID4gICAgICAgICBpdGVtczogICAgICAgICAgICAgICAgICAgICA8LS0tLS0gdGhpcyBibG9j
ayBkb2Vzbid0DQo+ID4gPiA+ID4gc2VlbSB0bw0KPiA+ID4gPiA+IGdldCBjaGVja2VkIDpcDQo+
ID4gPiA+ID4gICAgICAgICAgIC0gZGVzY3JpcHRpb246IHBoYW5kbGUgb2YgR0NFDQo+ID4gPiA+
ID4gICAgICAgICAgIC0gZGVzY3JpcHRpb246IEdDRSBzdWJzeXMgaWQNCj4gPiA+ID4gPiAgICAg
ICAgICAgLSBkZXNjcmlwdGlvbjogcmVnaXN0ZXIgb2Zmc2V0DQo+ID4gPiA+ID4gICAgICAgICAg
IC0gZGVzY3JpcHRpb246IHJlZ2lzdGVyIHNpemUNCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgaXMg
d2hhdCB3ZSB3b3VsZCBsaWtlIHRvIGhhdmUgYnV0IGl0IHJlcXVpcmVzIGV4Y2VwdGlvbiBpbg0K
PiA+ID4gPiBkdHNjaGVtYS4gVGh1czoNCj4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gIyMjIEV4YW1wbGUgMjogRG9uJ3QgY2FyZSBhYm91dCBjb25zdHJhaW5pbmcg
dGhlIG51bWJlciBvZg0KPiA+ID4gPiA+IGFyZ3VtZW50cw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ICAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZzoNCj4gPiA+ID4gPiAgICAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5DQo+ID4gPiA+ID4gICAg
ICAgbWF4SXRlbXM6IDENCj4gPiA+ID4gPiAgICAgICBkZXNjcmlwdGlvbjogVGhlIHJlZ2lzdGVy
IG9mIGRpc3BsYXkgZnVuY3Rpb24gYmxvY2sgdG8NCj4gPiA+ID4gPiBiZSBzZXQNCj4gPiA+ID4g
PiBieSBnY2UuDQo+ID4gPiA+ID4gICAgICAgICBUaGVyZSBhcmUgNCBhcmd1bWVudHMgaW4gdGhp
cyBwcm9wZXJ0eSwgZ2NlIG5vZGUsDQo+ID4gPiA+ID4gc3Vic3lzIGlkLA0KPiA+ID4gPiA+IG9m
ZnNldCBhbmQNCj4gPiA+ID4gPiAgICAgICAgIHJlZ2lzdGVyIHNpemUuIFRoZSBzdWJzeXMgaWQg
aXMgZGVmaW5lZCBpbiB0aGUgZ2NlDQo+ID4gPiA+ID4gaGVhZGVyIG9mDQo+ID4gPiA+ID4gZWFj
aCBjaGlwcw0KPiA+ID4gPiA+ICAgICAgICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9nY2UvPGNoaXA+
LWdjZS5oLCBtYXBwaW5nIHRvIHRoZQ0KPiA+ID4gPiA+IHJlZ2lzdGVyIG9mIGRpc3BsYXkNCj4g
PiA+ID4gPiAgICAgICAgIGZ1bmN0aW9uIGJsb2NrLg0KPiA+ID4gPiANCj4gPiA+ID4gdXNlIHRo
aXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gPiA+IEtyenlzenRvZg0K
PiA+ID4gDQo+ID4gPiANCj4gPiA+IEhpIEtyenlzenRvZiwgQW5nZWxvLA0KPiA+ID4gDQo+ID4g
PiBUaGFua3MgZm9yIHRoZSBjb21tZW50Lg0KPiA+ID4gVGhlIEV4YW1wbGUgMiBjYW4gcGFzcyBk
dF9iaW5kaW5nX2NoZWNrLg0KPiA+ID4gDQo+ID4gPiBCdXQgdGhlIGV4YW1wbGUgaW4gdGhlIGJp
bmRpbmcgaGFzIDcgaXRlbXMgWzFdIGFuZCBkdHMgWzJdLiBEb2VzDQo+ID4gPiB0aGUNCj4gPiA+
ICJtYXhJdGVtczogMSIgYWZmZWN0IGFueSBvdGhlciBzY2hlbWEgb3IgZHRzIGNoZWNrPw0KPiA+
IA0KPiA+IEFoLCB0aGVuIGl0IHNob3VsZCBiZSBtYXhJdGVtczogNywgbm90IDEuDQo+ID4gDQo+
IA0KPiBLZWVwIGluIG1pbmQgZm9yIHlvdXIgdjMwOg0KPiANCj4gbWF4SXRlbXM6IDcgd2lsbCBw
YXNzIC0gYnV0IG9ubHkgaWYgbWluSXRlbXMgaXMgKm5vdCogNyA6LSkNCj4gDQo+IC0+IChzbywg
ZG8gbm90IGRlY2xhcmUgbWluSXRlbXMsIGFzIGRlZmF1bHQgaXMgMSkgPC0NCj4gDQo+IFJlZ2Fy
ZHMsDQo+IEFuZ2Vsbw0KPiANCkhpIEFuZ2VsbywNCg0KSSBzdGlsbCBoYXZlIG9uZSBtZXNzYWdl
IFsxXSB3aGVuIHJ1bmluZyBkdF9iaW5kaW5nX2NoZWNrIGZvciAiZXhhbXBsZQ0KMiArIG1heEl0
ZW1zOiA3IiBbMl0uDQoNClsxXQ0KL3Byb2ovbXRrMTkzNDcvY3Jvcy9zcmMvdGhpcmRfcGFydHkv
a2VybmVsL3Y1LjEwL0RvY3VtZW50YXRpb24vZGV2aWNldHINCmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZXRoZHIuZXhhbXBsZS5kdGI6IA0KaGRyLWVuZ2luZUAxYzExNDAw
MDogbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6IFtbNDI5NDk2NzI5NSwgNywgMTYzODQsDQo0MDk2
LCA0Mjk0OTY3Mjk1LCA3LCAyMDQ4MCwgNDA5NiwgNDI5NDk2NzI5NSwgNywgMjg2NzIsIDQwOTYs
DQo0Mjk0OTY3Mjk1LCA3LCAzNjg2NCwgNDA5NiwgNDI5NDk2NzI5NSwgNywgNDA5NjAsIDQwOTYs
IDQyOTQ5NjcyOTUsIDcsDQo0NTA1NiwgNDA5NiwgNDI5NDk2NzI5NSwgNywgNDkxNTIsIDQwOTZd
XSBpcyB0b28gc2hvcnQNCg0KDQpbMl0NCiAgIG1lZGlhdGVrLGdjZS1jbGllbnQtcmVnOg0KICAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5DQog
ICAgIG1heEl0ZW1zOiA3DQogICAgIGRlc2NyaXB0aW9uOiBUaGUgcmVnaXN0ZXIgb2YgZGlzcGxh
eSBmdW5jdGlvbiBibG9jayB0byBiZSBzZXQgYnkNCmdjZS4NCiAgICAgICBUaGVyZSBhcmUgNCBh
cmd1bWVudHMgaW4gdGhpcyBwcm9wZXJ0eSwgZ2NlIG5vZGUsIHN1YnN5cyBpZCwNCm9mZnNldCBh
bmQNCiAgICAgICByZWdpc3RlciBzaXplLiBUaGUgc3Vic3lzIGlkIGlzIGRlZmluZWQgaW4gdGhl
IGdjZSBoZWFkZXIgb2YNCmVhY2ggY2hpcHMNCiAgICAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2dj
ZS88Y2hpcD4tZ2NlLmgsIG1hcHBpbmcgdG8gdGhlIHJlZ2lzdGVyIG9mDQpkaXNwbGF5DQogICAg
ICAgZnVuY3Rpb24gYmxvY2suDQoNClJlZ2FyZHMsDQpOYW5jeQ0KDQoNCj4gPiBCZXN0IHJlZ2Fy
ZHMsDQo+ID4gS3J6eXN6dG9mDQo+ID4gDQo=

