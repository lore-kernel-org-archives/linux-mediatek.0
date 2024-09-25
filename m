Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982E4C369B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdd/Ll1kgyiaJgoOJ1uHbB4P3Cx852Vqa5yDcXkBPcE=; b=IZ/zI5rXJwC98aoe3b6isPKo4D
	p34EAVQ44XFBqHdnoPkJgjaCmW1tsYQdRqt9Hi/+sHt8ijQYdeCoFoLfagc0apsxcqpv+TbtvGNSy
	Y9ctdD9mU8wkUEEx32FazdQupZ50YeXuJGnLt0XQyvbuD7E06+TnFYSr2JStB/Rdtp68aSTbiDia2
	Y+mzjHqRzP9LlvWrRR9Id+uaYcCHuaqBzUClGcr6c6XpVV/lOd8R+5ZN2zkb/S82rRvn22M/ehc7b
	kRWpX2kDyirn/fG8HT8H+VsVrXvhWsLFmx+gmAOuPHCNLMPMOohVRnIr7Xp9vtwzHAKe/teu9BGGy
	A8VJDj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stOSZ-00000004dEw-3aq5;
	Wed, 25 Sep 2024 09:37:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stORJ-00000004cyg-3Ti6;
	Wed, 25 Sep 2024 09:36:10 +0000
X-UUID: 92bbb3de7b2111efb3adad29d29602c1-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=bdd/Ll1kgyiaJgoOJ1uHbB4P3Cx852Vqa5yDcXkBPcE=;
	b=JT8fsQnCXl8iLPBAugAuvnFiDIDbyElDec32YVZbceQegSmzwbesv4ZXtTHN5ZXEbUj8q0O/4Q2Rb0FKg6/0c2qu+nhXeFkd6kdJGYB2czQFMv3X1z6/tT//PVHMo1FbHvMbFNnI2/Ri95vOfwVgn9mpjaSTRuAedUBTg9+oAo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:cb13e9a8-8099-4f91-80e6-a84cabafad13,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:7a698a9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 92bbb3de7b2111efb3adad29d29602c1-20240925
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1294790547; Wed, 25 Sep 2024 02:35:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 02:35:57 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 17:35:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVt8XNAX8S1NrL4FTbypiIH7Qn21FXcueyfJ3ZBTlzKgjvt8GWctkQI6T10E74IDhaa6plggFqC7Fuq54nVpAgosgzp98epAuCe+dP1xo4F5OtNe4MiylFZcy7AQrPyj0tM5aKeG1oOUTu5CCIjvS0/nQgF6l8t7rRsvCsu2fZ9Ui2/LxZCjql2kJsdeXBoJvMpu5W4Dy8F+ftqD7DABfr9Z9V29D5YZV0BIxwSixpvemk7hyADXcZI3kOBKwMEMOH7ihl4ZpmapI3DsGazOs1CIU1sIRkDgVd4ndDupxnuclvzKTYiMc1EkLbJy5/ZPYZ4sFaZNqsUn5RlcgSYvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdd/Ll1kgyiaJgoOJ1uHbB4P3Cx852Vqa5yDcXkBPcE=;
 b=T4WAID019agTLMxkyzi529VluMg6QnYh7rBq6QVouNzbe9HaCGaeRcqRe3PVJJFHfHvw7wZv6IHVmTmOv3xAqlI7q/2UeHGrO+LpO//xuik17ypomuN/eH1x5wWr3nsCqFonf1lCqlXbqbZmW2MRvrqDGzBDIThCGdgkc8ZqyJFhiD8AmElVfvXCRzYCwwbiY83QFaDiqBjRiQv4FeRobQRH20b3sFXSzMkc+hg6kGBM1ppTcJlRbCP2n3bq3PXksnw9RQLlt+vWYLR89ZQWNFuzOU+i+i89LqBavMW5SEWLJVqn4z5/lctTfuTjavx98FD6QhwILfld5W6Eom6ARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdd/Ll1kgyiaJgoOJ1uHbB4P3Cx852Vqa5yDcXkBPcE=;
 b=ZKvzeQ39S1c2/Ecf6gazRECe5dkmcNUaAGUolVuiIdpHDOThgRcnDx2sIoZcMwstiocjcXVQ5mS4EdyWj+tFkrZKbY4XXW/UkRsqJnr2g3/FXCwxh2yajKbbKAXiAebQA0IBSA0Ir54S34nFAt/KSRhH+HXDpuLr943lbQOmEWw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7502.apcprd03.prod.outlook.com (2603:1096:820:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 09:35:52 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7939.022; Wed, 25 Sep 2024
 09:35:52 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4] drm/mediatek: ovl: Add fmt_convert function pointer to
 driver data
Thread-Topic: [PATCH v4] drm/mediatek: ovl: Add fmt_convert function pointer
 to driver data
Thread-Index: AQHbDiYtnGVDWdsxRkSQpqKSCVP2YbJoIZ2AgAAetYA=
Date: Wed, 25 Sep 2024 09:35:52 +0000
Message-ID: <16fde40d5a4855488c58e6fef8509c18392b2cec.camel@mediatek.com>
References: <20240924014935.23677-1-jason-jh.lin@mediatek.com>
	 <dbb2722698d3b36100f0ed2bfeec92441cd4ef45.camel@mediatek.com>
In-Reply-To: <dbb2722698d3b36100f0ed2bfeec92441cd4ef45.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7502:EE_
x-ms-office365-filtering-correlation-id: 865ab6fa-a298-4abf-6a92-08dcdd457290
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SXJTamFVbW5XYVlCWUVDOUJONG82NS9FZTZlZWxNc3I1V0Z4U3BCcGVpVWJC?=
 =?utf-8?B?VmtOdms5dkJOTFhYYjBBcnk5ZXdxUkF0bnJacVNUYVJWQmV2ZHJnMU1JOTJX?=
 =?utf-8?B?UW81b2pLcGZPSHY5TExXTktvZWlROTd2ZE1aMm55MDN3UXozNEkxdUlMY3h2?=
 =?utf-8?B?bWphS3kweG5KcXM4LzVuaWd0MEVSSlo4MTY1bTBjVklkeXFHa0V6UEZLTlZM?=
 =?utf-8?B?bG81U0thSTM2NE5wekdlNXlaWHdPTzhqUUt3TW95WnBZUWdUZEV3S3g3MkFo?=
 =?utf-8?B?TkUrT3M5RHR2L1JVMkxnRzJ6dWxOSzJzS0I4Y0JDSHVFSkpzUCsxWEF0YVd4?=
 =?utf-8?B?NVRxS09oMHZvREMvY3pXcFZ4WTJOOWF1RjJCMTVsVC9vSHhzSTdxMFFqVDVZ?=
 =?utf-8?B?T3U4QkdzWFQveU8yUUlCRzlwZG9kRVpuc2FSMzFCdHJqNGU4a0pnbkVDNmwy?=
 =?utf-8?B?WDRJcUVRYXBUSTFNYUtrZDN1SzJoVXdNbXFtQlNsazcvWFd0ZVlTTjBMWG1z?=
 =?utf-8?B?cUFQUkFMK3FvTnRlNG5EV0pDWjhFUHhrb1hFV015WFpLaFFJMU5VYXJXZmJt?=
 =?utf-8?B?WHRxdTNlZE43SHgwNVpZYzRSdXlTVVJtVjRreFpnMURaK0N6ei9MYXRjcnor?=
 =?utf-8?B?dE5GT04vNDhDWlU1MzN4ejBKRU5wd0RxbkdvdkVrYldxZGpVaVJ1Yk9OdUdV?=
 =?utf-8?B?bE4zRXFUWGhRZDVQSVAxSUNyYzdpVHdIWGZxTXhmQjRiVjRxUCtoR1Q2aG9G?=
 =?utf-8?B?dzBiWmdveDlqb05DcjErM1VOb2VWeDY1ZVFxVmh1Y1MvRVI4RlZNWjRITTl3?=
 =?utf-8?B?Y2lHZHBJc3Y3TlF0dTdyeEtaakl6KzkyQnZuMWNxYmFheVVLc0RvN09Jc2o0?=
 =?utf-8?B?T2FPVlo5Umw4NGpQb2hsU1ZOYlF6VFg1ODVzSE9rUEE5ZHoxUlRSOTVIQk9G?=
 =?utf-8?B?WFZ0aGp6U0d2cWpESi9CeE00MFBHdmc0cTNoVndZVXU1TzdoNEUzVmc5MmNr?=
 =?utf-8?B?bVVrNEVjSnhJVC9na1kyVTBpQlBQK2tQTUF1cmNNOHBvSlVtMVh3bXQycHUv?=
 =?utf-8?B?RlJnMkpSVko0YTVxQVJXeG1mYnJRQWZUeks4UXcvSTBHRlJKVmZXeEdsR250?=
 =?utf-8?B?aEhzOXBFYmlUL0JZbEFkTlpKU0xWbWpJcGhsS2t4bHV2Y0k0SHhMYytUb0sr?=
 =?utf-8?B?R0NLS1RMSkFDa3piTnNkZktCeEtVa1R5THZqVitWSis5dEZxbXZiRGhibWJY?=
 =?utf-8?B?TGxXeFQyeWdsYmRmbG1kTnFzOU1QOTI0UDQvT1kvMVk4bThMYnNXL3FBaUg5?=
 =?utf-8?B?TUJYRVpPZUZrVExLb0hEQlFJNnhKZ3gvYmU2ZzhOMm1CcWd3YnE1QzhZYkdP?=
 =?utf-8?B?TGhqUmJidE1qM1ZQVHJPckdlekZLQ0dFczdIOWNsMTVhaXZqTFJWSVRHMlhU?=
 =?utf-8?B?cTVOVjMrT3lFbERiazJlRE9wMzBzOWdTcUdrTXFzK3lEcU1IL3UzdnFtK1VX?=
 =?utf-8?B?TVJhbC92bnBmdE8yejU4S0ZDTFV6U2V5QmQyb0l1Q3k5ZnU2T3FmRk5RMitB?=
 =?utf-8?B?d3RJbk9aSlpKNGJSYlBXOE5HTXZKL1R2Tm1LQUZiUzV4d0lLZTlEaTE5WmFy?=
 =?utf-8?B?YllPb3cxeldxQnNZbzVsVy8zOThod2ZBTzVlQjNaY3pCS1dGTytxK0YrSE5t?=
 =?utf-8?B?WG1JZ1pQa250clIvcURldkJ0NWlXb3JQM1lpRDNvak1sU3ZvcitUVUtOMVRQ?=
 =?utf-8?B?dVZjd0x6M2JEN1J5V1dsMnE4NjJaSjVwNWlTejY3UkVqTVRaUGpYeE5jM1d0?=
 =?utf-8?B?UVdTVFVwcjNCM3dheGtkQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2tZQ2l5WkVlMG1Wejk0aHc4TVFITStwTCtYTUpLQk9LaXVkY3RrTDNWL1dF?=
 =?utf-8?B?U3BoYXV1ME5FTkE2Ylhvak9tSHlWREJ0VWF4UXpDcURBNlhWejUrT3Q5bGZi?=
 =?utf-8?B?cmxhRVI0NGVOTVpsMkpOTlpNU0hLM0JReDVtZi9RQXA4UlpFd0FMYUdUYTZH?=
 =?utf-8?B?RGVvNGNIb20wcHV6dURnT1ZnNngvczhndkVkbGtZazhUZ3phcmloejhOTUlV?=
 =?utf-8?B?R29WZ2xhU2ljREtySmRDeDFBUmk1NjBEaWkyZzBRUnppaWJUWGFxZ2xFbFNG?=
 =?utf-8?B?MFFvdWtlMDZwMVZaMnNBQmxORTd6Ni9nV0M5UDJQbG41SWQxRURpYjFPYXN3?=
 =?utf-8?B?WHp3T09Udll6S0F0ZlNDTkdiMHJsK203TElGZFBTdVFVbUU3RGc4RHVLc292?=
 =?utf-8?B?Y0RUbTZ4bitIR1l2K1JlZmpMRTcvQllqalRjeXBPcjFZdTgvbHIvL0p2ck9U?=
 =?utf-8?B?K2JPUlNmdkRHcktNMnI0ZlpTSjJJVUE1REFCOGd0QnJ4OTh5RUt4andtVHJY?=
 =?utf-8?B?Zi8wNkFPRysrbWZNVjFRQ0ErekxpVXE5OTdyY0thTG5XOEw4RjNieDlKbHh4?=
 =?utf-8?B?RTMyTlV4OFkwVTB2ODZHaXBxcEdMenEvK1RpSFJTcXVzUmd5bi9ySTl6am1u?=
 =?utf-8?B?SXNKZFN5d3lmci9oejRtMUN1VFNXeTJBTFg2ZHJ3cVRNcnZsc1R0clRuZFFp?=
 =?utf-8?B?c0NldFd5cmNwZXBsTWtlZUJBK2RrMmxYVENlN0l3VUxyZ3VzOS9jRDVHZkd1?=
 =?utf-8?B?b05nR1BhUUNKRGR6bGxFbVE4VEJQSUxoSmlGRDYrYldSVTRJUHd1TzUrcERB?=
 =?utf-8?B?aEUweVZDK244M3JMQjFjd3pmdlp4Nk9hUmUvMjhzajhkb3NDSmQyNHlqMHNw?=
 =?utf-8?B?NmM2clpLWS8yY0QxSkl0RWc0ZFl2aTJCMjErcHJ3OGZHUkh3TmpPdDFLYzhF?=
 =?utf-8?B?WHhabkNzMmhMYnExUDJ6cVBWTWZYMDlWZldQMUFzRkpFdU5UbkhxUDRMS0tY?=
 =?utf-8?B?bUp3L3pMeWI1aU9NZ29YcTcrQ2V3azdwKy9PZE9laHJjbTFrQ3RYOGZuUHpm?=
 =?utf-8?B?U1Yxb0ZSK01tTE5FMUFMYzV1MU9ITXRERzdBRjJiNFJPakF5ekpYWFRhb2lK?=
 =?utf-8?B?THFMdW1ML3c3b0VsdVpiVWpNMit1c1JHc3F6VkZBcHVmcWFDbCt1WURNL2sz?=
 =?utf-8?B?enBkRjFHbzZwQW44V3JFWkhIT3lhdzRvRW1QQ3Z3dDI5enN4bFFsMjFKdTlC?=
 =?utf-8?B?aW9kYnI5cTJVM3JCeVdVRE5NbTFWTzRuOUljb2l6b1ZhV2t5enp1QXRHaGU1?=
 =?utf-8?B?RjVsN3JlRythM3NOcWUyR0EzR1FYVHQ5T1hHTmxWazhMM3RyczVpMjhBenNu?=
 =?utf-8?B?SThMNDhIb1Y4dW50MTFjenBpeDFHRHBUdExBOUtmcHdPWTZDZ3J1SkpKM0dR?=
 =?utf-8?B?TmpKRDVJbVR4bEUwajJXNE91blJ4dU5BQXRGU1ZTN2hxTWh5Tkp5TkpWbFp6?=
 =?utf-8?B?SnJObUd5b0tvRi83UVBOUHVtMk8vck9SUmsvZDFGdFFSa3BjY1NNMGhFVTNR?=
 =?utf-8?B?a3gyaE9yOXA3Y0JyNm1HS1U0d3ZTV0ViSEJlY0tEYjhmTDlOQ1FCWGlKY3pN?=
 =?utf-8?B?aDlDeWM4UlhkVVFKSGdCR2xqRHdNOGxwY2RTdkV0dit2aWR1MEJwNzVYSXJ5?=
 =?utf-8?B?Tm9lN1YyaThYZTJwYlo0V2FVTWpMak1pMEVoMTkremFhWEdaekh1ck8zeWdX?=
 =?utf-8?B?UDlzZmEwcThRNFltWlZ6U3RYY2VqY1VHRlBVcWI2cVZyMUhOb1BSWm5CQU1D?=
 =?utf-8?B?OXJTb2hXSEN0REU0OXdUTnVMU2hJZVFHTnJiRDNidG5ia0xqMnNNQnAwalV2?=
 =?utf-8?B?cW9xUGlySmNRQVI1VlhhUFVWTm9INTRxNy9Ub1drazRuVjJtY3hVQWRrZEZx?=
 =?utf-8?B?V093bm9NbXF0VGFleEt2VG9XQmNwMFhFYlF2VktGc0VjZEFldUU2VlRYNDI4?=
 =?utf-8?B?aldIazkrTEV6YzNsYWZ2cmlUWHUyUC91U255Z0tKSXM5ZjlEMUFNbG9VRFJ6?=
 =?utf-8?B?dWh5amg3enRPM2JDT21tanAwM29wdU5DbmRmNUU0UUlVTWRiYjF5ZEJ5c1lM?=
 =?utf-8?B?Z3dCMkIxUldrWFhSTWpaOUJmbHhYdk9IZnlkSzJ1ejlkL1UwVGhyUDJMT1pW?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80D1FD4B7936684EB420343ADD1DB4D6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865ab6fa-a298-4abf-6a92-08dcdd457290
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 09:35:52.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCmI/I7HQT7cczi8Z7wEtcz2K0HVPEVJ7JG53wUuxcLwNK3vrf+ySwzm2/8KxLjK8A5Q42O3fF9vaPP5XzHX44F5ntIcBTLf+zuAEKlJI0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7502
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_023606_366005_63F3DC0C 
X-CRM114-Status: GOOD (  22.16  )
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

T24gV2VkLCAyMDI0LTA5LTI1IGF0IDA3OjQ1ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gPiANCj4gSGksIEphc29uOg0KPiANCj4gT24gVHVlLCAyMDI0LTA5LTI0IGF0IDA5OjQ5
ICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gT1ZMX0NPTl9DTFJGTVRfTUFOIGlzIGEg
Y29uZmlndXJhdGlvbiBmb3IgZXh0ZW5kaW5nIGNvbG9yIGZvcm1hdA0KPiA+IHNldHRpbmdzIG9m
IERJU1BfUkVHX09WTF9DT04obikuDQo+ID4gSXQgd2lsbCBjaGFuZ2Ugc29tZSBvZiB0aGUgb3Jp
Z2luYWwgY29sb3IgZm9ybWF0IHNldHRpbmdzLg0KPiA+IA0KPiA+IFRha2UgdGhlIHNldHRpbmdz
IG9mICgzIDw8IDEyKSBmb3IgZXhhbXBsZS4NCj4gPiAtIElmIE9WTF9DT05fQ0xSRk1UX01BTiA9
IDAgbWVhbnMgT1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODguDQo+ID4gLSBJZiBPVkxfQ09OX0NMUkZN
VF9NQU4gPSAxIG1lYW5zIE9WTF9DT05fQ0xSRk1UX1BBUkdCODg4OC4NCj4gPiANCj4gPiBTaW5j
ZSBPVkxfQ09OX0NMUkZNVF9NQU4gaXMgbm90IHN1cHBvcnRlZCBvbiBwcmV2aW91cyBTb0NzLA0K
PiA+IEl0IGJyZWFrcyB0aGUgT1ZMIGNvbG9yIGZvcm1hdCBzZXR0aW5nIG9mIE1UODE3My4NCj4g
PiANCj4gPiBUaGVyZWZvcmUsIHRoZSBmbXRfY29udmVydCBmdW5jdGlvbiBwb2ludGVyIGlzIGFk
ZGVkIHRvIHRoZSBkcml2ZXINCj4gPiBkYXRhDQo+ID4gYW5kIG10a19vdmxfZm10X2NvbnZlcnRf
d2l0aF9ibGVuZCBpcyBpbXBsZW1lbnRlZCBmb3IgTVQ4MTkyIGFuZA0KPiA+IE1UODE5NQ0KPiA+
IHRoYXQgc3VwcG9ydCBPVkxfQ09OX0NMUkZNVF9NQU4sIGFuZCBtdGtfb3ZsX2ZtdF9jb252ZXJ0
IGlzDQo+ID4gaW1wbGVtZW50ZWQNCj4gPiBmb3Igb3RoZXIgU29DcyB0aGF0IGRvIG5vdCBzdXBw
b3J0IGl0IHRvIHNvbHZlIHRoZSBkZWdyYWRhdGlvbg0KPiA+IHByb2JsZW0uDQo+IA0KPiBUaGlz
IHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUsIHNvDQo+IA0KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNr
Lmh1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IEJ5IHRoaXMgcGF0Y2gsIG9ubHkgc29tZSBTb0Mgc3Vw
cG9ydCBwcmUtbXVsdGlwbGllZCBwaXhlbCBmb3JtYXQuDQo+IEluIFsxXSwgaXQgZGVjbGFyZSB0
aGF0IGFsbCBTb0Mgc3VwcG9ydCBwcmUtbXVsdGlwbGllZCBwaXhlbCBmb3JtYXQsDQo+IHNvIEkg
dGhpbmsgbmVlZCBhbm90aGVyIHBhdGNoIHRvIGxldCBvbmx5IHNvbWUgU29DIHN1cHBvcnQgcHJl
LQ0KPiBtdWx0aXBsaWVkLg0KPiANCj4gWzFdIA0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWs/aD1uZXh0LTIwMjQwOTI1JmlkPTQyMjVkNWQ1ZTc3OWI4NTlhNjY2
MTEzMGEzNDQ0ZWI0YzVkYjc3ZTUNCj4gDQoNCk5vIHByb2JsZW0sIEknbGwgc2VuZCBhbm90aGVy
IHBhdGNoIHRvIGZpeCBbMV0gaW4gdjUgc29vbi4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K
DQo=

