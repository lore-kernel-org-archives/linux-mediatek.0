Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA11C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHVto6OWp4345cXuosdDzmtJg9YNI/wEpNV0ZXC2qGM=; b=ydVc7SdNAzt6156ehDjZv+tMsU
	ymzCp3ekShhIg/+qXjdgrg9FSBwmP5GVW+gKuuZFB2E5ob8ZBpnS1A13WlZxCwLMh0oCcJWBtUm8R
	z0JoqSd/BmE9pqoUHvYf8T6KHPyhv+qcI58tX6ucvfQzuUiHL0aLA/SoONTjn7jYGegCoZsJDys6B
	3l1LI4igjN1npOKLiyC3E81qPchKLHi9VDYOJpG3oM3jOR9Ka2KjZsfd0HWX10siv6QckMgL5vn7U
	XPeCMWou5qJjV9n3/fhDJQy2swBZzI4Yio/D3CbDGdx+Nwr4POr6QGwEFTaYA68K50HxDjhchrtst
	I0l7T4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMn9t-0000000A8Fa-2grV;
	Thu, 27 Jun 2024 11:19:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMn9H-0000000A85o-32CY
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 11:18:46 +0000
X-UUID: 0047e734347711efb2966dae1f787272-20240627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=pHVto6OWp4345cXuosdDzmtJg9YNI/wEpNV0ZXC2qGM=;
	b=sN6BuTvidzhDSk/evgG4IVuF2htK/I6Zw5ha5vtrva/tHQ0vB/cTtAz+jC+u1ZDuQ+SRLrYccJwz4hc+a2xKOqxjaWptehYODaeu/5InvSeFowT7mjVd55Nyc0Q1dkeQEWnHZ82HeWmAMMY4inxIEFtrUzGjaBmh17HqqA8D8Ns=;
X-CID-CACHE: Type:Local,Time:202406270400-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:a334dd32-77a8-4536-80d9-e72c3062c7a6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:e4c3cfd0-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0047e734347711efb2966dae1f787272-20240627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1207017317; Thu, 27 Jun 2024 04:18:38 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jun 2024 18:58:34 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jun 2024 18:58:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzYcfOmrrBd0fzPnhMPCOWgrsHOVYkhTpMlS5qxQ3+lmhTrv8yG+s96dVGvYWyj93rG+HLvhS7g7MD01baDTShr2Ow6I+0k+9/pSMv4w26FevU7rd6uQLxwfM2Qw3jOc0B0uI5MeoKVjBbrvB4Hu/IrFT9IjN6s/R3y4fojxgLt+wH9FUrDWjmoNs+CHmdGWvq/a0MXm9M532LWhAB2zWT5F5wtA+y+ybFJ4B17i4eAkaGSdy9q/6kxSpWNqFDdkSUuIOU6S455aMNmgXSUrL4hkTcsuUyVJcQZc4hc05HixVxOjyFxuYcBbMkVuNxLEawARBai2okIbJG+UmRufGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHVto6OWp4345cXuosdDzmtJg9YNI/wEpNV0ZXC2qGM=;
 b=JhznmzPM52UZ4gm3IW1zRLjO0/YUZrRd/v1MVHF+6b35Y0rv7gRTACNtWM0dxa9YY9vD1dTM/aAGG2NUV9UU7H4fi+KdDzOUTsfwIUAv7J5XWeZp6C0ysAp9Nx2fIc77WtwuMjJW/5C2X7osCdq/lWZH4ajeagwU5l+V+IkRa7bzf484FVCHcgtuvyTka9MbOd3zIr/Oe08B7CIsUUh6sdIUbmKRs4WgRWiPvC/PtR93LNcApFWEVL41/Ultdu9ULEKR9cm1y1Q1NSZ3yw/HrSA+0XKYUGl/HRf8MAlKHvsDuYlzuK4vKwYsCTzvXxEdlaCvF/MUOIyZ6dxaSW0ZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHVto6OWp4345cXuosdDzmtJg9YNI/wEpNV0ZXC2qGM=;
 b=VtfAyhqADToUVpTEV06E4NUjIntWh5i34tFG2ByJbzG59EAh3xd3ppK2KTOjaor/7z4eUv6IvBy/eubbcqeghDevE3HdJClCGdW0j/mKEejwH2RNwc37l/TWdABpksv6xvPKNb5vV2LPTGyLQfQw5nvr9drld//ki/RUHZxwmGs=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SEZPR03MB8634.apcprd03.prod.outlook.com (2603:1096:101:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 10:58:32 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::3945:7dbc:62bd:c31c%5]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 10:58:32 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "haowenchao22@gmail.com"
	<haowenchao22@gmail.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
	=?utf-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	=?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
	wsd_upstream <wsd_upstream@mediatek.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, =?utf-8?B?TGluIEd1aSAo5qGC5p6XKQ==?=
	<Lin.Gui@mediatek.com>, =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
	<Chun-hung.Wu@mediatek.com>, =?utf-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?=
	<Tun-yu.Yu@mediatek.com>, "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, =?utf-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
	<Powen.Kao@mediatek.com>, =?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
	<Naomi.Chu@mediatek.com>, =?utf-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
	<Qilin.Tan@mediatek.com>
Subject: Re: [PATCH v2] ufs: core: fix ufshcd_abort_all racing issue
Thread-Topic: [PATCH v2] ufs: core: fix ufshcd_abort_all racing issue
Thread-Index: AQHaxi+9yVyGxDcFYkS8cVbs4SEa0bHXNMuAgADyXICAAInTgIAAvFQAgAHWDwCAADIogA==
Date: Thu, 27 Jun 2024 10:58:32 +0000
Message-ID: <147f56027997fc37c93d4a6c438da93898fd50f6.camel@mediatek.com>
References: <20240624121158.21354-1-peter.wang@mediatek.com>
	 <eec48c95-aa1c-4f07-a1f3-fdc3e124f30e@acm.org>
	 <4c4d10aae216e0b6925445b0317e55a3dd0ce629.camel@mediatek.com>
	 <795a89bb-12eb-4ac8-93df-6ec5173fb679@acm.org>
	 <0e1e0c0a4303f53a50a95aa0672311015ddeaee2.camel@mediatek.com>
	 <58505ca5-5822-47f5-a77d-a517eda0c508@gmail.com>
In-Reply-To: <58505ca5-5822-47f5-a77d-a517eda0c508@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SEZPR03MB8634:EE_
x-ms-office365-filtering-correlation-id: 184c1e30-d136-4f38-6041-08dc969815df
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NnlWRE1adEZKZGNzRnVvaEQ1QzEzcVQrSmZjRExkd1h1SmpublRkaWhseVRX?=
 =?utf-8?B?dU5Ga0lKeXFvUTFFNS9nMGtNeEdGSFpSandrTENBaS9NQ2xFWXFMUW9DTVJH?=
 =?utf-8?B?WXhrajFnM3ZNRFpIYUk5dk5hRFRVMnMvTG5jVG44ZEVuRjVqNzBzTEFLTlV5?=
 =?utf-8?B?N3Bub3J4VFZiMmNIaUhpUWlpZlV2WjB5Z3dKaEdVRzNVVnlTYXdLRVFxU3Zv?=
 =?utf-8?B?c2MvVjBKK2o0eC9hUlRaQTJSTzlCVEN6ekoyTSt0eEduNXhRNHV2WDhXVkx5?=
 =?utf-8?B?OU1DL2FVTGQ2Sm9XZDVTdHJsR1dWUFVHQ21SNjJUZjlZNEdKaFI2N3dHNWp4?=
 =?utf-8?B?U3p2dXdqN1llZ25lYlBVaU1sWVkyVkhtMFZIakIzMEtRSjFBUkZWZnhqUTl3?=
 =?utf-8?B?SUNReFJpTmZkMVNUMjdHLzhDdG00Tm1uR3h6UCtBb242ejQwVVBhZ1Z4dDFm?=
 =?utf-8?B?MDlxYm92Wmd4NmNsdmF4dlB6QWl2L1dMQkVETDQ1Tk1oOVlBWkJzTXRiN3JM?=
 =?utf-8?B?TTFISFhlMXdiUjZIdU5TTHFPNVI1RjVDaW5HWWppWXhYK2g3ZTNhUWFGcTNP?=
 =?utf-8?B?L0pwMDVrcTBING9yTXkwMkI4cmtha2p6VkFOb3hJUnBqMllBVis0WGZtQUZZ?=
 =?utf-8?B?eTNHeHpWeERCRm5JOEZwbVdzNDFVNCtkR1pBblVtbFVzcGJZM242TjlVNDFS?=
 =?utf-8?B?bzhkK3hJSTAxMUV1M25hYVgwQjYyTUJFMEpDN2RPYjBEa1JQSU13RmdxMWIw?=
 =?utf-8?B?ZmNFWEx6cmhlQ2dVZFpaOUd3VVdSaEM1OXBhYmlQd2JGVnpSUmlManZFbFU0?=
 =?utf-8?B?bTNwMzlJSEkvMVQ1TGloNzBCZ1VuL0xTUG5BOEVhdU5ERG9vUVJHTHlvbUJz?=
 =?utf-8?B?cURqMU9CbndXalMyZGt3VDJjb1BnNzlJRjVJZDhXNlk1OWpwM0hwWG9WM1I2?=
 =?utf-8?B?VjZJY1FzZVNGWWkwMWtlUGdKWW5xd2YrTzdTMjFWZmhrRUJxby9YZXBxanh1?=
 =?utf-8?B?RkE5bXdlSDNZblNJcWNmUFo4cEJzaWMrdnlQcUQwTndjQWw3eUljVEJMalFn?=
 =?utf-8?B?Sjc2MVk3aFd4eTAwYVhsVTBQL1JjSTFDb0ZTSk9zQlJLMVBnUHlLdTJvcVpN?=
 =?utf-8?B?cEV1QVh3QnBkQTYvT2RHcnV0Y2NMTTVaczJIcGUwZ0pLS0NaTlJ6VTVlZmFL?=
 =?utf-8?B?UmQwblpkY3A3d2ROanpQNm5wVHYwbnByMXZzRHpkYmV6Sk1McnhZZklkZEk2?=
 =?utf-8?B?a3JkdTlRSEtxZ2gxNXBldmI1RE5DbFZiblVzQ3VlMUd6UTQ0NEtmSkkrcGl0?=
 =?utf-8?B?emd0QzNNRXlPUVp6bkorb08weVpybmJIWWs0QTVBYTNDeUM3eFRJQ0o3Qk9j?=
 =?utf-8?B?UVlXT0d1QlhSM0xvSWFCelRTcTNndk4zZzl6cUs2N1VHVVdmQ2V2eGMzZTNZ?=
 =?utf-8?B?MEVtQmptREtRRVcrelBOTGNLUE1oVTgvZUFCTGNCM3JVaFR1UVFYL0Z0bzB4?=
 =?utf-8?B?TUpBa3FkTEI1cmE2YURhVnllMkNacGY4enExTEFIcVJMNllSWlNPelBSM2No?=
 =?utf-8?B?SEJMN0Y5SFNUWUdPcW95NnpiUm5NY0U5OGhjT1p6azlmZ0FVV0ZYandCY2lO?=
 =?utf-8?B?U2ZLL3hQK1VSS0FxZGk3eVgrOGp3NjgxQ1J1MzBrVXpSejY2R0tZeHVpRitx?=
 =?utf-8?B?bHpzZzIrNGtlUUVIWTdxVWt6WTFzSVJvL2NlMmhLYXhjcUhnbWQ2bUtoTXlZ?=
 =?utf-8?B?QlAzdFVySjE2bmo0dlFURHJ6dnN0SElqdDZvQmRqdXRpOVp4Tzl6MmhIOFVx?=
 =?utf-8?B?OTJURXBIa0ZvSVRJVE1UNlY1OENwdTBiK3QzQi9sZXp1SjdQRjVlNFFGVkZp?=
 =?utf-8?B?dUpOeExBRzN3clBrU3VPUEUrWFE2TlpwQWJiNVdOTWJUelE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjZ1SVF2akxqK3NkaVlpaytuamxYbVQ4ZlMrSWJ1RE9DWGtVeUpKSlY2QmN3?=
 =?utf-8?B?NTh4VXRHcmxQYXYyeEt1RVhDNlZmT2lsUzFGM1JkdHdvTDE0WTAzQTJ6SkUr?=
 =?utf-8?B?ZlpGOVNXMlZKTWdlSldHc1hpZzZpRWNRUzdFanI0Q0JPZXBoZ1pKUmt3cTZG?=
 =?utf-8?B?MUtoN29zRHFpYVkvaDVMYnFQTXNWODk4Z2w0MDd3bytFN0lqdkxmdlNrbWxO?=
 =?utf-8?B?dEZneVYxRDZVVmsxZzBMRVBUejNJck0xRFpDRzNlVXhoYmxuNG9ObWNmVW9I?=
 =?utf-8?B?THdONVlnbjVoVFo1ai9tVlA1MVV2eENUbVc0bnJ1Ky9mOTBUWE9aWXBXVUxu?=
 =?utf-8?B?VjNNTXA4YXl4YnJWak53TG5haDZOZ0RTaUk2YU5BV0MxS1M0eGZudHhoenRF?=
 =?utf-8?B?TnA1eXljdEJLakVmcTFpYWp6V01oYkptdnJkZUhiSDBmWjExLytyMVJpb0Nl?=
 =?utf-8?B?SDlJWWdEbUNlaEdRSERtZmFGTUVGNGhoZVZtRmFiOWlueTBpdEpBZU8xY3NE?=
 =?utf-8?B?MUtZcy8vc1NqQWVJK21SZnduK3drMW9ueTF1L2FCUXRGcSs1eDFnbTF4bG5o?=
 =?utf-8?B?ZTI3eVEvcHhIcUNSb0RIdGF3dmw2NCt3cTFiZnZRUUUyb01QWVYxMkNyZnJi?=
 =?utf-8?B?U1UrMFg5NjBDQ1FOelQ4WVVCYmRPcUZUcXk5OWQ0YnFtU29QMnpFZVhWbUwv?=
 =?utf-8?B?OVI5SlcwaVhFeUhCZjh6ditxbDQ3TUlLWVl1d3ZNR0FRVDRJMEJBN1BIcE5T?=
 =?utf-8?B?T1phYnIzckc2STcwQWlzOVJtQTdvU2FrNnRuVGJ4QkJMTXd0YVFyWFg3cDFE?=
 =?utf-8?B?N0VDeTkxSC9mdnh6bkpMTXc4bzh4K2FjOUQxVXZnd3lHYndrUm41ZW4xUlNY?=
 =?utf-8?B?a0FtMGYwSDlVK1I2N0Q0bnM1M2tBRzZxem56SVJsdUo5cnV1Q2d3L3hSNEVl?=
 =?utf-8?B?TFhjR1R5d29PbU5Wam9VQU9OU1ZJUHNqV2VZZndCNEVGWGdLdXVHNHIrb25G?=
 =?utf-8?B?dnorMVdBVzQ5NFJQRnFkUzNjWnl1bzhScXV2eDVoZnpYY1lydVVaNVpjcTFC?=
 =?utf-8?B?bmY2OFl3RS93Z213TDVtUVhlK0gwK3NQNk9EdEVuZ25OT0NTUSt5SWs2T1Ba?=
 =?utf-8?B?QmVRQXlSb2dlZ0FLR1NySWdFMElNU2ViTk5ZOFdQK2ZiZHVuU05QZ25hNW1o?=
 =?utf-8?B?eHYwUDZCZ1BlY0Z6NDB2TDlENUxQcmQ1WXo5U0ZMc1RXbDZzdTJPUUlSN0sy?=
 =?utf-8?B?dlVlUzdvSGZVV1NCRzZrUlo3N2JhWkhZamxUMHo4RTM1eFFmUXp3d3c2dThB?=
 =?utf-8?B?L2F1R2VxWUlBaVQvdzFxeG15YzlpbWc5UWN1ZTV0NWNCK29ZMThLbk5wdmdh?=
 =?utf-8?B?ZXhYaW5qUzVjakJNYUhqZy9lY3NNK0VMTUNHcnZBK0l3bEM4Sklzd0w4Z2d1?=
 =?utf-8?B?VldBc0hobktvVERxTmE1YjgrVHFFbk1sckFnWldLL0p6TXJNVDZYa1ViMk02?=
 =?utf-8?B?dEdxaXFVWC9SMHhoeFM0V0wweGdyMnZoOWdXNFRsb2trVHhRODAvUFAwaGpw?=
 =?utf-8?B?NFFVMnIvcTNnY3VJS2pLOHlOcjF5b1ZaTkZPZTlnUnZLelJNdmNBUkYyRkcr?=
 =?utf-8?B?SWFBYlBNMHJzRUFoK3R3QjlRZSthU2VxTnlZRjVvOXU4VnowU2xGdHBZZ2F5?=
 =?utf-8?B?L0dpSTByeldSbXlSZnFnSllhaXNCV3ZRajgrbGJxVmpvaC9PWFZyelQrRmg1?=
 =?utf-8?B?TkFDRlJQcEUyalBqQmlIME9WZElSZGdJNjVGb0VvQlI5OC9qRE52R1EvSGJz?=
 =?utf-8?B?SmRFcDE2TTFKRnpVTTc5clRyTHdZeVN1VW4rT1RhY1ZNK2Z1cXh2cDgrRWQ3?=
 =?utf-8?B?dy9nYUlHS21OUW84YS8wU0Z5OVVNOVNtWTVOL1hiaWdzWHJXVFZyVTBjNS9p?=
 =?utf-8?B?YXJnMXhmdEFBay9lRUI0QWdiWXQ4MnhFQkRORWlObVF5M1FXOXZDeWhFUUNG?=
 =?utf-8?B?Y3c5Tkl2c25kV0lzZVJPZ3lIU2ErL3lJQXJsWldIWWNzbTh1YjFoQ2hoWlE3?=
 =?utf-8?B?eG54NHpveVpMRDFEMVQvVzFWT2k4WEdhSWVSbWtiVFAwYlFVbWM4NENaTis4?=
 =?utf-8?B?Rlh3eTIrTHQ4UlV6Mmo2UzdPdklYSURoTDljUnpVZmZXN3d1L1FqT1NHdlFB?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B7FC0A29AA37A409F919C4DFF95B8A0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184c1e30-d136-4f38-6041-08dc969815df
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 10:58:32.5301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: udlkFg6fSiB6pLP7dSvuct7EQZXQzxOMXxQ/B+kTu3UrAitU+6YawW2vI/2jSMu6mnzKnv+k8UepbQFVEwOVPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8634
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_041844_007593_01EEE2E0 
X-CRM114-Status: GOOD (  13.45  )
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

T24gVGh1LCAyMDI0LTA2LTI3IGF0IDE1OjU5ICswODAwLCBXZW5jaGFvIEhhbyB3cm90ZToNCj4g
DQo+IEhpIFBldGVyLCANCj4gDQo+IFdoYXQgaXMgcXVldWVfbnVtJ3Mgb2Zmc2V0IG9mIGJsa19t
cV9od19jdHggaW4geW91ciBtYWNoaW5lPw0KPiANCj4gZ2RiIHZtbGludXgNCj4gDQo+IChnZGIp
IHByaW50IC94IChpbnQpJigoc3RydWN0IGJsa19tcV9od19jdHggKikwKS0+cXVldWVfbnVtDQo+
ICQ1ID0gMHgxNjQNCj4gDQo+IEkgcmVhZCB5b3VyIGRlc2NyaXB0aW9ucyBhbmQgd29uZGVyZWQg
YSBzYW1lIHJhY2UgZmxvdyBhcyB5b3UNCj4gZGVzY3JpYmVkDQo+IGZvbGxvd2luZy4gQnV0IEkg
Zm91bmQgdGhlIG9mZnNldCBtaXNtYXRjaCwgaWYgdGhlIHJhY2luZyBmbG93IGlzDQo+IGNvcnJl
Y3QsDQo+IHRoZW4gdGhlIGFkZHJlc3MgYWNjZXNzZWQgaW4gYmxrX21xX3VuaXF1ZV90YWcoKSBz
aG91bGQgYmUgMHgxNjQsIG5vdA0KPiAweDE5NC4NCj4gTWF5YmUgdGhlIG9mZnNldCBpcyBkaWZm
ZXJlbnQgYmV0d2VlbiBvdXIgbWFjaGluZT8NCj4gDQo+IFdoYXQncyBtb3JlLCBpZiB0aGUgcmFj
aW5nIGZsb3cgaXMgY29ycmVjdCwgSSBkaWQgbm90IGdldCBob3cgeW91cg0KPiBjaGFuZ2VzDQo+
IGNhbiBhZGRyZXNzIHRoaXMgcmFjaW5nIGZsb3cuDQo+IA0KPiANCg0KSGkgV2VuY2hhbyBIYW8s
DQoNClllcywgb3VyIHF1ZXVlX251bSdzIG9mZnNldCBvZiBibGtfbXFfaHdfY3R4IGlzIDB4MTk0
Lg0KT3VyIGtlcm5lbCB2ZXJzaW9uIGlzOiBMaW51eCB2ZXJzaW9uIDYuMS42OA0KSSB0aGluayB0
aGUgb2Zmc2V0IGlzIGRpZmZlcmVudCBieSBrZXJuZWwgdmVyc2lvbi4NCg0KKGdkYikgcHJpbnQg
L3ggKGludCkmKChzdHJ1Y3QgYmxrX21xX2h3X2N0eCAqKTApLT5xdWV1ZV9udW0NCiQxID0gMHgx
OTQNCg0KQW5kIHllcywgaXQgb25seSBzaG9ydGVuIHRoZSByYWNlIHdpbmRvdyBvZiBzdGVwMyBh
bmQgc3RlcDUuDQpSZWR1Y2UgdGhlIHByb2JhYmlsaXR5IG9mIHN0ZXAgNCBhcHBlYXJpbmcgYmV0
d2VlbiBzdGVwIDMgYW5kIHN0ZXAgNS4NCg0KDQpUaGFua3MuDQpQZXRlcg0K

