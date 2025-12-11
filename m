Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6294CD41C23
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 11:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7xdT1rkR/FXJ1cU00vO0efEL9EEJ3MP0jOaDHlPiFk=; b=u9RaayBc8aHAwrDxGVhJ1Al3Mf
	EL24eN8i2RNrfSMEtwfxUBRGQv88FsTSXCMTIuIVRbNKF1LF1lc88mLVv90xHB3Hf34jkzCDvxDsi
	CABwiApjUSw8dKUYvR83z/EyVgBXQEB/QljLfB60BWGlG8hoKIwjG2e4BqWPNaXaEvklXqAc6osFl
	NEqgmS3vDRWVb0RvcLGi+PWswUQyk5fqt45KcFv22SgPjNE7A1pCgqfIDrhJ/15+UHI+Pt5/OZUYE
	w51zYO5tfXudmmSXMvr75myme4J1HWTn4D+/CxT0Ec7RKH4hXTq8Tt/Yhal3qEwY9kPk6YnnT+3CX
	r6It7KGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTexv-0000000GY15-3dgf;
	Thu, 11 Dec 2025 11:36:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vText-0000000GY0R-0yA0
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 11:36:10 +0000
X-UUID: 93127d7ad68511f09f706fa2197c6ceb-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=G7xdT1rkR/FXJ1cU00vO0efEL9EEJ3MP0jOaDHlPiFk=;
	b=lcdG8QfWN1KSbEtyodey5IBKE3PrPfpV+t/S41hmdZkYbggF1hW721xP3Nh6EfpYZKiYN6gxggzaeh1Aepxl0/Z1bSwKudghZQ7QkMpbAFNFl02jBsoEwVX5VunAGbjeq4/lE4ME5NAY8vjiT1DlGuCbYX5tRWCCAYca4nN6fS4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:502591ce-023f-4b3e-b68b-46f4bee3c46e,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:0d2d15aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 93127d7ad68511f09f706fa2197c6ceb-20251211
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1974775383; Thu, 11 Dec 2025 04:36:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 11 Dec 2025 19:36:01 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 11 Dec 2025 19:36:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIbBupsFulwW6X7a9ERGcON+eQ6NCkSLH0B/IQpgMJFNCC1MoOBfVmdPp7LGPGSDoT+pffTvFs7DZq5r1ZlDJcC1YXrT6nCgdcVNuQfB4QRBHoWBiebFhEgQqwo85MegzwPkxWy4bZa3nwiLUeni05edfAa/VRpNiBHXOJwIBA3cWesc9bxfP61IXQpb0muGSWr0i1SXX6Ui2PweU7pBLoPKSfAMI89O5ZO+p/jS4nFM10uRKi7YUlqbR5liTfB4yxprU+NRLhXUaYSlEkhw+JHaOR0kv8g9clP8KyQh+QmOnYpol9fpcwE/hfqngeIG7cZ25ezVEpDjb94xTeF9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7xdT1rkR/FXJ1cU00vO0efEL9EEJ3MP0jOaDHlPiFk=;
 b=Gl5WMu5GBWEnbN+ZUltUR7V6qsSfTl6bwpSEuGUytCf1Jy1HuyXboHlhvc0oXr97B7k4JNV6Ig+Aig+70LGTmloWoGdYvtjlzkrHAP3L+HaZPo9StIlmxsu4nji4dOHIiaCSZwiylzaENq60xW0oSv17O82URpgu1ZCQ+MNw4MtqmSjWthoaTFpqVCdb5qRFNQC4SI0Pjj0s8lt3+tS7waQKA0FqQYZWvBb4UOxkjtFxYbPeCxAFePiN0qky0174OfI6LIQFUMRmr0V0MQvUuQhV78C946SI3ZfcenRzaqt3StIR0MRFKS+Mc8pOQxwXIcB/umT3scLvPnuhxUMVmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7xdT1rkR/FXJ1cU00vO0efEL9EEJ3MP0jOaDHlPiFk=;
 b=LcZgTDwjyYWyzYaoUmuOgM5McWZbQfn2tW9D95NCpizF9R0ZwXG4v17uzQkQgS7BqR46f8Iou8yKFJibf3zattkyEbGo4ajTnnVQquJmzsgfyfX/RDsc3OMUQ2TaorgKjQs++AQZCzDAi5ip/dcDLgCiZVn377LVqjkdDRM9umU=
Received: from TYZPR03MB5741.apcprd03.prod.outlook.com (2603:1096:400:72::8)
 by TYZPR03MB7961.apcprd03.prod.outlook.com (2603:1096:400:458::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 11:35:57 +0000
Received: from TYZPR03MB5741.apcprd03.prod.outlook.com
 ([fe80::110c:1c24:758d:5daf]) by TYZPR03MB5741.apcprd03.prod.outlook.com
 ([fe80::110c:1c24:758d:5daf%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:35:57 +0000
From: =?utf-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>
To: "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>
CC: =?utf-8?B?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
	=?utf-8?B?U3RldmUgTGVlICjmnY7oppboqqAp?= <steve.lee@mediatek.com>,
	"marcel@holtmann.org" <marcel@holtmann.org>,
	=?utf-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"johan.hedberg@gmail.com" <johan.hedberg@gmail.com>, Sean Wang
	<Sean.Wang@mediatek.com>, "linux-bluetooth@vger.kernel.org"
	<linux-bluetooth@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1] Bluetooth: btmtk: Trigger reset on firmware download
 failure
Thread-Topic: [PATCH v1] Bluetooth: btmtk: Trigger reset on firmware download
 failure
Thread-Index: AQHcaQQy/FgAcDhNO02a3RDMTdVbCLUbYGOAgADyNQA=
Date: Thu, 11 Dec 2025 11:35:57 +0000
Message-ID: <8b1fb854a90cca58d65443cba3d2883b73aea0fc.camel@mediatek.com>
References: <20251209120559.2991698-1-chris.lu@mediatek.com>
	 <CABBYNZ+o_ewu7fwDLSW0c4BEosG-CqugK+7JgY3TBf2PcPrm8A@mail.gmail.com>
In-Reply-To: <CABBYNZ+o_ewu7fwDLSW0c4BEosG-CqugK+7JgY3TBf2PcPrm8A@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5741:EE_|TYZPR03MB7961:EE_
x-ms-office365-filtering-correlation-id: ff231289-a667-415a-de7f-08de38a97393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SUVtaStreEwzamk4RnV1T3VTMkdmLzlOTWovOUtaOWtyalBmenN3ODVXcnZD?=
 =?utf-8?B?OEYzNlJQMnFTeE5BTWVYVFBHaStsdHNlVGdXa0poZ0dtU2Z0VFQzUDNHSGR3?=
 =?utf-8?B?cFhJNUVDelZPdnJaMVZGNUFSNWZ6bldYQm1yNGtPRUY2VGxSQXpOWEF5eW1Z?=
 =?utf-8?B?RDNISXJNYWM2WkRtU1d1aXgrUHZ1VmljZDlQRVpSdFhDSGxJN0hvYlpyMkhx?=
 =?utf-8?B?dndmRFZGZFNJbkV5aThJVTlSL3RkbHdhbjkwVkhodHREQWxzL0VMcDhlSGU3?=
 =?utf-8?B?dGdqaUpnaGtqeG1ROGwrSHdsQm9HaDVJSnkwcnZ2UlAzNVpmVDFDV2xwWHZj?=
 =?utf-8?B?eWREMm5VMXhQUFBzNVNPYVpUSFNnU3IwN2s4MVdWNDJCVisvU3RhS0EwVTln?=
 =?utf-8?B?eDJPcllxRU8vVy9oWGpESlBHcnpySTRWbUtpNkhORC9GSVpwRFNNOVRDQkkr?=
 =?utf-8?B?YjZ2ZmtPZ2c3QkVuTWh1ak5LWlJQbkpPQ0ZJQk5heGpUTVNIcXdpUjBJNHJB?=
 =?utf-8?B?dVF2eXI5dnVHUkt4aWhJK2t1Qy90THR6TktkbmxBbEJ0NFd6S1hDNWRMRmor?=
 =?utf-8?B?Z0pScm5uSmdSYTM3TjkzRFk2aXlhcG1QNDBDeTg0SEhsRHRFTzJBREcvODVw?=
 =?utf-8?B?bXhzMUs0TlYvWjNlU2Foc2t0aXlzM3F2bEVSM1QraXErMEVEK2pWbnM1dms0?=
 =?utf-8?B?Z2Jia3I4SEh6QzQ4NCtkZCtxS1l0MmVWU2ozWC9CUVhiNVRld1RpT0xMUkMw?=
 =?utf-8?B?M3ZOL2JEcW13K3FXemVUL2RKbkk5RGlwZ0lBOWxKeFZNUzZndlo0eU5tcHhQ?=
 =?utf-8?B?VUNNTmkrNlEydHF1VHFnaU5pTnViMVAzbGxQVlNwcU9nb1VTRnZXV2xDRlEy?=
 =?utf-8?B?YXdYOEFHWnc2cWlnZWpINVVNeGV0Y3V3cW16YmR1bldpNFMwRE10V2dWek83?=
 =?utf-8?B?ZTJuOUtPRkFPejJJNFVXVTZCdU5aekJ4aVlXeVpVT2J0UFk5cFh3Sk5GZHI4?=
 =?utf-8?B?d09HUDJVZitmZWxUOWxaUHFpREpLSG9ubTNNUHY2b0x6ZWpsallKS3E2ejFa?=
 =?utf-8?B?M2tHTHREUmlwUWY5MVBuSlQ5aThxZStseVUvL2NsazRZdHJlRWkxb3hIV2JF?=
 =?utf-8?B?dEloOUYxNDZESlh0L2dNNWgxeWROclhIUmJrQnlBVWhQWHZyNmJMQjVKd2pp?=
 =?utf-8?B?a08wUWRZMXR3ZTVPNVhxR1hVRHpDNExnK1FoWmpsem5USVdSRGJtbnhKT1d2?=
 =?utf-8?B?NG9QQVZRYjRYdk14Mmg4bUxVMHB3NGpscEpkOE04MlNSMi9GaWJOdWtVZXJN?=
 =?utf-8?B?WHVQbmlKU1NCdnVIZnhvMjZsODFlbmc3aHVwRGExMklPcXZEMUsyTnZaQU9N?=
 =?utf-8?B?bXdZYmsrTE9NVUl5K21VaFRxVmdiYXdJNlZDSGJuVzR0QlVXRURxbnpUb2kv?=
 =?utf-8?B?a3VMb1Rac1FrQzVieXMza01mWVkyand3MCt3ZlovQXlrc0EyY213NklFbnRn?=
 =?utf-8?B?V0dUSFBXWm9KVDBzZlg5YmRwZExNZTlwMENCQWVJempkUEtRdklYakxpdmZJ?=
 =?utf-8?B?QzZDUjdIVGhxVmdOcHFwVHpQQWZCQXVHdExtK1d6S3F5UlZxWS83V2RzM1h2?=
 =?utf-8?B?VGNqV0grRnFRek90S0VZUlNuMTRBejVOaTMra3JYb3VaNmMzS2t2Z2ZSYWRn?=
 =?utf-8?B?dy81VXJUUFN4dWVXV2xSNk52cGlEMVN4dXFhbzhjK3BkNzRJbDAwOFBHMWJF?=
 =?utf-8?B?R1BMcHdSSmRLRENnMmJiTnplN3BvejU4QmlxbWViL29mY2gzMm11Z25NelFr?=
 =?utf-8?B?UG5ETjZESDR6QndLQTEwdG9udEVKVnp1ZzJTa3hWZzFreFZjTW16cW9pUnYy?=
 =?utf-8?B?eFhkdVdLVDlqdUtDMkluT2c5dkxJT3dQUGtISjdnNU5ZZUZVU0ovUjBsNWpF?=
 =?utf-8?B?NTJZM2hPc1hkTWdvOFZhWU0rbzhwN254ck5FbzVIQzNRVDVLQTJ3UEVXU28r?=
 =?utf-8?B?WUU2VFVPclBFQ0VGNUc2L2I3Zm1JZXpHZWJ1K1NrZG10Q29FSURMU0l1RUl0?=
 =?utf-8?Q?u5UO/k?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5741.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjcwMnJYSy9lY0tHNUJXOU9ld1FsTGtubXFRbGFSbWc0YkJCamtHeGRka2hj?=
 =?utf-8?B?UHFONzZuWXJSc1pmQVlldjczcDBTRWtEemRQaW0rYjBScW82YkNHbXhsbVZh?=
 =?utf-8?B?RXhuTTlHRG1UNEdWN3FUNUh0RUhtdlRxbThDUlZua2pLSmVBY21RVk96cmNq?=
 =?utf-8?B?SS9LWExnSS83RlV4T2tJYVJINkZUcTBhZGczQ2lEa0Rvd1hpdzl6NHlacXlP?=
 =?utf-8?B?WnZ3aVNWZGduTHlZR29abzM5aEZWZlFDcTdrc2ZEbGE1djE0cytEME9wTnYv?=
 =?utf-8?B?UmhRMTJIcFMyb1NlK2U5a0RZV1BaYjVVTHlaZWhqcS9oSkdFTElnNVZZeUJz?=
 =?utf-8?B?TE9wRm41MHc3OGtQd2hiQU9WNE9hLy91VzliL2QyQ2NsWUE0M0g2TGUrUElZ?=
 =?utf-8?B?Y1NjcTgwRWpUUXN2NFdFcmJZQzlrNlFWZjh2U2NFUFpTMVh1TkFVVGNsN240?=
 =?utf-8?B?aXZoQ0dRYUhicWdPa0E3ZEVnZi82OVpYNkVNRUphc0dLaE5IRGIvVjQxOVB6?=
 =?utf-8?B?RmFVWGNnZHNxMnEzTWJLNWJpdGxJVTAxSVJHd3hSMTNqeFg2WkVTRUpLQjYz?=
 =?utf-8?B?RXZ3Y3dyK2h2OUVXWW9iT29hcmpLWUM4SjRkQ2RDV21qM3Jidm51cXFnd2w2?=
 =?utf-8?B?QzVFSWxhdm9NWGtoNUtDY1FlWFpERllGTHgvdDMzczBqMVJ2VmlqQkEyem05?=
 =?utf-8?B?eTFaL1ZQbmQ1TW1Ja2dsMVZDMzR5RXRoOWEwM2dNZ2RsZVdLUjNPVkpKcjFR?=
 =?utf-8?B?c1U5M2NHRVRFbFNOUlhEVU9SbjBOQkpGTUJRVVNnakhzVyt0SVNseWIyaDhM?=
 =?utf-8?B?ZHAweW9EOUE0eGZxeW9FU25ya1AxTWN1NXdIRmVyTHpGdGZHeGtWV29lVGh6?=
 =?utf-8?B?MHAxMFM5cVNTdHFYMHFXM2dub0E0K2ptcmRMLzNqNFVhNXdXQWhrbS95QWRC?=
 =?utf-8?B?ZU1wOW9IT3RnL25ZVFBBdk9MWVJKNnpKajZ0aVlTcmVKR1luMDR2ZjJSTEhW?=
 =?utf-8?B?Y2N6eUZ0WldxNVZoL0RkQmJ5Y2tmTTdMOGUzd3dLSnlWdGpXeElIKzB2RzZx?=
 =?utf-8?B?YXRTSFVTcHBaeWpYVUVmeWs3UEQxOUxKUFNoNXl0aHJ5bEFIR25CWHBzc2FQ?=
 =?utf-8?B?REpPSi94ZVJ2TDVuNVZ3dWd1RmFmVXUrUk9oNmQrSjJTUStKbU5HalNIbFhV?=
 =?utf-8?B?U2lyek9vUmhrQmUvdUhMVXY5ZElMeDkrMFNlY3p1c2F3QXJ5am91VXNwNmE3?=
 =?utf-8?B?dnlkMGJhMzZ0YXRhamRBNTgzSVREZ0gza2F5UHFseXNDV01XWDRHeThodnds?=
 =?utf-8?B?QVJhRFJVUjhLU2pnbzBTT0k0TGJvS1JSbzFsQkxlVERIVzRxM0FMczhhTnhW?=
 =?utf-8?B?UkE0MWlnRFBvUk9USjV3VmYxaHJhaXQyVmY1T24vekVuM2ZISmM2OWo2OVBY?=
 =?utf-8?B?WXB0M01ZbVVJYzFRa1JIcEEvZEUvaGNtb2Z3WTBaYjN1UzAvS3NiREFFK2Ns?=
 =?utf-8?B?NW8vcEJWWm1hSzQrdURwUjNMYnRST1RJMTFKUTZ1NG84ZFl5MzNUVm1ub1k4?=
 =?utf-8?B?cWFVY2svcStTdlRscHVOaWRxWWFOWEVySmYwYlIrbEN0R0Nha0dJaFErNnBJ?=
 =?utf-8?B?N2UxK2g2bmhaMDJINm5UU29NN3RuWkRkV3dtenRZRTIvK2JyZXZYYU11MkVL?=
 =?utf-8?B?amdKSk90enBDaTNqRXhQQzlUdU9ZQ2ZWUmQ0eFlPUmVCWFhrTDBsaDQ0aUgx?=
 =?utf-8?B?VGplN3M1V21qLzZUUXEvRGVjYjdIRjZCMDdLellJaTJ3OWEwTmRVdFRjNlRm?=
 =?utf-8?B?eE1kYUQraisvQisySGVobDlzT05iOGQzejhjU2sySkg5ZWdUdU1sSzBUSFBF?=
 =?utf-8?B?MGhmamFEdTc5ZU0vOE82Q2VLUkM1V2dhUEQwcStGY2hOSG5oNnZJQ1paUmJn?=
 =?utf-8?B?SncvYVhybk0rT3U4NUFhSndKVjd0RnhUREIvSGV0Q3RFbFhKK3B0UU9LRzYv?=
 =?utf-8?B?MGlJaERBemJyNHRzcXRBNzRWY1gyQ3dnTFk3cStZL0FTamNpT08xTXdxTWQv?=
 =?utf-8?B?OWdDSktkMlBENEt4eFpyQlZLU2lqOWpxaDhFb0w0S29nTDFHZS9TaVluNzJC?=
 =?utf-8?B?MXVwZWxFOXE0WHJUcmpwc1NVc3dCWVVSWTdZLytPU3gyT0xXRnJ5SmhHeHIr?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <960D0F394F15114A89AEF27CF24BC715@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5741.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff231289-a667-415a-de7f-08de38a97393
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 11:35:57.2334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3TLDAh7PNBGEOcT+x1DzDhzABfcwmWC3BakOlBB4QcIQDX0g5N4sPc+iwpNTI9lFJPKpz7yyJnyXoD46hXPjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7961
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033609_316549_3FB51A79 
X-CRM114-Status: GOOD (  21.89  )
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

SGkgTHVpeiwKClRoYW5rcyBmb3IgeW91ciByZXZpZXcgYW5kIHJlc3BvbnNlLgoKT24gV2VkLCAy
MDI1LTEyLTEwIGF0IDE2OjA5IC0wNTAwLCBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IHdyb3RlOgo+
IAo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4KPiAKPiAKPiBIaSBDaHJpcywKPiAKPiBPbiBUdWUsIERlYyA5LCAyMDI1IGF0IDc6MDbi
gK9BTSBDaHJpcyBMdSA8Y2hyaXMubHVAbWVkaWF0ZWsuY29tPgo+IHdyb3RlOgo+ID4gCj4gPiBJ
bml0aWF0ZSByZXNldCBmbG93IGlmIE1UNzl4eCBzZXJpZXMgQlQgZmFpbGVkIHRvIGRvd25sb2Fk
IGZpcm13YXJlCj4gPiB3aGVuCj4gPiBkb2luZyBzZXR1cC4KPiA+IElmIGRyaXZlciBpcyBub3Qg
YWJsZSB0byBnZXQgZXZlbnQgYWZ0ZXIgcmVzZXQgaW4gdGhlIGZpcnN0IHNlY3Rpb24KPiA+IG9m
Cj4gPiBidG10a191c2Jfc2V0dXAsIHRoZSBwcm90b2NvbCBpcyBkZWVtZWQgdW51YWJsZSBhbmQg
ZHJpdmVyIHdpbGwKPiA+IHJldHVybiB0bwo+ID4gcHJldmVudCBmcm9tIHJlcGVhdGVkbHkgZXhl
Y3V0aW5nIHJlc2V0cy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgTHUgPGNocmlzLmx1
QG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2JsdWV0b290aC9idG10ay5jIHwg
MTEgKysrKysrKysrLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRr
LmMgYi9kcml2ZXJzL2JsdWV0b290aC9idG10ay5jCj4gPiBpbmRleCBhOGM1MjBkYzA5ZTEuLjhi
MTQ0M2I5ZTljZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrLmMKPiA+
ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrLmMKPiA+IEBAIC0xMzMzLDcgKzEzMzMsNyBA
QCBpbnQgYnRtdGtfdXNiX3NldHVwKHN0cnVjdCBoY2lfZGV2ICpoZGV2KQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gYnRtdGtfdXNiX2hjaV93bXRfc3luYyk7
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVyciA8IDApIHsKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnRfZGV2X2Vyciho
ZGV2LCAiRmFpbGVkIHRvIHNldCB1cCBmaXJtd2FyZQo+ID4gKCVkKSIsIGVycik7Cj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJlc2V0
X2Z3Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIEl0J3MgRGV2aWNlIEVuZFBvaW50IFJlc2V0IE9w
dGlvbiBSZWdpc3RlciAqLwo+ID4gQEAgLTEzNTMsNyArMTM1Myw3IEBAIGludCBidG10a191c2Jf
c2V0dXAoc3RydWN0IGhjaV9kZXYgKmhkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZXJyID0gYnRtdGtfdXNiX2hjaV93bXRfc3luYyhoZGV2LCAmd210X3BhcmFtcyk7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVyciA8IDApIHsKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnRfZGV2X2VycihoZGV2
LCAiRmFpbGVkIHRvIHNlbmQgd210IGZ1bmMKPiA+IGN0cmwgKCVkKSIsIGVycik7Cj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJlc2V0
X2Z3Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhjaV9zZXRfbXNmdF9vcGNvZGUoaGRldiwgMHhGRDMw
KTsKPiA+IEBAIC0xNDQ0LDYgKzE0NDQsMTMgQEAgaW50IGJ0bXRrX3VzYl9zZXR1cChzdHJ1Y3Qg
aGNpX2RldiAqaGRldikKPiA+IMKgwqDCoMKgwqDCoMKgIH0KPiA+IMKgwqDCoMKgwqDCoMKgIGtm
cmVlX3NrYihza2IpOwo+ID4gCj4gPiArcmVzZXRfZnc6Cj4gPiArwqDCoMKgwqDCoMKgIGlmIChi
dG10a19kYXRhLT5yZXNldF9zeW5jKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBidF9kZXZfZXJyKGhkZXYsICJNZWRpYXRlayBkbyBmaXJtd2FyZSByZXNldCIpOwo+IAo+IFRo
aXMgbWVzc2FnZSBpcyBhIGJpdCBjcnlwdGljIHRvIG1lLCB3aHkgZG8gd2UgbmVlZCB0byBwcmlu
dCB0aGF0IHlvdQo+IHdpbGwgYmUgZG9pbmcgYSByZXNldD8KCkluZGVlZCwgdGhpcyBsb2cgY2Fu
IG9ubHkgYmUgaW50ZXJwcmV0ZWQgYnkgTWVkaWF0ZWsgZW5naW5lZXJzLiBJJ2xsCnVwZGF0ZSB2
MiB0byByZW1vdmUgdGhpcyBsaW5lLgoKPiAKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJ0bXRrX3Jlc2V0X3N5bmMoaGRldik7Cj4gCj4gVGhpcyBzZWVtcyB0byBiZSBkb2luZyBh
IGhhcmQgcmVzZXQsIHdoaWNoIEkgYXNzdW1lIHlvdSBhcmUgZG9pbmcgYXMKPiBhbiBhdHRlbXB0
IHRvIHJlY292ZXIgYnkgcmV0cnlpbmcgdG8gc2V0dXAsIGJ1dCBpZiBpdCBmYWlscyB3ZSBtYXkg
Z28KPiBpbnRvIGEgbG9vcCBjb25kaXRpb24gdHJ5aW5nIHRvIHNldHVwIHNvIHdlIGJldHRlciBs
aW1pdCB0aGUgbnVtYmVyCj4gb2YKPiBhdHRlbXB0cy4KCldlIG9ubHkgcGVyZm9ybSByZXNldCBv
bmNlIHdoZW4gZmlybXdhcmUgZG93bmxvYWQgZmFpbGVkIG9yICd3bXQgY3RybCcKY29tbWFuZCBm
YWlsZWQuCgpCZWZvcmUgZG93bmxvYWRpbmcgdGhlIGZpcm13YXJlLCBkcml2ZXIgd2lsbCBzZW5k
IHByZS1pbml0IGNvbW1hbmRzIHRvCmdldCBpbmZvcm1hdGlvbiBzdWNoIGFzIGNoaXAgaWQsIGFm
dGVyIHRoZSByZXNldCwgaWYgdGhvc2UgY29tbWFuZApzdGlsbCBjYW4ndCB3b3JrIG5vcm1hbGx5
LCBpdCBpcyBjb25zaWRlcmVkIGEgcHJvdG9jb2wgaXNzdWUgdGhhdCBpdApjYW4ndCBiZSBmdXJ0
aGVyIHVzZWQuIFdlJ2xsIG5vdCBlbnRlciB0aGUgcmVzZXQgZmxvdyBhZ2FpbiB0byBhdm9pZCBh
bgplbmRsZXNzIGxvb3AuCgpUaGVyZSBpcyBpbmRlZWQgYSBwb3RlbnRpYWwgcmlzay4gSWYgdGhl
IHByZS1pbml0IGNvbW1hbmRzIGFyZSBhbGwgZmluZQpidXQgZmlybXdhcmUgZG93bmxvYWQgY29u
dGludWVzIHRvIGhhdmUgcHJvYmxlbSwgaXQgY291bGQgY2F1c2UgYSBsb29wCmNvbmRpdGlvbi4g
UmV0cnkgbGltaXQgd2lsbCBiZSBhZGRyZXNzZWQgaW4gdjIuCgo+IAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPiA+ICvCoMKgwqDCoMKgwqAgfQo+ID4gKwo+
ID4gwqBkb25lOgo+ID4gwqDCoMKgwqDCoMKgwqAgcmV0dGltZSA9IGt0aW1lX2dldCgpOwo+ID4g
wqDCoMKgwqDCoMKgwqAgZGVsdGEgPSBrdGltZV9zdWIocmV0dGltZSwgY2FsbHRpbWUpOwo+ID4g
LS0KPiA+IDIuNDUuMgo+ID4gCj4gCj4gCj4gLS0KPiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6CgpU
aGFua3MgYSBsb3QhCkNocmlzIEx1Cgo=

