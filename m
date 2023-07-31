Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0732C001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Lc2ChWzADflctbZ6FABcsHgkF63oSpArLKor8NiRZI=; b=SGKOrrTl48FN0Nu6G0lx1Sl2fh
	A9ZHcUvkHnGpAFfpsSCBCC1E3of7Pzi0Ai5Go5K8t4JzntSAsPqxos/SJRHtix0viUBh3/xVlolWC
	Wsg0RKuoaoHnjuHCj9dBh2BaGEggxOhIIZSlptKMCbMwQ/EVaulG0yqgtm1dnL3enQKDthxt49unN
	07gLaz5u8UD7NLvdkn5o0Wan7rB58jsycbkTYD87dfo4fMwECDFRwU9VtTFgYTB3iMGxwcxNvBRio
	nrUWRQfKR+KrgxNjV3Wd3qkKfwx7w0ApUtTzgITU2SeBxnkQyzDgG9aPa2B/AKbghwRnLZikSrveq
	4IECSW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQNOU-00EK7r-2Y;
	Mon, 31 Jul 2023 07:32:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQNOS-00EK7N-0Q
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 07:32:41 +0000
X-UUID: 6b3e05682f7411ee912e1518a6540028-20230731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=3Lc2ChWzADflctbZ6FABcsHgkF63oSpArLKor8NiRZI=;
	b=jjH6l7I2B1JhiTO+/Y4pLAA9DLqyez62n+N+Zl3nL70Ev/9VY33UHEex3Mn1gSVqk6ef1IBFAkRrfdur+XYbX6nCcj6RZrS4BbuVpphTB/W17cZ8AnVEA6oPUK2j/cNlzLzv1Etu71gFzyKiQ7PQ7ePKQYnfiMW7m3GKhanH41c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:1c0b13f4-382a-49ba-8fbb-14e01da07ec7,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:70
X-CID-INFO: VERSION:1.1.30,REQID:1c0b13f4-382a-49ba-8fbb-14e01da07ec7,IP:0,URL
	:25,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:70
X-CID-META: VersionHash:1fcc6f8,CLOUDID:294882d2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:230731144215MR3LT039,BulkQuantity:6,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 6b3e05682f7411ee912e1518a6540028-20230731
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 988107191; Mon, 31 Jul 2023 00:32:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 31 Jul 2023 15:32:01 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 31 Jul 2023 15:32:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxU+KhQVS4/i+u1PKBjDLA6MNTcqiB9nO1e70QF77RSj5dsewQcDAVx/6nPLvat4x13tou3xbeafxruINmv+xAbTDjmXRtGMHuz/sVkk/3MGFAinh1IPOZIYH6ql7VFTOeACAyW75hsdTp7AaLLBsQ6dFi5dTtYfA7xrOLqsofvfS3gfIE+lLzLFLAsiwo3lG2n6JpVYrR4Th8Fk9iNyDMvHjiANR5jrb+hGkCiuY/UWajYJ3p2VfS84vl8sFnUwTpoOR+hz8icXqhlScslkQvC4gRRT7F/Hglgjs0zmp7XuomnQ9foIu52vgr6gbUjDqh4aAxZgJc9K26lOh29Bcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lc2ChWzADflctbZ6FABcsHgkF63oSpArLKor8NiRZI=;
 b=Fq+3puqmXDS0qbvHgm4bq0ja8pYHZuIz6hzLlptlLJ8LPLmCg/RmV0a6df/jfGUjD88kfzH5aZSYYCVF4+o5b7xPeTW1HUA8SG3MC2Zb1TOOe6yiyLA5UQOmWqXa8h9ydu0bWVAJvCWRm6sFIz2ZfQtqUetU3dUGXARfqFJ3GxhjfhuZL6tA+NXxSnc0WqjzG0RZRViapTULABUoDuV7GPnXpKIi3lfktktAz2yK4rUy9DF7R4B2sM0Og4dnNblKJY5mpEke81xRdjXG6NAH13mPTF7BhDo2T4c4dMLIsbm2Rrqb4s61HHscHyjtdroY08kNpu28yO4p0MUUIblx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Lc2ChWzADflctbZ6FABcsHgkF63oSpArLKor8NiRZI=;
 b=UyCT4tUhznxyxtN2GdfcaSfHSdA0wMbPr5CiLkjKxT/dm2JOIb8Bn00SsBOBJgYImyCzmMgcK0NZ8Z1vb+WUb3EK06AzRq2q09DMEoz+OvAQFnkz4bIcinkejURwy2CEc+VLXTSrfYk2rV1ZZTXsgl4SPvEVYX1A79H6u9u/Vyk=
Received: from KL1PR03MB6389.apcprd03.prod.outlook.com (2603:1096:820:94::13)
 by PSAPR03MB5510.apcprd03.prod.outlook.com (2603:1096:301:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 07:31:37 +0000
Received: from KL1PR03MB6389.apcprd03.prod.outlook.com
 ([fe80::7f10:d3b7:86ae:4271]) by KL1PR03MB6389.apcprd03.prod.outlook.com
 ([fe80::7f10:d3b7:86ae:4271%7]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 07:31:36 +0000
From: =?utf-8?B?TWFzbyBIdWFuZyAo6buD5Yqg56u5KQ==?= <Maso.Huang@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"chenxiangrui@huaqin.corp-partner.google.com"
	<chenxiangrui@huaqin.corp-partner.google.com>,
	=?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	=?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
	<Allen-KH.Cheng@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "arnd@arndb.de"
	<arnd@arndb.de>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH v3 5/6] ASoC: dt-bindings: mediatek,mt7986-wm8960: add
 mt7986-wm8960 document
Thread-Topic: [PATCH v3 5/6] ASoC: dt-bindings: mediatek,mt7986-wm8960: add
 mt7986-wm8960 document
Thread-Index: AQHZwTM9qZx2VdeqykKSfnhu9XP0Bq/PIWcAgAReQgA=
Date: Mon, 31 Jul 2023 07:31:36 +0000
Message-ID: <5f794f6d3595e845433aab3c48eb47ec7962c929.camel@mediatek.com>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
	 <20230728090819.18038-6-maso.huang@mediatek.com>
	 <7d70f893-ee75-d355-4b4c-4afe7a72cd7c@linaro.org>
In-Reply-To: <7d70f893-ee75-d355-4b4c-4afe7a72cd7c@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6389:EE_|PSAPR03MB5510:EE_
x-ms-office365-filtering-correlation-id: f6c3b383-372f-4b4a-b956-08db91982c26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AEzCyBDBcoRH+sfoWBGjjO/xTLkXe0ex+5BbrBdyx1D9OM/1JyW6zCNo6jfmDEh++qDRUwaajqq0LxKoRQIXZPFXSEicTNAfJ2Wx7CUy67dLhgxT94XLIyX8RDtMN57bFtmSb+dxarS3wfDcN3T36uJ5olnQYvhgc6P1Nl/6Y+DShRVEH0epaZGSHQlv6t18CmuYlQttjrocAYk2EL0H48eg7YapDs1w1UFkzvtejAqlVhywg9fwsEDSUDD8QbmFBwt6S5T/igRBoC0IkB8DwDAsigg/BLK8WeWsI5CEk0dOZ62JahU0XaRnEg1h9Z8zCyqArmxmCLJviJk1DbD2UsfGEmLgwBblJV9Z0U3VcyqaOzQrgLf+kZHoKjdl32Iaj3IJIkwoovoZLesyRkyl9TPVeOUEs/YI4RKSyklbYDQ+baORFcAzgjBPnM4i/JIODtYAwd1hFGBpLjqcZOLmz1E8yBxn3YUmOErwRe5H0mLmCL4eBd3T+62iwLHFnGS51MkQjMgjvUUjSWdXE36TCVJiiAIHa3ioMfqjpnLBzMuzIAbIIeZEgdBLcV1TMvW8v35Wh8secp3bM+kptlqub4LBHrvEpOn1CvEYqLqZRht6XrK6J7sf8G0AhG2dR35gKkNKTatRVAM0LS/CiHa1Pjw9VMkBn8Dkl3VADxecGXYwwQacezahTQGauraIasH1PE3yOHPUHcPnu7w/holRPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6389.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(6512007)(966005)(71200400001)(6486002)(186003)(83380400001)(2616005)(36756003)(85182001)(86362001)(38070700005)(122000001)(38100700002)(921005)(53546011)(26005)(6506007)(64756008)(66446008)(66476007)(66556008)(2906002)(66946007)(76116006)(91956017)(316002)(5660300002)(7416002)(41300700001)(8936002)(8676002)(478600001)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVJrMDlLVkdubS9hMWw0NVdYS2h1QXRmdVJIQWZLQkcxdlQycDlTcUNvSmNF?=
 =?utf-8?B?MjVqVXpjRnBSdU9wZVY4UXhkZG4yRzYyQzdQMktoUzhhL2RWc1FWVERhdGRF?=
 =?utf-8?B?UkRhMitYUTlLWEZ6aE5ibFhkMCtITjhTdS8zbTVZM1pNWnBscEtJdjR4YnNK?=
 =?utf-8?B?bFlVYk9MMzdDWCtmWGQzblVwMmkwZ250WGJPOVY0WlhYeGVOcGlwemZSSTJY?=
 =?utf-8?B?TlBJWk9MZGZKY3h2QmFObWVWeVpVaG5TcEo1QXUzUzRaOEU3WDN1QVJTSVha?=
 =?utf-8?B?K2FUa2prVGUvQmRZbGxqV1V5WDJJSjA0Vkcxb25zQlF3YUxFSWl2RmIxSGY2?=
 =?utf-8?B?eXMvYzg4QXlmU0JVV1E2L2dPdFk1N1lETy9MZklCdG5zZzdFeXRLYTNqS2tH?=
 =?utf-8?B?WU55eEx0WE5YRmQ3QWNhOW5IZUdxQTM4NHV3cjkwMStZZVA2czFBYi8vdDQ0?=
 =?utf-8?B?Y3Q3ajM4ZTdTclVLK3RIL0ROLzZPcDVLREZnbG1XRlIwa3FtUWcyZm9ucllL?=
 =?utf-8?B?ME9YTGtKZCtOdktYVllDcmFyUzQ3M2xWbHVidmxWcG01S0N0enU0a3MwUkI0?=
 =?utf-8?B?eE1Da1hsYncwQXhDakdBNnlZL29SZmIvYkVSNnJITVhGN1FwaHhQQUR5amw5?=
 =?utf-8?B?bEhGLzIwTkVrcTRCNEh5SEJ6NE9Zem9IcWtmWDZRR2VlU3ZBMjF6K09GaGs2?=
 =?utf-8?B?RTA3QXpoVzZOT2N6K2pFMTNDNHJwRDh6S3FxOGlyRVVEK0dkcU9LTVZidXEy?=
 =?utf-8?B?QmoxbXlKMTMyVkFzUzZiZmFwS3ZlcCtzbkJ1WGxJdHBKOW1jTWJFem5tTWFj?=
 =?utf-8?B?TUZtU1poOHQ1eW9OeUZDb1BkU0tNd1R3RGZhYjN1LzRYWHFRZ000b0ZKTlRS?=
 =?utf-8?B?MXIyc082NFo0YU14NWZMMnAvVjFPdmJPY05uRGdIVFNGVFVrdXFLTi9qamRO?=
 =?utf-8?B?Y2RTc2paSmdVdCtIU3VPSDNOMUIra1JRc20vMVVwMDA4K1IrTzVOSFR3Vng3?=
 =?utf-8?B?VDdISW92Qzk2d29nZVUxWEtWMHBQNUhSTjdPYzVnR2R3cmxqNWczTTM5eHNh?=
 =?utf-8?B?bGw0R3ZpeXpIQnpvN05VS3dldXB6NnZlZWJmMHFveFdoQUhMU095dmZQVTdF?=
 =?utf-8?B?TWhuOGYzQ2orSG1acTJwbG1LMHdCT0pGSlMrM0lFY051MFBnYTFzbXZyVWRR?=
 =?utf-8?B?UzhuN3F1Y24rWUc1aSt0T2xuMjk4UGFaR3NZNjlJdEdpSGtwaWJCVmU5NzNo?=
 =?utf-8?B?NmtnM2hFUE9KazNoL1RXU2pYUWVjcHJHaWpKMUFyVElOQWhpbnovMVJINE5B?=
 =?utf-8?B?NzNQekVwVkROVjIvUGJaTkV6N0g4UlVCTlZZTFNvVTFvV3hnbFhlQ1RyZFJC?=
 =?utf-8?B?NzV1V0lKZmdnZ0VEdEdLOEZxWkxVb1BXc21PR09EOXhqSm1ZRDdTWjIrWjJM?=
 =?utf-8?B?eUpoYmJHZGtUbXR2dWhYdTMzYkxGakVRZjJFeGNNeVR6VHhnNUY0enluVEJB?=
 =?utf-8?B?czdDTjhOS1JLRmEvMG45M3hOaEVhVGZGdjdTMUhLTEU3c2xMbmpqQmZBdWNo?=
 =?utf-8?B?UHVkejFLaGp0TTVPcVQxMW5oOTY3dURNUnU1YlhBWnJPR2lrQXhXS2NiY1pU?=
 =?utf-8?B?S0Fwc0JqWDh0aC9Vbm0vcmhIVXQ0YWJOVG5OSG5Dc3owVzU3QXg0YUhsT21K?=
 =?utf-8?B?M1c3cGhuVWhNa3l6MXpTNi9BbDlnSUh2TlAyZ1Z2NEpFSFFrSngvNUc5eXR2?=
 =?utf-8?B?ZTlQMEZ4dVZ4QVA0YWZ4NDFRNXROZEVDNFRiTldNZ0IveGFodUQ4bmo5QUVY?=
 =?utf-8?B?VGF0MTFBZTRBK1Bmc3RUc0xDbnNleUF3UHBLSU5JdVJSY09NMllpdlNMYkcx?=
 =?utf-8?B?dTlZMmJLOFh6eG93SzI5S1ZlUjY1QmNPQUt2YWNYNkwxUEhqTWFCRktBVk1h?=
 =?utf-8?B?YkhLUDJsQUlhTkNBdFBINDdCN0UzSmtvZGVNU3lpMGdJYVNSYm0zOFg3VUZs?=
 =?utf-8?B?MVZUSnFHUmhqazJpcjR0Tzk4SXVjRmswblZzZkZLMUV3NEFjMk90RU9USUhZ?=
 =?utf-8?B?bko2YVBVaC9RK3dOOWwzVU12dDdZNWR3RVZ0SjBTOFpzVWRkaXdwOERvQzlR?=
 =?utf-8?B?eHpMS0FlVTNmWmdLNndUa09aM3U5SmpxNlNYSjI4VFA2VjRSZElUU1JqdmxM?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB64A58F7EAC974992D20D80B6EA49CA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6389.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c3b383-372f-4b4a-b956-08db91982c26
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 07:31:36.4329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3oM/pSOQevLfunCGXyE29qLXV0LoHWDuQa67twJxRKJSej8/E69Unw0p47Cn0keN26awnKw0G1/PyI5GkIdBRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_003240_174349_FD7D4FCC 
X-CRM114-Status: GOOD (  21.92  )
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

T24gRnJpLCAyMDIzLTA3LTI4IGF0IDE0OjQ5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDI4LzA3LzIwMjMgMTE6MDgsIE1hc28gSHVhbmcgd3Jv
dGU6DQo+ID4gQWRkIGRvY3VtZW50IGZvciBtdDc5ODYgYm9hcmQgd2l0aCB3bTg5NjAuDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFzbyBIdWFuZyA8bWFzby5odWFuZ0BtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gIC4uLi9zb3VuZC9tZWRpYXRlayxtdDc5ODYtd204OTYwLnlhbWwgICAg
ICAgICB8IDUzDQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUz
IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tZWRpYXRlayxtdDc5ODYtd204OTYwLnlhbWwNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0DQo+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvdW5kL21lZGlhdGVrLG10Nzk4Ni13bTg5NjAueWFtbCANCj4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvbWVkaWF0ZWssbXQ3OTg2LXdtODk2MC55YW1sDQo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc2Mzk0ZjdlNTUw
Mg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc291bmQvbWVkaWF0ZWssbXQ3OTg2LQ0KPiB3bTg5NjAueWFtbA0KPiA+IEBAIC0w
LDAgKzEsNTMgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiAN
Cj4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvbWVkaWF0ZWssbXQ3OTg2LXdt
ODk2MC55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYVRlayBNVDc5ODYgc291bmQg
Y2FyZCB3aXRoIFdNODk2MCBjb2RlYw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAg
LSBNYXNvIEh1YW5nIDxtYXNvLmh1YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiArDQo+ID4gK3Byb3Bl
cnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiBtZWRpYXRlayxtdDc5
ODYtd204OTYwLW1hY2hpbmUNCj4gPiArDQo+ID4gKyAgbWVkaWF0ZWsscGxhdGZvcm06DQo+ID4g
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4g
KyAgICBkZXNjcmlwdGlvbjogVGhlIHBoYW5kbGUgb2YgTVQ3OTg2IHBsYXRmb3JtLg0KPiA+ICsN
Cj4gPiArICBhdWRpby1yb3V0aW5nOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvbm9uLXVuaXF1ZS1zdHJpbmctYXJyYXkNCj4gPiArICAgIGRlc2NyaXB0
aW9uOg0KPiA+ICsgICAgICBBIGxpc3Qgb2YgdGhlIGNvbm5lY3Rpb25zIGJldHdlZW4gYXVkaW8g
Y29tcG9uZW50cy4gRWFjaA0KPiBlbnRyeSBpcyBhDQo+ID4gKyAgICAgIHNpbmsvc291cmNlIHBh
aXIgb2Ygc3RyaW5ncy4gVmFsaWQgbmFtZXMgY291bGQgYmUgdGhlIGlucHV0DQo+IG9yIG91dHB1
dA0KPiA+ICsgICAgICB3aWRnZXRzIG9mIGF1ZGlvIGNvbXBvbmVudHMsIHBvd2VyIHN1cHBsaWVz
LCBNaWNCaWFzIG9mDQo+IGNvZGVjIGFuZCB0aGUNCj4gPiArICAgICAgc29mdHdhcmUgc3dpdGNo
Lg0KPiA+ICsNCj4gPiArICBtZWRpYXRlayxhdWRpby1jb2RlYzoNCj4gPiArICAgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUNCj4gPiArICAgIGRlc2NyaXB0
aW9uOiBUaGUgcGhhbmRsZSBvZiB3bTg5NjAgY29kZWMuDQo+ID4gKw0KPiANCj4gSG93IGRpZCB5
b3UgaW1wbGVtZW50IFJvYidzIGNvbW1lbnQ/IE9yIGRpZCB5b3UganVzdCBpZ25vcmUgaXQ/DQo+
IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0KSGkgS3J6eXN6dG9mLA0KDQpT
b3JyeSwgSSBkaWQgbm90IG1lYW4gdG8gaWdub3JlIFJvYidzIGNvbW1lbnQuDQpJIHdhaXRlZCBm
b3Igc29tZSBzdWdnZXN0aW9uIGluIG1haWwgYmVsb3csIGJ1dCBpdCBzZWVtcyBSb2Igd2FzIGEN
CmxpdHRsZSBidXN5Lg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzhjNjMxNmU3OWU0
MDQwNmU0ZDQ2NzA5ZjYwMmRjYjE0YTRjMDA1NjIuY2FtZWxAbWVkaWF0ZWsuY29tLw0KDQpBZnRl
ciBnZW50bGUgcGluZyBsYXN0IHdlZWsgYW5kIHJlY2VpdmluZyB5b3VyIGFkdmljZSwgSSB0aG91
Z2h0IHRoYXQNCm1lYW5zIHRvIHNlbmQgdGhlIHYzIHBhdGNoIGFuZCBtaWdodCBkaXNjdXNzIGR0
YmluZ2RpbmcgaW4gdjMgc2VyaWVzLg0KDQpTbyBzb3JyeSBmb3IgbWlzdW5kZXJzdGFuZGluZyBp
dCwgSSdsbCBjaGVjayB0aGUgZGV0YWlscyB3aXRoIFJvYiBpbiB2Mw0Kc2VyaWVzIHRoZW4gcmVm
aW5lIGl0IGluIHY0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpNYXNvDQoNCg0KDQo=

