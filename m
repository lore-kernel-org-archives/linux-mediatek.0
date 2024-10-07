Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9E1CFB442
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 05:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnQJEIrBr+3AJRpAoXbVmJg0ozKlrF7DNBFK8azViGQ=; b=REJfCZqSQuhljp4sOzixb4etbo
	SOfc4az8v+TYUXYRmYhirEsTbT3iRWpmK1idTFovYEEW66+ZqYs5RFg1VbcPy5IxNK7Lgp6ZwDILw
	wOvXiR4outyQim7fQyWIbXmPhZfozRzilw8tSsyiJwwjYo1JzhjD6ygaBSVwglj5En1pxmk12emx2
	b0/bcRZEtlizyU92HzJoj8rn2INcX3c0HyBwkZ0Wj6l3YdMxqHRokdK7g0sqcqPJidWW2TMzXahhT
	LYSvECdQ+TLC9AbUM3MRGH8wm957MM5wg+vcApwe0WPzgXxfRym78sRNyenZdjMWA5UcBCnaEr1RS
	EhLQPhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxglW-00000001M0q-1vQV;
	Mon, 07 Oct 2024 05:58:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgkD-00000001LqQ-2CHB;
	Mon, 07 Oct 2024 05:57:22 +0000
X-UUID: 00ac9b26847111efb3adad29d29602c1-20241006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MnQJEIrBr+3AJRpAoXbVmJg0ozKlrF7DNBFK8azViGQ=;
	b=OBAqdIOC/SJJV9Wk9vHJt2sGpDDQmZra0pZNf8sznGBNx4I1Sr2tQdlbgWYnVOPGpFqCzn804fxU5XdfJkmoVdW7gHvW9D39HgjM1etuxKk3TkjWLwccSpvz+0EI3eVfnywmOUHxDoPh2UE6fi4dIF9HOHo3HGrtkGZLtfII1Lo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:88a989f6-ced8-42a5-a12d-ef5785cde3bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8afdd864-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 00ac9b26847111efb3adad29d29602c1-20241006
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1668377230; Sun, 06 Oct 2024 22:57:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 13:57:12 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 13:57:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4dal5QfG+q4221LGZkN+90RA8DMIzbDfaecwo3qpBMB/MmxHJYRqiCGWVym946Y/sgibi9DJ2v7jvYnmWvZHNNQzk0nW1ref5a7bSNVCbgG7aZmdMdFp7tWsRzOmjf1GA46dovLT/VWI8QnpIUVx72xbraRaDZXsQ+BLStd/q6NCZ5rC5inLsc9IJtDqeq/ZVvNL+RMRPJQU3iFwnOzAHFdcV2rS36AJN68YZIPKNOUAGqJLbDMeT7Mwknd6J8Q08/kgKSyAlBYVyHYbVKrRW1+j8nGqwGyG5jldpFVoPzzkUt8+WIWEemzLnRGbz/xponhdltCBbJ2PjCMaMC7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnQJEIrBr+3AJRpAoXbVmJg0ozKlrF7DNBFK8azViGQ=;
 b=Ah5+vAmxMc5GNw0d1TNCUXm52AIJGJZ2vp9w8NHuBa+2PTOOTMVpPa/FySMnYNztziu7nl1bcCGpAZbKrqPLP+zJfPDLafd8j/4JnYTq9TugTBvokCMTRUR/0RmshM9aUT4f5TacfjPR6eG+1nOCHtdHTV4nNFfGrXT+mvVOWoY3jxjnIKH12uQJ2u2GBY8u7NFTaJF0Sn8bTZmtrXtZqFMVzW9Sw/Bl1U6SW58yz1VbsaY+mIIw+EC6rSFry5iSo60kIAZQMg3U8/4Fpk9vwhFgg/ueBjDbLqwqO836MRrCpngRsSQdXQC49xPhMEonuI+bOvKPHm5RopT0O7gJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnQJEIrBr+3AJRpAoXbVmJg0ozKlrF7DNBFK8azViGQ=;
 b=OA6k/8NYqVQ2VhktU1ws6PRfsBjtGpZ0zCiObF1zDGaXJvwdxGhQalwFcB0DDxLzSAIqEcigxK9EeDZ+ok4OOfcMhV5XzYXeBKTw17PcisZsFwk1+nBeI/CnBiJ2qbUNobDYTwI4i/A7/zsamm+Dir4Wl9OA01bs7Qt+YKwL+Bo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6807.apcprd03.prod.outlook.com (2603:1096:4:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 05:57:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 05:57:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"me@adamthiede.com" <me@adamthiede.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "yassine.oudjana@gmail.com"
	<yassine.oudjana@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: Fix XRGB format breakage for blend_modes
 unsupported SoCs
Thread-Topic: [PATCH] drm/mediatek: Fix XRGB format breakage for blend_modes
 unsupported SoCs
Thread-Index: AQHbFwxhTbwu0USGrEuiSQvvPN2yo7J6zWMA
Date: Mon, 7 Oct 2024 05:57:08 +0000
Message-ID: <fe1784eb5b64327c2a6a5836f245501b7032b1c5.camel@mediatek.com>
References: <20241005095234.12925-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241005095234.12925-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6807:EE_
x-ms-office365-filtering-correlation-id: 5ebadf52-8cf5-4666-c975-08dce694e152
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aHBiUU9tTjJGY05tcjNNQ3c4QitIUGZUS21SWjRSQzZxcTFLR29DME5JSTIv?=
 =?utf-8?B?OXYzeEtoR0tSZ2x3dmRJYjc2MlZsWlRBa2lPeXhlUmtuNXZ2dmRXT1ZqaWdJ?=
 =?utf-8?B?a29nT0tIL2VNTklPazg1OFZmYnVYUlBHbW45U1RacDh6eFhPNll2ajNvbnZE?=
 =?utf-8?B?djNsUG85NFFVRzFEWDNzc01vdTNPWWhPR2lsTXhoSUg0TE9iQkdPUHcxVEx3?=
 =?utf-8?B?TktMRG9HdmYxYlJkdDdqaGExcVBJV2tKbFNFZ3JpSW1HRURZK0k1RExvalNj?=
 =?utf-8?B?Q1FCdTA3T1FzWHA5SFRHdlFIcXhNT3g5bzZtY29aL2dleWkybjdCOHJJVkFi?=
 =?utf-8?B?VDhZK3IzK2pFOGpGSXdsMm5hRVVLT1ZSbU9MWkVvTHNiaTZMZ3BUdVVqNExy?=
 =?utf-8?B?YzF2UE9JOHlRY0lFeWIrMXFJc3RjZmVLNjFvejRIOVE2eTFaaktmdHJPa25X?=
 =?utf-8?B?TS9jOVBPb2JsSEkzeFgyeTRTWTBkLytBM3pheFUzSm9Rem1OclMvc1RldzUy?=
 =?utf-8?B?UXJmeEkyMzFhMjdxanJWQU5SRzFWemxZRjgycUU4KzlZcXY4Slk4dXRqbC9j?=
 =?utf-8?B?ZGRWMUpQelFmUTc5bzZhOVN6MjBjK3hpQUZ1VFFiS0ZNU0hDNnNtbUF3MHg5?=
 =?utf-8?B?TjhBTTNrL1VKTTZyaTFNV2lYZlVQRkRRTXRPOHhjcWpFVVYxUEdtOGpicW1v?=
 =?utf-8?B?VFowUDlIRmUxOFZpOGRxQWJ1L3I3eC83ZFRwU0ZqdS8yWmREWEE1d0tSR3Vo?=
 =?utf-8?B?ZXlwZ1NMVGxGdUdoYXpiS0lDNVB2M0NXWGVCM0I4U2taWmJSektDWlUvU0tT?=
 =?utf-8?B?aERwQ3ZZZm5FMjVyWUtGTTF3KzE5RE9GbHBMK0tiM1dXVTlGRjlCQ2xocExZ?=
 =?utf-8?B?UTU5SVlhem44L3ZqWFhhUTN6SlAxaWUxZEdUa1ZsWGs3T244elh5WGVKVjZq?=
 =?utf-8?B?OCtqSmFnY2xSZzVKYkYyNEdEZTBGUlVUYmpKQXlEc1RKbEdpZGN0bHRTZjRP?=
 =?utf-8?B?cG8wbjdlSnRXYk1WVktrRWZiQVh6dFl3TFFZejQ5MEdNaTJJbTBVTmtaZ3lz?=
 =?utf-8?B?WXR1RWZuOGtDVFdDZUZ5N25TZHJGVVNENytzQzkvNzI1Qk1LNmFHTkowZ3Ja?=
 =?utf-8?B?Q21IL3lQSEZRKytTdFF0TUkydzl2aHVUdU5ZWitEWDRrVDBKeWdhSWdZYzJ3?=
 =?utf-8?B?S1hpOURtV3NmV3l0T3h0Z3Y2c0puQzVpbUVNRmt1NERMTGluS0FBeXdyUDQ5?=
 =?utf-8?B?c1c0U212d29ZNjA0MCtnY3hYbFZ6djNXTkUycHZqbGd0b1gvdTZ1ZVhaSGJx?=
 =?utf-8?B?RnV3MVpYZ0tpazdQYmtFOUhzU0RCU2Z5TnZhMXZEOGJ6MlFHVmZOKzJlaTZz?=
 =?utf-8?B?V2hueU5MTzBheEpTeWh5dDQ1RHA1VENZR1ZXdnUxNWdTUWhvaFlQejFlaUly?=
 =?utf-8?B?MDF2OWw4bk4rTTFBSThkcCtnQjJ5bUxxVG9HcVFLcnZEbE1GaVVYdXZZTzh3?=
 =?utf-8?B?RmVWdHY2VTJib2ZwTU1IV0c3NjRLaGNiWjhOV2sybGNSeEpvWmZaczg2eU9t?=
 =?utf-8?B?aG9TdkNDMkpsa2UzUGVqMWpKWWNNeU14d2FIWG9EOVp3MllxUWtqOXFqWWdF?=
 =?utf-8?B?RXY3R0xSRWQwcnFYRFlnSFdtL1ltbzFKM05hMGhYa1JlS0dmQWJJRHhkbmxT?=
 =?utf-8?B?NHExNVBXUWIzUklINGtRcXJtZVVUUTlONXlJem1uR0Rnb3lzMHRNU1NQR1Er?=
 =?utf-8?B?UGNZVUFzdEdTY01ZcTFGR3JETjU0YjNjOUc2d2tFeUVTanpGNXFDd3U4QUVF?=
 =?utf-8?B?eFJoRWlWUDVTL1dTL040UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHVobXBBTmp1RDZQRHNwNFdkNkVNbjJCSlM5UTRJalRhOUJUQUIzMXVXb1M1?=
 =?utf-8?B?M01UZVRZZjd2ZFd5bUx1RlVOWHZXL3VveXZGRVI4dUdDb2xXNXNETEFRQ1No?=
 =?utf-8?B?U0liQ3d3YWJDTFF6aWdMQnFKSGNnZm9ZWE8vSmtjWTlHaW8rcU5MNmdqalFy?=
 =?utf-8?B?d0FGMk0xaW9LNG9uTGdlbjQ0ZXVORWlQZnk2NERvWWtQbFNWY0Eva2NjZVN0?=
 =?utf-8?B?RTROdExQYld6R2tzd2kwNElmc1NwUElyQ250alFPeUVWZVNnZCtuTUc1Nmhr?=
 =?utf-8?B?Q3l6QkFoc3Z5WTZBeXNtV0lrcWlvMWJOQ0QrT2JpQ0dxbFM3aWZaWGxCY0JL?=
 =?utf-8?B?Z0dzaGVNTVZJdFNjVWdaTVVlRG9vaXhuNUJ2dXlCajkvU3pPbTdVNU5ycTRa?=
 =?utf-8?B?VFNsdTB4b1RQVXF1RWJUdUp4TXRwUUFMMmdPQlgxb1hzME9JMlRaY3hkUzFq?=
 =?utf-8?B?TU1KVGkyY2tKVjdYSmxhK3lNUGR3YWZFL0x4UXpnaFNBUTRkd0NsaDNaSU1K?=
 =?utf-8?B?aE9nbFplQlZRc2FkN29aUnEwdEFCZys4SXYvNk81L0sxbExEeWlWWFBXdUZv?=
 =?utf-8?B?RlZqcHpWNGhzamdYbFZnTFFrbjBQMENjNHN5ZHIyWjFPcmU5TzBIbFNTOTly?=
 =?utf-8?B?d1JJUE9XeVluNmpLVmdMbUU2WnhpUktsOGtmOFk3U0dLdWhXRHhscGpSN25H?=
 =?utf-8?B?Sjk5SzkzTjh4N3Yxbkxlem8yK0puNG9IZ05ndUlqdlJkWUwzOWtEODBvcXda?=
 =?utf-8?B?bHpSZVY5YS8rRFJrenJSSWVybGdOL05Id1AyS2NtdFpDODYzUHJwdll1Zi9E?=
 =?utf-8?B?MmZTR0NvbGJVWGR6OWQyQm1MN0tlbWVoMHh6aGVGekJ5VUJrTThvUml4UEJs?=
 =?utf-8?B?N2RFcExENy9iajNUYXlVeHJsM010elNDUVJHeFpRL1lYUS9STmJiVXR6UVdi?=
 =?utf-8?B?ZkZ1bENMU1A1SUZ2UXA1QWE2ZmtSdGtoenVsWHJWOGtyQTEwSzRKS1dOWEd1?=
 =?utf-8?B?MWJWeWFZMjFFN0lld01ORW5VMDY1WGpXSWh1eFlBWXhvRUp5eFp0TkVHdDk5?=
 =?utf-8?B?MWYzNVk1UTk5NGRWM244dEoyRG1GUHZGczl2NUxiVDh3NmU1eEFGWGdKVlQ1?=
 =?utf-8?B?MGNCQVRrZjVBazNHajNyRUlzb0daby84c0RNSS94OGU2REg2NFZsaTlBayt5?=
 =?utf-8?B?TisvWnM5eGliT0x2YW5IVStKczRQcW95TVMvMGlXd2tIU1V3Q01TZDd2NEdG?=
 =?utf-8?B?QUE2L1paZ0tmSHlmNlp5MmVXMjBDS29FRDQzY3VCK3lPN2J3bUNqK1h2YUJ5?=
 =?utf-8?B?aFpYZ2JPSzlxd3F2MExZS1EzUDBUcFkrUUhEOXVrMFJlYzZMK01OTGlBM1V2?=
 =?utf-8?B?MWE0aEd4ZTg0d0h5RlMxdkNzQ2FjUG1rM0RIYWU3NkhBMWtjbnhGNzUvQitV?=
 =?utf-8?B?UFJqMUwwVDZMNHBjSHAyUE9zWkxiY2lRcFBnU2Q5L0pyMXo0bUZiMC85VUl5?=
 =?utf-8?B?N0RGS204MDJ5eDdwL05taFhYMXl5MXY1ZU41ZmJJeGFKSVZGRTk1dVFVanJV?=
 =?utf-8?B?elZHU0FvamFybk9ESW5BWVYvaEpGM1FxNXgvd1cyc0w0RzVFZ1M3WVVYaFpr?=
 =?utf-8?B?bDdqVkswSEtobE95VWtWQ0R2N1lKN1pKY3NLMWNnU1lhcUhEd0N4cTFzWFRw?=
 =?utf-8?B?ZlRjSlZXY0k3a0JHRVpMSGdiVm9Hd2s4d2x3MGk2eE9hZ1RTcGhtR3VEQ2xv?=
 =?utf-8?B?SmFRb2VTRHM5K2U0VUtTS1pPdjU2RFE2SEM3TEFiQnFiSXUvaTVPOXI5bjlV?=
 =?utf-8?B?WGJHalpvZTJXK2xDa0JzeDdVcElwMERWMHJDRW5DNVJMbXc2RjczZDBJWDBx?=
 =?utf-8?B?eWpqZ1RlZ3VCL0VpY2Q5cXRyMi85SFluQkE3Ymh0ZnJLZWtXVTBkY1Z3ZW95?=
 =?utf-8?B?dUtPTVFrcFlDeVlCMUlyb09YWWFtdk1mZ3NOVHRMZDJVbE5ZazVpeDZXSTF4?=
 =?utf-8?B?YXVPL2UrWGd1NmVVUk52TnJSNnAzd3JOaTlTdE5IN2NncnJWUDQzRHFBMkRG?=
 =?utf-8?B?eFYyZGdKSVlidmEzcEhQbUVENmpYYkhKQVBaOG4rdklFWitpU01IZU5UR0M0?=
 =?utf-8?Q?J3V4fnAJddiuGN0tK8EOmxaAu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CE09BFF2BC3194885FA28A5EDB5264F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebadf52-8cf5-4666-c975-08dce694e152
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 05:57:08.9553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7cSCRIgSaWe1dNNcqaDVefwv85hiI5oqNYuC0fu2Kyo2twUrgB3iaKP28J6y+yOLvt1baNdl5hwFpcXRr1+qHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_225721_604976_DEA2F1A7 
X-CRM114-Status: GOOD (  25.37  )
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

SGksIEphc29uOg0KDQpPbiBTYXQsIDIwMjQtMTAtMDUgYXQgMTc6NTIgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gSWYgdGhlIGNvbnN0YW50IGFscGhhIGFsd2F5cyBzZXQsIHRoZSBTb0Nz
IHRoYXQgaXMgbm90IHN1cHBvcnRlZCB0aGUNCj4gaWdub3JlIGFscGhhIGJpdCB3aWxsIHN0aWxs
IHVzZSBjb25zdGFudCBhbHBoYS4gVGhhdCB3aWxsIGJyZWFrIHRoZQ0KPiBvcmlnaW5hbCBjb25z
dGFudCBhbHBoYSBzZXR0aW5nIG9mIFhSR0IgZm9yYW10IGZvciBibGVuZF9tb2Rlcw0KPiB1bnN1
cHBvcnRlZCBTb0NzLCBzdWNoIGFzIE1UODE3My4NCj4gDQo+IE1ha2UgdGhlIGNvbnN0YXRudCBh
bHBoYSBvbmx5IHNldCB3aGVuIHNldHRpbmcgaGFzX2FscGhhIG9yIHN1cHBvcnRlZA0KPiBibGVu
ZF9tb2RlcyBTb0MgdG8gZml4IHRoZSBkb3duZ3JhZGUgaXNzdWUuDQoNCkkgd291bGQgbGlrZSB0
aGlzIHBhdGNoIHRvIGJlIGNoZXJyeS1waWNrZWQgdG8ga2VybmVsIDYuMTEgZWFzaWx5LCBzbyBs
ZXQgdGhpcyBwYXRjaCBiYXNlIG9uIDYuMTItcmMxLg0KDQo+IA0KPiBGaXhlczogYmM0NmViNWQ1
ZDc3ICgiZHJtL21lZGlhdGVrOiBTdXBwb3J0IERSTSBwbGFuZSBhbHBoYSBpbiBPVkwiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgMjggKysr
KysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYw0KPiBpbmRleCA3MDNjZDNmNmM2ZDMuLmRlM2FkZGQ4OTQ0MiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBAQCAtNDk0LDE5ICs0OTQsMjUg
QEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGludCBpZHgsDQo+ICANCj4gIAljb24gPSBtdGtfb3ZsX2ZtdF9jb252ZXJ0KG92bCwgc3RhdGUp
Ow0KPiAgCWlmIChzdGF0ZS0+YmFzZS5mYikgew0KPiAtCQljb24gfD0gT1ZMX0NPTl9BRU47DQo+
IC0JCWNvbiB8PSBzdGF0ZS0+YmFzZS5hbHBoYSAmIE9WTF9DT05fQUxQSEE7DQo+ICsJCS8qDQo+
ICsJCSAqIEZvciBibGVuZF9tb2RlcyBzdXBwb3J0ZWQgU29DcywgYWx3YXlzIHNldCBjb25zdGFu
dCBhbHBoYS4NCj4gKwkJICogRm9yIGJsZW5kX21vZGVzIHVuc3VwcG9ydGVkIFNvQ3MsIHNldCBj
b25zdGFudCBhbHBoYSB3aGVuIGhhc19hbHBoYSBpcyBzZXQuDQo+ICsJCSAqLw0KPiArCQlpZiAo
b3ZsLT5kYXRhLT5ibGVuZF9tb2RlcyB8fCBzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxw
aGEpIHsNCj4gKwkJCWNvbiB8PSBPVkxfQ09OX0FFTjsNCj4gKwkJCWNvbiB8PSBzdGF0ZS0+YmFz
ZS5hbHBoYSAmIE9WTF9DT05fQUxQSEE7DQoNCk1UODE3MyBkb2VzIG5vdCBzdXBwb3J0IGlnbm9y
ZSBwaXhlbCBhbHBoYSwgc28gT1ZMX0NPTl9BRU4gd291bGQgYmUgZGlzYWJsZWQgZm9yIFhSR0Iu
DQpBbmQgdGhpcyBpcyBub3QgcmVsYXRlZCB0byBwbGFuZSBhbHBoYSwgc28gcGxhbmUgYWxwaGEg
c2V0dGluZyBzaG91bGQgYmUgbW92ZWQgb3V0IG9mIGhlcmUuDQoNCj4gKwkJfQ0KPiArDQo+ICsJ
CS8qDQo+ICsJCSAqIEFsdGhvdWdoIHRoZSBhbHBoYSBjaGFubmVsIGNhbiBiZSBpZ25vcmVkLCBD
T05TVF9CTEQgbXVzdCBiZSBlbmFibGVkDQo+ICsJCSAqIGZvciBYUkdCIGZvcm1hdCwgb3RoZXJ3
aXNlIE9WTCB3aWxsIHN0aWxsIHJlYWQgdGhlIHZhbHVlIGZyb20gbWVtb3J5Lg0KPiArCQkgKiBG
b3IgUkdCODg4IHJlbGF0ZWQgZm9ybWF0cywgd2hldGhlciBDT05TVF9CTEQgaXMgZW5hYmxlZCBv
ciBub3Qgd29uJ3QNCj4gKwkJICogYWZmZWN0IHRoZSByZXN1bHQuIFRoZXJlZm9yZSB3ZSB1c2Ug
IWhhc19hbHBoYSBhcyB0aGUgY29uZGl0aW9uLg0KPiArCQkgKi8NCj4gKwkJaWYgKGJsZW5kX21v
ZGUgPT0gRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSB8fCAhc3RhdGUtPmJhc2UuZmItPmZvcm1h
dC0+aGFzX2FscGhhKQ0KPiArCQkJaWdub3JlX3BpeGVsX2FscGhhID0gT1ZMX0NPTlNUX0JMRU5E
Ow0KDQpUaGlzIG1vZGlmaWNhdGlvbiBpcyBub3QgcmVsYXRlZCB0byB0aGUgYnVnIGZpeCwgc28g
c2VwYXJhdGUgdG8gYW5vdGhlciBwYXRjaC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gIAl9DQo+ICAN
Cj4gLQkvKiBDT05TVF9CTEQgbXVzdCBiZSBlbmFibGVkIGZvciBYUkdCIGZvcm1hdHMgYWx0aG91
Z2ggdGhlIGFscGhhIGNoYW5uZWwNCj4gLQkgKiBjYW4gYmUgaWdub3JlZCwgb3IgT1ZMIHdpbGwg
c3RpbGwgcmVhZCB0aGUgdmFsdWUgZnJvbSBtZW1vcnkuDQo+IC0JICogRm9yIFJHQjg4OCByZWxh
dGVkIGZvcm1hdHMsIHdoZXRoZXIgQ09OU1RfQkxEIGlzIGVuYWJsZWQgb3Igbm90IHdvbid0DQo+
IC0JICogYWZmZWN0IHRoZSByZXN1bHQuIFRoZXJlZm9yZSB3ZSB1c2UgIWhhc19hbHBoYSBhcyB0
aGUgY29uZGl0aW9uLg0KPiAtCSAqLw0KPiAtCWlmICgoc3RhdGUtPmJhc2UuZmIgJiYgIXN0YXRl
LT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkgfHwNCj4gLQkgICAgYmxlbmRfbW9kZSA9PSBE
Uk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKQ0KPiAtCQlpZ25vcmVfcGl4ZWxfYWxwaGEgPSBPVkxf
Q09OU1RfQkxFTkQ7DQo+IC0NCj4gIAlpZiAocGVuZGluZy0+cm90YXRpb24gJiBEUk1fTU9ERV9S
RUZMRUNUX1kpIHsNCj4gIAkJY29uIHw9IE9WTF9DT05fVklSVF9GTElQOw0KPiAgCQlhZGRyICs9
IChwZW5kaW5nLT5oZWlnaHQgLSAxKSAqIHBlbmRpbmctPnBpdGNoOw0K

