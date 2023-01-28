Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7BAC38142
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jan 2023 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8v/cCGgYZRfzG3Te+rmSI/vigoxlLGgcK744xQ9doDU=; b=vchlX22+v/pts0uckRFFN6WG6o
	dlm9cmkk7bE/qIGiY34LCL5GfgQtBEuBbnB5qgHzsBW/+Fv9gVG0eYF2gKblF6FdMDnH8eBTRwul2
	EpAfBYYYmrNHHC37WmIXof952BWAvt7JTO4HozNhb8jE/sylmJ0DpN1MpSeLdWB5aTW9I6z6tnxVW
	RqTGKujcZ8/GaabjWQhAkVHPvFXQ41/PHqjSf/iIi1uWo26O9AmlMkrVi40hX9ly0C4uBRKPjY2k5
	GgCOixtgOS4V5BXcC5w+nJgmDsnTJhxNPszbRNwXfRkFf9f/mL6eiQReFqlNdYhP6+29/uhaAt8b6
	UNtI70Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmfm-000JEy-Up; Sat, 28 Jan 2023 14:59:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmfb-000JE7-JN; Sat, 28 Jan 2023 14:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=8v/cCGgYZRfzG3Te+rmSI/vigoxlLGgcK744xQ9doDU=; b=SCoVaZfUDah0UOEFJTYS62XgGF
	L200ViEaL3Ujbbaub6ez7exaWugBYxWfgF3MDuzb07CN+JaTOYhFDgXDTUo1nUNhTQ9cxd8WcsOCu
	rNhpUreYQnnY7VJFG0FC3hRjdDVnafQ1uCCDHBNHaUIEfR0nHNa4j/b7DqaZ+kkSdNW07e/HaAfnl
	ODMrNa38UFGjSgkFUBz0kIL4/iYDcNQ160nUfbihJAhmtq9Bbsi3uE98N+IM7nJDRcLacXso8sulw
	hNBSYaP+V6hsqZ+CgHUEoAIr2AYJCNyLKV77dx9yQeWJkLhzCm5O27SGB4fVqDB5A3/L7CnR5d77r
	wtJsW1yw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pLmex-003GUA-03;
	Sat, 28 Jan 2023 14:58:31 +0000
X-UUID: 3d11a8cc9f1c11eda08d4d6090ec5a5c-20230128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8v/cCGgYZRfzG3Te+rmSI/vigoxlLGgcK744xQ9doDU=;
	b=UjBwyEedq5CK5s5qE08UNuRm/G1pssfSCZCOF75YesFcRWVGGk7r6/DMmjcMlndSgU/erRsnLYqQhYgmu+iORcSxsgyESKiX/AwcZNIGNR964tb9u4KgaU6xZrcb10JXtV3t5/8vFaZr114FzKIef4zj2tVCORelAuBm6EEmEPk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:10f63520-5723-4c5e-82a1-1a792c5369a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.18,REQID:10f63520-5723-4c5e-82a1-1a792c5369a3,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:3ca2d6b,CLOUDID:daccc5f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:230128225836TTU8LPIS,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|102,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 3d11a8cc9f1c11eda08d4d6090ec5a5c-20230128
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1302188783; Sat, 28 Jan 2023 07:58:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 28 Jan 2023 22:58:32 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Sat, 28 Jan 2023 22:58:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXFxJf3WAQQqgIqdE+Ofiw9Za5MwVHEZQHNJHqnZ9eWQwQnGUuQfc/O9VqB0er4xFN4h7r6/sXjT7R/RABUcqQjU0pND6RG/ztyGDw+xmuUncv8n8BvtO+ojvNqkRF3yA1pHQKzVqyPpeS4QGsJVGIbHuNoKY+dZrgaRhOflbXpbIYUKpzNY197+tTfmRWuQJuoantjvNbY/SLCSDKphRi2GjbTObuXBK4rrmBRKAWUG33Vzq8B7ZEM5xANy0OS4pUZrOrvuKttvDDHZVHZFnEXyy78deCvpQzGrTawxPT1CjPVtOmtPE6Y7M9C9Oli/iecYZsvua5ha2L3GvrrRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v/cCGgYZRfzG3Te+rmSI/vigoxlLGgcK744xQ9doDU=;
 b=jGCZcPAmUj/kpW+E9xNPXEDd1neAi6+X8z89EKJRO0jZ338LKU/IGqsMWxBIMT8CESMwLZnqxGqT3A9EnGsA12Roko6sd/kBz9rbkC586mhwEIxsumi7CeswdOVP0oUP1LelurCvyWlVPWo/E1Px8+NIdkroArBbu3KoO7zeUZKwei6XipXyaQlqg27fpLluaL90RF6Fcq6gV3GbdXYANdkVoOLMs+pbBycu5Xh3VvibeVyVcIxlUbNmSGQjUA+Oh3b8ACEnzgxkJbCAsNcg3OqIkAnT6QLzOyERsbbZtptAQjbmBgPBjo6I+hIgRCaD2F2okPM6MDrLel2gzgbjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8v/cCGgYZRfzG3Te+rmSI/vigoxlLGgcK744xQ9doDU=;
 b=Z5cVS/lEw4Ob9mx/Mqr0xt/U1jPhKLhZXTovEEH0AIGoSVWNoOh2A9QumBCyZ7dSlG/tmh3eTPioOSjxOKI675ddZYoFQZMbQXZMztjU4Bmhlf1LxG2dsUIktQGhuDTM2mVMrWr3dV+MGdCFoNxA/yJ4KVrK/DosL5H2YwMxsbk=
Received: from PUZPR03MB5964.apcprd03.prod.outlook.com (2603:1096:301:b4::11)
 by SI2PR03MB5529.apcprd03.prod.outlook.com (2603:1096:4:128::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Sat, 28 Jan
 2023 14:58:30 +0000
Received: from PUZPR03MB5964.apcprd03.prod.outlook.com
 ([fe80::c43a:ce45:4a27:bd80]) by PUZPR03MB5964.apcprd03.prod.outlook.com
 ([fe80::c43a:ce45:4a27:bd80%7]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 14:58:30 +0000
From: =?utf-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?=
	<Kuan-Ying.Lee@mediatek.com>
To: "andreyknvl@gmail.com" <andreyknvl@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	=?utf-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?=
	<chinwen.chang@mediatek.com>, "dvyukov@google.com" <dvyukov@google.com>,
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"ryabinin.a.a@gmail.com" <ryabinin.a.a@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "vincenzo.frascino@arm.com"
	<vincenzo.frascino@arm.com>, "glider@google.com" <glider@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] kasan: infer the requested size by scanning shadow
 memory
Thread-Topic: [PATCH v2] kasan: infer the requested size by scanning shadow
 memory
Thread-Index: AQHZKyCyrTNFvvt7mEemldTI9O5rMa6skisAgAdpiYA=
Date: Sat, 28 Jan 2023 14:58:30 +0000
Message-ID: <414630a65853f18c450cf1451e013b749382cbac.camel@mediatek.com>
References: <20230118093832.1945-1-Kuan-Ying.Lee@mediatek.com>
	 <CA+fCnZcS-p5nCALg4-96cp+sXNZSvN_u=L+=xK+zaH2rigJMKw@mail.gmail.com>
In-Reply-To: <CA+fCnZcS-p5nCALg4-96cp+sXNZSvN_u=L+=xK+zaH2rigJMKw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB5964:EE_|SI2PR03MB5529:EE_
x-ms-office365-filtering-correlation-id: 73102858-5023-48d8-e494-08db01401e52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: baR8vdz3Nl4InlnehFNohhMpKzjcX8JcII52vbmuP2e+KSQ5WgMDaA8x+noGk9Po5iS7eOWfTV5XxPzwl9o0zXTQUWD/TqzI4KQ8uv8TrIG/fBezBOS0Nb+JZnI2CDEXs+/fVkGc6D4bxFTm7WXcX8Ex5heD2EJd37ZQxaQRYT73Ez68ba7fJEpFkye9k/7SInlMFr7NDXGZWP3SGe3sbEPHMrH2MxD+muTM0WQgFqzSas8o/1ECjvqYJCo7aBZaK7xawiUyTXIcQeGecks/BLrOw6mqSb3yJDl+ItMBqTFMldPaMEjDQlftcFDCqAHZxgbovggtEMhX8/6nn792YZ/2ht3HogB6It0W5xRn3ABI7IjA0cE1qIPEilmb3Wm6ImfjDpeLF+dqgCHHCF61xUfbodi/zT6Eja7hiv9e6H6OlR3BTHjcmPIqTWvvVu2CiLJoL/k/KWjpyNu0ltF9OslIhVmOVRC9+dIyli+VEnowrJM49nuXrJHhblo+7tLp8BR5joSp0fQPNHyD6xQICOMEAeKZnM/bwSqVUlelb2arhfQp8mcNlHz+ZhZSJK5BN2PCQlLlEp1KK9aZLRgmomI9bDizHSiT1XW3KJeuoOznaPxVx4W6RkphPbnBF4U5zoehA4rrhSkQifMNUOI02fySwnIrD2MgoaB0moxGRYEQGSYYIOygly5r2uU8qtigS0EHeIrrSX1v9yWJD7IMeKUXl/PQtRRlq3nTTuw/iuje0vx3xk4OfbDzFKoEopt1s5jha7zDDezj0m1fRiHwYjx7wCFUajG0Lito/9H19ZGfQWeiMEyaZL71foaXYQgkmYiXfnh6NdV0YgASk2d4cQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB5964.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199018)(36756003)(85182001)(86362001)(2906002)(54906003)(2616005)(186003)(26005)(4326008)(76116006)(53546011)(66446008)(6512007)(8676002)(66946007)(64756008)(66556008)(66476007)(6916009)(91956017)(71200400001)(6506007)(316002)(6486002)(966005)(478600001)(38100700002)(122000001)(5660300002)(38070700005)(8936002)(7416002)(41300700001)(83380400001)(99106002)(505234007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU5ETlYrSHpYTFpBOGRoMXVmN0ZRUDlpSjRvRmZ4Tm9MTDlkZ2xKcm9hMWxn?=
 =?utf-8?B?SjVxMXR5bWV0a1ViTFRBNk9wN2tIaS9jM3U1NUU2eHpseXllaTVudkIrRFZp?=
 =?utf-8?B?ajRFRDVZTHZBNFdMRzQyODhMVm9LQk9GWis4UXVTRzNhQVpiM25TMW9KSkFP?=
 =?utf-8?B?VkorcmZINHhkTVh4NEtORDJuQWpUeW9GUHUyaDVkTDlETGFlS1hETTBMUGtn?=
 =?utf-8?B?K2NneEJrZ2w5TFhMMGFrYk84SndCNWx4SFQya1dXZTFvVnkyenlUckVLNDBq?=
 =?utf-8?B?UkdpY3JYdTI2blZyWmkxaWdCNG8wM0IvaE0wdHhJZE5HcGNhWjRNVi80cENm?=
 =?utf-8?B?SGEyNm0vdlVMY3ZySGo5VTI1ZE9QVHQwTStZQUhoNFRZMndKcnMyb3kzOHRq?=
 =?utf-8?B?eTdKZDltTWxVbTNIWHBDL2J4SzNONXJsZ29YWFV1bEtxMnBmZENWeDdJT1Fn?=
 =?utf-8?B?VVVWbm81NjhlWTB2aUQrcFdzSlc4Zk8vejlCVE1BaTdIMHF3ZDhYV1poTWRD?=
 =?utf-8?B?SUZwOElXVk1JRVJXS2pLSFg1QSt0MFY2S3hEQU1IMGZxT3RGd2VnazJGM1hG?=
 =?utf-8?B?djZkbm1WdWoxZS9EbGw1NzlDQktQZ1BzTHZqU1RlMEdyQ0ZDdmQwTmo3bjQ1?=
 =?utf-8?B?bXhLdUJXaUw5R3dQU2ZlaHZSdDBPVmkrd2xsRzBCeE0zMVIyK1ZRTTRGYi9o?=
 =?utf-8?B?Smt6Q0V1aDY3eHhxVWNkMENFSHBwSGJUT08yZkU5b21Uc0ZSeldlM1lnSGFq?=
 =?utf-8?B?c1ZiWEFzM041dVhGQUk0RWVRejFIcktaeWlmN0xWNHJrMGEzTmR2Q3M2YmRM?=
 =?utf-8?B?eThlT0dPalBtZ2p6d0RWQ0s1QzZFMGkwM2tlTzJOZ2NyQ0FibS90SjQ1c2JS?=
 =?utf-8?B?MHR6alJwTmsxam43Qk5mVUNPT3ZCS2dpcXRvcm1INTdRcy9JQjUyejRnZXNv?=
 =?utf-8?B?QzNGQnVzSjUyVGR0aXdTbGFWbzNTNjRMc2tIN29FbTBXMHVqVEtXVU1ZUzNK?=
 =?utf-8?B?bDlqckh3dGNVYm5VQXFCQU1lVFhxVFFISVlxdTErZGFQdlZGTUtUNzhLTGcx?=
 =?utf-8?B?b3prRjRvSDJ2N3luTU9abEludlo1OUxVRnoxOE55YTM1c05hYUJxVTFCaFd6?=
 =?utf-8?B?YmUwK3o3ejVIL2RBcUk0bVQ0b3R3Uk03b1ZvQ2Rod0d6VnJVRllBY0VkNDBk?=
 =?utf-8?B?L21taExlUEoxclYweXRJV3RQOXRkMHRsL1lRcC9vOUdGSXpMR3l0Y2lDdFlz?=
 =?utf-8?B?UU9rOWxQL2wyQ0xGYVVSL1Jka3c5QTIyWCtrbVZ1RXFEVG45VThiR0lUUDNs?=
 =?utf-8?B?bkJqZi9CRFZ6cXdidXI1N3EvWWJLZW0weS9hNFlBZWV3NW1FUnhwcXBWV0tw?=
 =?utf-8?B?Ym9DcTFGUkFFN09UYjN0ZnlSaWtHZXQyMS9uTDF3UjdKdGVCaGNGdklVY3lZ?=
 =?utf-8?B?ZHh6MWFHZDVNN09oT2FCUEl2RnRsL0ZsVE9ZS2lOZ0t4YTBIOG9BeTFCVldV?=
 =?utf-8?B?WFJoS1lqSCtCcTVhSXlwNm54V0lhbEZYYkRYc3A0N3pWbHk5RXIraFg3bFJT?=
 =?utf-8?B?Ujg2UDBxNlJVTkpWdnlBdlJ6Z3NZRS9zL3VReEtpcmJPTnFLU2JQaDJrUFJL?=
 =?utf-8?B?TytMYUZWQW5uWGQrS1hvNEJLT3RLdDJKZDVDK2tteTk3d0NNMWc3VW5HdUpJ?=
 =?utf-8?B?Z3JPTEV0U2d0MDdIaCtVVFNPdU1uelBIVU83dFljMzZDTlkwK2pwOEMrQkdG?=
 =?utf-8?B?RnZxcXBqUW9PN0txMHBuYlJuUVlpTytGUzN2S3FOK0ZiVWR2Tm5HdEI0SkRu?=
 =?utf-8?B?RXR2cWFMdC9JZk9KL01tcXVRU01GZXFvZExIaWdjeG1jbnMvR2dCTVFYdk1X?=
 =?utf-8?B?VlhEU2huV0IrU1A2cWZUWG9lc1VRb2lNYTc0Q2V6ZlFFSkNXanNGM1F0R3ov?=
 =?utf-8?B?R09iYXlIVXhkeGRybmwwbTdmdkZCMEhGM2NKYXhlWXRESzBwNSs1c29oRzlp?=
 =?utf-8?B?L0tNbGh4R0JKOVJuRXM2aUZ6cUZZVllFKzFZTVdIb3Z0bnQ5RXNXdnpieVla?=
 =?utf-8?B?bnFzdWNJbGZ0YXdXTXVZMU11NUhZWTVmaUNlUEUvSndRMUFGZ0tLTGJMVmNp?=
 =?utf-8?B?RytvMVBJR2owdkpEaTF0VU13RUMrV2Y5SnJxOWczK3dGZWhUbFljVWhhbklV?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E94C125E35F5E94E8193876607E24EA4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB5964.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73102858-5023-48d8-e494-08db01401e52
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2023 14:58:30.0715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C0A6kjEvqWU9jaf5yPFj4gbH8FfkAMdSVpNBamtlhFzeSvalJwhHr1o0f8Driw5ntpRTMM653iuvXPoPEz2vMmEUVrKVNxaixcIQpzNUMdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5529
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_145828_245273_7E4EB250 
X-CRM114-Status: GOOD (  25.09  )
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

T24gTW9uLCAyMDIzLTAxLTIzIGF0IDIyOjQ2ICswMTAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3Rl
Og0KPiBPbiBXZWQsIEphbiAxOCwgMjAyMyBhdCAxMDozOSBBTSBLdWFuLVlpbmcgTGVlDQo+IDxL
dWFuLVlpbmcuTGVlQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gV2Ugc2NhbiB0aGUg
c2hhZG93IG1lbW9yeSB0byBpbmZlciB0aGUgcmVxdWVzdGVkIHNpemUgaW5zdGVhZCBvZg0KPiA+
IHByaW50aW5nIGNhY2hlLT5vYmplY3Rfc2l6ZSBkaXJlY3RseS4NCj4gPiANCj4gPiBUaGlzIHBh
dGNoIHdpbGwgZml4IHRoZSBjb25mdXNpbmcga2FzYW4gc2xhYi1vdXQtb2YtYm91bmRzDQo+ID4g
cmVwb3J0IGxpa2UgYmVsb3cuIFsxXQ0KPiA+IFJlcG9ydCBzaG93cyAiY2FjaGUga21hbGxvYy0x
OTIgb2Ygc2l6ZSAxOTIiLCBidXQgdXNlcg0KPiA+IGFjdHVhbGx5IGttYWxsb2MoMTg0KS4NCj4g
PiANCj4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NCj4gPiBCVUc6IEtBU0FOOiBzbGFiLW91dC1vZi1ib3VuZHMgaW4g
X2ZpbmRfbmV4dF9iaXQrMHgxNDMvMHgxNjANCj4gPiBsaWIvZmluZF9iaXQuYzoxMDkNCj4gPiBS
ZWFkIG9mIHNpemUgOCBhdCBhZGRyIGZmZmY4ODgwMTc1NzY2YjggYnkgdGFzayBrd29ya2VyLzE6
MS8yNg0KPiA+IC4uLg0KPiA+IFRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIG9iamVj
dCBhdCBmZmZmODg4MDE3NTc2NjAwDQo+ID4gIHdoaWNoIGJlbG9uZ3MgdG8gdGhlIGNhY2hlIGtt
YWxsb2MtMTkyIG9mIHNpemUgMTkyDQo+ID4gVGhlIGJ1Z2d5IGFkZHJlc3MgaXMgbG9jYXRlZCAx
ODQgYnl0ZXMgaW5zaWRlIG9mDQo+ID4gIDE5Mi1ieXRlIHJlZ2lvbiBbZmZmZjg4ODAxNzU3NjYw
MCwgZmZmZjg4ODAxNzU3NjZjMCkNCj4gPiAuLi4NCj4gPiBNZW1vcnkgc3RhdGUgYXJvdW5kIHRo
ZSBidWdneSBhZGRyZXNzOg0KPiA+ICBmZmZmODg4MDE3NTc2NTgwOiBmYiBmYiBmYiBmYiBmYiBm
YiBmYiBmYiBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYw0KPiA+ICBmZmZmODg4MDE3NTc2NjAwOiAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMA0KPiA+ID4gZmZm
Zjg4ODAxNzU3NjY4MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgZmMgZmMgZmMgZmMgZmMgZmMgZmMg
ZmMgZmMNCj4gPiANCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xg0KPiA+ICBmZmZmODg4MDE3NTc2NzAwOiBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBm
YyBmYyBmYyBmYyBmYyBmYw0KPiA+ICBmZmZmODg4MDE3NTc2NzgwOiBmYyBmYyBmYyBmYyBmYyBm
YyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYw0KPiA+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+IA0KPiA+
IEFmdGVyIHRoaXMgcGF0Y2gsIHNsYWItb3V0LW9mLWJvdW5kcyByZXBvcnQgd2lsbCBzaG93IGFz
IGJlbG93Lg0KPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+IC4uLg0KPiA+IFRoZSBidWdneSBhZGRyZXNzIGJl
bG9uZ3MgdG8gdGhlIG9iamVjdCBhdCBmZmZmODg4MDE3NTc2NjAwDQo+ID4gIHdoaWNoIGJlbG9u
Z3MgdG8gdGhlIGNhY2hlIGttYWxsb2MtMTkyIG9mIHNpemUgMTkyDQo+ID4gVGhlIGJ1Z2d5IGFk
ZHJlc3MgaXMgbG9jYXRlZCAwIGJ5dGVzIHJpZ2h0IG9mDQo+ID4gIGFsbG9jYXRlZCAxODQtYnl0
ZSByZWdpb24gW2ZmZmY4ODgwMTc1NzY2MDAsIGZmZmY4ODgwMTc1NzY2YjgpDQo+ID4gLi4uDQo+
ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQo+ID4gDQo+ID4gTGluazogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE2NDU3
X187ISFDVFJOS0E5d01nMEFSYnchaUVPT0lDbDdEemh2ZllvYm1ROE1zTkZBV21icWljWGRqZDBM
WVd3OXVCT3F3ajhsYWk3b0VPRFZkUkp5V1VFWHIxMUEzLW03d2JJWDJjZHB4THdpVzZUbSQNCj4g
PiAkICAgWzFdDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS3Vhbi1ZaW5nIExlZSA8S3Vhbi1Z
aW5nLkxlZUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gVjEgLT4gVjI6DQo+ID4gIC0gSW1w
bGVtZW50IGdldHRpbmcgYWxsb2NhdGVkIHNpemUgb2Ygb2JqZWN0IGZvciB0YWctYmFzZWQga2Fz
YW4uDQo+ID4gIC0gUmVmaW5lIHRoZSBrYXNhbiByZXBvcnQuDQo+ID4gIC0gQ2hlY2sgaWYgaXQg
aXMgc2xhYi1vdXQtb2YtYm91bmRzIHJlcG9ydCB0eXBlLg0KPiA+ICAtIFRoYW5rcyBmb3IgQW5k
cmV5IGFuZCBEbWl0cnkgc3VnZ2VzdGlvbi4NCj4gDQo+IEhpIEt1YW4tWWluZywNCj4gDQo+IEkg
Y2FtZSB1cCB3aXRoIGEgZmV3IG1vcmUgdGhpbmdzIHRvIGZpeCB3aGlsZSB0ZXN0aW5nIHlvdXIg
cGF0Y2ggYW5kDQo+IGRlY2lkZWQgdG8gYWRkcmVzcyB0aGVtIG15c2VsZi4gUGxlYXNlIGNoZWNr
IHRoZSB2MyBoZXJlOg0KPiANCj4gDQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9naXRodWIuY29tL3hhaXJ5L2xpbnV4L2NvbW1pdC8wMTJhNTg0YTlmMTFiYTA4YTYwNTFiMDc1
ZjdmZDBhMGViNTRjNzE5X187ISFDVFJOS0E5d01nMEFSYnchaUVPT0lDbDdEemh2ZllvYm1ROE1z
TkZBV21icWljWGRqZDBMWVd3OXVCT3F3ajhsYWk3b0VPRFZkUkp5V1VFWHIxMUEzLW03d2JJWDJj
ZHB4TndDdGZwSiTCoA0KPiAgDQo+IA0KPiBUaGUgc2lnbmlmaWNhbnQgY2hhbmdlcyBhcmUgdG8g
cHJpbnQgImZyZWVkIiBmb3IgYSBzbGFiLXVzZS1hZnRlci0NCj4gZnJlZQ0KPiBhbmQgb25seSBw
cmludCB0aGUgcmVnaW9uIHN0YXRlIGZvciB0aGUgR2VuZXJpYyBtb2RlIChwcmludGluZyBpdCBm
b3INCj4gVGFnLUJhc2VkIG1vZGVzIGRvZXNuJ3Qgd29yayBwcm9wZXJseSBhdG0sIHNlZSB0aGUg
Y29tbWVudCBpbiB0aGUNCj4gY29kZSkuIFRoZSByZXN0IGlzIGNsZWFuLXVwcyBhbmQgYSBmZXcg
YWRkZWQgY29tbWVudHMuIFNlZSB0aGUgZnVsbA0KPiBsaXN0IG9mIGNoYW5nZXMgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLg0KPiANCj4gUGxlYXNlIGNoZWNrIHdoZXRoZXIgdGhpcyB2MyBsb29rcyBn
b29kIHRvIHlvdSwgYW5kIHRoZW4gZmVlbCBmcmVlIHRvDQo+IHN1Ym1pdCBpdC4NCg0KSXQgbG9v
a3MgZ29vZCB0byBtZS4NCkkgd2lsbCBzZW5kIHRoZSB2My4NClRoYW5rIHlvdS4NCg0KPiBUaGFu
ayB5b3UhDQo=

