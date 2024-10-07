Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EA4CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSianZrtvM4WG8Byvw3XPBT6eqylB7kfOLrmLDcG1Jc=; b=CTxNOujNAQ3yCez1TFH7iWpO7x
	hvif5NlOw51kG5oeoKYMayTTpR41Y2TwgHl/QWU9Penr/uGzzNRyMJWPim+nOcZGFdvj5hDNyS+lj
	HJW/cDsPAbZwyax0EJG0ToBhpkjptMyJABZPC+D0TQG4ocSNyQGJ3H77zPSTVLOW2rFcXiI35tbVQ
	mSPv0c2fNa8Jh+TlH2OjzGVPLiWR3QNL0MBiK758Zvoe7hLqp1AGyLRcWUakJ3zj1ncnMifctFZQ+
	x/Kmz37CQaweGTMHenZc8YgunuihodJCNoaL2rlGI3bmx6Gdu7lXcHQW4E7rIdSptDkBGB1ZFYth3
	VdFM2zqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxouC-00000002lfd-0sOX;
	Mon, 07 Oct 2024 14:40:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxokI-00000002jJr-0rw8;
	Mon, 07 Oct 2024 14:29:59 +0000
X-UUID: 9e463a6c84b811efba0aef63c0775dbf-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hSianZrtvM4WG8Byvw3XPBT6eqylB7kfOLrmLDcG1Jc=;
	b=TFzY+jqVhfPzskn4s4iY8helW0p+BOMTV7dx5zGike6rSaOfNLuXlEPBX/BI6IiG0/BT8jiRFZYNoXxzs996RkKEklChEmIYMdtJ6YIIHpMpvrCIXi2Dl3kxKXhy5sIgPf7ojT95aD8iEfjz7Qk77ITpu/jUjweRU0quacF1VoY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:654cd422-a144-448f-ba4d-751f3b85ce6f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:77bae140-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9e463a6c84b811efba0aef63c0775dbf-20241007
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 191177714; Mon, 07 Oct 2024 07:29:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 22:29:50 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 22:29:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PipXyFDnFVwYlDX5aSr1pIlNIOMov4aJICJM8EtV8UeSYqQIF2cAc1ya6HkZYB/G29WIJLxU5+WhL9Ioz1uO9UTdrMCTHwR9qMdG1a1XGuwMoaTflvmZA5oN7G6o52LhH1EanFu4pzMP/329fh8ZJT3oLkhcQ1UmpP6QW48cVzFspqyLj+OLWN7XjK3U3MQZuheuyVnPorRLUdAD1zomWe4We/ge5Fvh+4lmlPwf6K8As9ZQJuoVYyEwZOHqyy09D7kNGuMXKlxrsqhsK54CvKfguwn/8PHOmMvWhTdb5qBt0pJtT61nyqJEnfCxl+3SQpOUL3lw9NiCJ/B3ZjLcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSianZrtvM4WG8Byvw3XPBT6eqylB7kfOLrmLDcG1Jc=;
 b=QN/hg5naXaBL7q1fPFbAU1eqKBo3RYovIYnXdEBMG1Uh4zyyPZ7AFOnvfEGw9fYZjmEgLjuWMDTWj09LkmkEwSLlre4Y0PDJdj5IzihC5O/EnYm58KmFRYLIf9e6iWHDaYtxPdUkDVIxt+LeAlP5YfU/nFNlwtu7JP/RZ6cAiOypXUXKwleaBH7VDMUqZcuf/OmMekdDL/JPFpJjC8Ey5FmuwKBGQrD/andUiLqMAqC+l9Gjlox3iN703ba4bP9g7WS5tVVKkg1iWEg2YblvOoh4QAD5o1pMruA/IctJUkgEyWGMfTXR88pVTHHk4jHV+IiFrYV1YE52vYLrmNq/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSianZrtvM4WG8Byvw3XPBT6eqylB7kfOLrmLDcG1Jc=;
 b=DcovjfxMIPfCyl0ChM6DucKaIGsZEwjbFBkSpl7xgaJqENK9fnoOd6lywwAK1820/UaFydshsVlFhkmiHqa9768jXyz89OG+LcG1W5d/y3d4fN9HXYuDGLQ7kZgv25GfTjYdy0O3giOXLm7GV2F6WFrEQ3IqnnZNkRXOx77orEo=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB6813.apcprd03.prod.outlook.com (2603:1096:101:68::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Mon, 7 Oct
 2024 14:29:41 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:29:39 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "me@adamthiede.com" <me@adamthiede.com>, "yassine.oudjana@gmail.com"
	<yassine.oudjana@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
Thread-Topic: [PATCH v9 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
Thread-Index: AQHbGIbKVGGlHXcoSEGwn045U0yDqbJ7B7+AgABR4AA=
Date: Mon, 7 Oct 2024 14:29:39 +0000
Message-ID: <972aac8f17afedde8c4ba8b5fb4be560f6e49672.camel@mediatek.com>
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
	 <20241007070101.23263-2-jason-jh.lin@mediatek.com>
	 <703213a8-1ac6-4c8d-9487-ea1dbdabec40@collabora.com>
In-Reply-To: <703213a8-1ac6-4c8d-9487-ea1dbdabec40@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB6813:EE_
x-ms-office365-filtering-correlation-id: 8b23a5e9-4b59-4e8e-509f-08dce6dc7a28
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZG1xcEppRXJCRGhsZEp2UDhSdG5SZ3VsdWswY0ZxeGJmaFpXcHN4WWNvSWdi?=
 =?utf-8?B?NlplczdsZWxlVGxMdlBxaGdKZWViSm0wZzJaZFhkRmZRYkd6ZU1DM01ZZGZV?=
 =?utf-8?B?d2RKYzNxeUFOcFhYMHA3bnFqaURpcHN2c05EVlVyVFBjc1gyTFhjUUY2eUhn?=
 =?utf-8?B?ZFpqbGdqSGh3L1FjeStzV1RlRnAyTm9aeEUzbzJlSFhQZnRmOFV3dXVFd01S?=
 =?utf-8?B?c2RTVDFTUkt4NFlSUHc3dmgxQ2JOWFlKcVZ2NEw1QTBodjFpMVovWGlyNnQ5?=
 =?utf-8?B?ZmJrcG83WkhPaWIycHM5VDUyZlB6NjR4ZW1qRnBRbUVjb0hldmVrMHUxQ3Y5?=
 =?utf-8?B?YndIbEhZSnlDd2I2a3FmeGdicnp0M1QzY1JYUnRwVTdaQ0VpelRRRGZ1SmVX?=
 =?utf-8?B?VjlIVzBxWFlRUndacVdMUGpXdDQ0a1ZrTWFyZldEM1NoTWRYUjEvbVlQZzRT?=
 =?utf-8?B?TFpCeXN6QVNEaGRpV3BKZ0R3djZuOFJqV1R0MnprV2JHN3V0di96bERjNFhl?=
 =?utf-8?B?bGJCV0ZrZkQvcHRIUys1NlhraHlDejNwUGNTcVk4WU1ONzRaczkwbTlKaXZr?=
 =?utf-8?B?dDlPK2wvSi9tWTc2RTJMcVl5cEZpbjQxNUx6a0RvRGVTc1M4NjNPb25zcGFF?=
 =?utf-8?B?VzZ5Z1dPQ1VQYndVZVE4T2tacDhsREtHTFFGREpNTXJVam5iVEhBekNwTjM2?=
 =?utf-8?B?Q3lYQktXNGpnUysyT1ZLMnJqQVNJR2h0K0RLQ1ZWR21nQzVRVGJWdVM0UGR0?=
 =?utf-8?B?aFdndy9zZ3Fxbkd6MEVHN1hCeW9BQk44a0t2bmpOVmM4VCt3Nm9vUXVDVFB3?=
 =?utf-8?B?bTBKc3d3L0RPQlI3cWlOR2dkdk10SkFrT2ZSUjFWdnNLaW15clgwSUMzUVJD?=
 =?utf-8?B?YTRlRDMxY3Ruditva1Z1WXhtVkFkYk9YZ2VHK3VrMnRlYWJxd3M4MVZOdnAy?=
 =?utf-8?B?RW9xb2pwZjhxVXUwR1RRMHdNSjcvZUhMazNPRVlBenUvNTJzbkJtN3FCeVlZ?=
 =?utf-8?B?QXF1ckNkNjBzQSt5QnF6VS9FSlgxdzRZYTJsYksyRFNIdnJxL2dTZTRBN1hQ?=
 =?utf-8?B?UTZnTTNPcFlHWGR1aEY3ekhwWDNQQXg1VzM2Y3NQdEw4ZDc5QnVIdUUwYy9X?=
 =?utf-8?B?Qm5QODU4cHBzbmc1dFo2L1dxNUJvWUEvWHNHdkNLakF5eFFsR1BJUmU4MlZ6?=
 =?utf-8?B?VEZsTlFZWXRnbmt2cmlBaktMS284TTEreFFFTlJxV1J4QmpETjRHenMzd2tN?=
 =?utf-8?B?cU4yZGo4VG1WOGUxS1AxSlB3WjN0OUFEdTRFSmE5N2xNYmQ0aktUcTUyZHN2?=
 =?utf-8?B?U29VMzlBS1pDa3NJTE5oSTJvU3ZoSCtWbkJraHVMOHVxdGw5cUhPSXBqVEcz?=
 =?utf-8?B?RUpXQW15NHRuc1ZOMDMyc2U1UlBVUDZ5Z3hTVlJlc3BEY0dJQ1phakxRU3Ax?=
 =?utf-8?B?VkpvVnhkUE0waUl5T3NSS05pd3ZJejNENDhoSmhYZUZZaCtzQ3JmUTMvcWpt?=
 =?utf-8?B?OFlwTGI3aTJQNDlnTnBjUVNxd2w5WWFvek4vOEU4THVrdDRkTkRId3JIWXM1?=
 =?utf-8?B?SlZlZTJHeGpiUkRMb1NYb3llM2VDR3NqZzBQL3JZblRrTWNjUExHQ3FGaUdw?=
 =?utf-8?B?VUFnQU95cTVFanlxRU9lMTVUM1p1WmxsYUhIcGpNYlR5OG55ZnZYSmFhaEUz?=
 =?utf-8?B?SEpMOVdEenlvdDRNcEdZTEM1OE1kVWJuRUQ0UkVwMDhLUW9FSmY4OXVEd2dX?=
 =?utf-8?B?WWF1Mm5SY1NHQWh5eG82dk94Q1d5SHYvLzBxMTdFWDB1VC85MXNDMDRXclNk?=
 =?utf-8?B?NU5YV3FCbTByeWc1TGRMQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFg5d0pOSVlMNWh1eUxZaVNqd2lkM0FBSk1WUE01YnZxYUVEUmdNa21sZHQy?=
 =?utf-8?B?MGdiQXRSa2dMUzdUejcydEp6aC92UnUyVWFPeE1YbWNDM0hrSTBqV1E3Ykox?=
 =?utf-8?B?TjM3eGZZMUxnYnk4dUdpRnYrWWdsakJDNFJtb3lUeGxGRkxkQ3AyV0tneGpn?=
 =?utf-8?B?VGdFekJrOWQ0ZW41M3pIKzVrb2V1cmJvM1hmMC9hOEllSlprb1Y3elFlL0Uv?=
 =?utf-8?B?ZFd0YzNPOW9GWG1vbFZOVmZ1SWR2aXc2T1UwVW5obEpiTloxSmtuZkRCKzRU?=
 =?utf-8?B?b1ozNWs0NHc3Z3hRNkovMGlibVd2RjBmWUZickJOS3JQNldiamxhZUk0NkpG?=
 =?utf-8?B?VDdIVGtXcXhZc3JaNVM1V2xRN1hYUTA3cDQzemlzRDZYYXpzUkdySHdoYzlo?=
 =?utf-8?B?UVZiVkNKTTlDS3VOUEVYWXpiSGNPdEtoMjJLMTJiZDdPYWJjMGVvVlNBak9R?=
 =?utf-8?B?c0luaDZ2UmxiRFgvaXpzQ3dnRXlMaXhkWi9Uc2FxZWpMbFhXN2t4dFVXR0lH?=
 =?utf-8?B?SmcxU2NxUlpGQ1NQbFNZeC9teTY0M05QSWFpcHJyZ3QvdFpSODJkeUoyOWFj?=
 =?utf-8?B?WU85V2tNWCtYRkQ0aHZRcVdsY0dLYTlmT1BPNUdyOHRUejRhb0NGcktaSU10?=
 =?utf-8?B?SldTM0l0azhPTStDbDQ1YTZsNW5vd0JobFZ2V29PSTU1VHlrcndpR1orSnJq?=
 =?utf-8?B?SUtNelNmOEt6SmVUTW9qQ2hjakNPU2VXdW10bW1sK2haRXJLS1V5Y1ZNcnhU?=
 =?utf-8?B?ejBuNy94VUZXUGpNTXV2WjB0K1p4d2VDTkZ2c1dLdTMxWlVtRklwTEQwRzhn?=
 =?utf-8?B?QXQzbDNjRVJscnVKMms3SUpLWjM0VnhGV3V5TWxQeDBkcTZkZ2NkQUlFMWRk?=
 =?utf-8?B?VEVYZkw5eHdWTWt2T1dzY3NmcWQwM1d5ZFdJbVZlbkhnZVYzZDk5NFBuY1lm?=
 =?utf-8?B?ZTZFMkwxb1BHcjBFSm43OWZ6ekduQ1NOckhqeC9zVzFtSlFPRTNmMkIxd1g1?=
 =?utf-8?B?QmNJeldEZ3A4OXZFZ0pXWXY5dFlZWnpPOXBlekloTGhDazJWdUx1ZmptdDlY?=
 =?utf-8?B?dm83ckI4KzhRcXQvVHRodFYvSElrRzc4elZuTmdRbERIdXZTbElibnNNUFJx?=
 =?utf-8?B?ZlRJelYxWmpnWmlmRXVsUXlNZmVQb1ZPaEgrY0xLdTZTZzlyT2F4RXFhUW5n?=
 =?utf-8?B?TGE2L2x2T0RYY0VuNk52Z29pTHZyYkhjVmFPYWFUQ2xkRnZvYzZFNkNweHV0?=
 =?utf-8?B?b3NRVXFMbXFtaUlRVjRyQ0J6Y0FHNTlQWlJET3VBYTNiWWRUS2JZK01xOGtO?=
 =?utf-8?B?eDBTcFJHZHpKZWExRHRtV1YrQitmblFqNzcyTmpWcm1BTzJBbElEVGdvWURP?=
 =?utf-8?B?U2kvdExWcTlJV3dIODBQcU5LOUpaeVRyZmVIMlJtQlJ6eVJnandNL1EzZ2lD?=
 =?utf-8?B?NklnczhTNk1nUlhLUjNNcVhFa0l0VG1OaXdtK2dsUlY1bHh1cWRvUEVUWW9S?=
 =?utf-8?B?dnRwT2JsVWZkSjlFS2lFeUVUdFZacGVTNjZic1c5RDlpMTVheDQxbFRZQnNx?=
 =?utf-8?B?RUlKOVdVd1ZOMHNoV1JrTGdET2d0eFp1VVhreTJsZnRsQlVSR3RlVyt5d1g5?=
 =?utf-8?B?dmI4Z2dqUDNkN25hcDUrUHdveGtNVmxrVlBJMVMyNGpWWkxNSWhWRTNVSjg0?=
 =?utf-8?B?a1RXczZIb2dLMThjL1cxN2VGd1o2ZDhCd05idjhPaWpWTGVMMmNISUdOL0Y5?=
 =?utf-8?B?bTZ6Mm02MWJJS2hvdHc4c3NoS2pmc1BXYUN1bmFiUlFQWEtVOVE1ZmQ0UGUw?=
 =?utf-8?B?eUVJSlkzVEdHeWMvcm4zZlNRU0ZXaWl0cEVLN0x5elNLSkhtc0ZCODVjdTVM?=
 =?utf-8?B?UkExRUdLZXFMZytSUUpjSHVUdGlpZmQ3dmNpbXJjK29pOENXa1pTWVVRYi9T?=
 =?utf-8?B?a3BNTXhKd055QWl1N1FUR2hudEZTRnNSTVNyOEt0U2ZRc2h6MlZxaXRaazNK?=
 =?utf-8?B?My9INDdoVTBWU2ZLQ2h0cjNkNkVHN29Ec0NJZFF3bkNaTnprZVhSOEk3Tk5Z?=
 =?utf-8?B?a1FTSVBtWEYyN0tXUDE3VFkyb0szR2UxRXZZc0hqSXZvQ2JPZEZTMURxNGg3?=
 =?utf-8?B?b2lpczFHYlNTakVvTFhNYUhKNVgrSGZWQ0orUTl3aDVEbVdIaGVmc2JPS3lE?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02D6B6ADE7775D44893AFF5B66BF9D8D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b23a5e9-4b59-4e8e-509f-08dce6dc7a28
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 14:29:39.5801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0q40IOUPagbD/CA2EbKoyWt8MyrwM6MxaECgXzCNKofWDdhaA1fFbkQFd6xcdi+t+jYTkofhvFZ1BTxwVWD33ZWh561Cw3Avh7Ka+cWXQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_072958_292946_511DF9A6 
X-CRM114-Status: GOOD (  26.63  )
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

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBNb24sIDIwMjQtMTAt
MDcgYXQgMTE6MzYgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJ
bCAwNy8xMC8yNCAwOTowMCwgSmFzb24tSkguTGluIGhhIHNjcml0dG86DQo+ID4gSWYgdGhlIGNv
bnN0YW50IGFscGhhIGFsd2F5cyBlbmFibGUsIHRoZSBTb0NzIHRoYXQgaXMgbm90IHN1cHBvcnRl
ZA0KPiA+IHRoZQ0KPiA+IGlnbm9yZSBwaXhlbCBhbHBoYSBiaXQgd2lsbCBzdGlsbCB1c2UgY29u
c3RhbnQgYWxwaGEuIFRoYXQgd2lsbA0KPiA+IGJyZWFrDQo+ID4gdGhlIG9yaWdpbmFsIGNvbnN0
YW50IGFscGhhIHNldHRpbmcgb2YgWFJHQiBmb3JhbXQgZm9yIGJsZW5kX21vZGVzDQo+ID4gdW5z
dXBwb3J0ZWQgU29Dcywgc3VjaCBhcyBNVDgxNzMuDQo+ID4gDQo+ID4gTm90ZSB0aGF0IGlnbm9y
ZSBwaXhlbCBhbHBoYSBiaXQgaXMgc3VwcG9yZWQgaWYgdGhlIFNvQyBzdXBwb3J0IHRoZQ0KPiA+
IGJsZW5kX21vZGVzLg0KPiA+IE1ha2UgdGhlIGNvbnN0YXRudCBhbHBoYSBvbmx5IGVuYWJsZSB3
aGVuIGhhdmluZyBhIHZsaWFkIGJsZW5kX21vZGUNCj4gPiBvcg0KPiA+IHNldHRpbmcgdGhlIGhh
c19hbHBoYSB0byBmaXggdGhlIGRvd25ncmFkZSBpc3N1ZS4NCj4gPiANCj4gPiBGaXhlczogYmM0
NmViNWQ1ZDc3ICgiZHJtL21lZGlhdGVrOiBTdXBwb3J0IERSTSBwbGFuZSBhbHBoYSBpbg0KPiA+
IE9WTCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX292bC5jIHwgOCArKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYw0KPiA+IGluZGV4IDg5YjQzOWRjZjNhNi4uODQ1M2E3MmY5ZTU5IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+IEBA
IC00NzMsOCArNDczLDE0IEBAIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IGRldmlj
ZSAqZGV2LA0KPiA+IHVuc2lnbmVkIGludCBpZHgsDQo+ID4gICANCj4gPiAgIAljb24gPSBvdmxf
Zm10X2NvbnZlcnQob3ZsLCBmbXQsIGJsZW5kX21vZGUpOw0KDQpCZWNhdXNlIGNvbiBpcyBhIGxv
Y2FsIHZhcmlhYmxlIGRlY2xhcmVkIGluIHRoZSBiZWdpbm5pbmcgb2YNCm10a19vdmxfbGF5ZXJf
Y29uZmlnKCkgYW5kIHRoZW4gYmVpbmcgYXNzaWduZWQgdG8gdGhlIHJldHVybiB2YWx1ZSBvZg0K
b3ZsX2ZtdF9jb252ZXJ0KCkgaGVyZS4NCg0KPiA+ICAgCWlmIChzdGF0ZS0+YmFzZS5mYikgew0K
PiA+IC0JCWNvbiB8PSBPVkxfQ09OX0FFTjsNCj4gPiAgIAkJY29uIHw9IHN0YXRlLT5iYXNlLmFs
cGhhICYgT1ZMX0NPTl9BTFBIQTsNCj4gPiArDQo+ID4gKwkJLyoNCj4gPiArCQkgKiBGb3IgYmxl
bmRfbW9kZXMgc3VwcG9ydGVkIFNvQ3MsIGFsd2F5cyBlbmFibGUNCj4gPiBjb25zdGFudCBhbHBo
YS4NCj4gPiArCQkgKiBGb3IgYmxlbmRfbW9kZXMgdW5zdXBwb3J0ZWQgU29DcywgZW5hYmxlIGNv
bnN0YW50DQo+ID4gYWxwaGEgd2hlbiBoYXNfYWxwaGEgaXMgc2V0Lg0KPiA+ICsJCSAqLw0KPiA+
ICsJCWlmIChibGVuZF9tb2RlIHx8IHN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkN
Cj4gPiArCQkJY29uIHw9IE9WTF9DT05fQUVOOw0KPiANCj4gSSdkIHNheSB0aGF0IHlvdSBzaG91
bGQgbWFrZSBzdXJlIHRoYXQgT1ZMX0NPTl9BRU4gaXMgbm90IHNldCB3aGVuDQo+ICFibGVuZF9t
b2RlICYmICFoYXNfYWxwaGEsIGFuZCB5b3UgY2FuIGRvIHRoYXQgbGlrZSB0aGlzOg0KPiANCj4g
CQlpZiAoYmxlbmRfbW9kZSB8fCBzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpDQo+
IAkJCWNvbiB8PSBPVkxfQ09OX0FFTjsNCg0KSSB0aGluayB0aGUgT1ZMX0NPTl9BRU4gd29uJ3Qg
YmUgc2V0IHdoZW4gIWJsZW5kX21vZGUgJiYgIWhhc19hbHBoYS4NCkNhbiBJIGRyb3AgdGhlIGVs
c2UgY2FzZSBoZXJlPw0KDQo+IAkJZWxzZQ0KPiAJCQljb24gJj0gfk9WTF9DT05fQUVOOw0KDQpS
ZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gDQo+IEFmdGVyIGFwcGx5aW5nIHRoZSBwcm9wb3Nl
ZCBjaGFuZ2UsDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+
IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gDQo=

