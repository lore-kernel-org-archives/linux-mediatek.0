Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABA8CD128A
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 03:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lypGSi0e3ySUr8Lr9xZ5ri1u09+DZiia8qf5pzOFi6o=; b=Vpgn9PyfPghEBNSY5+i1WqVG6Q
	UxpuZTOfHzPAmJRnoAncL+teOwPJ6IqFTjhKE1CrsRRY2O37yrNtyzgTn2J7EC1kGmzeCBmQXvGWM
	qTjEcJbofXGFH/1hNr+w2EZnryVUx6Y2NaWH2VY3QctAVJxzwdUO9vd5kzbtXBpoTic6H1B31nNXw
	xdZl1flbMP6Iq5nVssC7IY949RDgDlxsTvuTpTY1MXwlJPHW6sNyYGWkYsrFvDqQKUux4y6VX7VsQ
	v6jqlKreHvHzzeaxwWB5S3XN+ReaZaB+n+2VkXNKI5p/TE0v+Gg9c+OeZalMW+KPEzoeSF/EQO3sy
	agRhy/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq2uM-0000000Geo0-1fcD;
	Fri, 29 Mar 2024 03:27:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq2uJ-0000000GemM-1heh;
	Fri, 29 Mar 2024 03:27:56 +0000
X-UUID: 4f025572ed7c11ee96d5dfc950b7243d-20240328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lypGSi0e3ySUr8Lr9xZ5ri1u09+DZiia8qf5pzOFi6o=;
	b=R/1G7I8y0bo1SHxX5YQ4LKIK8A9mCmyxCIhFpePgAGB6H3E3W3JLAiGatLdjOyPE0sXWm21FM3kCX6nIB/G2iwFtj8FVZA16urphzc0Q3gbyTWT0X4Mjj9Z3fgNSqZsjvVHDtRR0IRi+F1ybQLuLGpn8HHjeObT2QoJ8QECiYng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:5ce856ba-a96a-4cd8-a099-222bb752cbea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:204ff890-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4f025572ed7c11ee96d5dfc950b7243d-20240328
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <boy.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 415529976; Thu, 28 Mar 2024 20:27:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Mar 2024 11:17:41 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Mar 2024 11:17:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+VByv4mImFfuSgKT8nbIBvvyncw5GDyr412VxN7GTc2R0dAFVoVkz/8746ThJS2BZuFtlneox46QjoRYSZyhq5Ix8GLnvUYeRJ1Y9GlKvB0I4P8wfrmXVlq3/nFWtVVSGMhhKiXBvqyHsBFuHuTHJGEWu3Jzd9TfYvBLrtJwBIO59e1RpWUP219/LSwEad690jsfWEMDWDGLZe0JdRblKi56eBV8rqhCnhkcpNlYB3YZL85PjIHbAUtqyBpc95R6AYxv//1TwxUuUJCYr96IHCPFfrXbO5PSoCOur3cluloC5plReeoh59LUvGHV5ueB9B0U+T001uEP8B15py0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lypGSi0e3ySUr8Lr9xZ5ri1u09+DZiia8qf5pzOFi6o=;
 b=D7lNodrgxCoAJ1v1Rh3Sm6dZdTdyaAwb9ZA+XtnmwSFzcSxbQUCQBo8xbkJJ+tbhbO3IE7ceQSHKsq827S1QY1JLBgfNbtuoUVbMoUI09oWBkK+xzF52zJZmVCpx+J5na+jWuALTwks1fpUMXnorq8edjryBgo01zoVVHHy9NCqLpcgsrC7TAuMF/lnIYK8+7yiBc3XyNRmysjn/abUKAVZjjiytcG8R1bLQy7qUWSsJb+UbYYbXMFnr0WMJRE0M3tBwdFfptqyF3ojIN6entgXCA7XVmQlEUSdVzKu6EPjzx7PNoldIc+REXJ6wbNUrWzs/0WSgphQAlAVTMfN6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lypGSi0e3ySUr8Lr9xZ5ri1u09+DZiia8qf5pzOFi6o=;
 b=g5WHWgTxXAHxBmpF01AkHDQRF7/COGvAYYij82d2LydSvaG/Ajtkpzf7FEdBFIcOfVS6kA6es+xmi25hYCGGlJ04pvcUqil3T/BT1187BzDDwp9EEGcIlG78WpArPfQjEslIzUyuRv1T8Y4oi7iiknqgMDkXxz5badTp/hH3qy8=
Received: from TYZPR03MB7867.apcprd03.prod.outlook.com (2603:1096:400:465::7)
 by TYZPR03MB8461.apcprd03.prod.outlook.com (2603:1096:405:72::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 03:17:40 +0000
Received: from TYZPR03MB7867.apcprd03.prod.outlook.com
 ([fe80::45da:cd44:6032:ea9]) by TYZPR03MB7867.apcprd03.prod.outlook.com
 ([fe80::45da:cd44:6032:ea9%4]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 03:17:39 +0000
From: =?utf-8?B?Qm95IFd1ICjlkLPli4Poqrwp?= <Boy.Wu@mediatek.com>
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "kasan-dev@googlegroups.com"
	<kasan-dev@googlegroups.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH] arm: kasan: clear stale stack poison
Thread-Topic: [PATCH] arm: kasan: clear stale stack poison
Thread-Index: AQHaNH50g4opuV1/1EWa6LrsT9gdhLFOplGA
Date: Fri, 29 Mar 2024 03:17:39 +0000
Message-ID: <6837adc26ed09b9acd6a2239a14014cd3f16c87c.camel@mediatek.com>
References: <20231222022741.8223-1-boy.wu@mediatek.com>
In-Reply-To: <20231222022741.8223-1-boy.wu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7867:EE_|TYZPR03MB8461:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ob6h6Lj5aCU3uPuwBelxkEevXMUff/f/Ab9SL8uYmVqDYs+0XSTPp5xn56UVq6jLxTjnqWK56ZKPXNJHo2s8APJUvU46m1m4UGsTJvyke2pUDi+Ump+/3odcjD5a06CaafE+0indBP5RXZSMXYOiw9P9gNyOFnyjVJ+FvlvjRCwQJfHI3f7Z61/H7cVbmZtrsbopX7/9DivDAqRH9G6/buy8Ke2dA+VGqKk2jTincJ8i3pErORsBJ1uIK43VAjqjgUH1iDiEccqRCm3vgKl4IDTKw8MLeVMpGH2gTs6x1YaTBYQPBKySOYzTxTu5GdtxjIeht2q9i6mlW8C+cyCi/dLZuLcee8XN1CLrWyzw0JE7y9kItEjt0rMovq9+wTZu6sJeTuTge1ApBTS4PD+etRp0xMCOUtD4TTOUY8jbl0JYPjcm+FFrCthMUCh6VnUWnofEy/own92tcYvHy8WkaGm+bfw6CYLq2TT0lkKFGK/LY+HFfgNqJ7e/Vlbxb4LMy7SlsH9R6wiJ1k8JKMmCk7wH4Yphjh0IYLuzOnuLQNPM8oRDOU6yOVOjrbsFDAPWtwVuS2eI85a5S0MWnhbT/qtsxercdmvMyAP00echfcI8JrmdDKQerduuUX5uDtZXZJjwOq8QFvL9CuCMMt+vG1PDQT+RelzH6n7lgmZISDM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7867.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzFuQzduKzM4SXRJd0ZUY1hqMXRmek9zUGZwNGRuV1pzM2FOUk0wdFU1YlJQ?=
 =?utf-8?B?UXVlQ1d2ZlVWNS9TWXQyZHBaSE04QmZCUXE5dC84bDBFZ01sUnNMSDZBYXlY?=
 =?utf-8?B?U2pPWGNOSS8vSWV0eklEczZxbzlDTklQVDJTRm0zWVZwVFNmVldoSkgwOWdk?=
 =?utf-8?B?U1hSeTZMOXdURWhUL3VzTENRMy8xMkt6aHlUYkhocjErYVgvaEdad0xRUE9W?=
 =?utf-8?B?MTVseTJpM3JnZ3dEc2RwMzVFRDVjcUFKNlQwajd4aVVRVDNPYWNFQzZNbGZa?=
 =?utf-8?B?M2ttN2k0TGREbFE3UTJSNnNsdG9YYWxvV0FjRE16YXdFYzRtUTZ4YlJiYU4y?=
 =?utf-8?B?d2ZyOUkxeG8vaW41OEtGMFJtc2JFNUIyUDl5N1F4cVl6Z3V2KzdxbSswMWF0?=
 =?utf-8?B?M0JKMFR6Y3B3UjRmb3pzbDJOajZPeFR3Ym03dCs2MFZSaWZJc1dQVE1GYTEr?=
 =?utf-8?B?ck11T0kwSVhuaklVc21PLzBPYzhSQWk3cXByanUxNURLWWJ3cHNWams1L3BK?=
 =?utf-8?B?ZHdvd21VaXFHY29hRzFFbWVMa2ptYjREUlhmcTNDbFdpaUJhN1JQR0lVK3lv?=
 =?utf-8?B?SXVLeXVQOGlLUEVZOXJQaTNLeVRRTDk1TWlZaEhvVUI0ZXRVTDF6OFVaS1dN?=
 =?utf-8?B?bjVPK3lpaVBjalBwNUx3VFlIbHp1ZlpvVnlkL1FkS0F5TVAvM0dWRlhZcjBI?=
 =?utf-8?B?ZXVIQ1FkT3BETWVnaEhFR3NucDVCaFpMWDlGQkpmc0l2QVBpTld4SVhmaWVI?=
 =?utf-8?B?VyswbXZ3OEFPL3pxL1NFR0NyZDd0dDhmNDcvRnJDS0RGSFdlWEtQU1Z6TkNv?=
 =?utf-8?B?Zys0TkJ6OVcxN1B3RjZSckYySVVRSEdSMkcxMHJ0VXl1MGxWOFF5SHYrQ2FJ?=
 =?utf-8?B?OGkrRjlMZUNqeUNRWXQ3aThjckQ4MGhIeHFZSWVvQ0xLOUZndmwzN0hPOUho?=
 =?utf-8?B?OTVGSUJENUxEM2JVMUY5Q3E5TVFYTUx1aEU1aFZ1RDArV2QwNTVaRXpsV01p?=
 =?utf-8?B?NVNMei9aa0cxWHFCeDVvUVVTNTAwTUhXV29uV1ZqYi9JLzEveCs5WXVISFE4?=
 =?utf-8?B?cExKWDhvOVBTdEU3UVJuVEQ5SzhLV0NkNm0rbE15SDFCcHVWYUs1L1NLOHN6?=
 =?utf-8?B?U05NK0RZMENzWW0zWERPcnI4b0lUMUFELzBNek5JQXpwMHFUZGlCQ3ZhV2xT?=
 =?utf-8?B?QnYvSWRCQ1hBK3c3Wm4rWHI4TFZwcnM3OVVUQlhVMmtaQlJqQk5WQ29wMGJB?=
 =?utf-8?B?WEV5VzdtbndrcXlhdWRKV25hY1lyajNwV2FLbGU2K25aOWo1c053K1FTZTd1?=
 =?utf-8?B?VnNzczBjTmdob01lcmZQY1U3c1ZLczF0UmlUVkl6RVFkdVMwVmZ1Rk1VbXov?=
 =?utf-8?B?UndSZk9YZW1DV3BuaklsVWw5M2F4UVdReDltNGlQeVorZWZxRnVJcjIyRks5?=
 =?utf-8?B?akdId0c2OEd6bWZWM0NtZGNpcVRHKzN4RkZZa200TmVUTG44emNBcUM0clJV?=
 =?utf-8?B?MUV5V3Nsd1NKQWQybXN2YVJSRXNPNFJ3VzV5ZGtNMnZ3ZDVsQUNyVFZ1cTVM?=
 =?utf-8?B?TXlheGZFL1F6c2prMVo4U2tGelJPN1hrZGFRa3p1NEx4dGR5bTRObHNreXVX?=
 =?utf-8?B?ajJBMytrY2tVOGJ5YStPeDFMRkZmYmNMaytVcXNIVFNudlpwQm8xdDExUWN2?=
 =?utf-8?B?YkZkeXJnQW11ZmtQMXBSejdNR25oK01SeW9kdnpFOVU3Mk9aKzQ2Mi9EM0l5?=
 =?utf-8?B?bWhoU1c0S29zZ0c1MVJnVk9zRVpuditLcDltL3RrU09ZcnY1V08rWjJhaEdp?=
 =?utf-8?B?eWIxN1ZPZVMwY1g1VlF1RThJbjRKQkVXUUNSTWMzR2dkc3hXek5sQzVOVG9S?=
 =?utf-8?B?aFp0bEU2QmQxNEJCM1RuM2lwdW5Gem92SW1vUDJZZERwbGt6cytlZTVoZFNs?=
 =?utf-8?B?bE1odDVQeDQya3VOYmlVNjQ2bjdHS2N1eEVKcFQ5eitJdkozOGlKSHVqS0ND?=
 =?utf-8?B?cWdxMVNaUm5RVlA2dHNLNXZLOE1lMnpNdHduZHZlcmlhS0RqTXRuRG1JbEwx?=
 =?utf-8?B?YUJmenlEQ1YrMnZmZUtRUFhWS1JvVGxDNzNTa2FKei9xdTN0aW5ZUW44WWV4?=
 =?utf-8?Q?kTWQIOWEXdZF4pAhxJvDinWtc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95F0D0B74E336944A2C84DE1489B7D74@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7867.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459c8283-a30f-4f89-0cac-08dc4f9eca54
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 03:17:39.7453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +qIpw7L6O6rV5sgqpfemTjFm+Y8WP83xscKIHuxTlwxGhHgZKX/kXEaU0EaA6EQBeJXEteDkC1e8pJ3RoeKxAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_202755_467766_F4609EE8 
X-CRM114-Status: GOOD (  19.23  )
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

SGkgUnVzc2VsbDoNCg0KS2luZ2x5IHBpbmcNCg0KVGhhbmtzLg0KQm95Lg0KDQpPbiBGcmksIDIw
MjMtMTItMjIgYXQgMTA6MjcgKzA4MDAsIGJveS53dSB3cm90ZToNCj4gRnJvbTogQm95IFd1IDxi
b3kud3VAbWVkaWF0ZWsuY29tPg0KPiANCj4gV2UgZm91bmQgYmVsb3cgT09CIGNyYXNoOg0KPiAN
Cj4gWyAgIDMzLjQ1MjQ5NF0NCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IFsgICAzMy40NTM1MTNdIEJVRzogS0FT
QU46IHN0YWNrLW91dC1vZi1ib3VuZHMgaW4NCj4gcmVmcmVzaF9jcHVfdm1fc3RhdHMuY29uc3Rw
cm9wLjArMHhjYy8weDJlYw0KPiBbICAgMzMuNDU0NjYwXSBXcml0ZSBvZiBzaXplIDE2NCBhdCBh
ZGRyIGMxZDAzZDMwIGJ5IHRhc2sgc3dhcHBlci8wLzANCj4gWyAgIDMzLjQ1NTUxNV0NCj4gWyAg
IDMzLjQ1NTc2N10gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyLzAgVGFpbnRlZDoNCj4gRyAg
ICAgICAgICAgTyAgICAgICA2LjEuMjUtbWFpbmxpbmUgIzENCj4gWyAgIDMzLjQ1Njg4MF0gSGFy
ZHdhcmUgbmFtZTogR2VuZXJpYyBEVCBiYXNlZCBzeXN0ZW0NCj4gWyAgIDMzLjQ1NzU1NV0gIHVu
d2luZF9iYWNrdHJhY2UgZnJvbSBzaG93X3N0YWNrKzB4MTgvMHgxYw0KPiBbICAgMzMuNDU4MzI2
XSAgc2hvd19zdGFjayBmcm9tIGR1bXBfc3RhY2tfbHZsKzB4NDAvMHg0Yw0KPiBbICAgMzMuNDU5
MDcyXSAgZHVtcF9zdGFja19sdmwgZnJvbSBwcmludF9yZXBvcnQrMHgxNTgvMHg0YTQNCj4gWyAg
IDMzLjQ1OTg2M10gIHByaW50X3JlcG9ydCBmcm9tIGthc2FuX3JlcG9ydCsweDljLzB4MTQ4DQo+
IFsgICAzMy40NjA2MTZdICBrYXNhbl9yZXBvcnQgZnJvbSBrYXNhbl9jaGVja19yYW5nZSsweDk0
LzB4MWEwDQo+IFsgICAzMy40NjE0MjRdICBrYXNhbl9jaGVja19yYW5nZSBmcm9tIG1lbXNldCsw
eDIwLzB4M2MNCj4gWyAgIDMzLjQ2MjE1N10gIG1lbXNldCBmcm9tDQo+IHJlZnJlc2hfY3B1X3Zt
X3N0YXRzLmNvbnN0cHJvcC4wKzB4Y2MvMHgyZWMNCj4gWyAgIDMzLjQ2MzA2NF0gIHJlZnJlc2hf
Y3B1X3ZtX3N0YXRzLmNvbnN0cHJvcC4wIGZyb20NCj4gdGlja19ub2h6X2lkbGVfc3RvcF90aWNr
KzB4MTgwLzB4NTNjDQo+IFsgICAzMy40NjQxODFdICB0aWNrX25vaHpfaWRsZV9zdG9wX3RpY2sg
ZnJvbSBkb19pZGxlKzB4MjY0LzB4MzU0DQo+IFsgICAzMy40NjUwMjldICBkb19pZGxlIGZyb20g
Y3B1X3N0YXJ0dXBfZW50cnkrMHgyMC8weDI0DQo+IFsgICAzMy40NjU3NjldICBjcHVfc3RhcnR1
cF9lbnRyeSBmcm9tIHJlc3RfaW5pdCsweGYwLzB4ZjQNCj4gWyAgIDMzLjQ2NjUyOF0gIHJlc3Rf
aW5pdCBmcm9tIGFyY2hfcG9zdF9hY3BpX3N1YnN5c19pbml0KzB4MC8weDE4DQo+IFsgICAzMy40
NjczOTddDQo+IFsgICAzMy40Njc2NDRdIFRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gc3Rh
Y2sgb2YgdGFzayBzd2FwcGVyLzAvMA0KPiBbICAgMzMuNDY4NDkzXSAgYW5kIGlzIGxvY2F0ZWQg
YXQgb2Zmc2V0IDExMiBpbiBmcmFtZToNCj4gWyAgIDMzLjQ2OTE3Ml0gIHJlZnJlc2hfY3B1X3Zt
X3N0YXRzLmNvbnN0cHJvcC4wKzB4MC8weDJlYw0KPiBbICAgMzMuNDY5OTE3XQ0KPiBbICAgMzMu
NDcwMTY1XSBUaGlzIGZyYW1lIGhhcyAyIG9iamVjdHM6DQo+IFsgICAzMy40NzA2OTZdICBbMzIs
IDc2KSAnZ2xvYmFsX3pvbmVfZGlmZicNCj4gWyAgIDMzLjQ3MDcyOV0gIFsxMTIsIDI3NikgJ2ds
b2JhbF9ub2RlX2RpZmYnDQo+IFsgICAzMy40NzEyOTRdDQo+IFsgICAzMy40NzIwOTVdIFRoZSBi
dWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIHBoeXNpY2FsIHBhZ2U6DQo+IFsgICAzMy40NzI4
NjJdIHBhZ2U6M2NkNzJkYTggcmVmY291bnQ6MSBtYXBjb3VudDowIG1hcHBpbmc6MDAwMDAwMDAN
Cj4gaW5kZXg6MHgwIHBmbjoweDQxZDAzDQo+IFsgICAzMy40NzM5NDRdIGZsYWdzOiAweDEwMDAo
cmVzZXJ2ZWR8em9uZT0wKQ0KPiBbICAgMzMuNDc0NTY1XSByYXc6IDAwMDAxMDAwIGVkNzQxNDcw
IGVkNzQxNDcwIDAwMDAwMDAwIDAwMDAwMDAwDQo+IDAwMDAwMDAwIGZmZmZmZmZmIDAwMDAwMDAx
DQo+IFsgICAzMy40NzU2NTZdIHJhdzogMDAwMDAwMDANCj4gWyAgIDMzLjQ3NjA1MF0gcGFnZSBk
dW1wZWQgYmVjYXVzZToga2FzYW46IGJhZCBhY2Nlc3MgZGV0ZWN0ZWQNCj4gWyAgIDMzLjQ3Njgx
Nl0NCj4gWyAgIDMzLjQ3NzA2MV0gTWVtb3J5IHN0YXRlIGFyb3VuZCB0aGUgYnVnZ3kgYWRkcmVz
czoNCj4gWyAgIDMzLjQ3NzczMl0gIGMxZDAzYzAwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMA0KPiAwMCAwMA0KPiBbICAgMzMuNDc4NjMwXSAgYzFkMDNjODA6IDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIGYxIGYxIGYxIGYxIDAwIDAwDQo+IDAwIDAwDQo+IFsgICAz
My40Nzk1MjZdID5jMWQwM2QwMDogMDAgMDQgZjIgZjIgZjIgZjIgMDAgMDAgMDAgMDAgMDAgMDAg
ZjEgZjENCj4gZjEgZjENCj4gWyAgIDMzLjQ4MDQxNV0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeDQo+IFsgICAzMy40ODExOTVdICBjMWQwM2Q4MDogMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDQgZjMgZjMgZjMNCj4gZjMgZjMNCj4gWyAgIDMz
LjQ4MjA4OF0gIGMxZDAzZTAwOiBmMyBmMyBmMyBmMyAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMA0KPiAwMCAwMA0KPiBbICAgMzMuNDgyOTc4XQ0KPiA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFdlIGZp
bmQgdGhlIHJvb3QgY2F1c2Ugb2YgdGhpcyBPT0IgaXMgdGhhdCBhcm0gZG9lcyBub3QgY2xlYXIg
c3RhbGUNCj4gc3RhY2sNCj4gcG9pc29uIGluIHRoZSBjYXNlIG9mIGNwdWlkbGUuDQo+IA0KPiBU
aGlzIHBhdGNoIHJlZmVyIHRvIGFyY2gvYXJtNjQva2VybmVsL3NsZWVwLlMgdG8gcmVzb2x2ZSB0
aGlzIGlzc3VlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQm95IFd1IDxib3kud3VAbWVkaWF0ZWsu
Y29tPg0KPiAtLS0NCj4gIGFyY2gvYXJtL2tlcm5lbC9zbGVlcC5TIHwgNCArKysrDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
a2VybmVsL3NsZWVwLlMgYi9hcmNoL2FybS9rZXJuZWwvc2xlZXAuUw0KPiBpbmRleCBhODZhMWQ0
ZjM0NjEuLjkzYWZkMTAwNWI0MyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0va2VybmVsL3NsZWVw
LlMNCj4gKysrIGIvYXJjaC9hcm0va2VybmVsL3NsZWVwLlMNCj4gQEAgLTEyNyw2ICsxMjcsMTAg
QEAgY3B1X3Jlc3VtZV9hZnRlcl9tbXU6DQo+ICAJaW5zdHJfc3luYw0KPiAgI2VuZGlmDQo+ICAJ
YmwJY3B1X2luaXQJCUAgcmVzdG9yZSB0aGUgdW5kL2FidC9pcnENCj4gYmFua2VkIHJlZ3MNCj4g
KyNpZiBkZWZpbmVkKENPTkZJR19LQVNBTikgJiYgZGVmaW5lZChDT05GSUdfS0FTQU5fU1RBQ0sp
DQo+ICsJbW92CXIwLCBzcA0KPiArCWJsCWthc2FuX3VucG9pc29uX3Rhc2tfc3RhY2tfYmVsb3cN
Cj4gKyNlbmRpZg0KPiAgCW1vdglyMCwgIzAJCQlAIHJldHVybiB6ZXJvIG9uIHN1Y2Nlc3MNCj4g
IAlsZG1mZAlzcCEsIHtyNCAtIHIxMSwgcGN9DQo+ICBFTkRQUk9DKGNwdV9yZXN1bWVfYWZ0ZXJf
bW11KQ0K

