Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B01C8303F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 03:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGGUMpU1zL5Nu8RykowzhMgLHdG7EOhNaUz4G8avcnY=; b=IiNp4mVHiSCv8KuXMKYfCE6iRw
	J06FzFjoGYk24ZCtoZOCWcBcj6jIsZgKPYLsxRqyyaBmdsNeRENVo7FNRBZVWW5loVwqLDo6w46tl
	MWNndxTPtPIabp/LWNDjpOITHsc2KjyKYvYAEWwPPqixGzj38oLTi8BQkEwoX7AB0JPD79j8JZLW4
	rIzbEOb20fzClU8lwy8rzf8s/Hr6Z/jq8qobMxsHuewvnGeze/YJdPtQ7QuXfvea/FiRM/fcZkIU5
	HVV2xdoPQ0lk8h5zdxeROOI0FJyAVBGtGiEs7uoG+oHgfE5cgjxv3++O86/v7gTq7M12SxDsRsemP
	yWQzxwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjzX-0000000APtQ-3Pve;
	Tue, 26 Aug 2025 03:04:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjzV-0000000APsw-0CW0
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 03:04:58 +0000
X-UUID: 6ee4c332822911f09f706fa2197c6ceb-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GGGUMpU1zL5Nu8RykowzhMgLHdG7EOhNaUz4G8avcnY=;
	b=q7zps2dQ4Brg3lLTK/db2RK3FYcT9o/er3g6Dj2+0mZQK4JSkrnLiPsWdVQYrEp5wtjtRxIkpMviBsx9NAHobnCCpFAC89zGMQ4hE4VNoZbbpObM1QSaFZwYkSu7k9bAGjODl7Mm1SjBNsFkMMi/sBt4/+vX5BFT1QcCyBrM6B4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:e1752ce9-8e84-48bb-87eb-616b49bcb22c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:2a7fdd44-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6ee4c332822911f09f706fa2197c6ceb-20250825
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1607909549; Mon, 25 Aug 2025 20:04:51 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 26 Aug 2025 11:04:49 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 26 Aug 2025 11:04:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdrfK80EZXh2IYEgWEi+jFJOKNYXXh4Idd1dkkbe0NWilTibaWP0gu4pBY827sVxI30xRgjbRGvJhJoncwsGQnra8cy0MOIqJrFsqNW76TANhFrpeaoyU4JBPwSJzrgQbRW5GPGR+yhUp1cBhbzdx+a6gOf8p2dEL0wTXl6mbs61i37puN6MfLRt4zzGsjgCypF+su6SiCkKZg8Vis1cst+O0ojqXnPpxl4uhq0PSDy5RCUgWEgy6g8ALjjTNBBxPs4RSnhZmtCfGCpiBAOQ2WrJB41NiYyvBSICbI4XwKZdapLyDw4IGIl9jiM0nVNyaIhDCR5KqCwEo93aPN0oSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGGUMpU1zL5Nu8RykowzhMgLHdG7EOhNaUz4G8avcnY=;
 b=yNHp6D0wbJCU7famSzGYmdk64mY2dN3prXi2RkglMWJghg/YTQErs0XT8Y29lggNu0kCy4moYDXEM5IvaCNRtAviTlK67SJxC0TMrXkEa5sGau/Sq5ObLQLiUudKFjt9Ef+ljLPJqMsdo+4/Sb4TnVcQdccq1yM73dXHwOKQCaTbmFK8cLwz8WYGk6y8aYgtU9bThpHbk8c32nMdwKXcWlyEildYxsl7lGxpNA4Zqlg8gbaozrGKuTFRhKEfodfa2BCquZipgxhGA8PZZ3CtPDFf9R98vQiNvsjFrJ3/JMjmgA/QkoFT4hrKCY6QU6c38unN7k0r6iHwLRT0X7i9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGGUMpU1zL5Nu8RykowzhMgLHdG7EOhNaUz4G8avcnY=;
 b=IBDbYeVK4IIZN09GiRFFtdgFXWdjjID+LMNsPyzs3Z7aJcE8qgL/4vXoSxz7ibKvtHRWbtJ8bHVSIQ1pmV2llDYAFH8TKPMppKQpzVb2BVDHJQ27HgVeA6z3lB/7hB3dLKtrxJ2KkqlldSvUjwjQKiADczQuQc7O9Gsa7t4eBIk=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEZPR03MB8267.apcprd03.prod.outlook.com (2603:1096:101:197::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 03:04:46 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 03:04:46 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"bvanassche@acm.org" <bvanassche@acm.org>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: Sanjeev Y <Sanjeev.Y@mediatek.com>,
	=?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	=?utf-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, =?utf-8?B?WWktZmFuIFBlbmcgKOW9ree+v+WHoSk=?=
	<Yi-fan.Peng@mediatek.com>, =?utf-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
	<Qilin.Tan@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
	=?utf-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
	=?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>,
	=?utf-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>
Subject: Re: [PATCH v1 01/10] ufs: host: mediatek: Enhance recovery on
 hibernation exit failure
Thread-Topic: [PATCH v1 01/10] ufs: host: mediatek: Enhance recovery on
 hibernation exit failure
Thread-Index: AQHcFanCv9mX+RKl10iDp5SXyf/4j7Rzg4gAgAC9foA=
Date: Tue, 26 Aug 2025 03:04:46 +0000
Message-ID: <bd9eee35a541d8fb1c1f035ada6672c0110ab086.camel@mediatek.com>
References: <20250825101815.2891905-1-peter.wang@mediatek.com>
	 <20250825101815.2891905-2-peter.wang@mediatek.com>
	 <5f3c62fb-ed35-428c-8862-ad1fe607daa0@acm.org>
In-Reply-To: <5f3c62fb-ed35-428c-8862-ad1fe607daa0@acm.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEZPR03MB8267:EE_
x-ms-office365-filtering-correlation-id: 4cde2ffe-0406-4ccc-451c-08dde44d5034
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QTVGclR1bWF3ZFhlZlgvc2FCNG9lKzdZNGw5RUsvM0N1anhDV3U1WFpSTDdl?=
 =?utf-8?B?K3F0N1kxc0hYdzFLUHJuTTQ2UXpIWnp4Y0E0Wlp1a2NLRURxb3dwUmZaMnVh?=
 =?utf-8?B?V25WbUlxUnBFN0NoeElXaWxLbU5yajFTc1UvYUlROFVDUThZSEFxNUVjcnlU?=
 =?utf-8?B?SGFWZ2lyakhoUWJGemxHWGEyQmhNK3dpVzZPY3BlSVRUWDhTUFJhV1NTOGd4?=
 =?utf-8?B?T3JPSVIwYm51MVpqd2hMbHhVRVZUTUUyd1ZvSmVkaUhZWlZlR28wNVQrT29u?=
 =?utf-8?B?U2V0Mm1aVmV4QjNGMEo2aEEzOFRKOWlKbEtRbGtSYmZ4cllHRllWdE5tMFlt?=
 =?utf-8?B?MjNrV2hpb09zR3NVY3ZLN1o1b2prRFhoTUtPaFpsZzcvMDRFN2ZiQXhpWU5N?=
 =?utf-8?B?dTRXVGxtZUwwWk81eXpJeVVYT0N4bVBhaW9MZmRLV2lFL2IvRjArNDh6MW5D?=
 =?utf-8?B?VkdkN1BIQVVKSkpuY1ROMlpGWXgwS3JsQko4cHFmd3VkUENmc0N4SlNpeTFt?=
 =?utf-8?B?UjdxeEpNNmVRdEdHNkM0NHJDS3pqTWRReVRpcWdQRm5UMUdPYzhxR2s3bFhu?=
 =?utf-8?B?SzJpYmQxVnZQSk1CN3BRZkZ5cEFhZUJMaXlmWHoxM0hKTGdPUFBabVZ0Sitm?=
 =?utf-8?B?QnBVMTlGcC93VUpveGlyZTNRcWZEaVMvUG9ZQVJtSmkyTzRvd08walRtRzB1?=
 =?utf-8?B?WmZqSktpVWVaV2xzTkNEQ0NEbHRpa28zeUtmSDcva3kxSzFvcHhqNDMybEFT?=
 =?utf-8?B?VE9MYjVXY2RJWGlaZXBDYUY2YkVKd0xLeGtFZ2NTZ05BcGQ4L2ZWd0o2V2JR?=
 =?utf-8?B?YTBRYnpTSjdLQTVhRUVCakNXU3pLWEQ5Rnd3Ny8xSGRsZUpuUmpoTU5IVFJ4?=
 =?utf-8?B?NVMyTjBma01xMkR0UURxa3BtU1UzK3htV1YyaXc5eHk4RWRFUm1mTmsrWTRK?=
 =?utf-8?B?Z1k3bkNWT3ExdEt0em1SUmhQdlB0YlU2QXFRNU9Mcis0dW9pQkQ2b0Vvb3U5?=
 =?utf-8?B?ZjJmdDYzZ0tGS3lQVTNxZ2cyMllGTFY0Qk9haDVpTVlRdlF2d21HdHZVOGdj?=
 =?utf-8?B?VkFMR0NPeDhkTzZEeFcrOXFCVHFmN2NvMTRzdjBscktPVEpUa3lCZnB0TkNZ?=
 =?utf-8?B?ZHFNYW91ZExHdjUwS1FsUk9RZ2ZBTVZzbG5JbjY4ZFBJbFMzK1IyTTcvL3Zk?=
 =?utf-8?B?aklINzBTSy9DS0d3bkhkYWFsb3RFL1RlTXo5STBXbG8xOVZqTlMwM05Rczl4?=
 =?utf-8?B?RXFTNlFkQmJOYjY5bU1ZMWdmRTF0TTQrZldFWEM4NUZNNkVSeDlILzhuNkI1?=
 =?utf-8?B?ZUVRUUFHTmU4d2MzYzhSQmcyV1NNUExVSUVUWVM0anhXL20xYVd5b0drRTRq?=
 =?utf-8?B?VGI5OU0xU2ZvakpZWE03d1gxQTFrVlhhZENXUGdrd0FRTzhOTE1pdG56WDF5?=
 =?utf-8?B?NTdBSm1YQWRPa3gvcUtXZU52UTlGeFBYZEpiUE10aVpNOEpVQTFsZ1dYQzRU?=
 =?utf-8?B?eEZXbDFSWm1TQmVOV0xTK1FGM3VGbWxyeUQ0bHJMRWdhczJJai80S0NnSm9v?=
 =?utf-8?B?cnB6OUZGWWd6TEVuckFFYjh2N2ZqVFdtSUFLSWxWY1Vkc1QyTjZWY1JJNUVa?=
 =?utf-8?B?Rm80MUxnM3p3WU9OWUxTNDNXb1UwR3M1aW10VkxYUHZjTmFDcDNuZEEySDFq?=
 =?utf-8?B?RC8wRkdnalpZeVY1NmUxS1VFZkFzR0Z3SVZ0QXFKQm0vZlg1Rmdlc0JqQ2p3?=
 =?utf-8?B?c1d3V3BNblJjTThGSThzWVNNc1VTeWF2ZEFHUGJZUTkxdGE1M1NnMStBSUQw?=
 =?utf-8?B?aHlaMm4rS1dsbmZBODEyMlZDUHFvN1BiL3M2a1V3VHpQdlFlT0NRckZVTGx3?=
 =?utf-8?B?bVJNa0xrMkd0OTgySnpHa2NRS1lQbVVBckVZWUtGSXhkcm45SHpnRXV5WStr?=
 =?utf-8?B?YTdybW84aG14UWFUZ1dZL2ZKM2RLSWZXcDJ3QVFTQVJ6UGtBS2dady9JWXV4?=
 =?utf-8?B?bVAxQlkzYnBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzM4b3dzbXgwTWQ1WTdiaUdEUFNIRzVVeGVVbFV5QU1XQmVmNHdjcS83UjVC?=
 =?utf-8?B?d1NFNWd0WDByQnZBYU1SN2p4dkZLQWVYWmF5UWVGckluSU5QM2ViUktuWEV2?=
 =?utf-8?B?em4rL1dWMTNPTVFpN0J2Sko5aDdUNHRpa2NvRFdaTEhSWVdKQVpZSkp5YTd6?=
 =?utf-8?B?eExKb0Jubjk1WDR5d0hyeHRjQTh1cHhvL3dDVDc5aUluRDhSckR6SVkyTlRJ?=
 =?utf-8?B?MFZFWUY0dE01VSs1c3N4WmRKSW1LeVhnOXZ0RUhmaThOQVNESU14TGdLREYw?=
 =?utf-8?B?dU8xRTJLcnpRSlRwSjBiMFp3RmJybTErd29HMlBpRnFjZHk3bi8wQVpTYzFM?=
 =?utf-8?B?NE83b3ZLemVQV3VXVUxvdDRzWGJQdnlyNFd3Tk1KWi9ObFdYMm1EdWJYeWFF?=
 =?utf-8?B?ODFyRHNRYjBma0FjUzZFTG0rVDROcDUvdWtjK1g4eUxJeVRRUjRXa291OUVo?=
 =?utf-8?B?KzFycUZEdjJqZC9DU2VkcUVqS2ZoR1o4elVRQjFqOHc4aHdvZ282Wk1IcC96?=
 =?utf-8?B?UEJhakxvdXNLOFhYYlZaM2ZqV0QxZmc5cnVrTXdvZ3RpclJnampYK2pHY0JJ?=
 =?utf-8?B?cWJIVTY4RCtLRXZDK1BIT2hqOCtUOWc5ZVFtTVJTbzFuNWlsUG1vMFJ5WVZ5?=
 =?utf-8?B?aTkza3JWaEJRT1RxL2NYalJyZHdsMVgxUTk4WGp2Vy9vTnM2V2ZzMVVOb0k0?=
 =?utf-8?B?ak9XUFRlUkQ1Z01qRVpicUs2ZEx4c0NQbzlJenBIOTYva2FVdzgrT2F3eW5B?=
 =?utf-8?B?aHNnMUhKaFhYQm1nTzhwdVQ1VDBkbnhtVXFOd0l6eGR5NGFDckZaT3c5TTcv?=
 =?utf-8?B?QlJOdnRrdnJKcG0xeksrN243c3JuRGV6SUdZSjZjUTA3bTJLOXNHVU5TZ25s?=
 =?utf-8?B?bk5yVWZkS29sWmxVbnJCTmpteEExdGhSRTUyS2d4ZS9POS80LzRLdWRETmVN?=
 =?utf-8?B?d1VMM2FkTldKeEVFWFhBcTZsZURySmxscWhDK3JHc0dTR2dkbFF4SWxrSWVn?=
 =?utf-8?B?SXlhQlRERFQxNFZWc2xaa3RZWlpIcnlXb1JwYTdsSVJaZUNOWGdiMHYvQ2pY?=
 =?utf-8?B?bTE4ajFsOUlWUzFkNFF1dnNyUVJpOFRPS25sUHVIbG50dmUzZTB4clhHejJj?=
 =?utf-8?B?a0ZFUDV1bjZmWHhtc29tQ0J6V0Q5YXBXU2lyYXNZRjRSMHhDVkMwSDkrbmxF?=
 =?utf-8?B?Tm1FMGExaVk4NnllQ29lcWlEbUxEU3VwV1BneTkvaHhPSlR6RFhjU1luZWJN?=
 =?utf-8?B?V1RXdHJ3aHJ2dzVIOFhrMzJhdTlYSTJadm40VVBlTlZCUHR5MHNJc3N5NjNp?=
 =?utf-8?B?eDNkaEE3b1hKOGVJTUgrd0NVTVVaMUZjR0tLTWhMWEF1Vmd6WlJFWHM3aDNW?=
 =?utf-8?B?MERMSU53V1NqRCsrMDEwYkJsR1FibGJGb2lFVlVvUTFaTnN1TzQrSkR4aklW?=
 =?utf-8?B?RnFrNXY4R3BYZHplc0prekRNbWkxOVB1VmREY05zeDhIblNhd0E4T21uemlR?=
 =?utf-8?B?dnI1YnN4ZFBrdVRlUHdsdmxMcksrcFp1TTQ1SEN3S3RFVEFXcFRnYTB5SWlJ?=
 =?utf-8?B?dURZOHBxS01hYUh2Qjl0ZG9KVlJiU0tHQ0R3a2EzdXAzRGRhRjNnb2JLMXl4?=
 =?utf-8?B?R3RxbDltZzNiSG5CWU9ERGREcjAzZ2pRV3cvbUpya0xodGdGYUhtUFFQQ3M3?=
 =?utf-8?B?QlYyNlQyeGlURE5qRnFNVWVFQTY4TDJWRzViS0U5dzFPZGxKWFAyYzgzTTNN?=
 =?utf-8?B?OHVkcjFjdk85bDlHM2E5bWR2V1l4ZkNIRmpxNDhUVFlhdGJOenplcW5ETjRH?=
 =?utf-8?B?OTNvOXkzZVVFSUdtcVRaUlJCZmFYdlZqNktEbWx5aVFjNjZQMml2L0d2eHN3?=
 =?utf-8?B?T0ltOUtVa0tDdzhjV2E1TTJSM1B2Z21sdHJMYmxRSjdsK3g1bXMrYnp1RXEz?=
 =?utf-8?B?ZjRLaW1PK3UrZFdlSGdiZUZjV1d2dythRm1mRXRnZ0pjWkR6RktFREFwazZm?=
 =?utf-8?B?MHNSUnlnMVdiQXYyc3NwOTZLSHMydWtuN285SHp4c1Q4eWtSV01WWjNrV0do?=
 =?utf-8?B?ZUtaRlpkWjJESTUyYlZFYkZRdHNvb0lLNFZUSVRYV1A5RTdBbkEvUiswMHlZ?=
 =?utf-8?B?dVBIOTkrV2x3VVhaRmozSFdIaXpORXJ2cm9NeS9uZ1NIejJ2YWFlQjZwazkw?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97670E4CBA1A5341B567BB7F5DC6C28E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cde2ffe-0406-4ccc-451c-08dde44d5034
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 03:04:46.5071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kB1ib3kIgGeRdpfI9GdfoDnkfnarASPQSOyi0LjmigqQCo96C/tOeyDoJRgaF4znZCra6+Te5Yyxw0z5wIjOcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_200457_120166_00547A1F 
X-CRM114-Status: UNSURE (   9.42  )
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

T24gTW9uLCAyMDI1LTA4LTI1IGF0IDA4OjQ2IC0wNzAwLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6
DQo+IA0KPiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBVRlMgaG9zdCBkcml2ZXJzIHNob3VsZG4ndCB0
b3VjaCBoYmEtPmZvcmNlX3Jlc2V0LCBoYmEtPnVmc2hjZF9zdGF0ZQ0KPiBub3INCj4gaGJhLT5l
aF93b3JrLiBQbGVhc2UgYWRkIGEgaGVscGVyIGZ1bmN0aW9uIGluIHRoZSBVRlMgZHJpdmVyIGNv
cmUgYW5kDQo+IGV4cG9ydCBpdC4NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEJhcnQuDQoNCkhpIEJh
cnQsDQoNCkkgd2lsbCBleHBvcnQgdWZzaGNkX2ZvcmNlX2Vycm9yX3JlY292ZXJ5IGluIHRoZSBu
ZXh0IHZlcnNpb24uDQpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCg0KUGV0ZXINCg==

