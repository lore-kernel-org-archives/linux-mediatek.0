Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76901CE79AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 05:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2nR4hrrdOLLKkcl8ThUaH0bnR6JJiRyMstTZzBiuU8=; b=AHgacDhcEieHefjlCShiz6ON5t
	VjyqWmJP0MiIrNah9o2QDs3Nny5k/UXIkYfdOBcQNJRRXz0gqyA4KGH3jHXHTORKNIyxeRq9IZ/6H
	ouLD2T91DHYBmAmafWYve8JRpFkzIsWFmwx/g7En+ScGBHGq74TNqRxC/78lzqfwlwcZK7dVZ/jGq
	kUC/3/Nl3Om5P2Np0BLSMBmMYeUOgGrhZm/7guXcirQDObtLxugHUHPTCgW/i12W77aitTrBlEXeU
	LeRdJGSp4aV8Ev2m647L0FjmLRf4ZGOvxSXmoPh17pcQGQUkmbygLF8TbYPxh10UaP2gSxKd8Cb4a
	hnqSopIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qipiB-001uRp-1v;
	Wed, 20 Sep 2023 05:25:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qipi6-001uQp-2H;
	Wed, 20 Sep 2023 05:25:16 +0000
X-UUID: 0fe662ee577611ee9b7791016c24628a-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=o2nR4hrrdOLLKkcl8ThUaH0bnR6JJiRyMstTZzBiuU8=;
	b=DCrkyOLlj+4dH79Hjsyixn4KB6OYsGRIAjq+vadc/p7PNOor0QE0r2kusDsQX2yNzRpVEca+VLKtFAyg8aTB8l0wEkZ4P8KEcDzxKYpQxa0gWXeuiCy73uLALUi78gFGINki1SvYk8siQqykzYLvwarCl/iKjNDN0kyajMYSE2E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:87931f95-9997-47bd-ad2c-248ed2a19c47,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:aa1de8ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0fe662ee577611ee9b7791016c24628a-20230919
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1828644546; Tue, 19 Sep 2023 22:25:07 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Sep 2023 13:24:30 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Sep 2023 13:24:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG1yb4+SDpAp2L7eYQnw+aZuKDaoGhldOeoWqg9wZAPFycSh18/Jaf8ji6WvkGtwAEi4vhxUkzHRMeOg/8F4JtQYFVS4rMLcikjW1zV7yhCClTOH7vTgFPQFDbgsIPGKVnuio2ODlvwQDvFEKC8gRGkxQKS8zYkSncq2oFYs/pzdt4MLRns4KFoy02Ph3aVq8Ze+wiTN/RNjzp88jL+GxZF6F4m+KszKEKPJu8jvLY6TLsRne5uNTY3+ofxDEhLw/mR4EnlTYsf8cln5QO+uzPhV1umhbzcvd6anyeXflgQ+Z9gQ2XliZvV20YVuQRsakfQYhxiUmBqsy6z1zc8kIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2nR4hrrdOLLKkcl8ThUaH0bnR6JJiRyMstTZzBiuU8=;
 b=ftbGqHXqbgt5YgMsWV690fUVpA3Q6foknldezU5ytEMM8ZJbWLPyL6bm8sMItyXGCRkmPitgtH5uVgvDk246tXJbF52heBVPiNhe3inTC+uTSzjCBSS/ZkBQzkJYBAaOHCcqdWlMCenUSIAwW+f99sjwnGaePWh9TeNou2XOr/23RPMz3MtXejUxvT8zpZ6bHdWZvL26qrELl4IgD39KKgCkfuid0JBLGe3qAW8SbG3EEzGtM+JbC5AcFKko8NdHwd1hzHhkO4u3o5tTQdTQrcNfOfE8kIKpkR811MxNeE5lpBwSAyUep0TyZTowRpL8RohlO6UiV8Y17491i+XDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2nR4hrrdOLLKkcl8ThUaH0bnR6JJiRyMstTZzBiuU8=;
 b=e1MGW15VJltoZyNRyiUNEaMQT1uRLcFD1vMwo1j5d1MEvPOUbphSU5CyVLYyaqknpBuTaufRHo9FM+y0iYjGyUAs4POMh4F/wLatdrO9Go3y50xAfRDcX3IHqHHmiCApn0xy87sL7ONJ/WBbSSSBVfbqRlX+gbbySC7SDAoD0Mw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8034.apcprd03.prod.outlook.com (2603:1096:400:463::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 20 Sep
 2023 05:24:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 05:24:27 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/10] Add mediate-drm secure flow for SVP
Thread-Topic: [PATCH 00/10] Add mediate-drm secure flow for SVP
Thread-Index: AQHZ6qYCRTH7YrTpyk6QXsEzLaAxhrAjMCUA
Date: Wed, 20 Sep 2023 05:24:27 +0000
Message-ID: <a0b32a1d93bc9d991f77ad3408fe7b177bb32889.camel@mediatek.com>
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8034:EE_
x-ms-office365-filtering-correlation-id: c40e2db2-adc9-4810-5451-08dbb999dbf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ltuBeq+FVXnPu951OMwLByFWp6ilCm/Whm0/B9b8AJmS7iDY9iEbuSwsBD/X04DB1/IPTVqPnsQ1zUGrBfALQZ11BSruc4oU/UVoiSJMfZ0RGNndJ+ufdPhW3RlTF214akKm60LC19/yxv4UrUqF46elTaB99Qly1yNBktcNRhirdG7U5xsV98VUUTink2QGcmupCfCZStK3At32ADNqeuLCmHAurYpcCxCcScKuVfbZgZVKE+c+2bkLkT8TbXBk3kL7pdoTfBonjPYxdiJnzfUihtS24z33dDyneKiYqlU3jguWTQ/cBP4YkXLwNECWRBtBLC4Da4vrakm+nB56ctsoZEH6de5Nay4Xk5gfZAAH8IZTZbvclXXnH9SIy2A/THmSSmj9HtQbpPq2wN2vR/bzXiBASiP1BGYYn5x8Z/rz8m8h4mvxgpqBR+usaYQcYEUchZFjQ95FEtHU1MGCteKO+30kCAr6DBE+cXyVsS4IrwvfsH1196Chl/iG4VUNExCQ5zsl1/07aJ321fFZZTsZJB89de2Uv4FiQjFJnSnu7I9VLZNDF3d/QxE/4B1TFiBWpbGp0Y7YAd537Liwd81FmyTo4DugpgZ1lX6QVvqhNpkjqUZ5ViUxwM6E9+FtJFMdMBqsyq8fBGi5gnkslY8A5cP00bUUBRv8lQ/AjemClB+f7yOALoJ24xEBFViK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(1800799009)(451199024)(186009)(64756008)(66446008)(66476007)(4326008)(966005)(41300700001)(76116006)(54906003)(8676002)(122000001)(316002)(6486002)(6506007)(6512007)(66946007)(71200400001)(478600001)(83380400001)(8936002)(91956017)(110136005)(66556008)(2616005)(38100700002)(2906002)(7416002)(86362001)(26005)(38070700005)(5660300002)(85182001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWVsSUlYRmF6MXRVU0JWdEwwSEwwOUNia013WmxHWnN5UWdCaW1sR203SEN1?=
 =?utf-8?B?OE5MYmJLaWp0bnFMWk5xN0ttRVA2b2JiMmRNaW1yWitNdHVrTUxWdlNUYk15?=
 =?utf-8?B?UTdhVkFYR1AxR3pMUDVKazBLSk9VS201bW0zNHBwc3Y4RHZzR3d2MnMrQWdQ?=
 =?utf-8?B?NVpPOFoyUDRwZW1GL3ZIRGM1aHpJTkRpM0NMUTUvWFJ5VDVPL3dYQzVyaFNL?=
 =?utf-8?B?OVdENUcwTDFlb21zOTNNbUhCK2VRMGMyOGtZMlVKb3pDM21RNEE1NjRocWlM?=
 =?utf-8?B?a1ZDa2dmNm1iNlFlbEtMdWw4TXhnalJkMlRIOTVEMGd4Yk55bDlvekZYZElu?=
 =?utf-8?B?WlZ5bWozcjBuMlg2L1JaY0RQWHNkU0pwUVNJOVFOWVVNakdkU0JqSlBabExZ?=
 =?utf-8?B?U2E4aG1MSjZ1bFhYN1Z2VG92czZSUnRTV1lLazlDRHpxUlJPS3U2cWVQZlR0?=
 =?utf-8?B?aW5kY09NZE5hRStQMFczNnN1UGR6STRVeDRzNDEyZVlERWNPV1E1aDVxajlp?=
 =?utf-8?B?Qkw0RzJHY0xXaVRxbktQQW1CcW9jRlpWbFFPakRuakNNVDBsT0JLNVJvUHZL?=
 =?utf-8?B?c0tDbm8xS0pBTzZkZEhpUjRzRFlPM0s1SU9GTEIrZFRRQUVmcFVvbnZCd3FV?=
 =?utf-8?B?MkdLMnVyNlh3dmZ1Vk9qR3BOeUU1OUpaL3dkQVVTdDk4ekY4YTNmMndDS3Jy?=
 =?utf-8?B?RUd3RW52QmpYYTEycE1aVmhUUDZWcW5DNXRNbFBPOFlZNmxjWmYrb0gzWmJR?=
 =?utf-8?B?TysyT1JDKzUrV3ZBZXRyTWlBMWMvWjhrT0NwQ1IyVVY4MGVmaVZ4V0dsTnA2?=
 =?utf-8?B?dWsyNjRzMWQ0NXVYM3g4Wkw4Nkx3ZUpNL2o4Q3pwZFpCQlozTWEycGdFSHdK?=
 =?utf-8?B?RDZ1eTVmdDR4dlFkVFU2MXNBNVFEWHdUOEYxbzdrR21jQnRTR09ZTVZiQzdI?=
 =?utf-8?B?bDIyNlMvUmNXcndmUG5UZnlCMEFvQkNjYUR1Sm5DV2pVdUk1Y1ZraHlnK25t?=
 =?utf-8?B?SHRFcHRlT2UrckowNlRqOFo2ZWs2UlRTMjFsMENpT3NiTlllcFNjTWtIL1kx?=
 =?utf-8?B?QXFleStnZmlpaEdaNE43dmtGdmZLWVJacUtLcVVUQ3IwUTk3NFpld2VuTnk5?=
 =?utf-8?B?R1UxWnJkWm5XTDFUbGZpeGZKTTdlbFRyOE1uODAzTDdxNlR5K0laSGlNNmpq?=
 =?utf-8?B?OENTQ2RzbVgzRVJHR1ZsQWNpKzJ5NTNhaHlnMGhPMWxkYjhacHFCVjhpQWMz?=
 =?utf-8?B?Vm8xYnVKb1BaREZRTFBiT0llMzR2bkc1b3Z1T2hRWEt6NE1ReDkzWTJabGtp?=
 =?utf-8?B?TUM2QjRQNm4yNjY4aklWYWNXaEtFYzFyLzVpUC9wS0lKU1kyc0g1RUNwMnNV?=
 =?utf-8?B?ZGREMGw3SHZlYjdOWUNiNCsxR0xoV0kyQnhyVUFSNVlEd095YjB1SUdYM2pr?=
 =?utf-8?B?a0dXWlA0eUhaYklEK1lHWXdJeGo0YlRxSE4rYllaaTI0MXBBRGNJT29VYTlj?=
 =?utf-8?B?M1k3ZUw1R0lsUzNFQ0toOGRiTE1Hcldob2VJVUl4WkNubFVLQmlmV056Rm95?=
 =?utf-8?B?QU01OE9jczJRSXVham5OUzlQeXEwYkpZb0VJQkJ4RmZqUG80YlpOVmJiZ0F5?=
 =?utf-8?B?RWIxZ3htUHROajVwS0lTUG9oK044cVF4SzlFWUNTTG9XVWhhM0FUd3plcE9v?=
 =?utf-8?B?MHRud3hGT092Ym9DcGFyYjlid0VOaVlzTkNSSWkwOStWM1J5emdkNmloaVg3?=
 =?utf-8?B?ZGxESEU2QXJpZVp0aDBKVHVodCtxTXgraXZScEpPajI1YVRSam02dDJLalNt?=
 =?utf-8?B?bEEyWWRidlJtV2Q5M2QzcFpXTE8zNHo0TWpnQVBVeUc0b2hxQWR4NG95NHQ0?=
 =?utf-8?B?UDVRNG1kWEZFRHppWW5oTFN1TDJvSjBRRk8vR2lSaitvZTdSUG5TK1JHUzB4?=
 =?utf-8?B?eFEwTVIyam5kaWE0R1N5bks4SnV1dXdRUTgvSWhxL0VXNkpsK3BCdXJhY0pE?=
 =?utf-8?B?c3RIc0dCdUxBVzgvSEVWc2IzV05NU0JvTmFJc2VWWUlIRXUxVFZROURUbkpj?=
 =?utf-8?B?S3NLS3ZySU52TlYwQTlHRmpPOW80TWFNVGo3emdXSVJIWEd3WGRoN3BDemRW?=
 =?utf-8?Q?aS9keoxqHhhkRFVrSIuEN+JY9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5326981210713246B72678592854D560@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40e2db2-adc9-4810-5451-08dbb999dbf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 05:24:27.4404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0JDO/3iBdtjtn5NRupNUCJNwjxNRHrXCMeiH50HNIuNKN7ZwwokrkZdli6c6OSBtRUse5KTuIQuAw2oeD4JRKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8034
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.659500-8.000000
X-TMASE-MatchedRID: 1GZI+iG+MtcOwH4pD14DsPHkpkyUphL9uLwbhNl9B5X3bBqxmjinTRIx
	brFH1ukaRAjjCBWd1tUf/y0sK4p0r8ZR5zLxbV5qGNLhPvxZUaeusS9CiBzL8XFRl6C48ENBBC1
	/jK6FDMWUZDAkfC4/Gh33Gv1GIdsqpVK4ErFPeUK9HTxRE6QQB3JrB0Cu3DDnVz8J52OVy+RSeu
	a3vdyb5MDQf9MhqfQqrgkh0Mfj42pUAmzcvaRR9/yAR9DgC/hHsEf8CpnIYtkR34ro7k23neJ85
	MO4rWjIfETHO1LjJ48ScHHX0rLXBMOYR/M8CPo6H5YQyOg71ZZU3K6aV1ad7Zsoi2XrUn/J+ZL5
	o+vRV7xKWdTfwsJjy2LHjeGkjh9X3QfwsVk0UbtuRXh7bFKB7h0A4TGxkwpHIYqE9sKwyF+Zspl
	So4m6RB6B0k+sWkPXNkUSDDq742k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.659500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 206FD3D2683941118CDD7D1C01BAA98542DC2729B2947802C4C5714A80ED3FA22000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_222514_757726_40EB821E 
X-CRM114-Status: GOOD (  22.60  )
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

SGksIEphc29uOg0KDQpPbiBUdWUsIDIwMjMtMDktMTkgYXQgMTE6MDMgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gVGhlIHBhdGNoIHNlcmllcyBwcm92aWRlcyBkcm0gZHJpdmVyIHN1cHBv
cnQgZm9yIGVuYWJsaW5nIHNlY3VyZQ0KPiB2aWRlbw0KPiBwYXRoIChTVlApIHBsYXliYWNrIG9u
IE1lZGlhaVRlayBoYXJkd2FyZSBpbiB0aGUgTGludXgga2VybmVsLg0KPiANCj4gTWVtb3J5IERl
ZmluaXRpb25zOg0KPiBzZWN1cmUgbWVtb3J5IC0gTWVtb3J5IGFsbG9jYXRlZCBpbiB0aGUgVEVF
IChUcnVzdGVkIEV4ZWN1dGlvbg0KPiBFbnZpcm9ubWVudCkgd2hpY2ggaXMgaW5hY2Nlc3NpYmxl
IGluIHRoZSBSRUUgKFJpY2ggRXhlY3V0aW9uDQo+IEVudmlyb25tZW50LCBpLmUuIGxpbnV4IGtl
cm5lbC91c2Vyc3BhY2UpLg0KPiBzZWN1cmUgaGFuZGxlIC0gSW50ZWdlciB2YWx1ZSB3aGljaCBh
Y3RzIGFzIHJlZmVyZW5jZSB0byAnc2VjdXJlDQo+IG1lbW9yeScuIFVzZWQgaW4gY29tbXVuaWNh
dGlvbiBiZXR3ZWVuIFRFRSBhbmQgUkVFIHRvIHJlZmVyZW5jZQ0KPiAnc2VjdXJlIG1lbW9yeScu
DQo+IHNlY3VyZSBidWZmZXIgLSAnc2VjdXJlIG1lbW9yeScgdGhhdCBpcyB1c2VkIHRvIHN0b3Jl
IGRlY3J5cHRlZCwNCj4gY29tcHJlc3NlZCB2aWRlbyBvciBmb3Igb3RoZXIgZ2VuZXJhbCBwdXJw
b3NlcyBpbiB0aGUgVEVFLg0KPiBzZWN1cmUgc3VyZmFjZSAtICdzZWN1cmUgbWVtb3J5JyB0aGF0
IGlzIHVzZWQgdG8gc3RvcmUgZ3JhcGhpYw0KPiBidWZmZXJzLg0KPiANCj4gTWVtb3J5IFVzYWdl
IGluIFNWUDoNCj4gVGhlIG92ZXJhbGwgZmxvdyBvZiBTVlAgc3RhcnRzIHdpdGggZW5jcnlwdGVk
IHZpZGVvIGNvbWluZyBpbiBmcm9tIGFuDQo+IG91dHNpZGUgc291cmNlIGludG8gdGhlIFJFRS4g
VGhlIFJFRSB3aWxsIHRoZW4gYWxsb2NhdGUgYSAnc2VjdXJlDQo+IGJ1ZmZlcicgYW5kIHNlbmQg
dGhlIGNvcnJlc3BvbmRpbmcgJ3NlY3VyZSBoYW5kbGUnIGFsb25nIHdpdGggdGhlDQo+IGVuY3J5
cHRlZCwgY29tcHJlc3NlZCB2aWRlbyBkYXRhIHRvIHRoZSBURUUuIFRoZSBURUUgd2lsbCB0aGVu
DQo+IGRlY3J5cHQNCj4gdGhlIHZpZGVvIGFuZCBzdG9yZSB0aGUgcmVzdWx0IGluIHRoZSAnc2Vj
dXJlIGJ1ZmZlcicuIFRoZSBSRUUgd2lsbA0KPiB0aGVuIGFsbG9jYXRlIGEgJ3NlY3VyZSBzdXJm
YWNlJy4gVGhlIFJFRSB3aWxsIHBhc3MgdGhlICdzZWN1cmUNCj4gaGFuZGxlcycgZm9yIGJvdGgg
dGhlICdzZWN1cmUgYnVmZmVyJyBhbmQgJ3NlY3VyZSBzdXJmYWNlJyBpbnRvIHRoZQ0KPiBURUUg
Zm9yIHZpZGVvIGRlY29kaW5nLiBUaGUgdmlkZW8gZGVjb2RlciBIVyB3aWxsIHRoZW4gZGVjb2Rl
IHRoZQ0KPiBjb250ZW50cyBvZiB0aGUgJ3NlY3VyZSBidWZmZXInIGFuZCBwbGFjZSB0aGUgcmVz
dWx0IGluIHRoZSAnc2VjdXJlDQo+IHN1cmZhY2UnLiBUaGUgUkVFIHdpbGwgdGhlbiBhdHRhY2gg
dGhlICdzZWN1cmUgc3VyZmFjZScgdG8gdGhlDQo+IG92ZXJsYXkNCj4gcGxhbmUgZm9yIHJlbmRl
cmluZyBvZiB0aGUgdmlkZW8uDQo+IA0KPiBFdmVyeXRoaW5nIHJlbGF0aW5nIHRvIGVuc3VyaW5n
IHNlY3VyaXR5IG9mIHRoZSBhY3R1YWwgY29udGVudHMgb2YNCj4gdGhlDQo+ICdzZWN1cmUgYnVm
ZmVyJyBhbmQgJ3NlY3VyZSBzdXJmYWNlJyBpcyBvdXQgb2Ygc2NvcGUgZm9yIHRoZSBSRUUgYW5k
DQo+IGlzIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGUgVEVFLg0KPiANCj4gRFJNIGRyaXZlciBo
YW5kbGVzIGFsbG9jYXRpb24gb2YgZ2VtIG9iamVjdHMgdGhhdCBhcmUgYmFja2VkIGJ5IGENCj4g
J3NlY3VyZQ0KPiBzdXJmYWNlJyBhbmQgZm9yIGRpc3BsYXlpbmcgYSAnc2VjdXJlIHN1cmZhY2Un
IG9uIHRoZSBvdmVybGF5IHBsYW5lLg0KPiBUaGlzIGludHJvZHVjZXMgYSBuZXcgZmxhZyBmb3Ig
b2JqZWN0IGNyZWF0aW9uIGNhbGxlZA0KPiBEUk1fTVRLX0dFTV9DUkVBVEVfRU5DUllQVEVEIHdo
aWNoIGluZGljYXRlcyBpdCBzaG91bGQgYmUgYSAnc2VjdXJlDQo+IHN1cmZhY2UnLiBBbGwgY2hh
bmdlcyBoZXJlIGFyZSBpbiBNZWRpYVRlayBzcGVjaWZpYyBjb2RlLg0KDQpIb3cgZG8geW91IGRl
ZmluZSBTVlA/IElzIHRoZXJlIHN0YW5kYXJkIHJlcXVpcmVtZW50IHdlIGNvdWxkIHJlZmVyIHRv
Pw0KSWYgdGhlIHNlY3VyZSB2aWRlbyBidWZmZXIgaXMgcmVhZCBieSBkaXNwbGF5IGhhcmR3YXJl
IGFuZCBvdXRwdXQgdG8NCkhETUkgd2l0aG91dCBhbnkgcHJvdGVjdGlvbiBhbmQgdXNlciBjb3Vs
ZCBjYXB0dXJlIEhETUkgc2lnbmFsLCBpcyB0aGlzDQpzZWN1cmU/DQoNClJlZ2FyZHMsDQpDSw0K
DQo+IA0KPiAtLS0NCj4gQmFzZWQgb24gMiBzZXJpZXM6DQo+IFsxXSBBZGQgQ01EUSBzZWN1cmUg
ZHJpdmVyIGZvciBTVlANCj4gLSANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJp
ZXM9Nzg1MzMyX187ISFDVFJOS0E5d01nMEFSYnchbVBvY2JRd1o0LTI1RG1pZHZBZ2Q5SzVlWGpO
RWhTeUlLcHZ2WUhQcGRycTJQZ1MtaGtZeUhvaHpEdm9KeWRENDVVWnA1SnZZOUR1RFZGajFsdFZu
aEdZJA0KPiAgDQo+IA0KPiBbMl0gZG1hLWJ1ZjogaGVhcHM6IEFkZCBNZWRpYVRlayBzZWN1cmUg
aGVhcA0KPiAtIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz03ODI3NzZf
XzshIUNUUk5LQTl3TWcwQVJidyFtUG9jYlF3WjQtMjVEbWlkdkFnZDlLNWVYak5FaFN5SUtwdnZZ
SFBwZHJxMlBnUy1oa1l5SG9oekR2b0p5ZEQ0NVVacDVKdlk5RHVEVkZqMTBzRDRrSEUkDQo+ICAN
Cj4gLS0tDQo+IA0KPiBDSyBIdSAoMSk6DQo+ICAgZHJtL21lZGlhdGVrOiBBZGQgaW50ZXJmYWNl
IHRvIGFsbG9jYXRlIE1lZGlhVGVrIEdFTSBidWZmZXIuDQo+IA0KPiBKYXNvbi1KSC5MaW4gKDkp
Og0KPiAgIGRybS9tZWRpYXRlay91YXBpOiBBZGQgRFJNX01US19HRU1fQ1JFQVRFRF9FTkNSWVBU
VEVEIGZsYWcNCj4gICBkcm0vbWVkaWF0ZWs6IEFkZCBzZWN1cmUgYnVmZmVyIGNvbnRyb2wgZmxv
dyB0byBtdGtfZHJtX2dlbQ0KPiAgIGRybS9tZWRpYXRlazogQWRkIHNlY3VyZSBpZGVudGlmeSBm
bGFnIGFuZCBmdW5jdXRpb24gdG8NCj4gbXRrX2RybV9wbGFuZQ0KPiAgIGRybS9tZWRpYXRlazog
QWRkIG10a19kZHBfc2VjX3dyaXRlIHRvIGNvbmZpZyBzZWN1cmUgYnVmZmVyIGluZm8NCj4gICBk
cm0vbWVkaWF0ZWs6IEFkZCBnZXRfc2VjX3BvcnQgaW50ZXJmYWNlIHRvIG10a19kZHBfY29tcA0K
PiAgIGRybS9tZWRpYXRlazogQWRkIHNlY3VyZSBsYXllciBjb25maWcgc3VwcG9ydCBmb3Igb3Zs
DQo+ICAgZHJtL21lZGlhdGVrOiBBZGQgc2VjdXJlIGxheWVyIGNvbmZpZyBzdXBwb3J0IGZvciBv
dmxfYWRhcHRvcg0KPiAgIGRybS9tZWRpYXRlazogQWRkIHNlY3VyZSBmbG93IHN1cHBvcnQgdG8g
bWVkaWF0ZWstZHJtDQo+ICAgYXJtNjQ6IGR0czogbXQ4MTk1LWNoZXJyeTogQWRkIHNlY3VyZSBt
Ym94IHNldHRpbmdzIGZvciB2ZG9zeXMNCj4gDQo+ICAuLi4vYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTk1LWNoZXJyeS5kdHNpICAgICAgfCAgMTAgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX2Rydi5oICAgICAgIHwgICAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYyAgICAgICB8ICAzMSArLQ0KPiAgLi4uL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYyAgIHwgIDE1ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYyAgICAgICB8IDI3MQ0KPiArKysrKysrKysrKysrKysrKy0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuaCAgICAgICB8ICAgMSArDQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jICAgfCAgMTQgKw0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCAgIHwgIDEzICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgICB8ICAxNiAr
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgICAgICAgIHwgMTIx
ICsrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uaCAgICAg
ICAgfCAgMTYgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMg
ICAgICB8ICAgNyArDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5o
ICAgICAgfCAgIDIgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tZHBfcmRtYS5j
ICAgICAgIHwgIDExICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21kcF9yZG1h
LmggICAgICAgfCAgIDIgKw0KPiAgaW5jbHVkZS91YXBpL2RybS9tZWRpYXRla19kcm0uaCAgICAg
ICAgICAgICAgIHwgIDU5ICsrKysNCj4gIDE2IGZpbGVzIGNoYW5nZWQsIDU3NSBpbnNlcnRpb25z
KCspLCAxNyBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkv
ZHJtL21lZGlhdGVrX2RybS5oDQo+IA0K

