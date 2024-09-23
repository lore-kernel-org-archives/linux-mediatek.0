Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D109CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 03:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bYFoAMx6dIxtXhT0O8kI9mpXTbvuEld3r1/Y56II/Q=; b=eXq4oPfszXPc8RKoLf6y+qzMYZ
	z5W0dgB6eOhFBiXfZpfoOp/eORRHOjDPn7/VZOGrF8OCRel/HzoqrxFOVFmjgB9xLH7aJdmivVFnl
	tUUuCFFnVjM+HwlIX7l68UJJ0511Jzl7B8hsnfzV2qKZ243K8nDqKi1mChe6GXsvo45ji+Bo7Z0k2
	BHesx3RwwnHKabl42v0dNBfBBuvyaKK5F7MCKVAXpDfiXYD8Ltg7HvyxJEGekw2G23nwmKXBENdFG
	+mwkNoWZB3UzRLrlrHqLvf/VmRDPYR9P2x8LP5fzDAJnQAxk6GjeeoyE/h1OOHFQc7o2b3xU+XNQ3
	wclPm7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssaBH-0000000GFwL-1bEl;
	Mon, 23 Sep 2024 03:56:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssa6r-0000000GFRQ-1nuX;
	Mon, 23 Sep 2024 03:51:38 +0000
X-UUID: 1f2408cc795f11efba0aef63c0775dbf-20240922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6bYFoAMx6dIxtXhT0O8kI9mpXTbvuEld3r1/Y56II/Q=;
	b=ty2Q1KkCAjYCCo7I8cJwjOtS2CwQVS8pQ6qo+Ac51EUuBwmEmBL/W39GM5rE25W5tjioHYh0TfJBIaYqtUbgxrrcOdc6O+VGiiZCCXUGGpHZR3xlk2hMyHmrwdb0tAmbprszPprXmf/Y9K7WyKgF5TM1o/H17H4HNJXs1TIYqSw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f3f58c10-9c09-4f1f-950f-bc940b530a76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:66501618-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1f2408cc795f11efba0aef63c0775dbf-20240922
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 375356078; Sun, 22 Sep 2024 20:51:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 22 Sep 2024 20:51:29 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Sep 2024 11:51:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeexGUGwbN3sslQEdnk039gnsqi3zdX3qWertgTjYKTeOovpgpoAZkW10OUKe0ko8VhGjLKPzmF60EqZyNbR9PcuUaEiRfsGyKIQ96asRvG4s+Bh9h/MIsTugseTdNpr71I8eYeNoKgu/QqXiDi1sBolnM9/ayUjyacvtJ9xXuyESEsY9r/uzh9tZdjFwhvdBVrdUPyeT8tSMhI1nrdd/2+q8/670bOgxkrDvAmF1VThvdRXhM596r8A4ZzM6NDJF34CqXb3le40lJhNB6hVuYpSB6kAV0DqsA71RESVp/yWyZNGJjtv/mn0StPbhu8n7KJGU2YO4yD1meZcCq/0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bYFoAMx6dIxtXhT0O8kI9mpXTbvuEld3r1/Y56II/Q=;
 b=DyIb/fT4gXnCEPZ/vE/vMgWmQXLzwokAcp4EwaLHQYJ1VMi0ydTan4JGzHkBpi5BQH+4JsEZ2wIhuwaNuNo7iejKsMqkDnCcRGYWRDfOW9gVoGk/jaDKuOra8neLE/Sse1boBjl2eEjfZT3pxshZVQs4lm39mYa9dmIlrxVYu+OVLsVExWXgla4gTtiFsqxiLV+TzAWpisY4UBgLqw+8Gy2+NwHKVdhboZ0umJvrB/GwXVEGt+8Wx7dN62G8M0jgoRhO1nXffqGrt/JmkNnyIV0MYo679EsbQfIzwjEv5nGSIs0bIDC1np51oCZgMUhxoI6gBIXNCoUdYCqJrUlR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bYFoAMx6dIxtXhT0O8kI9mpXTbvuEld3r1/Y56II/Q=;
 b=twuMhBIMm9PAZhsnZxO9+R3iOBVz90V/yjXzzxRL6BOcPrrSxvOjaHyR9xgFqE8W4EjDFuVHBsNovOlnJe3uLswsH28RNa/FerKR6AnDcX/ogOF2tJBWjqHLHCB4cKrnozJiB/X+AiPmZERlOiR1hq73GGtNn/LJuPBjDb44KlI=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYZPR03MB7574.apcprd03.prod.outlook.com (2603:1096:400:3ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Mon, 23 Sep
 2024 03:51:27 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 03:51:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] drm/mediatek: ovl: Add fmt_convert function pointer to
 driver data
Thread-Topic: [PATCH v3] drm/mediatek: ovl: Add fmt_convert function pointer
 to driver data
Thread-Index: AQHbCSEAXiQ7lg9JUEKLVx+Qau4WVLJkxXeA
Date: Mon, 23 Sep 2024 03:51:26 +0000
Message-ID: <d59c3b6a965daf22750be79b0f74703c216ec44a.camel@mediatek.com>
References: <20240917164434.17794-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20240917164434.17794-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYZPR03MB7574:EE_
x-ms-office365-filtering-correlation-id: ee62ff73-ad69-47de-a3a9-08dcdb82ffff
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S1dkVzdyUlV4TjRTcHFtR213ZWVVUVNsK2YvdlZ0ekNTMXlQdHZoejNSMmNF?=
 =?utf-8?B?UmJ1YXloUENlM3hvaWIvd2tMeXJMV3l5eVhodVptYkhaeWkxaDVaM1FIVkc4?=
 =?utf-8?B?QzJGQy9sbGcxT1ZBNjZjSFh3STZCRC9meU9LTlViOFJrYlB6aTVyYzI4WFV0?=
 =?utf-8?B?QmtVWm5Ja0JZWUJRSmV0Z1NlNmFHTzZhM2Z0WUhadkFDaEJCNW1wUlVGcGxx?=
 =?utf-8?B?OGFXWnZPc0E3eTNLd3FaYWZOamNrRThPZ1c1Qzl5eFBDcmhxVkpzbEEwQlY3?=
 =?utf-8?B?azg1aGl4VW9PVkErVVhIdVh4em9jUGlvU0huRHU4M2NETmV3Z0M2SDFQaEl2?=
 =?utf-8?B?cy9nclJkTHFmOHpoN3RHSm5acUNZa2VFUDV2VXp2Tnhab0tTM2lKcmF0U21h?=
 =?utf-8?B?Y1hGTTFqb0prRkl6VEUzWkplamh6ZDN3aFAybXVqYmZPUm9vQnhqZFVUK05Z?=
 =?utf-8?B?bTAxNFpiMXJTeUlnenVGNFpDbytDZWhianMrbGZQTkdJYmRIK2hxVnFOb2RV?=
 =?utf-8?B?RmMvem5KVEpBS3hZamN4NnJSTFhjdjlERUdYcElDb1RKTlUvdExFMnVzTVll?=
 =?utf-8?B?b2gxM1R1cjQ5WUZyb1hUQmZRL2h3K0U4eXZXWUc0aXBOU1hjOVRONEtzOWEv?=
 =?utf-8?B?cUFDY29BTnAxY2pIMVJQOTUrOTlPY3FmSFFYY292SmJHYytoZGJqNkRFVWNw?=
 =?utf-8?B?SjZiRC8wZGhnYkpNdHV6ZGdoL3BRV1BjMysyQjJCZXY3Y2Y5R3p2NXFmTXBV?=
 =?utf-8?B?V2J3ek5tM3lLcFVxWGR5SzU4SnczNmIrdksrUFZvajFHeGFPeEpJR3pSby91?=
 =?utf-8?B?aGh0Z2RmMExkcFk3SVo0WXpXS3l2cVBoVmJMNmljRXVuWnYxTWZ0NVVtRXV0?=
 =?utf-8?B?TDk1SGVwdlFYZVRiajZXWlphSWtmalpjMDlOV2dXWENsUTJmbVIrT0JHWlhB?=
 =?utf-8?B?azN3N1RiSVNyNzlOZ1ZNK0l0Skd3L3Z3MUpQUE5DLzF2ZVNiSUFwazFUaXBu?=
 =?utf-8?B?UWZ6cTlXdlBFMExFMmJiTEpzL0lqN1Y3MVVoQXFaRFNKcTRnVW16eGNrVUQx?=
 =?utf-8?B?bVVxbkZpZHZ2Y2xSdnJJMFJqWldPTkZiVUVDKzFVczRqMzJTMEVjTmxySXJ0?=
 =?utf-8?B?SmthVnFXNTViVFBwUmtkOFp5SEUwNmZ1YnE0dGlmV21IbXJtWHdrNGdxRTgx?=
 =?utf-8?B?Q2JzeUZDUzYwYmFtQkpnRUE1UGNDd1Nkc3VRZHMycUhFb1ZLOEMybDlXRmtB?=
 =?utf-8?B?WGwrTTUrODYyL2Rha1RhbitVUVZra2tEVVR6SUhLVHFlL3RsU1BNeE0wQmZt?=
 =?utf-8?B?aHdkQkt3TFB1bERZTUlxR3BjZ0FQVUdIL2M0YlUrcFdvUUMyZnNCQmFYTE9p?=
 =?utf-8?B?d2ZYeUhESWpOSW1xZGM3UnNQMjJ3ZVllbTdQSUlJeDMrejdJSlE2cklSMk5K?=
 =?utf-8?B?dDByS1NHL0UreUttMk5VYVNpVVJVNHVKdVQzTmhWQ0dSSmVKNFpjOVliUWho?=
 =?utf-8?B?SzlpNG9vZzlMSXJ2MlFDSkZ4czV6c0RwbDlyWFFQUThaOUpGODlBSWUzNWlE?=
 =?utf-8?B?VGVZT1dWaUp3S2lxa1Q2eno0bC9LNjhGL0t5dnNTZGFzSzhHU0d1NlQyenRy?=
 =?utf-8?B?M2tUSkhiWmxUWktnb0w0RERVdkwzSHQ2U05Rc3BQa2ZFV3dCVXRLbGlNSHJY?=
 =?utf-8?B?MTE4ME5jbWt5ZDh0L3dDai9SSkhIZFo2R3U1dFllUVVrK0tTU2NlTStnSlU5?=
 =?utf-8?B?aUhxT2VQSzgxYUpJOWVjSHpudHg1K0J4bmFORnArM2Y5S041cTdyUHVxWXRN?=
 =?utf-8?B?RTVhZmxncXhNUzYxK2NKZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0x2TlFsbWVaa2RncVdMSU1SQjU2L09HWXhyeDNnSnJQOGt6VnhGLzVhL1gv?=
 =?utf-8?B?NEQ5cGJoZVRFelZuNm9vQzl1SnI3azNLSGwwb2sxQjFlVnpFUlA2WHRRM1Ur?=
 =?utf-8?B?L2J3T0MvcEFad0hDbktHWDlEUmQrNDE5Vm5ZSXh4UmQ4aisxaWc2eEx0cFI3?=
 =?utf-8?B?amIzWE9DWDdWcnNpcEZCU2NDdm5udmsveTBZR2hRMVhVMUZ2T255YWQzT3RN?=
 =?utf-8?B?TXgwMkxIeTBoL0d3aG5vYTRrZ3dWRy9JQk02QXcwNEZrSllUdkpmMXhVU1NC?=
 =?utf-8?B?TUtBcEsrMkxGSlIyV0Zxcm5yYmpzWVdEV0pRNDRqQ29ucEpvYTN3dUpDZVUw?=
 =?utf-8?B?UHZobHZFb0RiMkxmaUF2UUc3L0NiWnNCbnNMczBKWGRJK0JnRG96ZlV6emZN?=
 =?utf-8?B?Q1BHNGpRUHUzY0dyaDA2UFpoWGpRRXM3enFwWE5lWTVNd1RrT1V5SWZNbDdx?=
 =?utf-8?B?Y3g1YWdNQkpJSDcvcE1EbldnNGtyTXRyL3VBaStpckVLRTA0SUlqMGE5RWcy?=
 =?utf-8?B?WnNicnkzaUJsUmVOUEVIUGpwYmQwL1lkMTVpNkp5RGsybXlQaWhtWVJKbS9a?=
 =?utf-8?B?T3U0ajRCdkY3TVZDMWNZeE45RVJGTi81cUpla0syaDFid3hkSUlQTEZDQVJC?=
 =?utf-8?B?VWlQRmZCM2dxZi9TajJoejA2THlSTExMMkk5ejBibFkzVmtPdFcrQ2JIcDhR?=
 =?utf-8?B?Vk1KYXlYSU81WUdSS0RCdGpCZWJxRlhiM3FjQ0FlWUpKWVhIdm5nUnZKU2pj?=
 =?utf-8?B?d2x5VUpMcWp5Mks1M3gvYjhlcFJDaS82U1RrL1NvSENiYjQxS3h5MHcxOStq?=
 =?utf-8?B?eHlkU3A1Nmp3T0FVOUxqR3lqSnYrdjU1VzNncXFnZ1YxcEY1bXZjbVNTSUsx?=
 =?utf-8?B?UnZySzRxN0VHVnprMy9yL0s3ZFZKSjdReFRFdTVySGU0VHYrTWZDVEFBSElR?=
 =?utf-8?B?V0xEVVJqK3U5RENGTE5jUUdaN3BJVGFmM1R6ckdUWkJ3NEV5c09xVEtJSmpH?=
 =?utf-8?B?VHNFQy9VeVZmenhkYXFvaVhKUEREc01PRlU5OEtaeUUwa2dNL21NSXVkMVli?=
 =?utf-8?B?a3pvKzFBOEREempaczRwWG8yOUFXTkRZNW9OdHBtTFVXS3hBV2tBNlkwWE9I?=
 =?utf-8?B?QjlXa28yOStZaWF5QjZqc1JjQUdmekxCYkdQdVpoUkxJbmJrTlNlRzRNR1NF?=
 =?utf-8?B?eDU2TW9RZExVVUhVNGpEbnhGU3VGRElwUndQUWJGYldXV1RTWDdsakIxTnh0?=
 =?utf-8?B?SUlpbndhMHE4NWdwUmJRYlJJaGtRU1VQMmZOejhSWk54TXRSZlpEbEY4Q0Ft?=
 =?utf-8?B?eERIUEpndGFwNlhaNUJzdU9Kdi9rNGcrS2tULzl6NUl5eldCclMyUUd4K2k5?=
 =?utf-8?B?eXNrRndkNHpXRzNJNzhXd2FjMUZTdUN5K3o1dVI3OG5CU2FNTnJ6YWJnQTRR?=
 =?utf-8?B?M1IrWXhGUExYYWdsOWRCNUllTkdRb1hPZ1ZtdVE1eW5hcFkwNENZaFFVLzZ2?=
 =?utf-8?B?ZiszYlMwMFRjejRmenJzU21XQ2lOM1BsbkE4N0RwK1ExcFhYMHZMRWVVSk0y?=
 =?utf-8?B?OXdCZzczbjh6WHZNY09ERVhJOVE3bi95OTk0SWFKMHBrRXdObHNGUG5YT2FI?=
 =?utf-8?B?SHJKTFBXWkF3MHB5MFNSV3lTcEFrRXBKRUY1c09yN3NkTDkyNWFXaHJPR0h4?=
 =?utf-8?B?eUpGbW9FcW0wT3pDUTFoNkdiRU5vWFVlNmhpUFluV3ZhRktqVGVWYzJ2QjAv?=
 =?utf-8?B?aHIvTXcxNkZHNkJrRWdrR1hQdFA5dXFiYVVGcFlxRTJlMy9CdW1zRjlsckVP?=
 =?utf-8?B?Um5RMWhFYW84RXFUU3doRFZSNCsxTEljT1ZYQzZLc2d6a2hoOUxVdGhKMlZT?=
 =?utf-8?B?WlBPWTAvVXpxaFlpeXVtZC9BdUpFNzROWSs5VlJWN2tKTGZZZlJyNklMR3FH?=
 =?utf-8?B?dTdCVzN5K08zQTZ3aWZ5WXI3OUt6QjJKRmo0Wms3OUxnalZQdzM1TVpHem9H?=
 =?utf-8?B?NGplYW5NL3Bnc3d1QTVUWEJOeUdTNENiZjZBdzREdTd3MU1qZVJIL1psNFVx?=
 =?utf-8?B?UE14YmJ0S1o3SVd5ZlVrNFNqc2V4MitWSERETmppRHNlblRFYTdRR0lmS0s0?=
 =?utf-8?Q?Rv0eAeTw+nX91Hoo5xd16sZVO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE5D01AE8A017349ABCF1BB22286971B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee62ff73-ad69-47de-a3a9-08dcdb82ffff
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 03:51:26.6916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ycfw9oInDyAXenKWS10HADn2lCSpG7YxGd3LQVqynI8DDka5veEc9cwwia3sVGbGHB5LXuBtmyGlGdoBHludvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_205137_521242_2457A9C4 
X-CRM114-Status: GOOD (  23.81  )
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

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjQtMDktMTggYXQgMDA6NDQgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gT1ZMX0NPTl9DTFJGTVRfTUFOIGlzIGEgY29uZmlndXJhdGlvbiBmb3Ig
ZXh0ZW5kaW5nIGNvbG9yIGZvcm1hdA0KPiBzZXR0aW5ncyBvZiBESVNQX1JFR19PVkxfQ09OKG4p
Lg0KPiBJdCB3aWxsIGNoYW5nZSBzb21lIG9mIHRoZSBvcmlnaW5hbCBjb2xvciBmb3JtYXQgc2V0
dGluZ3MuDQo+IA0KPiBUYWtlIHRoZSBzZXR0aW5ncyBvZiAoMyA8PCAxMikgZm9yIGV4YW1wbGUu
DQo+IC0gSWYgT1ZMX0NPTl9DTFJGTVRfTUFOID0gMCBtZWFucyBPVkxfQ09OX0NMUkZNVF9SR0JB
ODg4OC4NCj4gLSBJZiBPVkxfQ09OX0NMUkZNVF9NQU4gPSAxIG1lYW5zIE9WTF9DT05fQ0xSRk1U
X1BBUkdCODg4OC4NCj4gDQo+IFNpbmNlIE9WTF9DT05fQ0xSRk1UX01BTiBpcyBub3Qgc3VwcG9y
dGVkIG9uIHByZXZpb3VzIFNvQ3MsDQo+IEl0IGJyZWFrcyB0aGUgT1ZMIGNvbG9yIGZvcm1hdCBz
ZXR0aW5nIG9mIE1UODE3My4NCj4gDQo+IFRoZXJlZm9yZSwgdGhlIGZtdF9jb252ZXJ0IGZ1bmN0
aW9uIHBvaW50ZXIgaXMgYWRkZWQgdG8gdGhlIGRyaXZlciBkYXRhDQo+IGFuZCBtdGtfb3ZsX2Zt
dF9jb252ZXJ0X3dpdGhfYmxlbmQgaXMgaW1wbGVtZW50ZWQgZm9yIE1UODE5MiBhbmQgTVQ4MTk1
DQo+IHRoYXQgc3VwcG9ydCBPVkxfQ09OX0NMUkZNVF9NQU4sIGFuZCBtdGtfb3ZsX2ZtdF9jb252
ZXJ0IGlzIGltcGxlbWVudGVkDQo+IGZvciBvdGhlciBTb0NzIHRoYXQgZG8gbm90IHN1cHBvcnQg
aXQgdG8gc29sdmUgdGhlIGRlZ3JhZGF0aW9uIHByb2JsZW0uDQo+IA0KPiBGaXhlczogYTNmN2Y3
ZWY0YmZlICgiZHJtL21lZGlhdGVrOiBTdXBwb3J0ICJQcmUtbXVsdGlwbGllZCIgYmxlbmRpbmcg
aW4gT1ZMIikNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVk
aWF0ZWsuY29tPg0KPiBUZXN0ZWQtYnk6IEFscGVyIE5lYmkgWWFzYWsgPGFscGVybmViaXlhc2Fr
QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMgfCA2MyArKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NTYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gaW5kZXggODliNDM5ZGNmM2E2Li40OTQ4ZjI2OWZiODEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gQEAgLTE0
Myw2ICsxNDMsNyBAQCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgew0KPiAgCXVuc2lnbmVkIGlu
dCBhZGRyOw0KPiAgCXVuc2lnbmVkIGludCBnbWNfYml0czsNCj4gIAl1bnNpZ25lZCBpbnQgbGF5
ZXJfbnI7DQo+ICsJdW5zaWduZWQgaW50ICgqZm10X2NvbnZlcnQpKHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IG10a19wbGFuZV9zdGF0ZSAqc3RhdGUpOw0KPiAgCWJvb2wgZm10X3JnYjU2NV9p
c18wOw0KPiAgCWJvb2wgc21pX2lkX2VuOw0KPiAgCWJvb2wgc3VwcG9ydHNfYWZiYzsNCj4gQEAg
LTM4NiwxMyArMzg3LDU0IEBAIHZvaWQgbXRrX292bF9sYXllcl9vZmYoc3RydWN0IGRldmljZSAq
ZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgCQkgICAgICBESVNQX1JFR19PVkxfUkRNQV9DVFJM
KGlkeCkpOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgdW5zaWduZWQgaW50IG92bF9mbXRfY29udmVy
dChzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwsIHVuc2lnbmVkIGludCBmbXQsDQo+IC0JCQkJICAg
IHVuc2lnbmVkIGludCBibGVuZF9tb2RlKQ0KPiArc3RhdGljIHVuc2lnbmVkIGludCBtdGtfb3Zs
X2ZtdF9jb252ZXJ0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG10a19wbGFuZV9zdGF0ZSAq
c3RhdGUpDQo+ICB7DQo+IC0JLyogVGhlIHJldHVybiB2YWx1ZSBpbiBzd2l0Y2ggIk1FTV9NT0RF
X0lOUFVUX0ZPUk1BVF9YWFgiDQo+IC0JICogaXMgZGVmaW5lZCBpbiBtZWRpYXRlayBIVyBkYXRh
IHNoZWV0Lg0KPiAtCSAqIFRoZSBhbHBoYWJldCBvcmRlciBpbiBYWFggaXMgbm8gcmVsYXRpb24g
dG8gZGF0YQ0KPiAtCSAqIGFycmFuZ2VtZW50IGluIG1lbW9yeS4NCj4gKwlzdHJ1Y3QgbXRrX2Rp
c3Bfb3ZsICpvdmwgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKwl1bnNpZ25lZCBpbnQgZm10
ID0gc3RhdGUtPnBlbmRpbmcuZm9ybWF0Ow0KPiArDQo+ICsJc3dpdGNoIChmbXQpIHsNCj4gKwlk
ZWZhdWx0Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9SR0I1NjU6DQo+ICsJCXJldHVybiBPVkxfQ09O
X0NMUkZNVF9SR0I1NjUob3ZsKTsNCj4gKwljYXNlIERSTV9GT1JNQVRfQkdSNTY1Og0KPiArCQly
ZXR1cm4gT1ZMX0NPTl9DTFJGTVRfUkdCNTY1KG92bCkgfCBPVkxfQ09OX0JZVEVfU1dBUDsNCj4g
KwljYXNlIERSTV9GT1JNQVRfUkdCODg4Og0KPiArCQlyZXR1cm4gT1ZMX0NPTl9DTFJGTVRfUkdC
ODg4KG92bCk7DQo+ICsJY2FzZSBEUk1fRk9STUFUX0JHUjg4ODoNCj4gKwkJcmV0dXJuIE9WTF9D
T05fQ0xSRk1UX1JHQjg4OChvdmwpIHwgT1ZMX0NPTl9CWVRFX1NXQVA7DQo+ICsJY2FzZSBEUk1f
Rk9STUFUX1JHQlg4ODg4Og0KPiArCWNhc2UgRFJNX0ZPUk1BVF9SR0JBODg4ODoNCj4gKwljYXNl
IERSTV9GT1JNQVRfUkdCWDEwMTAxMDI6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1JHQkExMDEwMTAy
Og0KPiArCQlyZXR1cm4gT1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODg7DQoNCkNvbXBhcmluZyBtdGtf
b3ZsX2ZtdF9jb252ZXJ0KCkgd2l0aCBtdGtfb3ZsX2ZtdF9jb252ZXJ0X3dpdGhfYmxlbmQoKSwg
c29tZSBwaXhlbCBmb3JtYXRzIGFyZSBzdXBwb3J0ZWQsIHN1Y2ggYXMgQkdSQTg4ODguDQpCdXQg
aW4ga2VybmVsIHY2LjEwLCB0aGVzZSBmb3JtYXRzIGFyZSBzdXBwb3J0ZWQuDQpJcyB0aGUgY29k
ZSB3cm9uZyBpbiB2Ni4xMD8NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwljYXNlIERSTV9GT1JNQVRf
WFJHQjg4ODg6DQo+ICsJY2FzZSBEUk1fRk9STUFUX0FSR0I4ODg4Og0KPiArCWNhc2UgRFJNX0ZP
Uk1BVF9YUkdCMjEwMTAxMDoNCj4gKwljYXNlIERSTV9GT1JNQVRfQVJHQjIxMDEwMTA6DQo+ICsJ
CXJldHVybiBPVkxfQ09OX0NMUkZNVF9BUkdCODg4ODsNCj4gKwljYXNlIERSTV9GT1JNQVRfWEJH
Ujg4ODg6DQo+ICsJY2FzZSBEUk1fRk9STUFUX0FCR1I4ODg4Og0KPiArCWNhc2UgRFJNX0ZPUk1B
VF9YQkdSMjEwMTAxMDoNCj4gKwljYXNlIERSTV9GT1JNQVRfQUJHUjIxMDEwMTA6DQo+ICsJCXJl
dHVybiBPVkxfQ09OX0NMUkZNVF9BQkdSODg4ODsNCj4gKwljYXNlIERSTV9GT1JNQVRfVVlWWToN
Cj4gKwkJcmV0dXJuIE9WTF9DT05fQ0xSRk1UX1VZVlkgfCBPVkxfQ09OX01UWF9ZVVZfVE9fUkdC
Ow0KPiArCWNhc2UgRFJNX0ZPUk1BVF9ZVVlWOg0KPiArCQlyZXR1cm4gT1ZMX0NPTl9DTFJGTVRf
WVVZViB8IE9WTF9DT05fTVRYX1lVVl9UT19SR0I7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICtzdGF0
aWMgdW5zaWduZWQgaW50IG10a19vdmxfZm10X2NvbnZlcnRfd2l0aF9ibGVuZChzdHJ1Y3QgZGV2
aWNlICpkZXYsDQo+ICsJCQkJCQkgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpzdGF0ZSkNCj4g
K3sNCj4gKwlzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
Cj4gKwl1bnNpZ25lZCBpbnQgZm10ID0gc3RhdGUtPnBlbmRpbmcuZm9ybWF0Ow0KPiArCXVuc2ln
bmVkIGludCBibGVuZF9tb2RlID0gc3RhdGUtPmJhc2UucGl4ZWxfYmxlbmRfbW9kZTsNCj4gKw0K
PiArCS8qDQo+ICsJICogRm9yIHRoZSBwbGF0Zm9ybXMgd2hlcmUgT1ZMX0NPTl9DTFJGTVRfTUFO
IGlzIGRlZmluZWQgaW4gdGhlDQo+ICsJICogaGFyZHdhcmUgZGF0YSBzaGVldCBhbmQgc3VwcG9y
dHMgcHJlbXVsdGlwbGllZCBjb2xvciBmb3JtYXRzDQo+ICsJICogc3VjaCBhcyBPVkxfQ09OX0NM
UkZNVF9QUkdCODg4OC4NCj4gIAkgKi8NCj4gIAlzd2l0Y2ggKGZtdCkgew0KPiAgCWRlZmF1bHQ6
DQo+IEBAIC00NzEsNyArNTEzLDcgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJCXJldHVybjsNCj4gIAl9DQo+ICAN
Cj4gLQljb24gPSBvdmxfZm10X2NvbnZlcnQob3ZsLCBmbXQsIGJsZW5kX21vZGUpOw0KPiArCWNv
biA9IG92bC0+ZGF0YS0+Zm10X2NvbnZlcnQoZGV2LCBzdGF0ZSk7DQo+ICAJaWYgKHN0YXRlLT5i
YXNlLmZiKSB7DQo+ICAJCWNvbiB8PSBPVkxfQ09OX0FFTjsNCj4gIAkJY29uIHw9IHN0YXRlLT5i
YXNlLmFscGhhICYgT1ZMX0NPTl9BTFBIQTsNCj4gQEAgLTYyNSw2ICs2NjcsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19kaXNwX292bF9kYXRhIG10MjcwMV9vdmxfZHJpdmVyX2RhdGEgPSB7
DQo+ICAJLmFkZHIgPSBESVNQX1JFR19PVkxfQUREUl9NVDI3MDEsDQo+ICAJLmdtY19iaXRzID0g
OCwNCj4gIAkubGF5ZXJfbnIgPSA0LA0KPiArCS5mbXRfY29udmVydCA9IG10a19vdmxfZm10X2Nv
bnZlcnQsDQo+ICAJLmZtdF9yZ2I1NjVfaXNfMCA9IGZhbHNlLA0KPiAgCS5mb3JtYXRzID0gbXQ4
MTczX2Zvcm1hdHMsDQo+ICAJLm51bV9mb3JtYXRzID0gQVJSQVlfU0laRShtdDgxNzNfZm9ybWF0
cyksDQo+IEBAIC02MzQsNiArNjc3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9v
dmxfZGF0YSBtdDgxNzNfb3ZsX2RyaXZlcl9kYXRhID0gew0KPiAgCS5hZGRyID0gRElTUF9SRUdf
T1ZMX0FERFJfTVQ4MTczLA0KPiAgCS5nbWNfYml0cyA9IDgsDQo+ICAJLmxheWVyX25yID0gNCwN
Cj4gKwkuZm10X2NvbnZlcnQgPSBtdGtfb3ZsX2ZtdF9jb252ZXJ0LA0KPiAgCS5mbXRfcmdiNTY1
X2lzXzAgPSB0cnVlLA0KPiAgCS5mb3JtYXRzID0gbXQ4MTczX2Zvcm1hdHMsDQo+ICAJLm51bV9m
b3JtYXRzID0gQVJSQVlfU0laRShtdDgxNzNfZm9ybWF0cyksDQo+IEBAIC02NDMsNiArNjg3LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0YSBtdDgxODNfb3ZsX2RyaXZl
cl9kYXRhID0gew0KPiAgCS5hZGRyID0gRElTUF9SRUdfT1ZMX0FERFJfTVQ4MTczLA0KPiAgCS5n
bWNfYml0cyA9IDEwLA0KPiAgCS5sYXllcl9uciA9IDQsDQo+ICsJLmZtdF9jb252ZXJ0ID0gbXRr
X292bF9mbXRfY29udmVydCwNCj4gIAkuZm10X3JnYjU2NV9pc18wID0gdHJ1ZSwNCj4gIAkuZm9y
bWF0cyA9IG10ODE3M19mb3JtYXRzLA0KPiAgCS5udW1fZm9ybWF0cyA9IEFSUkFZX1NJWkUobXQ4
MTczX2Zvcm1hdHMpLA0KPiBAQCAtNjUyLDYgKzY5Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX2Rpc3Bfb3ZsX2RhdGEgbXQ4MTgzX292bF8ybF9kcml2ZXJfZGF0YSA9IHsNCj4gIAkuYWRk
ciA9IERJU1BfUkVHX09WTF9BRERSX01UODE3MywNCj4gIAkuZ21jX2JpdHMgPSAxMCwNCj4gIAku
bGF5ZXJfbnIgPSAyLA0KPiArCS5mbXRfY29udmVydCA9IG10a19vdmxfZm10X2NvbnZlcnQsDQo+
ICAJLmZtdF9yZ2I1NjVfaXNfMCA9IHRydWUsDQo+ICAJLmZvcm1hdHMgPSBtdDgxNzNfZm9ybWF0
cywNCj4gIAkubnVtX2Zvcm1hdHMgPSBBUlJBWV9TSVpFKG10ODE3M19mb3JtYXRzKSwNCj4gQEAg
LTY2MSw2ICs3MDcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kaXNwX292bF9kYXRhIG10
ODE5Ml9vdmxfZHJpdmVyX2RhdGEgPSB7DQo+ICAJLmFkZHIgPSBESVNQX1JFR19PVkxfQUREUl9N
VDgxNzMsDQo+ICAJLmdtY19iaXRzID0gMTAsDQo+ICAJLmxheWVyX25yID0gNCwNCj4gKwkuZm10
X2NvbnZlcnQgPSBtdGtfb3ZsX2ZtdF9jb252ZXJ0X3dpdGhfYmxlbmQsDQo+ICAJLmZtdF9yZ2I1
NjVfaXNfMCA9IHRydWUsDQo+ICAJLnNtaV9pZF9lbiA9IHRydWUsDQo+ICAJLmZvcm1hdHMgPSBt
dDgxNzNfZm9ybWF0cywNCj4gQEAgLTY3MSw2ICs3MTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19kaXNwX292bF9kYXRhIG10ODE5Ml9vdmxfMmxfZHJpdmVyX2RhdGEgPSB7DQo+ICAJLmFk
ZHIgPSBESVNQX1JFR19PVkxfQUREUl9NVDgxNzMsDQo+ICAJLmdtY19iaXRzID0gMTAsDQo+ICAJ
LmxheWVyX25yID0gMiwNCj4gKwkuZm10X2NvbnZlcnQgPSBtdGtfb3ZsX2ZtdF9jb252ZXJ0X3dp
dGhfYmxlbmQsDQo+ICAJLmZtdF9yZ2I1NjVfaXNfMCA9IHRydWUsDQo+ICAJLnNtaV9pZF9lbiA9
IHRydWUsDQo+ICAJLmZvcm1hdHMgPSBtdDgxNzNfZm9ybWF0cywNCj4gQEAgLTY4MSw2ICs3Mjks
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kaXNwX292bF9kYXRhIG10ODE5NV9vdmxfZHJp
dmVyX2RhdGEgPSB7DQo+ICAJLmFkZHIgPSBESVNQX1JFR19PVkxfQUREUl9NVDgxNzMsDQo+ICAJ
LmdtY19iaXRzID0gMTAsDQo+ICAJLmxheWVyX25yID0gNCwNCj4gKwkuZm10X2NvbnZlcnQgPSBt
dGtfb3ZsX2ZtdF9jb252ZXJ0X3dpdGhfYmxlbmQsDQo+ICAJLmZtdF9yZ2I1NjVfaXNfMCA9IHRy
dWUsDQo+ICAJLnNtaV9pZF9lbiA9IHRydWUsDQo+ICAJLnN1cHBvcnRzX2FmYmMgPSB0cnVlLA0K

