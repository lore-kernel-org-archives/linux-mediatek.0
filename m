Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3650C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9jm3CpIVQblK48yEd22SpT/YpYn6bc2i+iVm4cAagI=; b=dq25rSKhwQj7LkKka4gNq09h5H
	JSbhIDnMln9/Tx+NT9PuNN1TKIpcEa0SkmZYt2rW03IEf1CrwQd6TysRWMTazb1kjbS3jouf03iVv
	xs3nEMdQG+x5DvKqj82SmzYxvgk59n7UOHYfPDGsC5XbVcfb1XnMsm4+wIviYhU4FoVgtgCX5ZPRK
	TxOipd0CyUI1O27aD+JufMYuEz3aboJizPQlbYvnlfStAuG6KJw8/mDqth6w979X7K51Js3VO9Foy
	toMQBwYaMYa7x5aE374fx68g/CdNW9QgoJz3RYaOGtlKWVsCiA5P4fkYJUzVVNL1rCsr4E0NDVnNU
	FvWPaO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pruxQ-005XsT-1E;
	Thu, 27 Apr 2023 06:18:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pruxM-005Xrp-23;
	Thu, 27 Apr 2023 06:18:18 +0000
X-UUID: 4754e884e4c311ed8687db9d93187ff1-20230426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=O9jm3CpIVQblK48yEd22SpT/YpYn6bc2i+iVm4cAagI=;
	b=QGjT4LQC/7OFnfq/Q76UZgiUUu0iodcvU7hNZV2HFh7aEB47JiwfOe96mch2+WZr03iNw3Ozsog6zuONsEFjKBok8OE2DBcKtHsP9WfOs8TLJ9TQPxlpuSiXHh6wx+PXW5JRhm92B13/rzYrANXPtIMTVZH6surp898d9hKWiws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:4b6ffa46-39a6-491b-b265-9f6739685075,IP:0,U
	RL:0,TC:0,Content:12,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:12
X-CID-META: VersionHash:120426c,CLOUDID:d5e10a30-6935-4eab-a959-f84f8da15543,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 4754e884e4c311ed8687db9d93187ff1-20230426
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chun-hung.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 117946852; Wed, 26 Apr 2023 23:18:08 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Apr 2023 14:07:31 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Apr 2023 14:07:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9lR7IZhu1/USjWcFelpj4mKGuLcS8qdctbueyoOtJdNLMcd+Y3jgDOCpbZ0ETHPCsIduXCl52GqAqm3mb2oauOs2xm5voK/vvNsGEXWeKZ23Yc8tat8v3abiMPCd1/59jDf9S8gdQ7QAXGJntBqpUkCGLRls1kPyK4VDYj2VwlHPgWcoR/FzVZHVsBYnYxEvLBKPwIEf7A8v3kP9sktkinjwdPmFuqBgR/CIICHOFejkBZbZOZueBkmtvvBQvqilbDCtzObodgyA+Z/x4oht87fgmfNJffR5/kxI6RW/Zl+9cS50BcznLZydw70x7DPMRTRmkdWT04mjOjnGWICkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9jm3CpIVQblK48yEd22SpT/YpYn6bc2i+iVm4cAagI=;
 b=k410dzXkZb6SxGbk+hD7+gr59A98N6T2k3lqf6b6mgDXtGRXtCGN3PpvR5HqmSW2x/CsRYwixlRfhQ9NzSGNoLVghmRqlJQMyycaMrkX8RCq8OkhQyPCbpDBLAGCRPSnYKgSMwFseiVmtOCUzkEaoGV0jOKq0rCZH7ODNfWyJjQAiXtTlO9qSZWpz4VXDqcQPYj0OBQGaNYH9e0cmgc9zgIzZeI/VLPcrkHTHot4mcw6D/NQ2zZKRhctWv6tNHbOKTzmn2B5bNEFaXpOO9qAoB5t4L0p4RuKl2L8QJfnqBXPeIqp+BibT7rTsg7GfGOqNVPlR1O3/TjFXegrQZ9DKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9jm3CpIVQblK48yEd22SpT/YpYn6bc2i+iVm4cAagI=;
 b=ahbU30Lr2XRriTrqZXYajUOH1B0DQDgEIOMSbkeiJFskoxh/y9Aapjo2scuo3F+By5vF53Wt5eCy6Bw0KiT+/mISEyMdVM3GpbirGFzxf3v8v1uvdfwZWpKOswB9r+41LSeRNJDw2mEvq89wR7q86qx+VOXh8qPOkfCE1WFOxE0=
Received: from KU1PR03MB2808.apcprd03.prod.outlook.com (2603:1096:802:29::22)
 by TYZPR03MB5712.apcprd03.prod.outlook.com (2603:1096:400:64::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 06:07:30 +0000
Received: from KU1PR03MB2808.apcprd03.prod.outlook.com
 ([fe80::34ca:ae7d:147c:8732]) by KU1PR03MB2808.apcprd03.prod.outlook.com
 ([fe80::34ca:ae7d:147c:8732%2]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 06:07:29 +0000
From: =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?V2FsdGVyIENoYW5nICjlvLXntq3lk7Ip?= <Walter.Chang@mediatek.com>,
	"will@kernel.org" <will@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?=
	<stanley.chu@mediatek.com>, =?utf-8?B?RnJlZGR5IEhzaW4gKOi+m+aBkuixkCk=?=
	<Freddy.Hsin@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Add workaround for
 MediaTek MMIO timer
Thread-Topic: [PATCH] clocksource/drivers/arm_arch_timer: Add workaround for
 MediaTek MMIO timer
Thread-Index: AQHZcQwpVkPWQ2VtOESlwKVyxxA9KK8+uv4A
Date: Thu, 27 Apr 2023 06:07:29 +0000
Message-ID: <112d386d29e4bf0869c0ed6f4a1929bdcbb106af.camel@mediatek.com>
References: <20230417090635.13202-1-walter.chang@mediatek.com>
In-Reply-To: <20230417090635.13202-1-walter.chang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KU1PR03MB2808:EE_|TYZPR03MB5712:EE_
x-ms-office365-filtering-correlation-id: 45b36dc8-e50f-4b48-8c8a-08db46e5aeea
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DhVA2RUXteBkaZ5KHLWmhDHs30oXpGJ6fNdJc5ra+M+eSuTR1ZiBrNdkVimsmpt1K3t9t8o4qlwQ19rseIBA998wctOipNwpuYdPnjPict0HAiQKkxnV80PX81jmk7pXpxOU2/mq8NbbrETPPU1XEZFKlZSBeWAh/ndQrm+c+WL5rWO+xwWuIpqjbS4lWEmJDpY2Eev+L179ecwYv7is1tzorwJTRED34HQXdsZKkQxFwxahL88GLgBcL5R5tLUUlCXj5HHbE73pfjxuOYDCLvSz3Kf1nVKryrnmjPuO9Hq/y4L+jYrGZGgVpJBmNXOumAQAbbjOYiZNJQPUFG8Sb0oykfpdlHWPiIHouVPcosBsL2n7uEvygekHaHNg/jmwHgAwv3nrQ+LfwThAAplalbTml+2w2cYLwM8k49TN7hYsUFO4MNBexrGq3AZr9x4st6OmttBeKvwltOg7fWmz3rZ1+55gBfWInkiBQePkfdes4yoyT02Ktgj7jTRNsmBfzMgYTPvNePaUiEhN5YUCyBSY7BhjDC9xZZCPkU4nm27ofisvausts3y2FabTXYiD9FT5RF4DAir7MZ3OMGaHRel+X8M5kpmuki9+2xChiT5wzbxZFjB1ziyg5sjHJ9XJ9MKJgmuOCZ7Kz9x3y51+D3dhxQluf4QspaeBXYX4LCwbOiTiVW2g5awH31lF+6Sa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KU1PR03MB2808.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(4326008)(2616005)(91956017)(66446008)(76116006)(66556008)(66946007)(316002)(66476007)(64756008)(83380400001)(186003)(71200400001)(110136005)(6486002)(54906003)(478600001)(921005)(41300700001)(8676002)(122000001)(8936002)(38100700002)(7416002)(6512007)(38070700005)(5660300002)(26005)(6506007)(2906002)(36756003)(86362001)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUkxWmw2NVZjUWRuSmJZViszWVNHWTl3eHV6NVR5TzdpcXhEdWwreGs2eTM2?=
 =?utf-8?B?dTgyR05SSlk4MnFvZ1g0MTdsWndNQWlRLzFTbnd6bHpYZTVwZG1xY3pXOHVE?=
 =?utf-8?B?Zm9GOTlhdENsTXdVR0xyQkZwSGJrRVUxa1kwaXlGU1RoT2s3QzVRTmN0VXU1?=
 =?utf-8?B?Z2Nvb1hZR3duakY2UW1yN2hlVnYzZWZEK01KNTJjc1YyeGJVVHRuS0Vhb1I0?=
 =?utf-8?B?VjhNZHdHVUpEMytkWFFwSHU1dXA4MHJtdjh2UFBpeVplc05DWEtQVXh6YTVZ?=
 =?utf-8?B?Z1Q2V0x2VEMvWUYraVVhSzNHWVlVNG1vZjRNalBjZWdXK2JtOFBCL1pJOU5n?=
 =?utf-8?B?MUhuTStJaFFsVnZtQnBaUGpyUnhmNzFKQWxTM0ZyNktoL0tib3BsTzQwcDVi?=
 =?utf-8?B?azBWTHJQRVRTNkhhM2hoRmdrK0RmNTlOVStxSUx2Um0vREcvQXJ6cnNEeU9H?=
 =?utf-8?B?L1h2S3VDWjZJdGxVd1ZqZVdMdWlwcmN0MEZZZ0tvSGFhc0czMG5YU0oyT3RU?=
 =?utf-8?B?MkFLak5ORnpRZEZRaE0zMEZuVVEwdGxWblpzU2hNRTVBRm5iQlFxMzdHTFBs?=
 =?utf-8?B?MmF5R2ErNnlBSFNjeGZCQ29wNG1mb2xjbHpaZng3MUFaZ2ZyVVZZeGFFRGxn?=
 =?utf-8?B?T1VJQUVoVmUrbHBRL25XazM2N3YvTFpvL2hGUGpkengrVlI4TUk3amx6MThi?=
 =?utf-8?B?cEdYaDJpWGlib1FOd1hGdk9PLy82SUlYVnhOdmIrZE5hdG9NcnFnQ01yUEcv?=
 =?utf-8?B?Z2diWGpCa1V5TDF5SEJnTjNGd0paZjhjaVBmaFc1N1d2YzRtQVEvVXREWkRv?=
 =?utf-8?B?TEczaVBkYXJ3cW8ybTdabjlOMWJhWEQ0ZSsyZU0zTnlPOUt0NHY1YU10bVlZ?=
 =?utf-8?B?b2ZnUGlXRTcrQytPQ29wQU5oVXpndlZIZ3VtNjdjNVdrVGFTeGlSaU1NUU9w?=
 =?utf-8?B?Mkk1N2s5UGlESGZQMy9ReUhySFNWb3dxMlhiZG5qaDhqNjRoK0xDbDNxUU1M?=
 =?utf-8?B?WkpoLzY0UDdQVmNZeExNRmE5WE1DbnZWNG5tZ3pQOG5pRlRQQjRVQWFwYjgz?=
 =?utf-8?B?ajgrL2c3dGg1S3BValg0Y0YwM3ZhMUwvbDhscCtRYWdNZ291Vjc4bzQ3K29k?=
 =?utf-8?B?RGhpK1M3UDA5Z0RrUnZ4VWdJdXYxdUNMNnYvTEJybU41V1J3aDZieTBMSDlO?=
 =?utf-8?B?U1hDV0JHRUc5aHcvQ1pCOW5EZkF3ZEZwZ0VtSE83MXVQaTI4ellXcU1Zelg2?=
 =?utf-8?B?YXR5YWNtbGNaSDFDSWJ5YlNTZytKZFdSOUtDUVZWS2JjWEsxYWRiZ2ZHT2Vs?=
 =?utf-8?B?UEdwTCtLN20vem5BOERWeXlyOXkxN25ubzVaS1dyN2o2VTl0eDBlMmd6QXZj?=
 =?utf-8?B?aG9xVTljbmZycGFaay8rczF0ZjVwUG1PZGtOZUxuWkZVa3YybXlLL3I5c2ln?=
 =?utf-8?B?cXdLVXRtcFFiRENuM0d3eWtZZlo2ZkYrbXZXbzRCcU5FSjhobHlibEtua1Rj?=
 =?utf-8?B?UHFUd3hOTXdlMjVMSXhzbjNjc3NpVUtGNmpZY2JjKzBpa2hob3hVSjJSMTRI?=
 =?utf-8?B?eHhrY0Z4bHZ2MDhvT1JIRCs2L2xZaGI0U1FwRVhwZSt0T1hZVVgzdjRGcWpw?=
 =?utf-8?B?REtyVVlmdjllb0JWUktMMmVyZkM4eWk5TFNMRm5OL1VLTXFJcmxSaEJlUXFq?=
 =?utf-8?B?b1J0Y1lBWkxVYkcrQU8zRVJkQ1dUTE1HWDFUV0lwYXdzY3NiaFRMTXludGNy?=
 =?utf-8?B?OFRHa3NZT212TG5halZtT1ZodGRoeUIwSWlwYmlMUk1HemxCaVBmVDdQaWFp?=
 =?utf-8?B?UnladXJsYURScmJKb0xqK3ZIRjgxYnUzaUE4TjdXM0lEUW42ZGJYTm1SOEUx?=
 =?utf-8?B?YlFhUWE0L0VNQzFBWTB1amZHbndtLzNLNFBYOStrUEQwV2V3TjZPRm5nQzZ3?=
 =?utf-8?B?STQrOTRtNG95WGozS2hub2NqV3A4VkxJVDJpTytFeW5kaVRvd2dYSXdZTGNK?=
 =?utf-8?B?ck0yeklaY29pekpQMUUzSGFQS2JYQ0tKaTFKM3VMeVE1dWp6T0hmUWFmNGJO?=
 =?utf-8?B?T3F3V0pQRVJBdGF1bWJVa05JVURISUo3SXpCWnFmWGdRNEkwMCtobWhnSzln?=
 =?utf-8?B?SE9xZnhRQjQ3L084UnhXbzRBQzNBQ09yNkQwWTFhRjU2dTJnZkF6V0JmbU1w?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <956F0AA58F9DC64B9BFB481C57318278@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KU1PR03MB2808.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b36dc8-e50f-4b48-8c8a-08db46e5aeea
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 06:07:29.8913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e5SgTXk6hsNWg0BbRncMUf6qhOWm9q7UYrlnlFAtgCWnG95RVC7qdlYcKcQ842+frkNF7KIQaJhMSI7yzwWB9lW7zqwpAJTbhW1iDUsWcUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_231816_825049_68C2738E 
X-CRM114-Status: GOOD (  24.08  )
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

T24gTW9uLCAyMDIzLTA0LTE3IGF0IDE3OjA2ICswODAwLCB3YWx0ZXIuY2hhbmdAbWVkaWF0ZWsu
Y29tIHdyb3RlOg0KPiBGcm9tOiBXYWx0ZXIgQ2hhbmcgPHdhbHRlci5jaGFuZ0BtZWRpYXRlay5j
b20+DQo+IA0KPiBUaGUgTVQ2OVhYIHNlcmllcyBTb0NzIGhhdmUgdGhlIGluY29tcGxldGUgaW1w
bGVtZW50YXRpb24gaXNzdWUgaW4NCj4gdGhlDQo+IG1taW8gdGltZXIuIFNwZWNpZmljYWxseSwg
dGhlIGhhcmR3YXJlIG9ubHkgaW1wbGVtZW50cyB0aGUgVFZBTA0KPiBmdW5jdGlvbmFsaXR5LCBi
dXQgbm90IHRoZSBDVkFMIGZ1bmN0aW9uYWxpdHkuIFRoaXMgaGFyZHdhcmUNCj4gbGltaXRhdGlv
bg0KPiB3aWxsIGNhdXNlIHNldF9uZXh0X2V2ZW50X21lbSgpIGZhaWwgdG8gc2V0IHRoZSBhY3R1
YWwgZXhwaXJhdGlvbg0KPiB0aW1lDQo+IHdoZW4gd3JpdGluZyBhIHZhbHVlIHRvIHRoZSBDVkFM
LiBPbiB0aGVzZSBwbGF0Zm9ybXMsIHRoZSBtbWlvDQo+IHRpbWVyJ3MNCj4gaW50ZXJuYWwgZXhw
aXJhdGlvbiB0aW1lIHdpbGwgc3RpbGwgYmUganVkZ2VkIGFzIDAgKHRoZSB2YWx1ZSBvZg0KPiBU
VkFMKSwNCj4gcmVzdWx0aW5nIGluIHRoZSBtbWlvIHRpbWVyIG5vdCBmdW5jdGlvbmluZyBhcyBp
bnRlbmRlZC4NCj4gDQo+IFRoZSB3b3JrYXJvdW5kIGlzIHRvIHVzZSBUVkFMIGluIGFkZGl0aW9u
IHRvIENWQUwgZm9yIHRoZXNlIGFmZmVjdGVkDQo+IHBsYXRmb3Jtcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFdhbHRlciBDaGFuZyA8d2FsdGVyLmNoYW5nQG1lZGlhdGVrLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVrLmNvbT4NCg0KPiAtLS0N
Cj4gIERvY3VtZW50YXRpb24vYXJtNjQvc2lsaWNvbi1lcnJhdGEucnN0IHwgIDQgKysrKw0KPiAg
ZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnICAgICAgICAgICAgfCAgOSArKysrKysrKw0KPiAg
ZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fYXJjaF90aW1lci5jICAgfCAyOQ0KPiArKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcm02NC9zaWxpY29uLWVycmF0YS5yc3QN
Cj4gYi9Eb2N1bWVudGF0aW9uL2FybTY0L3NpbGljb24tZXJyYXRhLnJzdA0KPiBpbmRleCBlYzVm
ODg5ZDc2ODEuLmNhMTg5MzcxM2E0YyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcm02
NC9zaWxpY29uLWVycmF0YS5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcm02NC9zaWxpY29u
LWVycmF0YS5yc3QNCj4gQEAgLTIwOSwzICsyMDksNyBAQCBzdGFibGUga2VybmVscy4NCj4gICst
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLQ0KPiAtLS0tLS0tLS0tLS0tLS0tLSsNCj4gIHwgRnVqaXRzdSAgICAgICAgfCBBNjRG
WCAgICAgICAgICAgfCBFIzAxMDAwMSAgICAgICAgfA0KPiBGVUpJVFNVX0VSUkFUVU1fMDEwMDAx
ICAgICAgfA0KPiAgKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tDQo+IC0tLS0tLS0tLS0tLS0tLS0tKw0KPiArDQo+ICsrLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0NCj4gLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICt8IE1lZGlhVGVrICAgICAgIHwgTVQ2OVhY
IHNlcmllcyAgIHwgIzY5MDAwMSAgICAgICAgIHwNCj4gTUVESUFURUtfRVJSQVRVTV82OTAwMDEg
ICAgIHwNCj4gKystLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLQ0KPiAtLS0tLS0tLS0tLS0tLS0tLSsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZw0KPiBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2Nv
bmZpZw0KPiBpbmRleCA1ZmM4ZjBlN2ZiMzguLjQ3NTM1NmI4ZGJkYyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2Uv
S2NvbmZpZw0KPiBAQCAtMzY4LDYgKzM2OCwxNSBAQCBjb25maWcgU1VONTBJX0VSUkFUVU1fVU5L
Tk9XTjENCj4gIAkgIHRoZSBBbGx3aW5uZXIgQTY0IFNvQy4gVGhlIHdvcmthcm91bmQgd2lsbCBv
bmx5IGJlIGFjdGl2ZSBpZg0KPiB0aGUNCj4gIAkgIGFsbHdpbm5lcixlcnJhdHVtLXVua25vd24x
IHByb3BlcnR5IGlzIGZvdW5kIGluIHRoZSB0aW1lcg0KPiBub2RlLg0KPiAgDQo+ICtjb25maWcg
TUVESUFURUtfRVJSQVRVTV82OTAwMDENCj4gKwlib29sICJXb3JrYXJvdW5kIGZvciBNZWRpYVRl
ayBNVDY5WFggZXJyYXR1bSA2OTAwMDEiDQo+ICsJZGVwZW5kcyBvbiBBUk1fQVJDSF9USU1FUiAm
JiBBUk02NA0KPiArCWhlbHANCj4gKwkgIFRoaXMgb3B0aW9uIGVuYWJsZXMgYSB3b3JrYXJvdW5k
IGZvciBpbmNvbXBsZXRlDQo+IGltcGxlbWVudGF0aW9uDQo+ICsJICBpbiB0aGUgTU1JTyB0aW1l
ciBvbiB0aGUgTWVkaWFUZWsgTVQ2OVhYIFNvQ3MuIFRoZSB3b3JrYXJvdW5kDQo+ICsJICB3aWxs
IG9ubHkgYmUgYWN0aXZlIGlmIG1lZGlhdGVrLGVycmF0dW0tNjkwMDAxIHByb3BlcnR5IGlzDQo+
ICsJICBmb3VuZCBpbiB0aGUgdGltZXIgbm9kZS4NCj4gKw0KPiAgY29uZmlnIEFSTV9HTE9CQUxf
VElNRVINCj4gIAlib29sICJTdXBwb3J0IGZvciB0aGUgQVJNIGdsb2JhbCB0aW1lciIgaWYgQ09N
UElMRV9URVNUDQo+ICAJc2VsZWN0IFRJTUVSX09GIGlmIE9GDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3RpbWVyLmMNCj4gYi9kcml2ZXJzL2Nsb2Nrc291cmNl
L2FybV9hcmNoX3RpbWVyLmMNCj4gaW5kZXggZTA5ZDQ0MjdmNjA0Li45MjA1NzBkNTdmYzAgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvYXJtX2FyY2hfdGltZXIuYw0KPiArKysg
Yi9kcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3RpbWVyLmMNCj4gQEAgLTM4OSw2ICszODks
MTAgQEAgc3RhdGljIHU2NCBub3RyYWNlDQo+IHN1bjUwaV9hNjRfcmVhZF9jbnR2Y3RfZWwwKHZv
aWQpDQo+ICB9DQo+ICAjZW5kaWYNCj4gIA0KPiArI2lmZGVmIENPTkZJR19NRURJQVRFS19FUlJB
VFVNXzY5MDAwMQ0KPiArc3RhdGljIGJvb2wgYXJjaF90aW1lcl9tZW1fc25lX3VzZV90dmFsIF9f
cm9fYWZ0ZXJfaW5pdDsNCj4gKyNlbmRpZg0KPiArDQo+ICAjaWZkZWYgQ09ORklHX0FSTV9BUkNI
X1RJTUVSX09PTF9XT1JLQVJPVU5EDQo+ICBERUZJTkVfUEVSX0NQVShjb25zdCBzdHJ1Y3QgYXJj
aF90aW1lcl9lcnJhdHVtX3dvcmthcm91bmQgKiwNCj4gdGltZXJfdW5zdGFibGVfY291bnRlcl93
b3JrYXJvdW5kKTsNCj4gIEVYUE9SVF9TWU1CT0xfR1BMKHRpbWVyX3Vuc3RhYmxlX2NvdW50ZXJf
d29ya2Fyb3VuZCk7DQo+IEBAIC03ODMsNiArNzg3LDE5IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxp
bmUgdm9pZA0KPiBzZXRfbmV4dF9ldmVudF9tZW0oY29uc3QgaW50IGFjY2VzcywgdW5zaWduZWQg
bG9uZyBlDQo+ICAJCWNudCA9IGFyY2hfY291bnRlcl9nZXRfY250X21lbSh0aW1lciwgQ05UUENU
X0xPKTsNCj4gIA0KPiAgCWFyY2hfdGltZXJfcmVnX3dyaXRlKGFjY2VzcywgQVJDSF9USU1FUl9S
RUdfQ1ZBTCwgZXZ0ICsgY250LA0KPiBjbGspOw0KPiArI2lmZGVmIENPTkZJR19NRURJQVRFS19F
UlJBVFVNXzY5MDAwMQ0KPiArCWlmIChhcmNoX3RpbWVyX21lbV9zbmVfdXNlX3R2YWwpIHsNCj4g
KwkJLyogRHVlIHRvIHRoZSBpbmNvbXBsZXRlIGltcGxlbWVudGF0aW9uIG9mIG1taW8gdGltZXIN
Cj4gb24NCj4gKwkJICogc3BlY2lmaWMgTWVkaWFUZWsgcGxhdGZvcm1zLCBDVkFMIGhhcyBub3Qg
YmVlbg0KPiBpbXBsZW1lbnRlZC4NCj4gKwkJICogVGhlcmVmb3JlLCB0aGUgd29ya2Fyb3VuZCBp
cyB0byB1c2UgVFZBTCBpbiBhZGRpdGlvbg0KPiB0bw0KPiArCQkgKiBDVkFMLg0KPiArCQkgKi8N
Cj4gKwkJaWYgKGFjY2VzcyA9PSBBUkNIX1RJTUVSX01FTV9WSVJUX0FDQ0VTUykNCj4gKwkJCXdy
aXRlbF9yZWxheGVkKGV2dCwgdGltZXItPmJhc2UgKyAweDM4KTsNCj4gKwkJZWxzZQ0KPiArCQkJ
d3JpdGVsX3JlbGF4ZWQoZXZ0LCB0aW1lci0+YmFzZSArIDB4MjgpOw0KPiArCX0NCj4gKyNlbmRp
Zg0KPiAgCWFyY2hfdGltZXJfcmVnX3dyaXRlKGFjY2VzcywgQVJDSF9USU1FUl9SRUdfQ1RSTCwg
Y3RybCwgY2xrKTsNCj4gIH0NCj4gIA0KPiBAQCAtODc4LDcgKzg5NSwxNiBAQCBzdGF0aWMgdm9p
ZCBfX2FyY2hfdGltZXJfc2V0dXAodW5zaWduZWQgdHlwZSwNCj4gIAkJCQlhcmNoX3RpbWVyX3Nl
dF9uZXh0X2V2ZW50X3BoeXNfbWVtOw0KPiAgCQl9DQo+ICANCj4gKyNpZmRlZiBDT05GSUdfTUVE
SUFURUtfRVJSQVRVTV82OTAwMDENCj4gKwkJaWYgKGFyY2hfdGltZXJfbWVtX3NuZV91c2VfdHZh
bCkgew0KPiArCQkJcHJfaW5mbygiRW5hYmxpbmcgbWVkaWF0ZWssZXJyYXR1bS02OTAwMDEgZm9y
DQo+IG1taW8gdGltZXJcbiIpOw0KPiArCQkJbWF4X2RlbHRhID0gQ0xPQ0tTT1VSQ0VfTUFTSygz
MSk7DQo+ICsJCX0gZWxzZSB7DQo+ICsJCQltYXhfZGVsdGEgPSBDTE9DS1NPVVJDRV9NQVNLKDU2
KTsNCj4gKwkJfQ0KPiArI2Vsc2UNCj4gIAkJbWF4X2RlbHRhID0gQ0xPQ0tTT1VSQ0VfTUFTSyg1
Nik7DQo+ICsjZW5kaWYNCj4gIAl9DQo+ICANCj4gIAljbGstPnNldF9zdGF0ZV9zaHV0ZG93bihj
bGspOw0KPiBAQCAtMTU5MSw2ICsxNjE3LDkgQEAgc3RhdGljIGludCBfX2luaXQgYXJjaF90aW1l
cl9tZW1fb2ZfaW5pdChzdHJ1Y3QNCj4gZGV2aWNlX25vZGUgKm5wKQ0KPiAgCQlmcmFtZS0+dmFs
aWQgPSB0cnVlOw0KPiAgCX0NCj4gIA0KPiArI2lmZGVmIENPTkZJR19NRURJQVRFS19FUlJBVFVN
XzY5MDAwMQ0KPiArCWFyY2hfdGltZXJfbWVtX3NuZV91c2VfdHZhbCA9IG9mX3Byb3BlcnR5X3Jl
YWRfYm9vbChucCwNCj4gIm1lZGlhdGVrLGVycmF0dW0tNjkwMDAxIik7DQo+ICsjZW5kaWYNCj4g
IAlmcmFtZSA9IGFyY2hfdGltZXJfbWVtX2ZpbmRfYmVzdF9mcmFtZSh0aW1lcl9tZW0pOw0KPiAg
CWlmICghZnJhbWUpIHsNCj4gIAkJcHJfZXJyKCJVbmFibGUgdG8gZmluZCBhIHN1aXRhYmxlIGZy
YW1lIGluIHRpbWVyIEANCj4gJXBhXG4iLA0K

