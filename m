Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D42C35FE7
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Sep 2024 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s70zvr1i1uV430tlHc4XUzi+C/gGo1WkyNixy2bELLg=; b=tIUKaJReFX6sWAHh3Vg3sZ0d/N
	gtZxOhkdVBogdjI2Nq7nVa0G7/V5vSE+VPEFCW9o0VCb4NMKrlnhppz0s4KSUAai7J6rXwuXmJFJp
	7QXMvLLq7p9F5HJ3sti9dQ7K4MRG3ZwUEaV2lIPU2Lr/BBNqurxDE9TrkknDOWSVGGKAZiQd9QYPZ
	7aIeWPlgeaNfTSkWLwqIvQYdgtY6Dmr3rZ/LZWw9Gx5iTUIgaRnT3H5SVH1oQImKDNp8v5Yt1N2V8
	udmynbJiKHrU7BSgFRWImWiH0nX/p9efbQ5BDNzVzFbCBChltKQKyps8IJh1j7PPEkpiR5CnQD7NX
	8LuzFBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spmh9-00000001yfz-3MLf;
	Sun, 15 Sep 2024 10:41:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spmg4-00000001yb8-03bA;
	Sun, 15 Sep 2024 10:40:25 +0000
X-UUID: e66ffd1c734e11efb3adad29d29602c1-20240915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=s70zvr1i1uV430tlHc4XUzi+C/gGo1WkyNixy2bELLg=;
	b=dMDuD4aCxfEwEpjeIeGezNXJSIzZTebKAaHibVsiU8wjDIe6ZWyrFjEn/XSVQPAiIje5h5RlUMkeixykt9sFddOoSbQc0PSmPEdzhiVmJfQY4mAlzqwC3MM+FNPPptFJQA4f4e0IWbhBkdwW/kpFHAylGDPIf7RqwjUeUkmJG+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a836afd8-91e7-429c-9e3b-a180ced89d09,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:20fa3bd0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e66ffd1c734e11efb3adad29d29602c1-20240915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 688435871; Sun, 15 Sep 2024 03:40:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 15 Sep 2024 18:30:15 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 15 Sep 2024 18:30:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjt7/dug1/DMG/qeOk0gDR++BQnzb+zOqbpPGtRdhtTx0Rw11sJPcHll4gBDWf79ugJQDh9BNbpyVG5nqTcytkzBkcLDp7nNdH9XYlQxY2CGiSsZPUbKiq7kQpUkRHb7sL+tasCSoFdyOt63DoEvbCrkB1srTVDr+hDo9L3OtIHd94lZbOHxrzXxb06Yep3Cne5mnDvQ0gcwa5upRa0FmgEDtEAmoVUB8Bgr2mZyNUhvGojX7jkDC/ct7T2uSF7ACeLHZpHXTQ+6knomtVby+NzaGGAiRwzMBwTsHM4Vi3VA1GfiB0YueqMcsj/dLtanlWh+Rh+E6k9IYSeMqHkwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s70zvr1i1uV430tlHc4XUzi+C/gGo1WkyNixy2bELLg=;
 b=Wlx5zOr8pUOFNdxRXjK2x82o9QA9AaRwBPfNr6+Y/PVPav/BmFMV4VEXOrTqThp4ONDV51Ai/DMz0R7hU/t6JpXc0eb5BUfD55UPq9bUq1NoRKJyButwqQwBnUAnltIBAso1RMnN7WNvqxZZSyQm0Ch4HjRbjTqnTxh1BHR3hztIvBzjPVBSvXLLuV4NjvPp+lbE3+Fci6r7rfN6KicttAQKMRNW/KNmn1Lh3tJKGDPOlZdA0Jp31J59Ovd7MvTRoB0R6iCCDjXqykyBISCAEVtFxsgWte4Af2eGo9NTzW1EiR/OGCJRtueGTgtM119xaaXcQqHEptZcvlPIk3ugAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s70zvr1i1uV430tlHc4XUzi+C/gGo1WkyNixy2bELLg=;
 b=n14gSQjop8UbcZ+kG52tDnfdm08/DYeugkli+hIxLKL1hQgTM5Ezza9rSMwfSI9X6fmdp1hIwl6WmdxY+yNS9eYdfNlJNEpTN6yeA9gEaM2zeErx/CaqyXyC/jO0v10nhD28qKEokAjY1a946N4zQI2CJLW8z9mmwCNEgXfv2yE=
Received: from SEYPR03MB6627.apcprd03.prod.outlook.com (2603:1096:101:82::5)
 by SEZPR03MB8016.apcprd03.prod.outlook.com (2603:1096:101:181::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 15 Sep
 2024 10:30:09 +0000
Received: from SEYPR03MB6627.apcprd03.prod.outlook.com
 ([fe80::587b:ac7c:f8aa:9220]) by SEYPR03MB6627.apcprd03.prod.outlook.com
 ([fe80::587b:ac7c:f8aa:9220%7]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 10:30:09 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"shawn.sung@mediatek.corp-partner.google.com"
	<shawn.sung@mediatek.corp-partner.google.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
Thread-Topic: [PATCH v4 0/5] Support alpha blending in MTK display driver
Thread-Index: AQHbBuPDCSlO4tZ8BUut6vTVhgd0GbJYprEA
Date: Sun, 15 Sep 2024 10:30:09 +0000
Message-ID: <e63ff4bc247f798d03d93979b15786e2246f29ee.camel@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
	 <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
	 <6c9b7f85-f92d-44ed-ae9d-00f6d55ea614@gmail.com>
	 <a2cf4e9b9c3343a7398521760934f1740505aa13.camel@mediatek.com>
	 <13f6dbc5d460e746352f68b001e85f870c89993d.camel@mediatek.com>
	 <69776448-0328-4880-9108-54466e40ddd9@gmail.com>
	 <01020191ea9dface-81c48f9d-4cf2-4f96-a1cd-59c11fa810ff-000000@eu-west-1.amazonses.com>
	 <a34c16613f66b293b54eb6815c8bea80db08d885.camel@mediatek.com>
In-Reply-To: <a34c16613f66b293b54eb6815c8bea80db08d885.camel@mediatek.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6627:EE_|SEZPR03MB8016:EE_
x-ms-office365-filtering-correlation-id: 42e32878-1e40-49fd-984e-08dcd5715f9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d2pJSkw1Z3FOYUppY3lPOUEwSG1abGx3ZW1OaUlWampZbzdaRGtBcVQ0eWVk?=
 =?utf-8?B?UnJpWUNiUkl5WHJ2N1MxVUpuSE9Db3lHQ3l2ZGExeU1Tb2VJSGgxTHI2bHdG?=
 =?utf-8?B?Q0NFckNzQ0ZtOFl5M2dZWUlvM0xTVW1UbFhKQnB6MXlwdXgzVG1OTFV0WXor?=
 =?utf-8?B?TGY1ZUdpMUk1eWtvSTNhcVk1aHpPUHJkQ2tSNkVsMEJ4NmJDd1d5a1VGRFhl?=
 =?utf-8?B?Sjk3ZndRaFNOTjVvSEpaeUtqTkFPVlhiUDlUdFVVVjBKdjllZGNlQmtMeGJE?=
 =?utf-8?B?Y2lnendJbWFRcWhwaXdJUnJnVlV4Mm5nTURrYUgvRWN1RmNuUWZhbXFVTXVy?=
 =?utf-8?B?ZHRHT2pHbGcxV2d1R1JwOGpWVWN1SCtXcmsvRDJ4STJkQmZjQ3hocFpML3NI?=
 =?utf-8?B?RWk1bDhud2JrVlRMZEo2Q0NWdVNpM3YzVGtDK3BFaFpHcFBIdEpjVWY0Sklw?=
 =?utf-8?B?Y2JaVUlVMWJ4cVV5RGYxU1hya0U4czNDbGIrQytYc09nNSs1ZXRNbVNSWDV2?=
 =?utf-8?B?TlJxQitOeWZGU3M2SSs5RHRmek5aRytUazBPNzdrSDFSaUFGOVlVdno5WXdI?=
 =?utf-8?B?NG5qemxkWnE1NVc5OCtGMlJKbXNyQjhmNkxpVnlTS1pIQWhRUUxjZWYwcmFL?=
 =?utf-8?B?clpDYjZGOTBtbjJzMjBWbkNDZGowRkY5Tkk4QzhzRWZldEw3dzJSQXdvZWJX?=
 =?utf-8?B?eTN4cml1UW4rV0dYVUV0N2kvM1pjcmsxNVAwYkJJTVFaTnp0NTFNSHE0Z2dI?=
 =?utf-8?B?aENXM1lyaXBsMjlSTkZRZlN0aUVvam5kMzZPVWlCaUFCeElPbUhMbk9GdTll?=
 =?utf-8?B?QTNkdFpzQlpodHdXcnMvb053S2pFQ0xJYjlBME1XQ0xqK21IRkZ5dXBDMFNG?=
 =?utf-8?B?UUhZT0pGVTMzcVVrSEJkWERzcmZNc3RGb0RTcGJWK3ltM0JGQjVwSlBkY3JK?=
 =?utf-8?B?MFp4cytRTUJWSXl0R0tQakxjSmh6YmN6Y295SWtFOGlaUnJWREtTcGo3cDBl?=
 =?utf-8?B?MnNaMTZQRGN6YU5IcXRmSzZZallzbXVwUDlYZXd3c01OaXEyNDhKc1Jzd0Nx?=
 =?utf-8?B?VVJpbVlLQzUwTUtxa1dFQ1Q5ZEZOVldib0Z3d00rM1ZLb1JZbjUwZ1JlK1R0?=
 =?utf-8?B?dVpXN0pObElablp2NjFOL1NEalNoRXhUeTI4YVJyLzZCbVdJNFFmUXBiVFcv?=
 =?utf-8?B?SG9BeVBOK3pSWjdpNURMSEdQVThwaWk3RldUK1ErMTJZNlJDbnRlSC9pZlBk?=
 =?utf-8?B?ekxWRzI3bDBCVUxhZGV4VTFaNVRmRXN6UDF5N1VsL3Urc2ZpbG1YN3ZFeTkw?=
 =?utf-8?B?eDlaR0VaN251U09UTFBiU3NrdEp5U1FFQllnSHNvRGQ2cCtlNHl6K0k4OXkw?=
 =?utf-8?B?c2YwdlpjTTRYRkdVdGt4MXhjNDlQTmkvcDQ2LyttMmUvZFd2Q3ErMjE1UkE1?=
 =?utf-8?B?aFZpVFNwK2N2cXovQ3o4S1NNanRVbWdDaE9tS1J4Z0hvaWZ2ZUJjQzkyQzZi?=
 =?utf-8?B?aVJLNXA5bHhYZk1oejdSeFk0cmwrK2VZZlA3T3UrR21ET3ZaYTZUektEY093?=
 =?utf-8?B?V3VNdVdYd3B0V21sNngxZkJPSWJNZnhYdEVaZitoUkNYLytHNmxYZys4Lzg2?=
 =?utf-8?B?Y1l1TkxsZmlHTzljOXhiY1RUMW9ESHNaTzZyL3dCUjN6eG5CZkRwRXM1UE5s?=
 =?utf-8?B?eEVrWjdwSmNIRkhMRGJBUWJwUkNMOWJtRWxSK2NLaDk4MWpSZnFpSFhUSThS?=
 =?utf-8?B?ZTRhUzN6QU1kaDRCdkFEZVVPQW8zMmVUYnozZlNxYzRHY1QxZHJqdk14UHVz?=
 =?utf-8?B?SFhEREo1cC9KRFR0NXJkZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXlRS0tQYlg1djRwRFNNZXJWb1BRMy9GNDk3eWtSZkZzVVQxUWxvempGRHdl?=
 =?utf-8?B?dERud3RKTG5GSndoT2VTWDFDNjhrbWhXemZwLzJpMHlnVjJ5U1NETm51QXN1?=
 =?utf-8?B?MjRxWi9pUnlPZ0F4akQzY2pOOHNWb0VqNUhMT0s4Uk5ZcksxYk43dzFLaXAr?=
 =?utf-8?B?MkwwZFQ4VnhGWTNXWnltbEIrNE1Sc1RDMER6clBhZjMwcG5pTnBXQWpoMXIz?=
 =?utf-8?B?amxFK2dveWs2a0JMUm8wMkgrTTkrUExVNTZDb3NrblF3eDN4Nm1XaEN5cHlT?=
 =?utf-8?B?VWdadGU2L2VmbDJwanpFUXVNY1FMMFB0V1drdWxrSmg2SlQyWXNFUE5XQUc2?=
 =?utf-8?B?VHNxN0dORjRKeEZRZ3kvamIxa1lIZk1zNjhLcmFRUldMc1ZEQ1BlMXc5TnFv?=
 =?utf-8?B?eHNHekY5WUx4dkFScFV6NU9sNG40QXlDeXZ3UXNpaFIrWnI5M1FkK290aVdp?=
 =?utf-8?B?MWlNd2tLbWZkNm9pZFJ2bXNLcnJQZXcwcGI2cmp1VlV1ZjRsOWxDZFdFV1gy?=
 =?utf-8?B?UTZWbFI0OTliWkVwUkNsb3ppRHNtNlBDQmErZThsUmdmK0lJL1pyTXczRndF?=
 =?utf-8?B?QWdnQUNkOCtFR2hyWjFoRWNGTzBaZjZVL1puYUJYWStIRDRFenByb2NZekor?=
 =?utf-8?B?cEFzSjhWY2lTWjNzbmREemFJSHNWQ0NZM2RNeUlvYm92Z0Y0andGcm41d1dY?=
 =?utf-8?B?SUNYcWNIRmtGR2V6V0NXWW1uR3hjeGljK0pQYUYwWEdjYlFXSWJVNFFET3ox?=
 =?utf-8?B?R2ZFNFZ0SUpVbmRoSExjYVgvd01YQW9Zb3dvRkNEbkdpcUY0SGhpdTc5VkVS?=
 =?utf-8?B?ZkgydWQvRlIwank2a2VhNFBvNGt3RDJZNVp6UzFlSmJWRytTYm1RMmxjUlpF?=
 =?utf-8?B?TjdWWDQxcWxRY3ltNnRiVzU4OXMyeEhwQlhTTDBVRVRGQ2xqdFpuZFhOak05?=
 =?utf-8?B?UWN4cTdNTWhJRTVnY1ZBSzVMSjhZc1V2alorY0o0end2dTRmVGlXbmdyMWhU?=
 =?utf-8?B?RzZmakdMbk1YZEZlQm1pVDdXb2FWQjlkNEJYSGQ0K2tXTlJEKzRrcndtZW9z?=
 =?utf-8?B?SzJxSEhWQkZFZWhMaEprNkRxYVF4emkzMmhLVGc0ejE4b0tuWFdGcW5ld2l1?=
 =?utf-8?B?NFE1bUg2dWlUQ3B1d2R6SHFhYWcvSlZRRVp4Q1R0KzZCL0hxZDliUHRaL0tE?=
 =?utf-8?B?T01vOUxsK3J5anBlemFjRU01Q2ZLS1F6NW1VbGNJanlUNEZNYzJBZENscmhp?=
 =?utf-8?B?dWpkeVlYRlZ3WmdOU0N3S3NraC9oZmY5MnF6dTVMem15UzBQS1R6MFA2T05R?=
 =?utf-8?B?UnhKSVZqZEhFbGVNalN2cjZ2aWVoRXArNTkreE96WDUraS9hemQ5SzI0YTlK?=
 =?utf-8?B?bGJTbGhFS0xTWktwR3NMYmpSNGxMVjhnRFl1cURCSkYzc1NoTCtyQ0dQeW5E?=
 =?utf-8?B?Z3U5Sm9CMHJ3dU1WNnFkV2hFM01KTWUrRHdmS1dzSTdidXljSFpKQW1lcDFq?=
 =?utf-8?B?eC80VHkxaituRk93Mmx6MVhJbnhYMURiL2hJL0NXZGRMZVNLWXRNTjJVWUFm?=
 =?utf-8?B?Lys5eXpmR3ArZHF4SEl2VnBWTDVKV2o0aVdjQWZ4WHpCTEFCWDlEbldzZyt5?=
 =?utf-8?B?bE5CN0RrOWtJajIybFMvN3dNdkVKMmQxaFdJdyszNDhiZnlTcUFZRjlQMUdo?=
 =?utf-8?B?WDBLdXJwZDVzOS8rc0NOdUtpMEdTN3lWL3E0RTZYamVGNG5MckFhWUF5cWhP?=
 =?utf-8?B?VkdSUVNzWU1DVldJZnBXQktkSnRsSXd4RmxyOHRmUE1LTWR0OEx1NDl1Qlcy?=
 =?utf-8?B?dWwvZStlamJNUGdTSWI4ajA5UHJuY3ZKSFozNGhDVzJSM3ZyOGZ6T2RIdmdr?=
 =?utf-8?B?cmRJeVZtRGVYbFdmeHVyZUgzaWpsT0pmeWU4c3RiNDJ0bUs2QmpjcThHWGhZ?=
 =?utf-8?B?Y2NBM1NmRU5jS2ZmM0FDOUZoZGlvN3dVNEp1L3JnU2hOT21nSmFCaXhVM3d4?=
 =?utf-8?B?Ny8xdy8xMHA4TkhQdThjWVVtcWMvSlBzSTZlNXc5Q09ZRmppQWJtUlZzcDJK?=
 =?utf-8?B?STkvbTF6NzBEbnY4b1BTQ1BLam5vdzNFQ1NaYUVRdlJnZ0JUV3JidUhJOExH?=
 =?utf-8?B?cEZRUzlNYXhPaDhYQUlKRGQ1SXc3U1JkQkxCWFdtbDVZTTdiTW1OR3lZY0M3?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C391C1FE176F6D4389E8B436D6C65756@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e32878-1e40-49fd-984e-08dcd5715f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2024 10:30:09.1295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DxCJXJW4tX/88ZbMbvzMH5fJtWzSlP0DHJNBIKozrjEnFqnEYcFfFVrK9Werhx6SU5ry6BVedi+bqeCXT+dFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_034024_071555_843402E3 
X-CRM114-Status: GOOD (  20.67  )
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

SGkgSmFzb24sDQoNCk9uIFNhdCwgMjAyNC0wOS0xNCBhdCAyMDoyMiArMDAwMCwgSmFzb24tSkgg
TGluICjmnpfnnb/npaUpIHdyb3RlOg0KPiBPbiBGcmksIDIwMjQtMDktMTMgYXQgMDk6MDEgKzAw
MDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiA+IElsIDEzLzA5LzI0IDA3
OjQwLCBBbHBlciBOZWJpIFlhc2FrIGhhIHNjcml0dG86DQo+ID4gPiBIaSwNCj4gPiA+IA0KPiA+
ID4gT24gMjAyNC0wOS0xMyAwNTo1NiArMDM6MDAsIEphc29uLUpIIExpbiAo5p6X552/56WlKSB3
cm90ZToNCj4gPiA+ID4gSGkgQWxwZXIsDQo+ID4gPiA+IA0KPiA+ID4gPiBJIHRoaW5rIHRoYXQn
cyBhIHBsYXRmb3JtIGlzc3VlIGJlY2F1c2UgaXQgd29ya3MgZmluZCBpbiBteQ0KPiA+ID4gPiBN
VDgxODgNCj4gPiA+ID4gcGxhdGZvcm0sIGJ1dCBJIGRvbid0IGhhdmUgYW55IE1UODE3MyBwbGF0
Zm9ybS4NCj4gPiA+ID4gDQo+ID4gPiA+IENhbiB5b3UgaGVscCBtZSB0ZXN0IHRoZSBmaXggcGF0
Y2ggaW4geW91ciBNVDgxNzMgcGxhdGZvcm0/DQo+ID4gPiA+IEknbGwgcHJvdmlkZSBhIGZpeCBw
YXRjaCBpbiAyIHdlZWtzIHZpYSBHb29nbGUgQ2hhdC4NCj4gPiANCj4gPiBKYXNvbiwgVHdvIHdl
ZWtzIGlzIGEgYml0IHRvbyBsYXRlIGFzIENLIGFscmVhZHkgcGlja2VkIHlvdXINCj4gPiBzZXJp
ZXM6DQo+ID4gcmV2ZXJ0aW5nDQo+ID4gYW5kIHJlYXBwbHlpbmcgY3JlYXRlcyBub2lzZSBpbiB0
aGUgY29tbWl0IGxvZywgYW5kIHdoZW4gdGhpcyBjYW4NCj4gPiBiZQ0KPiA+IGF2b2lkZWQgaXQN
Cj4gPiBzaG91bGQgYmUgYXZvaWRlZC4NCj4gPiANCj4gPiBTaW5jZSB1cHN0cmVhbSBpcyBicm9r
ZW4sIHBsZWFzZSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBmaXggc2hvdWxkIGJlDQo+ID4gZGV2ZWxv
cGVkDQo+ID4gd2l0aCAqaGlnaGVzdCogcHJpb3JpdHkgKHNvLCBhcyBpbW1lZGlhdGUgYXMgcG9z
c2libGUpLg0KPiA+IA0KPiANCj4gT0ssIEknbGwgc2VuZCB0aGUgZml4IHBhdGggcmlnaHQgYXdh
eSENCg0KSSBub3RpY2UgdGhhdCBJJ20gdW5hYmxlIHRvIHNlZSByZXBsaWVzIGZyb20gZXh0ZXJu
YWwgc291cmNlcy4gTm90IHN1cmUNCmlmIHRoaXMgaXMgcmVsYXRlZCB0byBCNCByZWxheSwgYnV0
IEkgd2FudGVkIHRvIGJyaW5nIHRoaXMgdG8geW91cg0KYXR0ZW50aW9uIGFzIGZlZWRiYWNrIHdo
aWxlIHlvdSBtYXkgd2FudCB0byBjb25zaWRlciBzZW5kaW5nIHRoZQ0KcGF0Y2hlcyB3aXRoIEI0
IHJlbGF5IGFzIHdlbGwuDQoNClJlZ2FyZHMsDQpTaGF3bg0KDQo=

