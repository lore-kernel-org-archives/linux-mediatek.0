Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633FDC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 00:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvNcxj7iBBK6H20QlpyvF2/xdbN9/4nI9HM9GKoKiiQ=; b=d/lB8yUb5XqZRaqh+ds3JM8VC2
	k0+svZc/6aiV/nbtcQKyHDyYluLTfaPVwxsakZEIzMCAHRPwDobTkYq7KRFXmPxT/isq3YGn+4J9J
	hkoEnamXHEkexHk0VReuKvbLDgXD/8djYKEMnuuUC3qwZjQkGcp6gNdltsl/D52jBQMJXmeFQV4l0
	Oi9hGhOAWoWjf2Pjv2yrp5lLi0Ja3R+Fu90isP7ei2K0BdD5rXBIUva/2nhhBiGOJKxmIUtdF1kCy
	kna/Qp8IayfOqUSSiTkqDO/dBYsaNo6ugPV+wrTzRzg0l4SJ9fzcCk8azRfBdJvB6smAlHW//s4qh
	zF31eUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAh10-009wnI-CK; Thu, 29 Dec 2022 00:43:22 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAh0m-009wee-QF; Thu, 29 Dec 2022 00:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=gvNcxj7iBBK6H20QlpyvF2/xdbN9/4nI9HM9GKoKiiQ=; b=gIBgKHTU0ajv+lovZ3TAvyJGBw
	Fupy4KY4pwXHNejFyOz3bez0un0qcON2Ewz2iMCK5nWScsYyjoZbDMQoTPwIfGGt3OugjeyHpGlkh
	7AssmRuUin4urN+tcxkDgQRlou7HFw9HAoKnZLLxhIl0gUjT5mXbO53kCb4zBZu/iltOapfpBPG0j
	NLjwDkxiaQSzwMlmFbiDmnltNpJHEKzGufJI3L1SRhrYKF2eeXs2kpk74zOnKFRTrKTUSGeaG729B
	4dZz3QCtKAcMoTxGGPE2FN3+VaAZ4E4D0VQQO2WJbd9iPBqLSpT55go7BfaGipoHiehVqie6Ab73j
	ksYYq8fA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAh0d-00GAZU-1Y;
	Thu, 29 Dec 2022 00:43:04 +0000
X-UUID: 82f8d44329d0442cb79b50f17d6ee4d3-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gvNcxj7iBBK6H20QlpyvF2/xdbN9/4nI9HM9GKoKiiQ=;
	b=J+s1z2W1YNgbXI5cwnIR445UN+QMinx6oiekWWX+DXllzj/ZTWMeTD632VfmciIftxQQLuu9SB2znauu3Xj0oit5vPAJKbLkyUlB40WU6nuhAfCUrVHyfSn9oxRfJhg231f7NhjwVoAK8F0+zQaG1LABxETk3fEIx3hmmsvfkY4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:71784798-8ac6-4534-9462-89c9638e6cf7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:db6bac8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 82f8d44329d0442cb79b50f17d6ee4d3-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 584867124; Wed, 28 Dec 2022 17:42:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 29 Dec 2022 08:42:02 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 08:42:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVYYooAslqoZ+y1PXES9Bye7DyD8Q6kt38bh1QnkG5bSwzr30urPribukIPslawNIv+L2mJ2zbeDviD+RwTiFQXv5XyTI5cFqfqzyyJFXKYTG9yZZ5DCQbLUyAgNhR7faqMVcNmJ+cnK30W4mvL6fVrEMtT3PRde0fzQJLcCvOF8uIl+F6o6MJag504UNlvNieeJRx7B37lyzJ76zrhYQFu11xQiJXj/oI77w8GSX5TRe8qxv/L/ydDHrvP2Ku/ogCIsNcE0COllNoWaBId9Ty1Qf4bkpAUKXDE4TZUfXeKkX7Ak7Ybb3b4htFlQOEw/KudIvyUnSTa3MaQmLwNb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvNcxj7iBBK6H20QlpyvF2/xdbN9/4nI9HM9GKoKiiQ=;
 b=QxkZW/GEHryT6MF09YXotEMdq4cvMaH0PRoJ6/7IoznydFIcxZkG+cWgd8FTQTiV8jCrkYSmDqhF8Jcj/oG9orBsNc94MZPCNd3OzjUK4sdK3v/zVmJZNOjPBzLWw3uDz5yqpantKGPQaxO4IyO8fzEmki2oFSKqU/3UTrarIh/7cQ70hmbN5OOCJU6vX6uz60mkw4Bc2S108XyEZC/b8kbarrdB+8GXJN659x1HwmLWtoNir3xelYHVvGSxW5oB9ggpjtvKktCRxnj0O0XGeqD6grduR425esAofySbRCDAWG0BfvTEwnH0haGWDs4NDr6j0Y4q7PXvNJhwPYFpJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvNcxj7iBBK6H20QlpyvF2/xdbN9/4nI9HM9GKoKiiQ=;
 b=lqCO2tiw5eJqtSaXd95X0POx9HY6AbcH4jMh02xfojg3pEG+tHxT8s+vPgf11WJWqoXWohP6sBzE/7PHUfWPQyUE0Rg9Tb4sk1hJNYxvVxKnN6WXHvxruIX/PduT7Cs8KHj1ig6LM12DBkF7O1FxWAWPpFIUP8/EIW3HLFZDDkA=
Received: from PS2PR03MB3877.apcprd03.prod.outlook.com (2603:1096:300:39::13)
 by SI2PR03MB5209.apcprd03.prod.outlook.com (2603:1096:4:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 00:42:00 +0000
Received: from PS2PR03MB3877.apcprd03.prod.outlook.com
 ([fe80::6937:eb54:1588:eb56]) by PS2PR03MB3877.apcprd03.prod.outlook.com
 ([fe80::6937:eb54:1588:eb56%6]) with mapi id 15.20.5944.018; Thu, 29 Dec 2022
 00:42:00 +0000
From: =?utf-8?B?QmlhbyBIdWFuZyAo6buE5b2qKQ==?= <Biao.Huang@mediatek.com>
To: "andrew@lunn.ch" <andrew@lunn.ch>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "peppe.cavallaro@st.com"
	<peppe.cavallaro@st.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kuba@kernel.org"
	<kuba@kernel.org>, "edumazet@google.com" <edumazet@google.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "richardcochran@gmail.com" <richardcochran@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	=?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: mt8195: Add Ethernet controller
Thread-Topic: [PATCH v6 2/2] arm64: dts: mt8195: Add Ethernet controller
Thread-Index: AQHZGoaQLWNCbcEVOESuvZ0VXpAHRK6DeaUAgACOA4A=
Date: Thu, 29 Dec 2022 00:42:00 +0000
Message-ID: <a3959ffb49cd8ab2f3b0fad5149c222b08fc2032.camel@mediatek.com>
References: <20221228063331.10756-1-biao.huang@mediatek.com>
	 <20221228063331.10756-3-biao.huang@mediatek.com> <Y6xrNAyvJhP22RdF@lunn.ch>
In-Reply-To: <Y6xrNAyvJhP22RdF@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS2PR03MB3877:EE_|SI2PR03MB5209:EE_
x-ms-office365-filtering-correlation-id: 4ec1a898-ec56-401b-bf36-08dae9357f3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5eMVzlCWYF9Tcvxoo/2NJYPe6RuGf4KR6tSYVitzjv6gqlNiMOIFw2/dYWw5vOXoktxdWGuFduEaSunzmBG3BM5ILDIx/cE1ar5sqkt30r09m3YMEZmXd86jzwGjEGeuPb6Ggk3Mmq6wMUQfAWew3nVOOS2GZ1gR6U6ycTJ9JHK00kZgsHlgE3YkXh3gMfEAFAjwaREFKeupDLgNzK2o9N0//E6pMoVs7mnm8kIUzSd6tcl0lbD+Bdj7mLfdspx/7BDH0xzIWzC1rIdRQk9BkOJcYcIGxMNKeQkJgGNEnfBbAUwcJ074LEVLwcNEzEqm13i13/G8XVTBt5bGfrhPA2njiKsq4cL9Q/BqGV2VzlQipXj3TgnyXXHEnSivX9HPex3cGfQ1RJIbTit/DXnyPtqdWa+NwS6w3WN5r2nF+yiRu5IQzm/Lxfb4TdtwuFiSHULsovNXX34jc+F5zEYJWCBp2hxY372mTk/aNXoXYI1RnNB74ymTu/HGi168OgtUEPM8MldQEgAlTo+7nAf1Ess2T9pvDMV4KT+3oWhq6Wke7pibNPZjLjC1dDfX8ebWZWquOv6hCCnwxJ7hyGZ98GEd590ueunycxepOlMxhkpIvIF8zQ9uj/gsi/+wNDu8U44uvpJGvDfS7Zwi6dNhsJgr73jiSygrWucIdOkUT2KkYagAxT2+QsXKO21M+F8M
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2PR03MB3877.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199015)(71200400001)(6486002)(85182001)(478600001)(122000001)(38070700005)(86362001)(186003)(26005)(6512007)(6506007)(2616005)(38100700002)(41300700001)(36756003)(91956017)(5660300002)(76116006)(8676002)(7416002)(4326008)(66556008)(66476007)(66946007)(66446008)(64756008)(8936002)(6916009)(2906002)(54906003)(4001150100001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?am5lTFhzWG8xaVNhL2hVYWxXSVZKTHNLbHF0N1JramF3V3hSdTNMUzg2cERW?=
 =?utf-8?B?VFFzcjNZV2hNQUNwdndvTjZYV1g3cmNMa1RGMUdwOG85bDBJWVZhMTgxK0I5?=
 =?utf-8?B?S1FLdmZZU2k5Z0JBeEhndlBiamI3Rys5OFczMmlFTGxnRVZ2ZTV1M0pWSnE5?=
 =?utf-8?B?UTdBR05YYkJJYkM5UE1wWFpTeTdDUkk2bGw1VVRzQ0lsdk9DWGhrb0VSMHU5?=
 =?utf-8?B?Y3dvcDZYN29PdGxLbVZoQzNaaXFPQndZWjBtRmx4ZGQ2VENkdUpHV3UwY2Ey?=
 =?utf-8?B?cDZLMnFCbkdUM0JaMnNHR3BzVU85OVUzVHU3TUhlOHBNMm03MHZKWERpdVh2?=
 =?utf-8?B?RlhBeEFvSGlnbVFiQkJEWm1CT1VBZFNpb1R4aEZBQ1M2K3FDZXc3STBIZ1Rw?=
 =?utf-8?B?d2Z0TkFRaTN6b3VRNzVGWHhnVXE5QjlaUk1NK2FFalcyeXV3bTNsM3hPcGdy?=
 =?utf-8?B?dFJjZTFWRWxPY0gzVm4vWndWVVNLOCs4VW9FVE0xa1JpQldzYWlHRlpMWWRK?=
 =?utf-8?B?MXpMNFVyVjRweTJBdU1QSFAvdk5aNFpTR09QaXhoZzlBU3I0cjBiN1pPRW5a?=
 =?utf-8?B?ZjQ4R0svaFZZWmJsRDdmMkhNWTA0RjVoRGRqZTBhRkc2U1FQaFcwd2RkMnRh?=
 =?utf-8?B?RnVvR3lUU24rVGJEeWQ2bUdyd3d1Qk9XWnZRVmRBV2Z6bG43SFRVVzNsZEhD?=
 =?utf-8?B?SllReUN4elYxMGdHS2Q2ZlB5cVo4eWhHTVBoandaWEVjaTh6MVNwZGQ1NndI?=
 =?utf-8?B?M2xNUGlybUIxTXNoK3pSK3BoNVFSSkdLYVNhMGlQOUpEZkpqVTNqV2J5L1ZC?=
 =?utf-8?B?aENYSmlITUp6OERodVhqdi94YmxYSkFwWC96UklSOTd3bGVGVy9GNDJJWXR6?=
 =?utf-8?B?c1ZRenlzZ0YwZjBwOFoxRUxtWWk1UlR4VXFDTVVVWTZ2OUNwdkxvS1pCQWdR?=
 =?utf-8?B?NSt2bmxYN3RSM0dON3BDRll4NmgwaGIveitBTmkyMHVLa0xmRW9hRHBhc2VK?=
 =?utf-8?B?UjdvTml0OHppcGZTQUFqbTRuUk9XT0tDL0krSjF0M0ZtUk1wSStEaTRCNGdP?=
 =?utf-8?B?M1NyMFRaWGt3ZXZMMnFrVXBPb1pSK1VEM0FPZGltQlRXMHVIUmpTajQrdDNn?=
 =?utf-8?B?VHdvK3krelNPUzdJdTY0RUhoVjljR0d6aUVLSXlzWWRrMU56U1hiNTE2NnpE?=
 =?utf-8?B?K2VCdldUanR0Q085L3ppUFdlVFFvMmdlRUFuR1JyTmtYaDN1cnU2TDBpQnlO?=
 =?utf-8?B?VE45L0ZrTWpSaVd4WXY0VlpCQzBweDF5WlRoMWlMRTVIRHZSOHc0a2Zoc1ly?=
 =?utf-8?B?RnJLcW5rcE5JbGpNN0t1Q3dxTExxcVBSUDdRbjFsaUM5aFpaeHI0aGo4bjRX?=
 =?utf-8?B?UktlazdmVXFNVXlTSnhkVUtMeXlSUWNoaVhDVFMzS1FSQnRsSmROai9TdGk5?=
 =?utf-8?B?aWN5MzIrMkcwYW04enJZVjArOUk3TjRpbkxiVVRRWkt4d1oyK281UU9IbW1s?=
 =?utf-8?B?ekxpaEJkaWNCM2dVSzFBa3Bub3JVRlhBVzZBVmIxKzBmMkxHamdzWGZmY1JZ?=
 =?utf-8?B?TUxnamg2czlIcTFXcXZMQ2MzMGVVQkQwU3EvVlFzemRrVFBMRG9DSlllK0VS?=
 =?utf-8?B?M0MyVkU1NHliQUt4Wm5SQndQYm83YWlEbng4MWFoelc3NDN1YWhQQWxDQXRH?=
 =?utf-8?B?L1NjL0NGeTdJMkVkRHVXejFtVzdPY2F1bS9MejFHS0RoL0RodG0rREFMeFg0?=
 =?utf-8?B?bm1MWm5kWHhOS01KVTQ0Sjc3dElCampwWjhYNGw0VkhhcE90ZG8ySGpoWnJ1?=
 =?utf-8?B?OTV4M20xYWkwR2IxSU5MUlpUS1NxMzhJbXlJMUc1aFBGTzVicDFYOENIQlFX?=
 =?utf-8?B?QllCY3IrMWdjT1RoaVljcXBPTWszUzkwbU56SDJPbWtnUXp0VE52L0FuZFhI?=
 =?utf-8?B?RlVDeU5jUjFMenJwR05obkVmekdYYnIwZk5qRFpHcndBOC9ZMm1TNU1rQ3Yy?=
 =?utf-8?B?VVBKTzhTR0xtOTB6cThFR3RUYnJDTk1hMllYQWFENDhaaUcvbnA4b3FnRktm?=
 =?utf-8?B?UFF2dHFhaWNxczA0YUxMQjV3aGhUL2xXVDNucytsa3NBVm45akMxYzhSNzYy?=
 =?utf-8?B?TW9oR2pTYVlyQjF6S3ZDVStaK2REbWNxWEZMU0oxWUdHeCtuQXhMemNCTGE0?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <400BBAFF21A9E84E8CF6FABED7F57E97@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR03MB3877.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec1a898-ec56-401b-bf36-08dae9357f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 00:42:00.3260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PhQ3kheS5PHHZsVdK/hVFVs5c69c01gXLhV/C2R58TfBsj3TkWL3qoozGd4EIF87Cnf/LGyvAJEgKs2xKiCqrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_004301_573890_1017B473 
X-CRM114-Status: GOOD (  14.97  )
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

T24gV2VkLCAyMDIyLTEyLTI4IGF0IDE3OjEzICswMTAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS1kZW1vLmR0cw0KPiA+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRzDQo+ID4g
QEAgLTI1OCw2ICsyNTgsNjYgQEAgJm10NjM1OV92c3JhbV9vdGhlcnNfbGRvX3JlZyB7DQo+ID4g
IH07DQo+ID4gIA0KPiA+ICsmZXRoIHsNCj4gPiArCXBoeS1tb2RlID0icmdtaWktaWQiOw0KPiA+
ICsJcGh5LWhhbmRsZSA9IDwmZXRoZXJuZXRfcGh5MD47DQo+ID4gKwlzbnBzLHJlc2V0LWdwaW8g
PSA8JnBpbyA5MyBHUElPX0FDVElWRV9ISUdIPjsNCj4gPiArCXNucHMscmVzZXQtZGVsYXlzLXVz
ID0gPDAgMTAwMDAgMTAwMDA+Ow0KPiA+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNs
ZWVwIjsNCj4gPiArCXBpbmN0cmwtMCA9IDwmZXRoX2RlZmF1bHRfcGlucz47DQo+ID4gKwlwaW5j
dHJsLTEgPSA8JmV0aF9zbGVlcF9waW5zPjsNCj4gPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gPiAr
DQo+ID4gKwltZGlvIHsNCj4gPiArCQljb21wYXRpYmxlID0gInNucHMsZHdtYWMtbWRpbyI7DQo+
ID4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKwkJI3NpemUtY2VsbHMgPSA8MD47DQo+
IA0KPiBUaGUgbWRpbyBidXMgbWFzdGVyIGlzIGEgcHJvcGVydHkgb2YgdGhlIFNvQywgbm90IHRo
ZSBib2FyZC4gU28gaQ0KPiB3b3VsZCBleHBlY3QgaXQgYmUgaW4gdGhlIC5kdHNpIGZpbGUuDQpP
Sywgd2lsbCBtb3ZlIG1kaW8gdG8gLmR0c2kuDQo+IA0KPiA+ICsJCWV0aGVybmV0X3BoeTA6IGV0
aGVybmV0LXBoeUAxIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWQwMDFj
LmM5MTYiOw0KPiA+ICsJCQlyZWcgPSA8MHgxPjsNCj4gPiArCQl9Ow0KPiANCj4gSXMgdGhlIFBI
WSBpbnRlZ3JhdGVkIGludG8gdGhlIFNvQywgb3Igb24gdGhlIGJvYXJkPw0KVGhlIFBIWSBpcyBv
biB0aGUgYm9hcmQsIGFuIGV4dGVybmFsIGRldmljZSBhcyB0byBTb0MuDQo+IA0KPiBZb3UgYWxz
byBkb24ndCBuZWVkIHRoZSBjb21wYXRpYmxlLCBpZiB0aGUgUEhZIGNvcnJlY3RseSBpbXBsZW1l
bnRzDQo+IHRoZSBJRCByZWdpc3RlcnMuDQpCdXQgd2l0aG91dCB0aGUgY29tcGF0aWJsZSwgaXQg
c2VlbXMgUEhZIGRyaXZlciB3aWxsIG5vdCBiZSBhdHRhY2hlZC4NCkhvdyBzaG91bGQgSSBkbz8g
VGhhbmtzIGluIGFkdmFuY2UuDQo+IA0KPiAgICBBbmRyZXcNCkJlc3QgUmVnYXJkcyENCkJpYW8N
Cg==

