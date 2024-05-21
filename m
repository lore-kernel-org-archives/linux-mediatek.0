Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2782C25B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzgd6YoJu8YpQQR7r6qsOQA+mIgVrR2sDAHNpV50Onc=; b=3BfY1o15WetXHxhvKZNUICaDaf
	746EJcxcwcadbOps8YFmrwIQNooE6m2OWat07OnNnyqAYx0Nu263FoucoXRK4+RjgyKWcP8ec+yrW
	IpD3BZz0Oeun/yXlcrIgLTGSl4k0fcBjlaZsVDois71c+vjQjDYwXCjpO6CdQ5nD7NeljJPtwz0Xi
	2A0XdHxhyoRppb42iYq+Ph6nPvCsmOXQYNyNnpFSJrMSJ6T8iGKyy+Hjfa4CfzJWccZDmS2QywXR+
	qkSLvFbawidCm90dfCXx1tNMmXMqx0nthjjPuMJOd1cbMU/FFkW6UADO2qdSy26d0Xbyw16BAE8Zs
	umlL4XvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9MEW-0000000GyVy-0h5n;
	Tue, 21 May 2024 09:56:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9MES-0000000GyV9-2uBE;
	Tue, 21 May 2024 09:56:34 +0000
X-UUID: 63072c36175811ef9a78ddf43a9225dc-20240521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=kzgd6YoJu8YpQQR7r6qsOQA+mIgVrR2sDAHNpV50Onc=;
	b=HUF5gmqsWJJpc0G9VkMPQa7C2cPPoFkm+JYhM+H1YSnECDdbhy7B1jucZGwvTi2OMPacoswD2RFBrQTXOLqeSyUwG0+TnXkAlqCJZXtdiwQeXbc4vjKXfONYrjmgkYyuLy4uK+zUt4n2d9qiH7CcyLYlFjPeAZAdOkR1909DPe8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:241f724b-a578-4070-a1b7-1dbfe606a86e,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:82c5f88,CLOUDID:88122084-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 63072c36175811ef9a78ddf43a9225dc-20240521
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1955639060; Tue, 21 May 2024 02:56:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 21 May 2024 17:36:22 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 21 May 2024 17:36:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG+hSp6FFdn5yfhWntzNinGT4BQSWK44f1Ub4se5YNbNKNkkZSN3Am2vm/ZeHmfZD4ptpfyGoKoUKnpnxvLnnm/1KRiyGWrcHUZ5onCQbJW/ji00F9OLx2/00k1kEQVbtv6J1p26RNMcTXyBv8dVuLIU9djME0bibtxlAGHK3mvU3ALfkEbQEqAROdM8Ban6MJMO0jhOnN6mKhpudjE8D7Espy7cZDUPk4yUVfKtgQDGystAatpiszujExRZ7qVtlPg404ixhWKR1vXeGUIYXA0PgDjtCeX0T9MuDrJng11gtn/WouebI27t9mvyCWrVZxGB2J3gip499c0OcG/QUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzgd6YoJu8YpQQR7r6qsOQA+mIgVrR2sDAHNpV50Onc=;
 b=Xst2p53iYGu3EpB8wtxuJZwv/WlpDxXcjuwBLraz8sJYKYC/3RlaUjI7Vr5xgFs+QausA0QaQ8ikcgKoSA/k9fyS37+v9eg1qpKP3bvGLig9DSfUiUU1TwUrC/31KfO4otXCGMHTQSZBYCAkwshcAwaxSMEKS6Ycd/052JMi4WxRONLshUehDABbFj1EwAtBfvcl/XHzSEBka3iUjz6qOTijRtdKymaoqZIHDZWanfb98zNbCmSiLtoxG1gNe3LnqI4HgEcvwASovo75AzqBEar66o8bxu+SfWBpTLc62uSlZG+JQd2WpWreqSX1xoPIjmpGVwyfK3eUhvzrUrEmbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzgd6YoJu8YpQQR7r6qsOQA+mIgVrR2sDAHNpV50Onc=;
 b=wH5vTSi5q+cTpK5uP1XARuf9DZFByEXddTE9xjU2zKIi1yR/ryZ668ei5ICIyZOhRv+g6WcmWW/mFBrexOlohjPZsg3fU/fU+gslAOZDaY2LGpYB4Nidg+Wyk5CP1PAwRKEgMWsw8cNYmRaCgi9CfGQUJfe6HvK4aH0LWrG4oJ0=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by TYZPR03MB7228.apcprd03.prod.outlook.com (2603:1096:400:343::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Tue, 21 May
 2024 09:36:19 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 09:36:19 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "andrew@lunn.ch"
	<andrew@lunn.ch>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dqfext@gmail.com"
	<dqfext@gmail.com>, =?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?=
	<steven.liu@mediatek.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "daniel@makrotopia.org"
	<daniel@makrotopia.org>
Subject: Re: [PATCH net-next v2 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Thread-Topic: [PATCH net-next v2 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Thread-Index: AQHaqEVm+42yGefZlke0FSmJqexdqrGcNSIAgAPRvQCAABR8gIAAT/sAgAEIyAA=
Date: Tue, 21 May 2024 09:36:19 +0000
Message-ID: <996df1ab7b4f3a0feeac972f6a87baa591750801.camel@mediatek.com>
References: <20240517102908.12079-1-SkyLake.Huang@mediatek.com>
	 <20240517102908.12079-6-SkyLake.Huang@mediatek.com>
	 <cc0f67de-171e-45e1-90d9-b6b40ec71827@lunn.ch>
	 <283c893aa17837e7189a852af4f88662cda5536f.camel@mediatek.com>
	 <8a5f14f4-4cd9-48b5-a62c-711800cee942@lunn.ch>
	 <ZkuM9C0Yd/uwwzUA@shell.armlinux.org.uk>
In-Reply-To: <ZkuM9C0Yd/uwwzUA@shell.armlinux.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|TYZPR03MB7228:EE_
x-ms-office365-filtering-correlation-id: 7bada735-ade8-43a9-f85f-08dc7979786f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?QkFhaHBLNXo0Q2JFT1dGNnkvZlFPOEpSMkFVTHRlaWJTMHY5bW1JWlVvZllx?=
 =?utf-8?B?QnQyMU9qSGRwSFY1NWpNKzBVL084RklMZk96YnNYc29TQ3lsbWlmN3JrQVJ0?=
 =?utf-8?B?NW5EbVNweUJ1KzhCMUlJSGhwcEhscCtBSHlWdFVkSnVwSDlZQXBQaFduUHUy?=
 =?utf-8?B?SkNGNTYyZXIwbTFwK1Y1TGt0V0lSWFk3YmNPTFBmTzBZYzJPeXljMGwxNUZB?=
 =?utf-8?B?YlBDUllOS2Vuc2ttV2E5MGFLMFF1RUw2UDlRZGhQZTY4NVJxamJiVUg4QmJ6?=
 =?utf-8?B?d2dObWYyb3lzcVRoOFRYbGJWUnlwcUNFeG9NZ3RnRHVJcmUyNENDR0xlTm9M?=
 =?utf-8?B?NUY5dVJwSTVMZlh3SjlRb01ZRVl2dnBrLzl1emoyQjJmK25xc3VRYjZBcFJC?=
 =?utf-8?B?Qi84elh1K1EzMFRJbUIwU1ZPVTN0dGREZGVqQUxiOThTbE9EbzhrTVZXc1N3?=
 =?utf-8?B?QzE4czdaNmFBSDJiU25kNkVUd0xUd0xLVCs2RXFyaGx4U29pY2JHTHFoNUZM?=
 =?utf-8?B?cFVqanFtMzdYTFUramE0YmxrVGFLM3I1b3AxYlN2aEUwN2VZemY3Tytac29Z?=
 =?utf-8?B?anRQSXQ2empLOWx3MEM0b3NnMnRpcnU4ditFa3BSUk1GVlcvRUFKNjQvRGZJ?=
 =?utf-8?B?QzE4UTVkLytwY3F4ZEVjcWVDR2cyVkJCNlpUSUNJUDdFUnBqOWJVTGxlNllW?=
 =?utf-8?B?bjRxY0h5alRxb1VhTlVrZ3RMa1ljdjRsTG5ueXVnc3dWT1VKaHRUbWpJdm9Q?=
 =?utf-8?B?cWhsaEFqYjFVMlpKMEMrK2ZFNHFrRWIxcjIvTURlMXo2N0RqTVMxdzh3a0hQ?=
 =?utf-8?B?WEhmUjNERUZXT2VvWEtVNkJuVVpLOXBzb2JKV3piRVluWXpuY1JFU2hwcHpp?=
 =?utf-8?B?SUdLWG1BclRrbVNJOTBCbEdQSkJ4dStxa1dFeW43eXhIUEJXTUdDNVJVcjZP?=
 =?utf-8?B?NDlReS8zb1VWcVBmajNmbUoxNmcwT0ZLVkprMVRSSHl3UGswSkdqbjlNUktZ?=
 =?utf-8?B?OXV5U2tMTHlLdGVzTW4rZzhwL3ZFNEFVMmYxa3hSbFpYVC9XK0thVVNxSFQy?=
 =?utf-8?B?dXg0Zk5LRnI1MGZsWUZTaDg5N0NCR1pmczl5TC95eWo2YThCcTVQekMzUnhw?=
 =?utf-8?B?cTYxeUl3OW83Nlo0Z2poOG5kQWxMQWxEekJudTdHRGtjelgvTDY5MmhQYzZF?=
 =?utf-8?B?UjloL1VpM3FBMzU4czU0MWJaSklOclZtMnJzL2dCL2NkWTFFeTNOWEx2dmJN?=
 =?utf-8?B?Nk52WXlRZmpveVpQaXV3Qmg3TkdrMm9zbSttOWxKNW11ajg4ZlE1YTA0czdX?=
 =?utf-8?B?RTNNK3NKaklER3hTNjFOUFJxb0RoM0RISGhUS0x1Wks4YlAySUROZTFJU3pO?=
 =?utf-8?B?REZVS24reFprYjNxWFl3MlA0VEZ2N3pDeUk0TzlCeUpoOHFlQzUvanc1eEVT?=
 =?utf-8?B?a01lKzN3Qmd2U00vTFQ5YUhOVUJrcERKVE9ZN0dtODk2MUdTRHUvQURMR3Q2?=
 =?utf-8?B?UVB5MS9NMGtuc3J1R3Z0Rlg5MFhleVMxUnVaZzZINHNENUpvR0xkOG5tWkNB?=
 =?utf-8?B?Q0ZlSTNhemdrUUxMM2hodVZZZmJvZFdJTDc5QnhHTmlMWUdqdXZ4cFBlaUFm?=
 =?utf-8?B?ZDFtNjd6S05ST1h2T1g3djlLZ2dHdHBrNGxMaTRodENXcVBsajJvTDJkMWN1?=
 =?utf-8?B?dVV4YU9BZ0VNcmxJQURqZmVyQklUWm8rSTJiQWR0RUo1Tk1SYk5oeHJ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3VSQ1JnWHVMaU1aSURoMTZ5U0phQ3Q1elZRa051MXpkaHF2NGJpdys3MFFy?=
 =?utf-8?B?M2FGeXI0UHdtWWhQWm9vMkYydWVIeWlSZTRyNzVTTlhXZ0YxZjArc21Ja1dp?=
 =?utf-8?B?YW9HNzlNTkRmUjc5am9Ham95Yms5SktQWHVOK2IvL253WHRoWFU4Ly9HUTJq?=
 =?utf-8?B?am5tSXRNbUJkaSs0ZlM2VVJJZWxtVXEreVFXck4wRS9PYkNYNERtcVJ5Nmo4?=
 =?utf-8?B?b3FhN1NDbEVNdDNvd0RnSnBjejdWSEhQYVlFb25tWHpCZWExV085eXhCc0F1?=
 =?utf-8?B?OXVtNDU0VHVHaWJGRk5HazRiSjhteTd5K2IzcElMRFo4REpmekJDNTFwQWV6?=
 =?utf-8?B?SU1EMWVZVUtJbmFuWVBXSWM5YkpXSS9oQUEvUWxpQStKKy9qYUVVOHo5aVlh?=
 =?utf-8?B?RlF0WmhjcnJqenlVMEViWFZ6YURZZWRwWUNYeVE5eTdYS1l5em5NbkVEbC9E?=
 =?utf-8?B?SmNlMGdyd295MWJLT2VRSmRjWk04K1FMUnZXUnQ5My94N2FuSG1oY0U0Y2dE?=
 =?utf-8?B?YS81cjd4dHRtZEFEOXVoZ1Rad000aXVCenI3UUJiM3pUUFZzakg1ZlhTRWhN?=
 =?utf-8?B?KzNqR1VpQWwwK0xrck1jTlFnUHg0MEFJZ0kxeEhmYmd5UEYxNHdoZTlUMHBv?=
 =?utf-8?B?RHJkaUdkaE9VNHllN1U0RDM5dWJudERqSXBYNVB1czFzUTkvSC9xUE5uWXV0?=
 =?utf-8?B?STh1d1FyYVNWOFNveVpONFkwT2plb2pVb2VLSGpwN2lLQlhwbkpHVzlrZmhV?=
 =?utf-8?B?Wlh3aHE5bXhYb0djUldhWkJoVHcyZWF6Q1J1eW01QzZzRkpQU0xOK3lCZVIw?=
 =?utf-8?B?YnQ3NFdNR3F5TmtrUE5ydDcwSWF0N2VrOGdJblhTRUUzNDRoZTBSeWJRVHFG?=
 =?utf-8?B?V1QyMjVhVHRDRldsaFAxRjloTnUwZjZaZjdNaVlndXpKSXJVRGZtR0MrY3lh?=
 =?utf-8?B?UGVHRzNaeEh1VjducUI2VzZ1ZnNzS2lQYWtPUGJING5kd01kSDRNZ0Uzdmhz?=
 =?utf-8?B?emhrVXcyUFNJRXVMUXdLL1E1T3R5V0NqRVVDSmh4dDc2dS9YZ0FpV2lJbEpa?=
 =?utf-8?B?TGpoSGJDQnVWeHY5Um9jMTVjdXVLeE1vRXZWTHJRYXZLSGRUc2U4NHk1OE5q?=
 =?utf-8?B?WVdtcEFERXJVNkZicXRmZ3hBYmdmWEIxajFDN281UEN0aE9VYWhkblM2ZWJ4?=
 =?utf-8?B?OW9qNUxCRVJMeHU0MEZMa1VGMERQc0V1NFMrT2NscG1lOFlsajByUzVNanJa?=
 =?utf-8?B?TUZqMjNCSWlvemdzMmdYN1ZPZDVaWkZyZHlNaGNCVjc4SFlCV05Sd0o2bVVp?=
 =?utf-8?B?UzJCekJySDBBbjZMYjhDQU4vZUM3Qm01cGpVTDcvcENQemp6S2x1azcwbndS?=
 =?utf-8?B?WDgrczFnQmxDbDJVazdVb0ZCTFRHakZIN3ljbVgvQjNrTlB3MzAyeEVHS00r?=
 =?utf-8?B?b0FRTzllSElNUldjbE1BZWQ4bE5BdkQ3R2N4QVFGZldHeDdPV01zdmYwdkVv?=
 =?utf-8?B?bnZrWTRZd2E0eXpocVdIN05OK1JCaS9QYTJkb1RBM0tLT1duTDV1R1RzVE9U?=
 =?utf-8?B?MVZjMlZ1cjdVOVQvTkZteHhnV0xIVldzTmh0RDZlZjUrTXB6VVNkcTl6UDBs?=
 =?utf-8?B?b2paZUo0Q0xmOS82WDBXaWI0eVFYenREMkpuUlJQd2FWR3ByLzgwMGV6UXIx?=
 =?utf-8?B?ZFpUNjFrTG9JU3F4MzBDaktIQlBMZ2UzYk9ta3VEWVJmdk5jZDF0WU5JNDlD?=
 =?utf-8?B?eXQvcFg0aUo5OGxBVllrRUhSSkNpdGVhb1lIUDcrblpqZ1BpeGpsa1BkbXN0?=
 =?utf-8?B?SWlUSXdVL2R6eFBHNXBtNTczajdUYkVBbjZHb3M0WDc0OGl5QmV3RlF5dmVJ?=
 =?utf-8?B?b2JCVldBVVg4SmZkSjNoR2JVOUlUTkYxYUV3cWdUL0w1MVdSU3BEOGdDMnFP?=
 =?utf-8?B?OEQzREVrcFpwdGdyMUhQUk10clppYlFRWEQ2VFltYjk1bnNCcElDSUh2a1hH?=
 =?utf-8?B?VjNsMEticFVnQ1FIWUNXdVF1aFp5QVBtN3VkZXBZNzZtSTVBT1VUU3BLQWRO?=
 =?utf-8?B?azlUZWdWR1FJM2k4RkdHZmZnQVc2VDE2WkJpNy8wTlhjRGJlMGprMmZyV2xJ?=
 =?utf-8?B?SXlBZkVyUnBDSW5TeVpoVktrT09Bd3VEeW41NUY1UW9adWhaVGRBeHRxNWFC?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F40EF1AC078A634A998BD3322F6B3E7A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bada735-ade8-43a9-f85f-08dc7979786f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 09:36:19.8295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5dLGtof88rI9PV2V8hyXiKGUAyMcGpm8xXN/Ib0JYZRhSwPl6SMyz1AnAs1k5LC64HEKxYE3miC1z8P3Euha2AoGMRsTNhQIgbGIp68V78s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_025632_754716_61A436F7 
X-CRM114-Status: GOOD (  21.11  )
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

T24gTW9uLCAyMDI0LTA1LTIwIGF0IDE4OjQ4ICswMTAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkg
d3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2Vu
ZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgT24gTW9uLCBNYXkgMjAsIDIwMjQgYXQgMDM6MDI6MjFQ
TSArMDIwMCwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+ID4gPiBBY3R1YWxseSB0aGlzIHBoeSBpcyBz
dHJpY3RseSBiaW5kZWQgdG8gKFhGSSlNQUMgb24gdGhpcw0KPiBwbGF0Zm9ybS4NCj4gPiA+IFNv
IEkgZGlyZWN0bHkgZGlzYWJsZSBIRFggZmVhdHVyZSBvZiBQSFkuDQo+ID4gDQo+ID4gU29ycnks
IGkgZG9uJ3QgZm9sbG93IHlvdXIgYW5zd2VyOg0KPiA+IA0KPiA+IENhbiB0aGUgUEhZIGRvIGhh
bGYgZHVwbGV4Pw0KPiA+IENhbiB0aGUgTUFDIGRvIGhhbGYgZHVwbGV4Pw0KDQpTb3JyeSBhYm91
dCBhbWJpZ3VpdHkuDQotIENhbiB0aGUgUEhZIGRvIGhhbGYgZHVwbGV4Pw0KVGhlIHNob3J0IGFu
c3dlciBpcyBuby4gSSBjbGFyaWZ5IHRoZSBjb21tZW50cyBsaWtlIGJlbG93IHNvIGV2ZXJ5b25l
DQpzaG91bGQga25vdyB0aGlzIHBoeSdzIGNhcGFiaWxpdHkNCg0KLyogVGhpcyBwaHkgY2FuJ3Qg
aGFuZGxlIGNvbGxpc2lvbiwgYW5kIG5laXRoZXIgY2FuIChYRkkpTUFDIGl0J3MNCmNvbm5lY3Rl
ZCB0by4NCiAqIEFsdGhvdWdoIGl0IGNhbiBkbyBIRFggaGFuZHNoYWtlLCBpdCBkb2Vzbid0IHN1
cHBvcnQgQ1NNQS9DRCB0aGF0DQpIRFggcmVxdWlyZXMuDQogKi8NCmxpbmttb2RlX2NsZWFyX2Jp
dChFVEhUT09MX0xJTktfTU9ERV8xMDBiYXNlVF9IYWxmX0JJVCwgcGh5ZGV2LQ0KPnN1cHBvcnRl
ZCk7DQoNCi0gQ2FuIHRoZSBNQUMgZG8gaGFsZiBkdXBsZXg/DQpOby4NCkRhbmllbCBoYXMgZXhw
bGFpbmVkIE1UNzk4OCBTb0MncyBuZXR3b3JrIGludGVyZmFjZXMgaW4gdjEgcGF0Y2g6DQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvWmp1bWQzYm5aRHU5TFlHSEBtYWtyb3RvcGlhLm9y
Zy8NCg0KLSBHTUFDMCBpcyB0eXBpY2FsbHkgY29ubmVjdGVkIGFzIGNvbmR1aXQgdG8gYSA0LXBv
cnQgTVQ3NTMwLWxpa2UgRFNBDQogIHN3aXRjaCBvZmZlcmluZyA0IDFHRSB1c2VyIHBvcnRzLiBQ
SFkgZHJpdmVyIG1lZGlhdGVrLWdlLXNvYy5jIHRha2VzDQogIGNhcmUgb2YgdGhvc2UsIGFuZCB5
ZXMsIHRoZXkgZG8gbmVlZCBzb21lICJjYXJlIi4uLg0KDQotIEdNQUMxIGNhbiBiZSB1c2VkIHdp
dGggdGhlIGludGVybmFsIDIuNUdFIFBIWSAoaWUuIHdpdGggdGhlIGRyaXZlcg0KICBkaXNjdXNz
ZWQgaGVyZSkgT1IgZm9yIHRvIGNvbm5lY3QgYW4gZXh0ZXJuYWwgUEhZIG9yIFNGUCB2aWENCiAg
MTAwMEJhc2UtWCwgMjUwMEJhc2UtWCwgU0dNSUksIDVHQmFzZS1SLCAxMEdCYXNlLVIgb3IgVVNY
R01JSS4NCg0KLSBHTUFDMiBpcyBjYW4gb25seSBiZSB1c2VkIHdpdGggYW4gZXh0ZXJuYWwgUEhZ
IG9yIFNGUCB1c2luZw0KICAxMDAwQmFzZS1YLCAyNTAwQmFzZS1YLCBTR01JSSwgNUdCYXNlLVIs
IDEwR0JhDQoNCkFjdHVhbGx5LCBpbnRlcm5hbCAyLjVHYkUgUEhZIGlzIGNvbm5lY3RlZCB0byBY
RklNQUMgdmlhIFhNR0lJLg0KQWNjb3JkaW5nIHRvIElFRUUgc3RkIDgwMi4zLTIwMTggc2VjdGlv
biA0Ni4xKHBhZ2UuMTg4KS4gWEdNSUkgcHJvdmlkZXMNCmZvciBmdWxsIGR1cGxleCBvcGVyYXRp
b24gb25seS4NCg0KPiA+IA0KPiA+IFRoZSBwYXJ0IHdoaWNoIGNhbm5vdCBkbyBoYWxmLWR1cGxl
eCBzaG91bGQgYmUgdGhlIHBhcnQgd2hpY2gNCj4gZGlzYWJsZXMNCj4gPiBoYWxmLWR1cGxleC4N
Cj4gDQo+IE5vdGUgdGhhdCBpZiB0aGUgUEhZIGlzIGRvaW5nIHJhdGUgYWRhcHRpb24gKHByZWZl
cmFibHkgaW4gYSBmb3JtDQo+IHRoYXQNCj4gaXQgY2FuIGNvbnRyb2wgdGhlIE1BQyB0cmFuc21p
c3Npb24gcmF0ZSksIHRoZW4gZXZlbiBpZiB0aGUgTUFDIGNhbid0DQo+IGRvIGhhbGYtZHVwbGV4
LCB0aGUgUEhZIGNhbiBzdGlsbCBkbyBoYWxmLWR1cGxleC4NCj4gDQo+IC0tIA0KPiBSTUsncyBQ
YXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hl
cy8NCj4gRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0
aXZpdHkgYXQgbGFzdCENCg0KWWVzLCB0aGlzIHBoeSBpcyBkb2luZyByYXRlIGFkYXB0aW9uLiBC
dXQganVzdCBsaWtlIHdoYXQgSSBzYWlkIGFib3ZlLA0KaXRzIHJhdGUgYWRhcHRpb24gbW9kdWxl
IGNhbid0IHN1cHBvcnQgQ1NNQS9DRC4NCg0KU2t5DQo=

