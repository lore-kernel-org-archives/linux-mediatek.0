Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BD6C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkB8dLzWzTwXQhLm1YwLBB1K1IIXxDRfTD0nl+ESpWM=; b=eC6fBBW3heTpyYRULapItPPIVw
	fhxqM7vIAJNLJcG/D/pvzprebIqR2UL2BnHES94g3eITAE/nphZJpuKBs/SsexE7+z6Der+YY+/vd
	GPaslDrn7woSRiJf2hnhRxCG2+759nEscfV14zD6RJA5nr3GO9meA88eDQVrAYKJljhKR/2OXQU8S
	RXBF7dRNN1H2H5QBu/z9mZ2AExlxVHzv2wY7zyfWXCHEnmA367V8XV9RamtfnWcNhqHqDmWiLguna
	oMnzKi6PP/dqybH8D6ZICILahQGmvLLVQb06kcgWmJRuEWfDKgpZ8JMnLuvhJp7L1hdjbB8/7q5jj
	RZ0JlzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzG8Z-009mTV-33;
	Wed, 17 May 2023 12:20:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzG8X-009mSS-2o;
	Wed, 17 May 2023 12:20:11 +0000
X-UUID: 27a2dfc4f4ad11ed912e1518a6540028-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qkB8dLzWzTwXQhLm1YwLBB1K1IIXxDRfTD0nl+ESpWM=;
	b=Lf0Ctd7numJJO55eRT8+B/rWa4KuGnhrdNC/vj6pwrZtd8Z3cDGdQsy8jW6Rqqv9G8zs8u9U3sBHfZg0BDL0htDTXQu+OW+6kX1+a3hoRNvmSkIvpssXrL5aV1ZWQ9SuTEyTRr2w6zy54ymVImd5m7SEOmtuHGYWY6uEZDZ++CI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:3da1ec0b-682b-4e00-929e-752cdcd015d8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:f39e26c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 27a2dfc4f4ad11ed912e1518a6540028-20230517
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 115246542; Wed, 17 May 2023 05:20:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 20:10:02 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 20:10:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVYseiLFp/EZ6edi1F5/WmHjDkg32Z5Na1hYIkjB0dp39GxvyprE5JMJJriS5eB4x0lw4wajIShnIANfMKZGGht7cJeY3++6HLFCoTzq9cFiFWLKtCTVGxtOrukz/fXpHWydxUGaGx/1GapEN8Krrmb+CXf6z4NwmFfQ5h4eG4T46pF/zvSr6RVl7vhZWVaQtRuE+PWt5q30lmtQi6xY8HQElGUAyqao5QoHNOiHJ3VdAbC5uwp3N5/6/aQzkRaKYTQGQl7lemM3wQFMeHg/mlzPhuZvjOz8Jhnnipvqf8Yf+zsEJ8L5BF0qf21i1znks6KYm6FR43UN/GPXm03LVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkB8dLzWzTwXQhLm1YwLBB1K1IIXxDRfTD0nl+ESpWM=;
 b=n6Pg6i0gtOT5yGylppJwXJhwG3NgtKNDFNFGiLxGGlxr0nty0lz0QkJOCs31KrHiqO5mT15xBw9yY+5etebE+Q9UEteJbThQevgPUAHKd2ZPg5DCDNkGlhfP4WWFb+vJve7f4zynt8g+AIeKkgdcNbeLv19+50thKSABNjfQngMrtsUmj7E0iy1XYMrGNpcb8mOBaRplapRhJ1+L30jY4rvDI+temUlY9no+yRVYzM+xB+x0rJ+gpm+VHtgkgmYik6drDTPleQxGdR0yszXKZx8k//F/00AFKPqs/RSwjKUJrMr6l+3pnkFS9S0aOAN1oYW0VgrB+PGzjtCP1G5S5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkB8dLzWzTwXQhLm1YwLBB1K1IIXxDRfTD0nl+ESpWM=;
 b=nECKcIBBoryHPhKrR9hS/j+h4hdMEvZrhsVqxU+2BvrvsfIG/VXoufeUhKznsY33xoDPr3wVwKaXkX3O9C0mJyGfkY4jS1VUFWQVDVjXqMVLfGIHmITqW/+KdgloaYXtvLzCRugGw1KBdHvy7ZdcqDmhi/FIQlsruTuQmjdzuBQ=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by JH0PR03MB7322.apcprd03.prod.outlook.com (2603:1096:990:18::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Wed, 17 May
 2023 12:10:00 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::bfa:5a41:b6e1:63de%3]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 12:10:00 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "perex@perex.cz" <perex@perex.cz>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack
 pins
Thread-Topic: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack
 pins
Thread-Index: AQHZiLDrSjRN9q3j/Uq705XMnwebEK9eVN0AgAAKwAA=
Date: Wed, 17 May 2023 12:10:00 +0000
Message-ID: <9685a64561fc90d592481ae5e95d1e849fe3c55b.camel@mediatek.com>
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
	 <20230517111534.32630-3-trevor.wu@mediatek.com>
	 <154497b3-f5c7-45d6-edd5-729642b80be5@collabora.com>
In-Reply-To: <154497b3-f5c7-45d6-edd5-729642b80be5@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|JH0PR03MB7322:EE_
x-ms-office365-filtering-correlation-id: ef313d2f-3a3e-4af5-d6ad-08db56cfa35e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /saz9kis25WF5Rd2GyqYUep85ZeeDKARmFrenXrZjNvolJXThHNPw/Eeu84OZXsd9+dKK8a8Vz99up5mPdA17GOAX02USigdcv6Wr8FMC6PwH3XTon4ZBOm5BawGvTEN/zQ6DKmN9W2EMabA67Pq5R6eCLDbP5pPL0kp0lpgtwH1DD78waA3ypepqa3u1eb+D/Dn0Jx6yoGc2OhMrTICByUfx7bL6dsRcmubcq1+KllvB4Humwz3maIatVVXVVmE+9se3m0mP3K8mc42UdfMsXfO3DVZjcTL0x/AYKI24Uu5uIK3qtYB8xt3HcStrgAwLKYz/u6hAhlflJHoGIDVn14Npzd9OZg/073189O2TplThlF5QjFpBhgx9rue1AxEr5UOEvTknDyu4OWrs59MxcnWXNUOCPAsC2rF2HY8tXZj/3R1/dPCv3NY8uz1aB7D3cLCEBJmnTmdkIRCEnqQyEeVzS45fr2SsONK2wxTFgPbvbE37UIckD2k1e3RQKP7iDTgRQT8cdHhmSXfh8WHTLUjkLD7Sj537D5vtRl7QKefyWJkhIZbovkZwsmjPyiES9IBmshzz/fwUaBmq5bD0TeGLf1Y5SOJHYfYRrlIekQWO+Yq6b2wBECmYOkh52QLSs+8IlMByLouUB/1VHtKNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(38100700002)(122000001)(86362001)(38070700005)(66446008)(8676002)(41300700001)(8936002)(7416002)(5660300002)(66476007)(316002)(54906003)(64756008)(110136005)(66556008)(4326008)(76116006)(91956017)(66946007)(478600001)(83380400001)(2906002)(71200400001)(2616005)(6486002)(26005)(6506007)(6512007)(186003)(36756003)(85182001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3pJRjl1TGhzbGljYTlRNGcwaVM3eGk0dXZPc1FxWW5Fa3JDUWkvbm1Tb1VH?=
 =?utf-8?B?bjRjeExRNnZvQWJORURPMG5jU2I4QmJENW9MOThLSVhKZFA4Wk1xbHpqWS92?=
 =?utf-8?B?eXAxNi9HOW1OT1hoVE1kaEV5SWU2Y1lIcXdpd0RJZ2p4RFRvc3NFUGJkTzJS?=
 =?utf-8?B?MGE1d2NTd2hUckpwZ2NkRVV4a2xzZzRWY2d1RFlCejRzcWpQbzV3bC83M2lD?=
 =?utf-8?B?SjhrUFhMcnBFZTJNM3BkWnhMN1NvY2R6dTJRNTVNOU9tU1ZhVEVZaTB6NFRy?=
 =?utf-8?B?eitnYncydHNSdE1SeU4yMWxSbklpbm55YVNCRElOaEd2KzUvS3JsUnl4YzNM?=
 =?utf-8?B?dkRBTzdDNFJlSHVBSEdDOHRiZlR6WldkQzJ3VkdyK29iTGtCd3VoSE5KS2ZB?=
 =?utf-8?B?L1V1bTR1MlBBejNaU0hDcmY3UkpjdjlIVXAxbGJWczlSaXJMV0Q5ekI2MmJR?=
 =?utf-8?B?Qy91N2piMVUvT2YzcXFkUXNFUzYyaUpUVjNvd3VUSGdlNThFb09wd0RuU0V2?=
 =?utf-8?B?dkN0MUFPMkg1TEZGL3c1Wit5bENoSXdZQktiZFN0cmIzVGZFSDRIM0VseGVV?=
 =?utf-8?B?L2ZzcEpYa1FxZkJNMURpVkZabUdiTUt1SGZFU0w0SEVnaFlsYUVodGRiMHoz?=
 =?utf-8?B?SGRNKzdpTWdzZzl5MkxEbU91TngxaENJKzNuRlhGRVFuTEFQYUJNb3hIS0dj?=
 =?utf-8?B?dE1YL01BTU5lcTRiOVlIcWZMYzhEc1FUZWhTNk9zMGxoRTJIN1l0amJJSlZy?=
 =?utf-8?B?LzVZUnd3U3J5VEQyc3JXMWpoWlZBaHU2TWdDVWNocWhnZXhlYTQzT0ErNlBx?=
 =?utf-8?B?V2lhczRqcjBPSmxNc3gybG1mWjR3UUhqNW9mWUN3K3VUd2tRWUxNcnhEdFVv?=
 =?utf-8?B?MFR4TmQwWG05OE5oMDZrbkJ0MXRaT1EraVJVcnkwaVhvY3ZZOW13YVoreG1O?=
 =?utf-8?B?alB0akFCb0NxN2MwbjErRTRFRngxQk5zSnFzYjQ3aFNZKzV4QlFIVmlZd083?=
 =?utf-8?B?TE0wb0dHamxzSkdSbWQ5UVJISVdNQUlTd0Roa3ZqSFRTeTVNeWNiM25YQ29F?=
 =?utf-8?B?aWJkMUhoSGxDRm5IL1h4Y3dkNkVPajF0WEIrTXluVWxGbmIvd2JEWWp5Z2tm?=
 =?utf-8?B?UzgrdndmUTlMdnJWQU5OWVdYNmVJTkd3aDZGTEF3dDFvem43N1dkYzdjSEpT?=
 =?utf-8?B?dVBMdGhOTnYrUFMwY2huRDZidlo5RXpiU3RieUNLdHJDZDhwMzdiQzliKzlE?=
 =?utf-8?B?REd4Rll3UitJcXc5QmVUQ0N5UnhteXFSSmlQakNmdE0zNFlPVGRYa1hvUCtB?=
 =?utf-8?B?TFVSS2YzSitJRjZZN0xaZWhGam9PblhTRVBKeXptcWMyeHlsTU5la2RmcWRj?=
 =?utf-8?B?Zjk3cVYyRWh1Q0xyellMdU5qUkNjWGY2U2h2SHQ4L1pPc2ZVTnAvNWtYOWUz?=
 =?utf-8?B?bDgzc3lOV3UrU3doYm9sSEVlOFRmdDFyUWdsYWErblhLMmhmcWN4VHhJWmtm?=
 =?utf-8?B?S0E4T2I2bU9oRUp2Z3VsU0xlbmZDa24rOHZVR3pDWUZjL3lRaEY0T0F3cktV?=
 =?utf-8?B?N1JoaWtMdkg2M3ZyYy9EcjUwTkUzOEs0SzVUQU9SWHRaZkpsdTZzSWpDLzNL?=
 =?utf-8?B?dDdkempmZGFkRjJXMm1MamsrTE8wWU0vaWVPelZtUHVYRWV1SWIzbGU4Zkd1?=
 =?utf-8?B?VVJtU2hzemFhTzAxanNXMW9yZjRMa0svUmdwTVg4ejR2RWpzZ3Z2R3NkdVhE?=
 =?utf-8?B?czBBV2R5dzRJS1RVbHFuaEpFSUpxdjhLTG8yZ2VGbkhZWElkQmFTQ3J0RFNa?=
 =?utf-8?B?Ri9pSENtTFZEbk9yZHpMQlB2d2RQY21waVd1OHlTZ0MvZUtyRGd0L0h2dmdu?=
 =?utf-8?B?amwrN0ZxTVdqNG5EaWJpbTUwaUZvbU1IanhHWFJEQzNvTHJYQjhXdlRUVGFJ?=
 =?utf-8?B?Y0JWOXZoc1BSREwvOWxHdTd2ZGxjQi9aYUVCTkJDNTFFRmRZZUNJT2xyMTJ3?=
 =?utf-8?B?RWtwdUErSjFpayt5b2pZeFdvTnBzbmtmdEdJdGdGVzQ5M2M4SFlLTTF1cktW?=
 =?utf-8?B?NTYwV0lXTEk4N0Ftb1B5cWExVGQ0WE9ZUHQvdHVSQ0lNbm9mYi9uNC8rbTRV?=
 =?utf-8?B?cGtnVWVDV0gyN25MZUd4QXl4bFNXV2wyaXJsMWJvNjNhRHBSMkNPeWVDOXdt?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCE319F4197D74459325644FA7CC344E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef313d2f-3a3e-4af5-d6ad-08db56cfa35e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 12:10:00.2135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mGpcH08kQdPfLSAjKa++ccg7BVhwivxmhYZJ+ZyejkcUYU2EjKOq3gAOBcQMOLjdO3ckPIXza+GVITndDCX+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7322
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_052009_921708_C9BF8D5E 
X-CRM114-Status: GOOD (  17.81  )
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

T24gV2VkLCAyMDIzLTA1LTE3IGF0IDEzOjMxICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxNy8wNS8yMyAxMzoxNSwgVHJldm9yIFd1
IGhhIHNjcml0dG86DQo+ID4gU29tZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIG5lZWQgamFjayBj
b250cm9sIGV2ZW50cywgc28gcmVnaXN0ZXINCj4gPiBoZG1pDQo+ID4gYW5kIGRwIGphY2sgcGlu
cyB0byBhY3RpdmF0ZSBqYWNrIGNvbnRyb2wgZXZlbnRzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFRyZXZvciBXdSA8dHJldm9yLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHNv
dW5kL3NvYy9tZWRpYXRlay9tdDgxODgvbXQ4MTg4LW10NjM1OS5jIHwgMjcNCj4gPiArKysrKysr
KysrKysrKysrKysrLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZWRpYXRl
ay9tdDgxODgvbXQ4MTg4LW10NjM1OS5jDQo+ID4gYi9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTg4
L210ODE4OC1tdDYzNTkuYw0KPiA+IGluZGV4IDgzM2JjMzYyZGFkMi4uNmMzZjM2ZTJmZmZkIDEw
MDY0NA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxODgvbXQ4MTg4LW10NjM1OS5j
DQo+ID4gKysrIGIvc291bmQvc29jL21lZGlhdGVrL210ODE4OC9tdDgxODgtbXQ2MzU5LmMNCj4g
PiBAQCAtMTUxLDYgKzE1MSwyMCBAQCBzdHJ1Y3QgbXQ4MTg4X210NjM1OV9wcml2IHsNCj4gPiAg
ICAgICBzdHJ1Y3Qgc25kX3NvY19qYWNrIGhkbWlfamFjazsNCj4gPiAgIH07DQo+ID4gDQo+ID4g
K3N0YXRpYyBzdHJ1Y3Qgc25kX3NvY19qYWNrX3BpbiBtdDgxODhfaGRtaV9qYWNrX3BpbnNbXSA9
IHsNCj4gPiArICAgICB7DQo+ID4gKyAgICAgICAgICAgICAucGluID0gIkhETUkiLA0KPiANCj4g
IkhETUkgSmFjayIgaXMgbW9yZSBjb25zaXN0ZW50IHdpdGggdGhlIHNuZF9zb2NfamFja19uZXdf
cGlucygpIGNhbGwNCj4gcGVyZm9ybWVkDQo+IGxhdGVyLg0KDQpIaSBBbmdlbG8sDQoNCkkgc2Vl
IGphY2tfa2N0bF9uYW1lX2dlbigpIHdpbGwgYXBwZW5kICJKYWNrIiB0byB0aGUgbmFtZSBpZiBJ
IGRvbid0DQpuYW1lIHRoZSBwaW4gIkhETUkgSmFjayIuIERvIHlvdSBtZWFuIHRoYXQgSSBjb3Vs
ZCBkaXJlY3RseSB1c2UgIkhETUkNCkphY2siIGJlY2F1c2UgQUxTQSB1c2VzIHRoZSBuYW1lIGZp
bmFsbHk/DQoNClRoYW5rcywNClRyZXZvcg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgLm1hc2sg
PSBTTkRfSkFDS19MSU5FT1VULA0KPiA+ICsgICAgIH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICtz
dGF0aWMgc3RydWN0IHNuZF9zb2NfamFja19waW4gbXQ4MTg4X2RwX2phY2tfcGluc1tdID0gew0K
PiA+ICsgICAgIHsNCj4gPiArICAgICAgICAgICAgIC5waW4gPSAiRFAiLA0KPiANCj4gU2FtZSBo
ZXJlOiAiRFAgSmFjayINCj4gDQo+ID4gKyAgICAgICAgICAgICAubWFzayA9IFNORF9KQUNLX0xJ
TkVPVVQsDQo+ID4gKyAgICAgfSwNCj4gPiArfTsNCj4gPiArDQo+IA0KPiBSZWdhcmRzLA0KPiBB
bmdlbG8NCj4gDQo=

