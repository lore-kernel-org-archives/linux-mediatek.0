Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4A0CEBF8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 10:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/mOvvXYNOInFI7INpifNoyBucvbg7DEVtNMykE9zZY=; b=ztZaCf1A1atV6YyyH+5rcKu0it
	VZElNjQIhvs2akxrvUmqSdhXs0xh2K7f9Ju4QU2ZcbaJA/csCcuUCsOPPK9AdF0FcVZg0HKuFowiP
	WbJz6l89b/OmJKlZ1HsWVgARtwAjjOknWo5fANTuGQmep5eYVabQt7iogRBsWLYYAfvprqBl+2jSX
	BdDroFps+V12HM3PyPbpBZUqHLRWQS/h96rqqCg96+m30BzP1kG2FLfp1HkB7cRx3fvdSWfv7VlIj
	/HY811YWkvjwcjuDZRJDthM4GGw20Vb28iQOIprOoiU1hDgnOykrzD2hWjrMIjPGAMjTg14loCgAf
	FSH7EGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su7zi-0000000AmwT-1CJe;
	Fri, 27 Sep 2024 10:14:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su7ze-0000000AmvJ-0zq2;
	Fri, 27 Sep 2024 10:14:36 +0000
X-UUID: 4736c9287cb911efba0aef63c0775dbf-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=d/mOvvXYNOInFI7INpifNoyBucvbg7DEVtNMykE9zZY=;
	b=iDQpH9sA5ufVvkiDFtdObhZFXXF844NYK6AiTjMURPaT3Zjy38Z0E925RQf1ReY8+amvJxAVRfgjvUqIJzb282nx4MKyB7XwzrRrISqk28hxt7DE9DuMD3FpRJpeBZ8IK4/AnC4U4SisVSupdJ7A/RzB2jcyFFTyxkZRVWg6JNM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4f20f436-93f1-4107-b6f7-69b8898fefcd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:bb0aaa9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4736c9287cb911efba0aef63c0775dbf-20240927
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1016861241; Fri, 27 Sep 2024 03:14:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 18:14:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 18:14:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8KtDeuTbf9YYnS+tBqWUiXSNmZ2sp1yEfKMG6d3D8cohNpFAJ1B0XzMWrs+MiJbJq+DVx5sS5YUIMYg+XRLoLa3p3RgoA9D3e0r/TfHqD/vQIQsXGGONOlc3mk7IuGzNUQCiVs8YnRVv/25AEYn4xID9QqSVaNkyHE3ir+lkrbMehltd/b8yHUj3ezZz2wHVRLEXFeJIHl6WIBakJoJHAvQT2atco12c/Mgi+3+Am1dPL0zSYXdYV/fz8q51mATNCvRi4Pbh2U8BP67AX396mqLEW7FKuOrJYymMaGtEQ472FacsicnKK5s+qZ/DNwlpKXIehAy8gJDGCIAl5q99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/mOvvXYNOInFI7INpifNoyBucvbg7DEVtNMykE9zZY=;
 b=oSK93rzkwUAFFt8eph0tIg6uIrxW0c8a0/qWQhiPdbhW5r99iVxVJcZS+FGaphJyUIOioxq0g0chxg0vpn+NdPX5qZVw8EVRJYgSRuOsvAod6uiMXSgH42MOhjTereLhU+gjU0d7aGOx09iXDIfG0YyvRmvGFqPyGJ2yV8z1R2YArKCbGopcxwI/cVayr5/t+5AYrGbdylcABeqH2skCWGyfckDXK1W2szGucz/yG5SIzfxlBdrzKjWMMDGj42rulRkLs+JTgiGGo5cqx4A0wSS09wXzLtEtvAGspZDlDjJADiMzMb5ZGKJo8lhkQdKZO3mlzlouzs6Xwmwsj2GSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/mOvvXYNOInFI7INpifNoyBucvbg7DEVtNMykE9zZY=;
 b=egua+pwMWYqoGKyjbUvPGquNKpUQNcAB+WsiyvKTE6j2j0C6F18Px42Liu5uOom8iSSRYMWUPf912XaI1UaFdLtVtCQsmNSTcdxchFfteGBVLLgt7R8WcA7b9ENKQrij20bGxe6I80O+hMFTkCgeQ3vWNVHkfDEVRz2PBRTsET4=
Received: from PSAPR03MB5542.apcprd03.prod.outlook.com (2603:1096:301:4e::12)
 by SI2PR03MB6806.apcprd03.prod.outlook.com (2603:1096:4:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Fri, 27 Sep
 2024 10:14:20 +0000
Received: from PSAPR03MB5542.apcprd03.prod.outlook.com
 ([fe80::a323:3128:209c:f02]) by PSAPR03MB5542.apcprd03.prod.outlook.com
 ([fe80::a323:3128:209c:f02%4]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 10:14:19 +0000
From: =?utf-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>
To: "hch@infradead.org" <hch@infradead.org>, "chrisl@kernel.org"
	<chrisl@kernel.org>
CC: =?utf-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"baohua@kernel.org" <baohua@kernel.org>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "willy@infradead.org"
	<willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	wsd_upstream <wsd_upstream@mediatek.com>, "david@redhat.com"
	<david@redhat.com>, "schatzberg.dan@gmail.com" <schatzberg.dan@gmail.com>,
	=?utf-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?=
	<chinwen.chang@mediatek.com>, =?utf-8?B?Sm9obiBIc3UgKOioseawuOe/sCk=?=
	<John.Hsu@mediatek.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "kasong@tencent.com" <kasong@tencent.com>,
	=?utf-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "ying.huang@intel.com" <ying.huang@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>
Subject: Re: [PATCH 0/2] Add BLK_FEAT_READ_SYNCHRONOUS and
 SWP_READ_SYNCHRONOUS_IO
Thread-Topic: [PATCH 0/2] Add BLK_FEAT_READ_SYNCHRONOUS and
 SWP_READ_SYNCHRONOUS_IO
Thread-Index: AQHbCod08FuriN+lckm7AKNlb4+2T7Je+46AgAJjJYCAChhDgA==
Date: Fri, 27 Sep 2024 10:14:19 +0000
Message-ID: <120a91c2b71256d7723c6de7d98c611899b84bac.camel@mediatek.com>
References: <20240919112952.981-1-qun-wei.lin@mediatek.com>
	 <ZuwM-aEEo7DE-qXw@infradead.org>
	 <CACePvbUCNxy3sf6+7hk9HPGTNtTMbA2=Entu0xbV7TbwX4M2WQ@mail.gmail.com>
In-Reply-To: <CACePvbUCNxy3sf6+7hk9HPGTNtTMbA2=Entu0xbV7TbwX4M2WQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5542:EE_|SI2PR03MB6806:EE_
x-ms-office365-filtering-correlation-id: e6e36bd3-a807-43fa-1d9c-08dcdedd269b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N0hGYkNqMTYyWUIzU0krQW4vbU9RMy9tUFhYOTdRSkorcGFOWjFOREVSOWMz?=
 =?utf-8?B?MlU1ODEzOVJuM3lkS1VxTmtWVityNnRxSjduRnpKYnZEZDFPQmJsREtHQ3Fj?=
 =?utf-8?B?S0xCRWF5UDhVTG9mNThOZXJuSkYyZ3BYOFVjTGsvd1N1b0I0ZGhkUUJSWmhE?=
 =?utf-8?B?ZFRvTXAyYlIvNnMweWo5TUp0cVl4cnlmQUxEMVhIakloMVRTb0VxOENETXg3?=
 =?utf-8?B?emYrYWp2OHVSc0k3Vk5ycnBiN3N3dzllZURUYUVIZE5WTmtodERDMHRwNlZH?=
 =?utf-8?B?QmRzVGJHcEdFMXFIRVY3dW9tTVlRUktlNi9zWFF1cVY1WUxWd1ZIeFdQV1M5?=
 =?utf-8?B?SFpTckc1UEtzODZDNndVNkhudlY0YXdLMUIydWkyNTdTaEZ3NlFzak45WW1a?=
 =?utf-8?B?T1lqV0ZKN3F3VmJlc0NpaWYwdnpKd1FHUXN0VG8zZlc5elUzZzI1Yld6U2tP?=
 =?utf-8?B?TzZ0YXFDNG9NTk5mQlVmbFg3UkUxU0RvNnZOQi93WVlHaG82LytOc2ZiWEQ0?=
 =?utf-8?B?Vm1hMXJGSzZ4TzZ2V20xZ0FJeTVaMENwVmJmaHk3VVdJWjdoTm1pTGhuUkdk?=
 =?utf-8?B?ZlZTM0Z3SllPcitSUHhjSkoraHNHYmE2QWZPRTN1THFwdjZEeU80eWh4dU00?=
 =?utf-8?B?R1NNTGZNbXJXSUpHUzJtVHc4SjdnSW9vTVVBMlBlNEkxOHh0M3hGTzVMY0Ni?=
 =?utf-8?B?WUFhY1d2M3VVYUd6RTJpb1RkdXpYTFh0VlZTa2o4UmhZc2I5dWYyUzhvZXEx?=
 =?utf-8?B?RWNyUDQ2KzNCQ1pCMjBVSTM1aFJrUVRnblZybk9OZUY3NWI2eG1zVnRJdXdR?=
 =?utf-8?B?bGp5TVVOdlJ0bytQWHFEcnk1TlBqRmVvOGJYKzRaWTNRQ0grVHJsQW1iekNj?=
 =?utf-8?B?YjlFa1k0S2pmVCt5WFVudFhaMnMxZWs0QTRsUkhBZmpON0Y1aklrRG9TdDdI?=
 =?utf-8?B?NGhjNTRXajdteUpmU2Via28xMnc3cG5KSjRIOWdVMUFaZmpPTUxkMGZvNHFW?=
 =?utf-8?B?QjZ1WURuWWJpZm5vV0xLUVE4NnR1RUZSS2JKNnMzdHZpZWZDTkdTK0o0OWk5?=
 =?utf-8?B?SjdzbjdITG44TENteHN1VWw2LzNiWlRhTGJndWI3Ym1yMkJwY2JiNE1ySW5i?=
 =?utf-8?B?TG5jSzB3QlRtWmI4SlpMMWxIUWI0ZFJkZlRnVmxzeUJHbm5sb1ZyY3dzdFBI?=
 =?utf-8?B?dVY2cDJDTHlVbXFPVDlRSU1kSjBIZy92NnlaVTdPVXZEaGh6T3ZZdkZGK2Qx?=
 =?utf-8?B?ejcxMW5kNVpmc1V6czFHTGJNU0NDaVBZcnVnZ0ZLOVRwc2J5bkdpZ1YydHFu?=
 =?utf-8?B?ZGVkaG1UV2JCSGVSOEE0UlhvVlJ0WnJzNFgzcXRnQUJwYU5vYzJPZERvN3FF?=
 =?utf-8?B?NE5TVEJKWVphV09LZmtMNXlzVWgvN1RUblk0S2d0dzRTVllLV3dGQ3BVdGpp?=
 =?utf-8?B?Ymp2RHl6NmVXeGZXUWc5MEV3c2tCTDZUcGJwcjc3QW1PNnVEYjhTSDV0bU5P?=
 =?utf-8?B?aWpzWnNTaTc2a0RyN2laMjdZRW5qR3E5Uk9uekhmSkNNQy9aRmkzR201VGtO?=
 =?utf-8?B?OUNWR0hHM2VlNmZPSWhNdHFsS0lVOWdxbHRUdks5T2dzS01kckJYbDljNnU1?=
 =?utf-8?B?R2VxNGdqdHBaWFVVN21Ma2NBVVE0c3pvd2VjQ00zYmtmaTlCeDVERU5NSUEr?=
 =?utf-8?B?WmdEYjVwWmhHWEdRMUNPL0QvckpVTDJLZWtiK28rNlQraGJUZ2kvQ0hMcWN5?=
 =?utf-8?B?bDdqVkUwYmh4SHFHTHZ1U0FJeCs5TFVsNkoxczZPQWc1Y1dFQ0drbkhud3VX?=
 =?utf-8?B?Nm0weHhqYjVDTWdTNDZnZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5542.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmpGcCtQSW5GMi9TaG85UG53TnVFdHlnRCtnanMzdVBTM3hOeGVUZk9lMHNX?=
 =?utf-8?B?WGFGUTlPTUFMWTdIS3B6MUJiNCtMbkFNTHBXTWw0cGwwb0hzc01NeUlwQ1hE?=
 =?utf-8?B?THpZRituZHgwTTBub0NtZ2xVYm5xZjdndks0K2tkbVg0bjA3MjdNeG9aNnha?=
 =?utf-8?B?YWtUcU9kOGxsR0FDMkF5cndueUxIQ0NwNnBiWS9yMWdra3pLWjhUVnN1aWtl?=
 =?utf-8?B?OXdtTHhFZVdpOXZMalZrd1E5a0VRRGMvNzdibFdrdVlQNGFRQ3BnRmJWdUgr?=
 =?utf-8?B?TVNFZy9KTlRSOWZJUEdTSnJ6aXl3VWVlT21ndHFUcmRQVVBuQldlQ1ljeXlo?=
 =?utf-8?B?VGs2aE16QVpzbkk5NHc3MmtYMzFKQVpOSkp1RU1UcCt2QU96ZThxeHpOVUpI?=
 =?utf-8?B?R1U4dUx1djN0WmtmcC8xM0s5bzZLVzNQZXhQenBJbFpYMUhiYjdmWW12TUJs?=
 =?utf-8?B?cm5BWThvbVVjVHF5Qjk1RFVYbjNIRGF0d0VrOWdsZUFEd1hpWEF3OCtFcStw?=
 =?utf-8?B?V2tNbVI4WnJwU3RJT0F4a2c3NU41aEdjR2pmTk4rYzhlMUxqK3dBckR2YnlT?=
 =?utf-8?B?QTlJcWN1MVF1YXNhV3k1cG5EakxPYWpQMHVCSmpySGxnRVMrVmE1MXdxU3RB?=
 =?utf-8?B?eCtZM2FqdXpxOEtPZmtmQkRhNDBnRitwclFsK0JyMW11M1U4MFVwN0M0djhk?=
 =?utf-8?B?RGlwRCsxU3JONVM2RFJmck5rQm1adGRMd0QyWi9yTDVYMVo1aGhYK3l6cXpG?=
 =?utf-8?B?dHovSG0xSWxvdE5IWEN3ZnZsMkRnNDhiMlZ2WTNadGxVWklnWmNmYzdIRHpz?=
 =?utf-8?B?MmJzOWRlZlBsd1l5cGNiWENDSnNFTnQzVjNXNmlrWENYcno4dDIvcnNwdEdv?=
 =?utf-8?B?TEd0U2lyd2hMZkdNckRCbEdraE5TT1o3WU9rM2FnQXZFVGxNUTI4VDQ3bG1a?=
 =?utf-8?B?NE1OME9MT2J3YlFZSEpmNStLd012RENSOGJHUm9EZkg4cEZha0gxTlVyc0Mx?=
 =?utf-8?B?a2V0bTQ2M3gwZXRHK3ptMnpJR05taFJKRVZ6ZERxL0t3Zk54K2V4SFltZkRI?=
 =?utf-8?B?KzhCWmdFS2JqeHd4d2NIbnJYN1dFNzhZU1pQM2x4V3VSU2hVQ3RVdDlIczUr?=
 =?utf-8?B?eTVFOUtPSjlLeTRtWVNpTHplTFlnOWxqMVdLdGFvRFRacGk5ak5ONGJRcGJ0?=
 =?utf-8?B?QUNPYXBRVllRVWZHK3NxL3hKMHp6MU9qUFAyQThMYU9GYS9mT1UrV2xBSS85?=
 =?utf-8?B?ZXh5QTNLWC8wU1QwN3pybTV0ZmZueTE4NU43MmJHeDQ3MmIxNC83SWtOK3V1?=
 =?utf-8?B?ZHFGYU9IZU0raTVHcVdFU29yTDA1dUtpbDdNbk1xSUNGYXoyYXB2dFFWQVpL?=
 =?utf-8?B?MmtraGFydlV3QWFRRkkzTldKR2QxYUx2d3c0VW9FLzEwWUNnRHNERjcyWkFx?=
 =?utf-8?B?VEN5Mzh1Z3B0WGNLU2hSdDFFSHdsdUgycXFvSnBBekJDRXduQTR4ajR0NVlY?=
 =?utf-8?B?VURUdlkwL3lTd3h4V2RpQndXUDM4UmlZNjFpeUpFaFpyeHQvREdKQUp4NHI1?=
 =?utf-8?B?ZXJVdkhNMEJEMjVJUDRKajBIZ1NmNWdmK2duYXNaTkp0MS9Nd3lBckdzSERB?=
 =?utf-8?B?NDh3bHFpclB0WXMzazJzQVk0anZJT0gzSWQwUlgwSSswMzM5d1ozZ043YmZI?=
 =?utf-8?B?clZTc1ZORkVFWHhKUmlNQ3NxbXhaTjdNb1FFdEpBWmRIWE1QMzBrMDhkdGpH?=
 =?utf-8?B?VEtsVE9LSlhrdUlrNWZaWmdWUFZRSFMxb015ZHJxNHFJS2FPbTNMNTRHWUo4?=
 =?utf-8?B?Ui9QdWpxcG9zUXphZCtraTVrd0FMYjh5WkZLM2lrM3hOZUFaSDIzTjVpRHQr?=
 =?utf-8?B?cHJYZE9GdTNRdnVWSmIzWmNkODhqTkU4WkNHZ0tpS3ZLVG5hdEtUYWFUNFFZ?=
 =?utf-8?B?TTVWcmpHQ3hWd3FhZHlxYmhYQWZINHp0QlJqSVJYWFJqTmpDbjdHVjI4L1Zp?=
 =?utf-8?B?Qkx5MVExOUU3RVpqT1RRQ1M3Mi82ajNoaXQzaytyZzlxMVRmYmxGWHBwY3FJ?=
 =?utf-8?B?QjM5TytXZ2EyNUxocTg1K2xBS1JQZFlYbGgwV1V4TUtoaVZNaWE1NlRqZ0kr?=
 =?utf-8?B?QUViTUtwYm1MYUEvQTN2dVVTN0tUbXBjSkwvaDRncWRVSTZIOTZ6RnBnVTdG?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <425AEE2225235E48AC951D69026C2689@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5542.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e36bd3-a807-43fa-1d9c-08dcdedd269b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 10:14:19.6512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhhjNkxH13Jov4xzkXs9tXtJh5OLZZOhvi0pr6Xd4TyUQKNezmmhgmN9P4DHh2pmxEedO38kuWiPh6CVXNVz4kLYwn36Jwk7Ni8rtA7LjUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_031434_835766_BFE44749 
X-CRM114-Status: GOOD (  29.63  )
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

SGkgQ2hyaXMgJiBDaHJpc3RvcGgsDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgYW5kIHZh
bHVhYmxlIGZlZWRiYWNrLg0KIA0KSSB3aWxsIHN1Ym1pdCBhIHYyIHZlcnNpb24gb2YgdGhlIHBh
dGNoLg0KSW4gdGhpcyB2ZXJzaW9uLCBJIHdpbGwgZW5zdXJlIHRoYXQgJ2JkZXZfc3luY3Jvbm91
cygpJyBzZXRzIGJvdGgNCidTV1BfUkVBRF9TWU5DSFJPTk9VU19JTycgYW5kICdTV1BfV1JJVEVf
U1lOQ0hST05PVVNfSU8nIGZsYWdzLg0KDQpCZXN0IHJlZ2FyZHMsDQoNClF1bi1XZWkNCg0KDQpP
biBGcmksIDIwMjQtMDktMjAgYXQgMTc6MDQgLTA3MDAsIENocmlzIExpIHdyb3RlOg0KPiAgCSAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gIEhpIFF1bi1XZWksDQo+IA0KPiBBZ3JlZSB3aXRoIENocmlzdG9waCB0aGF0IEJM
S19GRUFUX1JFQURfU1lOQ0hST05PVVMgaXMgbm90IHNldA0KPiBhbnl3aGVyZS4gVGhhdCBuZWVk
cyB0byBiZSBmaXhlZC4NCj4gDQo+IEhhdmluZyBhIGZsYWcgZm9yIEJMS19GRUFUX1JFQURfU1lO
Q0hST05PVVMgYW5kIGFub3RoZXIgZmxhZyBmb3INCj4gQkxLX0ZFQVRfU1lOQ0hST05PVVMgaXMg
anVzdCBjb25mdXNpbmcuDQo+IGZvciBleGFtcGxlLCByZWFkIHBhdGggbmVlZCB0byB0ZXN0IHR3
byBiaXRzOiAic2lzLT5mbGFncyAmDQo+IChTV1BfU1lOQ0hST05PVVNfSU8gfCBTV1BfUkVBRF9T
WU5DSFJPTk9VU19JTykiDQo+IA0KPiBUaGVyZSBpcyBvbmx5IG9uZSBjYWxsZXIgb2YgdGhlIGJk
ZXZfc3luY2hyb25vdXMoKSwgd2hpY2ggaXMgaW4NCj4gc3dhcGZpbGUuYy4NCj4gDQo+IEkgc3Vn
Z2VzdCBpZiB5b3UgaGF2ZSAgQkxLX0ZFQVRfUkVBRF9TWU5DSFJPTk9VUywgeW91IHNob3VsZCBo
YXZlIGENCj4gQkxLX0ZFQVRfV1JJVEVfU1lOQ0hST05PVVMgZm9yIHdyaXRpbmcuDQo+IFRoZSBw
cmV2aW91cyBwYXRoIHRoYXQgdGVzdCB0aGUgU1dQX1NZTkNIUk9OT1VTX0lPIHNob3VsZCBjb252
ZXJ0DQo+IGludG8NCj4gb25lIG9mIHRlc3RzIG9mIFNXUF9SRUFEX1NZTkNIUk9OT1VTX0lPIG9y
ICBTV1BfV1JJVEVfU1lOQ0hST05PVVNfSU8NCj4gZGVwZW5kIG9uIHRoZSByZWFkIG9yIHdyaXRl
IHBhdGggKG5ldmVyIGJvdGgpLg0KPiANCj4gInNpcy0+ZmxhZ3MgJiAoU1dQX1NZTkNIUk9OT1VT
X0lPIHwgU1dQX1JFQURfU1lOQ0hST05PVVNfSU8pIiB3aWxsDQo+IGNoYW5nZSBpbnRvICJzaXMt
PmZsYWdzICYgU1dQX1JFQURfU1lOQ0hST05PVVNfSU8iDQo+IA0KPiBUaGVuIHlvdSBjYW4gaGF2
ZSAgYmRldl9zeW5jaHJvbm91cygpIGp1c3QgcmV0dXJuIHRoZQ0KPiBTV1BfUkVBRF9TWU5DSFJP
Tk9VU19JTyB8IFNXUF9XUklURV9TWU5DSFJPTk9VU19JTyBpZiBib3RoIGFyZSBzZXQuDQo+IFlv
dSBkb24ndCBuZWVkIHRvIGhhdmUganVzdCBiZGV2X3N5bmNocm9ub3VzKCkgYW5kDQo+IGJkZXZf
cmVhZF9zeW5jaHJvbm91cygpLiBUaGF0IGlzIG1vcmUgYm9pbGVycGxhdGUgY29kZSB3aGljaCBp
cw0KPiB1bm5lY2Vzc2FyeS4NCj4gDQo+IEkgYWxzbyBzdWdnZXN0IHlvdSBzcXVpc2ggeW91ciB0
d28gcGF0Y2hlcyBpbnRvIG9uZSBiZWNhdXNlIHRoZXJlIGlzDQo+IG5vIHVzZXIgb2YgYmRldl9y
ZWFkX3N5bmNocm9ub3VzKCkgaW4gdGhlIGZpcnN0IHBhdGNoLg0KPiBZb3Ugc2hvdWxkIGludHJv
ZHVjZSB0aGUgZnVuY3Rpb24gd2l0aCB0aGUgY29kZSB0aGF0IHVzZXMgaXQuIFllcywNCj4geWVz
LCBJIGtub3cgeW91IHdhbnQgdG8gaGF2ZSBhIHNlcGVyYXRlIHBhdGNoIGZvciBkZWZpbmUgdnMg
YW5vdGhlcg0KPiBwYXRjaCBmb3IgdXNpbmcgaXQuIEluIHRoaXMgY2FzZSB0aGVyZSBpcyBubyBn
b29kIHJlYXNvbiBmb3IgdGhhdC4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+IENocmlzDQo+
IA0KPiANCj4gT24gVGh1LCBTZXAgMTksIDIwMjQgYXQgNDozN+KAr0FNIENocmlzdG9waCBIZWxs
d2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4NCj4gd3JvdGU6DQo+ID4NCj4gPiBXZWxsLCB5b3UncmUg
bm90IGFjdHVhbGx5IHNldHRpbmcgeW91ciBuZXcgZmxhZ3MgYW55d2hlcmUsIHdoaWNoIC0NCj4g
PiBhcyB5b3UgbWlnaHQga25vdyAtIGlzIGFuIHJlc29uIGZvciBhbiBpbnN0YS1OQUsuDQo+ID4N
Cg==

