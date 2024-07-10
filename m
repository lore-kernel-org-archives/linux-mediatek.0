Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0B4C38150
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 06:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9+ITrp4M3K/LhBMONX+jhRggCN1fESHj9AiQQTXTUE=; b=BWlg4N1/BHv1GpsYm4G8QgxoI4
	Ux21UPCJYAn8WI3nj5AxQVNYecB1+ZC8EmH16ULON7RB3MQ+UPkFoafjG9OHXJR5miRaGRqSViglN
	lMBtxvo1ZdsotJS5+48CgqQYLcLN8SUpJF0KqVyCEnBFeWhrXWfwo3Yu78g9dlpegWVNtZ36WWRBZ
	FiSRB0hBBfZlvLmz8ZcLqva7H6OhWerIQt8l0smTnNu1DsiaGOk17VLASb4MOf3GX8DRDzAzgxama
	HyzFf/5yR99zDYiuN08Vtoq4T2Oc0o3OJENhVeLqm0FB+xpRLbucZxBfmqW65gfV4r/7IbrKdWgXL
	TwvI5c1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRRBS-00000009eYb-0kiH;
	Wed, 10 Jul 2024 06:52:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRRBA-00000009eWu-1Bkr;
	Wed, 10 Jul 2024 06:51:53 +0000
X-UUID: df21b6863e8811ef955bff358274dad2-20240709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=l9+ITrp4M3K/LhBMONX+jhRggCN1fESHj9AiQQTXTUE=;
	b=ZXzaQpxPXcK3R0BIQ0l4sBKr7DKjXaIrFc2WaoTjSuEEij5EmMceqL4pJpYr3aifbtbCRjTA1xMlQjf9lrgV3YsyIOcJ3TDEsq/ojXBhw2PuI6FVsFTbtfHFepfLdoRTiIJljlHR8Sxs6mzvv1Yb6tofU3NcMqbh8GNRS59y2iw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:6fd060e1-4b77-4e41-a260-c6d976431b22,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:861e480d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: df21b6863e8811ef955bff358274dad2-20240709
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 515745364; Tue, 09 Jul 2024 23:51:45 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 14:41:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 14:41:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DA2OUi7BJXgs72DOfwdKdGdrE0WkcB9WfeHrVhnbe3s0T0Dg3J7WnBYcD+1d+0HPZomEDiUbs4adf9NNPZ8m+jrFZ4jWtVeytTn/q7/YqZeJijytMY+TSoPmeHDRdAxY8tfxCGG0jm7xTFndCsWgX9TCTMdQ9cknhe3xB/hRwIUSG/nsoeRBEGuGMhwcZXC83m0Pk0toqZRqwHd8RG4nUOFzM05C2y4dplyjhN+1W/re/ttUoCaYe7VTfEShuOYvj/vbt4JfG13EyDAp2nDJejwTDGGVXdh4wMeVsAqyGmxvnkuxW4aAmpTQjp3UXkvAs9/cx4JHtisNQ5jHJumnnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9+ITrp4M3K/LhBMONX+jhRggCN1fESHj9AiQQTXTUE=;
 b=FjkUu+r2Wra0/TTprKVBbJVQHBqaei/p5Z/yvTnn5vMEEXEUANnEp5lwiqd3Sr7YJ9Ld9tje4OHs6GkVexIAgcKteOwr8sgk3dupN1Vxeu7kZs1J8hVgHU6RgMRoQJvz/30wCCOo3myAd5Flm6TPd6JHJfzVjALQZT9/oBLRHr8PGKQXPk53vDL65OUjCNEtcGKx/nwFPE/uT2AgcyCjMslokgOeNxPPP7EG8Xcmpjknf9pOoeocJHH7pa149WeMRpUVikvhtLfkkGKwyjgXkrr0yZZJo34EYWnIknFXvKlr3DjfPxfZIsq9ZJJ09OvEg15wjI9QrzJdPCt48Zt0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9+ITrp4M3K/LhBMONX+jhRggCN1fESHj9AiQQTXTUE=;
 b=gmy9Sjb2ez3t5PCw8SUfGqJg9Mt++37dPbt0caizYXG7czBX8zqPu6ExA9luTJ9AWxKG2UbJl+z5rs2rZ7Gspu5KicI8q2lgf9+SH+5kWEsen89nZ+rCVxQgvDX+WcL2knHfiKs3kbPjY0SYnfU5wchQTg5m0kMpDEUGdKODiYo=
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com (2603:1096:301:17::5)
 by SEZPR03MB6849.apcprd03.prod.outlook.com (2603:1096:101:94::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 06:41:40 +0000
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6]) by PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6%4]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 06:41:39 +0000
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
Subject: Re: [PATCH v4 3/4] PCI: mediatek-gen3: Rely on reset_bulk APIs for
 PHY reset lines
Thread-Topic: [PATCH v4 3/4] PCI: mediatek-gen3: Rely on reset_bulk APIs for
 PHY reset lines
Thread-Index: AQHazWP0P+2SiwsSLkeCkRn5WSguO7HvjaYA
Date: Wed, 10 Jul 2024 06:41:39 +0000
Message-ID: <b010b5ffa050565a311f72f6d9b8752d5075ec28.camel@mediatek.com>
References: <cover.1720022580.git.lorenzo@kernel.org>
	 <3ceb83bc0defbcf868521f8df4b9100e55ec2614.1720022580.git.lorenzo@kernel.org>
In-Reply-To: <3ceb83bc0defbcf868521f8df4b9100e55ec2614.1720022580.git.lorenzo@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5365:EE_|SEZPR03MB6849:EE_
x-ms-office365-filtering-correlation-id: b3831c1a-00ae-4221-baf2-08dca0ab5a72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UE1TVUh4NmE1VUY4T1AycTRndC9GOVRDS21BWGFydVQwWEZWaVQ5UEx2bmJx?=
 =?utf-8?B?VHZ5ZG55L1lGZ2s4MWYwUjNpWEs4N2E0K0FaWHpRZGdGenpjRWZqcGVrYUFB?=
 =?utf-8?B?cmRubEJDL0RrYUVRL00yK205eHlVZm51UjFDWVBONVl0YjRMOG9wVDFBM2hG?=
 =?utf-8?B?NUd1S2syL3lyMXR3YldoMnJFb0dLM1RXNnBrN2preDBMSlhjbGpxd1loK0lR?=
 =?utf-8?B?RUZyRUF0cTdlNkljbFozdkUyeHdQYm9PeEdrakpXRzZlYjlpdFdYZm1EbnI3?=
 =?utf-8?B?OHFySXBtTnBsNG9lM29QRnlrejJrSSt1K0E1RHNsY1hzRGFTMlc1eWZ3bDRT?=
 =?utf-8?B?WExNVE1YdVJFem5jOVZVcVhKL2czL1FVRE1KRjZ5SHFUUUZOTVZ5dzRkeWNW?=
 =?utf-8?B?U0d6RCtYaTJ6QW1IN1dsSDRSSERrUFJTd2lUMGtaZGJnSDJtSW1vZnl6S2FM?=
 =?utf-8?B?L1Y5V3E3MktDbGVKQVYvK1FUSW4yMDlUUkk1cXR6UUlMRHJDaGx0OEhjbVVB?=
 =?utf-8?B?VEJxVEVBdWkweW80Nm1uZ2tqcGU5OGUyZ2hYd0NHNEV2b2VMNkZzNUVsbWls?=
 =?utf-8?B?Q29Zd2ZwWm5Ua01MNm1KVWNhcjI2VHRMZjl1eUErZmYyMmsyUUlUK0xmbm00?=
 =?utf-8?B?bGZHOGo3MWk5UjFGK0E5M3Zxa2RDK0EyaFJiOHdMenRDUW1pWnNubkwwNElp?=
 =?utf-8?B?RVNaMmpna1Q1S0w3VnN0cGlnN0Fsc1dRREQxOUdCT2t5SHdFQk11bVhwZkRX?=
 =?utf-8?B?eks1bmhDczJoNVFzVXg1UHdudWNlK0w4dXl2dGJjZ0dwK2p4cVBnZjVxRk5I?=
 =?utf-8?B?MmNraGZKcHdjeDF5b2xSdUVWemFpai92dWQra2Vaem4wTmQrSTdIcndKSkNQ?=
 =?utf-8?B?VHdXS1RzZzFiYWNRVmgvOGdNUmptVjlkNVVna3preXBZbnRHa2NLZ09vd1VJ?=
 =?utf-8?B?dmxhd0hsQjhvRTJkblhBOEh1dEFNUmw3VUUxRmtNZVJBRFkrb2c2Qzh1SUo1?=
 =?utf-8?B?Rm0wKzR6UzdnNW9jYzlFVWxYdXMzbC90RHdQcHp3RTZkdmRoTmdOc1gySWtJ?=
 =?utf-8?B?QWEvRUJrNmRZbjhxS3BocDNxL3RiUnZZbjFsT3cxU09qZ0lEcmxsV2labm93?=
 =?utf-8?B?dGlabjVTVTAxNGFqSWJIVUtDQndLck5uZ24rTFZMNmhoM3FFNHZRTFlpMm5s?=
 =?utf-8?B?Szk0ckRyaGQ2UFc4YXZEWHlwWmYwall1VFRlY0kzcHZVZzBCZldPR0hWbXQv?=
 =?utf-8?B?QmNub1E0RE5xR0w1emUwVTFtRURiNXBaREoyOU9lNUx3aGtnbDU0WjgxZENS?=
 =?utf-8?B?OFc3T2ZhcVpZOFRVMlMvWGZRNy83c29WcGI0WFBqWHZsMzFsT2FidjFQWTAr?=
 =?utf-8?B?a3g5UDdXdDNNaUxtaEFxRnVmclJTSjZNRHlKTyszUmdaakl3cVMxbTdoYmlp?=
 =?utf-8?B?WlJDbm9rVHQ3UzBXMXF5ekJLT1AwRGErd0E0UmR6QVVLMUY3RHFPL1VsbHc5?=
 =?utf-8?B?dmhySkV1c3MyREtEZEFObE16WFdTbXhNOGdSNlJienpNSks4ZTdtcER0UnRa?=
 =?utf-8?B?K3ljN1VPNFlmeWRYYUdLeVlKcWtBdjBzcWdRYTJsRFp0VSs1U2VRU29ZWkVn?=
 =?utf-8?B?MVJ2b0FNdWsyZVJQUkIzR3FaRXhiZDhVM2FjaEVmZTNmbDM5bnVJTm9hZTdo?=
 =?utf-8?B?UUNJTHRWd3BBV1JkSEdubitkODU4bVVlbFJGME5JLzJvL2hpNGhIYWoyOWZm?=
 =?utf-8?B?eHM1dEpETVlrZVp2eE1ISUltNTg2bDdWQnFwVzZqSFZ0bnU2VThwZFpINzhX?=
 =?utf-8?B?bHprZ0lsMS8vTW1CRXhWV1F5R0NuUElmMkRDaklsMU0yajBRbXFQaElXVHNB?=
 =?utf-8?B?UzVEd2RvVjdFUDg1U2M5dTErMDZvenVFUy96MXJNL2FGeEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5365.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHFOVkhOZ3hKMjFCYkYxbmxZMEpMNjZpSTVNSmJSdm9OZzJBNVQ1MmNjZEdT?=
 =?utf-8?B?WUdpOTJnTU5nbmNDck1FUldZR3lwb3c1WWpqb211VkVNYTBCZkJNMlk5cDN4?=
 =?utf-8?B?cklmL0o4SDlQUm16d3p2N1FESFd0NEZnWHg5MkZQVjNHOUg5Tkx0VE5VSi9Q?=
 =?utf-8?B?cXJGR29zTjVWcExzWDNBc3UvTjNnWWdpdGwrMnFnV1hHN1ZHN2FJeHZNNVJr?=
 =?utf-8?B?RTFRQXlEa0YyN2hYaFlzMU1CdDJMVTZpbEp3aCtNMzAvL3dSUUE4cDZWamxC?=
 =?utf-8?B?TGdSVlFJNTkyQkFxMjE4V1hhZTZuZHJGQmlid1kvZjVBNFUranNtSFU4dDlr?=
 =?utf-8?B?bzlDc0wreWZ0OU9zZ3ViNE5NUTNNZ1o5UlhrOFRkTXRoQ3VaVjllQW9HbTVK?=
 =?utf-8?B?bmpISDJnYXozdXNiL0ZTWVAwRThkaGlQTS9Gb3VjMWkwT2RJbnVVR2grT0Zx?=
 =?utf-8?B?TzNpWWtNRStmaHFBQWt2bkFLNDM2NlZKR3ZCR0E0aFIwRmV6YlJxcFY3eDNw?=
 =?utf-8?B?YzlCdjJDK3M1Yy84S1N4cjh2M0p0ZUhuQXEzdkxuZ3dkK1U4WmEwYnZOVHpM?=
 =?utf-8?B?bU1CTXIvdGlpbmVyRTZqY051VE91UFNDZjRQbVIrWVp2WXUxZFE4ck4raUVE?=
 =?utf-8?B?VTczYnRtTkI2VzNJODNsSXJuTUhSTmNhdW14a0NxNVlpNXZxTGg0TFpLdVk4?=
 =?utf-8?B?WnNaRGY4VFRodU5hblFzS3JVZzFhbVlOYVgrcW5qQ0ovd2tTYUd4Qld1U1FB?=
 =?utf-8?B?VHBUSUdzRDl1M1VRMDBHek1QMTJRTkdyYW52dVNZNGJxVWplejVXZEFsMHpm?=
 =?utf-8?B?amVJMThpcVdDZzJONWZkQ3dHVThlNnRkejdZbkdsOVcwRExjY2RDZUVZVFdw?=
 =?utf-8?B?S093ampTUWNhQUVLWXVmTlVTWFJZYlJiektydmFZZlJoalBVdkpodmlTazNM?=
 =?utf-8?B?RjcxTEZZV081ak15cEdxczRFQlNMN0hDNWxhL0tyZzZrdjc1dlJsM3BCczZG?=
 =?utf-8?B?bmkwTzV1cnNLc3FmM0t0QXg0QWFrSWlDdXpOUVBPQ0JGMjdkWUphalVSdGow?=
 =?utf-8?B?Szh4T1JONkpGaGNkL0RDVndDL2hwbmNPNjdvS3FvQmhjZFJwelRnaTRSWEo3?=
 =?utf-8?B?NDBxdjVEcWxDTzVBNnE2WlRsZHBBVzUzb2grOFNJZ3oxM3Z5OFVMb1Fpa1Nx?=
 =?utf-8?B?MjNLU3VWZWVtdU8yQ2tJU1FjNHVhZStPMjlUZVdTQmdmcFFQejFWMUtmMzRV?=
 =?utf-8?B?MVZRZjRZSENIV2J2ZDlXWWJhMG1xK3FRZEUxSzlKTzMyVmlzTm96dVp1T2E3?=
 =?utf-8?B?WThWRCsxUXF4cFdqRk90aHJPdXlHZDJiMUVDSExZTHo0bnNKL1h2MXVKbnBu?=
 =?utf-8?B?OTJBUXJNcGtFT0VkNUkzZkkxc3pqQWZaRk9icFREbDJiZDNoU25HbldwUzRS?=
 =?utf-8?B?dTRBMm1PL2M1OFBldGlQU2hNQTRiSVZDTUNCdDRCbHlsM0FYQzlzRTMxZFZa?=
 =?utf-8?B?VVRiSkFUZ1ZYeGhMZmJKYkJmM3lvZ2hkLzZ3d1psMGdNNTFUa2tIMHk5TXhZ?=
 =?utf-8?B?dFJJaDYrbnhwbUpBcXhjbERhSjhjWmRhd1Jab2pJekRFYjNzNWx5cGpQWThl?=
 =?utf-8?B?bDdzeXJ6UXpGSW5KZHRCNVZMaXkxVzlTRnBxS3dWVmpBT0VpVVNzemE5Mkhm?=
 =?utf-8?B?QmVEdFJ3ZnFZVmpXaW1GUVNDVkphWG1GSmhwVXZ5ZzVaQmpIK0VENlZUOWow?=
 =?utf-8?B?YWhpejcxWnd6UTlxUElRS1RzS0YvOXMxYm9XeHZEQVIzNVpmVlJQQXFvMlJ5?=
 =?utf-8?B?SGZsbUwrdFgxR01MbVpNT0ZQM2tNNXZrNE1oOU1XSkFOdGRVQVVob2lWN1pX?=
 =?utf-8?B?dVB0VUxEandOazRlbFJ6SWJtU0FVS1pGdXB4anh3eWZiTHlaYlo4YktBT0xt?=
 =?utf-8?B?M2ZkV3dhdHNvTEtnalp4NWljVWxTODdXenBCVmNBZDJITmcwblc3NUpRVmUy?=
 =?utf-8?B?TVd5bCtBdDlmNDRoc0dyQXhXUVV1RWd2K3piTVFqd2JWVlNRdXRPb3d6dkY5?=
 =?utf-8?B?V3F4c3pkcXBFaXRZYkc1OCtjOHlJVVhMSFd2RXdaMlNPUytOVEVNR0kwWkRr?=
 =?utf-8?B?NzNDZGEySklyNlhzS2RGSXcvYmhuVGtRbVlvL3hobU9ITitxYkEyV0docDNN?=
 =?utf-8?B?K2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <013C7F224E1851489CDA90DE6E96EF64@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5365.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3831c1a-00ae-4221-baf2-08dca0ab5a72
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 06:41:39.6637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3c6yQ0w8nmrSRKO1LFLSXxC/YLgL4xulDWqkm1MPmXG9p/0uKantVv4jysIHYguKESh/ags7dGsG9a3FUJ2u6Cg2Eb56zmBrCuPaRbKyd/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6849
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_235152_346364_CC650FCD 
X-CRM114-Status: UNSURE (   9.36  )
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
ciB0aGUgY29udGVudC4NCj4gIFVzZSByZXNldF9idWxrIEFQSXMgdG8gbWFuYWdlIFBIWSByZXNl
dCBsaW5lcy4gVGhpcyBpcyBhIHByZWxpbWluYXJ5DQo+IHBhdGNoIGluIG9yZGVyIHRvIGFkZCBB
aXJvaGEgRU43NTgxIFBDSWUgc3VwcG9ydC4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbT4NCj4gVGVzdGVkLWJ5OiBaaGVuZ3BpbmcgWmhhbmcgPHpoZW5ncGluZy56aGFuZ0BhaXJv
aGEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIEJpYW5jb25pIDxsb3JlbnpvQGtlcm5l
bC5vcmc+DQoNCkFja2VkLWJ5OiBKaWFuanVuIFdhbmcgPGppYW5qdW4ud2FuZ0BtZWRpYXRlay5j
b20+DQo=

