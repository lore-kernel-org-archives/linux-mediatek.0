Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848BDC48285
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 05:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12kAn5ETUAB7ea4zG4rUvK7A+d4P9mYF4KOoXRKm1Xw=; b=d1Ic+9t8uB2C6JsBF6EQ+7eeay
	8I/agptd0Exa3wF6zHoWMtPVWpZTCa0GpTF6iYGEgIATZ/qmlHtMTNGK9WEctA8s1vneZn+b64eQa
	Ql1wQD4VFB9+hIzrC8Grl+fjbZMst+ldIRCHwx1Uj14SEKlUOciZDP1jR2Lk2nUA1oO1Pc5eHa1S6
	MLSme0zub1oUvPZMlyOcmAJZaTuGyaYPsId9Sy36RWf8/jlYMsVhw0vGPT6X6/AustTXmwFPn5l+I
	MABCVzByfFsGfGshqV8IqanN0hvtxLTO/2ct8H1TUVOVaXsZJQe7o5dwihVZA5AI7dy/sUlI9J5fy
	ErY8pGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV38k-00000001X5d-0Gbo;
	Wed, 31 Jan 2024 05:28:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV38h-00000001X5B-3Khh;
	Wed, 31 Jan 2024 05:28:01 +0000
X-UUID: 7c2715e8bff911ee9a263b4415211400-20240130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=12kAn5ETUAB7ea4zG4rUvK7A+d4P9mYF4KOoXRKm1Xw=;
	b=sbbm0ar3ZoBUthnstYhCm/+oP1IZdvnkyZNKE+xcj0wZSUmu/6tzJZy1iWFWTDWUZC/XVc43xcFERbO0IBiXw4qkBvQ3PXYQ17lo8ojqozIgCFoBlryIhxawpYja+26o73bVgvo8eRBmNB7jUJX9Ia7DLmkl/SXCOvyPmZSHPUY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:cda9e2cc-2e7f-401b-8923-8a0573f4a4d8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:ff837283-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7c2715e8bff911ee9a263b4415211400-20240130
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1674386566; Tue, 30 Jan 2024 22:27:54 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jan 2024 13:27:17 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jan 2024 13:27:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg+VCrppaiLDMj74e87ujH1pGyCL+TrKp3QBG9Xe01eJ4KDYxhG6x1nSkGDosAzxUBzspSujUOR6xLmr/b3WpKWorOBs70O5vEHbou6oyof7negoaEGEnY2Dpq+PL7ieZkjfM835yK/z7nDDOiptwgyIqLfudjTuyhjpoK2XpDS2D8W67i4DhUM97jSxAn7A/ymsK79ptQXD6kdoinY8RPItvIG3wYCry3ZHuVKgnZm6Rar9J5ilKMUi1m5tiMqteH3qO6RvNGbVjXHUWJtU55cQoQWO7NFm/hyQh3ccb76CUnNPbU9GKrgtbGtUkNXZ7wMt6IP/9yhgYyZrM2F6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12kAn5ETUAB7ea4zG4rUvK7A+d4P9mYF4KOoXRKm1Xw=;
 b=laqB8U7tIcHV/RXHo12tjvDp0rU2eUdZ5rJmLW5WFiQcyy+3IaVHU4BiqhKgpP0PJVXsPRf8/eigxjEvWED2U0rJbSWzWKrnoTE1uzAWWZOHvRqCZytLwQpDfHkXkOVGcWzU+pNW8Ca1PrWeYp442qOEqpVyR8XoUXdIDJIJ/T6myKLdOt1uP0nToan0TnbSpTjpc7tlSHQw9nCceBc14Pz6qYAVntzzkaHYKZp+3Ukz8v1GfhUWJgPV0stPYLr8mdtV6gaVHeyPuurg0cJPRLx8qjZbcdKuclUewJfj3RslIl/1E4w8hbcHhNHR1CRnnCBQtuc0clhFLPkmvolepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI2PR03MB5564.apcprd03.prod.outlook.com (2603:1096:4:129::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:27:14 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::d006:ec9c:ff42:ff60]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::d006:ec9c:ff42:ff60%5]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:27:14 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"michel@daenzer.net" <michel@daenzer.net>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "mikita.lipski@amd.com"
	<mikita.lipski@amd.com>, "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>, "mripard@kernel.org" <mripard@kernel.org>,
	"daniel.vetter@intel.com" <daniel.vetter@intel.com>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "nicholas.kazlauskas@amd.com"
	<nicholas.kazlauskas@amd.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "quic_abhinavk@quicinc.com"
	<quic_abhinavk@quicinc.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
	"lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "sean@poorly.run"
	<sean@poorly.run>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
	"fshao@chromium.org" <fshao@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "jani.nikula@intel.com"
	<jani.nikula@intel.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "freedreno@lists.freedesktop.org"
	<freedreno@lists.freedesktop.org>
Subject: Re: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Thread-Topic: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update
 hacks
Thread-Index: AQHaTaau1JBuNr0KqkifWFu/qedV2rDm6fyAgAPwMICABCH8AIAEdNSA
Date: Wed, 31 Jan 2024 05:27:14 +0000
Message-ID: <afa82f2028296dbf586a5e61949179831d69af06.camel@mediatek.com>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
	 <20230307145613.xvhru3fpcudlpazt@houat>
	 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
	 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
	 <vyh5wg2ltmrtqw2mhtyj2lii6i4eccrjjlynzpfg7x63tkrav6@cxbz3sasvjjm>
In-Reply-To: <vyh5wg2ltmrtqw2mhtyj2lii6i4eccrjjlynzpfg7x63tkrav6@cxbz3sasvjjm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI2PR03MB5564:EE_
x-ms-office365-filtering-correlation-id: 24d92243-e599-4f2a-341c-08dc221d484c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yA5E9oEbezRHKfod7AsDKnYRxhKaDmid3lZya0+17TQzSsScGh1Ln4kzbAjz+32+qEeFC/ZFl3mE7KGJ/7qsQpqG9VVpsxBrtsMpJrtNCKaHtKAyiv/oiHE4TEHSRie6YhsPbqkwxe6htiCTKyA/+Zi5poHuTrh94MkaJKONM0sOuiHFlahcVhLGGFoB1SDjjLeqa1xsIJRXihy41nG5xS2IkycSy0j/tu2ltuawNUEzyNxDyGk2hrhGFongCp7Ch3srMEJBnhSLmC8AfnIgg051dipwx+zFuLgHtCq8A+fR5agAtTCo/gbv1eOEj97vc2NCJhmltkYkhMKsg+UMRr8NriEGO9zdOARcO6HjsL4eJ7EqBMA2DZcrd7lBBQo98T1/gB9mSUwWgKofhPNcWqsesnPHr+3h4ssUkxEB7G2kGAMJZ/q70LMT7irhltkOickhjo8mgKyGJ0cw1fhVZJY3XsFs+fTsyMh17L0a24D5g6xBKBIn64IzKN8ZV181VZkMur/OSNek2tcf7R6P7gZGZ/bROUPqfQF6j2pvBN9rtwA0xCELVzMtVvRhHxcajW85jV8Vv3JPF0TFXmyHiUHGlwmZT8Elqi7m5IttBMPGOQTWhOFDCdMQcIZjirOeRnDv5jFcfu4wlVXd9UHewQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(346002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(83380400001)(6512007)(26005)(2616005)(38100700002)(122000001)(5660300002)(8676002)(8936002)(7416002)(2906002)(478600001)(45080400002)(6486002)(6506007)(71200400001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(110136005)(921011)(38070700009)(86362001)(36756003)(85182001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUxsUC9MQzQxQnlIVmRienYyc0FQazFLanNMdzdVSmJaN3FkbUpia2Q1dWk1?=
 =?utf-8?B?VjVGMDlxOVVPak81eTQ1R2U1TEFDdUVWQlJwcG9pY2c5K1BmMUNFaU52SWpY?=
 =?utf-8?B?dytYMUE3eG9KbXNaUkNDazdxZ0luQWoyOFZCbXF6WE5vL2hnS2s3eE1RZS9o?=
 =?utf-8?B?Z0J1R3EvaVh1bkZGalZhRm1TZVAyRDBaT0FtQU9ZTVd0Y0cxeCtNNERhMGRO?=
 =?utf-8?B?c3pVa2RuRGtab09rODBCTmV4MHJ6MUFucmZqY0pJQ0dLK2tXaTFIVVBXRFBH?=
 =?utf-8?B?Z0ZrRWs2WkliclQ0Tk5IUFFvZndURXdCUTk1eFNsb0NOaGVDMkxWQnJST2Ur?=
 =?utf-8?B?ZkVnNTljY2tmRExrdUNKcjhwNzJzSWd2NG1lVWFSOVV2NGtQSzNxT3o3NVli?=
 =?utf-8?B?dE5mM25MWm13V3Y5S1RpcXR2V1RPc1BlbmRoWlFycEtPbTBZZFlXZGRwM0J3?=
 =?utf-8?B?UDl5Rm1LNVFITjc1aldYYnhwRmNNb2FJdEFnUi9HYzh0N00zc3hJZmo0c1d4?=
 =?utf-8?B?NWdKWnBLRkdhYVRGcHdOeVJSSzhSZDhHV015YTBCVkRiQmhCR2hrQlNrbm9D?=
 =?utf-8?B?bytSQ3hZS1V1cGxyYmdBVzdzanZRbys0VS8vcUxZcDNndlBZMFNOV0JjQ3oy?=
 =?utf-8?B?V1VFc3AyYmI2OGk3SGNHb3ZxOHAvYnlQdFh4UVlsZXZMeEpiQm1wZzdTaXZh?=
 =?utf-8?B?em5wVU1YSDArV2I4QnYrNVdXSC9xN21VTmpYSGk3OHBlSXExYk10M3BOOWVQ?=
 =?utf-8?B?YjhOeDYzSnJFKzUvOFZHT0dpaWEwZ3NNRHdaa2FxZ1BZRFFGdmJpVEE5M0Iy?=
 =?utf-8?B?Z0krTjZxbDhWOFBGOUZWM2NPQzNlS1g2OGVQTENFQjk4NUVib0M1My91SFlR?=
 =?utf-8?B?elhkZzh1Y3htTGdnMi93TjR4cW93VHBaQWhlcGpDeW9KRzRsK055RUZRZDRQ?=
 =?utf-8?B?UVEzbFkzUkxvRXlKWU9DRXljMUx0S3dnV1VUNmtZY24rZDBjWnhnbnZVZkRR?=
 =?utf-8?B?T0V2S1hsSm1EdTVuUWJXZjFnMUx5MlF6dGt0b09ZUHpUcUdqZkJkOHBxQnpZ?=
 =?utf-8?B?ZEFCbmJBQ2VsN0s0MDMwUjZDNWZ1QXdJb2lyV2pQWDNvMkltcmNBaDIwcGF0?=
 =?utf-8?B?amRSTzgvZlY3c1FxN0NQQ0hMZktlOGRwendpYTdVWUpmeSs4UW9NM0Y4MGcx?=
 =?utf-8?B?azBWdG4vWWZPU2Rwd2ZiR0dnMXlyZ0d4T0tMbDQzRzJkVS91eGFmMU5ZWkFm?=
 =?utf-8?B?RmhjaXU5bE95RnU5QUN4dkZBZGVqQm4wS0VUQVl1QkJOWFp4WDgzRGFLbmhY?=
 =?utf-8?B?V1ZxS1NTRTdUaTFFbFJEemdIbm5pSjl0OHZWWWVPd3ZIbEZRYnZXSkdKRHB5?=
 =?utf-8?B?VEpJcVRiTmI4Y1pYVnQwTlBGaDcra0lsUU5GUU1ZOFZBTVJKQ3RhVFJ4clYw?=
 =?utf-8?B?ZDZ5MCtRT0JZeFZMclhGZFZ1QllLRlRmMkd5dDA2Z1NSbXlUTU52NXh0S3U0?=
 =?utf-8?B?VTM3TVJoblJaUm5oZzAwZVA0TU1NQ3Y1U3UreGxxSWlodktBalAyM3BRd2dn?=
 =?utf-8?B?VlJmd2Ftd2hDNEhYa0plbmxZOTBEcnZBV0xIUFlLRFNRc0YvTmQvMDJHeXJ3?=
 =?utf-8?B?VXk1WTJwNFNYNjhFK3MzeTNhU0hWWVRmSkVuRmhnSVE2OTZwVnJBVkNGTGlT?=
 =?utf-8?B?d0VRaGJoZDhMckN3cXQ5N0hjNTFyYk9BTXNWTlNkdW9rZy9Sck5FSmNydzlk?=
 =?utf-8?B?VmxSMkZpdjhEc3lRTXNqL3ZPSmswTEFJakFMak14UjR6VHVnYlpIVTdVZTVC?=
 =?utf-8?B?VUNLZlhPSUJBamN1VmgzL3RiTVd6eXlFQzJFd29nSkx6RnIxSzJTZXd0dnZW?=
 =?utf-8?B?cTU1RHNPaUtLeVI2SjdIbFJKU05reCtVVlF6M2dZNmMyNCt2VWlzSGRpbEdv?=
 =?utf-8?B?WVIzaEpKamlRYVNVWWtVRHpKeXVzbGFNdDVGV3NzVUgxM1IvVkpNU1lqYWxo?=
 =?utf-8?B?RFlXWVJ3WXQ3Rzh1NzdPbld3NXlqeUt3dDljVzA0TlhvM3ZHVGVLZDdQQUJ5?=
 =?utf-8?B?dS9RZ2drNnhoVkV4ek9yRUk5OHNqOFZTa2lrMmpZbEo0WnhTSWloTXNncFJS?=
 =?utf-8?B?S1hEQXlJbjN0c0ZQbFQzb2libTFtZUh5R2pzMFhNQnY3b25HZk9VZ0dET1lr?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A91863CE658FA244BC1A18F5F6D53CCF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d92243-e599-4f2a-341c-08dc221d484c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 05:27:14.1793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uTja7jfhlBPipD53jZhdwRFtHnOnvC2m+Rakd/nPafrPNLfDxN8lvszlIaorSQGJGIDk35MGZp97++4guxb/lZxk3LK4ViZpfqSzrKXpYh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_212759_866258_64F74C83 
X-CRM114-Status: GOOD (  27.27  )
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

DQpPbiBTdW4sIDIwMjQtMDEtMjggYXQgMTA6MjQgKzAxMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6
DQo+IE9uIFRodSwgSmFuIDI1LCAyMDI0IGF0IDA3OjE3OjIxUE0gKzAxMDAsIERhbmllbCBWZXR0
ZXIgd3JvdGU6DQo+ID4gT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMDY6MDk6MDVBTSArMDAwMCwg
SmFzb24tSkggTGluICjmnpfnnb/npaUpIHdyb3RlOg0KPiA+ID4gSGkgTWF4aW1lLCBEYW5pZWws
DQo+ID4gPiANCj4gPiA+IFdlIGVuY291bnRlcmVkIHNpbWlsYXIgaXNzdWUgd2l0aCBtZWRpYXRl
ayBTb0NzLg0KPiA+ID4gDQo+ID4gPiBXZSBoYXZlIGZvdW5kIHRoYXQgaW4gZHJtX2F0b21pY19o
ZWxwZXJfY29tbWl0X3JwbSgpLCB3aGVuDQo+ID4gPiBkaXNhYmxpbmcNCj4gPiA+IHRoZSBjdXJz
b3IgcGxhbmUsIHRoZSBvbGRfc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlIGluDQo+ID4gPiBk
cm1fYXRvbWljX3dhaXRfZm9yX3ZibGFuaygpIGlzIHNldCB0byB0cnVlLg0KPiA+ID4gQXMgdGhl
IHJlc3VsdCwgd2UgYXJlIG5vdCBhY3R1YWxseSB3YWl0aW5nIGZvciBhIHZsYmFuayB0byB3YWl0
DQo+ID4gPiBmb3Igb3VyDQo+ID4gPiBoYXJkd2FyZSB0byBjbG9zZSB0aGUgY3Vyc29yIHBsYW5l
LiBTdWJzZXF1ZW50bHksIHRoZSBleGVjdXRpb24NCj4gPiA+IHByb2NlZWRzIHRvIGRybV9hdG9t
aWNfaGVscGVyX2NsZWFudXBfcGxhbmVzKCkgdG8gIGZyZWUgdGhlDQo+ID4gPiBjdXJzb3INCj4g
PiA+IGJ1ZmZlci4gVGhpcyBjYW4gbGVhZCB0byB1c2UtYWZ0ZXItZnJlZSBpc3N1ZXMgd2l0aCBv
dXIgaGFyZHdhcmUuDQo+ID4gPiANCj4gPiA+IENvdWxkIHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBw
YXRjaCB0byBmaXggb3VyIHByb2JsZW0/DQo+ID4gPiBPciBhcmUgdGhlcmUgYW55IGNvbnNpZGVy
YXRpb25zIGZvciBub3QgYXBwbHlpbmcgdGhpcyBwYXRjaD8NCj4gPiANCj4gPiBNb3N0bHkgaXQg
bmVlZHMgc29tZW9uZSB0byBjb2xsZWN0IGEgcGlsZSBvZiBhY2tzL3Rlc3RlZC1ieSBhbmQNCj4g
PiB0aGVuIGxhbmQNCj4gPiBpdC4NCj4gPiANCj4gPiBJJ2QgYmUgX3ZlcnlfIGhhcHB5IGlmIHNv
bWVvbmUgZWxzZSBjYW4gdGFrZSBjYXJlIG9mIHRoYXQgLi4uDQo+ID4gDQo+ID4gVGhlcmUncyBh
bHNvIHRoZSBwb3RlbnRpYWwgaXNzdWUgdGhhdCBpdCBtaWdodCBzbG93IGRvd24gc29tZSBvZg0K
PiA+IHRoZQ0KPiA+IGxlZ2FjeSBYMTEgdXNlLWNhc2VzIHRoYXQgcmVhbGx5IG5lZWRlZCBhIG5v
bi1ibG9ja2luZyBjdXJzb3IsIGJ1dA0KPiA+IEkgdGhpbmsNCj4gPiBhbGwgdGhlIGRyaXZlcnMg
d2hlcmUgdGhpcyBtYXR0ZXJzIGhhdmUgc3dpdGNoZWQgb3ZlciB0byB0aGUgYXN5bmMNCj4gPiBw
bGFuZQ0KPiA+IHVwZGF0ZSBzdHVmZiBtZWFud2hpbGUuIFNvIGhvcGVmdWxseSB0aGF0J3MgZ29v
ZC4NCj4gDQo+IEkgdGhpbmsgdGhlcmUgd2FzIGFsc28gYSByZWdyZXNzaW9uIHdpdGggbXNtIG5v
IG9uZSByZWFsbHkgZmlndXJlZA0KPiBvdXQ/DQoNCk9LLi4uDQpCdXQgSSBhbSBvbmx5IGF2YWls
YWJsZSBvbiBNZWRpYVRlayBwbGF0Zm9ybS4NCg0KRG9lcyBpdCBhbHNvIGNhdXNlcyBhIHJlZ3Jl
c3Npb24gd2l0aCBtc24gaWYgSSByZS1zZW5kIGEgcGF0Y2ggZm9yDQpkcm1fYXRvbWljX2hlbHBl
ci5jIG9ubHk/DQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCj4gDQo+IE1heGltZQ0K

