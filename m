Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E37AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uewp3Atuwr8dCyVijKRqsgT54Obv/rRnEX1SJ6yN98c=; b=XiXjbkSOurSb7ixqNi8FkNwEF2
	8YKxD/L30j/8UYUryfw3dERfet8HDaLmJQmGvXXbZ231yh1IejgDxnZhAe4LJMN4VIQiydRv0YZL8
	d/hrPydNjxKzBniu1kqSwpVbQ+7yZRZrw9ZmWD/wLoENOepEBfQ+xsji/EmK6tD/G3f4KRIlra2bm
	pbPgO6t0XbfrLlG+/ccUS7J26E3zpRKVsb/draqy3GKINoqeQ5zaa+F25eXplcOkSM7vg2xaEOl6i
	4N1Mb4YjntgweV+aoCKeDPr30kJNua3HVp09M2iI1p//udJnfQ84Fs8QHExW6VeLruE1dlsKTytEc
	iayCBBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQBU-002RSP-MP; Wed, 28 Dec 2022 06:45:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQAS-002R1C-JC; Wed, 28 Dec 2022 06:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=Uewp3Atuwr8dCyVijKRqsgT54Obv/rRnEX1SJ6yN98c=; b=TGdQFZXAKUlanWYSXSHKd8HVe6
	KLqM7n5V2vGOvplqJ+Aa9Xs3IvxmsunNP/bqoyisiyzfhI9zLRPs2LGB2gUczEkpuphw2TvJaaQYA
	kACRmAYekQepyhVGNKFmZvtNBYESIFvVKkhE7SirBxs3b9KUSGzClUdSk9tHw5u9VT2nCkXv0dKvZ
	YnCvG0V7RrgqGbcJn/4CKikbCoX9tc8Hnu5cKTQh5vxqD4k6SwMy2JSk+PCen09uf6IQ6SgTQ+eDy
	6/M85z0Mk8VCUF760mJUWBTuH1KiC+J2CNSy4OOwhddGV763KnBJG1nhG8k5fkp1YSxiFjVsAbOrT
	WEmjiJ0g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAQAJ-00Fukx-1k;
	Wed, 28 Dec 2022 06:43:55 +0000
X-UUID: 84a8aae978d7430e9be31a7f2520c9aa-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Uewp3Atuwr8dCyVijKRqsgT54Obv/rRnEX1SJ6yN98c=;
	b=chf0/xI8pvda//5w/huJHRrwIdgCcvo/k1aSJ+VNCXeZ4vxV7REjcta/F410M+fCb37xK3d5L2wIRxDBOG0n0blTqNOqUODehxSUNjye8cMQu8h4ww9gNaM1h1yLbfEX4f/xeArw76C2BRpMWkw7uT7GwCyjPOIDlnHixs8KT+4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:c23fc7dd-8ce4-4d84-b7f0-e5a462cf922a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:5a952af4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 84a8aae978d7430e9be31a7f2520c9aa-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1071284191; Tue, 27 Dec 2022 23:43:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 14:23:10 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 14:23:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3xWPJv2w8qPSaJfp2oxOJqvhe1y7xlASqv/1XI+xTHoMehCZhO2yPSVKbsMof1bfhw9swy0Pf+DxsmIt0xLjM6uyAt0vmVuSyUNIw2IhRCPTvAqjJD/8bsVbcwLZGIyG1IX73dIC7LoVmXFzj0UHD9IOtXOxf0qkq9bTK7tnxuHjh2NC+lfd+36zxfzsgX9I4E7MkCdq4OCWM8Pi6hXsnaBAjYkQJhW+/G+tPVTcFYR1PHdlkUkGHCzCpbsglCkocu918lGbO318a4KDl70mkrwF8Cv5bZAKIIXUNFiLIf7aDQ5b8l7sQB5f6/zl2fkUvXV7/K92HfLtF8cKpTwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uewp3Atuwr8dCyVijKRqsgT54Obv/rRnEX1SJ6yN98c=;
 b=gmImPX0havs8W1Y6RVSOuFQf37xY5q9D/4i42NfT+lSWnoDK4RaEhVJJQBZf4/Mtxevc9BDi5ipJP7EPT7fjXiYSBfWfjxbtTzgAKkcsQjhYrSV4baHOwaqTq85sUnh2NzND2FA/U5nTUp7NPvN7sZa3t7MYKjNv7mxwEK6CfKqNQp/zdejwAdBsYUA5QXS7NLczooOUXA4bl8cLJVdfzAO4AnxKzbV8MacA4VQbJ3Sncg0eqnwhaeKX5RYUgHJZ2ZgR7C6P4zWWwI5MmHHTqrBNULGWv+Obm0uQytshaT7nZ/Nwgy9ij+2jKVKgeSSL38tdeJSxXPlFayu3LQuLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uewp3Atuwr8dCyVijKRqsgT54Obv/rRnEX1SJ6yN98c=;
 b=Tvs3n1WR6UhBNKC0+kz2KlbYabBKGlQUMqOWgt45Ri1/GTzkxunyKQZfdt0SpCxG6y+LEfaJFTkQacitBbuNRJfP7tAyG20/wfCHZtjs6v3AYO3iZEfrahKYomWZFkzlabeA6gT334O37BFBwf1aWMugF4cU5ZHm+OB0mtJXxf0=
Received: from PS2PR03MB3877.apcprd03.prod.outlook.com (2603:1096:300:39::13)
 by KL1PR03MB6921.apcprd03.prod.outlook.com (2603:1096:820:bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 06:23:06 +0000
Received: from PS2PR03MB3877.apcprd03.prod.outlook.com
 ([fe80::6937:eb54:1588:eb56]) by PS2PR03MB3877.apcprd03.prod.outlook.com
 ([fe80::6937:eb54:1588:eb56%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 06:23:05 +0000
From: =?utf-8?B?QmlhbyBIdWFuZyAo6buE5b2qKQ==?= <Biao.Huang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "joabreu@synopsys.com"
	<joabreu@synopsys.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "alexandre.torgue@foss.st.com"
	<alexandre.torgue@foss.st.com>, "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>, "edumazet@google.com" <edumazet@google.com>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>
Subject: Re: [PATCH v5 2/2] arm64: dts: mt8195: Add Ethernet controller
Thread-Topic: [PATCH v5 2/2] arm64: dts: mt8195: Add Ethernet controller
Thread-Index: AQHZFnEj0/EaWOPbYkOR3i4YitclJq57M++AgAeo3IA=
Date: Wed, 28 Dec 2022 06:23:05 +0000
Message-ID: <be254cc7a21c2ccd91230c085e9180cd0684ef94.camel@mediatek.com>
References: <20221223015029.24978-1-biao.huang@mediatek.com>
	 <20221223015029.24978-3-biao.huang@mediatek.com>
	 <d7c50228-5d4e-8c73-28b3-4950917708a0@collabora.com>
In-Reply-To: <d7c50228-5d4e-8c73-28b3-4950917708a0@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS2PR03MB3877:EE_|KL1PR03MB6921:EE_
x-ms-office365-filtering-correlation-id: 31547b73-5976-406f-8e90-08dae89bfaef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EZJCILFTl8PK7lSZI7KLHDiqY15lbkOdzh7mKSBKXQetzVX/FZgmtuANjQUgs8UDmvRt18WATYD8sYIIgUkkmIi9/bQEcGvb9otn2q5IHEsjFonaXyhTrvgowsH7AE64lzfOhbEvzMHaBrq4aDG6g4ctYvviuwD8RwEb+9ihExw7APs+YYdiHhPeU5BY7cA9P6gBzD06aDkFsoCElauC/OAxyQcl78RdlDyoNQMx8Rcx96MidloPOjoy9m6G367NS/okxNcGgb77VIm0Eh7zFLcgmKXi7f3sWieWbhL3gtKBBgl7r75Pa1DdFGp0mKcsiz0AJrsaMuC1dS/5pWcnwV9eWNyBkTKBJ71XPmAp+p4/awIk2bejP1Ld5iPIZ09TB4S8GaMdeCGXpG3/Ik6UXkyR0F2t2oGWTYVe0QMWrfZ8fLCa4+9eZ25Gn0ozI9SpI2XCRUYJLeRIykqoYTTAiITcH2IyukAUiUorgOh3k2XDoHC1ewciVvDpF7G9ANnGVqT+ou8YMGer51LV/RgEAsCH/1FgplUDew0M4pI3sJWSzulA3sdVChN8D4HpbQ6dDRhMqqmLO583V4p3KebS0j0p6LyhMmQ/fxTE5Qm4PxSaw93AhWcB8xFH80kNmvlV4QlXvoUaboTjG+RvoFF/ScZtkn6+QSlPzJh9Cws3zLhdg7x8UdEYzFYQb49GmsHVhrMjek95x/t/e2sW+m+6avD/2ZV+FOlTtf63oRVmtnoNXqwI6Wk3Qw/CL9dMaDDv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2PR03MB3877.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199015)(6506007)(122000001)(38070700005)(91956017)(5660300002)(186003)(26005)(6512007)(38100700002)(2906002)(316002)(7416002)(558084003)(4001150100001)(110136005)(54906003)(478600001)(85182001)(36756003)(6486002)(86362001)(71200400001)(41300700001)(8676002)(64756008)(4326008)(8936002)(2616005)(66446008)(66946007)(66476007)(66556008)(76116006)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3BLL3JRbHR4UnBRTmRjSG9pTXNzN1hYbjhHZlAxREJqeWtXTWx1MzRXaTND?=
 =?utf-8?B?RkE5L1hza1ZOYk1Oczh0dVIyVXhNS0RseUpQT3RNWEVwbVNyMFp6R24waXB6?=
 =?utf-8?B?WTNuUEI0YzhPTG1zejgwS1dnRFlSNk5iRnZsVEZ5eXRwbkphU3NWQXFia0dM?=
 =?utf-8?B?SVJra242Uk1PRklDK1hRYnVyOXRlZ3h5R29hL1Y1OWtLdFVXTXlZRGlNN0tz?=
 =?utf-8?B?YW92czY1Y1djdXVQaWJaemNjdEQ1L05OVStpdVpBLzNHT1orWStZR3BRa05O?=
 =?utf-8?B?QlllVUxkdk5SUUlTZ2s1ZHUyUjBYem1UK0ZPanl2MVdBbEEyNURJaVNGcGN3?=
 =?utf-8?B?WjZaMjRhN0I5alhCVVIxcmxISXc1dkYraHZCbnBMYVN6MzdtWURRbXRQd2kx?=
 =?utf-8?B?TUtzZ2ZIak5FeGIxd3EvS29sSWN5VEViUnhGc0VMNFltTUs4R1pWOEhOR1ph?=
 =?utf-8?B?TUE2blgzMDlONEdvemNJWGVqWnFhbXAzR3lVaHRJT3VKQzFsRkd6YUNiMjYx?=
 =?utf-8?B?RVJUTDdSL3pYYkVrd0lDdjVYWmE4T2p5YWhHK3VZUzlXZHc1Ynl6TDJzZmdJ?=
 =?utf-8?B?VWdCS0xPZGRQeFVIOEhMWThSbEtRWFdjbTVJZk1yQk40WGJ0Qk1iY3p2b0Yw?=
 =?utf-8?B?a255cS9ORVF2TnZLOWhjMkY1N01HWjlWQVhUUVphM2xLM0R4TStMdFh2Ynho?=
 =?utf-8?B?eWg1UTdzSlIrb2NvYUNYQW16V1pzRnlSTGZPb0FOS3YzU1p3bXEvZ1JUeWdM?=
 =?utf-8?B?amZBZmJBTld1V1hQY2Y4K0JxN0VBdGp0b3VLTkRvWW9XcXI3NENSNEVYeEJQ?=
 =?utf-8?B?TXpVeDJQTk12YnFrcjdwQlBOTFllS0hERCt6QlIrd2x0ZkM2Q3I4Z2ZjUWo1?=
 =?utf-8?B?bkpVdW5xMDNlRGJ5QVN3Z3lIZHd5ZkpTSE5oMW5ZYmFDRXFqaGZlQUtlaGZr?=
 =?utf-8?B?ME5Hc3NDRmFpZnVveUZkN1ErcjFvU3MwdDFWQkMrSEhqVjZEOEZON0FWNVE5?=
 =?utf-8?B?NW5wWWNYVTIwcnZlcXJJTENlVDh4Z2xqY0U5NmRhQkZja1IzYWNSLytVd0pj?=
 =?utf-8?B?UnZpbmdadnBiYkNtSE16eU1HalE5K2IxQTNTaDllNjZFbGVCTTArOVQ1bTd1?=
 =?utf-8?B?V3Y1Z2Via2k5cW1NdVJiYXdaai9Ja1hhWTlFU2kwRDlneFNnY2pqZXlPMmV6?=
 =?utf-8?B?b21HelczRXZDU09tQUJPRWVFSHk2TUZQTnJ2eWpqaE1JSm03aFNHSXVoTU54?=
 =?utf-8?B?L3lDTnAzWnhZV2JIUWN5eTBjZWpKTDRXd1hQWUpPMTdQVVJENyt3eDlKdFg1?=
 =?utf-8?B?N0dOWjl0QVZKT2o1WlNKMyt0UzJZTDJuU2hZWU1iazN4VSsxUFBLVTVnV3Ra?=
 =?utf-8?B?U1pNdEM4K3ZySkJQOFhrOUcyUG5GWTRqU29NYTltMW1hdGpGcDlvVUF6bTBX?=
 =?utf-8?B?Szkxc1prYThQYnRLMThYUzhWOGhMMnZUUysxc1NmbDJscG95UG9lUmh1bkRh?=
 =?utf-8?B?ZzZoUDd1QXBaOWE3UjlxN0hPSGF5VG5BSFFsbk1ZekdTaldCZlZiUlhBUU5z?=
 =?utf-8?B?Q3F5by9PL3lZb2pBYlFEV3hmVnpuMGw1VDlVL2w1bXBJNWQ0bEVsQVpWY0wx?=
 =?utf-8?B?aE5jSXcxRlFKZ2VRQ1lDamUrNEhlZHBncnZBbzlGWU4zQyt6enBjZDR2cFhD?=
 =?utf-8?B?RmFZN1RuOVU2b2lsSkV4YzJPL1Z6L1ZiV3Q2dWZ1Q0pselhLaXhld21EaU9M?=
 =?utf-8?B?VXhDM2tmMzBSLzlwazd2RURsTXB0SDd6cmZDMExyZWQrak5aYWlsc1I0MjRp?=
 =?utf-8?B?cFM2cW9QR0RpNnFLRUxoemUvL2FseXBvbURGcGQwK2xUZFhxWEtlY0hjYVNQ?=
 =?utf-8?B?bVh4SngybVNINTd1NTUwYTBweFZxWXl1NFFCTlQrOGRvWFNtQzZmdlgzVm82?=
 =?utf-8?B?VnozdjkzK1M2cUVFKzhYRityNDU4UzdhS1pUaFhxei9uNDlySVE4RW1PUzhY?=
 =?utf-8?B?ajJYN1djaklHbDV4b3NQenpROUZHZHAwUEo3TjdKb2ErdkNnNzloOTBJZnZo?=
 =?utf-8?B?NURPcG93YWdXN01aRGptN0hDcER5VHYzbGFBSmtOakpWYVp0QkIxT3loNWh5?=
 =?utf-8?B?Uzg2RFYvUXlkNXNoTGZ0UDJSVTVmZDR6WUo2bE5ubXhReVU4U0UyZ3V0RDNY?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <930E71C9B2792F438FF80F63A1E74863@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR03MB3877.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31547b73-5976-406f-8e90-08dae89bfaef
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 06:23:05.3300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJzqgicYCq5KgzBX4qke5onBIi0R+6pIx8OsN8poDRu47+RkPXHkoIe0cHjWXZq8lg9ru4sV4NyrLZfdofgksQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_064352_815706_07BFE125 
X-CRM114-Status: UNSURE (   5.72  )
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

RGVhciBBbmdlbG8sDQoJVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzfg0KDQpPbiBGcmksIDIwMjIt
MTItMjMgYXQgMTA6MjQgKzAxMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0K
PiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQpXaWxsIGFkZCBpbiBuZXh0IHNlbmQuDQoN
CkJlc3QgUmVnYXJkcyENCkJpYW8NCg==

