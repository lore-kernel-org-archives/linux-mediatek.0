Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E79C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFEHe+7kyac9+TwVlNk8AKjZeqS/JsUGXKztqZOIRxA=; b=VseL3bP1uQz9atHqLIrJ9Avoz1
	CIVNX98kKHSx1kpONUtev7nY3/XZjy3QzWhgbkF3Zb9d4P/YPzGJmy342eD1vBguN2pcVWNCd9i9N
	kH5c6JCH1i1ei33Sfxf1N2xNMEoSNUThClBFPMFx9ojxyM9AyqthhWUGpKOSfx8B82LnIz1pLoIXg
	isSVwIWU36RyBSNnPvCT8jh8TtFc3FOrBdj2iRuokzoO1iN5jW8Br3DJoKYAZSJXrw3XtJgah8Tx3
	vnV6f4ltR7+yt5yixqNGTVN04tcQ2HeIo36x2AV6/+Jji1OGR/YLhBM6UC7Zz1sSLMQMKhNXJJ3Ok
	a6obYJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGNF-001UIx-1J; Fri, 13 Jan 2023 09:29:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGMd-001U1v-5K; Fri, 13 Jan 2023 09:28:45 +0000
X-UUID: a8dd73c8932411edbbe3f76fe852e059-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sFEHe+7kyac9+TwVlNk8AKjZeqS/JsUGXKztqZOIRxA=;
	b=EMWRrwfNYoHmIOAoAc3VkQQC0wz+4qyIUe9GderAF9Pj+Y+zMSjlCRXoO4fPRvS2l6VDTGHmxCcTBWKYvpbjg1rFOYQVG+eW6Aoe8INIIOxVL+lVBYs2dy3mCYpYvL3ENJ7h+qFHAJHUamc8RPhqfRuaocj7Auj0ieIYvlg9zwo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:8efd5c3a-f00b-4f04-b7f9-c0845818ff5b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:e3619154-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: a8dd73c8932411edbbe3f76fe852e059-20230113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 589229517; Fri, 13 Jan 2023 02:28:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 17:28:03 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 13 Jan 2023 17:28:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvXS6rIR9IxrSKdBjeb3/psNR7Aw9F7jUYDHjA/LWWZPSHfFBbQ3Ws6BpUQP7jPt6a92jsagFSQmJEZdlkRgUd4KF87zQj28/i+VW8Lo20LpQZflMf2KuWZpRjVmyZunYnWjVK7L1Mbb44X+TEjGxyHnpMwg6BSomnyootXoVfJTGDHyoXqaE5/prducmSG/lPl+UBfq1x08bVjMD2+JJYHtpVSf/PtM7VC4p6vqwnZgXxrkzESFSNB5ZEXSUHQRNvsiIA3sOdfBWqtSUp2VYmdNX6KpNixmABuK1qWQpfHB49scoxQxTSDKE8vGh3UFZfMre4p7wYA9uF1DkvqzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFEHe+7kyac9+TwVlNk8AKjZeqS/JsUGXKztqZOIRxA=;
 b=ld1erZm3myWBn2KSyPjxcP/GYytuGBZ5GdmKZiZl6Rswi7d7pn0Jb7og6NrARLk56fj6YjEkVangYDOe68Ti5d2P6wQdrH5O+erMXRT1UGVKWw4GM1pR132EvAII/y86904dLDHOCPy2WOt8Q3VvRpQyxYv/9qZRSGxcTneo2z+5+2JpheJy7H8mwUNG36POaZfH8GUl9UrFgZdTlbskvcky9Lqh72NrYljsUHZUx5g9lZNlPy96swjrTjqFJA62vpoPWka98kQUC2ZzGJi9AIBWzKUH+BYfntF3zNLesSuRrBkIjYRZi4TMvDM/d3L6qDmtg+/Lyce7m7YUgE1NUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFEHe+7kyac9+TwVlNk8AKjZeqS/JsUGXKztqZOIRxA=;
 b=BhnONllX3tyD9Mz8/ww5myCdESdCpAhOonIApaF+512s/e7G/qgz4rgb4b1R9FSh3We3GXw5EGSw50FhnR+UOTiJIZ1xVu6cORdz2y5jbuOH0SlsbmyTXUWLpBG7lGbPR/ff5vDX6kgbq2cDUUUHmv5KkdLhLRLnnyNYqc5+K/I=
Received: from PUZPR03MB5964.apcprd03.prod.outlook.com (2603:1096:301:b4::11)
 by TYZPR03MB5711.apcprd03.prod.outlook.com (2603:1096:400:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 09:28:01 +0000
Received: from PUZPR03MB5964.apcprd03.prod.outlook.com
 ([fe80::c43a:ce45:4a27:bd80]) by PUZPR03MB5964.apcprd03.prod.outlook.com
 ([fe80::c43a:ce45:4a27:bd80%9]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:28:01 +0000
From: =?utf-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?=
	<Kuan-Ying.Lee@mediatek.com>
To: "dvyukov@google.com" <dvyukov@google.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "andreyknvl@gmail.com"
	<andreyknvl@gmail.com>, =?utf-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?=
	<chinwen.chang@mediatek.com>, "kasan-dev@googlegroups.com"
	<kasan-dev@googlegroups.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "ryabinin.a.a@gmail.com"
	<ryabinin.a.a@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "glider@google.com"
	<glider@google.com>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH] kasan: infer the requested size by scanning shadow memory
Thread-Topic: [PATCH] kasan: infer the requested size by scanning shadow
 memory
Thread-Index: AQHZH0jgINbB3ihm8EOrOsTiVH1z6q6VruoAgAZcVwCAAADLAIAAGAoA
Date: Fri, 13 Jan 2023 09:28:01 +0000
Message-ID: <1804519e5b05793f2c121c407b3633c4bd8e67be.camel@mediatek.com>
References: <20230103075603.12294-1-Kuan-Ying.Lee@mediatek.com>
	 <CACT4Y+b5hbCod=Gj6oGxFrq5CaFPbz5T9A0nomzhWooiXQy5aA@mail.gmail.com>
	 <edbcce8a1e9e772e3a3fd032cd4600bd5677c877.camel@mediatek.com>
	 <CACT4Y+Yx+8tjTvE5oR3qzHa4oMoPoj=+BTgcFZHA8jwxgtp1Pg@mail.gmail.com>
In-Reply-To: <CACT4Y+Yx+8tjTvE5oR3qzHa4oMoPoj=+BTgcFZHA8jwxgtp1Pg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB5964:EE_|TYZPR03MB5711:EE_
x-ms-office365-filtering-correlation-id: 6e6da515-c948-4698-bf53-08daf5487775
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B9ZyieW1D9P3s/CgOOmJ92w4c/o93wtwqrHoebSo3pXqkZi8UBV1UKAvAu/zOu1YppS07Zw0oLILFzmRaRXd88BsFEuUYt5cueVV/oDKAAyRmrFXM2E5E+uHvplAwvqW8Ry64bJoCJnfpddFhUej918IOTbyfd0fC8hR0E5zSyBAnRxzVnLEtVfN6mN752qlgWI/DuLWa9Zfpp82+BNSZ4z8sQ773vIXej8knJhsxASIBcKzA091ffRxlrl2VH6K6iZES0owOS3axaJOIG7pWWkxCrW0XFnepSpxXsJzcHwL+OFMf1pYNkCbSUYd7i0UrpvIiAyfGnSzIg75hbB03Oys5jnfLa/tCi4aqDPVVQ8PYU5WzivOt2zt4QvklKaOhEzV02tVP4YYxnsFqXgyegMBveXSqdZh9np8q5ewO+EZ1rkp1MqV5h7IRvQUNrY85DukckxcSix+mNxvmYDUF7ZR4vnyX7kofkTOfPdfzy4h1ErJ6+FXqte8BYQbtENKrD1ALh0bXnD8/osPvZEDiZzi7OiZ+5lngwMGIRaJGCJVMpPYdgG1g2RtZtzMGguTNeiabhgjIAP8XsO551bp8CrEZKzO3hS+cELMvgRkTKVOVk03qeJYt4HOU4OfJH9iamPkXrSVcPpUrOUHneIAdUQGH8aXLBfobovKeH0LWSiXtxu/sWTtE30gKm2hyXZQsl1IkgWiKgM5ZjCrucPfQunlk5gJXKioadUrknvnBQsar9Z37+GNaPg/mjgW769iik4mkrqpycKX3OT6Qjrm6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB5964.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(66899015)(2906002)(54906003)(316002)(5660300002)(8936002)(36756003)(85182001)(86362001)(7416002)(66476007)(41300700001)(122000001)(66946007)(4326008)(64756008)(38070700005)(91956017)(76116006)(66446008)(38100700002)(66556008)(26005)(6916009)(6506007)(8676002)(83380400001)(2616005)(6512007)(71200400001)(186003)(6486002)(966005)(478600001)(99106002)(505234007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2FMV2l3dE9qOG51ODUrYURoTjg1RG9WTGJ2QlBYT1p5dGRlM250Wk1UNXB2?=
 =?utf-8?B?TGgrMTRDYmRVZzdYbGwrRWYzOUN0N1MyZ1JtdTlUNjhpbzZXZnBPSjRPUGFY?=
 =?utf-8?B?THJVclhrY2lndE1tZ1o3NEtlVEZGQmhtbS95QVZVVEV2RSttWmJmcDg2WVJ6?=
 =?utf-8?B?WGpIdkpaMkdFNFkwTlVyM1Y2dXNQNC9abDlTU01GRll0L3d2QnFFNjJNVHZw?=
 =?utf-8?B?bXgwV0V5MHg0ZFBpOGxSdk1vYnBVRmRNVmRmY3ZKOVJSOFEyaU9HRFArR3Nw?=
 =?utf-8?B?Q1hnbXM4cjd6L1l5MDlNVWFadkpiVTZxYVhJL3VuZEc2ZlNNb3pBaEk2NGVX?=
 =?utf-8?B?SXVBOTFWMTFTRWFZME4xNUpwb2t1QTh3eHEvYkpYdmZ4V2ZUbDZoTG5IY01G?=
 =?utf-8?B?b2k0ek1xWWVFWlBlUkdLc2NQbmtZOUd5SjNKck9ncWhGWEEySnAyZmtIc01S?=
 =?utf-8?B?bW5jZ2xxd2Uxc05oUmRlVkNpa0FmcHR2ZzV4TlVLVWxOUjZhTXdIZzNYcTBQ?=
 =?utf-8?B?MC9qc2JJVDhia2FJMjNWUlN1RWVXWEMrelFsbGhqR2JPNXBDOTh4YkpEd2Z5?=
 =?utf-8?B?QmQvVUFrY05BSXg0NXJ6cDJ1NjgvbUhPS2lOQXhKSjBQSjU5TXBxWEF4TUpy?=
 =?utf-8?B?WHJQVFUwUkh3T0ZLam5JcFIzU08xTnVaNnZmM2pOaEgzRVpGNXYyUytkSGVv?=
 =?utf-8?B?N3lscnRJWkoyVXlhSHVXb29zcnN4a0o1ZWM2eGJvYlZCSWpYaDVKcTBkZjB6?=
 =?utf-8?B?dDNFZ3VmY1VTUithZnE3cVF4UjZYZENiZXZkNmRxVmJ1VEZkY2hrS0RpMzdn?=
 =?utf-8?B?QVd2RU1meEZSS2d1dzVHa3ZnY2k4VURoa3lyb3dOL0pvNFZ2UmMwNzZpV21k?=
 =?utf-8?B?WHlCdGN5Z0o4TDZ1dlMwYVk3cEdtdDd1cjBqWTVFSkVRY2dKTG9YbEh3d2h5?=
 =?utf-8?B?b1JWVDVEWENLSkZaZ0twSGdGUyt1ZnhpUDFKZENSRlV4dXVBakZMUlhvMlIy?=
 =?utf-8?B?MEhvbjQ2T0F5VVd6aGxHSjJna0xUbmxWLzYrZmUyMjZGbVdJaWRPMFdhMEE0?=
 =?utf-8?B?Tk94ZXZTRlNaVWRZRytybndTOGpRd2ovNjZDK3JkeHFZaG1lcyt6bDFSWFZK?=
 =?utf-8?B?bzNzTE03RmFZL0taZHcwTm9QNjlCYVJWbGgyNVRJNjJGUHpuTzA4Z2ZiMHA2?=
 =?utf-8?B?cFJtT09zaERXK05hKzhNOWkyK2p5MUV3NDZFNHovRUZxT2IyRUQ2NU5nY2I5?=
 =?utf-8?B?OFJXVTY2SnZPdnNYS3pWY1JQSUdoWVFXaW90T1l3MzV2Nzg4Uk11NDl1dUhS?=
 =?utf-8?B?S0UyV2M3andmQitKc25Rd0I2VlJIeFdoUDc5MFpIQ1FmYmZlM016YkZnRlBF?=
 =?utf-8?B?dTY1WGZLZFlXTFNVZzJBZWtRVzZVS3Jyc3RGbWNSU1hCYmNPZHAvYnFLUFFR?=
 =?utf-8?B?WTdNR0Y4eFBtZ1gwd2RXUE1rc3d0cmtGYzM2UEEyQ0ZPazZuWlVBbzZsamJZ?=
 =?utf-8?B?R2FWTU9HMGlxTGlaRHgvUEx0VDRRWm9lQU1YY2ZvT041QTduQ0hsYTN2OW1a?=
 =?utf-8?B?SXV1dk4wNFF6d1p2S2dvSDBRcmRsQm81cGpOZXpWNWlpOVFRSlNHOE5Fd3lX?=
 =?utf-8?B?ZEd0bDkzN0N3WmdPY3JDemdaVnhKTVhuM2Z6YzRFWHhRRTIvckg5RE41TlhI?=
 =?utf-8?B?b2lHMzBIQmNMc3NzTFVFbGU1VTlTdHE0WThpazRkcGZKcUdxYk9UaFZnTEc1?=
 =?utf-8?B?VXl0TjVodUNRNUYvUG41Q1A0eERpVkppa3lWNmVoWCtEVnkwSjNTUU83UXRa?=
 =?utf-8?B?QWpOMkFrbFJ3RTdRWDlqeXpxVlc4Yi80WW1MdFZUNzdGK0N5aDBxaUtzYVdC?=
 =?utf-8?B?VlN6UituU05YZG01UUt1eVlGRWpHcDVaN3M4ZTh5Q0laMjBCWmJZcHYwRklG?=
 =?utf-8?B?ZC9TWkl1MURaUFFlVDY5MjJmVWIwcFpidGttdTI2NyszbVNkbFZTMWEycW1u?=
 =?utf-8?B?Vytjc09wR3J5cFVHWCt3YTZ0a0ovYURpQ21ieHNRbGFxRTd4bUIvaWZtdHZh?=
 =?utf-8?B?QWRzQzJ0S1ZySXV1ZVBQb0I5RytPZDA1dUNNZDNCZDdUV2pWQkcxdWRtb3lm?=
 =?utf-8?B?cW1XaDBiQTNkNGdvNjNUclR2VGxWR2tKcEF2Wko3Mkt5Mzhac2ZHRXNianRC?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FB230E3B35AFC4794C9A84E459C4937@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB5964.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6da515-c948-4698-bf53-08daf5487775
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 09:28:01.6533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIQZS2kLJnSmYbtmTsTzdL1PGg9AV9HBbLW8qJ3h4+MgwXi+O+zDkeswAMro/UAwA3KKiuCKjR0E/EBichAZ4sPFgeGSRgvjauBDkbyQDto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5711
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_012843_446129_8126FC98 
X-CRM114-Status: GOOD (  24.50  )
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

T24gRnJpLCAyMDIzLTAxLTEzIGF0IDA5OjAxICswMTAwLCBEbWl0cnkgVnl1a292IHdyb3RlOg0K
PiBPbiBGcmksIDEzIEphbiAyMDIzIGF0IDA4OjU5LCAnS3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mO
KScgdmlhIGthc2FuLWRldg0KPiA8a2FzYW4tZGV2QGdvb2dsZWdyb3Vwcy5jb20+IHdyb3RlOg0K
PiA+IA0KPiA+IE9uIE1vbiwgMjAyMy0wMS0wOSBhdCAwNzo1MSArMDEwMCwgRG1pdHJ5IFZ5dWtv
diB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgMyBKYW4gMjAyMyBhdCAwODo1NiwgJ0t1YW4tWWluZyBM
ZWUnIHZpYSBrYXNhbi1kZXYNCj4gPiA+IDxrYXNhbi1kZXZAZ29vZ2xlZ3JvdXBzLmNvbT4gd3Jv
dGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBXZSBzY2FuIHRoZSBzaGFkb3cgbWVtb3J5IHRvIGluZmVy
IHRoZSByZXF1ZXN0ZWQgc2l6ZSBpbnN0ZWFkDQo+ID4gPiA+IG9mDQo+ID4gPiA+IHByaW50aW5n
IGNhY2hlLT5vYmplY3Rfc2l6ZSBkaXJlY3RseS4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgcGF0
Y2ggd2lsbCBmaXggdGhlIGNvbmZ1c2luZyBnZW5lcmljIGthc2FuIHJlcG9ydCBsaWtlDQo+ID4g
PiA+IGJlbG93Lg0KPiA+ID4gPiBbMV0NCj4gPiA+ID4gUmVwb3J0IHNob3dzICJjYWNoZSBrbWFs
bG9jLTE5MiBvZiBzaXplIDE5MiIsIGJ1dCB1c2VyDQo+ID4gPiA+IGFjdHVhbGx5IGttYWxsb2Mo
MTg0KS4NCj4gPiA+ID4gDQo+ID4gPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4gPiA9PT0NCj4gPiA+ID4gQlVH
OiBLQVNBTjogc2xhYi1vdXQtb2YtYm91bmRzIGluIF9maW5kX25leHRfYml0KzB4MTQzLzB4MTYw
DQo+ID4gPiA+IGxpYi9maW5kX2JpdC5jOjEwOQ0KPiA+ID4gPiBSZWFkIG9mIHNpemUgOCBhdCBh
ZGRyIGZmZmY4ODgwMTc1NzY2YjggYnkgdGFzayBrd29ya2VyLzE6MS8yNg0KPiA+ID4gPiAuLi4N
Cj4gPiA+ID4gVGhlIGJ1Z2d5IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgb2JqZWN0IGF0IGZmZmY4
ODgwMTc1NzY2MDANCj4gPiA+ID4gIHdoaWNoIGJlbG9uZ3MgdG8gdGhlIGNhY2hlIGttYWxsb2Mt
MTkyIG9mIHNpemUgMTkyDQo+ID4gPiA+IFRoZSBidWdneSBhZGRyZXNzIGlzIGxvY2F0ZWQgMTg0
IGJ5dGVzIGluc2lkZSBvZg0KPiA+ID4gPiAgMTkyLWJ5dGUgcmVnaW9uIFtmZmZmODg4MDE3NTc2
NjAwLCBmZmZmODg4MDE3NTc2NmMwKQ0KPiA+ID4gPiAuLi4NCj4gPiA+ID4gTWVtb3J5IHN0YXRl
IGFyb3VuZCB0aGUgYnVnZ3kgYWRkcmVzczoNCj4gPiA+ID4gIGZmZmY4ODgwMTc1NzY1ODA6IGZi
IGZiIGZiIGZiIGZiIGZiIGZiIGZiIGZjIGZjIGZjIGZjIGZjIGZjIGZjDQo+ID4gPiA+IGZjDQo+
ID4gPiA+ICBmZmZmODg4MDE3NTc2NjAwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMA0KPiA+ID4gPiAwMA0KPiA+ID4gPiA+IGZmZmY4ODgwMTc1NzY2ODA6IDAw
IDAwIDAwIDAwIDAwIDAwIDAwIGZjIGZjIGZjIGZjIGZjIGZjIGZjDQo+ID4gPiA+ID4gZmMgZmMN
Cj4gPiA+ID4gDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeDQo+ID4gPiA+ICBmZmZmODg4MDE3NTc2NzAwOiBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBm
YyBmYyBmYyBmYyBmYyBmYyBmYw0KPiA+ID4gPiBmYw0KPiA+ID4gPiAgZmZmZjg4ODAxNzU3Njc4
MDogZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMNCj4gPiA+ID4g
ZmMNCj4gPiA+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQo+ID4gPiA+ID09PQ0KPiA+ID4gPiANCj4gPiA+ID4gQWZ0ZXIg
dGhpcyBwYXRjaCwgcmVwb3J0IHdpbGwgc2hvdyAiY2FjaGUga21hbGxvYy0xOTIgb2Ygc2l6ZQ0K
PiA+ID4gPiAxODQiLg0KPiA+ID4gPiANCj4gPiA+ID4gTGluazoNCj4gPiA+ID4gDQpodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVn
LmNnaT9pZD0yMTY0NTdfXzshIUNUUk5LQTl3TWcwQVJidyFtTE5jdVo4M2MzOWQwWGt1dC1XTVkz
Q2N2WmNBWUR1TENtdjRtdTdJQWxkdzRfbjRpNlh2WDhHT1JCZmpPYWRXeE9hNmQtT0RRZHg2WkNT
dkIyZzEzUSQNCj4gPiA+ID4gJCAgIFsxXQ0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogS3Vhbi1ZaW5nIExlZSA8S3Vhbi1ZaW5nLkxlZUBtZWRpYXRlay5jb20+DQo+ID4gPiA+IC0t
LQ0KPiA+ID4gPiAgbW0va2FzYW4va2FzYW4uaCAgICAgICAgICB8ICA1ICsrKysrDQo+ID4gPiA+
ICBtbS9rYXNhbi9yZXBvcnQuYyAgICAgICAgIHwgIDMgKystDQo+ID4gPiA+ICBtbS9rYXNhbi9y
ZXBvcnRfZ2VuZXJpYy5jIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gDQo+ID4g
PiA+IGRpZmYgLS1naXQgYS9tbS9rYXNhbi9rYXNhbi5oIGIvbW0va2FzYW4va2FzYW4uaA0KPiA+
ID4gPiBpbmRleCAzMjQxM2YyMmFhODIuLjdiYjYyN2QyMTU4MCAxMDA2NDQNCj4gPiA+ID4gLS0t
IGEvbW0va2FzYW4va2FzYW4uaA0KPiA+ID4gPiArKysgYi9tbS9rYXNhbi9rYXNhbi5oDQo+ID4g
PiA+IEBAIC0zNDAsOCArMzQwLDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZA0KPiA+ID4gPiBrYXNh
bl9wcmludF9hZGRyZXNzX3N0YWNrX2ZyYW1lKGNvbnN0IHZvaWQgKmFkZHIpIHsgfQ0KPiA+ID4g
PiANCj4gPiA+ID4gICNpZmRlZiBDT05GSUdfS0FTQU5fR0VORVJJQw0KPiA+ID4gPiAgdm9pZCBr
YXNhbl9wcmludF9hdXhfc3RhY2tzKHN0cnVjdCBrbWVtX2NhY2hlICpjYWNoZSwgY29uc3QNCj4g
PiA+ID4gdm9pZA0KPiA+ID4gPiAqb2JqZWN0KTsNCj4gPiA+ID4gK2ludCBrYXNhbl9nZXRfYWxs
b2Nfc2l6ZSh2b2lkICpvYmplY3RfYWRkciwgc3RydWN0IGttZW1fY2FjaGUNCj4gPiA+ID4gKmNh
Y2hlKTsNCj4gPiA+ID4gICNlbHNlDQo+ID4gPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQga2FzYW5f
cHJpbnRfYXV4X3N0YWNrcyhzdHJ1Y3Qga21lbV9jYWNoZQ0KPiA+ID4gPiAqY2FjaGUsIGNvbnN0
IHZvaWQgKm9iamVjdCkgeyB9DQo+ID4gPiA+ICtzdGF0aWMgaW5saW5lIGludCBrYXNhbl9nZXRf
YWxsb2Nfc2l6ZSh2b2lkICpvYmplY3RfYWRkciwNCj4gPiA+ID4gc3RydWN0DQo+ID4gPiA+IGtt
ZW1fY2FjaGUgKmNhY2hlKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArICAgICAgIHJldHVybiBjYWNo
ZS0+b2JqZWN0X3NpemU7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICAjZW5kaWYNCj4gPiA+ID4gDQo+
ID4gPiA+ICBib29sIGthc2FuX3JlcG9ydCh1bnNpZ25lZCBsb25nIGFkZHIsIHNpemVfdCBzaXpl
LA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbW0va2FzYW4vcmVwb3J0LmMgYi9tbS9rYXNhbi9yZXBv
cnQuYw0KPiA+ID4gPiBpbmRleCAxZDAyNzU3ZTkwYTMuLjZkZTQ1NGJiMmNhZCAxMDA2NDQNCj4g
PiA+ID4gLS0tIGEvbW0va2FzYW4vcmVwb3J0LmMNCj4gPiA+ID4gKysrIGIvbW0va2FzYW4vcmVw
b3J0LmMNCj4gPiA+ID4gQEAgLTIzNiwxMiArMjM2LDEzIEBAIHN0YXRpYyB2b2lkIGRlc2NyaWJl
X29iamVjdF9hZGRyKGNvbnN0DQo+ID4gPiA+IHZvaWQNCj4gPiA+ID4gKmFkZHIsIHN0cnVjdCBr
bWVtX2NhY2hlICpjYWNoZSwNCj4gPiA+ID4gIHsNCj4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBs
b25nIGFjY2Vzc19hZGRyID0gKHVuc2lnbmVkIGxvbmcpYWRkcjsNCj4gPiA+ID4gICAgICAgICB1
bnNpZ25lZCBsb25nIG9iamVjdF9hZGRyID0gKHVuc2lnbmVkIGxvbmcpb2JqZWN0Ow0KPiA+ID4g
PiArICAgICAgIGludCByZWFsX3NpemUgPSBrYXNhbl9nZXRfYWxsb2Nfc2l6ZSgodm9pZA0KPiA+
ID4gPiAqKW9iamVjdF9hZGRyLA0KPiA+ID4gPiBjYWNoZSk7DQo+ID4gPiA+ICAgICAgICAgY29u
c3QgY2hhciAqcmVsX3R5cGU7DQo+ID4gPiA+ICAgICAgICAgaW50IHJlbF9ieXRlczsNCj4gPiA+
ID4gDQo+ID4gPiA+ICAgICAgICAgcHJfZXJyKCJUaGUgYnVnZ3kgYWRkcmVzcyBiZWxvbmdzIHRv
IHRoZSBvYmplY3QgYXQNCj4gPiA+ID4gJXB4XG4iDQo+ID4gPiA+ICAgICAgICAgICAgICAgICIg
d2hpY2ggYmVsb25ncyB0byB0aGUgY2FjaGUgJXMgb2Ygc2l6ZSAlZFxuIiwNCj4gPiA+ID4gLSAg
ICAgICAgICAgICAgIG9iamVjdCwgY2FjaGUtPm5hbWUsIGNhY2hlLT5vYmplY3Rfc2l6ZSk7DQo+
ID4gPiA+ICsgICAgICAgICAgICAgICBvYmplY3QsIGNhY2hlLT5uYW1lLCByZWFsX3NpemUpOw0K
PiA+ID4gPiANCj4gPiA+ID4gICAgICAgICBpZiAoYWNjZXNzX2FkZHIgPCBvYmplY3RfYWRkcikg
ew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgcmVsX3R5cGUgPSAidG8gdGhlIGxlZnQiOw0KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvbW0va2FzYW4vcmVwb3J0X2dlbmVyaWMuYw0KPiA+ID4gPiBiL21t
L2thc2FuL3JlcG9ydF9nZW5lcmljLmMNCj4gPiA+ID4gaW5kZXggMDQzYzk0YjA0NjA1Li4wMWIz
OGU0NTkzNTIgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL21tL2thc2FuL3JlcG9ydF9nZW5lcmljLmMN
Cj4gPiA+ID4gKysrIGIvbW0va2FzYW4vcmVwb3J0X2dlbmVyaWMuYw0KPiA+ID4gPiBAQCAtNDMs
NiArNDMsMjQgQEAgdm9pZCAqa2FzYW5fZmluZF9maXJzdF9iYWRfYWRkcih2b2lkICphZGRyLA0K
PiA+ID4gPiBzaXplX3Qgc2l6ZSkNCj4gPiA+ID4gICAgICAgICByZXR1cm4gcDsNCj4gPiA+ID4g
IH0NCj4gPiA+ID4gDQo+ID4gPiA+ICtpbnQga2FzYW5fZ2V0X2FsbG9jX3NpemUodm9pZCAqYWRk
ciwgc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArICAgICAg
IGludCBzaXplID0gMDsNCj4gPiA+ID4gKyAgICAgICB1OCAqc2hhZG93ID0gKHU4ICopa2FzYW5f
bWVtX3RvX3NoYWRvdyhhZGRyKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHdoaWxlIChz
aXplIDwgY2FjaGUtPm9iamVjdF9zaXplKSB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAo
KnNoYWRvdyA9PSAwKQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBzaXplICs9IEtB
U0FOX0dSQU5VTEVfU0laRTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKCpzaGFk
b3cgPj0gMSAmJiAqc2hhZG93IDw9DQo+ID4gPiA+IEtBU0FOX0dSQU5VTEVfU0laRSAtIDEpDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNpemUgKz0gKnNoYWRvdzsNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgIGVsc2UNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHNpemU7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBzaGFkb3crKzsNCj4gPiA+IA0KPiA+
ID4gVGhpcyBvbmx5IHdvcmtzIGZvciBvdXQtb2YtYm91bmRzIHJlcG9ydHMsIGJ1dCBJIGRvbid0
IHNlZSBhbnkNCj4gPiA+IGNoZWNrcw0KPiA+ID4gZm9yIHJlcG9ydCB0eXBlLiBXb24ndCB0aGlz
IGJyZWFrIHJlcG9ydGluZyBmb3IgYWxsIG90aGVyIHJlcG9ydA0KPiA+ID4gdHlwZXM/DQo+ID4g
PiANCj4gPiANCj4gPiBJIHRoaW5rIGl0IHdvbid0IGJyZWFrIHJlcG9ydGluZyBmb3Igb3RoZXIg
cmVwb3J0IHR5cGVzLg0KPiA+IFRoaXMgZnVuY3Rpb24gaXMgb25seSBjYWxsZWQgYnkgc2xhYiBP
T0IgYW5kIFVBRi4NCj4gDQo+IEkgbWVhbnQgc3BlY2lmaWNhbGx5IFVBRiByZXBvcnRzLg0KPiBE
dXJpbmcgVUFGIHRoZXJlIGFyZSBubyAwcyBpbiB0aGUgb2JqZWN0IHNoYWRvdy4NCj4gDQoNCk9r
Lg0KSSB3aWxsIGNoZWNrIHRoZSByZXBvcnQgdHlwZSBpbiB2Mi4NCg0KPiA+ID4gSSB3b3VsZCBh
bHNvIHByaW50IHRoZSBjYWNoZSBuYW1lIGFueXdheS4gU29tZXRpbWVzIHJlcG9ydHMgYXJlDQo+
ID4gPiBwZXJwbGV4aW5nIGFuZC9vciB0aGlzIGxvZ2ljIG1heSByZXR1cm4gYSB3cm9uZyByZXN1
bHQgZm9yIHNvbWUNCj4gPiA+IHJlYXNvbi4gVGhlIHRvdGFsIG9iamVjdCBzaXplIG1heSBiZSB1
c2VmdWwgdG8gdW5kZXJzdGFuZCBoYXJkZXINCj4gPiA+IGNhc2VzLg0KPiA+ID4gDQo+ID4gDQo+
ID4gT2suIEkgd2lsbCBrZWVwIHRoZSBjYWNoZSBuYW1lIGFuZCB0aGUgdG90YWwgb2JqZWN0X3Np
emUuDQo+ID4gDQo+ID4gPiA+ICsgICAgICAgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAg
cmV0dXJuIGNhY2hlLT5vYmplY3Rfc2l6ZTsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4g
PiAgc3RhdGljIGNvbnN0IGNoYXIgKmdldF9zaGFkb3dfYnVnX3R5cGUoc3RydWN0DQo+ID4gPiA+
IGthc2FuX3JlcG9ydF9pbmZvDQo+ID4gPiA+ICppbmZvKQ0KPiA+ID4gPiAgew0KPiA+ID4gPiAg
ICAgICAgIGNvbnN0IGNoYXIgKmJ1Z190eXBlID0gInVua25vd24tY3Jhc2giOw0KPiA+IA0KPiA+
IC0tDQo+ID4gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2Ny
aWJlZCB0byB0aGUgR29vZ2xlDQo+ID4gR3JvdXBzICJrYXNhbi1kZXYiIGdyb3VwLg0KPiA+IFRv
IHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZy
b20gaXQsDQo+ID4gc2VuZCBhbiBlbWFpbCB0byBrYXNhbi1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xl
Z3JvdXBzLmNvbS4NCj4gPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0
IA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dyb3Vwcy5nb29nbGUu
Y29tL2QvbXNnaWQva2FzYW4tZGV2L2VkYmNjZThhMWU5ZTc3MmUzYTNmZDAzMmNkNDYwMGJkNTY3
N2M4NzcuY2FtZWwqNDBtZWRpYXRlay5jb21fXztKUSEhQ1RSTktBOXdNZzBBUmJ3IW5MazJlQklj
OXFBWEV5NTBzeHhYUlMySVJaS1k4V1NmVnRfVDNWdGFNRHJJclJIeDMxeE95NWNUbXFaYTFweTVp
ZnU5VWlIb3FyS214dG5WS2NXZkpRJA0KPiA+IFEkICAuDQo=

