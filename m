Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776D7CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZXYVhiT7aeMVfMSt9kMaRBdp1BDFDizuGpjtR+i13A=; b=bQjm4W5z96hwlQvOkO4Cs/+Ro4
	f5nedjepAjgSHdRms+1wbttE5ZOTS/b4HPU0sWQMzD2ppm0gQDtisEpXVtXV0d4Owo8eX2ewZ/oWk
	UtYfGjF1ylgf1kqXKUMjHDBznAAOE+urPmoV2plSDzNhBMXDtd9ddWJ/JNE37OIQNcIo/87RNaSC6
	+JjcFlZfhnuRtIW1kX2hJNQMa0MEQQ858zdNgNMgNReoqICzswHOKinrdv6pEElLLe/GSRCeFcygT
	k8+MMzn8XWGjVLyIuJtGm7XqfbleloMx8P7Gvh8VtCeUVI38z+vlCrw08G6I6xoQtB95VRqxW8ZXx
	/K89y84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUym-00000006KxG-00ui;
	Wed, 10 Apr 2024 10:14:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUyi-00000006Kw1-3MWZ;
	Wed, 10 Apr 2024 10:14:54 +0000
X-UUID: 27e193daf72311ee96d5dfc950b7243d-20240410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7ZXYVhiT7aeMVfMSt9kMaRBdp1BDFDizuGpjtR+i13A=;
	b=EzOwutJvQYeVDZDesZqX4sjCwGoOVqdACyMpp3k+eSnDD/ee2pT34EmzZQuv3wN/KqW7+zMzTs1b8/SPfjdFmBlvTTPAHIhPDLEWL4NOcyb2XvrAFPiGkdzdsMiIx638NqUYapkpf35bDg1Cy+gpR/6h+qBY65R7C2o6/DwGWEQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:e7a384b9-03ce-4759-9080-a347f5bfd765,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:2cf96991-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 27e193daf72311ee96d5dfc950b7243d-20240410
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 225830668; Wed, 10 Apr 2024 03:14:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Apr 2024 17:54:41 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Apr 2024 17:54:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgzXOEI1BEfexQ1N3x1ygextETxei/AGxk5wpjQ/IoxeEyoRGGiGFQba6bGBDWWRVs3uBbY/ix/SimfUtuMZ+Q1m9Nreguuk3mGAJzVn2ZpWGY8vBpzNhTifP3/ty4aOQCkl1UHgF0q6nWlFk6PeJ0PZDZkIxLqVXghZ/J8txJoz/b4q7c+iHI6ar8oNAvkJY/PNfmiokLK/HBYRL4t9it5W5hnY5qSYioBGbCkIA8CnkIFm7QBgj4HpRQOwXoymn2E5HRtuHKC+hUJqRejJ/l5TsKjXttpaDlrgmrPDGDdXmlgnFPW/VYS1e7ytHMFMp7vBUNpY67hfRMBzAtZUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZXYVhiT7aeMVfMSt9kMaRBdp1BDFDizuGpjtR+i13A=;
 b=fG7dFaV/x3dHvDvNznFmrhtYXwRxgS+y4uZ6gRJRR/0QSazFlc+1y9c22NkCquTZh3umrniRAt5rtWeGdtaEMIchWgraGIGh1LGy1JyXDAiQkz6krFqMMwijRg/1M5OPXXEOIjFjQcvUbv8lRNPHz1BOJGzrTbufaUgLb86G4si/FfruE5+1U4ZCYsdKVVh/JAtZYGvz7ZvCd5kS0nkTp/R+Bm2JzGqm+uAK92IKPxCaranNpSwwQ0SADE3N8q1i7TI0IgsI/zeWng22BzDJn6xcKNRY/SssTBwIzCzI7qhlbJnxfzigESNJW+FJFQ8khJeMx6ydLW615LNjup7ECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZXYVhiT7aeMVfMSt9kMaRBdp1BDFDizuGpjtR+i13A=;
 b=K0DsC/6kUx4Gl1meWTGZgvTXMO8RcTLWIl2jnSiBb3FxPAZ5jnS3gvp4uVgMUujpCHcNkvtoGJsVN7NUOBLZFmWdvEqR9G3rB5MZF+YHDKR4FioA1OYMlvLAfn1QusxroKKu9cn1Ndsz5MawHlu6GkgA1Pb0m3XW6hUaUYqrrug=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEYPR03MB6625.apcprd03.prod.outlook.com (2603:1096:101:84::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 09:54:39 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::b834:398:6805:4ca2]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::b834:398:6805:4ca2%6]) with mapi id 15.20.7409.046; Wed, 10 Apr 2024
 09:54:39 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "chu.stanley@gmail.com"
	<chu.stanley@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "willmcvicker@google.com" <willmcvicker@google.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: fix module autoloading
Thread-Topic: [PATCH] scsi: ufs: mediatek: fix module autoloading
Thread-Index: AQHair4sRySznuq1LUq/LSJjBAvdvrFhRLYA
Date: Wed, 10 Apr 2024 09:54:39 +0000
Message-ID: <ebed92e7cb1496e3d0f66cb9ba8f1384c1c86013.camel@mediatek.com>
References: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEYPR03MB6625:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hqU/ZXLWj2zBQDlDLnZIj5D1/dyvmbQW161PE0Ktel1pDm3g/gT5W5HTYV2pFPQE4l4qSinokmc68siZCyKJLJRGWIFtOBGOIvSpSK4lTe4ZigOK2om3QAeIMZv83ymFP22K7nGdVtuIOqPqn94Th0C+1WYOHnbcz8sgw8YdLzQ0AMEn5nTOvkSoG8XEk8DnrqAcAmdaF9usc9N9vttI/bD3qZfXXN7xLXRQO6u4t7oL9irFvQe0jMhKo00HzIKCoLYrrUQvhFSELHDGVlRYYIKs4xS1HHCSzgzTKp/pFSL39RM/5qYJPCEoUnHhlUV94HqOgj8T8EUCXoJIdGyRwQggzHMO5/Y0+/73N6pUfrMkr+WNXS11P4Cdpii2ICo/Rw1Ipd1cgiBLyQRPnDj8zsS6OKjcrGRF9MrnWW0OYPUI5E0iNiclItWNf4r7precd+PE1S5xCzYl3i/69PWC2TTyvRmBAFdk04Ae0pNAbdgxLiW8DgR8RWsNMcvNBIsSyEfNSxLE4skSwevlVnkXCcXiiR8yXfIbY5tbZSlZWopRDnjcNOdVyLm3QioEt0s+E0qUhBj4mY5epqo/X12t8/g2Tx7ntDQ35BbHOMOX+gKBgBFWF5MQ4nPLl71Om3xf30UxVgkMev0p4mmsU8g1W5tev07Xw1B6o+JuuD1JcLVHj8hODkuxeFXqR2z82lUaZjHla85Sm6xW5enTmEbcAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elR5MkMxVzdBTU5lT2tRUXRqY0JWM2pBZEFQeHlaQ0tSV3gyZzN2Mm1kUDN2?=
 =?utf-8?B?TGlRMVJBalVvU0JUSjI4dmNRS1ZrUEJmRXQzMHhGNFBpYzJSazUxL2x0UGFC?=
 =?utf-8?B?TlMvZVJxZUdmKzZ4OGhTVE01dUxITkpvQnVkdW5Dd2dPdDFWS1lkMzIwZ2Jq?=
 =?utf-8?B?bnhycUUrU2FqYWdiNDdnd1RqVXdHQm1zYWtDbnlyZ0t1dDFGOHdGa2NZVC9L?=
 =?utf-8?B?ZDJ6TWJTMDV3U21iaEtnd2JwbXNjY0tpc0wyYXhkalhXTCtRWktmMDRLMW85?=
 =?utf-8?B?dThUR1BFZUt6dlRManpEN0p0SWp6Y3hzQm12VG1XRkJSYlBHa1piZisyRjZM?=
 =?utf-8?B?ZUFCSXRHNkNVL3NuZHZ0VWl2UXZ5bFJEb003VkZSaGVLWkpmNUZpbVI1RVRp?=
 =?utf-8?B?d1kvOVh1aWs4MnNwcmQ2RWluUVZEREw3MDdUWmFmaHpDS2h6bnRiTzBNdWkx?=
 =?utf-8?B?aGduOGp4MHhON2pWV1p2ZTczVlpwV3BnS0g3QlBNa0ExVWtJZGJwUUhibHVl?=
 =?utf-8?B?eFZKTmJXNS9sREx1NUVJOHJ1WEg3MU1QU1REdTJiVkNGVTVJZjdpK256cld0?=
 =?utf-8?B?N1gyVHhuNHJHSWJYSzN0eGxEeWNkeStHZmlWYU1EcE03eldOS0NybzBER0kx?=
 =?utf-8?B?N3hLckE4R2x2VHJzMXJ2cWJYMnFMSWNIN3Y5NERBeDVNdk0zSzdOYll2NU03?=
 =?utf-8?B?WTVaMXUxTWhLdHVFUjVjZDRpZU5RLzBNd05wTXJLZW0wenJ1VVFpQ3hVYUJ0?=
 =?utf-8?B?V0hSbWpUMWhHYjJEdUQ2d0FNcE92T1RubXlPeVAyaXU3QXE5NGNWb2xsUGNT?=
 =?utf-8?B?TnNCaklBNjdHL1p3WmM1cVdLMGpzeTc4VHl6MGl0OXpoZG9zNTB1cnpsa1g3?=
 =?utf-8?B?T2RjWHEwOU5HVklXU24zZVJuSFFLbDkrYTZlbndVQndTN0hFUlJOM3JoWkpO?=
 =?utf-8?B?eGxLT25zVWZRWGNCQk9wWllUTHY5RjJiUDBham54WU90ZXhtdXd0YmFIMkpM?=
 =?utf-8?B?aFM0cmgrdk0vL3RKd0Jxanc3MTJTclprTGdTR3R2UmM5MDVrWWE0L3FxUkg3?=
 =?utf-8?B?V3hZa1hoWU1KUmh0aXJqMXN2TWo5cXVuZDhJZzg3Tno3WktYSy9VcDBwaUpX?=
 =?utf-8?B?RitxMkJoV041aVpIN3RqSU1qeWJNNStFcGFseDc1L2ZWZzBhU0sxaTR2SXkw?=
 =?utf-8?B?a2cyYzBBdlhmTEVrV0dzdFU1amtWdXN4d2N6NnBhTXFVNWZaUmd0cDZtdS92?=
 =?utf-8?B?Sk9UUnppQURkK3BGL0lqeFdJalRCTmorQ0JqQ0NFeFphQ3BTWUJuWEFjRUh4?=
 =?utf-8?B?TGozR05wbDBJNXAra1l0UmJOaE5yU1FYT1ptN2tjVGVneE5HZGxsa0NXUVBI?=
 =?utf-8?B?Ykl3Y3VxV2RKTWMyZ3cveW9qem9xOWNjN28yTWRKVUdNRjhFc3JMYUZ1SEhL?=
 =?utf-8?B?YjdnN2VlZ1I5RzIxU2ZwaU5raUJxS3g5Mnc4VDQ2YmtGNXY0RThaUTFkRHla?=
 =?utf-8?B?UmxUeE9uUk5BR2wrTUtVbTk4a0dDMzYyVjdkcHVtWUlXdlBMSS9nazVxYmlr?=
 =?utf-8?B?Sk9Eam8zWE5WYzVRRnZNaXI5RndJM2ZLWjV6VHFVODRiYkV3RzA0NVZtaXk1?=
 =?utf-8?B?enQrd3M0RkhrdUpMK1AvRTNWTjAxR21WNHp4ZUhxMGJPSTlWamsybHU4K0py?=
 =?utf-8?B?akEyQUk3eStGMmtQYVE1MGhudDd4WlJGd1BGcGNUUHhQWGZna2dWWVUrQ0Vy?=
 =?utf-8?B?aDhJZFZZa1d5V2dkUXM2c1lNL2Y3WXFKVHR5Z1BWdStQM3BqMkFGd1h6TkFO?=
 =?utf-8?B?UW9kVnpSUTlnWURqZmx4Zzl1UlRzWlFhNE1jbGxZeFo0czFML3dnczZMdCti?=
 =?utf-8?B?R0JKdXBQclh1K0FSSGZJUWtocUVFTVMrZXl3eEF2VVFrWm13YWpzelBlME4r?=
 =?utf-8?B?aS9pVDZ2RG1sUk9iRjNPNFB1VzkzMElpaVhzam1Nb1pWWWlxMnBqNG03c3hB?=
 =?utf-8?B?bWE1OFhydUFwcEVOV2FmbkxKbnhVaWk4SkpOZ0JUWFFtbzVrWmRHNDZScUdW?=
 =?utf-8?B?UndpSUtuLzBaVWliYzlQNmZha0ZjSlNpRTRDWW9mTzJScmU2N3RzeU1qZmVH?=
 =?utf-8?B?ZWovNE45VjkwMUpkTC9URDhQcUtmWWxESTVnRzdWOW5GdEN3YU1GSXExRGZu?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0343BFD79BB674BBB61043E001B1941@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcb2b21-df59-49b7-bf84-08dc59443cc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 09:54:39.1285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37GFrloZXu5muTVaT/8pfEUb0vkR6CYWPOQgNL+Ees4g2n2qpHPXlf2h36Vd1GFedHjsh4UkAPtjEXnUO8ochA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6625
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.176700-8.000000
X-TMASE-MatchedRID: h20DFeLkM8/UL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCsME2BsoiKJMoMfp2vHck9UK3n1SHen81RMu6ersnFy9rhO
	hST9pKbUbTjFqSkJMGUoy5WLoLWsKQv21zJNl0CyDGx/OQ1GV8qffT5A0am5mZsCGLUmGln7kwj
	HXXC/4I8prJP8FBOIaGf3MS5o4yLcbcQIJSG2ZlLpN7yOQuRH6/x7KjsX+z9vKdUndrsB0bw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.176700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8BF707DBD8FAC60CEB051C82A1B886C126D8B73B7ACD3BE05419726834F754B42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_031452_861241_725EC034 
X-CRM114-Status: UNSURE (   9.83  )
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

T24gVHVlLCAyMDI0LTA0LTA5IGF0IDIyOjM5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIEFkZCBNT0RVTEVfREVWSUNFX1RBQkxFKCksIHNvIHRoZSBt
b2R1bGUgY291bGQgYmUgcHJvcGVybHkNCj4gYXV0b2xvYWRlZA0KPiBiYXNlZCBvbiB0aGUgYWxp
YXMgZnJvbSBvZl9kZXZpY2VfaWQgdGFibGUuDQo+IA0KPiBDYzogV2lsbCBNY1ZpY2tlciA8d2ls
bG1jdmlja2VyQGdvb2dsZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQoNClJldmlld2VkLWJ5OiBQ
ZXRlciBXYW5nIDxwZXRlci53YW5nQG1lZGlhdGVrLmNvbT4NCg==

