Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7EEC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 02:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tp2DAkPEgc8AGAKRYzwe/1RRimd4TgD0ixfohGfEJyo=; b=E/r6tVHm9KNsVW/XzO4AstS9gy
	q+UsQY07b51fvmYmveB98ne2oq8cHlqlK2NhF6GmbLBgp7Dhd0t7JtqMMg6OVHBeJYD0KUmZj0acI
	MjqDNhbe9jbxmUVWkocTRN57VCM+67zj3dX1aNNuX9pRzxZJK4n4aHaI5JejDoIiF3CoYiHLtLTOr
	3/vyqxvkv6uEEoUOuWZ8+YSDn38Q26RjeXspYsSdnLxuahWVFvoS7PXFJCsM5bz+7IULThMTsvNt/
	BjfLtS+WzjO7pSAMYXSGJyTLxdfhas1Kfmsv+lF9d8S+rUwJK97DASewWpnDFMDFQJObWoCEvmX2h
	xWVJ7Phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgMF-0065RB-2w; Tue, 31 Jan 2023 02:26:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgMB-0065Qj-H2
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 02:26:49 +0000
X-UUID: b44052eca10e11eda08d4d6090ec5a5c-20230130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Tp2DAkPEgc8AGAKRYzwe/1RRimd4TgD0ixfohGfEJyo=;
	b=LXSkbogwr+su8OEbEi/bYRediJXvrFd/1YeVbMtfgM2e14SrBZkzdr127lj6sJb5bnC8CewheGRjRgDvCNB2sArRkWOnPER7OBTCHmHbtxbGv04haQQXoU36hiRF4jvapRt23znteZfddBCdjsU1vJWyYtsjMmMX7dYix0KN/AM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:113f6f0d-8127-4a63-88d4-d474348ad88e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:2771688d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: b44052eca10e11eda08d4d6090ec5a5c-20230130
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1917873001; Mon, 30 Jan 2023 19:26:44 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 10:26:42 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 10:26:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3WjBLwgRloLLKp9voPuSlDA7D1CWUC2BFxDqnC3kkq6X6SofpRBKS6s79ruNrdDn7lNM64O03x18jx+3jm+ccnNHLafBqjkkGKxEqGAc1mA//B85Qb/tahUo8Aku1bx23HIVk3tYrt4HSwext3oDMril7yDG+TZv/GcSUgLpSg/K7FYryBgBGQw5FwC7eTxlPOt4+PJUTnkSOiFJisWEMiuxOppmOFO1J755LTmSdHGzrRCLCuyAeC/UWdlqtMGc0EwKBp43tQ/pYh0pBPN73hY/HDlH4SuZFmGA5rEhsMllLbZ0B6ork9Invd9cCCnPhnHgvsehHdAsmTKtzwkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp2DAkPEgc8AGAKRYzwe/1RRimd4TgD0ixfohGfEJyo=;
 b=BxdZIANOdyQJLIwJIb5wfbvJVfjvjvGo8fukJc8goA5NYF9IvNgJOlyPW1wALxpRDeLyHb2E0+qnvbZ1JqwJ2C0LbLClr77wW0ffVkubxUyEa3B9eAQN8bRWgroxswEx9SHb+/cP9hSURXzQOm80OncezPRgYN2xTEoQnDtprq61gVSTocq/nqPJ9Jr60ncgMUdyyzE88LADLah5TY4cxCOkGHmKXN7SizUjha0kYKALRRIccZvzvgCNyEDw261TObmfnD/2X5uTWlqGTQHtxwG9ZZYMTnUYyGJJYON7AaoRDF32Y8uBTkYRGV6d62DJ04PzAF6N0yOg2s9JxDKIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp2DAkPEgc8AGAKRYzwe/1RRimd4TgD0ixfohGfEJyo=;
 b=Jc+dWvHVHPpgoCCwSfRkWtCKVvP14BaSbmvjVEHxA6SLlf32CAG40Lrp6Y40x0u2GOl8otKWvfw14TFrhmkm5OCsqJcJMjLyyipdTqCJFLk/HEsrKgFeZLanjkFA2iGH4nEvvFvoV+UIcu2G3nvxrIKYcaMqb1cVW6/C8Dsdh+c=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by TYZPR03MB5965.apcprd03.prod.outlook.com (2603:1096:400:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 02:26:40 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::2ad4:ba34:1089:fc39]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::2ad4:ba34:1089:fc39%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:26:40 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "error27@gmail.com" <error27@gmail.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [bug report] ASoC: mediatek: mt8188: support etdm in platform
 driver
Thread-Topic: [bug report] ASoC: mediatek: mt8188: support etdm in platform
 driver
Thread-Index: AQHZMLaNbJKt2CxKSkytZPUwYIwyyK62uEEAgAAlhYCAAPeygA==
Date: Tue, 31 Jan 2023 02:26:39 +0000
Message-ID: <8a28b741dc71c0cdd97564e2dcd6fba497484f91.camel@mediatek.com>
References: <Y9EdBg641tJDDrt/@kili>
	 <8260fa7da639c118ec6757e6d3e25320924dcbca.camel@mediatek.com>
	 <Y9esl7VQ6qW9wnIC@kadam>
In-Reply-To: <Y9esl7VQ6qW9wnIC@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|TYZPR03MB5965:EE_
x-ms-office365-filtering-correlation-id: 569a7ab4-4d27-49bc-05d7-08db033295d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7tLl9wx2eQ18wZXtoL8vY8aYDLTLK4HaMVGYfOsULig7L2iYFmDo80gCWEf0W/k9jR03x22p4xKskwd8C1Hw9dSUz+zbLIB9T7DkYtxGR3k2LIwhW0Jc55vuKPq5YZ5hsxGeHhUqFjjQCmRHO3YOBAC5S1MRraVr/EXFdQ5XLPum4axn65Ib5kOukh4mHarCxipoP9bX47shLpeOE9OdqQvyaECf5q3tSlBY1lRS57iN37xqkjgVz/muV9AQxt18zX/NUgpmAWCpf+8izLehOz+9JqVZoirnZM07GKaagnrb3/A2iN7/shSgp/Nttf8aRng7+O0LRKexT3eAN9Eq4Zcyp5dy7zSXi2kzLYpvhTbJb97RssyCQZDPG1ohqGKzd1hIw4aTNzp0hLNNEYboDYpAEBFbhtszFeF6m0mHrgljg2mR+PkGdM2ZpfwI0615vpLeS5U2rDQ7a+3RcGGLOTsK1f6JqxuY3X8pkfmFJ+gsIbmQgntSgVSTWBx8pKryF1kmUjQRjMzwd9IAxSxebRM1D0hd2jH7cgxWMK/d+P84PqSIvxY/Yu0C98kfPfczRbvZFh5qABXzfKwvZVtVQfIrxxeEen0Y5N3QNEJ+ON6BMalKId5iAlVoTtsH2WEH88Ao/2YHfwnHlq9MfgUM75fe1iB0NYw5ZVMXGtRegYns4jtA3VrWCkPBvF8/cpUf8titJI+S0xDcwoUzrMigBQRxKIgNGwpT8PtInKooa/8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(316002)(2616005)(38100700002)(26005)(186003)(38070700005)(6512007)(122000001)(83380400001)(85182001)(36756003)(2906002)(5660300002)(6506007)(6486002)(478600001)(86362001)(64756008)(66446008)(6916009)(66556008)(66476007)(8676002)(76116006)(4326008)(66946007)(71200400001)(41300700001)(8936002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHhjd1I4QVBranExd011N095ZjZ3VDNnNGJCNmxabmYrSHNJenhodFRrMHkw?=
 =?utf-8?B?SlNUNUp2UGY0REk2QkRFM25paFd0N3VvMVBCRHFpQzh0TFdQc1VkYjBnLzk3?=
 =?utf-8?B?MWNEay9pZVhSU2pFc3FGaXRMWTQxbnVmZmF5dW9nRHBEejRuOHJFZm1qdXhI?=
 =?utf-8?B?a0dCckorelJmdG5nNmlFYytNUUZVU1ZFQWx5MW9tWWJ1MWxwZFQxbEFzVWVr?=
 =?utf-8?B?emVXT3BFWGprWVJpTndJbHFzU3QxQ0NXUy9YaUQxbkFhaHVEaXU4NnhwSklo?=
 =?utf-8?B?WDRIYXZIQzJsa00vOWU5WmtXWEJONE5vSWVJdTROMDhxeEpTTG44WXl1T3B2?=
 =?utf-8?B?V3NsN0ZDbEI0ZkkvMk5uUWNMdUpKbmdZYVc2MkZUUkYwM3lqT0pKOXZKdWFh?=
 =?utf-8?B?cnY0NFVGcFVwSkVTdVhCa0hxWGlBZ1lxMEc3Nks1ak1iYUw4NGFvU0VpZHVO?=
 =?utf-8?B?eG9heFN5cEpsWWE1WjZFeW1VSnViN1FmNFZ6YmJ4c011NmVPUEZTRWhnbDNS?=
 =?utf-8?B?S3I4OGpFY2NMSVRLWDI5QUo4TE1MR05WZ3c5UVRnWlhtVHJFb3ZkVEVBQXdY?=
 =?utf-8?B?d2FLb04rbW1DOHVTUHBTenFSVWl5aSs3VThIK01pMlJWZTBBZGM1Mmh3WW9o?=
 =?utf-8?B?ODdCdUJNMjc2R2pBNnNkSFJWTGtsbTJVcFhkOTlKemhlVXMrQmpPaUdRRjFX?=
 =?utf-8?B?ZjUzaXVpblRBWm1CcFB1bStBeXVYdHJPdHV6VjMwUTNnaE1RU2pQYndBMmdp?=
 =?utf-8?B?dDkwL2FNalo1VUU0VUJUQnNXRmpSL2V5YTF2NXZOeTM1V0E4aEllT1RxN2lx?=
 =?utf-8?B?N3FMQW5qa2RiZkt3LzF3WmVWMGxUeUs2bVBIVVNaUEFRamFWbFp0dStwMTNq?=
 =?utf-8?B?R3dMbGx0eXNiZXEzeFNnTmRBQ204T2ZQeXJDcktpSkNFa29qYW8wMmh2bVk5?=
 =?utf-8?B?eW5TdjV0ZytBQjBVcTNtenhsZ2h5Wmo2RmJOV1NXTExDMVBOdWxEYlBhek9v?=
 =?utf-8?B?SkFLVmx1MFIyNkpyalNVTm41OVd4WjRlWWZRUGt1dUdnWEhnTzJQUkRUNUtp?=
 =?utf-8?B?YTdPeDR6UlBpM2lnNzd1Y0dFd1AvK3ZxQkUwbkhBZWduKzdnWTdxRzc3L0d6?=
 =?utf-8?B?MjR1eHE4cDJPNmJ4OW5UOHFCblJjK0tCSXVPOEpYY04zMjArdEZhMjhXc01m?=
 =?utf-8?B?WkZWRGcyMUNUZUdaSUN1SHlSUHlXNDlleGp5Ni91RlBkZThsQUVaTnd2RlFu?=
 =?utf-8?B?SFpuODdGOW9rc1RqSXcralRxTzdWOHF2WVFnNW9rWUtmSHpTRU5tUFg1T3FH?=
 =?utf-8?B?aEF1Y2trejNPZk8yOGpoKzRKcm5oNEJ1Uy8wL08wNDJTRnBsNEswbXFlektq?=
 =?utf-8?B?ZGQrOWlPTC82S1hpRGdpM2hqZmNaTkdJWlh0ZlB3U3lLUmlROGgvZEZCOERS?=
 =?utf-8?B?RjRXUmVYNE82YUhoNUkwTWUxYU1ZVXV5VUVFS3BEaDF5RkIwMnlSdzFJWnRk?=
 =?utf-8?B?NlVPNW1iRFFPbHA0QmNEZlJUYU1MeDc1eFo4emVBdGRvcG5NQ3BPdzZOS3g2?=
 =?utf-8?B?bDdjdmtTQytlVTV0bUNZaDk5ZFhnUzY2MU9NTFk0a0tvaHd2SHlaN0FrVVhm?=
 =?utf-8?B?T1o3MGtkdEFwOGFwMlhTSzFBc0NOcFVmRXZqS3hSTy8wMDNpbjNmNDY3Vnhh?=
 =?utf-8?B?Tm1zWDhvZDJYZ2ZTaWpqcFRpemNtbG1lQ0h3c3JZbzZFeW5FV1ZxYldVc0VZ?=
 =?utf-8?B?Z3UvZXBCR2x0QVFvYmJYU3dPZ0xzVk9rUThyeVp2Qk1OYXFaZEZWcE1KaVVn?=
 =?utf-8?B?cHJYOFpKMDZoRDEwdUt0WUtmS2ZPZFFvTFpON1BFakduRzhKSno1bDVzcHQ1?=
 =?utf-8?B?WUQ4QXZRcTB3dG5TdlBVQytwSmt5SDUyZEdvYzZIckZMS3NPMVV5Zk1EMGlX?=
 =?utf-8?B?NlIvMjJReUwvNUhoKzF0UUUxWUNBU29qOVZiSE8wUlFTU29MU0ZyN253WGNL?=
 =?utf-8?B?eHRTSTZ6OU5DZTUxOVFqT0VNVDQwek5PS0JVeE8yb0JTdzNKVkY0aUoyZmIx?=
 =?utf-8?B?NDNKSUhzRmdIV0ZOeVpPc2ovRFFuVE4wNFhpaU81djBxc21UelhMNlJUcnNY?=
 =?utf-8?B?SERNN1lEOWttRmo5QitHYTJKZW9rWlcybXgrTFI5eGtsQjNXclZvS3lXVzNF?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <715E95479CFCEE4FACF02771FD3265A0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569a7ab4-4d27-49bc-05d7-08db033295d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 02:26:39.9431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQAX7Sp2A0n5DYqzWUaDK909RVk+wvidgLZYliZ7gFs78O2yC94X//+cUu/56ISrW2QLZkah6fliPm6lb12k0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5965
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_182647_621922_2B1155D6 
X-CRM114-Status: GOOD (  23.07  )
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

T24gTW9uLCAyMDIzLTAxLTMwIGF0IDE0OjQwICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAwOToyNTo1MkFNICswMDAwLCBUcmV2b3IgV3UgKOWQ
s+aWh+iJrykgd3JvdGU6DQo+ID4gSGkgRGFuLA0KPiA+IA0KPiA+IFRoYW5rIHlvdSBmb3IgY2F0
Y2hpbmcgdGhhdC4NCj4gPiBJIGRpZG4ndCBub3RpY2UgdGhhdCBzbnByaW50ZigpIG5ldmVyIHJl
dHVybnMgYSBuZWdhdGl2ZSB2YWx1ZSBpbg0KPiA+IGtlcm5lbCBjb2RlLg0KPiA+IEl0IGlzIHBv
c3NpYmxlIHRoYXQgSSBtaXN1bmRlcnN0b29kIHRoZSBjb3Zlcml0eSBlcnJvciBtZXNzYWdlLCBi
dXQNCj4gPiBJDQo+ID4gY2FuJ3QgZmluZCB0aGUgb3JpZ2luYWwgY292ZXJpdHkgc2NhbiByZXN1
bHQuDQo+ID4gDQo+ID4gSWYgSSBqdXN0IHJlbW92ZSB0aGUgZGVhZCBjb2RlLCBjb3Zlcml0eSB3
aWxsIHJlcG9ydCBzb21lIGVycm9ycyBpbg0KPiA+IHRoZQ0KPiA+IGZ1dHVyZS4NCj4gPiBBcyBh
IHJlc3VsdCwgSSBwcmVmZXIgdG8ga2VlcCB0aGUgbGluZSBhbmQgYWRkIGFub3RoZXIgY2hlY2sg
InJldA0KPiA+ID49DQo+ID4gc2l6ZW9mKHByb3ApIiwgc28gdGhhdCB3ZSBjYW4gYXZvaWQgdGhl
IHByb2JsZW0gcmVwb3J0ZWQgYnkNCj4gPiBjb3Zlcml0eQ0KPiA+IGFuZCBTbWF0Y2guDQo+IA0K
PiBHZW5lcmFsbHksIHdoZW4gc3RhdGljIGNoZWNrZXJzIHByaW50IG5vbnNlbnNlIHdhcm5pbmdz
IHlvdSBzaG91bGQNCj4ganVzdA0KPiBpZ25vcmUgdGhlbSBpbnN0ZWFkIG9mIGFkZGluZyBkZWFk
IGNvZGUgc28gSSB3b3VsZCBlbmNvdXJhZ2UgdG8NCj4gZGVsZXRlDQo+IHRoZSBkZWFkIGNvZGUg
ZXZlbiB0aG91Z2ggQ292ZXJpdHkgY29tcGxhaW5zLiAgRml4IHdoYXQgaXMgYnJva2VuDQo+IGlu
c3RlYWQgb2YganVzdCB3b3JraW5nIGFyb3VuZCBpdC4NCj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBj
YXJwZW50ZXINCj4gDQoNCkdvdCBpdC4gSSB3aWxsIHByZXBhcmUgYSBwYXRjaCBhbmQgcmVtb3Zl
IHRoZSBkZWFkIGNvZGUuDQoNClRoYW5rcywNClRyZXZvcg0K

