Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32EFC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 10:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufam3vhnDvabpPWdAchMp26NdHO38zAbJrltmVsoSCg=; b=ceYgjM+1YfMbAzFVbozKRpGY9j
	KH4tJhFuNsseelx13iYWpVAS+7AqDS3qW3hhDhDpVwmJZd+BCwB6TtAAhZBf7gb71+0WY4pHvftsy
	G6jW/aAUfou9DtJoWi2TuVgwXx7zEsFGbdq3Ss0bP84RoMS78DNKa4nAi7HBpGDXS1UsF285CsYSy
	B12RBHnHuGlmILLtZvXStcjla6UP84XMzLyFsYrARKKOylB2jb6XG+qsyug2Do9ZABFy1NqdZxdo1
	mZsLGCu0QnXhGhCCNN5cMWkWXYuUiT1yZepQrDcqpIfkPuwxCQS9C9rZqeor6NuWA+NQqXLPi5trW
	Qn3LTEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousyl-009myY-Pd; Tue, 15 Nov 2022 10:15:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousaM-009aUC-UQ; Tue, 15 Nov 2022 09:50:32 +0000
X-UUID: da07f7c8c9d5442fb8f09093728d987c-20221115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Ufam3vhnDvabpPWdAchMp26NdHO38zAbJrltmVsoSCg=;
	b=Ojll7DbRZq0Ezkn662n+bY0kcYyAQ4tirWfLsy5ijVSONnWiO6stwb69U711vjN6af7Ut4Mg54ig6ri7oNsFtwAGV5cIv8dJY9xwAqlq68bXGgqW7YDQUZrebQXEqCT6D2b8KPesSO/ErPeWz5rIgiS+n/BrvllbWY7gC5gE5KY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:b61d6093-0a7a-4b31-9424-7238ea238d8f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:4eeb3528-7328-4d53-af97-37d3ca89e562,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: da07f7c8c9d5442fb8f09093728d987c-20221115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 185021323; Tue, 15 Nov 2022 02:50:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 15 Nov 2022 17:09:40 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 15 Nov 2022 17:09:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts7zwJ6LqAWxZ5iDGsSsaElMnQ5bcUXnL8vRBpGefaPEsKIIzSjIJ0QWjdORzjBvMwbqZugK1BY3lrgGJecu85L1ZiVj0HjENaCBTZdM/xuaimwCoRYRta5qvPgMsQYAWgpknxGGswJKK+B3CIZ0E5061Crd/ayV8jYKe6EV+81Ubqhk3uLa01yD4+Ej+BazQW9NekS5wmum8QmjRwwTOA3qQ8SXIg5Xu56KzpiXiCOI6ySep6wdr6+NzI6xBdMdFLbfzqb5S8WOFtqQkcLP7PchZ9kHQ7h7xHKir9vJdWD1hV5img/dV1ai6y/piQ46YdXLfCK1W51pfZ6APYfpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ufam3vhnDvabpPWdAchMp26NdHO38zAbJrltmVsoSCg=;
 b=JBp+NiOUVvIPmJ6FIq1cU1TKBTzrZBeSdqjDdNj9tgJrs/ttvyEXlcc09xm287empQrI4QB9cpAGM+fKOuSh+98wO7eeMtfPnsymcZscg6HFUGU+/P7+LdhZyN3ikGnoRUiLSg7vqd4p6DBK/cIE5rScZfY+vHiVFk509EDnJB5G3WzUmcgBYfAAP35Bv3wzglrg5/7k075jP/7TCA8UNQUVqh+vy7dYZ2QtMXY9dbyV+7wNCzJieENQMo8i9oOgn4GMvmStxi6iw+Eql+KUdr9oPfyUomhMi0Bl4x/Jih4HsH35cJIVyYMpxFD/tWrJzd+7hMPrLqHcjdCggNbrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ufam3vhnDvabpPWdAchMp26NdHO38zAbJrltmVsoSCg=;
 b=L+/oSpY7VHDdPvouU0ds6A0MaGSBJpLTqupP8z8atuucGtmbiSukiCw4iMK2mBXXWabIaSmBXKjF5RPh658gI/V/Y1GTnb+iVTNUpfFBPppdt8Yda676HwbgfHpcwPgsB3KPdq8sTTu9yqzzMEGuV5+MnowIb75doUq5YhOkUIg=
Received: from TYZPR03MB6919.apcprd03.prod.outlook.com (2603:1096:400:28c::9)
 by SG2PR03MB6279.apcprd03.prod.outlook.com (2603:1096:4:17d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 09:09:39 +0000
Received: from TYZPR03MB6919.apcprd03.prod.outlook.com
 ([fe80::7e10:1fdf:c6f6:597e]) by TYZPR03MB6919.apcprd03.prod.outlook.com
 ([fe80::7e10:1fdf:c6f6:597e%8]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 09:09:38 +0000
From: =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
	<Allen-KH.Cheng@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2h1bi1KaWUgQ2hlbiAo6Zmz5rWa5qGAKQ==?=
	<Chun-Jie.Chen@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] soc: mediatek: pm-domains: Fix the power glitch issue
Thread-Topic: [PATCH] soc: mediatek: pm-domains: Fix the power glitch issue
Thread-Index: AQHY37bN6C44Fi8X/Eu2Oi+v4/14Ba4NsG8AgDI0GgA=
Date: Tue, 15 Nov 2022 09:09:38 +0000
Message-ID: <3bb8bf030cf074d51496b21aaac811a310b0f0f1.camel@mediatek.com>
References: <20221014102029.1162-1-allen-kh.cheng@mediatek.com>
	 <4e89e401-ae10-f8c2-07c5-1cd7950f3e27@collabora.com>
In-Reply-To: <4e89e401-ae10-f8c2-07c5-1cd7950f3e27@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6919:EE_|SG2PR03MB6279:EE_
x-ms-office365-filtering-correlation-id: e335d8cd-1930-49f3-763a-08dac6e91fb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2kAmsgCc8xhuB+ibdEJBV5ivHr+Ahr6h93TeQ/ACXXNOIfwsadVlEhYv1b2ymEETaaLM9ZgPT79OpD4nEqHeXHF7AUmZhyz3MHAk/B0j0+iQ6NIf3IK2vz891BxWnoPZhWp8lFxjQm8z6C1LJDSOOWocy3PlnzG1sKS5RyfGn97YncyjFsEwMI3uscOkOhVbcbIbVsAh3SZxtBKMruECki6nRyOjOcDXRjoPYCuldpjhhFd2RlIfR5pjcNNWwOP58DaitmN0zNmumTuNWBjFLxHNcYj6E7Y7xJgz5IblAXUsthTxxbSDGVdgTlL8qi3oWgxrKfDeH92c+bQrXXOM3N+dGYRCccc8Fo78z2z2la6pf9kMijcUymKjW0UpKn2LFi8M6HdNgdPQE4Jh3s9YlGaHHAiHPv0Q/KHVLLyrc6E1483djP8o4NWCn8nYYp+6PIgfKLOPouZEMcNzG7EhKvWnnSy/hr8lZimY/10uWATE2cWNL2ijprfhLPAff1N6lHGHhIj/Y8O7HgFhDLlGNcXBG8gDDsA5GUv0hGjeDytaYvMuXgoU8cOFo0Z+8RkUR6CNr5rq+sfNrE82YyRQFIbOlAJfzljLh9bygv2i6XHa75i2UWLIfISQDjEFLdWN7KOQh1lqA43eaqXw08ywNIMcadnpCNwc9HH8ju6XJTeWHmOtW5psw7pkNcy70SAtNmhy1GLRq8FhaRc8gUGOVxzMDdDr7tBntz+J0zti6ESqAGgdwOf6FtskXN28HCPB8KJmahPQfxpSgTzyPKXwNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6919.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(6512007)(26005)(2616005)(6506007)(186003)(4001150100001)(122000001)(38100700002)(83380400001)(4744005)(5660300002)(2906002)(66556008)(54906003)(6486002)(71200400001)(110136005)(41300700001)(64756008)(66446008)(478600001)(8936002)(4326008)(8676002)(316002)(76116006)(91956017)(66946007)(66476007)(36756003)(86362001)(38070700005)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjJFU0hmWEpnU054bzdXaUVmeDM4QVd2RUtnS3I3SmFsMUZXTzdCT1NXZnp6?=
 =?utf-8?B?cnByWVR6dlN1YTVJbGRlaytDZlh2NU1NMzRFVFJmTENxUTJRY21yOXBSM0hQ?=
 =?utf-8?B?VGZvNmlSeFhhc3UvZHZqbCtDZVR2REYwcWpRS1czcWhDQ2hxYlU3cEFRbWNM?=
 =?utf-8?B?TnhvVzhITTNERkltcHZMSUVRZlI3cnVjTVlIakhFbjlVbDc1ckVHV1Y0OEl5?=
 =?utf-8?B?UEREMWYwZEg1TngyaFJNM1pEck9NbFdOay83YzI3bENPMHZmMWt2V1gzUVMw?=
 =?utf-8?B?dUsrenJaYVBIVFJZZzNyU1NpOGdTMVZWR1p6WkxoNlFZWXBTQmx6TDV5ZzFF?=
 =?utf-8?B?cWRySERnd1JPb2lzRjVuS0ZPL2VycC9qUFhzTTFBUVd4VDV1d2xGMmVMc1F3?=
 =?utf-8?B?dXFuR0xxMksvdE4rVjJTemNZSFB4Mm1Wcm5yS3FHRXdvTnNtc2VaSzU2Qzc5?=
 =?utf-8?B?SUFiNEpaN3pkOGY5am5Jd1VkZzJ1QzJhbEFwK1JxYWVDVGlYbmhPdC9INm5Y?=
 =?utf-8?B?ZFZxMmJmRjBZMGxXbVl0elRHdEtOZ0FyMnFITnRnYlErLzJmUGRUb3BiQmVI?=
 =?utf-8?B?bFZoM1A0S2NqeFp4b0JFSDgrVDVYODNCQ0p6SUxKVTkrZDhsZy9LVUl4WlVi?=
 =?utf-8?B?Ylh3dk9lSS9DMS9OZmZ2bEZmUG5hY3pQMUJYdDN4Q0t4YjkvcW8xeVVkRW9K?=
 =?utf-8?B?Q051b1NCRVNPZCtSYWNlb2duQ3FFTlR3blN1MENEQTk0MGZlVjI5TTl0b2s5?=
 =?utf-8?B?VVlzS2ZpMkV0elY0VWFSVWZiZDJ2NGpWcGVzVmUwZUVlc2gxN0laK0MzWEpz?=
 =?utf-8?B?YUdLRnNCN0F5K2pKTEFqVVBxZEY1bUVuODZ1L0lDMXd0N1FvZUpRRkpQb0RW?=
 =?utf-8?B?SDVVeTF4RExRWW54YkJGV1RhVG9sRXY0b1J4Tm5jQ3Mrem4zOUduMS9PTFB6?=
 =?utf-8?B?d0ZHTC9hL2dmSjFIVTF4aWhnOUVKcERMeW54cGVXZTlkeVZSd1Y1WXRNZlQ0?=
 =?utf-8?B?VWowQXNvb0dvZnNiSUp1cm95YjYwa2ZvODUwQTBPREtiZkI1clBvUDhzbFhl?=
 =?utf-8?B?VXMyemlRbVpNT1ViU0o5eVJqOG9ZREVha0pmK2JuMmxub2cwZXRuOVFpVFpR?=
 =?utf-8?B?aVc0QmZYSGRvN3RMekZDaDRuUmtJNUNXVjhIODlocTF2V2N6QkliZ2FMRzZW?=
 =?utf-8?B?T2UwQXNNZmpiZWd1VFk0b3BuVDJwSUtQZzZNRTlUZ2FGdUt0U1lZay9SVFhG?=
 =?utf-8?B?VC9OUUNTdUlWdEZlcTNwYkprMXNvNEJpQnVsN2g0c0ZUVE4xM1V4NTk4aXdl?=
 =?utf-8?B?aHhjcTIwZnplUUtBZkpxd0s3anIyYU1LMWNJM0gzaVQ4RVBwS0N6TjJpMXpR?=
 =?utf-8?B?UDUvNlVjQ1ZGUWlWZXFBeFc2Z1p2VjNzTXJBYUN4Q2tmOVFKQXYxamU5bHh2?=
 =?utf-8?B?Rml4M0VCdzJNZitBV2pnS3NINExYS1FtY1Z6SnZKRVpkMEcrY2MrOW0xMnFu?=
 =?utf-8?B?NEUxVENISHc0bExmWkhCOEVNTnRSMG9MenU1cGNFZ2tQcnJSTzlCamVCZUVp?=
 =?utf-8?B?cUFmeXVrRHBncDA2TEx3ajlIVHc1dHhYN1N2M0V5NVpOM29hQ2R2SzlyTmQ0?=
 =?utf-8?B?djZJZG9vdnFWZUh3M2JQQmFRZjJDeXFmcitudVVuWjF4V0lJbnprRDVkSXhs?=
 =?utf-8?B?YTlNM0d3ZWp4YUd3QmZiZTh5T1k0elZqcWZVbG9TSEZFNVcraHY0SWx4Kzdh?=
 =?utf-8?B?dnhhYW1PNGw4VDdWY2FYTG1tTFpwR1dVYmFNZE1vUTRrNkhrOFBMeUMrb1pz?=
 =?utf-8?B?QzdKOXZ3SlB3dEVpQ3FlYjBFVXpocEgvZitiWm0yZDNqTFFoVWhoRThIcklI?=
 =?utf-8?B?aUtRaFZlM2RwdlJGUlg0RjdTczdlUWVjZ3N4TEVmZUdNeGhtU0FrNWY5TEth?=
 =?utf-8?B?RTVmNTBMNVVFYXFqUVhDVUFTS1grNE5YNGtENGQ5M1IxRG4vRGtKbG9FT256?=
 =?utf-8?B?YXJ0Z1hWRk1mcWRZdnpNdWhCY1hpVXBiNldOb1NPa0JmczZBcVFxa2JvM09o?=
 =?utf-8?B?SE9jNG00TEhXM1p5L2pqYmdIbmI5N3IrekNqWGNUUk9TR3FoVm9QaDhwVURP?=
 =?utf-8?B?OW4za0ZjK21jRmlnY2s5TmsrMm0rNkZVRnAvL0UwWkZ2TktEMGVWajBsOTVR?=
 =?utf-8?Q?DfoRWdjEfA/Odu7bk/MBDcE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06AF5B13DC180047A2E5968BF1F10333@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6919.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e335d8cd-1930-49f3-763a-08dac6e91fb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 09:09:38.7387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxPswwOemLmM1FFeUvdWAvwaemV2Iye2DsDL96VIn4xHcUnlw8niAreeGOEz/gOuyJ+QUjUX3jPJKiPyG7H2zLb5KXK+rMOaWHCTXJ1+dlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_015031_054016_50EA1AD3 
X-CRM114-Status: UNSURE (   9.52  )
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

SGV5IG1haW50YWluZXIsDQoNCkdlbnRsZSBwaW5nIGZvciB0aGlzIG9uZS4NCg0KQ2hlZXJzLA0K
QWxsZW4NCg0KT24gRnJpLCAyMDIyLTEwLTE0IGF0IDEyOjMwICswMjAwLCBBbmdlbG9HaW9hY2No
aW5vIERlbCBSZWdubyB3cm90ZToNCj4gSWwgMTQvMTAvMjIgMTI6MjAsIEFsbGVuLUtIIENoZW5n
IGhhIHNjcml0dG86DQo+ID4gRnJvbTogQ2h1bi1KaWUgQ2hlbiA8Y2h1bi1qaWUuY2hlbkBtZWRp
YXRlay5jb20+DQo+ID4gDQo+ID4gUG93ZXIgcmVzZXQgbWF5YmUgZ2VuZXJhdGUgdW5leHBlY3Rl
ZCBzaWduYWwuIEluIG9yZGVyIHRvIGF2b2lkDQo+ID4gdGhlIGdsaXRjaCBpc3N1ZSwgd2UgbmVl
ZCB0byBlbmFibGUgaXNvbGF0aW9uIGZpcnN0IHRvIGd1YXJhbnRlZQ0KPiA+IHRoZQ0KPiA+IHN0
YWJsZSBzaWduYWwgd2hlbiBwb3dlciByZXNldCBpcyB0cmlnZ2VyZWQuDQo+ID4gDQo+ID4gRml4
ZXM6IDU5YjY0NGIwMWNmNCAoInNvYzogbWVkaWF0ZWs6IEFkZCBNZWRpYVRlayBTQ1BTWVMgcG93
ZXINCj4gPiBkb21haW5zIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuLUppZSBDaGVuIDxjaHVu
LWppZS5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVu
ZyA8YWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBDaGVuLVl1
IFRzYWkgPHdlbnN0QGNocm9taXVtLm9yZz4NCj4gPiBSZXZpZXdlZC1ieTogTWlsZXMgQ2hlbiA8
bWlsZXMuY2hlbkBtZWRpYXRlay5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+DQo+IA0KPiANCg==

