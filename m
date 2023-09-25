Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2241BCE7A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnzUaiHuSn14dmbvIULAQmN4lGYeFod7+T+M8dhkHrU=; b=ukPvilYX34Uws8cSaFmpd7cRE8
	vEjnpp778W2WrmtWIqHvVYoM6w9f6eYQpuQ9xyrZhaMl2wzt35RrEZY6ZthAbiyx6OhLdXWW8LNbI
	0J79eeM5RUXxeOkhBtWwG3UUMXhF7Q4HFU1mHkvmWxNT1jaRoZTWou0aW21sCmrcU96c/UvWRqg1F
	3CZDtWJoxGyctn+Ih4h72C4suVLO6+C4NNY0MvoYhsZXnf2V3MC1Gq9xNWx9tu8WzkiF1GBfPwXPh
	rU3AtyPJmajv2x6fCWmtJ+oHIkJW6uryeiBuTXyLJBLzSIb/xNxD+ZFe+EtIHNNobGz9bGNuBWSvc
	UIkO2htQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkilm-00DxyB-2o;
	Mon, 25 Sep 2023 10:24:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkili-00Dxwi-2c;
	Mon, 25 Sep 2023 10:24:48 +0000
X-UUID: be18343a5b8d11ee9b7791016c24628a-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CnzUaiHuSn14dmbvIULAQmN4lGYeFod7+T+M8dhkHrU=;
	b=BFAWQP6WLURMSgBRZIHebIVSWDwbsOhpVFxyy6KqjiOMx8K9P8dUOoLeJxjKe12wE2QCychRXp4Tf2fokXSmYjGDArxZWLdpiBR1UqaW+bNm3rUBtK+lK/RTzTKfyyeHCRDtlBasMWS73ONigANko3hdAABXzvL8M/+qwhOz4j4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:0ba6d9ad-e163-44c3-8e21-baef22c64779,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:5bc85814-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: be18343a5b8d11ee9b7791016c24628a-20230925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 297215786; Mon, 25 Sep 2023 03:24:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 18:24:09 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 18:24:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5RM4z3INahKxaadm5Otob6ri9b09q3k7uTQt76xaIeScE5RtMrwKAxTEMULq5FzVw4lAO0b5fGt5G5i+pDjR5SJHzJHncv3SVFgfDqyn+gq2VuVB+LHvgr+WgVJQs9WuFPRYGXeiIC00e1fnXQrGKTdDJzgxEsn+UvmuIiMfhG8OdjnO+wJaIgQ/+vJeFaKkvz2dKhhlUbTeR8rYy9nHG2SutYWpqkFzzV2n+LpW/XCYXVXN0TGRwYEiU1uhbHx2YEofwQENDjuerZ76V9qNkQaCMsOXVgy4ZWqqWwOo3baGvuWnFO6IZaSkNJliRJ4ugLqIkiz5e+0EIUvynwvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnzUaiHuSn14dmbvIULAQmN4lGYeFod7+T+M8dhkHrU=;
 b=ncquu2MWlpwhNTSa0HGpiNrkEcgesaGaYN2U5Js1uGLL5QYE2iQJO5AMNS3vOuWaCxp4QgQChYB7CGrLChnrFGd7WRqz9k3HES8NJK7RCduQRA3wOiZzkIkxbGLJyMf2wZQRzuY8NN963WLPPRbkvov8zmS27EaWL/0tCDYfpcYXolKAr1xXIkozvprgSn9YXTW9I5xezWnOKYvRbvaec8S0mHIFOJom+XNN7Kd5gl3A1nsfcMiC5MlsQqubG+Oh0BculnK2YasWSTP8Oc2Iro2MyHPFNMObrkpy0ngs80QcHV1OBxMw+cwmBHhG2fmGNXfJNWlqjEIVD4JPteWevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnzUaiHuSn14dmbvIULAQmN4lGYeFod7+T+M8dhkHrU=;
 b=qu9JxXinvZ3bm2+bV24fiw5n3FjupQVgHt5bIDQHf7nc/SSFjE6NE2L7hHcxjCtOOMseMEWO1V1n9PuhofArf+sqk2KLm6f6hDaY0+mDNH4qkk0C23wIQtA6Qxld5mrGLSbZE3H6BkfhjGvZNnHcis2Y6sTueROwkPzZHCTYOb4=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB6340.apcprd03.prod.outlook.com (2603:1096:400:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 10:24:05 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 10:24:05 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 03/15] soc: mailbox: Add SPR definition for GCE
Thread-Topic: [PATCH 03/15] soc: mailbox: Add SPR definition for GCE
Thread-Index: AQHZ6mV+OMIN5fPo3EKCCvwEF6sInLAou1wAgAJMXQCAABp4AIAAPdQA
Date: Mon, 25 Sep 2023 10:24:05 +0000
Message-ID: <32a6b54a4ba2be7ff2762c3e0f2e4b83affd3881.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
	 <20230918192204.32263-4-jason-jh.lin@mediatek.com>
	 <797fc698-54d2-4848-3a4d-43ca631eb96d@linaro.org>
	 <d2fee308c86c23e98e99497d2de138e31ad72537.camel@mediatek.com>
	 <c6983f0e-9a62-4fe8-bb1a-01c44ec43985@linaro.org>
In-Reply-To: <c6983f0e-9a62-4fe8-bb1a-01c44ec43985@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB6340:EE_
x-ms-office365-filtering-correlation-id: ce341545-52b5-468e-097c-08dbbdb18bc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b1g/DNEp5RaR2ijf9b/puaO3iSzhnY9cXSr+aNAbh/rfrnqL2VwnCJuOwhXJ+xHOgAmCbiD4xQZrCHUrScs5VnzgHwXhRe1hq8KGEh8+2VDonIBkRbUxf13NV33XaV1XXPAZq//LI6SwjuBqaHtlDPvJ6cuN8PQukvqk0f7W0ob2eFXM+ASp+gv7WotxYZthP2A81dJUXJ7WfjzuCIGpHqeZz+QXbf7OVNssIWrPVGLQwJrG3wWVb6SnNkg93OG5M/zNM87WzdThteGDDfh5RI3RyfhNcXIPQ1t7OqUAtlUQr0fPG6Cd5QwdTuarlQS0d3QPHvkPdLY45dBq4uMHz8LH3AYwjtCl9KDL+AHdS5LtzpwaEAZHqpJG501NzIDmSSeDYVnlorDB7tf4+hp8CDRgDNLBiCXQB16EakgMmQy7lMDGnU+jKCK4fwveXEgFy04lPq/BdoV5pIdR8zIOp7G5E6onHGA1fnZ1ighXUie41KUGBtEtuIwe5u76WJG33iE24+Hjn1RceOeJTkLIFD2GlTfFbirom31LCo+bhuXe78bMwuifeM1w4hubL0iUBfWbZUJbaeHHea7QNmD8RgpiLJVI5OjQOgsfqfVzYY4vJmrD7aGLc7zb4z2iLJaI1J/DB6WtDddkkat3Vl/wCTShLXUu0ma4BfqQ2RKyZ8w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(83380400001)(107886003)(26005)(8936002)(8676002)(4326008)(41300700001)(478600001)(66476007)(316002)(66446008)(64756008)(54906003)(66946007)(110136005)(91956017)(76116006)(66556008)(15650500001)(6512007)(5660300002)(53546011)(2616005)(2906002)(7416002)(6486002)(6506007)(71200400001)(86362001)(85182001)(36756003)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWlROEpJditUNC9qUWxTQXRnSFZpRElXcDRCWTZOYXpYQ3JRWXVxaTJGQVJY?=
 =?utf-8?B?eU02MGkxSEk2NHk5V3JxMnZLdnJTbjIzOUtqTHYvaExZY3BMZVZ6emVNOWlB?=
 =?utf-8?B?MWN6TmJES0g3MGdLQXBGVnpnWGloNlhDeDZaVU1SdldRTEZIcDA3dkJ6L096?=
 =?utf-8?B?N09XcG5rZlJuazNLc0cwODEzOFBnL0dlKytvZzlONVREbnloQy8rWktvSWJH?=
 =?utf-8?B?S1FHUmZYNzlxbUZNOFh6cXdoNHlkamxIb2dsVWFSdThNSndCbHZLT1gyaVNR?=
 =?utf-8?B?dFdhWGtuV0xWSVAxTE1tSTVoMVpKRmtPN2xRUExXaDVacXZNelNnbVA2TVdR?=
 =?utf-8?B?QVVsa1pBdC9xb29QQVNnaHpTbUdaVmtyQUR4ODFzNmE5Z25tbithYVRMVURm?=
 =?utf-8?B?cUVjSXJCaHRtRFRPdm5NZGNEUlk1OE9VRzh3b2ZHTVhMbE1LeDFEbnBpdHBI?=
 =?utf-8?B?TmhqQ3VISEpXRXQ5T1Nxa2lxV2VxZjJkRFcvR3lqaXJWaVhmTlNacHFtaEZQ?=
 =?utf-8?B?U1RYMG5xbmZqWEM0RFp3eFRxOXdOQzNxUUFxOXIvRUVYY1VGNjlaVEhHelJV?=
 =?utf-8?B?OWxaMWZua3lMdDFtekp6cmJNQlZEUE1jUGpncWNaa2R3aFZwTjNTSHhNdlA1?=
 =?utf-8?B?eC9lVFpNWEw1VW5xVC9Lamh2Mjcwcy9IVkp3MXNMK3ExYm9IOTEwMDZ6NU1o?=
 =?utf-8?B?a2tieWFxVmRuK2lkZHlUbSs5bU9pZG5yc3dXL2xSV0RYMkxmY1FUT3l4ZFdU?=
 =?utf-8?B?WkdwY2FmL0FVTm00SmhRcVJwT0xHeUJyT2lXTHo2OERNem9XUG9Hb01zZGF4?=
 =?utf-8?B?YjVXMUpoSmtOU1JmdnJMRWlXWllyTXYvNDBSamkyWnhJRm5xd3RDZnhBWWhD?=
 =?utf-8?B?NXNMK2xoL0NUcE0vc2VXWC9JaUtGaU05NEdPUkR1dzRLSXJ6WFZhZHFOSGZu?=
 =?utf-8?B?U0FsTTU2WGNLK0lrc1FEclUzRDJjWVJGS1NJWWtOV2c3VlMzNnE2NTFzUGZM?=
 =?utf-8?B?R3ZiVmJXRVV2czdHRmlqVDMxMnFMb29WcWNuUklrQVFLTy9aZmlZaXdTZkRC?=
 =?utf-8?B?ZHFZQyt1QWdtTndXSlBQZlM4Y0s1ZVVqc3BabWNzdmIrRHFabUJHcXhZU3JO?=
 =?utf-8?B?aFc3dEhXTVVqVFlaUVdTbGlveHFTT3BTb3A2VXVUakt0bDU3KzZXT0JaZndv?=
 =?utf-8?B?ZTBaZUlmWTFNcDdNUXBwZFFqUndYWVZ2cWowU2JiRjRYRGRGL2p5eC9FRHNC?=
 =?utf-8?B?Ylh3bkpKRzM1VkNoYzVpTEZZcWZsNVN3K2t1clBJdWEyYWtiOVNLa1lPTm1o?=
 =?utf-8?B?Ymh5dkI4bVRjdVdGbFloNzNXcTBBMHZ3Mm9JSXhheWpYRXQ5cWZlZGVobVA5?=
 =?utf-8?B?WmVQTjNXQTVjalpjaHAyaFh0cDRXU2J6N3NHbWJ6Z0ZhOVNIZXZ5YU82anhh?=
 =?utf-8?B?S3R0ZTRXQWFucW42OGRFSEJZa21FTFRnMW8xZDNjMWc4YXZzRW93TkVmN0dl?=
 =?utf-8?B?c0RGUXRRNHFUYVJpT1ord3VsYmZuZy9GR2l4YzAxSUNYNWtzVmhoM0ZlMzVI?=
 =?utf-8?B?cmtkVFZoT2pDSERxTWVxem8xak81Zm5VOGxkZlZsR3hJUm83UU13b0R6clF5?=
 =?utf-8?B?NlRmUHdRbFpDSkVSRU4zZFc2SXRRRnpXZFJiRUlrays1Wk1NNnE1WU5VTHdG?=
 =?utf-8?B?dUhzV3ZxQVFFdHVaMUxMazJ6enNxZkFMQ1NpOU9CY1RTT3FCVGs2NXNuVXRZ?=
 =?utf-8?B?SEswMXdkQkFYU0hlNUFsSmF1UE40S3lEVWh2NHpDVnNQNDNFSzgxZlVubVVD?=
 =?utf-8?B?ZDI5Y255Ui9vdDREU05ZQWY3YUpQSm93dWxBcDFJM1FrWnpBKzBXWlVLUTlp?=
 =?utf-8?B?aWFtamVEbHZ2MndsbVllV1lBbzRweEJBN0MyNVdvenZHdFhuQjNtby8zL3V1?=
 =?utf-8?B?SEpiMGNWYThDVUpkL2NmQWxwK2xqMWpzU1NPNWNITmJDYkJ6M04rSWt5cExM?=
 =?utf-8?B?OEtQSzFjZU03NE1BQmVxamZXK1IySEQxSUtTMWFldVdmVG4zQjI5bjdCbkhU?=
 =?utf-8?B?MkpIUTEzZTZmdndtYjNmLzdUd2FxNTEwV1R2UjhZaWdVN3NkclFUY1RqcmVN?=
 =?utf-8?B?NWdCR3dSMDVKV1VBa05ML1lmSlp3bmdYcFRjWi9wWTNaMHVGVGRGdUpNVlVz?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8551921C8ACCA4D859B8E620B652D05@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce341545-52b5-468e-097c-08dbbdb18bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 10:24:05.4386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSIIteU5KeTmh2yrvJWsTY45qu0L/3lhjRcClIGdYR5Dm9AemOcn1XccXdxoErP9LuM6JaT7KmDIDfFHdYa3V4Cl0grsal33SwQDGxzpwrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_032446_855803_DCB04A82 
X-CRM114-Status: GOOD (  22.63  )
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

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDA4OjQyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDI1LzA5LzIwMjMgMDc6MDgsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3cy4NCj4gPiANCj4gPiBPbiBTYXQsIDIwMjMtMDktMjMgYXQgMjA6MDIgKzAy
MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+ICAgDQo+ID4+IEV4dGVybmFsIGVt
YWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+IHVu
dGlsDQo+ID4+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
ID4+ICBPbiAxOC8wOS8yMDIzIDIxOjIxLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4+PiBHQ0Ug
aGFzIHNwZWNpZmljIHB1cnBvc2UgcmVnaXN0ZXJzLCBhYmJyZXZpYXRlZCBhcyBTUFIuDQo+ID4+
PiBDbGllbnQgY2FuIHVzIFNQUiB0byBzdG9yZSBkYXRhIG9yIHByb2dyYW1zLg0KPiA+Pj4NCj4g
Pj4+IEluIENNRFEgZHJpdmVyLCBpdCBhbGxvd3MgY2xpZW50IHRvIFNUT1JFIG9yIExPQUQgZGF0
YSBpbnRvIFNQUi4NCj4gPj4+IFRoZSB2YWx1ZSBzdG9yZWQgaW4gU1BSIHdpbGwgYmUgY2xlYXJl
ZCBhZnRlciByZXNldCBHQ0UgSFcNCj4gdGhyZWFkLg0KPiA+Pj4NCj4gPj4+IFRoZXJlIGFyZSA0
IFNQUiAocmVnaXN0ZXIgaW5kZXggMCAtIDMpIGluIGV2ZXJ5IEdDRSBIVyB0aHJlYWQuDQo+ID4+
PiBTUFIgaXMgdGhyZWFkLWluZGVwZW5kZW50IGFuZCBIVyBzZWN1cmUgcHJvdGVjdGVkLg0KPiA+
Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlh
dGVrLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1jbWRxLmggfCA1ICsrKysrDQo+ID4+DQo+ID4+IFRoZXJlIGlzIG5vIHVzZXIgb2YgdGhpcy4u
LiBXaHkgZG8geW91IGFkZCB1bnVzZWQgZGVmaW5lcz8NCj4gPiANCj4gPiBJdCdsbCBiZSB1c2Vk
IGluIGNtZHFfc2VjX2luc2VydF9iYWNrdXBfY29va2llKCkgYXQgW1BBVENIIDEwLzE1XS4NCj4g
PiBTaG91bGQgSSBtZXJnZSB0aGlzIHBhdGNoIGludG8gW1BBVENIIDEwLzE1XT8NCj4gDQo+IFll
cywgYmVjYXVzZSB3aGF0IGlzIHRoZSBwdXJwb3NlIG9mIGFkZGluZyB1bnVzZWQgZGVmaW5lcz8g
SSBhc2tlZA0KPiBiZWZvcmUgYW5kIGRpZCBub3QgZ2V0IGFuc3dlci4uLg0KPiANCg0KSSdtIHRv
dGFsbHkgYWdyZWUgd2l0aCBtZXJnaW5nIHRoaXMgcGF0Y2ggdG8gdGhlIHVzYWdlIHBhcnRzIG9m
IG10ay0NCmNtZHEtc2VjLW1haWxib3guYy4NCg0KQnV0IEkgaGF2ZSBubyBpZGVhIHdoeSBtdGst
Y21kcS1zZWMtbWFpbGJveC5jIGFuZCBtdGstY21kcS1tYWlsYm94LmMNCmFyZSBub3QgcGxhY2Vk
IGluIHRoZSBzYW1lIG1haW50YWluZXIncyB0cmVlIGFzIG10ay1jbWRxLmggYW5kIG10ay0NCmNt
ZHEtaGVscGVyLmMsIHNvIEkganVzdCBzZXBhcmF0ZSB0aGVtIHRvIGRpZmZlcmVudCBwYXRjaCBi
eSB0cmVlIGxpa2UNCnRoZSByZXF1aXJlbWVudCBmcm9tIHByZXZpb3VzIHNlbnQgc2VyaWVzLg0K
DQpJIHdpbGwgcmUtb3JnYW5pemVkIHRoaXMgc2VyaWVzIHRvIG1ha2UgdGhlIGRlZmluaXRpb24g
YW5kIHRoZSB1c2FnZSBvZg0KdGhlIGNvZGUgaW4gdGhlIHNhbWUgcGF0Y2guDQoNClJlZ2FyZHMs
DQpKYXNvbi1KSC5MaW4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCj4gDQo=

