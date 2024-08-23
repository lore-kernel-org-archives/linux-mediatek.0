Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C27AC5321E
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 02:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSZ5gKFzKpmkVyQ8I0j2VPnMKIpqpVu+agAnvqinzeo=; b=qxCAKgwpVoyGxU0Q1CpVDJ0exh
	1W5wWsw2h2Q0TdjZ0D1Tx2y417o0zSTcLcC1rQ20EJrh4nUY7ozCM1mLLqHyB32jeQ0vsXT6zIAkF
	mOkCqHDbXDHJOsnojIpp7VsyWDZQq5tZSC3eO6gYOWcnmhzlo0fSe7DZtPvBqIIdIdfJ3v6eIZOMZ
	HQIiRYjzaGjqJWhRt7uTWtIa/KIrGPeOFP1NjhUQTK8Gv5gSSqZTm6CqUA2lLU4Kir1RIYR23guec
	PaUcEMuvxhNgkt0HYM5Gq8N3aUylyP49w7Cl6wyrOtjsauLABvJiG048spO9CyjFwkOvVlLViXa/a
	8/Mbnl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shKJd-0000000Ey5M-2UhP;
	Fri, 23 Aug 2024 02:46:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shKIq-0000000Exvl-2kn7;
	Fri, 23 Aug 2024 02:45:30 +0000
X-UUID: bdda5e1860f911efba0aef63c0775dbf-20240822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cSZ5gKFzKpmkVyQ8I0j2VPnMKIpqpVu+agAnvqinzeo=;
	b=BJ4QTZ16g2XejKpNqZ6lk0Zp1/XHUhQwEmm67CdOKjzKGvPWipEnH/jGjb7rzPYHIprO+WoXFWuIBXBHf/t/FVS6sGqcsNPje/ex88cRZl4QoJB9vNIj32CvmbgppEF3yeFxFR0vBxth9iviceRCsL4ZE+hN19TerhtdufduIL4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1bbee4fb-74f1-4396-9078-cfbc78693b50,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:cf67ccbe-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: bdda5e1860f911efba0aef63c0775dbf-20240822
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2067355899; Thu, 22 Aug 2024 19:45:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 22 Aug 2024 19:44:48 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 23 Aug 2024 10:44:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDa0V91BHsI6GYmJNjAMAnGsI7NKZTYguxz6QuBYHu+/yhSaWhxn5VhAr3CUTzs4s0vv4xFdmhX6XQbR2QXLOSNV8AxVPj7Ibtnq5QTpdq59TEUtYJZtENKdN+Y0x93LACMQLc4DMsXQWq/OFw8WDQYFxIQse915gQI9sibFFwtnL6Gt6eyd6bGLyvUmgvv0RTEPlQ4NDqL4NWF4PFaEi2GK3XRDbVb6vjnh1TT/3o8250OLTJ8w4E9Z0+PnSS/VNO2u8cu6Yuntr5SBizB2XBvoWAIn2ldNF666BbQYtim0+E0YWPw9HFjuJtPaWYF2Dkgmem9mKADbdCiCDaHtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSZ5gKFzKpmkVyQ8I0j2VPnMKIpqpVu+agAnvqinzeo=;
 b=NExLXAFUfXsFGjpHg03lOcjoeOdcOv1cLKr5WEMjWijRJAbiHF0eAp+7iOKuLcCSJdwFBF7pdROJLKKl2erz+jhvAlJ2QaovKMqIIqoaGJ6LaEEkC2+/DzB6j/UHnOfsGQ8YSAkWFGPwiMjjNDn8VpoM1Ex9bMxunHiI7TWAoVKiZHb3B13NOXLvA3XBN058+26qIbx4l37+KDk8brgqzGAukGbwNmzqwOCoc1yJkmylpz0LGh5hzKFJckAXBWYardBlDAEtUHhXVDEZWEG0agMqZiediFbT+IDXugywCulvpQZb+6pMxlAFj09EZFIWdqme2ozkC0VtLJ72po3hCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSZ5gKFzKpmkVyQ8I0j2VPnMKIpqpVu+agAnvqinzeo=;
 b=i1mHeJrwhkVAq0VCx1v0FK6VqrDBZ/NmyMO9/5ohMDEU6vAP+HRd8+F8m3f0O683vbFpZy5dzAY1ZwMveMiCHbqvwhI+xmLRxLdkNo75CLsF2Mp3YkHcmS6MAkRfIVQR0KxVyZ2stq1VdXQXXdwdS59DK9F0OTxOyPGq2/HpT9A=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8790.apcprd03.prod.outlook.com (2603:1096:101:202::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 02:44:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 02:44:45 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLI0mZoA
Date: Fri, 23 Aug 2024 02:44:45 +0000
Message-ID: <83db4ae9af159a2cf4ccce9b98c07824597500c5.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
	 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8790:EE_
x-ms-office365-filtering-correlation-id: a2271f93-01fc-43f9-de4b-08dcc31d8c4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Lzd2WTdKYzJkL2VaVUFOalV5amovd2U4b29YKzJEeitLdXhJVlByUlhwUFRp?=
 =?utf-8?B?bXNyUmZNKzBBS0c3ZUtiQ0pRdFdCTWxXWFlpMzkya3hHT3RVZVBtckVCZjZD?=
 =?utf-8?B?c1RhYnV1N3Frb3Vtem5rRXlaMmU0UllTOWovVllvdW1sZ1lwaUxOdXk0QkF5?=
 =?utf-8?B?VmEvMWM2dXFUV0Z1dzZ3V3J1ZldveTI4Y3AwLytiendzWGVZcFlGc3hvRWM1?=
 =?utf-8?B?MG5RMUZqMi8yUUp5ZVNDWUFUN2x5UEtKd1VRMm0yUGRWNlg0UkJxbHhXVlE3?=
 =?utf-8?B?SUlCZnVDUGY1d0xTRVRTZVpWS3NYQTRnQ0hiZzFqdjhRV1BhTldSL3ZEbzY2?=
 =?utf-8?B?UngyNFpXM3VTWXpGOFppQ1hIV0hDY1RTQ1hzOHJENk1mVVZ4ZzhyUEczNmdC?=
 =?utf-8?B?WmJqRkVSaDJyckQ2VGUwelhDbEljSUpGNWhiSHdZZTV3dUNSaUhhcWR2M2o0?=
 =?utf-8?B?TmN1aVZnMXh2TTY1LzhaOVdEQStIeFdCTXFDcEZHZnFIS1FyRUNta3MvcjRY?=
 =?utf-8?B?WXhpYlgvR2Qxa2JvdHg3dU1TK1JjaG9QRVdzZDArK1VkTHV5ZmVZenNZZVBF?=
 =?utf-8?B?cEVtdFpBaisxMHpsV2pWVUVySEtpbWV1NklDUDJMZThYcGtTZ2ZUemgxZjU4?=
 =?utf-8?B?Y3hmOElGcm1iMnIyWUdSZHliL0F3VWxldm9aQnMvN1FTWTdpaWhWRVBTSzNy?=
 =?utf-8?B?M2F3amlORlBYM1VCdDBmaTRlS2Zhamx1OWtXemlPMUYwYTcreWcxTUVZYklH?=
 =?utf-8?B?OFpKSDdLRWlneUZzWVhFQk5RL0RZcGtlWTJ6dVJRWHkwdk1yR2JreHB6K3JB?=
 =?utf-8?B?b0hITUh3ZnYrTWFSWUc5cTdrbWVrSXRQUlRTQmJLdDZSa05YcnpBU0EvRStm?=
 =?utf-8?B?VzYwTFo0ZW5ySXREaDNqSWdzK3RnZVJwemN2Q3c1ZlByWnh5NWVLaU83Rzdn?=
 =?utf-8?B?akZpMHZuejBNbzQxVDVpTVpXMUREeC92cm14N2NiN3lWUm9wUDZubjBreGYy?=
 =?utf-8?B?MmpkVjdFSUhKbjZadlBOTHNiaGFGNlNYZUszWm91Vm1iMUNKcXM3WmlQR3hF?=
 =?utf-8?B?UjNWRGxYOXJJc3ZQMlBYNVNsRDg4aXM1Y0dJYVBhQXdTMm54cElLL0t4RE1q?=
 =?utf-8?B?YmtlOUNLY2ROcmdmcU9LTi8xd2N1VUhTbEhZUk90MDZlQXpaQTlHQXJLV3Ru?=
 =?utf-8?B?MFlDdFhrT1F6ekRWYU9IZWVMQzZId2U0QTROOS9iRkxuL2szMDd2clRxTFF0?=
 =?utf-8?B?R3YvMyt4bGtUVkgyaU1ESDYyV0plMmdOSW54RkdSSm1xNHBTZ21ka1Blb29M?=
 =?utf-8?B?V3hScDhjWSt0RnY0K3c2Q25GRlBDRFBrTkxkYXBDOFBBWU5iaDRlRHdLZDQz?=
 =?utf-8?B?V1BHV0FFZnd2RWRwZkV0dWtmNW9MMDRaQ09xaFlFNm1zbUo4QjZjUlRoWStk?=
 =?utf-8?B?bDk4bmRlZnF5eTRwV2NmQThzMVhUM1hrSWtXK1NzMzlORWxDNFRQYy96TUtF?=
 =?utf-8?B?RXo5TWNpT0N3NmdNYzVBL2hya2ovSytGaVRNdUpzUXpyTnZJdzZzUE40UTQx?=
 =?utf-8?B?NlIwUUdKVmdPNmVjQ1NoQXcyQnlSOEFacjhJYTEzYnQ3Wk11aVNDY3ZsL3hn?=
 =?utf-8?B?VEEvVXBUSi9pOWkxUmtONjBNbWxNSEpQQ0dHU0ZmWXM0RUpzem80bytWNWxF?=
 =?utf-8?B?TzM2Y3FlaWZOU0JFNEVyUWVHRmFxNnp2b2IwcDF6ZUM1QXpYNi9tamVIR0wx?=
 =?utf-8?B?dmZ6WDBFNTNRalU1Y0VtSXpqenFJaHNGOHVFZklPdjExSkdSN2FXd2JmT0VF?=
 =?utf-8?Q?spwY/zyEiL0FI9m3TiiyOcBgHvYilmOM+MBgc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmVkcHJpL1hNN3o5S1hwRnlTbDNOQlBrcXJvVHdsN0I5RlZFanJJNXBIc1dM?=
 =?utf-8?B?ZU90NVVxV0ZFc3VWY2R1dThjVU92N3YyOTM4VGxGYUhpVU92cnkxQ0t2cHp2?=
 =?utf-8?B?QzZSaDNkby9SWFhCTkRSNXlwVENjRXI3V3oxM3ZNdW9TYUtRV0d1NC9Dcm94?=
 =?utf-8?B?SlR3QldsU2ZSZHhqQ2oxaXlRN1RwWElTaUgyMTZPSnVmWmNVc3RPUE85blVF?=
 =?utf-8?B?YkQwdlI0bmhNbmZXZXFsVFhOK0tZNTZCSEtVeFBvaXk1Q0NHR0JHMkRaSS9T?=
 =?utf-8?B?cEgxb2x6SG9DMC80VkpHTUhqaWJTN3Ard3JhYXFqdWpCOGdmMnRuR2gvcncr?=
 =?utf-8?B?QkR5Zzd4dmVDVUIxbyt6Z2xCUXdLNFZhdndONFp5MVZOOEwyYnpBMGk0MVlj?=
 =?utf-8?B?cEp1YjJtQ1MrQ2FhNHcvZmJ2R1JlV1ZQMytPQWNFOS90WXN2YWRlRXB6aWZt?=
 =?utf-8?B?dVF4Zi9ZREVnVUw5SGR4WE5aU0FVUE9KbHVPRFJ0WGl1ditudEZJWFYrbGVL?=
 =?utf-8?B?bFJkbDlyd0ZCRWJQYks4REdObUN5QW1tZGlkVzdXLytFL2dBOEUvUzQ3cDFk?=
 =?utf-8?B?TmhMSG9yMkVIQmt3R1EzbVF4eGxSWXRJRFlEREpwUHM4R2d0bmpRTml0aUp3?=
 =?utf-8?B?WURLZDdVdTdGZmkyUHRLU0lPOStJbU9ZdzVQcDFKMk9YdE9WSmFXRHA1ZnBr?=
 =?utf-8?B?S2xieHB1TUNUeWV2cVFCN1A2VWxscmNSVzFGVXgvK3hpczlZVXp2VHpZODV1?=
 =?utf-8?B?bEk2azhrRU4xK3VsakFJYUtSZzVlTEZpUW9IQnFiVnpJZ05oU25qUHdEMXA2?=
 =?utf-8?B?YlNkOW1WQi9Calc2Qld5djE5MW5MM1pESnJ6b24va3BRUHM5RWFiSHFXSlFH?=
 =?utf-8?B?eHBlK2xYbjF5RUJUeVZCcDBrd0RISGhrMTRJSFpjejBFbzFkODZMRFhOQzNr?=
 =?utf-8?B?OFc0LzhqS1dlUGl2eTAvWnVzdTZ1eU1iOHl5b0FDaEFDZ0xWOFJNRkg4TW5D?=
 =?utf-8?B?b0FxM0xoOVdkVjd4L0JJUTlyTjFBY2FITWJXRWFSOS9sakNvc3V1bHQzUGpF?=
 =?utf-8?B?RmpvRWxPMk8yZkhJcys3Q2xzNU53N2VFd3dRUDd2QmFYSVluVVgwaVAwMVhi?=
 =?utf-8?B?cjdKQVhkUG45OTNnRFljb1ZBRGw2Z0NJYmhsYlRQSFY5bk50eFpDNVBSdHJu?=
 =?utf-8?B?cFVCQ2FkbGJKR3RGTEppRlVNYWlaWW0yczhJcW44b3VCOElHUTNSQlhpQnhh?=
 =?utf-8?B?WDdYR2NUVFQyTlVtY3ZHaHB6eXJCWGdQNWhIUFZXeWcyRFI4SW9KOURkNHU4?=
 =?utf-8?B?YU16d1ZlRmJnc2Z2WUYyZzQ3czVCVnk5b2twN3lXTHZYQjg2ZjA3Mnc2UTZS?=
 =?utf-8?B?QkJMcVMyQkdXWlkxM0VzNml3Z0lyVS8vM1BzSTNCaCtvckpBR0J6N2xZdXo2?=
 =?utf-8?B?S1lGT2dSUURhdTZtV0wweEVVR051bExkaml6RzYwTVpkazZkWGZaRTNBUWNx?=
 =?utf-8?B?dGRVMlZCd01uemNZMXNob1llS21yZnhJMTlkL1ZLYWZNV0MzcElZaWV1SEwv?=
 =?utf-8?B?ckpPdHpWNHlKZVRLWWFodUNDb3M2SzVTdjRScUVZckRxMTJWdU9BMjRCdnlj?=
 =?utf-8?B?Y3RVTWdUV1BPWkEzdmc2RmltUkVSRjlTU0Z4R3k4OFVJSUYzNFFiOEFxTHRn?=
 =?utf-8?B?SFRMV0o5TThpK3ErZTRlbFZEc1ZTSmgxSy94NzhFQ1p0NzJxNXdIdmRQMXM0?=
 =?utf-8?B?bm5yWDl0ZHZYZm5xZlBYbzZnNDZXSXZtNWJSV3lwL2ZkQmhuazdBSTQ1bEpD?=
 =?utf-8?B?SWZNSVBSWVBNK1BUNzROOVBtWGdjZ1VQeXMxZmQ0cFBqZnU1anRtMEJsVVhl?=
 =?utf-8?B?VzdmOFNxWW9UWUp2SUd2blBkRXZLazUrYmxHc0EyNlJZcVdyaGwyWS9JWGlJ?=
 =?utf-8?B?bW9jMlFmd3F0WkZENXRvU2t6Qkd2OTFkclJJZTljTURlTS9FNUduYWhmcmhy?=
 =?utf-8?B?cXlWbXlwd0FkWlcwVkNpR0daVlN6OTdETld6WThuZmthREY1TUdWR2FqazJ5?=
 =?utf-8?B?czA0Skp4M3g2cHp6bitzY1JTSkd6QXJQVWFSZ29pQVBLc0hQTVNtUWE4ZEE0?=
 =?utf-8?Q?eyzYvsmI8qZSZYSKAjQsIh2/0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE14122ED1610B42B782F7A573A6F72E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2271f93-01fc-43f9-de4b-08dcc31d8c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 02:44:45.4749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00vi3XYPQ5o9z5g3l97mUtbynFjNzSATVTa08qmJmLtvFP6HiGySkQZhA0YMbQFwXTrULTc18XvEvOQIJNhcWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_194528_716658_FB673C2E 
X-CRM114-Status: GOOD (  14.68  )
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

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gK3N0YXRpYyBpbnQgZHBfdHhfaGRjcDJ4X3dyaXRlX3NrZV9zZW5kX2VrcyhzdHJ1Y3Qg
bXRrX2hkY3BfaW5mbyAqaGRjcF9pbmZvKQ0KPiArew0KPiArCXN0cnVjdCBtdGtfZHAgKm10a19k
cCA9IGNvbnRhaW5lcl9vZihoZGNwX2luZm8sIHN0cnVjdCBtdGtfZHAsIGhkY3BfaW5mbyk7DQo+
ICsJc3NpemVfdCByZXQ7DQo+ICsNCj4gKwlkZXZfZGJnKG10a19kcC0+ZGV2LCAiW0hEQ1AyLlhd
IEhEQ1BfMl8yX1NLRV9TRU5EX0VLU1xuIik7DQo+ICsNCj4gKwlyZXQgPSBkcm1fZHBfZHBjZF93
cml0ZSgmbXRrX2RwLT5hdXgsIERQX0hEQ1BfMl8yX1NLRV9TRU5EX0VLU19PRkZTRVQsDQo+ICsJ
CQkJaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3BfdHguc2VuZF9la3MuZV9ka2V5X2tzLA0KPiAr
CQlIRENQXzJfMl9FX0RLRVlfS1NfTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJu
IHJldDsNCj4gKw0KPiArCXJldCA9IGRybV9kcF9kcGNkX3dyaXRlKCZtdGtfZHAtPmF1eCwgRFBf
SERDUF8yXzJfUkVHX1JJVl9PRkZTRVQsDQo+ICsJCQkJaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhk
Y3BfdHguc2VuZF9la3Mucml2LCBIRENQXzJfMl9SSVZfTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkN
Cj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldHVybiAwOw0KDQpUaGlzIGZ1bmN0aW9uIGlz
IGNhbGxlZCBvbmx5IGJ5IGRwX3R4X2hkY3AyeF9zZXNzaW9uX2tleV9leGNoYW5nZSgpIGFuZCBv
bmx5IGRvZXMgdHdvIHRoaW5ncy4NClNvIG1lcmdlIHRoaXMgZnVuY3Rpb24gaW50byBkcF90eF9o
ZGNwMnhfc2Vzc2lvbl9rZXlfZXhjaGFuZ2UoKS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK30NCj4g
Kw0K

