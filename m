Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5423C531DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 06:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpTGUJ/wTr3oq9M2bws85rkSdDDiwv+jP3Zjtop0TM4=; b=M2gHyNcxijVPwNR7p6RRjferfj
	qRGg0ryG+3glIDCjJ0c4xgPK5xaYh4xXTA2nTkM8hVTMS6WsF6+TSJN1jXXQdelcCFjGeGpkLyauK
	zLFA9paaro1pLJ+5nX/QD9ZaZRlppRSrdJRsKRgTU2VyShyNjsm3GEa1kFg/BqWWB2mdLI7Y+lO0u
	flaGqEU8Res0ddpWLutdZrXNUdAcJ/cUSTxAQ5C9U+4iCsPLOc2+BoSf1Zts692mDY/5yb26uocwG
	q8Ne3IC6RV+w00NJAmU/vyuckPUiJFBdlgSlJgLDAi6ygZRG97TrJLdnBN9gDjus2v8h5i5EGNS1p
	PJbhz2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1C0-0000000BZLd-49NC;
	Thu, 22 Aug 2024 06:21:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1BG-0000000BZFD-301p;
	Thu, 22 Aug 2024 06:20:24 +0000
X-UUID: 99e99eb6604e11efb3adad29d29602c1-20240821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=JpTGUJ/wTr3oq9M2bws85rkSdDDiwv+jP3Zjtop0TM4=;
	b=EfyxQ6zlZ8oCiv2pEOKdiTq/AykvBj70p7MT0f7dDH5d2oJTt7dtlLP//IzVC5u+IkN+k3v2cethcKW49Hurrui+ATp5mVfVWtRT6oAbl8PS+62zGMQEPIrCYVjIyzvEGv4ZXw8S0BTdlYkXy5tZ1am57bSyJJZ/ElHQuQwH7Pw=;
X-CID-CACHE: Type:Local,Time:202408212239-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a4913403-fc2c-4f42-84ea-522429df063f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:531efece-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 99e99eb6604e11efb3adad29d29602c1-20240821
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 255770716; Wed, 21 Aug 2024 23:20:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 22 Aug 2024 14:20:12 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 22 Aug 2024 14:20:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq0+BwLMNxozPjJioCq1mizCECTSlVnCTaFkKuyNX3gV03+gp9pw1G096Jqeu6NS9Wg8n9Pr9CAS+Gitb/LVh2nDFCb8PjK5G2R06E/S7j9p5FwEwEnfj6VnB/KRQGkfDANGglfODlE4IwD7FZmNM1wu8Fj7DrJgp+0SHCnZDDGUTk782vi5aZhnlC0hxz8zcpNlvxKDd92rBOThk+mXFEOiKr330kJy9eFuOCBUL05QPIMITvPdAbbFTH0h2FTSiTsN3FHrKWR9FJ0MOiIpXbPyzagTM+awFAXmR0QIcQCJuBkEHM2v2z+/gpOo762rP7Isj+ZGnf9+OzWrWjSJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpTGUJ/wTr3oq9M2bws85rkSdDDiwv+jP3Zjtop0TM4=;
 b=WTZe4ieSfnCf5/FrgY1RPOaZekiS1IXe+DWFbOv39/d0nmNZKGCFS3xOG+Gecwro4bo1U9WVrL/U1XfGZA5KKRHD6bYF87x8oQA3Jz7CkwIm0DMPQzYRCCZIaHHJQUUllPNDSJiARFvzQOSWHuluGjwPEUWjSYojLlKiCDcx1XleVPEK8lGmoJ/Td+1CfDhSmY4FT/Q0cq3hEFNnU0apYW9lR7iGubXCcOyuqcRl6k1u7D+IuFZwrk5oe3Sg2g7zSSEjem0h3QeO/epPcjrsauPsWtT95XGncyXt4aPJlj0vnrau7m+N0RBL1R6Ia8MZjX454i4TJybuUm3I/nivzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpTGUJ/wTr3oq9M2bws85rkSdDDiwv+jP3Zjtop0TM4=;
 b=kjIZckWfkyj+NhrlJ6hX2Pi0c4ZkWjSuhGCqYrPzkkfx8XBulQfMWyeItAMeiUpouSIf76Tvj6YW3bEPv+nCKCpS22Dh9T5iOG35tBjZBsHIk/XVyKs8Fvl3Yv6BT3Zu/q40M6vwfGqdKrufmPyF8n6JclsZ20PBOWzVMm07qtE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7855.apcprd03.prod.outlook.com (2603:1096:990:2d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 06:20:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 06:20:09 +0000
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
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLIzQ3MA
Date: Thu, 22 Aug 2024 06:20:09 +0000
Message-ID: <e581a124dfcdd08f09fb4cd1e36faf1412cd0390.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7855:EE_
x-ms-office365-filtering-correlation-id: 3f7974f3-d447-4e95-cbad-08dcc27278ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M3MxcFdWRUkrcHI3THhIeEhWR2xCMDBnMTdtaDMrSWs1QWNJN2p6aWpjUEwy?=
 =?utf-8?B?dUlWcjdTWGV3RlVuU3lqTXZTU3djemk5aXo4azJQaHgxMENJQjh6RkFaVWFH?=
 =?utf-8?B?UlVNU0l6ait4dlNVSU52TWgxOHIvaThsVGlNZVFTenVmdm5nYWp1a1hVV3RD?=
 =?utf-8?B?WFZZY1doNGlnNElZVUwwQ1VSRXR5T2RhTDgxakc2enhSRVJVSExES2taaWlX?=
 =?utf-8?B?VWFRUGZwZ1pHa0g4Tzg5eFVjREJRcmFrblF2ZHVEaitwb2RORWhiWTROeG5P?=
 =?utf-8?B?N0o4V3R2K0pWMWRkSFVySHlXSDJHYlpDR0VRdkRRWVhlMUFmRXpzSkVoYVpY?=
 =?utf-8?B?ajkxWTFwdWNxUVJWcWxDdUJVMGVTd2lOa09TdGNMTldlZjBjcWJyTXhHd1Va?=
 =?utf-8?B?RGlHQXJHakxST0k5ZUNDY0wrUEc1Y01JT2tBeDZBenAzTTZraURJOTRxSXor?=
 =?utf-8?B?UU1BeHVGMGtDbUVzS0tyOFk2UXdNanc3RzhybnR2NTEyNjR6OGE1b2tmWnRy?=
 =?utf-8?B?OWQyQ1pOMHZURFg4c2NoZ3pqRkJXWE1OYTluUlA3Um10ZEIzK3BiRXhZOElD?=
 =?utf-8?B?RXIzaHNRUy91aTd0eG80eDNVRjI2T0NzRlRjaXg2dTVhN1dad0RtWTVDVERD?=
 =?utf-8?B?ZER0M2JzZ3BxUEhoVFREMEd1Zmo3VTlxdFJIWnpRZUNXNTRpZ1FCZG15OW9H?=
 =?utf-8?B?TTYxczVSWFZlWEZ4S3BWaHFQMkd5VFMvTEM1S1REM0NHV3F6bWlRUkxiWU03?=
 =?utf-8?B?YW5FM3pqSThaVEhwUGJkQm0rYVB2R2o4NWg0M2grSEpzNlJmRVY2ekFmOWVN?=
 =?utf-8?B?WXBEOHpHVE9UVVlIai85bFozOVFnSVBTQSsxYkUra28wUXlSaDkxRzlZQk44?=
 =?utf-8?B?RUVpTUd0MWhVeUVwTVRYc3Y4RnNZeWtIQnNoSnlqUG1CVTRSQU4reE9jcWsz?=
 =?utf-8?B?M0xKTTVmSEdWZVhFakljMituTi9BWGFKVkE0MlM4NEJCOU1jaXYwYkhISm9K?=
 =?utf-8?B?YUdsRUt1ZXNodThsMStPcGRHRlhVZTNDSytlTUhDVXBPL0Z4dC9HSXgwemha?=
 =?utf-8?B?RjJsaGl2U21IRlJ5Q09RM0kvV0YxMEdEYzRBT09Ld1N6czZTS3J6YlVHZVBV?=
 =?utf-8?B?N0ZWZnc4RGhjVXBUOW16OFRWam50amZaanozM2JmRUxqdTcweHFFeGFnK0RP?=
 =?utf-8?B?cnlWZU04UmRKRDk1M2JyL0xYSWo5OEtRNTBQYUpmQ0Ntc1VJMEY0MmRGd0R2?=
 =?utf-8?B?QVFRbHNRcllJTk5SQVJYa0ZlbnNmZHV2cjdhRkZuTkpSa0tDRXI3ZkdDa2pN?=
 =?utf-8?B?WUJUMWhRUXZweElwb3RibkE1SGttckFxb3p0Qm01MThVL1EydEhDREpvdWRE?=
 =?utf-8?B?SDRxcWVBUzI3djZTWkRRSHhibUVMTm85dElvNERYVTE3VFZZMzNrY2NVd3BC?=
 =?utf-8?B?VGRRSUlkaC9SUTgyUGV1WkFCaFNrUXdZUVgwa3pLY1NwUDd2SGJYcTJ0bnpy?=
 =?utf-8?B?bGJSUGJhd3NFWmFHVFBuVzg0YVdsS2dteFgyVFZDeDZtbCtUOTBFVzBDQUFL?=
 =?utf-8?B?eUVkVTh5dTA1N1BBY1pqTkxGWXpTY2E4QnhuVmxLRFRRK2J5K2pKZkpLVkF1?=
 =?utf-8?B?L0JjSUZPWm5rRlA1QnU4ajc4NXRzUHlZVEZaWDY5T0RXcldxUmd4UWd0anJs?=
 =?utf-8?B?VlVDM0lPaDNOY0t3NUdoYmd4RnZtZkUvTDkycUdPV0FNTXJOVVY1a0FlamZT?=
 =?utf-8?B?Uy8wa0dnWENYaXJlTzRQVG8zeFhyWVVrWmhrREFOSi9WaDEwVnRLN0Z5bmp5?=
 =?utf-8?B?OHpwYmZxenJJNG9uUUlQdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEpERllVZUJJMnVheWRLUmQvM1A1dU54blA1cU9wMnZSb0VScHV5RGtISTA2?=
 =?utf-8?B?NGJvdlZZRVYveFFqTzI3Z2NBRGprL0w1Mzk4TUlleTNQdm9wZ1JNL2owMHRY?=
 =?utf-8?B?c3ltbnlCSnMyNEdRVWxCVnhBdmF3STNTMFR2UVFTZGN5UmZwK1FUYnhyNGNX?=
 =?utf-8?B?TGxQZGQxUFQxd0NrQVY0NGtRcTBwYkpMSGloeDU2L01PODRBTTVsRy9jc25o?=
 =?utf-8?B?TXRhbUJtaHdEM2VJeDBvakQyaUtGbzB4MklzNThENWhReHBkS1lJd05HZVJm?=
 =?utf-8?B?U0V0TkUvelc1Zyt4eHdWY1ZKMXFhOU5HN3pwLzA0U2ZvcDlhWWRhQXVyVU5p?=
 =?utf-8?B?dUU3MTluNzNsaXV5MlNVVzJLR2xjYnoyRCtZbnMycktGMjVpNUNlRzFFR2VS?=
 =?utf-8?B?c1Fnb1BBOHlIdUszMUNFVHArKy91NzVMNldSUWZyd01EWGhJUzcvb3lPQXBi?=
 =?utf-8?B?YURqeHIrNytIaVZpTWZyYWlhb0NRYXhET0psbnZBM3REbDh0TFNObGw1bVZj?=
 =?utf-8?B?L2VmdlRIV254ekRSbGg0UXpJdjMxR2kvTHhucnA1THhsNGtiWHo2RkMrNnlR?=
 =?utf-8?B?Wkc3alpkY0lxWWpuL1ZIeEovVkJnQVRKa3VQSEQreC81RGxOcVpIMGxFKytq?=
 =?utf-8?B?WHBmUlV4ajg2T0F2UWNuVlhtZzVtNmNkU2g1ODdCM3JMeDhQdE5DcUF2dTVG?=
 =?utf-8?B?S2Vod1RsMG1vNHpnTFVxd2RWUE51Zm5iNWlOV2syeGQyT0Jlb1NadjZLTmxi?=
 =?utf-8?B?YkRtaEdBamtXZURpNVBSb3VyMHNib1F4WkVEWS90K2pOU3dpZCtaSTRZaW1M?=
 =?utf-8?B?K0ppRUdDUnAvemZ3VWovREVUTFcvZTBEK2UrSFB0b3hUbndzVVpFdWp3VWhK?=
 =?utf-8?B?RHY4c2xKVk1OL1g3QUZpc3VtZU9qSnJ1V2I4VDJLWndDNGVWdXN2RnBQTk84?=
 =?utf-8?B?OUwwSmhYYlh3eVlDYmYyVFNFT2NhRG1KcHc4dzVkK0taekRjbm80TDdvdUpn?=
 =?utf-8?B?d2g3MytaanQ3OVIwY0Zqejlzak1oa3VRcWxJUFN0L3dQL0dvTDBkV3V6M3Mr?=
 =?utf-8?B?R2lnMGZ3QlZTNncyOEkzM3ZZSmdxY096VFFXbUZRR0dsdGtCWERqK0tLNHk1?=
 =?utf-8?B?L3JCQlhjdVFKYkEwZERqdFhWY0ZkQytjcHdEd05HS0ZpeHZmUDJrSkhGdlBn?=
 =?utf-8?B?NGoyR2kzVnY5aXBnZVZiWmozU0hXMXFhVXhoU2dCbDdDYStLaTBKbjhLaUlC?=
 =?utf-8?B?TGx6blFTYWF2czBjcWtvNVlDV2RXME45bHJxOTE2enQ3WE1aY1lPNisvOEF0?=
 =?utf-8?B?TndiOTFhd1ZtcGNlU0tsV0o1WUhXbVpmbk9nYklHVkZlT1JwMEF1dGMxL1Qy?=
 =?utf-8?B?WHpGTjBCczF3dG1rTlNOVG9VMERNeHFQTFJSWGNEcGtvVjNoTVNHalNXemZD?=
 =?utf-8?B?Q0tEMjZFMUZidmhLb0NUeGVneStJcDZkMVc2Y0NTU2NHUllTNFdpQk5qZUl2?=
 =?utf-8?B?RjhtSVoyV1pqamJJTDBkb2liTEdzZDAyS2JkUDB1aGgrakxOeXdDQnc5TnBV?=
 =?utf-8?B?RW5Db2FaWnc1ZnljTzNFcExudndRYWRQQU5CQkhJNE1FMFB6QmJKZGYzak5C?=
 =?utf-8?B?NHpjRUJDM29BVWozcjRBaTJudytXeUpyRHJXdC9zZHJ3ZG8rSzlWNXJteHNT?=
 =?utf-8?B?ak5ScG05OGE1R0xyQXl6YzhvTmpmdDBMMUl6NzBaNEtYWEQyNTdjeko4K3V1?=
 =?utf-8?B?S0E5amYyMmxia2NWc2hjbUl0QTV3Yi9LK2k2VWpLbmNNM2lXdW84YnJ0M3c3?=
 =?utf-8?B?MENPUTljZjdWeXZ3cmJSUDdVbncrbXdCK3JwWjFHWVJCQXlFTW8ycWtUOFB2?=
 =?utf-8?B?TUlLWlJhZittRU1DeElubkhab3kzTk5pVTdwZElEOXZ5UXM4dHdsVWgxRzhO?=
 =?utf-8?B?Yjk1Y0M3NW5KeUxaY1l2RmJWMHRQSVFBdWNGakxhNVhPY0pSTmN6Um9iZlBp?=
 =?utf-8?B?cXRGcXRSLzJDUUtWZ01KeEpFdHEzN05SdXlyYzZKR2kzdFB6UzZQOHNrT0ZG?=
 =?utf-8?B?K2pXVFE2NW1NQzF4MTQ3L1orRnNQWXFzaGUrRTlETFVTTlM5VDlyQytleUlP?=
 =?utf-8?B?cmN0bS82TkJYalgzTEh0ZzNuS2RRWllhbFpEZG9RbVg2ckJTcUpkL1owTGtk?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A0EEA85E19CB64E8C48B298B5596CB1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7974f3-d447-4e95-cbad-08dcc27278ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 06:20:09.0277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sqxna73XpwSFTLzi5j/fSr2U9fWqzhCbeQf5Itm8YnVQsc8lox9xmFOZyPb0fujXhGAmhYBvJCsu03ADGEtlZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7855
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.513800-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hfPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxXA7rTaHAw771A
	/V6RVDjDMqtZwXDJcJxiPmy8WTo67rNUVnqixiMOGVyS87Wb4lzSv+oK79xjnUYvSDWdWaRh8ha
	W4U9IrFqFWYX2TPbDEjkjHQF/IwVgR3y7dMGQHeOiAZ3zAhQYguEpCHUsKYYGmyiLZetSf8n5kv
	mj69FXvKEwgORH8p/AjaPj0W1qn0SujVRFkkVsm31GOBVyagTXBDb5hNvZE37325xQKU6OBLefz
	4PWRwxiJoIbvCw4up9yzmLiKOtYp9zudH/FIJnmadITXuW9+OTYa0+t775rZVr/VRGx0IR2+Uo4
	vXq+qmzIizeCsI6wA0LUmjyL3DZSqHzcKNbZb2s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.513800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EDF82764D3A0D9EAC0222E8B1EC2BBDA24A38FB0D0E89AC4CDD03BCE721447F02000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_232022_792935_0FC74464 
X-CRM114-Status: GOOD (  14.35  )
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
DQoNCj4gKw0KPiArc3RhdGljIGludCBkcF90eF9oZGNwMnhfcmVhZF9sY19zZW5kX2xwcmltZShz
dHJ1Y3QgbXRrX2hkY3BfaW5mbyAqaGRjcF9pbmZvKQ0KPiArew0KPiArCXN0cnVjdCBtdGtfZHAg
Km10a19kcCA9IGNvbnRhaW5lcl9vZihoZGNwX2luZm8sIHN0cnVjdCBtdGtfZHAsIGhkY3BfaW5m
byk7DQo+ICsJc3NpemVfdCByZXQ7DQo+ICsNCj4gKwlkZXZfZGJnKG10a19kcC0+ZGV2LCAiW0hE
Q1AyLlhdIEhEQ1BfMl8yX0xDX1NFTkRfTFBSSU1FXG4iKTsNCj4gKw0KPiArCW1kZWxheShIRENQ
XzJfMl9EUF9MUFJJTUVfVElNRU9VVF9NUyk7DQo+ICsNCj4gKwlyZXQgPSBkcm1fZHBfZHBjZF9y
ZWFkKCZtdGtfZHAtPmF1eCwgRFBfSERDUF8yXzJfTENfU0VORF9MUFJJTUVfT0ZGU0VULA0KPiAr
CQkJICAgICAgIGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3J4LnNlbmRfbHByaW1lLmxfcHJp
bWUsDQo+ICsJCUhEQ1BfMl8yX0xfUFJJTUVfTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJ
cmV0dXJuIHJldDsNCj4gKw0KPiArCXJldHVybiAwOw0KDQpUaGlzIGZ1bmN0aW9uIGlzIGNhbGxl
ZCBvbmx5IGJ5IGRwX3R4X2hkY3AyeF9sb2NhbGl0eV9jaGVjaygpLCBhbmQgdGhpcyBmdW5jdGlv
biBqdXN0IGRvZXMgdHdvIHRoaW5ncy4NClNvIG1lcmdlIHRoaXMgZnVuY3Rpb24gaW50byBkcF90
eF9oZGNwMnhfbG9jYWxpdHlfY2hlY2soKS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK30NCj4gKw0K

