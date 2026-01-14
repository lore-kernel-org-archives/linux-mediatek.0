Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0246AD31A14
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 07:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytjthz10Lp2XRwdxBJuZvwV5jddhJxz7zgz9KhKwQx0=; b=uFS/iQtkLwFBN4IQZF077a6dlc
	3WYaHJTydhN1qZn9xfHedcbeD80ozECeazOnF6iDF9zaLmI0stISU5mYOFNAWacUHwFGNQ78zImGS
	8O7tHzaXytvUnhrr9z88oiy7aqfray+vBR7c6+WiWSjKLQC4WrIUl+AdgEf1bqp1mgurtsoaDDLcu
	9Getdus6IMNNAEKD96d/Y/Nlkd7wNs8t5mxy7p3zeLhTGaKmqpN+W3vOvgT+EYo+S10VB5h8OupZr
	lKJ2b/756r/94s0TgLqUnkjRHoK9q2rJDyj+gf4X+zcaZOkeSXn+lc0FxKQ7129lBROP+szZqka2T
	6K9oY1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfv11-00000008ASg-21ZM;
	Wed, 14 Jan 2026 07:10:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfv0z-00000008ARy-1tvg
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 07:10:02 +0000
X-UUID: 07a5823ef11811f09f706fa2197c6ceb-20260114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ytjthz10Lp2XRwdxBJuZvwV5jddhJxz7zgz9KhKwQx0=;
	b=JSgFi1pgBtcx78vAviRJIhZCTXLICtHc8LKsyIVE5QECfG5gBrRa+vNuQ5Wn+0CKlUxTUBeWYmS+Y1fdCpfx5LBtUf9PIvaOGqR1UIhFvc1bhj3H3G7+6UbqmpAgoLfzYMQUvPdXuEW5LBFGSw66yFx/O92RSFOsUYksbwJ7kCc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:ce9f0087-0f10-45fb-b09d-aba2543ba022,IP:0,UR
	L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:2
X-CID-META: VersionHash:5047765,CLOUDID:94b07ee8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:4|15|50,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 07a5823ef11811f09f706fa2197c6ceb-20260114
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1336289474; Wed, 14 Jan 2026 00:09:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:09:53 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 15:09:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbQcihvkASqy8bQX91pitjUrWk1kFoNXlzsDoVHYzcgAHvOCzDaSP5dVaKSG02OWYmLdwjIRCRJyH4b7ycmrV2Cxf1HStumP9zXnW4BFd7JPKr45FrAdUXGAkLrQErz9rkzvVZZiyBiWmE5lUP0CX+1FkmM+j7HSqnNCBE7QkdUsImY4RjukT05ntIsPeE6wTs4v6eIAawJ5iHFMtiVM2xNzb2XIEkhgzl66lB2Wb6zdKQIUZD7llQFKY3SXytzrC/tVOQ0atzADT6HGdQ61tssM38fMoyqiVwZLTwkYavMm0JH0T5lP0vkox8SWR0+rlRxO3BjGLzrA+6fLS7VeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytjthz10Lp2XRwdxBJuZvwV5jddhJxz7zgz9KhKwQx0=;
 b=OaRBLNEOPgKfBh9F5+z8fUTd++YEeVpN2YrCUakki9pWovj9+SdzFBbTpGuMf7gSiofIEjoGyWeQQNnNlw7WYS0tWNvbEKVbb1O/6wzBm6nmOmmXYYYhW/R8PMG1Mn61pWgmYwv/VfxXejCUy76oocEvSUjxqvLIlgLrx6V9H7hiaj9W7YVWy+s5Gd0KUuOd3R3J7Yr6lVfk+z0y930Ohcn0QMds1R1BAJD5DkdH2d7u9FFL27NdHh8riE6uoRfGQZQ9vvDiTLISh28io1SzF5tQWnKVQaYhTSNVYMuRXYHnBUDqJwxbicGmoVFipEtjcQRg3sVi3QICuP619755pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytjthz10Lp2XRwdxBJuZvwV5jddhJxz7zgz9KhKwQx0=;
 b=rFPUb+RIeyEBBbVyN0AGFFxzallln7XIL3pRGyAsWj45vwoiKfLKZaoT039zUz79G+mCcFrzz8ixJ15KG5cc5W80SYqFmf/+m+OhOF8qaZcJGueMcZ3+aeMYJdM9PdqjW1RAaSBtY96M/7RVWRlmBWm392IUBv+RLVrs0b5TxBQ=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SI2PR03MB6485.apcprd03.prod.outlook.com (2603:1096:4:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 07:09:50 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%4]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 07:09:50 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, Nicolas Prado <nfraprado@collabora.com>
Subject: Re: mediatek: rename MT8188 SCP firmware
Thread-Topic: mediatek: rename MT8188 SCP firmware
Thread-Index: AQHchQrmEExxYZ2Ik0CrQJTC5n/e4bVRP3MA
Date: Wed, 14 Jan 2026 07:09:50 +0000
Message-ID: <3ac652e2eb1929f1fdc6269daee8e9fdd1b256da.camel@mediatek.com>
References: <20260114014131.2933478-1-moudy.ho@mediatek.com>
	 <3vphktkj4jv4dymnorkruxxyayivxn6e6n63sl5iweo4jh7csl@5audwfacojyx>
In-Reply-To: <3vphktkj4jv4dymnorkruxxyayivxn6e6n63sl5iweo4jh7csl@5audwfacojyx>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SI2PR03MB6485:EE_
x-ms-office365-filtering-correlation-id: 84c0dcd9-ff9b-4f53-98ea-08de533be881
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NldpcDBxalJsRklNazEvenRvQ0s5dUltZGJpRm1CdzNxRkFZNzBLZjBMOFhH?=
 =?utf-8?B?Sm5MbGRVQ1RjRGRscmFNNmlNUGM4ZW5GeWJFTEdUTmx0U29uMHNNMmNBclV2?=
 =?utf-8?B?ai9VUE4vaEVUUFU5emhlWjZkbEVuWXh0VFVqWUdnTFR5YzJjMHV1UmI1ZzB6?=
 =?utf-8?B?UkNLdWpRcUtieVFoaFZsd1V2Ymx0OFI3dFdXUEs2UWNpWG1LMUJqRDFsVHlP?=
 =?utf-8?B?eEw1VXh4d0VubnVMdkthbHNwWCs4R2hpM1dYbXl2eUE3aW8zWWtWckdtZWFh?=
 =?utf-8?B?YXNVbGZYSlR4T0VkSFI5VUIxUUJVMFFRNmoxeGtSTFlPclM1bmp0L0FobS9I?=
 =?utf-8?B?Y0RRUnhrSmVkUjY1SGdyQVdyYmhLWFRKVnlLYXE4SEJhR1BGSDQ4RndEKzVI?=
 =?utf-8?B?TVBleUk0OTVOWTVhMDNkb3J0OWJyWkg2TE8wVW92RTlYSkFTWWpUL0o2VE9V?=
 =?utf-8?B?MTVBVXNMR1lkNnBZbTVDZTc2N3BxUUFGSmVPakkzcHZjUCttT015UFZadi9x?=
 =?utf-8?B?U1pIMUxJRy9JRURnaTdHUzFlRkQ0UmpOTXB2K1ZaYThkYy9PVjlmYTI3MVAy?=
 =?utf-8?B?TWpZVDFwYVErTnIzK3R3RDRVUU1XTkpObWFBYjZ1MUo5NENJbjdUQzdRYzRJ?=
 =?utf-8?B?OGk0cHZ4Qk5kazVqcW0wTFhESW5jL1AzQ0VPM0dCSlJQTVE2anU3UHQ2QXl2?=
 =?utf-8?B?MDZlQmwyTDcxZGoxYlc0bm5hVkVxR21oNW1hTm1PUFFQSjB6amh3Tlp1NVNy?=
 =?utf-8?B?MDVtZVl0ejUway91bURVbTFtdEd6ODQ4cVJCOEQvUXlNU05nd3gzVkE0VG1n?=
 =?utf-8?B?eGZTOGxCWjBPbkpSZ3RIQkZUMXFBUXRwNm5JTlJRcVdzVFhMbW5aZFdER3N6?=
 =?utf-8?B?d2dwdWVScUFDOE5JOW5NbUlBWEh0MWp6TkZSTWMyYldsYzlsc2kzeER3UkNz?=
 =?utf-8?B?bVE0Wi9WQ01IbEhlQWNtbGFhd3I2L01aWVl5cmM3U2t2MnJXTnl5WFdMYlRu?=
 =?utf-8?B?S2IvbzVETTZLTnlFMlFVQUNqWHJuV1lDTnVqMlVBK0QvLzRPZ3ZrRG54Unhk?=
 =?utf-8?B?NUNCZG43WmRlaG5CY2pLZ0lnT3IzZHlaTDlVQi83R2w5OFBqc251a2ZiS2Z1?=
 =?utf-8?B?YUV3MFJ0U3BNOTJRNG80ZHdvK29ZL0xPMitUNVpEc2M0RG5yelRHcDA0L2Vp?=
 =?utf-8?B?eHRRR0p2eVBRY01KMk9tZ2pTRjB0dXpoaDdyRG11MFAwNENwd0htU1lVOUlC?=
 =?utf-8?B?YjFCeUs3dXZPSUtmb1RXc295aW42SUJkRXJ1em1yaUpJUm5oYWQ4Vjl4Yi9q?=
 =?utf-8?B?Tk5VTnlKRlF0V3FYR3c3cjhJYU5rYjcrWjNGY1VDb1pscjJlU2RGUEhISzFz?=
 =?utf-8?B?ajFmVlhmQ3lSajVkLzg2cGpRUS9icEk5RVdaYjhMaTRJMHFwOEM2WWZRcGQr?=
 =?utf-8?B?ajBLMG9Ic2szcTVnRkRwbElmaDJNbEJGK0drYm1mbkZMZzN4V3VqVnE2RUwr?=
 =?utf-8?B?K1hkSEp0YXRzNjQzUFFDMno5RkVDNUJoSnhleWx2TVFCa3JWNHhuem1NSmhD?=
 =?utf-8?B?K2VKZHUrUVJkNWk1bE9KOUxjQWFqUXVCVTJWREdJZktxcDZCOU5jUmd5dXRl?=
 =?utf-8?B?RVk1OVlEZVpSamtuVUR6bXNmV0VMTWJwT05LTGdvbjRVN3dzVnlOWWFybVNS?=
 =?utf-8?B?WStmeGdRNmRLWnZ1M2FMSEd5TWtiVnZiS09Day9RNDNaM3FwTVlxKytFT1BX?=
 =?utf-8?B?d0VDalBKdjhlRXFMdUIyb240VXVxN0tVY3F5RmlIQWZrWkFiUG9YekxjWCtD?=
 =?utf-8?B?VmVVNUNTV3kyMzMrOXdjSVZlRHdBcnUrTkhBWFNLaW9wc3F5R0lUSGJCL3VV?=
 =?utf-8?B?Vy9rWHpTT1kyUkRyVUliMVprRUhHVUJvUXRFUXJsMmp0VEV6YzVkcDV0R1Bl?=
 =?utf-8?B?djRVdTNhVkZ4S3FobUdzWlNYRjUvNkFqQmZkN0FtaHJpb0creGxkeWRQMmZt?=
 =?utf-8?B?Z1RHZzhTUXFxRGxsK2J1QW5EN0dsYXdSTHlxdjZLczh5eVdjMzEzNk5telBr?=
 =?utf-8?Q?bf9tiY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2dUL3NkeDhIWHk0bk5rdmcrL1o1MFFIWkgwallDYk5PZCszd0hCL053QnRr?=
 =?utf-8?B?bzJ3ZFh5UTUxN3h3bjlkblVOVFgzOXhLejlDVTVQWllMNFF3eDJxQ3hJMTlv?=
 =?utf-8?B?TEhpZk11TnhxVENFV2xqMVRQKzh5aE1wTkl0Uy9zNHJrY2l5QWsvM0xvV0Zp?=
 =?utf-8?B?a0tMT0xKMTc5bWEzWi94QkhtVjNXeTZOYXZCK0h6S0tyU2VaZGZ1ZGpBMGJh?=
 =?utf-8?B?MmVtd0dkNmlsTXNjMVJVUXBwZVpzbk9aK3dzTUw4SWVHZW1NMWNkRnRVYUVC?=
 =?utf-8?B?YXVwN0lacTZ1Q3k2K1NIVGhqSDFhUmdZdm5zVEhHZE5xYnlqVUcrSEVRa0di?=
 =?utf-8?B?V3EyYjliMzBoRGR2YngwRGlDREhReHJCRXYzTWhVejZTY1JCekl6Q01JTFEz?=
 =?utf-8?B?Z1pucEtwVHNzWGlmbzQ5SW5TQVhCQ1ZZd09aR01GYVFIRlp1dHIvUndlSWcz?=
 =?utf-8?B?ZzBiS0dyN1FTMllmMmY5c2grTlJMVDBabFkrWHB4T1JmVVN1QnBoUEw4OGFl?=
 =?utf-8?B?ZFY2UkgwMisvcmNnTlJRRXFxOTM2dUhySHlJRlpWUDUxYy9jTEp2L1VtRG5s?=
 =?utf-8?B?RGNWVHVBM2hTZU9PUmJObHFPR2tXOHZxVzN1NFNNeDdURzNWZThXdDJXc2Vo?=
 =?utf-8?B?YkJnc0pFUnBEckZ5bHZ2TzYyMjVkRXZ2aVBmNVgzRHQxYjNMejl4cFBwUGo3?=
 =?utf-8?B?OVBSZndPUWNmbzhNYzYrbmtCQ2tBMHhaZEplYldyRzMzWG9RV3IyODNCYXFJ?=
 =?utf-8?B?Vmc1dE45ZW5qb0RBT1grNThuQWZ3cVFremhLbGVUTVlBTCtBSWlpckxxZWVZ?=
 =?utf-8?B?NFBBcWtheHZmcHBoLzBSVDlqNld1d01PbUhZa3NVeHB3WjEzck1xNFU1RlMx?=
 =?utf-8?B?R3IwTG9UUjUrazVTUHorV1E3UlkzRHFXM1FtVndHU0xDYXkvOWJJODB6QnZp?=
 =?utf-8?B?bTVjSng2Y1NTeTB2aDRzSmRTOTVjeE8vT1BTVFNNYzZxQy9ud0lrUUlEQzlX?=
 =?utf-8?B?NjQ3R2ZLZTU5ZDZXTGxVcEpvR1JGUG5WMERxT0hwb040akQzZzdBa01BSDla?=
 =?utf-8?B?a3E1bWtxNU5hZVNUbWpjdkZjOWZOM3h2ak4wL1FOT3pSVWlvSzZ3Sm82Ymsz?=
 =?utf-8?B?NnhvdWxvYll4YUdCZWcvUkN3SUZmeUxBMDlHUTIvdlIwOStsYzZES2JSNDd1?=
 =?utf-8?B?VGlJeDU1NEk3ZFFnYlkwd1JaT0NnWUR5MmgzbEl1UkJSYm9VM2hrSXF1UlJL?=
 =?utf-8?B?SnBJZFhaV0NNREd5SmZzaEcyRTd2YUd3VjJnR1FyMVNCRktFZzltUHJ0Wld4?=
 =?utf-8?B?MFBQcDc2cFV3cDRGUFVjRkdDMmpjUGJndnpuUW1kSlA0T2NSWWhNcnhPeG9T?=
 =?utf-8?B?MFhuenlFTmYrOUI3RHJJVmR2RjNOR0xjYzRuVjczZDd1RHYwcHRIdjE5NHlC?=
 =?utf-8?B?RGgrV0xxSi8zenRmQXI3OUMzR2c5SXpTVkJCbzBldWt4UHVaNzJvWHhTUlg1?=
 =?utf-8?B?WkxMK0tUdDFZVzhxbFhtNWNjZE90U0hseTdoUGordFhsOS9jN3g1ZlF3OE1j?=
 =?utf-8?B?dzQzT0VCa05DYkh3Yk5jMWxMRmhRSlBBL05ZZFBNUmtscjZURXdJNklVQzYx?=
 =?utf-8?B?RVZjd3NtQmFKRHhOd0NvQTVvK0w1cHhwaFkvZ2loMXd6dTJrZ2N4RjdmM2RU?=
 =?utf-8?B?OW1WQzBpQXBtZjBnMzV0TU9DVGZGakZXQlQ5WkJ0b2hxL3ZRZkZFWkNRcjFM?=
 =?utf-8?B?MlZXQitFZDd2c0VRWHNkdHAwTHVSZUtQUFplZkI0RWFrU0tTMUtoTm9mbjhm?=
 =?utf-8?B?WDlmNE9Fc3FJNEJYakNIVy95TUt6OWRIOGNzUjBBM29zL1ZJUGlPczg2L3lm?=
 =?utf-8?B?eFBvMG03ZE1WVmlqYS92WmpnT1IvczF6aEUwTXlpdGhhTFEzRU9XNitudHBt?=
 =?utf-8?B?bi91enBDVklVdzJoemxLMllTNk1ZQjdqdHFIWGM1YkRBUnpTRitreS83VE9y?=
 =?utf-8?B?bFVTOEtjZnhxbmgzd2ZIV1JMWWxxSVAxa2tObUdmZ3pqMXJ5bTlnR1lZNFpC?=
 =?utf-8?B?cFRmQTI1VXl0bko3V0Z5ZEpvVU9xbUtwMEZFRFNITnltellrQ1ZaMzRQRVJT?=
 =?utf-8?B?WVEvV09hZFF0UlRBQytNeDhFNWVMZ0lsVnp6KzAwOWhOUWZTUzJwUlFodGdk?=
 =?utf-8?B?ck5KOGpUeGJkdDRNYVptN1gxNjZZMjhiSHkydHo4TmxuYngvbUgvTXlZNFhW?=
 =?utf-8?B?MVFmblZzQk1DamZqMmsxT2l3ckdqNE5iOEJmYjdTVmY4YWlmUU84eDdJYTR1?=
 =?utf-8?B?WnhpeXVtdlZXWXhaSFJEaWVKbDVlSXNrMkdrUVpjcHZXQWdaRk1PZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B28379DE92D311459EC6FC87F304A628@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c0dcd9-ff9b-4f53-98ea-08de533be881
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 07:09:50.1624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzV4uvnjllvZwrNsXTrKSOKO0yL6+FFOiOpe8cWFsK/XqUmIKHp4zicoGPNN3S5EJeqX19HOh+DwqzbIJh7P4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6485
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_231001_525792_EAF5B034 
X-CRM114-Status: GOOD (  16.69  )
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

T24gV2VkLCAyMDI2LTAxLTE0IGF0IDA2OjA0ICswMjAwLCBEbWl0cnkgQmFyeXNoa292IHdyb3Rl
Og0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCAwOTo0MDo0MkFN
ICswODAwLCBNb3VkeSBIbyB3cm90ZToNCj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
Y29tbWl0DQo+ID4gNDg2YWM4ZjlhZGI0ZDc3Yjk1MWI1NTE3OTk4NWM2YjNjMjBiNjk1NzoNCj4g
PiANCj4gPiDCoCBNZXJnZSBicmFuY2ggJ3JvYm90L3ByLTAtMTc2ODE5ODM0MicgaW50byAnbWFp
bicgKDIwMjYtMDEtMTINCj4gPiAwNzoxNDo0MCArMDAwMCkNCj4gPiANCj4gPiBhcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gPiANCj4gPiDCoA0KPiA+IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vTW91ZHlIby9saW51eF9md19z
Y3BfXzshIUNUUk5LQTl3TWcwQVJidyFsbEJESDZRLWpyZlVNR0lzdHRLU3hFYTRaS1FGZXRGT0NZ
d2gtOHl4NTdHSU9iQ2w1MHo2aUdDUTJDdVdvaU9kd0p5SlVZNTM3M1ZWdFAxa3lRNzdFRUg5VDQw
bDliWURsdyQNCj4gPiDCoCB2Mjc3NDguMDQNCj4gPiANCj4gPiBmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8NCj4gPiBhMjc1NzJiYzgxZDUwNzNlODI4OGMxYjhhNzg5MDNhOGFlMjA0Nzhi
Og0KPiA+IA0KPiA+IMKgIG1lZGlhdGVrOiByZW5hbWUgTVQ4MTg4IFNDUCBmaXJtd2FyZSAoMjAy
Ni0wMS0xNCAwOTowOToyNSArMDgwMCkNCj4gPiANCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gTW91ZHkgSG8g
KDEpOg0KPiA+IMKgwqDCoMKgwqAgbWVkaWF0ZWs6IHJlbmFtZSBNVDgxODggU0NQIGZpcm13YXJl
DQo+ID4gDQo+ID4gwqBXSEVOQ0XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArKy0NCj4gPiDCoG1lZGlhdGVr
L210ODE4OC97c2NwLmltZyA9PiBzY3BfYzAuaW1nfSB8IEJpbg0KPiA+IMKgMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiDCoHJlbmFtZSBtZWRpYXRl
ay9tdDgxODgve3NjcC5pbWcgPT4gc2NwX2MwLmltZ30gKDEwMCUpDQo+IA0KPiBFOiB0YXJnZXQg
bWVkaWF0ZWsvbXQ4MTg4L21lZGlhdGVrL210ODE4OC9zY3BfYzAuaW1nIG9mIGxpbmsNCj4gbWVk
aWF0ZWsvbXQ4MTg4L3NjcC5pbWcgaW4gV0hFTkNFIGRvZXMgbm90IGV4aXN0DQo+IA0KPiAtLQ0K
PiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0KDQpIaSBEbWl0cnksDQoNCkFwb2xvZ2llcyBm
b3Igbm90IHBlcmZvcm1pbmcgdGhlIGNoZWNrIGJlZm9yZWhhbmQuIFRoZSB0YXJnZXQgcGF0aCBv
Zg0KdGhlIGxpbmsgd2lsbCBiZSBjb3JyZWN0ZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4NClRoYW5r
cyBmb3IgeW91ciBwYXRpZW5jZS4NCg0KU2luY2VyZWx5LA0KTW91ZHkgSG8NCg0K

