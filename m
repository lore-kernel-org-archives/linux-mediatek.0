Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E7C4452D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 05:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqlqJT5qOBZJRQNVAvD+rPVKxNaBFfPh3AFEL0WJXSo=; b=VAnDaYCduwREVzWWa/X9MuyPjM
	D95QxIX6WFxPLQxq8ISH6ka22CZZLROBfV4uJlBmnBEvQ1V0U4rM1SNOuCWXj8W73iCMkPpOFhQ/X
	MtKueWS6Yufe5M544yD6SAijopfYL55UypjMGPClrQt/Sun1Ue2fagktNY6Dl1kbwk3DJkLNq6CWI
	hUsA+taiKfeLh+Dy+tGKlH6rQzStO5iP4En0PPeSlPnPbRFFGWPTDL2/2EWca3tg93k1QKULOW2T+
	+uo4XgbI+eRc2ZWfisrF/K9ruBPLkzimFmvK4SmcMK4jTqTL/bUVT42N5CvEtQADeya2pxWzOV2F7
	dFrHe/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPcM-0000000AvqN-1VJL;
	Wed, 22 Jul 2026 05:35:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPcK-0000000Avpz-0PgP
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 05:35:41 +0000
X-UUID: 27d79e8c858f11f1afed4741b24580c9-20260721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=tqlqJT5qOBZJRQNVAvD+rPVKxNaBFfPh3AFEL0WJXSo=;
	b=tgP1Qx3SFsvkGs0XB5ZNQ7EX5k8Xn77MZSqdHyi1P3nOe6wRiSJd32Kx54ihst7mKedrjHS32Zr/0FKfR0HCdtRhM7fmFt8p6yN9sAk9G4mTHKQp1+ML0+k2iv2UC/VNdYNND++vfmj6QL1iNtJq+DBc/hiUUdEoOVDQG7h4cMM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:8f34d2c7-41c4-49bb-9585-b3b42f2c21c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:3ea12a54-ba59-46c6-b844-86065e9edbd3,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 27d79e8c858f11f1afed4741b24580c9-20260721
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 756688158; Tue, 21 Jul 2026 22:35:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 22 Jul 2026 13:35:29 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 22 Jul 2026 13:35:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAEYHZgKrmY3fIv2qEvGWObdb28gbDM1lsu0m4X/PObszTOROKvQ4Uv9oQh5o60YI3eeBtcUt9bLRBfMCBs8miU8nrG7/gIR19eS6LzyOS3f5SsRoxiHJX77fKdLv1+WpKAOwhSAcYJXg5sOVCTopoIG4Z71IljAtHuDFbDiPSaPmXI7rOFrU1R/aDWtB54dOhu5W4uUCkBCYq/c0mm2okLQFJxQYwl3SY84E55ZQRPU4IpQBwJ9GZd587MSeBSYLrEjnKqlxTWul9mMZUak2aHaC3ZYMsafn/gbcaTBo8/orxxjMPipIQ+5QCbV4+cdNh69HEIUn7wDSoYkcmHo7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqlqJT5qOBZJRQNVAvD+rPVKxNaBFfPh3AFEL0WJXSo=;
 b=PZR95ZI0yjnG3X0k4ICE8dMKu/4UfuLvERKzIyfIqN0qtgwX6matOlkpN8QfrDVVpwz/kx5y8pWs9SIpLX7DMqZGR1/qk013FNawtZgIButmdBfGR3LIgyvFk3zIxiwi+SdRfx6r1H8HQhcd8uZz8HqfHSRd50Yk0p/I4nOc8glWPheuZ3/7xlPjokIKxuBqUlRkgt+SWXaUToRredAN4yo/M2SK2Ug6LGXsDGiYWN09H66uGKGL0PuRgB55BqR/cvzVQCLMArp0tAjD1bbnTNgR5UIyk85QdHVnjy/ZcT524su7Wj0bjlBwcB6HNvCn7NbG57WAcGyCjZQytbAi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqlqJT5qOBZJRQNVAvD+rPVKxNaBFfPh3AFEL0WJXSo=;
 b=WjHoYhzTksZ8dEhKkMNk1f+/emtiGYXW0/h2wnMGBe1U6BSHgCEshenDzjiSRpbGwZD6sW9r+xKYQH2ZWyjI36DMEyXVkxVWwYpjOo/aNYEUSOlV/yHn62yRpvcarzOtcETVo5M/+y9pfWMqGyemvtjVMos9dq4OvLfTpp6gtIo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYUPR03MB7085.apcprd03.prod.outlook.com (2603:1096:400:358::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 05:35:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 05:35:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "johan@kernel.org"
	<johan@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_common: take i2c adapter module
 reference
Thread-Topic: [PATCH] drm/mediatek: mtk_hdmi_common: take i2c adapter module
 reference
Thread-Index: AQHdFSYKO35XHmal2EKCq1r9vzInSbZ5DX6A
Date: Wed, 22 Jul 2026 05:35:26 +0000
Message-ID: <9e852cec28403f2cfd7231e323ab117a2856a05c.camel@mediatek.com>
References: <20260716132103.1564995-1-johan@kernel.org>
In-Reply-To: <20260716132103.1564995-1-johan@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYUPR03MB7085:EE_
x-ms-office365-filtering-correlation-id: 9c7a91fb-550c-4e81-e0f7-08dee7b308d1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|42112799006|366016|23010399003|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: YpPVxVtWBsnTp7vcGQs1JaX/p5EUvf4h/OjFJpLzWZ0HguC75iqZ5zF/iCz5M295/aOUGdttqa6GbfxEVK8Wij7ib57lMgc0uvb/zTGHSN6Hm3UTSTZngxhKWDisFrS2vD82p9NI+h7wIB5GKdjbWD854WOmNvs4bsBzbeSu6LBzxMntif+psUNL7FM2NTJiZoRKhza4ESA8Q2heValRkBNK6ofuCDoIxUNTdLc5ASkSNfAUqdF62Vx34Vv4ROqIHAq+MIZz0NLT7dAvK3XRdN1OXXX1tFgSI574i1ZaG/soNGZGb8hQw3X83xatzfUQVhdNjv9jedEFqDFmJkIPjAnuQXc2VKrbtkE5ynuk3Z73yx2BO2tqcsH5nspc71s6yuYuAi+BoVJ2zS15klMC4HYXAu7hZFFItkB0wMxs5BVbQdj04q9FLXFjhgx1wMV6M1RhkD2scSV+6LsgGazMWYB3HhisdrvvNbKjbK6wyLyKFjlR12/v17CiGjlb3/d/6ph37aPFLxvrdc6k/6qmQnyIpNX2ZeKD9g4AW1XkuiziHbgbvkYnra05jF88KSj8/yiBJ0pJw5RyR0m/5M0HRBZIKI3VGtLI2t/4akz0u/gcK4CpLwzGRdpkOjDDlP+jNqA+Hcd7h/ZTWcofA2Hm4ugP6FLDNV3yEE7nE9VtlJcz2BuMRmrDL+U/1pzlVRLsTCXr+HpZihl8ggDNsLNAmMjSvzAHQ6oDCDlrsHV6c9U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlBWMjhCSHFBY016MytEQ29Zd3VXVGdjR05aRUY2TWpYRUVBK3E2T3dzcTRu?=
 =?utf-8?B?YmlMdWdtS2lRWEpLanorcEQyZmViM1JxdFc0MUVQYkgvVmtpVUF4amN2VGx1?=
 =?utf-8?B?MURKay9JR2h5RGdCTDRVdk1zWjhncHhPZ2gxZnY3SE1nK1U2bGZOQ1dQVWRZ?=
 =?utf-8?B?UjBuM2JYWTRESHNoZDV0eTRyOGxvcEc3YkVEQ09PSmgzSTdOanRFdTBEV3hv?=
 =?utf-8?B?WTJYMWR2QmhYUjA0ZGw4NFc3QzZ0dExodUprMWVMaVNQeVJCcHl4V1krdkJj?=
 =?utf-8?B?OHFDSWFLb1F5N1EwcWwzTkJwZWEvK2crL0U2NU90WnFSV3BGL0JRNnZjMzNo?=
 =?utf-8?B?ZytqbVJYNXhZa1lrLzh5M0ZXSldTT01xbDJuSHl0R2xuMisxZ0Q1eTcyV1pp?=
 =?utf-8?B?ZUlCeExPZWtjWUlGeCt3ciswWWxBWmY4cUhES0R4bXR1RWFuNnMwakNTMUJR?=
 =?utf-8?B?SnpaOC9hSnV1UlNGMXhPR2t2ZGpXWVQ1dHFGQm5ZWktsRVovMjBob091RUZq?=
 =?utf-8?B?VXdBR1FUOFB2TjlkWVhBT2FxUWdjWmJtUG53emVmZ0JXbzVWa2VFSDYzdVNa?=
 =?utf-8?B?WWR6T3JmcHBxcEQxYWw3MHFJVEZ1V3h2ZDhBYTdKbGJGWW1SY1RPSzM3T3VZ?=
 =?utf-8?B?N3M2NlZ6NnZrY3liNHZ2WW9FRnZsZXZjNWV3M1dyQkVnVDVGcVhCeVhGVm1v?=
 =?utf-8?B?UUJRT2V1TXI1SjVRckdOeUtYWWw5VVdNaWE4aUk5SEJNL1NjNzlaeGxybFBV?=
 =?utf-8?B?U3IvRHI1WmYyNWJlV1BMTzByd3RkRTEvSWZ4dnVlTWpQUThxNlF5bHVZdzJO?=
 =?utf-8?B?RTdmNzBHLzJaYkp3emIvVlpYUlM2RTdIcjd1TnViZG1YWmlmTWM1a2JHaDRk?=
 =?utf-8?B?S051ZXRGYWFtbitVMDdoSVJFQzZUWlFNemNUVGs2NW9DZmUwVTdZRE5hV1dI?=
 =?utf-8?B?Wnh3RUpiUHhxcWZ5YVZuNWp2ZGVMblFrV3FOUHcwcXBqVzZNS2FHTzVqRUVC?=
 =?utf-8?B?SGhwandpcEFkWGpreFFDUkdqRllUN0RSNzNRdFJYS0lid0JGdHAyZ0ZnVUhh?=
 =?utf-8?B?aGtqOVpydTFseGFNZ1ZCUThoVGg4YjRpQnNnRDQwRDVGbTlpbHh3alMxdU0w?=
 =?utf-8?B?c0dMc3RqWVpaaklLS3JNdzM2b0E2MWV4VlgzMnNod0NXdGw5aVY2MzdwMHZW?=
 =?utf-8?B?MlJ5UTF5bmo5RzRvMDRlTnBZUXZZSmV6QWNOdkZaVnpHbytEc1VGckVCVVVO?=
 =?utf-8?B?MzhXQlJMSStFQ3BVOXF5WmhIWEhVUjNqYlBRQU8vQjV5R2FYTDZjT2tUenpB?=
 =?utf-8?B?VE1jdmxaOU5uZnRRUmFYWTRNS0xoQXBKbnBaVlZleTZnZnI2a2xlb2QzQmdo?=
 =?utf-8?B?aFdwdTFGUFdYa2wwNEdUQlFwSjFHQ0R5RW9ZS1FZVDNEYmhtK2ovTzg5Z3pk?=
 =?utf-8?B?VUdnUmkySDdNMU80M1BNaFJ6RFNpQVZzbnp5WnhJNFN5djZZVE9sM0hCWkZK?=
 =?utf-8?B?MXkzU0JCMUxQdkYrVm5Uai9NNUZTU1QwVFB5R3BublRyaGwvd093N0RBd0FX?=
 =?utf-8?B?VnN6S1dQQnEwYldhTjVzQkdtMlN5Y081dnJmdHFrWitmT1VZZ1VDUUJxYmlt?=
 =?utf-8?B?L0RZTlV4ejJuVFk0M3JOb1RzN2xTQlRETHNMZ0VRZ1p5SEpobVkwRTM2TGVQ?=
 =?utf-8?B?aE84RDVBU3BBalpqbDd5QTYzQmJ4WXlmVFFiYWV0bHlKUzdMemxTRS9vQ2o2?=
 =?utf-8?B?WVpkcEtzajlCSjRoS2ZCUi9TS3dkY01jWDJHb3lSUTZjeFhhRTRZZjREWVUx?=
 =?utf-8?B?bHpNS3lVQzUxVUQxbGhVTGJhZ1ZBSGh2eEtIaGRBOWluZUdRM2tKdHNScTVs?=
 =?utf-8?B?ZVN4OVZLNERRSHQwSU42S1RYZjF4VGtiakp4SElQejk1emZFKzZoYXRzT3Ez?=
 =?utf-8?B?ek9IRS9xRFhjTjJscGNNM0JQckxKSW5BcWFWU3RJNmQ4VjNwYUhZWEh6aXZs?=
 =?utf-8?B?dExFYWtrK0NFWFZxQ1M3anZabmdYV2ZHN1g2MmE5bDJMQlcwMzRCbXVwaVlZ?=
 =?utf-8?B?bWlMUHlVSk5OMmxmR1BzOHphaldkWm1yNVJoQU1VSnhobVJjTytHL3kxaDJm?=
 =?utf-8?B?SGlGTE13RmVoTmdWeVcxejQ1UDgvMzdPUWdINFBYdFJQZS9iTlFSRVJkTTlq?=
 =?utf-8?B?TmxQRjNGUTF5SDUvMGVZZGRILzlwVEcyNzBWc3NlS3BoazducnlFY2RvRXZ2?=
 =?utf-8?B?RUdML2xkQVNieXhlaEhkTU1mU2VtSGt6TnBpdFJVQ2tFRGZ4WUtOVGQ5VS83?=
 =?utf-8?B?d3pibDN4NkNIRitQTjBuRkRmaktLbll3Y1VWWVVIK2NQMG54S1BNdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9262BB3F1B885748AFDB3F915A569694@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hRD9HC8GJwExJYe6w4BfjjUzHG9RULTY2lS+oQN4kkz1i0U+1QjMLRyjyU+IudXZzq1LeE42t1PS6Cyj1J3OifJWH/9vkFtQLZD2aA1ecNJPUddNaM6JwAqGbnrVxqrVOEdjQZXhaa2e03+lMnGedcw6JiLhM/mJMOPRwKSHLyJVQyWWtuhPBFMumuUnISq2r/I2ot+9qvbOwllKcbTvNAL9zUTutygXP+NkbzSWlHMtGMOk6B68mDrTLZz0opC0CMT9bLHO9Hgu8eoFNW9duDz9QtIU2fEtxGiE75CwAMW3k1GsmdvpaiOky8USwRFoMoyEqcExZsc16z/iXuua7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7a91fb-550c-4e81-e0f7-08dee7b308d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 05:35:26.5866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3bi6v6igLO2Mc37c6oIzGMKGgOLQ+LDW26nCB3COfD9M4A/e9P5IcGXeONf3uBHgJNW02j2jNG4ap/j7VHcY4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7085
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_223540_158402_E01BFA19 
X-CRM114-Status: GOOD (  20.14  )
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

T24gVGh1LCAyMDI2LTA3LTE2IGF0IDE1OjIxICswMjAwLCBKb2hhbiBIb3ZvbGQgd3JvdGU6DQo+
IFRoZSBpMmMgc3Vic3lzdGVtIGN1cnJlbnRseSBibG9ja3MgZHVyaW5nIGFkYXB0ZXIgZGVyZWdp
c3RyYXRpb24NCj4gd2hlbmV2ZXIgdGhlcmUgYXJlIGNvbnN1bWVycyBob2xkaW5nIGEgcmVmZXJl
bmNlLg0KPiANCj4gU3dpdGNoIHRvIHVzaW5nIG9mX2dldF9pMmNfYWRhcHRlcl9ieV9ub2RlKCkg
d2hpY2ggYWxzbyB0YWtlcyBhDQo+IHJlZmVyZW5jZSB0byB0aGUgYWRhcHRlciBtb2R1bGUgc28g
dGhhdCBhbiBhdHRlbXB0IHRvIHVubG9hZCB0aGUgbW9kdWxlDQo+IHdoaWxlIGluIHVzZSBmYWls
cyBncmFjZWZ1bGx5IGluc3RlYWQgb2YgYmxvY2tpbmcgdW5pbnRlcnJ1cHRpYmx5Lg0KDQpSZXZp
ZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYyB8IDExICsrKysrKysrKy0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KPiBpbmRleCBhMDQ5NDg5ZGFh
MmQuLjA0MmI5OGU1YTUxOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pX2NvbW1vbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaV9jb21tb24uYw0KPiBAQCAtMjkwLDYgKzI5MCwxMyBAQCBzdGF0aWMgaW50IG10a19oZG1p
X2dldF9jZWNfZGV2KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwgc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Yw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgdm9pZCBtdGtfaGRtaV9w
dXRfYWRhcHRlcih2b2lkICpfYWRhcCkNCj4gK3sNCj4gKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFk
YXAgPSBfYWRhcDsNCj4gKw0KPiArCWkyY19wdXRfYWRhcHRlcihhZGFwKTsNCj4gK30NCj4gKw0K
PiAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3QgbXRrX2hkbWkgKmhk
bWksIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ICAJCQkJICAgY29uc3QgY2hhciAq
IGNvbnN0ICpjbGtfbmFtZXMsIHNpemVfdCBudW1fY2xvY2tzKQ0KPiAgew0KPiBAQCAtMzI4LDEy
ICszMzUsMTIgQEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3QgbXRr
X2hkbWkgKmhkbWksIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gIAlpZiAoIWkyY19ucCkNCj4g
IAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLCAiTm8gZGRjLWkyYy1idXMgaW4g
Y29ubmVjdG9yXG4iKTsNCj4gIA0KPiAtCWhkbWktPmRkY19hZHB0ID0gb2ZfZmluZF9pMmNfYWRh
cHRlcl9ieV9ub2RlKGkyY19ucCk7DQo+ICsJaGRtaS0+ZGRjX2FkcHQgPSBvZl9nZXRfaTJjX2Fk
YXB0ZXJfYnlfbm9kZShpMmNfbnApOw0KPiAgCW9mX25vZGVfcHV0KGkyY19ucCk7DQo+ICAJaWYg
KCFoZG1pLT5kZGNfYWRwdCkNCj4gIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRVBST0JF
X0RFRkVSLCAiRmFpbGVkIHRvIGdldCBkZGMgaTJjIGFkYXB0ZXIgYnkgbm9kZVxuIik7DQo+ICAN
Cj4gLQlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBtdGtfaGRtaV9wdXRfZGV2
aWNlLCAmaGRtaS0+ZGRjX2FkcHQtPmRldik7DQo+ICsJcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29y
X3Jlc2V0KGRldiwgbXRrX2hkbWlfcHV0X2FkYXB0ZXIsIGhkbWktPmRkY19hZHB0KTsNCj4gIAlp
ZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQoNCg==

