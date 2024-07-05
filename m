Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FD1C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNgLw9xC+FpidaICcSnmf0IInLZZhRhd6fzwZjuqJ4U=; b=1OojEqAxjFUXTpFG3OZkz6crdl
	qLdAAL9UPmn3JtDFLHoRoFOr6M7xp2eZzGfSTlY0J96pUluF9T0WVUowWFqdHgjdskT28gbNcau9C
	oJxAyuKPDXbmXiHnd7kN6AzYQbBLeWPd/tSnXz5a0aJnswAGwOvVSsxsZ4/R8RCK7mY43q4mpahbm
	uONbHLDEY9kxBjrPI7jFhZhQjEoTLR3vHyFoUrh6TNeNACwJtwDgbq1NPPETC0C8jCDPmS4kPnQeX
	GNo1+7x5Vs9bYS40byyblTwMJDYBQkqBQjQPJydytsnGKJdwf4m82MJ8RtFFBxRXVrinDsfYKlmm+
	YHuXL7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeBy-0000000FGbs-1h1I;
	Fri, 05 Jul 2024 08:21:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPeBj-0000000FGZy-3RT0;
	Fri, 05 Jul 2024 08:21:05 +0000
X-UUID: 81ee28443aa711efb2966dae1f787272-20240705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=rNgLw9xC+FpidaICcSnmf0IInLZZhRhd6fzwZjuqJ4U=;
	b=pv2DSb+3ZClt7jlW3r0roUgDzlchsnkPhacNi51tCflAHFL+ZgcXDYS5G4UCDxy2p5yRjz6rH8YZU/kX3637fNiVp0yDzessXT5Dz4h8C/y6th5HDg/F1TC+DHX6UyagRCh6hnDKo2cQZMjn2RN+2TGHnxFAVYVS27MFosl8tAk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:7d5ea33e-df91-4604-ab74-8fa7eb7f2676,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:a7571a0d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 81ee28443aa711efb2966dae1f787272-20240705
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 837538910; Fri, 05 Jul 2024 01:20:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 5 Jul 2024 16:20:21 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 Jul 2024 16:20:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqtqJMFYF959hguN9WToizU2FdV0yHQvrvCTdFuftRHd7WoN2PAMEioJtw0q2A0pxyktmTMP1+bTCKKlJJ5VFmL2D7CwqoDHdNc5rIXku5lXg4RsNQhlk/6MVHEDf5OfDYae+Lw/cv6349QvSDkpVHQwAXZwixoT6LQhEYFr/Nhbc7numPtMvPQkljBxVG1Ywov8tMqCQ4jfczvAuFoJgJQmkmbtwzWhxgYZAXrYAosBPjPbfiCwILPVdrRooTR23tXaKL8GfIHunRE8o0YXNmIiw16gWznh2I1TN3eLpO4ahLE1s77Qc1AqNmsm+Rdj6fUHWGcOVlkYafjrHSKliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNgLw9xC+FpidaICcSnmf0IInLZZhRhd6fzwZjuqJ4U=;
 b=di1uK/n7a49FnwmsSJwC410is/9PCejXgoAlNnjhXYV38y931co2ArEZeSKlquBqNkuBR/LXcu/hmuFHmowzivHI8LZsP7ARrLd8ZTr6I+UfH7avCrolh/d07+WDZpIhNyQMVP7MTn73+z/aPYaueMeG2JT6TJJ1TRqeKMr0yFpIj2xK49HY94cbnsPij9rk+VWVpEtih0jzRdPM8m7E5EvhAXKIGENYpLa2JY9ME8ZTkCFDyWmn6gPCTHjZc6Snu0PRzFO5uJjM3hwdIp4hECZg2O4n5EyxQEq2KTFMC24UXES1o0ArkydE2KFINRm9/dN15P42+qNqjrezqBPgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNgLw9xC+FpidaICcSnmf0IInLZZhRhd6fzwZjuqJ4U=;
 b=G/O/WRntty1W9ZI26bx4nkvjVNnYAYyoBHu/knqjq7k/JNQBfSn0MyL+5bbMNyojV+naSwTkl+XLpZDD+agL+Jv1lZvJsMKJMvkHEzRnmsj6oS/xm4dCA6KFEwtF3CrZoxb2Mg+8yDWKq87l2GSNc8zPgHdnKayX4k4TNGQHe7o=
Received: from SI2PR03MB5545.apcprd03.prod.outlook.com (2603:1096:4:131::9) by
 TY0PR03MB6533.apcprd03.prod.outlook.com (2603:1096:400:21f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.25; Fri, 5 Jul 2024 08:20:18 +0000
Received: from SI2PR03MB5545.apcprd03.prod.outlook.com
 ([fe80::8b7a:97d8:96f4:2e6b]) by SI2PR03MB5545.apcprd03.prod.outlook.com
 ([fe80::8b7a:97d8:96f4:2e6b%4]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 08:20:17 +0000
From: =?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>
To: "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "miklos@szeredi.hu"
	<miklos@szeredi.hu>, "amir73il@gmail.com" <amir73il@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "jack@suse.cz"
	<jack@suse.cz>, "brauner@kernel.org" <brauner@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?=
	<casper.li@mediatek.com>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, "linux-unionfs@vger.kernel.org"
	<linux-unionfs@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH 1/1] backing-file: covert to using fops->splice_write
Thread-Topic: [PATCH 1/1] backing-file: covert to using fops->splice_write
Thread-Index: AQHazrPNMVBj3/M920ORTYkpBBF/L7HnyumA
Date: Fri, 5 Jul 2024 08:20:17 +0000
Message-ID: <0a104644108c624457e4311facf0a2a3c109f718.camel@mediatek.com>
References: <20240705081642.12032-1-ed.tsai@mediatek.com>
In-Reply-To: <20240705081642.12032-1-ed.tsai@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5545:EE_|TY0PR03MB6533:EE_
x-ms-office365-filtering-correlation-id: e616ee0f-cf35-4436-f7e4-08dc9ccb4dcc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bkJCUDhPNFkyQ25NZzQrWVJHRjBhcWJaOFJaWVZVS1h2bTFmMmxFclRKdG5x?=
 =?utf-8?B?MG81YW80UHhoMUVyQlM4Uy9MWEFaajNNaXNxNThrZlBZTkhzWVkrUUYxSGdK?=
 =?utf-8?B?Zm1BTU10QXpVQnRFTDNwYm5vR0lEWHEwY25hWmR3MnV2d2RJeWx2c2xMdmJ5?=
 =?utf-8?B?bDdmbnI0bGZjRkE1SUZwZjdsZkd5Uy9xQ2I3VytRQ3RmQ3JaSXdFSC9sd2FI?=
 =?utf-8?B?MnRHMkhJMVR4d2lTNnhtT1RIK2xWOG9hRUlHWHNwSnJucHVrK251MEhmN0J3?=
 =?utf-8?B?eExrSE9EV3pkZVp0aUpsZEdTcng0RFQxNXJjM1ZvWDNnMXZiaVVueCtDV0pQ?=
 =?utf-8?B?cTVoRmRGbEltK2dhVSs3TllsVU1LSFIrcXVwaUYxdWNtV1JkSWNINHRlNUZX?=
 =?utf-8?B?T2xkUzNHRGx5cG40OEEyT2NPa2lPQlczRE1rWjd0R3FyZkU5VmlGdUZzWFhu?=
 =?utf-8?B?eUJYVHRWam9YdlAvN3kxWDFCbk1LQ3I0MHJQQXo0bW5SMDg0V2VBTW5XK3J6?=
 =?utf-8?B?WlQxN0FTdG9NWDYvYk5ORzdMWHBHd2wyUGVPdTJ3Ym1IajhSclBKVVpzbEJw?=
 =?utf-8?B?UzNVSW5obnhMek5DbkJKWk4rU205cENsNUlPbGNORzVBa0hLeDBEMUhRSTNM?=
 =?utf-8?B?SG9tcThrR0JnWGlWSG1iQnY2aUZFWEx1TDdpK2c5alVUYjdTZitoZGp6RThP?=
 =?utf-8?B?azROSmRMRStmMVFmVitaYUJTL0xYSWtjeHBBMWZLb05ZUW1vR0RwRklSd2hY?=
 =?utf-8?B?ZjhIc0dibU9IRW00SUlCMExUWUlURjlyY2xsWUQrNGNpalpvQ1BwZlNvc0JI?=
 =?utf-8?B?cWpMWDFETGFFNGY1dnF1WnAybzFBTlZFZEFvbmZ0MUJyUW9OQjZ6RDBHcVNo?=
 =?utf-8?B?Qk5kR3pxck5XbUgrTENnQWdVSklPV2xWQmM0Q2pQUzVqdkFiaTR5KzFJL1Q4?=
 =?utf-8?B?eTBGbTlVbXJYMlRBTXhFcHZ5d0JiRGZkQkJVV2ZkVmZYUlNPMEtEai85MUQw?=
 =?utf-8?B?RzlRd3J2bS9SL3NSL0FudWJPR1owWW1idjhyQitySTM1SUxLU1gyZVh0NkhW?=
 =?utf-8?B?Tk9zeWNtSUFyNVhqeCt0NW9KWkNvbG9lRVRDS1ZySnRETTZmVWNnNFpDUHZ1?=
 =?utf-8?B?bk9XOXlGZGNuUGVxWndMY25xMGl3dUV0WWF0YkYzcmVLdlBvK1VFOU43bzJv?=
 =?utf-8?B?dzVXRnNsTlMyT2dWK2VIdWhzbFFleTQxOGYvQ1pQSEFMVnVKcmZ3MENUb0Qw?=
 =?utf-8?B?NGNLWThpd2tBVDJhZUUvdDAzUUdXRHUrVFFYU2d5SUFHT3I3N1dlWmtDQ0FC?=
 =?utf-8?B?OUtEUHcrZkN2Zkd1Q0R2cjN0UERTTTBHRGI0ai9OQm5RMEt5RlBrVGlSWmFC?=
 =?utf-8?B?Q3JvZXFCQzFmdVowM1FNOGxCQVp4b21TQU5OQlNIT2lZdUVhOGo3NnVpMC9E?=
 =?utf-8?B?N25KT1VDZVN0YVFiUmVGQnlialNnZld6K2hMK211WU83VmJkT2F5VXN4N0NN?=
 =?utf-8?B?VmF6aldoT2FQOVcxQ2RKSnI5R1FOdURnanFwZ0pOY2Fid3ptY2taa0tMTWZs?=
 =?utf-8?B?R21GU0xVM1M1Qkc2R3RJY05uaDN5NHBTa2FOMjhCL093bjVrbUZIQXhSN24y?=
 =?utf-8?B?dUx6T2dYSlk1eFNxSkx5VVM5VElLd01pZEpwcFhZK3JMUThuKzFEV0pzRDcx?=
 =?utf-8?B?T0FYN29UQ0phZ1pMeFRmaUpWd3pvRTlKcTZGQjdHeTNUWk8veENLZ0pETGty?=
 =?utf-8?B?REhLMHRUeW9PL1ZFVzc0clVZb2ZUeVdwT0hucDR2TVJ5L1lyR0FITFJWcG5x?=
 =?utf-8?B?MWpzV2FENjFYdUZJRjFVZHM5STJuT2ZTaXN5L3JaWFZWRy9WdUVIOGtLQys1?=
 =?utf-8?B?NlBXRnQ3TDg2YkdOTUxKbkpsT3RLTG9QOGxpbzJ4Q2RqdEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5545.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0RlcU9qK2RlQmJuVm9uTzFLejVMRzY2NWEwODNjZmtDODRoYXozNkYxZjNQ?=
 =?utf-8?B?akc3UExJNG40MDJ4M3YyV2srdUpWOVV1TTVWRS9IZktMVnZQSmE1SzJlME5F?=
 =?utf-8?B?djBaUm9HYlQvL0Z4MGxNTmVPcmlCdWFJblRLK2VsZ2FqUmVSOHd2ckJMSTVx?=
 =?utf-8?B?YzZjQkdJMTBiRDF5UDZQTjkwTEoycXJkUG9tWFloM0NXa0FDODh0U3FXQ1pL?=
 =?utf-8?B?blBySTF0eEs5dSthaG1qOFNiVExCOFZHeFlkL3ljc1gxRUpMeWNDZmZxMGVD?=
 =?utf-8?B?QXpGSnhJdzI1ZkFiTU5RWGJ1WWF2ZWJPRWlyWkwxWGprWVNSMklMN2t1QkZN?=
 =?utf-8?B?YVEwL2Z4RVNoZElyL0g0dnNHanlzZmlaUmNwMHdoZlFheWJNZ0FBWGZ1dTBq?=
 =?utf-8?B?Z1FNQ3VBbTZ4aitFSXNCeWFTM1JzL0lnQjJ5NjFLaVp5MmZzWW1CSlFlVS9K?=
 =?utf-8?B?ajdtSVdqYk9WMUlLYitFd25wZ28xZ3QyeGFHUGcyRVR0bEdIL2hTSVZzMDBw?=
 =?utf-8?B?eDRnVkVGbTllQzMvNDdPdTNDb2c3S0lKbTZ3eHo4aUJxazA3dlRVa0d1WCtx?=
 =?utf-8?B?aFZRQU9LRk9udnpIdGgwV251UHZ6Si9aaDZweXE1QjMzOC9NOHBzNDBrZVA2?=
 =?utf-8?B?QXhGbkZjODMzbkVQZE94V2RtL3NrTlduZW41a2pSYllwMW80czRuM3Avdmlp?=
 =?utf-8?B?ZWJERnRjWkx2Z3Qvang0RHdwVWozVUM3UFpYMHMvc2ViOGx2WTV4ZkpWZVNT?=
 =?utf-8?B?Zy9PWUdrQkFETzkzMVMzeEI2V1gwNmloWXJhU2FHRGdYaUJUWDFiMWJRUTN3?=
 =?utf-8?B?ZDN3TXRNREZkeWZXQ2JhK0NBQkJjZmxMV1Y3TEN2WjdvYTNYQ0RLS2VOYUxD?=
 =?utf-8?B?QXlCN2dhdWNVM0kzN1o1azRlcHV5L3RuRm55T0NiNFQzT25HSnZZQ3E5ejVT?=
 =?utf-8?B?QlBWMFJyYXVOVXgzQk94RzgxQUM0ZkpGUzVBQjdtVjhZUEl5TnFEUDVWa0w2?=
 =?utf-8?B?a3ZOTXpmam96WC9DSlliV3luakI3eDdaVk5yc2tWYVRkUzhxZ0ZKMyt5dHVQ?=
 =?utf-8?B?bmFnQWJXSTkxS1F0cVZNc0xlZG80YnJmMk9iN1R0S1Nod0xuVm1XSWlRenJo?=
 =?utf-8?B?bFF1eCtWcURDUEJmTmtqVEZBKzhjQ2FKdkdmdFU1bkc2c2JsSldYeTJUbXl3?=
 =?utf-8?B?VDJMdnlSNWRETGVxU0l6cXVUdmtTV28yajRzbXZJNGJFTlc5RFh6Nk1KYmVC?=
 =?utf-8?B?Qm5iZUJwdnhBSG4xeENZcS9PcTVOaUxySFBIZEN1aU90T1hkNzF0R2o1d05l?=
 =?utf-8?B?NkpsTlA3TGc2Q2VKVzhQZUpMcXl3TTRSWm9yeEUzYWJhNFVLR1lUc0IwM1FC?=
 =?utf-8?B?Zm8rRm8wWlRKd29JcVNxOFpXMFE4eEZFdEd1OFR1dXltZWJnTWc4REsxc3BW?=
 =?utf-8?B?dER0ZEY4ajVxdkhNcVFiOVVrWEtRVTJOM20yQ0x6dUFsQkF1SHI0UzUrZTVq?=
 =?utf-8?B?ZnhQb3RWbEJjOW5mS2lKTW9nUHUzazErYU5CRlA5RUJWMFoxTTN0Vy9lTkd4?=
 =?utf-8?B?NHZZM0F6U0NpcFRPaWQxTWRxa0xMVXJwSlJrM01nK1hUZjMvRzJMNmtQVWtS?=
 =?utf-8?B?dmdCVlY0Y0pKN2cyenBLV3dkeTEyRndUOGIwdDlmdExscnVhdm4yMmtTZ01y?=
 =?utf-8?B?cTNScGg0V1hnaHRFZStCdXA0MXV3MnU4RnZUb3QzcFl0QmJnT1FBcktieCs3?=
 =?utf-8?B?eDBwcitwWTlhU2RBVThUWGJ5SnZpcXBoeG1neHVDT3FQVkx1RmZMd09VaU5F?=
 =?utf-8?B?aGFCMGlGVUZLWE5BVTFJelI4S3hNQUZKQU1yUGFVV2NHNnpEYzRuSkx1a2Ev?=
 =?utf-8?B?K1dNWk1OK055NXR0M1Nad2xuaTcrT05xN3BLSEdkVUg1dXVHZG50dFZGZlFw?=
 =?utf-8?B?NW9sbUVMTm9Ia2lLcnlKUHB4ZnRlZ3d6WEFlV1F6YmZyUE9YMUxSQUFObG4y?=
 =?utf-8?B?R25VTytVdi9ZamhmMmhaRUNUUk00SDFRbWdUQmxITHZ2WTlRUFBrY0Z5MFJR?=
 =?utf-8?B?aGlOcnlaMnNGdElybmM3S3BPMTZ6ZkxqZkVzMFFseGJmeHhDSkh1ak8wN04w?=
 =?utf-8?B?aTNEalFVcTBXblB6amQ4UC9iTHdtZ3Y4N3NEbVV4bkJUK2o5TUFsWDVPczRQ?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C10F2AC049B5664EA520DFCDCB5E900B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5545.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e616ee0f-cf35-4436-f7e4-08dc9ccb4dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 08:20:17.6773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zmiBGR5RltJBlroiebDBfIxRgM1go49uBtyCVlkuXObTo24+x++WV3Ae6UWT/etMYx4vhd88mR/E7sLckqW7qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_012103_874881_187C437F 
X-CRM114-Status: GOOD (  15.20  )
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

T24gRnJpLCAyMDI0LTA3LTA1IGF0IDE2OjE2ICswODAwLCBlZC50c2FpQG1lZGlhdGVrLmNvbSB3
cm90ZToNCj4gRnJvbTogRWQgVHNhaSA8ZWQudHNhaUBtZWRpYXRlay5jb20+DQo+IA0KPiBGaWxl
c3lzdGVtcyBtYXkgZGVmaW5lIHRoZWlyIG93biBzcGxpY2Ugd3JpdGUuIFRoZXJlZm9yZSwgdXNl
IGZpbGUNCj4gZm9wcyBpbnN0ZWFkIG9mIGludm9raW5nIGl0ZXJfZmlsZV9zcGxpY2Vfd3JpdGUo
KSBkaXJlY3RseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEVkIFRzYWkgPGVkLnRzYWlAbWVkaWF0
ZWsuY29tPg0KPiAtLS0NCj4gIGZzL2JhY2tpbmctZmlsZS5jIHwgNSArKysrLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2ZzL2JhY2tpbmctZmlsZS5jIGIvZnMvYmFja2luZy1maWxlLmMNCj4gaW5kZXggNzQwMTg1
MTk4ZGIzLi42ODdhN2ZhZTdkMjUgMTAwNjQ0DQo+IC0tLSBhL2ZzL2JhY2tpbmctZmlsZS5jDQo+
ICsrKyBiL2ZzL2JhY2tpbmctZmlsZS5jDQo+IEBAIC0yODAsMTMgKzI4MCwxNiBAQCBzc2l6ZV90
IGJhY2tpbmdfZmlsZV9zcGxpY2Vfd3JpdGUoc3RydWN0DQo+IHBpcGVfaW5vZGVfaW5mbyAqcGlw
ZSwNCj4gIAlpZiAoV0FSTl9PTl9PTkNFKCEob3V0LT5mX21vZGUgJiBGTU9ERV9CQUNLSU5HKSkp
DQo+ICAJCXJldHVybiAtRUlPOw0KPiAgDQo+ICsJaWYgKG91dC0+Zl9vcC0+c3BsaWNlX3dyaXRl
KQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiAgCXJldCA9IGZpbGVfcmVtb3ZlX3ByaXZz
KGN0eC0+dXNlcl9maWxlKTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+
ICAJb2xkX2NyZWQgPSBvdmVycmlkZV9jcmVkcyhjdHgtPmNyZWQpOw0KPiAgCWZpbGVfc3RhcnRf
d3JpdGUob3V0KTsNCj4gLQlyZXQgPSBpdGVyX2ZpbGVfc3BsaWNlX3dyaXRlKHBpcGUsIG91dCwg
cHBvcywgbGVuLCBmbGFncyk7DQo+ICsJcmV0ID0gb3V0LT5mX29wLT5zcGxpY2Vfd3JpdGUocGlw
ZSwgb3V0LCBwcG9zLCBsZW4sIGZsYWdzKTsNCj4gIAlmaWxlX2VuZF93cml0ZShvdXQpOw0KPiAg
CXJldmVydF9jcmVkcyhvbGRfY3JlZCk7DQo+ICANCg0Kcy9jb3ZlcnQvY29udmVydC8gZm9yIHN1
YmplY3QNCg==

