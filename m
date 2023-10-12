Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327C8CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5fRjRtO5F5L5P9Lx6Fha0h8vce0HZUs9GtNkhww5hc=; b=E5BHX4HsQ9Oh5pD7q45uWhOitR
	XeLW4cNC2aURWvg8PKTD0ldQCfm9gwRMrjhtlj3YnDA8JvnkysU0Sf4kE0FHNFNuROd4okMD4veha
	GjtZRpd6M6UDsQxVCkUQCRwXk8T/hFPVtVIn/zvk/SJLxUEKTdCBEzjgdoMDJkJbQSLx1pF1slaWx
	n4RN9ZI32KIVCdhSvCYtA7OIv0H1hC3yhbC1MsRWAfdngwbQgBLkhfHIllZ+2p9m0kfx/ltbQ1OZA
	Ea3RfPK3N2jIyvhX9lYKALE39SNxV23aTKG1ZHB+OJguQXCWDU403im9geGty8kkXT+Kadnz2KSuQ
	eBQQj5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtfj-000lBo-1Q;
	Thu, 12 Oct 2023 11:16:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtfg-000lB4-29;
	Thu, 12 Oct 2023 11:16:05 +0000
X-UUID: b7a7e86e68f011ee86758d4a7c00f3a0-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=d5fRjRtO5F5L5P9Lx6Fha0h8vce0HZUs9GtNkhww5hc=;
	b=hXNZMKf/lyiTjJ6jh20Ech5N111zVWr81uhtbPWBOamollRdTZR1aXhYBA/Hu3SsC74tEHBF8upGxidWwMVq/cv/8+cJW/7+7U4xNo1D5IGOmoduVDdJthWdCMR5HPS8LofBAZh9/DtNRVa52/ODWFs3kIAaVMgRfQIFvnlP67s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:4b102ff2-92b4-4c49-b8ba-80cb8f874d62,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:58d4f414-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b7a7e86e68f011ee86758d4a7c00f3a0-20231012
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 452995707; Thu, 12 Oct 2023 04:15:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 19:15:20 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 19:15:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO9g04GaIpU8YS5B/nE7DUgTUOkIGt2+vAzVDAy+yNVFFAhx/4ittqS8TpH5SSZ4a5obsU70Q4pcGC/rhIouOFPYt5ihW/FuoGnFeyKctcJx2DS8ZulDckXURuID4FMv+c8YLf2H31FS5ssSIn9CZ+9nGJICHm+iALE6KFY3IYzmUW1XCN40G4RXQOzIro8ZVx2mOX4vfN4DRXnItYXqpL0gx4XyQEmYzrkzn2h9GNso6ffL9aapQejzr+kZBiylM4+KbxPBBRYmeKkfbvDLw8b9/tPk2vGwQAWLE0qXdidsICdMH7JJyoiSeDnkFrwCGLSdx4WPrYNPsqBZxYBr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5fRjRtO5F5L5P9Lx6Fha0h8vce0HZUs9GtNkhww5hc=;
 b=fwWeLaW78JEw/0x+4Oi01Jmx+B74ioXrtIzC/TSICxKNEYzjukqbca4yH37xWHCD2Q8tfRX+j8F8egWMHMtWGDREkkCcnkcQltbrzsZjv5doDqvXmC8n9ldItO2mdF6ix0eADeOph4I5R7HtlFxbIwuuu86XDwoTMIHTfJzca+UILQa86v9ojfj1VPMROK91WJRrLMZUCRfzaWocFvZORZm/zBJFpX4JRE37aWPPKeJpeAMMrqkP34GQTdTgycHwDlKRw+MjKpMR9dEjBcNt5wRtkBd4lXm6xc/S2wz2DD4u0aueBJFV9VfDAk/XfC+rCE4gxEHiEJcCSpSv3qi00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5fRjRtO5F5L5P9Lx6Fha0h8vce0HZUs9GtNkhww5hc=;
 b=ItKDSUoNukrjwuWrY3wKA5Fk+QCQqvPDmE40ySfl10/etvnQAnBmWZlGjoHfR6QWXxtYRO3iCIqHcKPIknYfO7l8s1yANec9by1ij4TesUVFZSDaRekFB6pBcbXkEkYzQtdyAQ6Ehmgi5M7mnpudaVXGL4bqTTFPD0XLOpsAtyo=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Thu, 12 Oct 2023 11:15:18 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::363a:e9b4:c6c7:48ef]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::363a:e9b4:c6c7:48ef%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:15:18 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "jkardatzke@google.com"
	<jkardatzke@google.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"jstultz@google.com" <jstultz@google.com>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "christian.koenig@amd.com"
	<christian.koenig@amd.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	=?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
	<Jianjiao.Zeng@mediatek.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?=
	<kuohong.wang@mediatek.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"krzysztof.kozlow.ski+dt@linaro.org" <krzysztof.kozlow.ski+dt@linaro.org>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "benjamin.gaignard@collabora.com"
	<benjamin.gaignard@collabora.com>, "tjmercier@google.com"
	<tjmercier@google.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Topic: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Index: AQHZ5FgxjegLVruM7kG7VRoFLocLPrAVxRkAgADzaICAACUMgIAAHWgAgABe8QCACRiEgIACUqGAgCMkPoCAAAOoAIAARSCA
Date: Thu, 12 Oct 2023 11:15:18 +0000
Message-ID: <abefcc1c7e6143f1d8ff6b23d937056f34990359.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
	 <20230911023038.30649-9-yong.wu@mediatek.com>
	 <20230911154448.GA1279317-robh@kernel.org>
	 <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
	 <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
	 <95f9dd3b-1f33-4af5-8757-a97e8b9bb216@arm.com>
	 <20230912155338.GA842444-robh@kernel.org>
	 <a63ab61fbf4d2bdadeb68441050ff5187c93ba96.camel@mediatek.com>
	 <CA+ddPcPFFpDA2qtxMg6BNztsXi3mVFRghBwe6556mAL54jB06g@mail.gmail.com>
	 <8dbdb1e3e18cc290c8949947245b3c1eda83b6a3.camel@mediatek.com>
	 <ac137ec0-3d52-4434-a8bc-91b250f28098@linaro.org>
In-Reply-To: <ac137ec0-3d52-4434-a8bc-91b250f28098@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYZPR03MB5760:EE_
x-ms-office365-filtering-correlation-id: f6c139d2-04b6-46ca-ccb0-08dbcb14844d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dc5mIb86vbFGbhniQ2VwuFh+zZHrBxXSIhVJsB91VRCVCA6PlcDtj+8G1SsC3Wmi4wpmKr08VmUZUw9rgUIFcCFZxV424yx3Rl5ufEw+JLx/Vs1adbqvuqOH/TKHEaS6953HynFbm/jigz53mFPDhHHSsLwFkCay/xYt/A29cMHBLNRqJqcc90EjBj1tR5J/z13Tcsot0yl8h191TE29zQeeXiVjXxcb/y5pCTrNS6FH1FjzfaW9WhkEjd4rKdah3yoAs42YHm3V0Gjqnz2SzZXiSdILKDxPE9UleyjIsWQ3I2tQrUdCyfdWr1QLIAjNO7491R4VSUwsZUwdkmj9kHqXiXb4JJhHWvEWTTZhT8RTixM0Y/OVHZIt2nk1j7qAOkuRBW0I8JNCi/y3+YP2L6fM6Z/dEvF7P0bM5vphwF9O+Ssf4tUokhblBlV5RpVKj0hwsczmhptbW/0YlvKWtKUp0EiuYaVNY/8OK1yoqeYcl9c3KKaD90kZyrgSLt14o8S2+8qAvi5U62nlOOKOxGvrcLpxlynCl+D3wY1AfWYZstizyz/RtN7lZ9G9rd4ROSiZ5yaXvL3nVFSdjFVx8OO5sndhjnRBR+dhCHTdNCwVKAn3Hq1oCVlpdTHPkrIU8j/zKqcxUKhnZcQH54N4wTlIyIDiTfA/dhajdVCbgkg/3sjWP1vAVyCk+he4AbJX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(36756003)(83380400001)(85182001)(54906003)(478600001)(6512007)(53546011)(71200400001)(66556008)(66476007)(316002)(38100700002)(6486002)(76116006)(66946007)(66446008)(64756008)(2616005)(26005)(110136005)(41300700001)(4326008)(8936002)(8676002)(122000001)(5660300002)(38070700005)(4744005)(2906002)(4001150100001)(86362001)(7416002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akFtaHFBdXlzL3ZEYmZGNGUrWk9nQnZZbmFYWFVGUGNjU05qdTVoaG9IdFJj?=
 =?utf-8?B?ajJERjRLam5IYVFBV0lkRTAyVjZ2czlZeFpPdHl5bnJ0ZGVFMUJhTEZjQjB4?=
 =?utf-8?B?UHpTSjc3aW5COGFyMkZwdFBxdFlZc3dXcDI3c3EzZlFKUkVscjdXWjZKd2pl?=
 =?utf-8?B?THFzak9JMkMvR252VFR5cC9sUW02UXBYZ1h2L1Y5dUUremdTUEpWckc3bDJH?=
 =?utf-8?B?Z3ZJczFEL2YzRzNvRzF2UTJiOHNWREpsbGRUQ1V5aTNyam5LTGo1aHlsSS80?=
 =?utf-8?B?aG5oZ0NnSG5FV2lGY054UEJqbkxZU3VHZGpSMHVoUWZaTGNJT2VsSEpxNkFS?=
 =?utf-8?B?UEFQb2J6VHlxRjF1QUxVbmM0T003SkxvYUNSbEpnRGZRSHAxUGMrUDk3NzFJ?=
 =?utf-8?B?TFJWb3RFbEZ1a1FMVEhkTjNERmpyaEVBU1JIeVVzMmNBT3UzUEtCTzNWY2l0?=
 =?utf-8?B?SHNxcnpQK3NjU0JWZ0VQa0pDblk4ZVRHa2FGVDRQRUN6YmFaY3VkVjdVTWs0?=
 =?utf-8?B?WGtDazBPWDZSbVBIS1FHbjBLZ1hHNUkrQUxQb2RvckVoZSsrYmZmc1RHZzNq?=
 =?utf-8?B?QnFTQ2d4TzB3UFdLNnNyMHVMekFlSXpDNVNlZTU3ajQwOWxsbXZhdXZVMElC?=
 =?utf-8?B?NEhUTHY0Q1dqa1UwMXFFRkNVS0NRbElsK3RTL1A5b0s0cW1RZzB4SW10SVYy?=
 =?utf-8?B?UXJmN3o4SXA4VnNUMFlsSHVpUXhBWmhuMVN5cDZwakpZTDg1WS9PNFVvWVU0?=
 =?utf-8?B?cnlMUzgva1Jod1pLdHljTG1HblhhYVZVd1JnVGlTUi8xOUUreDlHVVM5STRM?=
 =?utf-8?B?WEYrN042bGRDNEJCQkdJbkhOTXBMUVZWam1uelY0STkwdy95M0FTZndvb25M?=
 =?utf-8?B?NEp3WW5PVVJuOWwvbjlydHZ6am0rclBjcVZIYWYvR2JXd3NSRTl6K2NLNG9m?=
 =?utf-8?B?WDBYbGQ0UGUwL3c1aEVDS2hWZURTdEYyaGM1OHVRM3RhYTJZQXZObDhhR0JU?=
 =?utf-8?B?ZEZTNmJZS240QzliR1p0RVZkNCtMK2VxM1Z3MFdSZE5NNmlFRW1qNnFJNS96?=
 =?utf-8?B?ME52d29HY3UrbGMxU1JqNmdTS01qTkpxc1VxMlp5VTBHSjBmYS9WMUY0MnZq?=
 =?utf-8?B?NVlhMnQyRTdLMW5IRnQyZklJanBid1hBRDNiRDloZDNZdU5MdGZTY1pWZjFS?=
 =?utf-8?B?eGQxSXB4b29vYnZPVFMzTnBsdEVHdU90L21hQXBqcXErSjRuYndJUEZva0Ux?=
 =?utf-8?B?OXNJTERsUXdHT1BkUEEzaDNJdG0zUmNkNFFNOXV0QnNMT2NPL2gvaXBTbmFS?=
 =?utf-8?B?T0krWlVOYUc0WmZnTHpuZlZwMWNidGlvUXYvUW9tSXE1TzlYdVJ2T0RZK054?=
 =?utf-8?B?VUovNGg5V2xMVHZzbUJTRkZvc0I4WEp4WjBxTEF6ejBjL3FZWUlrT3prRk52?=
 =?utf-8?B?a1JRT0htS1VIRTFpN2ZxME5nK05xRDFTZ2JXV1ZXd0UxcURjSHVPVi9PeEZu?=
 =?utf-8?B?OEJseHhrdkFrZHJmZXE0NDlhQ2pubncvcm5WNUo3WFlTZG1rRllNZVdKYXdW?=
 =?utf-8?B?NlJyam9GcFo2Wkh5MjVwZmxCaTRxQmcrckd3WVgzem43Vmlnekd6bTgybVJx?=
 =?utf-8?B?SERqUWdkRXptcVFmeUhZTk13REhmVGdqb1FaTHJzMTJta3hyU3AzOXIzTURY?=
 =?utf-8?B?ZU0rb1VLYTBpbXZFNGZZNVJSa1IxMzQwQlp3Vlo1bDlVRWNrWXhBZnVmTEtt?=
 =?utf-8?B?NEFOUXloWUV0ekFobzdkT0Rqa3JDV3R2aTJGSnhla1psU2pEOThSMXZPem55?=
 =?utf-8?B?Q0Q4YUlmRmdVc0w1VHB1SU95anNwOUNDVm5SeHFYV2VKSGpIRGl6QVpCSEpl?=
 =?utf-8?B?L29lb3VRK0JEZGgyU3BvdjhFUm5DSVdxSW1zWFpRRVVuRzBHMTVuVmR3bWI5?=
 =?utf-8?B?SVpFcjBOelFha0E4Yzl5eWlCdUVSWEgzSEQrVFQrTDliempZRm15OTViSVdm?=
 =?utf-8?B?UzlGZ2huSUgxYkkxZlRLSnV0ZUZpUnJCdjkwMUtZN3FQQUE4TkVwKzlZQTFQ?=
 =?utf-8?B?dDlYUDlZQ250dFpxaTdkdjhyQVFSKzFvYk9lNTRYOWRtTlpxWHBTNFEveVJr?=
 =?utf-8?B?Vll6S0lmVGF6TSt5TXBtZ3hPL0pVTEowcDlPRVcwQ0RSOGRxb1ExUWUvTjFr?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91B890F679E30C4EBCD651C706C8F98C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c139d2-04b6-46ca-ccb0-08dbcb14844d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 11:15:18.2432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrrYEQq5ikCro0yWO6xJgflc2P6u0O1Cd7+0uFoKxz3cTYcaKFv+c+e6PErQu+huFP7jMZjIm+fuWU7EqFhfsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5760
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.484400-8.000000
X-TMASE-MatchedRID: TDQWNTPftUDUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2t5gCHftmwEMJ+S5m2/8VLmruLK9NZxo4JZvo
	+mFW19mD1MEWuQ5aoqRiKZm4oEbN2pUxzcSQ8HaTBVprK8rvWX98ZaRTF+TAgmyiLZetSf8n5kv
	mj69FXvAOkBnb8H8GWDV8DVAd6AO/dB/CxWTRRuyUIayx+Skid
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.484400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FCAC2FBB16E9AB1FD123F7444485CD1E406C726DDEF358FA0D4B236AA36D4B952000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_041604_710989_4D2637B2 
X-CRM114-Status: GOOD (  14.98  )
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

T24gVGh1LCAyMDIzLTEwLTEyIGF0IDA5OjA3ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDEyLzEwLzIwMjMgMDg6NTQsIFlvbmcgV3UgKOWQtOWL
hykgd3JvdGU6DQo+ID4gDQo+ID4gVGhhbmtzIEplZmZyZXkgZm9yIHRoZSBhZGRpdGlvbi4NCj4g
PiANCj4gPiBIaSBSb2IsIGtyenlzenRvZiwNCj4gPiANCj4gPiBKdXN0IGEgcGluZy4gSXMgSmVm
ZnJleSdzIHJlcGx5IG9rIGZvciB5b3U/DQo+IA0KPiBJIGRpZCBub3Qgc2VlIGFueSBwYXRjaCBw
b3N0ZWQgYW5kIEkgYW0gd2F5IGJlaGluZCByZXZpZXdpbmcgcGF0Y2hlcw0KPiB0bw0KPiByZXZp
ZXcgYWxzbyBub24tcGF0Y2hlcy1wYXRjaGVzLi4uDQoNClNvcnJ5LCBJIGhhdmVuJ3Qgc2VudCBh
IG5ldyB2ZXJzaW9uIHlldC4gSSBwbGFuIHRvIHByZXBhcmUgdGhlIG5ldw0KdmVyc2lvbiBhZnRl
ciBoYXZpbmcgYSBjb25jbHVzaW9uIGhlcmUuDQoNCkluIEplZmZyZXkncyBoZWxwIHJlcGx5LCB0
aGlzIG1lbW9yeSByYW5nZSBpcyBkZWZpbmVkIGluIFRFRSBmaXJtd2FyZSwNCnRodXMgdGhpcyBs
b29rcyBjb3VsZCBiZSBvayBmb3IgYSBiaW5kaW5nLCByaWdodD8NCg0KVGhhbmtzLg0KDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==

