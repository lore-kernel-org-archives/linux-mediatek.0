Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D48BC38150
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 06:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+sLVslROjOqr1ajnMOyWT6DWHzCi02S4Rpvsl4ydhM=; b=z9B7J6ae4FFHqM4hRTkvZlV4a6
	KGl6XOkNy/Y/NryBp6ctPNnkP337wbaBaoZ99J7ZEzSAdii9w6OZU4e6L3NA2OOUBc6Ac+JjifPGO
	UhAlVFXx+vBcLienDwQnhP3HCox4fi8X9QEtspAC3HnTvpoP0YGvK/oAkCE/sQR7L8FA9IsMnNhx4
	NhsOOuFoyIoNsFt53vDDIF9Cgas5IlozzB8udVXF+EP3FRt8XB4+vdYC8vJboMX3u7kc46j2b1dgP
	12WUie3KzELEhfcXUFQXTJ+MvyufVlEhOzrHXhzJnBpv0jQnscGrSlFPhkjMPybU8MsG9JcP0oM0z
	rZWCYRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRQnT-00000009bh5-02jx;
	Wed, 10 Jul 2024 06:27:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRQnC-00000009be7-0YZS;
	Wed, 10 Jul 2024 06:27:07 +0000
X-UUID: 6be57cdc3e8511efa6c87f6b4542ff6b-20240709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=b+sLVslROjOqr1ajnMOyWT6DWHzCi02S4Rpvsl4ydhM=;
	b=Fenmda1EyssRyYAD9n/fRRCznAkvHUnHg6NLBU/vvbkjI4qBqQXX3JcVJGNqB4OFZGE74seR9knzWWAFVP/RskxrfeF5mhymmwPMZSb4uuJi7FSHx1PyELy87TKuOqiJKaFKcG79taKWOpbzluSAdZX24v8/Rp4PnhFyFSI9Jt8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:b392cc90-b3f0-4582-8b52-a9b209537b2b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:3efa4dd1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6be57cdc3e8511efa6c87f6b4542ff6b-20240709
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1477347242; Tue, 09 Jul 2024 23:27:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 14:27:00 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 14:27:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/MhCKtMX9xM/uEtw8xHS2MuygWqG5BaxJ70cXrPMLG2P2XmZ4AsquaaM45FvPSt+6Pvp4YeRUyLbB/Vs4SwBttXZU/th/oZx6wItxKRrEkI7WSTONwNqXM/cR/jpOz2758fnXHHNTWJQ3gpk1x6kaBJVad9r+DffkEsgJ9O5ZgThH5xvTtE3qBPgU4QQRNfU0vmx32qDN8mHi3G6PSkBmBcHZ9qBBr/kRlKGIFH10BqZKiIvPiZuLhvKnh3No/dXfFxN76IiKY4Ecbe0cpclQ1r2wZpmaF1oBuf2hL8zjQyi4SJvxJahFtyMNgSYaGpiOI+A8pqdfjHeyUeOdh8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+sLVslROjOqr1ajnMOyWT6DWHzCi02S4Rpvsl4ydhM=;
 b=CRg4MMfRjX76Js60JbL1hjufIOXq/Ay7JCxFGKFjz4UFROin/4Ds6wsHaFtF2Qe95kJcZIWhCzkJoPUQTSla/Z/tlRB9oDFjJWBqcFxlk5AURPDhtcVFeZCmW1xMg0SGjA+9OT3ZcQsm5JS7IpSO/BKuRdsK1XNz2uk7lFdaXOIVU6X1mojeD8+TycD9cuwg73dM0UJuAOofeRioBHrHXhdDM5CPpKkPDTke9WakX3VwhhGHkUOv+Mys2ufzkU8V0NAWdQX+L4Lr9d1oV3H9ylcZP4hhRxKDtfDIv4XCMg+n0aEIDm5vs3DTM9KHSAOL5S3IbFE6Fi6RvphmG5/wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+sLVslROjOqr1ajnMOyWT6DWHzCi02S4Rpvsl4ydhM=;
 b=lSoteOHuSeOlUl3r9BX/CALXE4IwW/JGRgwdEBdXjVZffPzIor3/DVrO0yrrcMCGaJGKEl/7wtrn3ZyOCntVcvLQTOH9xcoJo3B861N/z4H8XmMnXNe1hf2XHZxdazWS4benenpZq2TnY9v5icDJ46YYJ7epGRkNIefheDy18Gk=
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com (2603:1096:301:17::5)
 by SEYPR03MB8180.apcprd03.prod.outlook.com (2603:1096:101:1aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 06:26:58 +0000
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6]) by PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6%4]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 06:26:58 +0000
From: =?utf-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"lorenzo@kernel.org" <lorenzo@kernel.org>
CC: "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "nbd@nbd.name"
	<nbd@nbd.name>, "dd@embedd.com" <dd@embedd.com>, "robh@kernel.org"
	<robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"Ryder Lee" <Ryder.Lee@mediatek.com>, "lorenzo.bianconi83@gmail.com"
	<lorenzo.bianconi83@gmail.com>, upstream <upstream@airoha.com>
Subject: Re: [PATCH v4 2/4] PCI: mediatek-gen3: Add mtk_gen3_pcie_pdata data
 structure
Thread-Topic: [PATCH v4 2/4] PCI: mediatek-gen3: Add mtk_gen3_pcie_pdata data
 structure
Thread-Index: AQHazWP9vfSp/QoK+UWPhgolYFCNjbHviYuA
Date: Wed, 10 Jul 2024 06:26:58 +0000
Message-ID: <ef077188c8f9237b67207b2834cd7be398a50c3b.camel@mediatek.com>
References: <cover.1720022580.git.lorenzo@kernel.org>
	 <c193d1a87505d045e2e0ef33317bce17012ee095.1720022580.git.lorenzo@kernel.org>
In-Reply-To: <c193d1a87505d045e2e0ef33317bce17012ee095.1720022580.git.lorenzo@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5365:EE_|SEYPR03MB8180:EE_
x-ms-office365-filtering-correlation-id: 17cbc172-77f4-403d-8c75-08dca0a94d1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eTdzNHZuY2cvaXdURVY4NGtBSmVxTm81NFhlT0t2L1huY3RMM2JXTUU3SWVB?=
 =?utf-8?B?WGxYMDZadXN3Y3FCdm9oaVZyN216bllqSmZMdU1sZWZHVERDUFU2SVlqRjU4?=
 =?utf-8?B?M1ZSdFR2Z21JUGlQeW5MTjdscURJbEUvdXRIaG9JY1BkbVZScWhsdmtwcm9y?=
 =?utf-8?B?dmRXV2pyaEs5Ym1wYmFYMVZLYUFDTnhqSXpPcENwNm85WGFzaUFrY1ZoQmhQ?=
 =?utf-8?B?SlZMMXdjTjVpSWtHZWEwU0Y3RzROQVE5M0RWNmdQSlBseXpod0hDMGNwb3VK?=
 =?utf-8?B?QnJCblM4Y29nTE94WVRma3ZWaENybk9SbFpDeTUxTUNBNHJNQXQyUFVUdGJr?=
 =?utf-8?B?SXk3S2J2bElJN2hBcmhxOWVrbGt1NFZhNk04eGlVQVE3aUUwMlJGbUZSd2Y4?=
 =?utf-8?B?WDk1N2xyOGV2ZHVheVptejhYUFk3VlNrNWdIZkp0ZTI0Y3JKY1ppbzcwcDdo?=
 =?utf-8?B?VUZsSkxyTUlTeWp4aXdvRXZ4VmFpNEpnVU4rNkpmemNZUzM5am9ySWVGTjg3?=
 =?utf-8?B?NFJmMWs1YjFQUStJL1d2NW1UTEFTdWwwQzBwai9YMUlSeXVXaW85OXRCanly?=
 =?utf-8?B?U1BCS0g4RmtJcnY2U1VOUWNMQVl1MDJvdkhVY1FQbWFRRzdjUnk4ejdiOUEz?=
 =?utf-8?B?RTJjbmgyeXI5bmpGa1A2a01kQmpaTnZ2L2pXSS9qZmJZZ1Z4R1BleUMwbXBR?=
 =?utf-8?B?MkNRQ3Jxdi9EQWFCaWdTUmZjUjdCWG9JMkxkSEY5aUJIYVYvYW1LQU1RUXU2?=
 =?utf-8?B?QjA0bDFaLzFRNXpjUDJPdXRuRUJCZGJSR2xTMWpxdytUUG1jNEJoT2NwT1dw?=
 =?utf-8?B?OXI5QkFKMjVPOHlsK2xzd0lsTFBjL3o2eEdmVVo0RURGTDZkLzFGaElTb1Nm?=
 =?utf-8?B?ekxoM1dkazRTS3Y0dGZOTUdpcVlmTG5PUWtOSU9oWlExcnZRb2UzaVRTYk9V?=
 =?utf-8?B?OXpYT0k4eUwyY1NabmJQbEJHUGpOeW4xb2VySDdkaFRnSWdsL0I5ZkFUYUti?=
 =?utf-8?B?dWxzNHl1ZmJ6SDFRaDBaRElsWEc4RTkraW5RcWNyYmN6TXFpc3lWVE45dGZm?=
 =?utf-8?B?cW9taFNKQzk1N2ZQWFVERmJtRzN2RFNPblV2b0w4SUxmdmppci9hRTVlbFVP?=
 =?utf-8?B?Y3NsTGlFbys0bSt0cUs5ck1CNUpDMHRTWkljTFZ5Y3ZyYXRJT2o5dWZ2dGhz?=
 =?utf-8?B?N01kbUZGd253VmI3TzVVbHZrb0tRbWhLeDBjUkdYMzJnVkZwSnR1TEFKWkR5?=
 =?utf-8?B?TEtQbXFpbDRSNVBOQ1lXalJGa2hjTGh5c1B2Znk0SXFLUzdoUkdqWFdRV3dC?=
 =?utf-8?B?NXZLamdSZUZXamsyNnZwMUttS3o5T1NNbGdXMCttdDA3MGx3V1FVek1uYXgy?=
 =?utf-8?B?djAxWWRPM3MwU1pzblNOTjlpRjBCK1pIamdibll1ejk2WlE1ZWdZdmE1QlN6?=
 =?utf-8?B?bHg5UXdBK09zWlF3MnBGbi9YVmlpOXkyaUVKMnJkWUJwTVkvOGhpN2QzQmcw?=
 =?utf-8?B?T3ZFWTBRMDlrNlNEVTJnVGplYVFxWHBwRzY1WnJycndrMzdYL1Exc21VbUJx?=
 =?utf-8?B?cDh2WjZpMHgwcVIyZkZDSlVCNTFNN1A5VGVQKzh3ZENUNytoOFBDR3liVkhs?=
 =?utf-8?B?ZDN2Tys0Q2x2TTR1VmZNYmVDMFRodFB5NVlzd0FTK09tdUF6NzdPS2ZLY1ZY?=
 =?utf-8?B?L3Bsc0N6bzE5QUxOU2ZHWEhyV3hDZmRJeU53WU5pRzNDbXBOS1ZaaU1IM2pN?=
 =?utf-8?B?NGFqR01jUTJSTFVoemsxMTY1dWxLbm9GM2JmbVpiaEZhS24zZDNxUkpWRlFw?=
 =?utf-8?B?K2xoRXMzektDVmlGN0VZMjJ4QVA3Y1hCUmE4SnNtcUNpUzI0TEMvVlBCcmRk?=
 =?utf-8?B?eDhqN0JicHpDK1o1V0pTbXR4cnJndk13a0NvQjBhMDNCTnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5365.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U25XbW0xZzByWlJ5SnB4QjNZSVl2bmVzWmwzeDU2elozbTdhUDN3Z2c2WWJM?=
 =?utf-8?B?R1RDRW1yMkZpY0I3eDUzdm52aGVLTUlIN3dVSzM2UnFMYVFsN2VPd0VCcE9R?=
 =?utf-8?B?dldERHFQK2x0YlkwZWFSc1BGK3p5eSttRjMzL0pTMEFvVWgyK215OFQzcW4r?=
 =?utf-8?B?V0ZxV1FQMU10VkhENHhlSjBjdWpiU2h1cG40eVVyc0xJSGZMaXBYQnFHc00w?=
 =?utf-8?B?ZDFSbkZPYkRzd2FyOUpOTUZRN0k2eW5tNUdYdkV1Yk5JdURwZUhtSEIrT29S?=
 =?utf-8?B?REp4M3dtWmc1cUdKRXl0bHNKSGxjUis0WlVpd2N2ajdnNGhVa0ErVXRoQVRu?=
 =?utf-8?B?SVFoNkVBS2Noc0tPbHhLaU8zL0IveHZIUkxmdkRxbk9nK3czdC9zdjhYQU9L?=
 =?utf-8?B?RzF5L2VHcUtQMTJNTTU1dCtIZjkrODNCaGRzWGo5WThkU09tWUlNU2F2YXp0?=
 =?utf-8?B?SUIzMFowa3hoUjlQb2Uwd1pnQ1FUWkp0am9oUURITG9IdWluZGk2NzhLRUwy?=
 =?utf-8?B?UzNtdDM0YUtnZW5ZUThEYTFFOU9oVUZnTXVKV2NNdkhRdjFXTS9iZEo0cmhv?=
 =?utf-8?B?ZmJiVzVGWjBnUStBbFFlVnJKT2FIWmRNWEZzZ1AxdVBQWXd4MFB5RHBIbzJD?=
 =?utf-8?B?MkxWZnU2VHFIV1NENjFBYUhXKzQ3eUlsY00zaWdoWEttWUhYc2V1ekY1eWxy?=
 =?utf-8?B?MzFqMTNZbkJJczQvL3hHOGdOQk9FSEtPaENRUHBQeEVPcm83a2hUdlpudXEx?=
 =?utf-8?B?SVFhcWVrMlJIY25tSm42WTFwSHVSUzVzckxFYzl0Z09DRW9PNGFUcnE3bTRr?=
 =?utf-8?B?c0ZMZGZhaEIvNXNFQ1pKWGRyNnRRWmNnKzZ6cHpVL21UZXFsNm5JcU9FTzNI?=
 =?utf-8?B?RWlhYmsraXMwcTdnbjQrei9PNXVpU1lra1VraUcxNXNjNkxNSkdHSFR2SUUz?=
 =?utf-8?B?bmlLUDlVZk1Qc1pGNkt0bnV5SDNINEM3MllIU2xjUSs0OFB2WiszVGFaRnFt?=
 =?utf-8?B?eDNaRlZpSk5haSt2OUYvU1lKczB6aklTKzJEbU5aZUkxR0JGVFNadGxuNHdO?=
 =?utf-8?B?WUNxeTk2V1BGUTZJTXd5am1PZHJmeE5STkdiUXdEdmlIREk5bnFsN3lHY1hh?=
 =?utf-8?B?ZlY1bWxpbHVMREs4c2tJTHdyUkRTZHNOTndJTWRLZzlaeEUrSThSZUt3TytR?=
 =?utf-8?B?N2hJUVlGT2ZwMEd3WFJxeGszZWNnKzYvYnIwVjQ2MWlDM3Bub3F5VU8yT3dy?=
 =?utf-8?B?cWpGeUVDWXhKRktFU3VyRjRZRFNXMWFMbWpWTHYxUkYreEZtV3ZyNEdBSHU5?=
 =?utf-8?B?OTMxbmtnZGhLc2pSZVZjd0JYVVZlTTRheVBxSXRNUlhFQ2xrblptUzZqRGFH?=
 =?utf-8?B?dXFxOFcyd0YwaXFuRHRIZ1loWjhrVTA2Qnc2b0gzRlRnZE8zUW1nRU5CbnpX?=
 =?utf-8?B?cmJMOWk3aG0xRXJwbHlpNkVpaVlzM3FQM1ZMeDZwWGphR0ZQeitqWXpUYnpz?=
 =?utf-8?B?aklRV3JGSUp3Yy8vSG5rb2I2SHRUOHhaa3M1c2NNcnlIWk9BRGZwV0o3cXdB?=
 =?utf-8?B?amFleTliTTY1cmtuVEJ6T3V6ZXZERGNGSy9hWVhpdmxEQ2RnWGJaYnREVm1P?=
 =?utf-8?B?V2x3STF5QmczZXFESXFYY1NNZnR2VWc4WlB5QW4vbGRVVzZ0MDhJS2NYTEpX?=
 =?utf-8?B?R2F0aW9KMWozdms5Mk1aMTNuUEFvREljZThuVm4vY0FDQThnSHdIVDRkKzB6?=
 =?utf-8?B?b0N2N2pSVWs2YkdQOStrbERKQUxoTXFzSWJqYVlPNjJ1UEpZTDJjbGFxTmxO?=
 =?utf-8?B?QmswOWJRcWQ5TlVhb2YzRlVFWGwwc283blpFNTNhUW9NeVByamRuY21ONXE5?=
 =?utf-8?B?SzFINnp2YnFXRlhVTHdDTHNjc3pqMGQzUlJVdUNUcExLTlA3RmVxNXN2b2pS?=
 =?utf-8?B?Q29ndDN0azhWNTlZdjBPNHdJa2FCTGlzbjkyM1NENHNQb2pCQVVnUkI0Vm9r?=
 =?utf-8?B?dU11NWcwWS9tZUY2YmR4aFZaT2RIZUJsKzlTbi91UDZOTkhad2RJWVBocHlv?=
 =?utf-8?B?a0Z0MXcycXVqVUgwZDdBVWRxck1uelBVbk0vZXhUVUdTVXJUUW1LYldjOXdx?=
 =?utf-8?B?SmlKZVpZVkMzNGNOK0tKOUpFQ2p6WloyUVArZE80Rm95czBTa2ZZQXZmTlhS?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAFF5E860DD3AD42A062A9E192DD21BD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5365.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cbc172-77f4-403d-8c75-08dca0a94d1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 06:26:58.3371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BAJqemfqW1MHdwgzs/n230Z6nDfVMmFkWBjqM19ZuVQPqk/HDLnrCh5uoc8jTkNQyisb2GEvsv0Kbk9F0kAC9jLl+zx0GzctIi1K50s/U+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_232706_205226_C288195E 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCAyMDI0LTA3LTAzIGF0IDE4OjEyICswMjAwLCBMb3JlbnpvIEJpYW5jb25pIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIEludHJvZHVjZSBtdGtfZ2VuM19wY2llX3BkYXRhIGRhdGEgc3Ry
dWN0dXJlIGluIG9yZGVyIHRvIGRlZmluZQ0KPiBtdWx0aXBsZSBjYWxsYmFja3MgZm9yIGVhY2gg
c3VwcG9ydGVkIFNvQy4gVGhpcyBpcyBhIHByZWxpbWluYXJ5DQo+IHBhdGNoIHRvIGludHJvZHVj
ZSBFTjc1ODEgUENJZSBzdXBwb3J0Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
Pg0KPiBUZXN0ZWQtYnk6IFpoZW5ncGluZyBaaGFuZyA8emhlbmdwaW5nLnpoYW5nQGFpcm9oYS5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gQmlhbmNvbmkgPGxvcmVuem9Aa2VybmVsLm9y
Zz4NCg0KQWNrZWQtYnk6IEppYW5qdW4gV2FuZyA8amlhbmp1bi53YW5nQG1lZGlhdGVrLmNvbT4N
Cg0K

