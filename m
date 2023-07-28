Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07CDC00528
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7p6pkmKt/3iJKQENvZPFLkTO2a5V2gDd28YHdAcObI=; b=zxpTkJK6f1IKBAjvTHs4SO2VaN
	VnbgM7iZu89okmA3zqjFQUJr2FLNn7nJNa05bWoiDpxzQMq5+wUmzKMN8ZlbsEWJerZ13ksFH7MXA
	t60qI2l21x6apin1ncE8SBep8HAECAtyg1BwdLNZzGICLF1NavqAnpgNmFFpCUNpeAIX/O0KTbRI/
	1AdC8a9aw0BixsaG9hCh4ngPNv0O9yI1vC+NR2Z20AfAg72qpW8giT6bIM0i6/UZJM9T5gHcBhXG7
	/afLaEWZmyqsIE79NUbdHxI73Ye8sktgvEn+bNxPeavSIojMfGWiiddMCYBauDbogf7ZFT00MyLqq
	NZCTD6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIrj-002P0T-2X;
	Fri, 28 Jul 2023 08:30:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIrV-002Otg-0X;
	Fri, 28 Jul 2023 08:30:14 +0000
X-UUID: f698197e2d2011ee83ed1395ce914268-20230728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=y7p6pkmKt/3iJKQENvZPFLkTO2a5V2gDd28YHdAcObI=;
	b=hsF/BabDdcKXZQXkGT9N+LrHRhqpC4Uex+cTHSuPaqRbjSMd3P99AoNFjfnmNCKRz3I4f5cZYAQgj45cxl2BcWdNLfzvNWHr3Hj1rx8IFgCM28P49aF6MUIlvRFrKO1cbPKGQ7lVl41yV5pGYR+SFBTh8zHqFjmq0xp2Nu7YpCE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:5f02d01b-3d87-4171-b233-c684a889eba1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:d7d0a1a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f698197e2d2011ee83ed1395ce914268-20230728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 868922308; Fri, 28 Jul 2023 01:30:09 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jul 2023 16:10:06 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jul 2023 16:10:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDSHDtpGGLuN05A9Z0wB+28chgYw+GWnQ0G413UylNJ7GKtmN9SGsRME/luTSaCVkz75TJ0tsWwd6RqSetmA5eb7ufpwPhF8NG4XOsiXOibtFLX19e0YMhQatUeMBDsChDsYj0mRQHq9GIsvdm0z9gf8MOwTjsv8j1MVYKjenAi1zaogbtgVFgUy9i7fQlyE03SDuUl/puoF4CsTLirknfch5Oqn/T3SU8BdcHm/fkPn0BBiOGRLyLzURQ1yh5ZNqmnjEjk5+nscR6YlryZiz72gDKtMQyPVdolRI20h7k9NACZvxDDxhRPpUzydNv2my4eUSU97q9VOSNHMMjxX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7p6pkmKt/3iJKQENvZPFLkTO2a5V2gDd28YHdAcObI=;
 b=DkHbQ1le2nbNa+oXZfcyzl+PWSLFXtLo1vp0Mpuouy2SIBJUzmOxYAUcJE8c6mFYrV6pb3/o5HuculnXd2OZF0AS3AY6hf5VVOIznPZZoqa9B+FxMLj7HvSgaYaYREHemVUYlblY/QXfp7AcuglFumFzRgxvuoacyv2m1RY10vtSE/uXRTgMxu9wdVfaF8dykRYePQ7W0sLBla64LsQAz/O3f8qwkfE3mkRrLD8coXVR7XTWR6VS/xcMT0Sylpt5y+9yE6gRM+Si+fB4hcxvkfDy7fOSQMWsCTjTtKKtyydPSIZlmynDMTeUTcaVK8ooAP2smtAVh9kiopIVroEHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7p6pkmKt/3iJKQENvZPFLkTO2a5V2gDd28YHdAcObI=;
 b=Fp9djhlgI48RYJyoA1IXnCQ7zpAZojvbgjQfjon3fTvddMf6Ige0R406Cxuf5/vVagjQgHx5avRA4HPvK52+0h3N9i/YgCl6OqauBCBb+9ulIgwzVZ5/SeM/XzkcbfK4XtvDvvZcjSKBLsoc8rlHRmZ0d3C/bDdyMhAEIyJHfG8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB5408.apcprd03.prod.outlook.com (2603:1096:400:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 08:03:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 08:03:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 2/4] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
Thread-Topic: [PATCH v7 2/4] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
Thread-Index: AQHZwKlf6rrjw6BhdU2tHCj1kUqrZq/O0rkA
Date: Fri, 28 Jul 2023 08:03:43 +0000
Message-ID: <1d0aaed9df5299729c0e832f0a0f1fb7068b25fd.camel@mediatek.com>
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
	 <20230727164114.20638-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230727164114.20638-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB5408:EE_
x-ms-office365-filtering-correlation-id: 228832d4-5253-4633-4e9c-08db8f41297b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BcodPjirYdFQOLGztffEQsFi7My/4ndFvftS8IBoIYge2HmiRixomhrFw0wzZsaAQLSj7pfI4PAfnVdrf0vpyFN9goE61VvQcXFrihWqv3nA0DXPU41X9svKqxlUoETud220F5S+e5Fo5Ubn08Gl5jAU5PVFKsrzAug2p+LItlZ+L1MZcmWumOIGFPcN4XImZCu1Zu7LW5nA1CubGaghuKCmrCjZASqsuAmOnN9Nii5qNIKM5hcU47WhWRFSrX7Tdl/0sQMRuUf/ygdCV8XuTOIY0BnSMODoymN03IBcEncUz4aO7HNgP2MoW4T1eg73Y5toSOBUiY3bSVDDWHd5i+UFX6GjF6q0WKxUZF1vVf7CbGVsMpQypbt9wll0D0niYSCSD09QzjBI8kZiIfpeaRQuvSN3R4hLH77O9fVoIj9Ekv9DLaBMYr1kReQ/UVuTf69MJnQDXh6iemujkxqlqFKh9IUlRxvAA4n7K3Xj/MnikLMBblL9uNSAP6qIbuDkTFriflUWIdaqaKiIXzkMzzDjdk9++4rWWl1eNyEC/dVt96VVE4e0grUUeGLmNURMUbMNTPQ+qO1elmWbD/PHVMa1UJltfWnTZog3Vt7cJvAi5mhJD1x6ywM5Rjw03tAkd4dGKm1pIIQSXVnphXcP/JRk3UMZlkF/6kk81IAdj04=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(2616005)(6512007)(110136005)(6486002)(54906003)(478600001)(64756008)(6506007)(186003)(66946007)(71200400001)(8676002)(66476007)(66556008)(66446008)(41300700001)(316002)(38100700002)(8936002)(4326008)(76116006)(5660300002)(122000001)(86362001)(36756003)(38070700005)(83380400001)(2906002)(85182001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Um82bkorU1Q4eU1WRjFKK0RVTUhhR29mLzJDdVhUVWdNellibGZQK2l6NGRR?=
 =?utf-8?B?OUR6U1B1ek9VdnFCdUZ2QVIzVjNnK2I3M0NjWkl0UE40YlBMS1lpVXNvRGJ5?=
 =?utf-8?B?cVpMZnFqV1QrVnNXMjZDTVN4aGxKQ0g4NE5HYVV1VXVjSU9HdXlVRjhzWUpi?=
 =?utf-8?B?VHY2UFlFYXRzRGNkcGtyTHZWbjNKTjFyVFZ1ZUJ0UEgvd2xhZWtaRXJPditt?=
 =?utf-8?B?VGhnVzZuL1JJWURUdVVtelR5Zy93QVBVTFhlSEdzbWF4ZER0OThjb21FMmpG?=
 =?utf-8?B?aEJibm1xOTVSbGZhZkprTnZmV0JydDY1Qjd0aW5FOWRLbXFHSU5RbUhLbWlv?=
 =?utf-8?B?UzMwOXYzOUswWnpuRVBPTWx4d1FEbkR0ODBNK2Jzc1ZjSzR5dDRiYitrUm1B?=
 =?utf-8?B?SDU5dnZLVmlGL3h1QjdXM1BEand6UzJRVE5GZS9NK2MzR0hQZWhWeFBDbkYv?=
 =?utf-8?B?S29QdHpUb1RCM2I5UHJCOUVxWkp6QSsyYWEyQUtLWFVVZ1lwUDN5TmVWbUM5?=
 =?utf-8?B?dzZGZHJaMmpEbEQ2QnA1YTA1anhMeWlkSTRDZW5QY3JYYkhqTWg0NWYyektM?=
 =?utf-8?B?bXhBL3Z3L2YxUS9OQ01mTWoyZmZobEErUGZ5TEJUQldCaEtkRXU0a01pUVlh?=
 =?utf-8?B?T05nYnRIQmRaWG84KzM2VURkNjRwdGMreGFobS9qVVdBaGpaU1dCYllSRGZP?=
 =?utf-8?B?S1FlVjFOUGM1WUZ2S05lY2FaWWgveUJKNDN1ZEZqU3BBTnpsZE9kNlY2bmlQ?=
 =?utf-8?B?eWdtbGsrejVQTUM3bFVPamZ0YUUwblB4d29zQlcwelp4SElpYzZ0NTVTV0JQ?=
 =?utf-8?B?S1pMamZaSVpvN1JLM0R3eldxY3VGTndoYmhobXM4ZUlQa3QzOFFqS3RCM09I?=
 =?utf-8?B?SzgyaTBTMGRTRW05MGJDMlNySTc0b01oblRGZ0k2WjROL0REK3BlTXlZQlRZ?=
 =?utf-8?B?RlJ1UXZpamhjdVRpMEhaSVdtcTZKcmF4WGdEaWI1UVNnVHlQNTFtSDAxVzZn?=
 =?utf-8?B?NXVuWi9nTVdDbUcwN293ZFp4cmRIUjFMNTdhUVFhTHNTQmZHbUdIUFJGYzNr?=
 =?utf-8?B?cktWUDNXbmoxSzlHRTVJcTdZN0x1MElzQWptTDJDOEk5aTVITVdzQ3dOU2di?=
 =?utf-8?B?M0VhaG1uazZTL1ZLWGlaenhJN3Z2RlRBTXA0dGZDN0pCaHQxU2x1aTJqbFpw?=
 =?utf-8?B?dDBCUnRIeXRGeFd6UmhsSnJBdUtXaXBNQ0RCOXFJNkk0RHJPeWMyRk9UcTU4?=
 =?utf-8?B?bzJ1QlFHb1h0ZUhXemNwK1NvTzlRaGpNZFJITFdZKzMycnFoYlNWOWl1VHl2?=
 =?utf-8?B?Zm00ZjMyQTNYQkFIVGxGcUtoNno2SWwvVUplTmp2MFVVbTRpWFNJYTNqUnVE?=
 =?utf-8?B?ZzkrRU96cW9zeDNjeVlEVGd0cDVYZnNValZIWHF2dEtWNGVXZDdpNjVCZlI2?=
 =?utf-8?B?b3hYVlRidWlnNDU4QzVVRkZlZTZjTWNFd1dCREZseTV4MkRidTdwRXVlTHJz?=
 =?utf-8?B?enRqbHVIakpnR0FHQnFjMlFjRm1YcUJqUnR4UnlTaE84L0ZKcHoxR29UaG8w?=
 =?utf-8?B?cTBacXpxYm1VMFhUWlFQUzBUQmNnMWJaYjVYc2FVSFJpcnhVTUJvbXVLU2k1?=
 =?utf-8?B?Q1B4QmQzTXJtV3dORmQwSjljeE51ZzZqRnNGWm9DZGd3aUp4UnV4TmozUkUv?=
 =?utf-8?B?UHJ5b1lZT3lsdmMyZnRxZzFvcDhQUkcwaFY2Sk9vd2tZNGdTNmlyeEFDRm9v?=
 =?utf-8?B?N2FKVnRIZ0RuNlZ6YXRPeEozOEM4c0hQTjdhUXRvZEs5SDBZT1dSRDZyaDZC?=
 =?utf-8?B?ZUs0ZUwwS05mZGlXdWdpalo2N2ZwaWVIRDJyMEVkSzY0TTNyMlBNVEFLanJX?=
 =?utf-8?B?SGtKRDRtRks2WnkwQy91d3EwSlNzZU1rZEVSZmhCQ3Ywc25NWFJBUHZ0YjF5?=
 =?utf-8?B?dGIxbXgxMXB6SjRLM0lXR2lzdlRBbExDZHJTSTZ5QzVIL1VINElQdVZVWktW?=
 =?utf-8?B?SHlweGRpSE0xV1B5MGgvcFlua0ZQY1FNRjBFemYxZ3pwMXlxbGFKQXFaWi9x?=
 =?utf-8?B?V1k2Q041Q3daUkc3VjNrbXkwdXBSeTV3ckJrRk5LNGZ6YnBIb3ZGUEVCdjFm?=
 =?utf-8?Q?69Y+sFr9yPFadVAiuHSgw8k+x?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9C1378A67FA8B428638576D0B79362F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228832d4-5253-4633-4e9c-08db8f41297b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 08:03:43.4367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7caOl9oR3oSNWlrNhfAoVNWC9kVRkds43pbufjygbxQMV4Yzq8ocwOmBYUhMA5hh4lCeE3voIGcsOO4OdIZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_013013_216931_7ED57693 
X-CRM114-Status: GOOD (  16.66  )
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

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjMtMDctMjggYXQgMDA6NDEgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQWRkIGNoZWNraW5nIHRoZSBsZW5ndGggb2YgZWFjaCBkYXRhIHBhdGgg
YmVmb3JlIGFzc2lnbmluZyBkcm0NCj4gcHJpdmF0ZQ0KPiBkYXRhIGludG8gYWxsX2RybV9wcml2
IGFycmF5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiAN
Cj4gRml4ZXM6IDFlZjdlZDQ4MzU2YyAoImRybS9tZWRpYXRlazogTW9kaWZ5IG1lZGlhdGVrLWRy
bSBmb3IgbXQ4MTk1DQo+IG11bHRpIG1tc3lzIHN1cHBvcnQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxNiArKysrKysrKysrKysrLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IGluZGV4IDI0OWM5ZmQ2
MzQ3ZS4uZDJmYjFmYjRlNjgyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYw0KPiBAQCAtMzUxLDYgKzM1MSw3IEBAIHN0YXRpYyBib29sIG10a19kcm1fZ2V0X2Fs
bF9kcm1fcHJpdihzdHJ1Y3QNCj4gZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAJc3RydWN0IG10a19k
cm1fcHJpdmF0ZSAqZHJtX3ByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gIAlzdHJ1Y3Qg
bXRrX2RybV9wcml2YXRlICphbGxfZHJtX3ByaXZbTUFYX0NSVENdOw0KPiArCXN0cnVjdCBtdGtf
ZHJtX3ByaXZhdGUgKnRlbXBfZHJtX3ByaXY7DQo+ICAJc3RydWN0IGRldmljZV9ub2RlICpwaGFu
ZGxlID0gZGV2LT5wYXJlbnQtPm9mX25vZGU7DQo+ICAJY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCAqb2ZfaWQ7DQo+ICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPiBAQCAtMzczLDkgKzM3
NCwxOCBAQCBzdGF0aWMgYm9vbCBtdGtfZHJtX2dldF9hbGxfZHJtX3ByaXYoc3RydWN0DQo+IGRl
dmljZSAqZGV2KQ0KPiAgCQlpZiAoIWRybV9kZXYgfHwgIWRldl9nZXRfZHJ2ZGF0YShkcm1fZGV2
KSkNCj4gIAkJCWNvbnRpbnVlOw0KPiAgDQo+IC0JCWFsbF9kcm1fcHJpdltjbnRdID0gZGV2X2dl
dF9kcnZkYXRhKGRybV9kZXYpOw0KPiAtCQlpZiAoYWxsX2RybV9wcml2W2NudF0gJiYgYWxsX2Ry
bV9wcml2W2NudF0tDQo+ID5tdGtfZHJtX2JvdW5kKQ0KPiAtCQkJY250Kys7DQo+ICsJCXRlbXBf
ZHJtX3ByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZHJtX2Rldik7DQo+ICsJCWlmICh0ZW1wX2RybV9w
cml2KSB7DQo+ICsJCQlpZiAodGVtcF9kcm1fcHJpdi0+bXRrX2RybV9ib3VuZCkNCj4gKwkJCQlj
bnQrKzsNCj4gKw0KPiArCQkJaWYgKHRlbXBfZHJtX3ByaXYtPmRhdGEtPm1haW5fbGVuKQ0KPiAr
CQkJCWFsbF9kcm1fcHJpdlswXSA9IHRlbXBfZHJtX3ByaXY7DQo+ICsJCQllbHNlIGlmICh0ZW1w
X2RybV9wcml2LT5kYXRhLT5leHRfbGVuKQ0KPiArCQkJCWFsbF9kcm1fcHJpdlsxXSA9IHRlbXBf
ZHJtX3ByaXY7DQo+ICsJCQllbHNlIGlmICh0ZW1wX2RybV9wcml2LT5kYXRhLT50aGlyZF9sZW4p
DQo+ICsJCQkJYWxsX2RybV9wcml2WzJdID0gdGVtcF9kcm1fcHJpdjsNCj4gKwkJfQ0KPiAgCX0N
Cj4gIA0KPiAgCWlmIChkcm1fcHJpdi0+ZGF0YS0+bW1zeXNfZGV2X251bSA9PSBjbnQpIHsNCg==

