Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EE6C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 02:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YY2k4snabdKlT3BogE7+pFtbU7drQrXMUCy/ncdIMLw=; b=jnlqHstqkIXwxa99DkvFa3Mgez
	vYZ+GcU571f08x1vQDQX9GyuuZ8xryUvF25GMzL5yTC/z9hPrDesVp4C2ofb3zFlcihMbfs84Zc3e
	JAGchOTBBigMT57L7DIGEN+5LQuWA/7b3K7EagJDZenAOS9YzTnge0528HrTrL2EUt7fuJS3ZIt4C
	wWby7vDnmOFhoC2iW380mObLLc74e1yKb1Btn8u+b5WrWp1TA4ovZTg4nIw0tJepUp/brhjx4YF5X
	Kg68JswDn3WN+wYcRkvxER+CjWDlq0Ef8kCJCBeoBHgy1TRWpvk9OjFITV0aYFU8s31Kuo55fXlDf
	Ef71smJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNP7m-00E89F-4k; Thu, 02 Feb 2023 02:14:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNP7Z-00E846-CO; Thu, 02 Feb 2023 02:14:44 +0000
X-UUID: 54daf6f8a29f11eda08d4d6090ec5a5c-20230201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YY2k4snabdKlT3BogE7+pFtbU7drQrXMUCy/ncdIMLw=;
	b=KqGWTyFI7Dcpixk/+ZNkO5Q1fs3iOAgF6EvbDUzyHcbdCYg64jBAPzJdEj9tjpT9LDGiJDyaLpnBjAi4fPOqvG7q+90Qf8hEvoVYm0QiUdVFpGKxGhLLUr6rm3Vni26r3MgUe0MRcUxvKYEu9zZK/Dfmo1vdymY8tGUOKWx11Gg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:e45e2bb8-8962-473d-b32d-e04958ffe14b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.18,REQID:e45e2bb8-8962-473d-b32d-e04958ffe14b,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:3ca2d6b,CLOUDID:bc07a58d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230201071751MKX7SVIF,BulkQuantity:17,Recheck:0,SF:29|28|17|19|48|102
	,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 54daf6f8a29f11eda08d4d6090ec5a5c-20230201
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1662923254; Wed, 01 Feb 2023 19:14:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 2 Feb 2023 10:13:57 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 2 Feb 2023 10:13:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4b6kLfaow1aIKKOsK2ukGsZd0P7gLRphVFi6z57ibGIzqTz776HFPMBDF+IaWvmzKd/ELqKHX9xmg7mpM/a/eR6H+mp3jpBgwKiKjD/OUNFJnq0Mbivjk7dvs8CWZnlP9VgIWXLFNyvndBdxeXwcwpmpbGSwLcG5ggRdyDG0WU2OS8lDluklLfUYblyoytMbWkSEOGJQ9Kg6x3dWV9/O4hktiYte6OUx7Oej3RyaUgI9K1+iJbSZeg5yX/S6SVF2iOWuPABS2naHChI3fztnGf7DG8iyTQIr9DwsKGX/44qPjkH8CeUfciZabw6TRH7XDXuF0lTCRjWrZ5rhQxWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY2k4snabdKlT3BogE7+pFtbU7drQrXMUCy/ncdIMLw=;
 b=Je/yn6Y1qLgz1SLJKgE0wi7okXOlm4LcwyJt3bm3XAlRIn1ar4sccwwKxnsX2dTM8Bts2i2WwMblcSVHXQUW0J9nf/gsl0UlC+EkWFYh+hNGjUefUADUQAKphFX0ZCf/ymmUnjkqr+nKAXNZ9Zeo6lD+r77Uud2jf37n5PwYqb8WxJ5RJbIKmW+ugVfgO26QWuZ+wT+bArbYDj/SS6XHBA4V9ADSK4lG/Yjc/2d9uXQnfzO29nSAIc1HTZ0koEm1STbO/xk4g+LsKycP8K/W2TK8XGe4TS4i8y3dku+vzfojV65FYlwRxIiQqEt+dO6z2QeUayrPUcRSHwDztWcPyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY2k4snabdKlT3BogE7+pFtbU7drQrXMUCy/ncdIMLw=;
 b=iuxk392DLkrzNiTyjr8tZhy+XKq8sd742BLylQ1zfkRTGUyEZ38Znl2mOIbo4UxiFjWW7JoFLx+EuC4CHaNOYnqSETO/749cWYyCuwl7w3LEU2ssOGScC5EjlzbNgqkwTLWjm0updJGpm0Z4GxS/9LJuASPPCFjCUfcaCA57hKs=
Received: from PUZPR03MB5964.apcprd03.prod.outlook.com (2603:1096:301:b4::11)
 by SI2PR03MB5497.apcprd03.prod.outlook.com (2603:1096:4:12b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 02:13:55 +0000
Received: from PUZPR03MB5964.apcprd03.prod.outlook.com
 ([fe80::c43a:ce45:4a27:bd80]) by PUZPR03MB5964.apcprd03.prod.outlook.com
 ([fe80::c43a:ce45:4a27:bd80%7]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 02:13:55 +0000
From: =?utf-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?=
	<Kuan-Ying.Lee@mediatek.com>
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC: =?utf-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	=?utf-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?=
	<chinwen.chang@mediatek.com>, "apopple@nvidia.com" <apopple@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "jhubbard@nvidia.com"
	<jhubbard@nvidia.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH] mm/gup: Add folio to list when folio_isolate_lru()
 succeed
Thread-Topic: [PATCH] mm/gup: Add folio to list when folio_isolate_lru()
 succeed
Thread-Index: AQHZNT3D27RC3dMIM0Oy2HCSb57LdK65KfQAgAHDjQA=
Date: Thu, 2 Feb 2023 02:13:55 +0000
Message-ID: <ef92f5493f70cab6b09016c633395577c09bed1f.camel@mediatek.com>
References: <20230131063206.28820-1-Kuan-Ying.Lee@mediatek.com>
	 <20230131151742.df43c3fd11bda01b613234ef@linux-foundation.org>
In-Reply-To: <20230131151742.df43c3fd11bda01b613234ef@linux-foundation.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB5964:EE_|SI2PR03MB5497:EE_
x-ms-office365-filtering-correlation-id: dc41bf0e-dd80-41a4-6d55-08db04c322cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hx3XNAgr31DJuNNW7BUr8BdES0EDLAgUISJZ2NFudJ1MEmlhhI4IwrZQkh7gAPSfbClFzVqai7sIoeH7NXPSTCusNgA5nTDEoRnDWFhFLVo5WSz6aQJWmXvtHdtrGzYqm+viIlcKzlviGKWDLABk5GE5JeegZaZgDyR++CgFU4ISGJUHHu2UfCCqMTKFsUfmBjtlUgUJX2HYoitn9z0x/Hml++fng0itY80oJXWeusvrQJhdepdT2CH143k+6hHPLiQCgxzFOp1kTd0VcJNAwIzE7rRwNm+GsO/Eb8fRzrotQ6GNCxFyZ7YpJux7eLFSee9hR37C01Pop+cfPOg39J0oOTvHDt4LjocK5V3ROtaTmniFet65eezueI/TX5NuAXY9mm1W86WNwROyxt8ShuGt+RLHIkpp2aq9zNTPdhffIuljNWVVSYPuAhfGJY2SqdvZZgzZz7sOBSKbG/oeOvkPPuU1SNnhwSuaEzo2ZEiwOImzHESJklMxxzDuEymZqwJ4diIyheOTwsM9V24CzfoZQ5yFvpEKkQ40Vb68ogLhIQSrRuPKzArX7Gty42vfsdB1VEo2x32WY+UE14TfHWjC2BsVT+Nvvzc/pugZ+b/wSflkVpS/uaxvBu+GphgJsANGckycckWW6zoZfmLtRHWXO+Poyj/ml+w/WTR/BQC0BryGKaVoqQAS7mbzpwBfbs7FCT84TY+kv2bYji0/w9SCNJ0NFTSZPfFnq4cB1Bw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB5964.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(186003)(2616005)(6506007)(6512007)(71200400001)(26005)(478600001)(4326008)(54906003)(6486002)(66446008)(91956017)(66556008)(66476007)(8676002)(64756008)(66946007)(6916009)(76116006)(316002)(86362001)(5660300002)(41300700001)(36756003)(8936002)(2906002)(4744005)(85182001)(122000001)(38100700002)(38070700005)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDZoeVUwbGsxVk0xOVhIT1ZXYzhsWjF2OXMwRmQ0ZXpkSzBSMFBmUkxHMm1q?=
 =?utf-8?B?Wm1wV3pHc0NBMW5zRjJ0aHozWE1QTVNQVXdMc0VSdUc5UXI2VXV0Qkoza1Mx?=
 =?utf-8?B?ZmVIakVNVXFsN0didE45Vlp6MUFrK1JRWTBGMnl2RVY0dHh2TXpyaFBvRVpB?=
 =?utf-8?B?TnI0SFRacFRNbzI4cWphdGV0Wnh0Nm1wcTc2UUpoaG5POVZldE1sWDlGVklG?=
 =?utf-8?B?d1FHN1ZmakVyUUp2TlZORjlwK1FXalkwelJ2Yk91bnhGR1VXZ3NDQmFOeVVO?=
 =?utf-8?B?bUREYkh4V1U4bzFuYXZPZndjbTN6T1RZQ2VoeHNEdCs5Rnhwa1Z6Ym55ZE1Z?=
 =?utf-8?B?VktreEM5dlpMK3VMR2M2d3lqbldPZ0hTZ2w5TDVZS0J6UkdVdm13VEEyaW9j?=
 =?utf-8?B?ZUlXbGZIb3VSUitCWWp5M082aXFjZytaTU9WZklhL1hHNENCbWJhVzZZREs1?=
 =?utf-8?B?dDJZaXB0Yi9tS2cwZjRDTjNnYTloUkZpWjFDQjVKYVFSMWxRSkNaN3BsaDJK?=
 =?utf-8?B?NmlrZ3NFeGU4Wm95b1diK2NlV0R5MklOa1N6Z2RLQjM1UTk3cEgvVlNWY2JF?=
 =?utf-8?B?bXBLRTJ2bC9jTGxDTWZqKzdab3FpR2V2d0hIUy9rMkdpbW80S2xXWTVLYjZ6?=
 =?utf-8?B?Q1dQRHNtQzRYS1MvQzJBN2FpL1dFa3NTeVBDMVd1M2FYMVdOOTA0QUNpUEZ0?=
 =?utf-8?B?Vkw1dXpscDIrT1E4ZmJ5dmVKV3BKUDNCWGdSZ0YvQ1FTSkUxTzNWajhVN2t4?=
 =?utf-8?B?a0RUd3krdEw2SEtNbG94WGhJb293bjlGbGs3WmU0OVNRbG90ZzJMcUhhRHJC?=
 =?utf-8?B?MmtzRGlVc25pOXc0N1NRU2pOYUx6OXZTRVVJZEhBL1d0Y2kxL3QxL3VTY2Jy?=
 =?utf-8?B?SnUxdnM5ZllwZEJPNXBleG5iZUJJRVQ5Q3ZzcHo0OTd5MGwxdnFkVUhCV3Bk?=
 =?utf-8?B?eEJYdEVPVHdTaklESTdiQjhGMmtOWDE2OW41M0Q1SXp0ZUl2cVNFRTI0V2FD?=
 =?utf-8?B?dVRueFl4QWcyWi8rQ2lxUEVGUVJYWEo0M3dmRzdhalNGRVhNL3U1YVNCNEUy?=
 =?utf-8?B?L3R1ejhTZGVITU9QdHJRRS91Z21qYVBnWWZOelBMUDBhRFYxMktpTlNmT0hL?=
 =?utf-8?B?dFJvZEZ2ZVVGN0tpZ3V1S1JxYnNlUHFDdG5pdURJRG96Y1NaRVJzdHNFZmor?=
 =?utf-8?B?MjR2S2cxMmtJbGlyRFlheHVQK3lCMlZUY2VrVG5SdC92MHVVeFRSQ25yaE1q?=
 =?utf-8?B?Sm05NlZQS2lXVW8xVkN2TmJYMnpTVlU3RU1uL3pXbzNraFF0SElsOGZzczNV?=
 =?utf-8?B?ZmlMdDY2RkZIWEVUbFRrVHJMNmJhRzRzZTc0T1FXcDUzdXpMcUFMOWFDdmlq?=
 =?utf-8?B?aUl4VVNOMTVFSzZBTm9OU3FuVGxXb2tRY0xGNC83YW82aERpTG5DZnFBTURu?=
 =?utf-8?B?YlVZNy9QWkVMcmtkQjF4NFZ3dWFZamdTc3Yza1BjTG5DQkZRNVdjQnl4aUtP?=
 =?utf-8?B?TmhRaDdXMTFUK1BKTk5kVkY4VzQ2ZG5paldmTVhrNEJ1d3p6NTljUCtIaTZY?=
 =?utf-8?B?N2hQK2R1NHY2VEF2Z1N6V1ZBVExCR2JLMk9ITUJQbHJ0ZmVQYkRoUVNndm9u?=
 =?utf-8?B?aittUlc4bEt5SGIzSWMyc25hS1lYWDRlV2xrZzgvZWdxT01DRUdUemcyRlJX?=
 =?utf-8?B?aDRqNisxYVNWbGNGa3c2dGxaT1dJblpkTW5xMWorVk9NT2g3TmdNZUQxalBn?=
 =?utf-8?B?QUExbnN1MWhqZ0haazZ5cUtYdFZ0TWdNS3VEOE1nc3pobDBrTEhTQWtaTm1q?=
 =?utf-8?B?WFRHNi90MnNZWHQ2Z2hTS2JSMUN3UkRTTi96VGc3TVdyZUo2aXZ2RzV3RlA2?=
 =?utf-8?B?M0d4c3JTamRjOW5YU3J3ckw4V0JmN0Z2Wnh6cnB6QTNCQ1NSUkRYa0FhaVVT?=
 =?utf-8?B?c1A0RVp2MkxnL29jVmwvd3kyeXBQZy9vaDNjTjdiQWJ6WnJHeHcrRERmSkZo?=
 =?utf-8?B?T0tNS3U1TUxoVVV3amwvbTFBcTNpMlNUQVpJanBsbGIvaE5WVFhmdXB5NTVv?=
 =?utf-8?B?a0JSKzFSUVZrd21TSHU2S1V0KzMwK3lxN1REM3hJZ2k1Qk5adG9McHl1VGZZ?=
 =?utf-8?B?M2VxOWpGR21FdGsvRm8wblp4SE1lQW4rRWxuWThIREc3SHpKdnlTclRCQ3FD?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A57A4D349201F14C8EA9B9C573CBE7B5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB5964.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc41bf0e-dd80-41a4-6d55-08db04c322cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 02:13:55.1388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rfcxMGN1nwr8oi85T9f/SzrRoNUXXOT4tjwrjXMYk8N7/KqyMmOz3QJFwXmooOn4+qGYLokue3xNizw7RffFu+AvoJ8aoSlpQnIQFwBBNHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5497
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_181441_459666_62093DF3 
X-CRM114-Status: GOOD (  16.61  )
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

T24gVHVlLCAyMDIzLTAxLTMxIGF0IDE1OjE3IC0wODAwLCBBbmRyZXcgTW9ydG9uIHdyb3RlOg0K
PiBPbiBUdWUsIDMxIEphbiAyMDIzIDE0OjMyOjA2ICswODAwIEt1YW4tWWluZyBMZWUgPA0KPiBL
dWFuLVlpbmcuTGVlQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+IA0KPiA+IElmIHdlIGNhbGwgZm9s
aW9faXNvbGF0ZV9scnUoKSBzdWNjZXNzZnVsbHksIHdlIHdpbGwgZ2V0DQo+ID4gcmV0dXJuIHZh
bHVlIDAuIFdlIG5lZWQgdG8gYWRkIHRoaXMgZm9saW8gdG8gdGhlDQo+ID4gbW92YWJsZV9wYWdl
c19saXN0Lg0KPiA+IA0KPiA+IEZpeGVzOiA2N2UxMzliMDJkOTkgKCJtbS9ndXAuYzogcmVmYWN0
b3INCj4gPiBjaGVja19hbmRfbWlncmF0ZV9tb3ZhYmxlX3BhZ2VzKCkiKQ0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEt1YW4tWWluZyBMZWUgPEt1YW4tWWluZy5MZWVAbWVkaWF0ZWsuY29tPg0KPiA+IA0K
PiA+IC4uLg0KPiA+IA0KPiA+IC0tLSBhL21tL2d1cC5jDQo+ID4gKysrIGIvbW0vZ3VwLmMNCj4g
PiBAQCAtMTkxNCw3ICsxOTE0LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcNCj4gPiBjb2xsZWN0
X2xvbmd0ZXJtX3VucGlubmFibGVfcGFnZXMoDQo+ID4gIAkJCWRyYWluX2FsbG93ID0gZmFsc2U7
DQo+ID4gIAkJfQ0KPiA+ICANCj4gPiAtCQlpZiAoIWZvbGlvX2lzb2xhdGVfbHJ1KGZvbGlvKSkN
Cj4gPiArCQlpZiAoZm9saW9faXNvbGF0ZV9scnUoZm9saW8pKQ0KPiA+ICAJCQljb250aW51ZTsN
Cj4gPiAgDQo+ID4gIAkJbGlzdF9hZGRfdGFpbCgmZm9saW8tPmxydSwgbW92YWJsZV9wYWdlX2xp
c3QpOw0KPiANCj4gVGhhbmtzLiAgV2hhdCBhcmUgdGhlIHVzZXItdmlzaWJsZSBlZmZlY3RzIG9m
IHRoaXMgYnVnPw0KDQpIaSBBbmRyZXcsDQoNCkkgZGlkbid0IGhpdCBidWcgb24gcmVhbCBkZXZp
Y2VzLiBJIG9ic2VydmUgdGhpcyBpc3N1ZQ0KYnkgdHJhY2luZyBnZXRfdXNlcl9wYWdlcygpIGNh
bGwgZmxvdy4NCg0KVGhhbmtzLg0K

