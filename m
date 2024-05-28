Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEDCC25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 02:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DglL8VRIrdZ2IS683iJ/6vzuI+Gnz4v6T+lpFdOEons=; b=tR1hBOz0FIiY80uw7N6NXCkB15
	s7x6voHtwjwElQ9QvaNBUio6WLV1LmZs+tFFi8eztxuhnwrM1zDkxCGxZSfRSNBMHz263za/n7f9S
	Us64SaD+6QKMXSikyzD7Gdbzfqxr0iNmX0IOfnBpIU+SyMnwJ7GjMpNE105GMB/zO5VO9ErYyQo8O
	G/5GrsQcNobviQ+eBLopr/9YfoRUxe6uA+nMKA0oXqcM68TT5jQUTlbRwS08tul89lBVBVVm3f5XL
	dsrmylTxKWy9ttPbImI4ZYPBdZO1VeZqqd4igEFzkCSLzCLt+54ZSgOETRrEKSw5bCE5cTULJ1+We
	X0aNBbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBmbC-0000000GrP2-3LMP;
	Tue, 28 May 2024 02:30:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBmb6-0000000GrLb-32Pc;
	Tue, 28 May 2024 02:29:58 +0000
X-UUID: 25df655c1c9a11ef82c84f6416ccf2f3-20240527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=DglL8VRIrdZ2IS683iJ/6vzuI+Gnz4v6T+lpFdOEons=;
	b=JbY6Ug2eMmuiGGkyBB+aujnHi+7TW3Zq3HSoQKHzZJMThHJyH4/XTzAEoh7iZqaHKCLMrweH+4aTM84RpmiAYiAHZ3iYx6FS5xaosuQDx9zB9rTiR5Xc34c+shdYarvxp4DZdM4US8Nf7lD1E+a8YGMh4OE+Hv/rqGccPmuoxII=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:41efbdd3-0831-47e7-a91f-b09466263342,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:148fe143-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 25df655c1c9a11ef82c84f6416ccf2f3-20240527
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 444856; Mon, 27 May 2024 19:29:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 May 2024 10:19:41 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 May 2024 10:19:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVfiqdLbfcPIi1YWWxLhHWze4xkME3tHBq3nyOGFcfCc9JQMbMupOxQSMtk2Y36FjDTNRJTuVD4Jqk9clJc6EhNwWYhzxdRSzSP4V+TOfBwxik+Ni3VSkGkw+U2HbHiepEn4bz4Ueu4LVYAE6P83jm61QKJRX6ehD/JitDwk2da958s3Ia4PFZ7guIRwzN0JAhzkbZB89uNKpCs/PR+sBuO8ZExy2Ys9hcIL8konThpRpDfIBq5sGbjMuX15YsghWi7xXDiuileIDEHkFj+1NULQbFGQxPDGq97eblUNzg1VCdptOq0UwMTNmL2KAejZA2OSBNSwN9jwEEuzhgiSmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DglL8VRIrdZ2IS683iJ/6vzuI+Gnz4v6T+lpFdOEons=;
 b=DI2CKYW5gGMobuXM0vyz3cHDq6L3UTIUNWbj7PeLfgahLmKNfP67OHMO/+vwGyX1SjK8o4RGmtK2SuBNqoGtE3T4Oy8QS8XO1Gtg/8NBltB/Vy0f1x0OU2ihXH4AGSdTpGRyF+NRjcl3A4BLOEM00gHrmvaqrxwT5YnVoRuSRy3J6OMx7VMq3wY8TX65snVOVdjGb5iyU7nRKt3bb3hMk/wEoJcUbh8xnXZ4To/xMsf1ipZOPb5Dyij/a7w945yhfnLmpI/mA7HspaJ4j377lVYR9rC4pcxe4eWebe/zIjamULpQJ2sNtcjWNxnBaJwgrK86D7niDsFx8Q7PjGj5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DglL8VRIrdZ2IS683iJ/6vzuI+Gnz4v6T+lpFdOEons=;
 b=afVhuYhN5Y2C4km4UbNRGlWPEsOVjh3o6kaZhHhNMdnBvKxk8sGQmdQxSg4PPTUkIK1KMjoguyLEMeq2f8o0vXU77JQPBhyiPpK5qQxKLScz8xDnNGOPOkUCjmy4qtC7Y2qKXZ1wnDkH1D9L1AS5lWfWvRo7l3GTE0QSR34cvbI=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by SG2PR03MB7278.apcprd03.prod.outlook.com (2603:1096:4:1d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.15; Tue, 28 May
 2024 02:19:39 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.7633.001; Tue, 28 May 2024
 02:19:39 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND, v6 6/8] mailbox: mediatek: Add CMDQ secure mailbox
 driver
Thread-Topic: [PATCH RESEND, v6 6/8] mailbox: mediatek: Add CMDQ secure
 mailbox driver
Thread-Index: AQHar3t3cpLUl9xLck+PMVeju4DUbbGr7AMA
Date: Tue, 28 May 2024 02:19:38 +0000
Message-ID: <5ce30bf52a4f2e4f6f76d0a4c25a08a45f14b6fe.camel@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
	 <20240526144443.14345-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20240526144443.14345-7-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|SG2PR03MB7278:EE_
x-ms-office365-filtering-correlation-id: abeb432e-4bd2-4bf0-b57f-08dc7ebca05c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|7416005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?V1Btbm9iQ2ZNa3BTdFZoTU1mYmdRMmQ2NnJVTUUvTExtWEp2V3lROUlrbkVi?=
 =?utf-8?B?WHB0MmVVbVppSXdUbldrU0NhZXBYUXBPZHhIb1hpQXBQSFFvUjlTVGNibGhh?=
 =?utf-8?B?c3NJQmJYenBlUlYveVZkTk1aUkRIK0h2OC9MUzlhY1FCbmpTeExseEtHR1Iv?=
 =?utf-8?B?WWZpOHJrU2dRc1plTkxaeXVvTjNNUjNMeU1GN1U4QU5aOGlMZVdyZ1JOb1BR?=
 =?utf-8?B?bzVOMGpndlhGVWtuNTlwdWRaWDdYNEYrcUdYMU9BaEZZTmJOTUhPZktMeldW?=
 =?utf-8?B?K3FXKzRjQkVRcm9kVVE5OVVhSVBTUExoQXRaeVBJMzNaMDh1RGpYVjU2cG54?=
 =?utf-8?B?UU1wdXB1eWRXMjJKcXZETTd4dml5YzFLNGlxM2N3T0lBRVdIRWcrclNUVmxv?=
 =?utf-8?B?YjBmZnM2S2RHRExGQThnSUJvNHJ3Z2MxNkhwRDhtOTd3UVJRMm8wT1lRRHpJ?=
 =?utf-8?B?Zmg5ZHlJZ3I2QTJVVlR1cHJNaFZJaDl5bzV4aTVhM002VTF6SDdkdEJ6bU5s?=
 =?utf-8?B?K1B5Y05TNW9KTnp0VWFhZVJMK1hQb0ZyQ3RvcFY2UjJadlozZmNiejZaY3VV?=
 =?utf-8?B?cEhSenN4RGRCUi94TEZWd2xKY2VTYjlMNi8yS3BNdHpNS1lmWXJwUnlIOWtw?=
 =?utf-8?B?NzVnZDBXdXp1R1E5U3BjNFUrNXdZOEFYb1ZWU2w1aXRrR3l0RlBsRC80ckg3?=
 =?utf-8?B?cE41UlgzcE9RVEYrbkFJU2dxRm0xajM1aDJ2VFRVcnBXUSs4UzBRYTRtTFcv?=
 =?utf-8?B?RmloYlhqREsvWVM4QlJ1V3M5QzJhZHZNVVpQS3dUS0E0Q3Vha1ljdnd0WHdE?=
 =?utf-8?B?YlpJS25HVEhudXZiV0RvakdJbVJQTjA1R1JDcllHT3M3VjEwaHNRTHVvb3hZ?=
 =?utf-8?B?T2pjbzgzQWEzUHJHWjNsbEdraFZXY2dqNDJwRVh1K0M4ZG1RcjIrWlJ4eFA0?=
 =?utf-8?B?SFRoampubnJUMkNDTERieGVFYVIvTk9uSmlBZnRQSytHMm44ZmxSc1ZoTzFk?=
 =?utf-8?B?RXArY0llNW5xK3M3MTQxRHB4bUdsWi83czdSMGdnaVdvUExONDNmUDBGN1FB?=
 =?utf-8?B?VjNDdWhZTnR5WG9kSk1BTEdxOEY0SlRKWHJuUnErMU1nQmNPbU4yU1g2OTBT?=
 =?utf-8?B?WGN6QklNSHYrMkZvc0tiZno2aCt0N2IvbWhtNWxpMURncUsva25PZnVzM1Bt?=
 =?utf-8?B?L001a2ZGT2Zwci8xVEFubW45VGpJK1BKeGlQTGhKS2JjSm03R29QMEpqTys0?=
 =?utf-8?B?Vm1MNGF6RUpkb0JPaGpYQzJMcWYyZ3VGVGw3Ung1ck1UbTJnamVZTnNHN1dJ?=
 =?utf-8?B?NmxNMStiNzl3Tk1OZ3lacDZUbmJwL290ZmRwTGgrdXh5WEVmSnllVnQrSmUw?=
 =?utf-8?B?WmhFK3ZQb2ZnR1BoRk81ZjRIeTY3enl6YWR2SExIR3RlSlhsM1Z5QUhaMkVB?=
 =?utf-8?B?UmRtZ1RlMXUzaWJabFR5c0E0QnMwWEtscU93WmNjc1ZxTmlSczdvekFwQm1C?=
 =?utf-8?B?NVFxdDFUdzArWVFQdmg4MUZ3Q014Ty84Y1BoL2dpd29FK2t1V05lOW11enB6?=
 =?utf-8?B?ZXFCd2pvWVFpa3BBNzJCS2ZuNlZ1Uk1aaUNHR0FoVXVHVTdvWG1JVFdTUHE3?=
 =?utf-8?B?QTNLOW9BMUtzUWduSjFVLzZhLzI2YmxqcU8xRm5kcWpiRWdDdjdVL09Ecmw5?=
 =?utf-8?B?bVpaekU2eTVJUmF1WTZveFVLMVBmenB3Q1Vucm1zbUlLYXlJVjJOcUtHbis2?=
 =?utf-8?B?Rk93UkgrOEU2L2YybmF2WHVITFpPYUk2NVlBcGticVo4Tld0MU1JMGpFak4w?=
 =?utf-8?B?cm1EQm1lYXRKTkR4OTBudz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alJSOEg3UktablNCazI0R1dNR3VDbTBhWTcwditpVkVkaDE1YjNpZzRaOEpI?=
 =?utf-8?B?Wkc4YkRSa0NlVnhjYWxvZjB3eVFhTEkyNWRaQVErTnVaanQrR2I2LzgvbkpV?=
 =?utf-8?B?eW1NOG5nNGtVejgzT090YU5oQklhOFhsQm9ub1lsRnc2aXNLcWpsdXdKSlZR?=
 =?utf-8?B?bFZySW1FeEtLTmc0RmdUREs1bTFuVldsR24yK0xwKzV5RDJBNUZOUmVLa0tK?=
 =?utf-8?B?UVFwT2dqRkpXcysrR0xzTHlkOGNaYXdTRC9pdlJSWEp0bzVKWHZycG9VcGY1?=
 =?utf-8?B?bTZoVDYwaDFkZVJyZ08vQ2NROFJXeFVOaE1ITTZLR0JySC9QWGp6Z21VR1d0?=
 =?utf-8?B?dmF5bGF6a0FVa2g1TXRwcDBFUUZkcEpQNWIwNmpsYWJxYnJGUWtZNE5BOFVp?=
 =?utf-8?B?RnhteWhucWtRZ3VibkZxakVURUhPbU1ha2pKZkVPWmxUaUlJaXJIV2d5QVJO?=
 =?utf-8?B?a2k1MCt4V1NRU1dVYnMyS05xVDZTY0pOWmFmVWJtc1YxNFh3NjZycy9iZCtY?=
 =?utf-8?B?ZXpRZ05WWmRKMm1NK3NCUlJTbzhkUDNzK0xNR2Z3WmZzMnQ3YTlvZ0VPNUZ2?=
 =?utf-8?B?Wmo0My9CZWN5dk5WZEV2cFhsbHlVSGRMMDQ2Q1NkYkpQcTJpVlhxbk5TeElE?=
 =?utf-8?B?NEk1MThteE1YMG5TUFd2V1BERWJkTWQ3NDZyWVBGZlpROGxPazVIRXVKQnl0?=
 =?utf-8?B?bjFJVXBtSEdSYkl2NitVNWtHZFh2cHBKVHYrQ1I5YXQyTnFNUDMwWUR0MG5D?=
 =?utf-8?B?YUFmZkw3d0VIellvMnVLM2xrNG1aRmRoRHlZa3lNeVBsbjdWVDl6SGttRDVm?=
 =?utf-8?B?MERON2NqdDhUM25mMjdNTFVXRUh6M1JEYy9ISEw0VUV4cXlFbEY3aUswbFgy?=
 =?utf-8?B?UFBCZmcyUWIzRjhsN3JnZC8rVklEd2MrR2VjU3VURnFveUkvV1lMTWFtUFpQ?=
 =?utf-8?B?VXU2STNTbEh4TU1RRThKcmVCN2NHVmdhRUVQN0NFQzI5NkQwNlBLS0ZqTENR?=
 =?utf-8?B?WVlvNnIvZHJDd2J0N2JNUWhJZFlOZkxwZGd5dEpRdVdaZGduaU5GWHZCbHUx?=
 =?utf-8?B?bWNwVldqTEVsRW45SnNqbGQ5RkNWK29SU2pHVUtPc2cvTHB3QzE5bXNWK2Vi?=
 =?utf-8?B?QS9nWkdocmFneXFmTTdyL2wyblVUSkJnc0hnOWUvSXJUcjJRWHhlYStBUTFQ?=
 =?utf-8?B?cE14b05WUFlqZWh4cXJET1RVM3JMM0kwUFFtTmwyZzlhRklQSm9wdEREQlVn?=
 =?utf-8?B?eDVUOGxxRUkvL1A2NVFxRlhKTDlmd3piSWcxOExZTFBINXA5MGhRTy92ZXpt?=
 =?utf-8?B?d3VuN3loQ1RKOVU1YUJPdG9tdHdCL0RkT1FMMDQzQXdjYlpqUGJVays1K3pI?=
 =?utf-8?B?dnBoRkVFK1RxWTdIcDd5Z05aWTNvYzJHNW1KQnE3QnRuUzlLMU9SYW5DWVll?=
 =?utf-8?B?aUx1NE13dXlOVjh2VGlGZVpTbEVnUjFaQUdHL2J2SG5QcDA0cG4zSDZwQjA1?=
 =?utf-8?B?eC9nMzFpc3BxeWtXWG4rWEQ5eTd4Nm9iOWp2dDJVMldnL2dpUUljdXM2amtX?=
 =?utf-8?B?RDczR2tMbXhWU0tZSUlLbkhxOVlMMWZmKzhtbngvbUZDbTR3T3JRd243eDVR?=
 =?utf-8?B?NmtMUERrNzRaRWFQWXd5cVVNaG94Tzg3N2w5SkFTRWZtWGtwajhlZktEZlR3?=
 =?utf-8?B?UVJWMnAvUWNJN1ZHTE52MXhtUEhhQTlna0pRMVZGMDNGTUI4bGlUU0tDbnBZ?=
 =?utf-8?B?ME5aZFprTXlBSW5QeWIxOTR6Ly9admlTaFJIb2tueW9lbE5nK0ppV29LVFUx?=
 =?utf-8?B?YnZSalRyUDBITElJRzdURmc3VjZEVFZsL3cydmFOL2VzN29NQlhneW51eWNF?=
 =?utf-8?B?Z1g3a3VXS1doQnhqZ293cTRKQzBZdHJQMjg3Mmd0eE1rbFV6THZjd2ZYQ0ll?=
 =?utf-8?B?MitQVGlyeDF6cW1jMi9adlR1Z1NZOXpSQ2k0NGdjeW1wTzFrNnJiN09mZ0No?=
 =?utf-8?B?aC9qQ2VwZUl1YlNPMDRoUHBja3M1dFE5aUNwZ1NpNHl5NlVydXByRlhrc0pr?=
 =?utf-8?B?T0tVdGliVkUvV2lzUS82bEhqNVhzRWhMZktITlY2WlFqWFMvaXZhSmVvbE9R?=
 =?utf-8?Q?84OnVKA9hpigi8M09wz/kDSpA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDAB6E461690104D93AFB6A8DC7B04CF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abeb432e-4bd2-4bf0-b57f-08dc7ebca05c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 02:19:38.8969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k4FVoSPfn7PSljpeNi62AgtV6rUR9InXU79WwRY40PlQaME7ay570D2rxtpAdG9i/LkIZOlKa6pNrkuqk+VPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB7278
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.432300-8.000000
X-TMASE-MatchedRID: QfHZjzml1E8OwH4pD14DsPHkpkyUphL9qQ9UezeTkThu4FknyqyshF1Q
	po5pNysMe29pTfBhqOY7b3Js3F6vVD1LciJB3541o65WJt1k1O+nsp2+CJj1GI3V8N0KgLoazg2
	s7KPupxckpdONqiwRktTPsL/doNnAc8f4SXLVGmnJ1E/nrJFEDy6GDroi1vrlOW8XgChxVdgJax
	JT8mQbKpDdNTDmvN2utauPEYeMK/VjAM4vu3dHIce31VQ+6yRGfiuvKi9huaZpVFDnVbOsmqPFj
	JEFr+olFUew0Fl/1pEBi3kqJOK62QtuKBGekqUpI/NGWt0UYPCK4H0C0fF0TzLJeE2o7DJURCSz
	E7fhNFvtSAFrwlXFka3nPI5YhxJf
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.432300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D2A32E8F4C49B61F6839979339933D032EA083BAE54BDE92C29F4C7901DF2DAE2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_192956_794798_1BB76D72 
X-CRM114-Status: GOOD (  15.55  )
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

T24gU3VuLCAyMDI0LTA1LTI2IGF0IDIyOjQ0ICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+
IFRvIHN1cHBvcnQgc2VjdXJlIHZpZGVvIHBhdGggZmVhdHVyZSwgR0NFIGhhdmUgdG8gcmVhZC93
cml0ZSByZWdpc3RnZXJzDQo+IGluIHRoZSBzZWN1cmUgd29ybGQuIEdDRSB3aWxsIGVuYWJsZSB0
aGUgc2VjdXJlIGFjY2VzcyBwZXJtaXNzaW9uIHRvIHRoZQ0KPiBIVyB3aG8gd2FudHMgdG8gYWNj
ZXNzIHRoZSBzZWN1cmUgY29udGVudCBidWZmZXIuDQo+IA0KPiBBZGQgQ01EUSBzZWN1cmUgbWFp
bGJveCBkcml2ZXIgdG8gbWFrZSBDTURRIGNsaWVudCB1c2VyIGlzIGFibGUgdG8NCj4gc2VuZGlu
ZyB0aGVpciBIVyBzZXR0aW5ncyB0byB0aGUgc2VjdXJlIHdvcmxkLiBTbyB0aGF0IEdDRSBjYW4g
ZXhlY3V0ZQ0KPiBhbGwgaW5zdHJ1Y3Rpb25zIHRvIGNvbmZpZ3VyZSBIVyBpbiB0aGUgc2VjdXJl
IHdvcmxkLg0KPiANCj4gVE9ETzoNCj4gMS4gU3F1YXNoIGNtZHFfc2VjX3Rhc2tfZXhlY193b3Jr
KCkgaW50byBjbWRxX3NlY19tYm94X3NlbmRfZGF0YSgpLg0KPiAyLiBDYWxsIGludG8gVEVFIHRv
IHF1ZXJ5IGNvb2tpZSBpbnN0ZWFkIG9mIHVzaW5nIHNoYXJlZCBtZW1vcnkgaW4NCj4gICAgY21k
cV9zZWNfZ2V0X2Nvb2tpZSgpLg0KPiAzLiBSZWdpc3RlciBzaGFyZWQgbWVtb3J5IGFzIGNvbW1h
bmQgYnVmZmVyIGluc3RlYWQgb2YgY29weWluZyBub3JtYWwNCj4gICAgY29tbWFuZCBidWZmZXIg
dG8gSVdDIHNoYXJlZCBtZW1vcnkuDQo+IDQuIFVzZSBTT0ZUREVQIHRvIG1ha2UgY21kcV9zZWNf
cHJvYmUgbGF0ZXIgdGhhbiBPUFRFRSBsb2FkZWQgYW5kIHRoZW4NCj4gICAgbW92ZSBjbWRxX3Nl
Y19zZXNzaW9uX2luaXQgaW50byBjbWRxX3NlY19wcm9iZSgpLg0KPiA1LiBSZW1vdmUgdGltZW91
dCBkZXRlY3Rpb24gaW4gY21kcV9zZWNfc2Vzc2lvbl9zZW5kKCkuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0N
Cg0KW3NuaXBdDQoNCj4gK3N0YXRpYyB2b2lkIGNtZHFfc2VjX2lycV9ub3RpZnlfd29yayhzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmtfaXRlbSkNCj4gK3sNCj4gKwlzdHJ1Y3QgY21kcV9zZWMgKmNt
ZHEgPSBjb250YWluZXJfb2Yod29ya19pdGVtLCBzdHJ1Y3QgY21kcV9zZWMsIGlycV9ub3RpZnlf
d29yayk7DQo+ICsJaW50IGk7DQo+ICsNCj4gKwltdXRleF9sb2NrKCZjbWRxLT5leGVjX2xvY2sp
Ow0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8PSBjbWRxLT5wZGF0YS0+c2VjdXJlX3RocmVhZF9u
cjsgaSsrKSB7DQo+ICsJCXN0cnVjdCBjbWRxX3NlY190aHJlYWQgKnNlY190aHJlYWQgPSAmY21k
cS0+c2VjX3RocmVhZFtpXTsNCj4gKwkJdTMyIGNvb2tpZSA9IGNtZHFfc2VjX2dldF9jb29raWUo
Y21kcSwgc2VjX3RocmVhZC0+aWR4KTsNCg0KSSBwcmVmZXIgdG8gZ2V0IGN1cnJlbnQgcGEgaW5z
dGVhZCBvZiBjb29raWUsIGJ1dCB0aGUgY3VycmVudCBwYSBpcyBtYXBwZWQgZnJvbSBzZWN1cmUg
cGFja2V0IHBhIHRvIG5vcm1hbCBwYWNrZXQgcGEuDQpJZiBzb21ldGhpbmcgd3JvbmcsIG5vcm1h
bCB3b3JsZCBjb3VsZCBrbm93IHdoZXJlIEdDRSBpcyBzdGFsbGVkLiBBbmQgdGhpcyBpcyBob3cg
bm9ybWFsIHRocmVhZCBpcnEgaGFuZGxlciBkb2VzLg0KV2UgY291bGQgdXNlIG9uZSBtZXRob2Qg
Zm9yIGJvdGggbm9ybWFsIHRocmVhZCBhbmQgc2VjdXJlIHRocmVhZC4gVGhpcyBpcyBlYXNpZXIg
dG8gbWFpbnRhaW4gY29kZS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKw0KPiArCQlpZiAoY29va2ll
IDwgc2VjX3RocmVhZC0+d2FpdF9jb29raWUgfHwgIXNlY190aHJlYWQtPnRhc2tfY250KQ0KPiAr
CQkJY29udGludWU7DQo+ICsNCj4gKwkJY21kcV9zZWNfaXJxX2hhbmRsZXIoc2VjX3RocmVhZCwg
Y29va2llLCAwKTsNCj4gKwl9DQo+ICsNCj4gKwltdXRleF91bmxvY2soJmNtZHEtPmV4ZWNfbG9j
ayk7DQo+ICt9DQo+ICsNCg==

