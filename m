Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93149C54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEweijjbKPV2ZM43qgdsBet4EbCRKoZ0wuANW6NgtGM=; b=CFm/a548EaVZ6mFwz5R4p65mX6
	aOPdVmmcXX5Am8NHTEdSF4S9jM4X7MOsdN4ZfpLBVRoNx+Dp8pw1r0Kv+TLF+nSsge1oHwpCWvuN9
	RQUyOIbDoXiy7kjUOBkbGAtOaQeXrtVJhO6/QAvYjE0dt25xSCJh0goMvBv/Uwv5b0JAJpJWqRIlx
	XuDc5bQDiJR3I+Z9oLKOO6mtvum/BEV1BBhWRGDSvwxyh6xj7h1OK6MzgtRoOCOq6tKE/jvszlPO+
	0APqGu1TPDQduRuoMkSQcvoDt4qcZDFHZuCkUIEqN6M7/6nJ2r6+aKX4CRRG3a7KdSsveroBMN0wL
	dv0FUbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbZQ-0000000Cbrd-2gFf;
	Thu, 29 Feb 2024 08:15:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbZN-0000000CbpM-3UCL
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 08:15:11 +0000
X-UUID: a399018ed6da11eea40fa5ac21cdad35-20240229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PEweijjbKPV2ZM43qgdsBet4EbCRKoZ0wuANW6NgtGM=;
	b=mUFgVb1HEzhPJDvFQh3aJrWERNvWtySe+s1QpMkV6sR9P3+8dw3KBpb/Ohou/5G6afUspRWnlF7VcR5/++hBnJ6m3Wp+q+72FrTMImvielhUJnfuVKrS5GFchFAlqm0lghvt+Yc9oke7aTQtnNp3LyiBF6WiNB0xz52XH1KvV70=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:64015f13-245c-4873-9eae-a3491de27d7a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:0f097284-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a399018ed6da11eea40fa5ac21cdad35-20240229
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2137803173; Thu, 29 Feb 2024 01:15:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Feb 2024 16:15:00 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Feb 2024 16:15:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l02tXJfrP11hYpu787ju/2+sg2wSbw+uMM9ttsiFGT5JxpBt4OwdoCsMxSvFq3SqsYb9SPmEI6Xdmzsotr3PU5CYUBA+aa/OBV+dT2vVfQ+vXJWnfHFs37/YFEYBvu3ey934HogcyT0ypjAQ23qhjNGPFrdjbCVYc+awEWIV3IVkV1dsX4y5OApgzojKS+I8u1VsMlkASf333teGSot6QJ2/gIeRk2G8vjtSbmpuDYckgsjOxZgpc0UPWGgkQ+gkbyHCnMpDekUZmS2Hwwyt2kbT/ZNUKehvr7xkHjgWHgVvBJJyD/gLO6bxAZOWYsqb6XXI27ANRfo76koTgB0eXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEweijjbKPV2ZM43qgdsBet4EbCRKoZ0wuANW6NgtGM=;
 b=Uyf49M6YEww62U36/AdYLhUpi6KszhpwbkuQICnWCw6SOGNW/VtbnQxeTbcfjYJSNDgat5oeircraMRDcuwb5Ot3GknMvnpTTvmKk8tQbiKIjvU8YxwvD0SNU0MlvWW9P64d1VkvApx5M4UNI9BS5rSy7SGl5Z2vDqr9fgtUSpmGhhO83sgRHAQTFX3qekiH4VoLi/OJvI5LDKGbQoqorsPrwIkEx4RQ5i/97PrxZOr93WvmAciFUkz4DCwYBpPiGpYLGLiDy+5aRTfM1wVmW2fbQilhGPGO1HRS5Gl/ULt4sr1s0Qam6ip1vSBhJpIPpHM6rtCzOUF/YgQ+fjcUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEweijjbKPV2ZM43qgdsBet4EbCRKoZ0wuANW6NgtGM=;
 b=HVgJ6as4+FfFQ+hFS3wTRVrWMSkOuKTiT2yet9fFFew4lXElNjXVxZFLdKb0AjZ+HIb0N8U/KJgi7tYtQhKSROIuJAaMocjKqJMGK4aw4A9PGZRp6aO5RGJPa2G3ZE/RvqLkqhox7DdAMuIwnjmfXYakJwD1WRQQElWa2+Euqc4=
Received: from KL1PR03MB5507.apcprd03.prod.outlook.com (2603:1096:820:50::6)
 by JH0PR03MB8211.apcprd03.prod.outlook.com (2603:1096:990:4f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:14:59 +0000
Received: from KL1PR03MB5507.apcprd03.prod.outlook.com
 ([fe80::c388:680f:ffea:12cc]) by KL1PR03MB5507.apcprd03.prod.outlook.com
 ([fe80::c388:680f:ffea:12cc%6]) with mapi id 15.20.7316.034; Thu, 29 Feb 2024
 08:14:59 +0000
From: =?utf-8?B?TWljaGFlbC1jeSBMZWUgKOadjuWzu+Wuhyk=?=
	<Michael-cy.Lee@mediatek.com>
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"nbd@nbd.name" <nbd@nbd.name>, =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
	<Evelyn.Tsai@mediatek.com>, "lorenzo@kernel.org" <lorenzo@kernel.org>,
	=?utf-8?B?TW9uZXkgV2FuZyAo546L5L+h5a6JKQ==?= <Money.Wang@mediatek.com>
Subject: Re: [v4,2/2] wifi: mac80211: refactor STA CSA parsing flows
Thread-Topic: [v4,2/2] wifi: mac80211: refactor STA CSA parsing flows
Thread-Index: AQHaNHOIabKmvUadb0SHw+79jt7SV7EAvocAgBDgcwCAC3RjgIAEUoAA
Date: Thu, 29 Feb 2024 08:14:58 +0000
Message-ID: <4e08126a3bed3e2108e76f2a30d9bf470b5fe4db.camel@mediatek.com>
References: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
	 <20231222010914.6521-3-michael-cy.lee@mediatek.com>
	 <b74f21d22a41b2ca635e64f04c06d5db6d38d920.camel@sipsolutions.net>
	 <765fb43a372825f6063894809f204150d87d4d18.camel@mediatek.com>
	 <51cad25c273b27885f5387f995db48ef97df2996.camel@sipsolutions.net>
In-Reply-To: <51cad25c273b27885f5387f995db48ef97df2996.camel@sipsolutions.net>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5507:EE_|JH0PR03MB8211:EE_
x-ms-office365-filtering-correlation-id: 53137f8d-b00c-4229-6ff3-08dc38fe8556
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5YIMAoD1YzAoLVrDD3eDdjSPo601ARUyTjBf1QQGtUGYIgVYIkIkmlh+mOhT8vM0yxrPwf1/Ngp1lfmsM5MKpm8QS86IL1lF4nqvcVdlZsXW1s5HgKPrzb8H6R1RpPYmTazKmJpIDT/BSSYf4cImMrN4hXKS7veVjz1F2u15s92k32g8NzzBxdfR2T8WoAlB15OgzLli7qXHK49LrQIiOCm8ulgsepHJIyGwdQb4xiqwt+/7JfBBEyfB7+Y60S+oKWKZnv+AaI7R4rq3+ezLxDq99XwjYV86HaROMUpr8A9/0z+LfiIbSZWcY0p8pbEloN6dmSuaK1v1lA5bTHng1H29nqdymiLyYrhY9dpGXeZJoGsyIL7Sc7Ja+4beMWRT6uVEEUp4d3HbJLA4ELSHk0A4GVsB9yfg5rgCJzo1pdfZJTiBiwJCFSuVbXPv0M5QNixVH2ed+7icGI4SAwB0gn+G/Wl/J6bHkdhv6huTaJT37X/6DM+PY+bugzHcq8QOhFXWT8D2v3q/31x/QID8CDI2qnB7tB/IHegSIkmmgRnNxaIKM7QBShKJZHYEp7PaD6TZEwD6QfwkOKW5NCZBvSJw/m4yI6dMuwi6H5VS2u8ijHWCtPbb043z20NtP7FAHLMEpTHSMUSfvLCN8Xm6apDT5eh7UFfO7oQWHvEQ/Fg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5507.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTAwQk9qVytXR3hrZjk0eUlOM0h0TTk5RGZ6M1hwRnJHMWc2bXNUK2k4SnNC?=
 =?utf-8?B?ZkRiL0RGNkZueUlhN1hTMXo5YXZUUVJNNFBqN1cydVQybDY3cWZEbnhyNktx?=
 =?utf-8?B?Zm8xMjUrMXNqRW9YU3ExQlYzLzNaZG9WbHFJR0VRaVg2V3gvSzIwdUhXdjJj?=
 =?utf-8?B?aVZyMGxzUHVUeHR4bGFsZXlRR3FlWk1zcjBXNjJocHNwQ3N3QjVRQXFHZldQ?=
 =?utf-8?B?L3IrSS9wcVQ5UzlRQVdBOEV2Q2hlRGhCZVRuYzNQNmNUbVpNNWQ0d0J5c2pJ?=
 =?utf-8?B?clVUUTkzd3ZmYWFIdWN6Slo1aG56SWVHUTNYbDI4UlN1eGErQTNQanRBMWEw?=
 =?utf-8?B?ekRvTE5vK0FnSDh5WEZvdEltQ3lETk1mcHFsYlplOWp2b0hkRzRhNk1rWnBO?=
 =?utf-8?B?VVdObmw2NEJnemt6Z2oyTkNQeGFxdTgzajZJYk16WUNCZTZYNUViWnpQNUlY?=
 =?utf-8?B?TmZvcnYxZnpvbFNEeE9aYkxXL01NbGIxMkY2UGtCVEdJN2prd0V0UEkyb0ww?=
 =?utf-8?B?VVFTM3hOZkd0V2tVTTFtWTg1NnZ3WWVDV1htT0RUdDJ4ZFpZbGRPemxwbk5W?=
 =?utf-8?B?ME82M1Rya0ppN1VvdTZsM3dRVkR1aFFLcjExc1krM3NTUHZWaEMwaWdjZENj?=
 =?utf-8?B?MXRza1kzRUZWRzQyYlJtZ2Y2a3A3TlNTRmgrL3YyWFU1ZXA5Ly9QdzVlQW9y?=
 =?utf-8?B?RDJCaE0rU3ZneVFWcTJjWHVIVUlndW1mNXNSRXNNVHBuelErUVhhSzQ4aE9W?=
 =?utf-8?B?MDdvR0l5b2dYVDVRNkhuMHE0elhYMTNZZXYrTTVNU0NVSjRkZndaUXlQWkNI?=
 =?utf-8?B?TjdKd0NmVGxpZ3ltK2dCbStnOGNNVlJDT2hxdzRRbWxKQlRLWGZYQURuWENs?=
 =?utf-8?B?M1YxdHlJTVhnUWcwelYxYzlDcmJ3Ylo0QmhyYVdVOTI1VGVDRFROY0RGTGxN?=
 =?utf-8?B?TlBaV1d6T1RDQ1FKbDA0QjFxZ1FBVXE3TDZUS3JvYjQvMmY4VE9uMlZWTWwy?=
 =?utf-8?B?c2drdldFTmRxLzA4L0FtbXZDTlp4bXJDajk0YWtPdlhTMUxiZmJpenR1NUIr?=
 =?utf-8?B?bGVuNEFvdW1PaTBqOXRENmJSMmIzbHR6c0VTN2Y1NnFLQVFmMlUwMkRxSlkx?=
 =?utf-8?B?bFV4NThCSDFuK3E1N0NuZDVFSGVHYmVLY1ZYbzZkREhydHF0c0l0OXh1OXdV?=
 =?utf-8?B?TTU4WjNvWXRBZm5PbG9EWWVMSWl6R0xLWW1lREpndy83bnhDSk1pVCtCUEtP?=
 =?utf-8?B?WTRQb2M2aFlSWms0dG9LakJRUUFVTWU0bXo0WjdmbWhZVkgwTDZaaGkvNFNj?=
 =?utf-8?B?VlRTbVdXc1pxRkkvSDYyNDB1QUp0TTkyUHZqM1NnNE9rS2hiNlg0b0lCSTdl?=
 =?utf-8?B?ZDdPdWJPTkFZelYwS1hYVFI4aFdpdjR6aVBtclJOVHBOV2FKVGsvaHhIcGNq?=
 =?utf-8?B?VWpEdmlBRWNZNkNPVS95d25TOG1jakN4dm84QUluRUlZaW55V3lKU2hjajJW?=
 =?utf-8?B?azNmY2V5QjZFQUZNRGF4WmVDZWtmZXVnVFRncGU3RjlQZkgrZHlnZ0p6YXZh?=
 =?utf-8?B?dytDQ21SWUNzUmFtY0JZbjF4djh3ZE5IVWZhNUdVWGtvQzZ4NG9GYTZETWh1?=
 =?utf-8?B?WDV4ajRuSWE4WFB0TUJieXpTVEU4QVIvZzEreWZnQ09OazlHTnVrSmdsMjAr?=
 =?utf-8?B?Zy80NHJvQnhOWTVtejlSbzVyUG1rZFRIU2YwL3hiTERDcXBJTmxTZ212TnJW?=
 =?utf-8?B?SHFMd2NocEgzYnhHbk12NThVeEtobEphWWJjQlI1dlhERlNJRDNaaU5HMW1s?=
 =?utf-8?B?OUhPaStLZTE1Z3VzUkU1K3I3L1NCMzF3ZzZvV2FiNFdlem5mYW5BY3JzN01j?=
 =?utf-8?B?VlkvQU00bXdWWG5LOW5qTmlwWFZEeXVVb2p4MzFhQlFxOHBoK05EbGtrSlhP?=
 =?utf-8?B?dEk5MGxUR2ZWc2lxVHBjdFI5RGxzbUZGcWdELzJnSm45T1poajlLVTQvTTJz?=
 =?utf-8?B?NE5ielJCWStpZldPT1pIZ0NIZm9nVkdKV0t5amFYczFPTlhsbm9pd0hKb2hk?=
 =?utf-8?B?L3dZc1NUcHhXNjFBWTY2d0Zrd2VPWGFLMUVUNG5KZnJ4TGpjSllZdVhaK0RX?=
 =?utf-8?B?azVRWFFlc2c3bGFYV2RVVlUvQjlsc3lvaC84TDVHT3JReEVJcnZYdVJBbGFY?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8A33883EDF7C2448CB1B201D5BC0971@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5507.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53137f8d-b00c-4229-6ff3-08dc38fe8556
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 08:14:58.9195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JUp06PpVN0yK+12RJBKdLR4kKGXHOeOVJU1B7v9UhmxsH9rMVzEx7vEs87fEGbv7aBjBNSO6dvt9iJjjY0MT4aMAZqZ+wTKReSl8zCx5l2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8211
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--27.512800-8.000000
X-TMASE-MatchedRID: byfwvk+IcRljDV//SvkH3t7SWiiWSV/1jLOy13Cgb4/n0eNPmPPe5JHb
	921VhO8EwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2tICsP4rpeGcfSde/CNbaZJft592eq2xoT0TY
	N4q6hXjD77kbJEQUQyu7yd6tyBEMbRG8VGwrx1stjoaO27r+3fdZKsq3DGpals4OzwzqsfrwASh
	pFvc55+TWYCrl4C4KT/QKDlEDrWvyhzaM0+ttmeDPDkSOzeDWWQrO4XR6BRQP1gF7PCEF9bhnH3
	2sG9jpsWVT8b0UI5lSntPlSDgaUDR2P280ZiGmR8CORMyRE01Rzd7C7BtJobmHtZs6e3ZMHHd4F
	xb+OrJxtv4PpsEqNgwXzpbhxrY+w/FCPU2bFxsSeAiCmPx4NwMFrpUbb72MU1B0Hk1Q1KyJHtBs
	f5/UXJbVQu1GNZ+sikGUtrowrXLg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--27.512800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DBCDABC5E23F67776925655EE2944C504E8945ED5F64625882D19F2A930AD5152000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_001509_933949_18E7A334 
X-CRM114-Status: GOOD (  18.89  )
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

SGkgSm9oYW5uZXMsDQogDQpQbGVhc2Ugc2VlIHRoZSBpbmxpbmVzLg0KDQpPbiBNb24sIDIwMjQt
MDItMjYgYXQgMTU6MTQgKzAxMDAsIEpvaGFubmVzIEJlcmcgd3JvdGU6DQo+ICAJIA0KPiBFeHRl
cm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0K
PiAgSGkgYWdhaW4sDQo+IA0KPiA+IA0KPiA+IEluIGZhY3QsIHdlIGhhdmUgcGxhbnMgdG8gc3R1
ZHkgYW5kIGltcGxlbWVudCBwdW5jdHVyaW5nIG9uIG91cg0KPiBNVDc2DQo+ID4gZHJpdmVyLiBX
ZSdyZSBjdXJyZW50bHkgd29ya2luZyBvbiB0aGUgQVAgc2lkZSwgYW5kIHdlIGV4cGVjdCB0bw0K
PiBzdGFydA0KPiA+IHRoZSBTVEEgc2lkZSBtYXliZSB0aHJlZSBtb250aHMgbGF0ZXIuDQo+IA0K
PiBVbnJlbGF0ZWQgdG8gcHVuY3R1cmluZywgYnV0IGlmIHlvdSdyZSB3b3JraW5nIG9uIHRoZSBB
UCBzaWRlIG5vdyAtDQo+IGFsc28NCj4gcGVyaGFwcyBvbiB0aGUgQVAgc2lkZSB3cnQuIHBhcnRu
ZXIvb3RoZXIgbGluayBvbiBNTEQsIGkuZS4gb25lIGxpbmsNCj4gZG9pbmcgQ1NBIGFub3RoZXIg
YWR2ZXJ0aXNpbmcgaXQgaW4gdGhlIE1MRSBwZXItU1RBIHByb2ZpbGU/DQo+IA0KPiBJJ2QgcmVh
bGx5IGxvdmUgdG8gaGF2ZSB5b3VyIGlucHV0IG9uIHRoYXQgaW4gdGhpcyB0aHJlYWQ6DQo+IA0K
PiANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXdpcmVsZXNzLzNjNTUwYWUzMzVhOTc2
MmE5Y2JkMGM4MTA5YjZkZDk5ZmFlYjhmNmYuY2FtZWxAc2lwc29sdXRpb25zLm5ldC8NCg0KV2Xi
gJlyZSByZWFkaW5nIHRoaXMgZGlzY3Vzc2lvbiBhbmQgd2lsbCBnaXZlIG91ciByZWx5IGFzIHNv
b24gYXMNCnBvc3NpYmxlLg0KDQo+IA0KPiBCdXQgYWxzbyAtIGlmIHlvdSdyZSB3b3JraW5nIG9u
IEFQIHNpZGUgZm9yIHRoaXMsIEkgaGF2ZSBzb21lIGNoYW5nZXMNCj4gSSdtIHdvcmtpbmcgb24g
Zm9yIG1hYzgwMjExIHRvIHBhcnNlIHRoZSBwZXItU1RBIHByb2ZpbGUgZm9yIENTQSBvbg0KPiB0
aGUNCj4gb3RoZXIgbGlua3MsIHRvIGUuZy4gdHJhY2sgQ1NBIG9uIGN1cnJlbnRseSBkaXNhYmxl
ZCBsaW5rcywgb3IgaWYgb25lDQo+IGxpbmsganVzdCBkaWRuJ3QgaGF2ZSBiZWFjb25zIHJlY2Vp
dmVkIGZvciBhIGZldyBiZWFjb25zLCBvciBzby4uLg0KPiANCj4gV291bGQgeW91IGJlIHdpbGxp
bmcvaW50ZXJlc3RlZCBpbiB0ZXN0aW5nIGFueSBvZiB0aGlzIGNvZGU/IEknbQ0KPiBjdXJyZW50
bHkgbm90IHJlYWxseSBhYmxlIHRvIHRlc3QgaXQsIHNvIG5vdCBzdXJlIGlmIEkgc2hvdWxkIHB1
c2ggaXQNCj4gb3V0Lg0KDQpPZiBjb3Vyc2Ugd2XigJlyZSB3aWxsaW5nIHRvIGRvIHRoZSB0ZXN0
Lg0KQnV0IHdl4oCZcmUgc3RpbGwgd29ya2luZyBvbiBNTEQgQVAgcmlnaHQgbm93LCBhbmQgdGhl
IGNyaXRpY2FsIHVwZGF0ZQ0Kd2lsbCBiZSB0aGUgbmV4dC4NCkluIG90aGVyIHdvcmQsIHRvIHRl
c3QgTUxEIFNUQeKAmXMgYmVoYXZpb3Igd2UgbmVlZCB0byBmaXJzdCBnZXQgdGhlIE1MRA0KQVAg
cmVhZHkuDQpJZiBpdOKAmXMgT0ssIGNvdWxkIHlvdSBnaXZlIHVzIHlvdXIgY2hhbmdlcz8gTWF5
YmUgd2UgY2FuIHRlc3QgaXQgZHVyaW5nDQp0aGUgZGV2ZWxvcG1lbnQuDQoNCkJlc3QsDQpNaWNo
YWVsDQo=

