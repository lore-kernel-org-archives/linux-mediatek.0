Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F59C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 04:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iovEhDWu9uyZ+24sHqRQVXF1HzxpxSUWgxxKXAgRbIA=; b=3cOykyF1l/ahaC
	d10ElQANGhWzlcp7be/QtXtENjIzB81KGg/moO6T72+j2vNrBkl4eHBch7wyAn65d/ayvbMXaqOpv
	zTgQdYJT/q3eQ90+GA2CTrqRAg7FdhIQjgZ+3r3tlB4QQ1R60wMw8GAvZNkHk/UFZpid1Yym6DOGH
	5l0F1WfKxezNOAA//UOZV90oQsW1edjVAhbWheJf/P88T18Dq/GWQayNUEAVJ98TPoYh+NuXKy7ss
	ufgdr3v0glw+a6e+pVnOaLzc4YlZQGpR4zDJZRtwOuDtqYRMxawENinYWazOspy2o6W65br6GQ8bg
	MSaSfL2IHZXOyWh0C0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFTf8-00HYRc-Li; Thu, 03 Feb 2022 04:24:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFTev-00HYPY-GE; Thu, 03 Feb 2022 04:23:51 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D4ADFC011E;
 Thu,  3 Feb 2022 04:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643862228; bh=3KJkz5QUTL2c8+cm0FDMW6UxlfuqxCOg0bjiXfPYXHo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eAZvZ/G4+YSIef0VuyKtsdUJpwBGoIAeHcxkzMaZMzNSxTYdW0r2BWT42ijMDbUeX
 PBBQqcHorfYz/ACGBIovmg7pfWb1IDqA1UgSk2Cb5XpDHxE37N+R9YW0D1E4CLpJAp
 tvEb6HJOXTEfDPbq+lw5mjDN2+0IySReCKRR6433jzun8/QjgHFFZvbtaW2q0nBcD2
 MVv1xa9irEacChp8Nr6IN3tdPb0uAzyJbU6++Abna55+XJAJtt9ylYIu4exTrQkqxk
 wuOC2svQsrdFdkmtYdtjnEcFQJNASyrkLxSCK+9mg+3cp2S0F5gZRnD5kgIB/jiqcY
 7XtFFSgSEf4JA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6F00FA0071;
 Thu,  3 Feb 2022 04:23:42 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9E60A40015;
 Thu,  3 Feb 2022 04:23:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RG0I7zbt";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0j4c4bvwWopKNXpKw0eDF8RmtJvvloUIRFkNXgNjDSDciq5PnEV0I4vs+4w+cIVhAj1gZHQ4Y5tvNk9Q+CZqPeM6f7HH2ZMjiStS+Tpu7/1eRqMSnUnxal6deVkjGE4CpSRhtRr2538rLgxBLpLwmhzQu6y+oiTy14TIP4+1wACYDveEzW5rpH90cRdxS7N15HX9r5RBOx0TNXjcZzx7zGJS7fUxqapQSWe5CZrqQuhAYQy9x5M/yJnxAKpVa9z6hde6jvFjhzbMR9kWiTXNORpTxXqdau/5voeweB+EYOQ1CQawn4d/qsgepiDxLc39xrzSLynUbkmtblKQixnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KJkz5QUTL2c8+cm0FDMW6UxlfuqxCOg0bjiXfPYXHo=;
 b=mu6m8QfRG5dQNrgDOSKohGdzn9D9vIIjYojysAawR+mr1yGqIAdj+lrpTPmjQCmwxLyoGocEfhoVW3BN+S5bAwIEVf31Wr3UnQgXWKw0NIHn95nZSzDnR65yJNMlUm82HXjlPpOvGM31ildxskKZZUWH3Q5MdL9avfelatPg9jIfNNxM4otqFTO7irvZplWwdabb8eLKAqc73fGsaWu+RVz+uFKLSUVHiRGFTlBRXzzrhFCF3BsvBccDn1W55hgJgEQCXUdG82sQV1twXJpf+rAxiNUpppuFiE87C0AjeVhY7Xw/ck4XsKLXqCJRun2/247AZpUhpfaVUgFDb0t1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KJkz5QUTL2c8+cm0FDMW6UxlfuqxCOg0bjiXfPYXHo=;
 b=RG0I7zbt7WynGi8pvBauaEmJ5BB8/1EEV5un22gdQ0C5qTw6xwwtdV/bVmjXRMsahjEfte42sZjLwDh3SSfqFjEvIlY3qLAq0+X87yw1FrVBL06DuI8IghIao/KNKqNnMViNcVh63zV7puTkIX/AFW/GGzMEIOxfMfdV1s8rNhY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB3052.namprd12.prod.outlook.com (2603:10b6:5:11e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 3 Feb
 2022 04:23:29 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c5f4:5df4:b5bf:b13e%3]) with mapi id 15.20.4930.022; Thu, 3 Feb 2022
 04:23:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Arnd Bergmann <arnd@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Kconfig CONFIG_FB dependency regression
Thread-Topic: Kconfig CONFIG_FB dependency regression
Thread-Index: AQHYF7+jJ2OaNYIQN0qLBwE4mmvJGKx/URMAgAAPEICAAAQRAIAAfiQAgAEPAICAADfIAIAAEvYA
Date: Thu, 3 Feb 2022 04:23:28 +0000
Message-ID: <895101b3-ef7f-5e9d-72b3-2b1a1309e033@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <582f032f-e04c-aade-4d18-514fb7e2d848@infradead.org>
In-Reply-To: <582f032f-e04c-aade-4d18-514fb7e2d848@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3e6fc05-c869-495a-d7f3-08d9e6ccee3c
x-ms-traffictypediagnostic: DM6PR12MB3052:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3052C65AD63EB30127A08799AA289@DM6PR12MB3052.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQnpUDf28iYHWmoV+HVRRXcM6Fdy/5k8L7THSL3TqkozahhLmTsBGGPO4hIosGiGEdTSuMPfX22S1pWoMYtusJffaEF1+Q6al8MNshzy1qPf0b9+p3agGGIxTzh9d34MMFN59gXyH5cN4iQ2rnhvMmPtFXC6wJ5mBYANi3En0J+ycqBoiAYRC4w0dm/015QQFWjm6AgMiuZUzH7/33Xcz5tnNHHMiG912Gctit//4k7Z8vzFxUVHO3cI2oQ6UwjMOFCIYh2o1lbBPRFqvgy8V0TxowSjTkFylquIB9p8SDGaEyVWQgdxKZZuNqkQftWXhYL1CYxnyw5MdKEW1/QCz/ATLXE634U0Ql7/sWkqyZhtXTxKVnwUg6auQHfqDlaxnzCbFjjysBBgvePCBli0609OJKFFDl4mzMJyvTkEtj0sIyQq717y1AOYvVVjE+8AVPAXG/jY+J3xOb9PnyLkpnSCUOpnaZOr1+xAJK/5rMrtzEX+FSZSgzft2Hs+n2h+QTF4KT6xX26SD23qDNV1iA+8seUvw2tvcj2OdkY1t+Z1J73KDkFlGvKxFmt8EqhUkBiBXUKlTv79OnyCtSBh3KHiukhXvd3CX0GyrD5O5sNxPrMVwbaqZ67s7rYVfsD4AeHSBfpOz/qU4f1Df/Th2dg920NBAkuOknz3mIOZJsXPLq9r8qSlRBB667Z4Tm8KSAZyl/NDMnYeaxJhoR1Tz3B3Spp4x5mtjCXbdd+drZqzTqy0jJ/A7FtU1Ye1Wi8D46AUm0dEdUPFwoPg1gaK+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4791.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(36756003)(2616005)(122000001)(110136005)(2906002)(38100700002)(54906003)(31686004)(6486002)(86362001)(38070700005)(83380400001)(66946007)(8936002)(66446008)(186003)(5660300002)(66556008)(53546011)(8676002)(64756008)(4326008)(6512007)(6506007)(66476007)(316002)(31696002)(508600001)(76116006)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0E0U0w0dlNLdUxlRCtWZTdCT1BiVmJUciswSE5hQnRlUWRHWjhHZVdrNFJs?=
 =?utf-8?B?cURESzhwUjJDZUVMQTVIWS9iVU51QUVnUEJxam85MnZRNkdoOXFBMk1XN2Q3?=
 =?utf-8?B?L3ByODZBalk3dm5PcS9yZzZHbkx4Qk95WlZiZFEyVmdsOFVhQkg1cllSNkV3?=
 =?utf-8?B?VTFVLzRlRWJjUzRBRFhsNzdaeHBQQUc0djNIVE1aY214R2tpaE4wT0g4cGdJ?=
 =?utf-8?B?Zzg2em5BR1U1SnJaU1hDWUNKWCttOEd1bVVLMkwxcjdHMTI2Z2FwN1lYNDZZ?=
 =?utf-8?B?Tm90NllORU9JcVpIN2REWHpSRlNJOGtBSmpVcStHZk9OTGpOTHYvbzVMbmRO?=
 =?utf-8?B?eVZDbzZwM3NSWWpIV2pXVVpta1p6dEdFdkR5WnZQTjJEZkNwekpNWkNiTFow?=
 =?utf-8?B?T3o2SWViWW5qMDZMQlJaRFhGQ3Y0NTlTOVdGL29IMFpTZjBUMUhzYThNVE9j?=
 =?utf-8?B?TExRRzdRU1J6RTlvNURzOUpVM0hya09YSGc4WVZWbklvL2ZPQzdjNXdidEwv?=
 =?utf-8?B?QzRNWUFKSWVqTHUxRHZtQ3FYNks3VVlwVktwZElJaDVqTnNTVE5qKzFuVGxh?=
 =?utf-8?B?b3c3UWI2RU1remxoMjBzL3FLcE94OHFwcEZsQjVFcG5aY1c0dEZNZ3MxTVZX?=
 =?utf-8?B?VGlOdm1NMkNuS2pCR29yTEFsQk5SQTVrYzE2WUoydDhJaTR3ZGd1YlJyQXkx?=
 =?utf-8?B?dURWdGJXZk5vbWZucXpKVXNCQXd6L2pWNFUzMEFONVViWnVuZVpwb3JrUXMz?=
 =?utf-8?B?SGpwVGtvR3FZTEEvandRYU53NlJnUEEzL01yZlRCWnh0VzBBWDBPQk5wa2V4?=
 =?utf-8?B?TGErZlN3Q1FRenFaSzZ3NGovd25VRG12R0FBMU9OZkJ6cEFzbGFzNjlwYWJL?=
 =?utf-8?B?c1pxSTdXUW1zMmV6Y0JuMnl3UEVHMHQ5RzBoN3pPc1h1dng2K0VQaDBGaVM5?=
 =?utf-8?B?SE5EdnpYTlJGK0hCUjZ6am9BZ2xVdExBZXUxTEY5aStDNU5PTXFsb2hOWTYy?=
 =?utf-8?B?TDhtOTNQWjN6QUhBTXBPalhacjlhTGtqUDNRQzFjaTdPY1hENy8rMlgydlNT?=
 =?utf-8?B?MDl6ZmFiZU1ya25ua3Z2Y0NoQWd3SWtlVFpQSDU5eHZpQXhXcmVxM2Y1cTFK?=
 =?utf-8?B?a3lNMXA4TTQ4eEpBUGx4VDloL25CQWx4L0N5THMrSmdGSTNGZERHQVFxSWxu?=
 =?utf-8?B?SUt5S3VrSVdRRUtnVk1yUGZYTis2Y21sQWxEUGJsZE01cjNZejhEQ0xTcVdj?=
 =?utf-8?B?UXptK0dWK0tlZUU2YnpGRFBEQ0Y1WENEeTRsMmprR1lvdk9SM2JsSTArcXJy?=
 =?utf-8?B?SFlnbW1OVmdGTitPTVRhTTdpZFJmcWZ1OCttcEpTV0U4d3luS0NjcGU1WVIr?=
 =?utf-8?B?OUh5dkU3UDZxR21odCt3aFllNzhPZVJVWHZrZzRmUEJZbGVzdHRNbEYzRTZN?=
 =?utf-8?B?b0t6dXJhNVprS3EwSnVJRy80OE9zeVB0MTBZNGhWVXcwK3IwS3Q2ZFIzaUUv?=
 =?utf-8?B?bFRIcW5xSUpjb2hIQXJMOVVOeHFYaGFXSTN6VDhmeTIwTlFJUGgvVDFVVHdS?=
 =?utf-8?B?cUFsOW11bFpENWhRVDY2T25QdlBFbEVPL2UxTlJuQjY2SlVxdjdDa3dWUkJT?=
 =?utf-8?B?TUF4c2NXUXFqcFNwTk1kZDZwOEJLLzMwMUxrMXl5TWVMdGFma3N5Sk5acE9h?=
 =?utf-8?B?Znh1elFoV0VPNVJ5RmVnVVhUVG5mUHY0bHFZdHlCY3NKNCtFN1VNYjNCR2to?=
 =?utf-8?B?b2FabWlTbmVEZGs4a1VIaTdaWVp0RWN5aHF1QWdheEV5ZEdLQXdNaTRpMVNX?=
 =?utf-8?B?cjhZbk84MXplRGM4eHF0T3RTMEVNcFJWcnRLQUVaNUp0NklaOTFHanFscWJU?=
 =?utf-8?B?ejBBVnUweHpNakhMY0tqOHBDT1d1VU80UnFsbkc3MEx1SitiR2QyblBPQUtl?=
 =?utf-8?B?bGxCNkxSM2IrYksvQ2NuUy90SzIwSWVyOW5BMEFXL3kvVEtiR1hJOStVQ1Rn?=
 =?utf-8?B?WWV0dzF5aEY0V0NiUVhhUUpCbG94VGdiRGx3Y0M0RVlTcjNmb2VVY2N6TEFE?=
 =?utf-8?B?Vmt6NzJ6YStXRkNwUTg1amdOTHk1aHR1Yit1Sk5URnAwRVZzRVlvRFNScTh3?=
 =?utf-8?B?c3d3eHZ6NHV6b1ZHYVlaQU1DVXdTOUx3Z0c3S29WdktHRTZ0M3MwcnZ4ei9K?=
 =?utf-8?Q?7x4Mz2LsD4K7htUoX78X5Gw=3D?=
Content-ID: <7661C297FDD9E64791ADC9FDF18F8202@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e6fc05-c869-495a-d7f3-08d9e6ccee3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 04:23:29.0099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbNH5lRMFMdI6xn4I6Mv/XUabavnClNqvIVeNZK8rD3TR5uQCM6hvRi/nrhprAv5QqE1Cw3xbA+xF3y38HmbeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_202349_650747_8AA2EBBC 
X-CRM114-Status: GOOD (  26.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Randy Dunlap wrote:
> Hi--
> 
> On 2/2/22 15:55, Thinh Nguyen wrote:
>> Arnd Bergmann wrote:
>>> On Wed, Feb 2, 2022 at 1:14 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>>> Fabio Estevam wrote:
>>>>> On Tue, Feb 1, 2022 at 8:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>>>
>>>>>> On 2/1/22 15:01, Thinh Nguyen wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> One of our test setups is unable to boot (stuck at initramfs). Git
>>>>>>> bisection points to the commit below:
>>>>>>>
>>>>>>> f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
>>>>>>>
>>>>>>> Reverting this patch resolves the issue. This issue persists in mainline
>>>>>>> also. Unfortunately there isn't any meaningful log. Hopefully someone
>>>>>>> can give some insight as to what could be the issue and revert/fix this
>>>>>>> issue.
>>>>>>
>>>>>> Hi,
>>>>>> Did you enable DRM_FBDEV_EMULATION?
>>>>
>>>> I did not enable it.
>>>>
>>>>>> Please provide the failing .config file.
>>>>>
>>>>> Does selecting CONFIG_FB=y help?
>>>>>
>>>>
>>>> On the config that has the issue, this isn't set. After reverting the
>>>> commit above, this was set. Maybe this is what's needed? I need to test it.
>>>
>>> CONFIG_FB should not normally be needed for booting, so unless
>>> you have a graphical application in your initramfs that requires the /dev/fb0
>>> device to work, it is not supposed to make a difference.
>>>
>>
>> I'm not sure, but it seems like the setup we have isn't the only one
>> that needed it. Fabio also noted that the imx_v6_v7_defconfig also needs
>> to have CONFIG_FB set.
>>
>>> Are there any other differences in your .config before and after the patch?
>>> It's possible that you use some other driver that in turn depends on
>>> CONFIG_FB. Does your machine have any graphical output device?
>>> If yes, which driver do you use?
>>
>> I don't have the answer to those questions yet. Need more investigation.
>> I'm new to this particular test setup.
>>
>>>
>>> You may also want to make sure that you have 9d6366e743f3 ("drm:
>>> fb_helper: improve CONFIG_FB dependency") in your kernel, which
>>> fixes a minor problem with my original patch.
>>>
>>>          Arnd
>>
>> The issue also occurs in mainline, which has your minor fix commit
>> above. The revert isn't clean for the latest kernel version. I also have
>> to revert some of the changes along with CONFIG_FB. The revert looks
>> more like this for the latest kernel:
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index b1f22e457fd0..7cbc733a8569 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -118,8 +118,9 @@ config DRM_DEBUG_MODESET_LOCK
>>
>>  config DRM_FBDEV_EMULATION
>>         bool "Enable legacy fbdev support for your modesetting driver"
>> -       depends on DRM_KMS_HELPER
>> -       depends on FB=y || FB=DRM_KMS_HELPER
>> +       depends on DRM
>> +       select DRM_KMS_HELPER
>> +       select FB
>>         select FB_CFB_FILLRECT
>>         select FB_CFB_COPYAREA
>>         select FB_CFB_IMAGEBLIT
>>
>>
>>
>> I attached the configs for kernel v5.17-rc1. The "bad" config is without
>> any revert, the "good" config is with the change above.
> 
> I took bad.config with kernel 5.17-rc1 and then manually set/enabled:
> 
> CONFIG_FB
> CONFIG_FB_EFI
> CONFIG_FB_MODE_HELPERS
> CONFIG_FB_TILEBLITTING
> CONFIG_LOGO
> 
> and I got very close to your good.config file.
> Can you do the same and see if it works for you?
> If so, then we can decide what to do about it.
> 
> 
> thanks.

Yes. It works as expected.

Thanks,
Thinh
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
