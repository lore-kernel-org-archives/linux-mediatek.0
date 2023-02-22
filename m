Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D264C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 06:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHs8nL7lrxXWq5GIIn2SAdTwEPHWCpJoCxZ/ZEEI5AM=; b=h3wriUyDAs6LaY0PsuCCCBNl46
	9YA1Q1/JAEzgdtIAoYMhBbAlpUf53HQq5Ax3XSmFQszhryXXF0Ev77gMevbyMeU/tADOkw3Qk9ggH
	a2sMdvgoEz6WU7tPhlxLTmBAHUSLaXXWk/2ZRJOufqyFiePJNi3dMwNXWMV50Iivtlcga2x9EQFW3
	rp6Y17B9vv4Gx9o1dk+TBUa/RD5mm+TOJj4IZjU/p3EFMKq6Rgj92UoF0FrRiQPk9Z8BPrdpqJlHd
	Kcg4Qo9DkOt393rdzZuTGtZTYI7TEVx9a+ZQWdKcZBkgpXICzYzzbFpsTNrzFay2pijUi5yHEYOI7
	xL0oXSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUikC-00Axmu-0y; Wed, 22 Feb 2023 06:36:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUik0-00Axl9-0P; Wed, 22 Feb 2023 06:36:37 +0000
X-UUID: 3d58ed82b27b11edbbe3f76fe852e059-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YHs8nL7lrxXWq5GIIn2SAdTwEPHWCpJoCxZ/ZEEI5AM=;
	b=FwbaIYBwQEBTttJeX3A8EYJL61/oA4RKLSsYE1KfC4gUX14xp1CDaCcyA00Or6x+ORC12MIxVDyRGF22ASA4wBhaZz/SUifw5/XSpm0UBRrdFiuy4yH6fe7gC6xdxW75AD1Qqnl4CX+GZmQn13wPUWsqdc60+hkbR103WAejUWw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:44ad53ef-2b1b-443f-9607-2f87ce3e2aec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:8c4ac3f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 3d58ed82b27b11edbbe3f76fe852e059-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 442260039; Tue, 21 Feb 2023 23:36:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 22 Feb 2023 14:26:26 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 22 Feb 2023 14:26:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2lARLmzNPVFjFdzTl6q9lDmPUW61UGZa8A2ReYG0j10kD//Hvkb3s8bretTDTAkBm51TH490pRe8DvQPYsXhWjOjhYhBkgwEdsuC295VMwrIQUQZqVCShO80YCZodR13DO1v8N74Ymak/a/E3vrOs2vEoqwluEubMj+9Ry6NunoQrhhAaVJO/cLARt7mHGgMt52rFVdulSeDuQT6t8zVJamw68+cdywjPCZ7H4e5sQYAOwuK5d7vDGa1dY8DbdyvR0n2qPRQC0tqae3ncKbuX2Mq8UBPuKLX1xIHoT4DvyKUPTKqF4NU4SQCswnpgGSbTt7DLKWSJbHN2/zZQHuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHs8nL7lrxXWq5GIIn2SAdTwEPHWCpJoCxZ/ZEEI5AM=;
 b=gMGJkH+mEIRWJVaYWpZA8R3kFLgwa2Ot1V3X11rsNcwK/ztqfFaB/RBhk/d/JcuXTcoa4d1u2ci9JTr+xG94eGD6beoRbIVyqWu0FYjrXZ4beaNsO/cpRlSB3eE+Hw06pz4NjrjPv7atWLfOotP7n+YrUUPKIGn+fqpD9NVPLnC/vrQ39F8YzSkwUkjX3thsvUNaaQ5n1EQG5plU3Un4XJBVOJwPDOVcRteIXUJwscPE45QqjtwRRPS8EPVZT8qPCgv0quSiNvoTjrugEKLWchQnoTtRr2N6vvSDmAxQ8DPP7u4f5n53kVUwe2EEbVEHCpzur92+K7wwuub2pduR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHs8nL7lrxXWq5GIIn2SAdTwEPHWCpJoCxZ/ZEEI5AM=;
 b=MkqzBsnw2YlFlHKTvgwhbDBtZQ32XBQN2nW3uMUQCPmQGx4XFYHDAClo5vBVnsNynh2uGLW6XHsLisOQ+JMaBuXgyxA5cH393HJOy7vP1eEBaXTI1pzqA+DqjJadp8k/+BjReUCiBRGupizSG9R26YnDN2+0Uovdx5orvbQZGf4=
Received: from PS1PR03MB4716.apcprd03.prod.outlook.com (2603:1096:300:7b::22)
 by KL1PR0302MB5380.apcprd03.prod.outlook.com (2603:1096:820:33::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 06:26:20 +0000
Received: from PS1PR03MB4716.apcprd03.prod.outlook.com
 ([fe80::c90f:4847:a826:31a9]) by PS1PR03MB4716.apcprd03.prod.outlook.com
 ([fe80::c90f:4847:a826:31a9%7]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 06:26:18 +0000
From: =?utf-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>
To: "sj@kernel.org" <sj@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, "damon@lists.linux.dev" <damon@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	=?utf-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] mm/damon/paddr: fix pin page problem
Thread-Topic: [PATCH] mm/damon/paddr: fix pin page problem
Thread-Index: AQHZRdNTND7zgF/rqkq7M1mbQTGl4q7ZusOAgADGt4A=
Date: Wed, 22 Feb 2023 06:26:18 +0000
Message-ID: <940f661c65e4fed70bd90bc6e4b6723e4f95b11f.camel@mediatek.com>
References: <20230221183501.132024-1-sj@kernel.org>
In-Reply-To: <20230221183501.132024-1-sj@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PR03MB4716:EE_|KL1PR0302MB5380:EE_
x-ms-office365-filtering-correlation-id: 3333e1d9-445a-4694-2b59-08db149db4f1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fhncMrF+/6TAZU9dnmrYolzvIkCo5YeIwJOaXlbGBFHbmKFHkqQ7haMGQz44zZLHBZE1AdjNZw5oa9dFEl6UZY5SAYnus8vxIRNn3CbkwbooDTALtB/+++wlRZSihh9i6aqmennFdkhxmtBDPLDC+KPUr+bSFH7eMTrlLiV8lNj/0QRi26a8fQgtyLPowavPut0BZwWqyLFGVXVGkqyV9q2qeXJt2murhWbDq1J2SN+dpx/y4Yqf//8XWrJ+Pax+K05TN+4HXXFqBTj63DLugNMzwiUHEibzXaBn5ZPIY+NQ/mj+mkOeDR/7tRQnfF4XHwNdXjwq01XDzD7xQLlVABkXInioah+lc2h8VxlDROvzsPx51HOIF4cwUeFcGSk4ScTQhOfeD0O8vmsRy5PWI2L3xrj9zAddsbZOlbYauNGbu32ZQfX89/oSqyDLuCRyopZsJAxYHzuUiLAeNw0zvgDJt1tg/S8h+yYX95sXOgFsw+eEOIfCyP4TQDs3WfNdAVS6zJzRS0Tq/7unG8gryrigGVgE34kxnLf29NfjLfH7FWp/oQNEVEypNVJGDKLm60yCOaL/2BtgL3e0mT1TZz/5ljL3OouZzgAdUaSM41adcxbw5Rq4uncndFb7xS8c8bodMfmZ7S0au/YvHgE1IrXUZ15SYchUOnqItHhSyL3eIni30VOaE06iy59oc1UHbv6lrwcJhncrAHaaksncEpxFBhb5kRd2BIP3afF8nHKJn2dizLMq14wM5Xjji8RtqDhy/ELU6Iw6lQK2/b40LQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB4716.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199018)(26005)(6512007)(8936002)(186003)(2906002)(38100700002)(7416002)(5660300002)(122000001)(6506007)(38070700005)(41300700001)(91956017)(76116006)(966005)(66556008)(66946007)(8676002)(64756008)(66446008)(6916009)(4326008)(6486002)(2616005)(66476007)(86362001)(316002)(478600001)(36756003)(54906003)(85182001)(83380400001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnoyT1d4Z01uR3dYMlZnYS9aTUNHVjhpRHRoRVFZdTdpL0NNOU9KVG9VU1FP?=
 =?utf-8?B?ZWYyMi9qVkc0b3BtYWFRZVJHWHhES0JrSlJNcnJpSDBiVWYxODlWRGlPT2Zy?=
 =?utf-8?B?NjlCWmkxY1lRUS96UHlkSUE1NzJPakZPT3JRRktCcGtSeHUyUnZSRVJSdzE3?=
 =?utf-8?B?VndXaUx2bHZGSUZEVzVISmpxbSttWXlmakExeUp4MmVKZHZIR3NvRE5pWTBs?=
 =?utf-8?B?MHFCNDAwR2hVOVdSM3dPQlBuckttZVFvQ1h3NGZIWGtpTkowdml6UEg3MVRM?=
 =?utf-8?B?VDB4ZnlnZXMybGIwWXFDL0FTM2kyeFBPTTdSSVlkM1FPNXY1WTFFZ1lLNHFD?=
 =?utf-8?B?M3BMRUJYNXRCQThMejNJK2g3dGZlajAzUHUyWDBHT1VlZTJ6Si9vV3NiWCs0?=
 =?utf-8?B?WnZPYWNpNXl6NFN3OFpVV0UzakI0ZXVwVkM1dVFOdEFRWk5QVDNwaVkySWt3?=
 =?utf-8?B?b29zZk1JcUJxYzlRUkVFam8weTd1a2hrMC9WVkZxNDUrVENqZmh2SkJld2dX?=
 =?utf-8?B?UFJIZGI1bzdSblRNTEt4SVVjbDN1d3A1VGY0d0xOQklCRGRkcm5QcUU2ck5E?=
 =?utf-8?B?N00zdEJLNkx3d3BNTkR4dnZvOHJ5cU9ucTVaeUhJQ0k0N01sSkVkSTBLdjh4?=
 =?utf-8?B?UzNySU9mRTJaNFRRWGYyaG9zcVllaTkrekVoZzhrVVByOEdaL2RnTkJOMnF3?=
 =?utf-8?B?a3E5dlYwWXZwQmJQNk5lOWFmU2pSSE9GNU5qUU1RYzlJWG9qUWxwSUs3aGE0?=
 =?utf-8?B?citaSkpoUHdGMjRxajdzRGZkc1Npc3BkaFQ4TDNjMHlHRnVwVWlKT0xJSnNO?=
 =?utf-8?B?ZUphVjF3am1aa0dNRlF1TDlqR3JaY2R5bmVJa2FVeERSdlg1cFJGKzBYNHpi?=
 =?utf-8?B?Wk5XV3ZsdHJpS1BFMHFoeXBpSTVBV3UzVlNlSFBNVGkrWjZGZGNGSmZncUJX?=
 =?utf-8?B?U1J3VWYxSXRXdXg3U1lwR3hmV0NWOVozbXFMM1NPdHYwUm9zL2RJYXJFMjFS?=
 =?utf-8?B?Z0RiSTJOMEVWS2t3VTN1K0FidHJhaWxTWkhUZzRyY0oxN0tPNDdVbk1WdytW?=
 =?utf-8?B?dnA2QnJ0aVB3NFBrdW51RTR0ekppeHJtRnM5eWZGb1ZMQTFsVDFpZ2l1TEZU?=
 =?utf-8?B?TUJFSGhtUDZoWitSdXRHS1E5dk1IdWU2djNhL1RTbHNQZ2RsS1cxbDNTL082?=
 =?utf-8?B?RCtnTjdEcEJiM1lJVWxFbnViWXBtcC9EUlppRzdvaGNZK1l0eDVZUGg2WmNq?=
 =?utf-8?B?Q1M5VWZzbHVRUmYyMXJZMHFWdEVYV1ljajl4TWdwNVJMZmxMblpuS2hYQmJG?=
 =?utf-8?B?aUFrMGo5Vjc3aitOcmYzRmw2VStXN1NvZEtyQkhXVm5nY2E3bUF0SktDSk9m?=
 =?utf-8?B?YVgvU3A1RG1HaHVnNEpDNGh3V1RXdjZrQXJwRmlJbThJbTcyNitpSkJDbnM2?=
 =?utf-8?B?b1duSVRrRDdPSlFjcVA4WGpsTkV4K1FNbkMxYks5QkNyOHRQQXZrWTZlT1Ft?=
 =?utf-8?B?ZnhoVGlpSjlSbWUxVHBWRkZMOW9uMUFSQmVKZ25JMDI2M1FqNUFLTS85enRp?=
 =?utf-8?B?YjRVWUhtZVhlVVhQK0pVMnQ1cUhidS83bnNUaUxGSVZkMEhPVFduMEEwTzVF?=
 =?utf-8?B?dEJKL0dobUwyWkJqdXVFMkNJUlJkQXYzTWdvQU9yNGpkait6YkxmQ3FkYis4?=
 =?utf-8?B?TFBUTDB1ZXJhWC9wRmlydWVUcnVOc2hVVHpEc0UveUVyU2MyUHUrclhJaklv?=
 =?utf-8?B?ck1XOVkwdDNCNURlV1pHZ0xwRklKcGdtVFR1b2tRdkx0bXVqL3BCazErZEVC?=
 =?utf-8?B?ZStQZjVJQWZRTHhVOW1wUmJMRXNMTlBiTjY0MlJjMW43WUlwUGoxTlJYTHVZ?=
 =?utf-8?B?NGZRaysxaDBYN2RPS3o4NEhCWUt5Vmw4UmxvbmErOXNoeXhqVFRmenR2T05o?=
 =?utf-8?B?WkJ1elNXS2laRWcxSTU0Mzc5Zk95SFdDRndhV1NMNGE0Q0V6aDFJMjJCeFRj?=
 =?utf-8?B?OXpxR083WVgyYm1ISEJxenpzUWtSd3NlbHduTlROcXNTcHA4N21HdUZFS2xk?=
 =?utf-8?B?WGh0eUwvNklkZTM5MS9qQk9mNVZqdHVEYWlaS0MzenJZVEJEclRLWjV4OXo1?=
 =?utf-8?B?WXk3T08rV3h5SHI2TWpuZVIreXdheWhEZ1h2RmhGVUZwa2crSlp2S3RwZWJl?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2D5990E3FAEAF4EA659D80DF3BE12C3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB4716.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3333e1d9-445a-4694-2b59-08db149db4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 06:26:18.1026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eFNJbdp3IrEKUobKs5f+IFwl/XmkFSg4r2DqF5YYd3SbgBjfppI8eLiAEFauBWX4MWpuzWH8sgeRXq7XTsm5djSPLNaZm1dZEIHQSdgR5go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_223636_297313_E8437693 
X-CRM114-Status: GOOD (  29.56  )
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

T24gVHVlLCAyMDIzLTAyLTIxIGF0IDE4OjM1ICswMDAwLCBTZW9uZ0phZSBQYXJrIHdyb3RlOg0K
PiBIaSBBbmRyZXcsDQo+IA0KPiANCj4gT24gVHVlLCAyMSBGZWIgMjAyMyAxNzowMzoxMyArMDgw
MCBBbmRyZXcgWWFuZyA8DQo+IGFuZHJldy55YW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+IA0K
PiA+IEZyb206ICJhbmRyZXcueWFuZyIgPGFuZHJldy55YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAN
Cj4gPiBkYW1vbl9nZXRfcGFnZSgpIHdvdWxkIGFsd2F5cyBpbmNyZWFzZSBwYWdlIF9yZWZjb3Vu
dCBhbmQNCj4gPiBpc29sYXRlX2xydV9wYWdlKCkgd291bGQgaW5jcmVhc2UgcGFnZSBfcmVmY291
bnQgaWYgdGhlIHBhZ2UncyBscnUNCj4gPiBmbGFnIGlzIHNldC4NCj4gPiANCj4gPiBJZiBhIHVu
ZXZpY3RhYmxlIHBhZ2UgaXNvbGF0ZWQgc3VjY2Vzc2Z1bGx5LCB0aGVyZSB3aWxsIGJlIHR3byBt
b3JlDQo+ID4gX3JlZmNvdW50LiBUaGUgb25lIGZyb20gaXNvbGF0ZV9scnVfcGFnZSgpIHdpbGwg
YmUgZGVjcmVhc2VkIGluDQo+ID4gcHV0YmFja19scnVfcGFnZSgpLCBidXQgdGhlIG90aGVyIG9u
ZSBmcm9tIGRhbW9uX2dldF9wYWdlKCkgd2lsbCBiZQ0KPiA+IGxlZnQgYmVoaW5kLiBUaGlzIGNh
dXNlcyBhIHBpbiBwYWdlLg0KPiA+IA0KPiA+IFdoYXRldmVyIHRoZSBjYXNlLCB0aGUgX3JlZmNv
dW50IGZyb20gZGFtb25fZ2V0X3BhZ2UoKSBzaG91bGQgYmUNCj4gPiBkZWNyZWFzZWQuDQo+IA0K
PiBUaGFuayB5b3UgZm9yIGZpbmRpbmcgdGhpcyBpc3N1ZSEgIEkgdGhpbmsgdGhlIERhdmlkIHN1
Z2dlc3RlZA0KPiBzdWJqZWN0WzFdIGlzDQo+IGJldHRlciwgdGhvdWdoLg0KPiANCj4gSSB0aGlu
ayB3ZSBjb3VsZCBhZGQgYmVsb3cgRml4ZXM6IGFuZCBDYzogdGFncz8NCj4gDQo+IEZpeGVzOiA1
NzIyM2FjMjk1ODQgKCJtbS9kYW1vbi9wYWRkcjogc3VwcG9ydCB0aGUgcGFnZW91dCBzY2hlbWUi
KQ0KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNS4xNi54DQo+IA0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IGFuZHJldy55YW5nIDxhbmRyZXcueWFuZ0BtZWRpYXRlay5jb20+DQo+
ID4gLS0tDQo+ID4gIG1tL2RhbW9uL3BhZGRyLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9t
bS9kYW1vbi9wYWRkci5jIGIvbW0vZGFtb24vcGFkZHIuYw0KPiA+IGluZGV4IGUxYTQzMTVjNGJl
Ni4uNTZkOGFiZDA4ZmIxIDEwMDY0NA0KPiA+IC0tLSBhL21tL2RhbW9uL3BhZGRyLmMNCj4gPiAr
KysgYi9tbS9kYW1vbi9wYWRkci5jDQo+ID4gQEAgLTIyMyw4ICsyMjMsOCBAQCBzdGF0aWMgdW5z
aWduZWQgbG9uZyBkYW1vbl9wYV9wYWdlb3V0KHN0cnVjdA0KPiA+IGRhbW9uX3JlZ2lvbiAqcikN
Cj4gPiAgCQkJcHV0YmFja19scnVfcGFnZShwYWdlKTsNCj4gPiAgCQl9IGVsc2Ugew0KPiA+ICAJ
CQlsaXN0X2FkZCgmcGFnZS0+bHJ1LCAmcGFnZV9saXN0KTsNCj4gPiAtCQkJcHV0X3BhZ2UocGFn
ZSk7DQo+ID4gIAkJfQ0KPiA+ICsJCXB1dF9wYWdlKHBhZ2UpOw0KPiANCj4gU2VlbXMgeW91ciBw
YXRjaCBpcyBub3QgYmFzZWQgb24gbW0tdW5zdGFibGUgdHJlZVsyXS4gIENvdWxkIHlvdQ0KPiBw
bGVhc2UgcmViYXNlDQo+IG9uIGl0Pw0KPiANCj4gQWxzbywgbGV0J3MgcmVtb3ZlIHRoZSBicmFj
ZXMgZm9yIHRoZSBzaW5nbGUgc3RhdGVtZW50c1szXS4NCj4gDQo+IFsxXSANCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvZGFtb24vMWIzZThlODgtZWQ1Yy03MzAyLTU1M2YtNGRkYjM0MDBkNDY2
QHJlZGhhdC5jb20vDQo+IFsyXSANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vZG9jcy5rZXJuZWwub3JnL25leHQvbW0vZGFtb24vbWFpbnRhaW5lci1wcm9maWxlLmh0bWwq
c2NtLXRyZWVzX187SXchIUNUUk5LQTl3TWcwQVJidyFqbFlyYTNDUVBYTnNwcE9Xc3BrQWtSTzJB
ZktKRW9NeUF1OF9Kdlo5ZVk1YjBZUWJUQjZzWDFHYXMtWlJ0ck1LWGZ4eHBpN1BFZTh5ZWckwqAN
Cj4gIA0KPiBbM10gDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2RvY3Mu
a2VybmVsLm9yZy9wcm9jZXNzL2NvZGluZy1zdHlsZS5odG1sP2hpZ2hsaWdodD1jb2Rpbmcqc3R5
bGUqcGxhY2luZy1icmFjZXMtYW5kLXNwYWNlc19fO0t5TSEhQ1RSTktBOXdNZzBBUmJ3IWpsWXJh
M0NRUFhOc3BwT1dzcGtBa1JPMkFmS0pFb015QXU4X0p2WjllWTViMFlRYlRCNnNYMUdhcy1aUnRy
TUtYZnh4cGk2OWpJT3RTUSTCoA0KPiAgDQo+IA0KPiANCj4gVGhhbmtzLA0KPiBTSg0KPiANCj4g
PiAgCX0NCj4gPiAgCWFwcGxpZWQgPSByZWNsYWltX3BhZ2VzKCZwYWdlX2xpc3QpOw0KPiA+ICAJ
Y29uZF9yZXNjaGVkKCk7DQo+ID4gLS0gDQo+ID4gMi4xOC4wDQoNClRoYW5rcyBmb3IgYm90aCBv
ZiB5b3VyIHN1Z2dlc3Rpb25zLCBJIHdpbGwgdXBkYXRlIHRoZSBwYXRjaC4NCg==

