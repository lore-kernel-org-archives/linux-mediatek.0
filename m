Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FB9C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 04:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F++ezUOIA+z/O32RrjUdspzfT3/jKpowshqYGrQ4Gr4=; b=ywEQ5LqgwlS8VHVFOJy0eI+sLf
	lEGgwVwYPF58E5X/kimgCXcVzLLDvLhYJydefqAIPavwrzHE2tDL6huPQwHmK+ySFNQjfpYuaDa/O
	JhYW+5K1mPchVimH+2qV2BHrSIT9OuFJmCXdDAuc/kl+D4/O5VltAh3eCq/A68QkG8e3EKM1o2rnp
	cbMOE7w9UEnfW4AUTkpsSl94ARnTUxel1C12dEPmjYK1JD9qchUGSCWxq56mjjR0AI36TGsASChpL
	3DX0Ry5M1MTnh7GXb8qYEJ69TA+o/npJMaflmkGk7MZiSWOODxhEm+doWkvN0WzrEn90jMxBbJVMU
	SphKoJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbYAv-00000003mpp-1LIy;
	Wed, 07 Aug 2024 04:21:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbYAs-00000003mp9-0WAX;
	Wed, 07 Aug 2024 04:21:23 +0000
X-UUID: 7c65816a547411efa6c87f6b4542ff6b-20240806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=F++ezUOIA+z/O32RrjUdspzfT3/jKpowshqYGrQ4Gr4=;
	b=j8laq9FK3x4fRJpQdUywMqH8NuRNoYBtrhr+LlLQzcLI+AYB6NbqYaW2PCjdheEr3bRJl3i+eX0GoIsscmfTBv4CB5UB3LlIT/WlWVDdMcJ5G05MFrq2UocZKivPvs9aMTyyr2B7OsFr6M8DdtOASpESEJy0tSnxqfVjuvWKsgA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c9c672de-2c87-45b1-8f41-b9e5e7f0dc00,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8ab543fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7c65816a547411efa6c87f6b4542ff6b-20240806
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 74315626; Tue, 06 Aug 2024 21:21:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 12:21:12 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 12:21:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irzo6NB/UKc+ROMUeqv0ajBCnZfbs4ZouKsKHRauuOx4TlN7yqUua7fb7pyT4Iss29DVSa22aO4XkYHO7xwi7H1loeEALAZ6O6s0azdGyy4fvCBP2c2RQoyymmY1BdkZynZC9JhHtv11V4K7N8o7nyujbfLME9zKRo7qvNHj/bDXzYl3reZ0bAYn8S0Ut9IP6RCjBUqUyyJvMjQ2nvDX0mHKF7mYT9WPSqH2asA0v2xw4g92cM5IyiV8gWdYoCV+eQ8jbZ6R52ZbHSdve1craJfIx5BcyCPGyV0EZTNgl6zv4fOaVzR7HlANFM3TsQcAEtB36kYEbvffnmnF36c46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F++ezUOIA+z/O32RrjUdspzfT3/jKpowshqYGrQ4Gr4=;
 b=sjwFefvY7PgSD6S4pBJXF3S9FoWU93mfxShwowoqkD+2AfwDX2sV0y6hTjNM0YXNl8L4pdryQYXZGFWvys1yh87C5Zdax0XHav/0m3B+km7XjukNiaP/Pw4Hapvecrdycuf1/4K32F33qqOUjYv2N6uegQlO7+HTyKQ6RvDb5f56hIvDFDDZAyTNVc4OpJ1KJy7TTFckp/n73wwovx3Rp4RVB6lOuOFIWM1ArPsHltQatv52vpuVCz0AYM3IiC3dusljCcwrdGYj/AiUBg/ml06f6mDgPAbmYX41YNWGdNTsPNghJhfZcQLLULoE/Y4ptUtvSJzlGSMVz3DZ4HIhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F++ezUOIA+z/O32RrjUdspzfT3/jKpowshqYGrQ4Gr4=;
 b=BNrrJPDWDAIQroY1ezxozZnSijqAuQa4yVUqOm/D2st0Ua/ainrOowWn7AtosOjU13r/S6tKfRXYKCR1ZIRkH+NmiCuGXBHfUcQnwg4PvUDtvymKHvdkY4flXrW9StPIInwVsVJtTiskKI6QokVzlB1SU+04P3vfI0j+f4uAt0A=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by TYSPR03MB7308.apcprd03.prod.outlook.com (2603:1096:400:416::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 04:21:10 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::e70d:eef9:eaf3:c45]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::e70d:eef9:eaf3:c45%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 04:21:09 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	=?utf-8?B?WVIgWWFuZyAo5p2o6JOJKQ==?= <YR.Yang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz"
	<perex@perex.cz>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as
 volatile
Thread-Topic: [PATCH v2] ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as
 volatile
Thread-Index: AQHa4+8R2UJigwkMv0OKRL5WODXwELIbOpUA
Date: Wed, 7 Aug 2024 04:21:09 +0000
Message-ID: <e73062ec5d572e6f164ff445b616f2e9662fc0ee.camel@mediatek.com>
References: <20240801084326.1472-1-yr.yang@mediatek.com>
In-Reply-To: <20240801084326.1472-1-yr.yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|TYSPR03MB7308:EE_
x-ms-office365-filtering-correlation-id: dd48811b-69bb-4772-b86c-08dcb6985d4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dk5LbDdEOGRFUHJ6QXZsWWt5b29oUFFtdC8weG1SMklBeitmVXpORVNYL2s5?=
 =?utf-8?B?MjhkM2I5OHlLYzMrbzl2Q0NkM1BQL2xPWlY2NU5QMDVFaXRzY3Yvd1Eyem5v?=
 =?utf-8?B?cWlWa2QvdmVDbzM1WGNlQjNJMW1wQk9jbkYyWmVIL1YyOVZXcm4rVUVzZ0NK?=
 =?utf-8?B?cUc4VTAxQlM0Y1NSeDB1dklqZ2JIMUw5TGwwSkkwaC9xdlBOYldwdFhyUnlz?=
 =?utf-8?B?S3dWUXUvRW9KK3VhcENwTVVUZkx0bUtUQmJDZE5KT1F5WWFzOHgvUHZqL0Uw?=
 =?utf-8?B?V1JQS0ZKZE95ZFBzZlRrQWFDWVZuTEtwL3I4OTA0YjZMODI5YVYwZkt0Mmpi?=
 =?utf-8?B?Qlh4c1lJeFFPcUIvUzVsU0FsOXMwUm43ZEVRMExqeWc5Y3dWdFZEVGYrL1RY?=
 =?utf-8?B?cm9nN2U2M0U0b0ZOdS9NUi9rREZFK3ZxQVl5TXIrQ3RiQ2NSMXB4ZDkzMExN?=
 =?utf-8?B?Tk0wamZWczVHVXlDQ29Ham5pVG9Pem9ZQ2l1YVJ4VjkrMVBlaXNYbDl6bW93?=
 =?utf-8?B?T1E1OXVjbW1raFdmTkk5NFRFTDVKcnE5TFpzeGJ6NTlZMVRubUR5QXI5eUIx?=
 =?utf-8?B?T3RuYW40RUIwRHFrRlZyd3RESndyc2ZuL0JYWFpPYUxBVWphOG8wU2lrcFZL?=
 =?utf-8?B?eHhsR2podWo0QmRwMGkzWEZtbEpxZFJ5VnUrcys5Y1lZR2tGVUh4TnV1NEpQ?=
 =?utf-8?B?ZmlMSjFYanAwYlNyeTFKd1pKaG5LMkFXbjcrQTlsMkxJQTFPUGhqV0VmMnY0?=
 =?utf-8?B?Q0JZdXJ1b0ltOE9PdXExTmd5UmVwU2VLcERNQ2poWWsrS1ZSOUdZazVUYmMr?=
 =?utf-8?B?aWtKdFBQTkYwQkdoM3ZDTXRNcDNKWXpod0lEcktVcmFCaklvOUFJc3czT3d2?=
 =?utf-8?B?YTBpTHg1SGhBRjRqelUwTnlYSVFVY3lTcHE4STRZWEk0V2pHQS9tb0ZSQXN0?=
 =?utf-8?B?TlVsNnF2ODJSbmFkM2hselk1Mkh6eGtPOVdQYUZaZmFYd1JoUkdhckdzTTZq?=
 =?utf-8?B?aFdQTGlKelNYVHJnc1pwam5mb240Z1JOL3ZLNnkwRlZFR1RFY2FqSEFqOEN2?=
 =?utf-8?B?WnVwd1BmMExHaTVTSnFRWG0zekVZTTF4Y3pxRXFiVXZSZjBJNU0yRDQ2REpq?=
 =?utf-8?B?WWxqeCtvb0FvQmROVFdGall3UDU1VUVoWXNJUzRQVVdUemZYUVpaQmRaQ0tr?=
 =?utf-8?B?bmFoRm1SMnRETFo4VGQ4RW1SZjFQVVVjODJmVXNHRnhWUVV2U3doaEI1UnFI?=
 =?utf-8?B?MXBqQ2FzWFVmd2ZIa1kwMmJMYWV5NWdibWhFT00xWk5Wa2dnalRNY0UwdWhx?=
 =?utf-8?B?OFZFRUkxOFRlNXY5K0dXUnJrSnNUcGJINHgzUWtuQ1JpTWZuNHpIdkp4SDUw?=
 =?utf-8?B?UUJrRjNud2ExTDFzWVBEQ0t3ZWN4UW5jNzg2Z0YwekhRRUdKT2N2bVBpOXV2?=
 =?utf-8?B?VmozejNRc3JaTnlFakdBZk1qN0h6eTQ0WkZDYm91d0tXdDVJaHdvUlJQUEU1?=
 =?utf-8?B?RnVKNmZmdUFZUk5oM2xNTDgxV0pHRlJ5TXBqUWhtRWEvTmptZ0dKNjRVdGJ0?=
 =?utf-8?B?cEhKUjhmMUs0RW04Sm9XTmlTdWdTOXg4ZVI0eFB1N1o1TFZPK0xlN1NqZUkr?=
 =?utf-8?B?WFlyZ3hEeGExK3FYK2ViMTFuTkV0dDNFeUoyVWhHc2ttSUViMEtZOEN3SjNi?=
 =?utf-8?B?NEVwNWd4alNHNFhXSlkwcElSY3NYdGhYUFBlSnpXUzQ2emVYajNYNlQ1dWI4?=
 =?utf-8?B?azRoL0htNzJRZnBlcXhWRXFQbTVGRTVVK1JvSTJrTXNmakRmekozL2pkd2Ni?=
 =?utf-8?B?Nys3NzM2NXRIR2ZPUHVXQXRGYWQyTzM2M2hrTWYydXU3RGZoWVBYcXFhbU8w?=
 =?utf-8?B?WEtEU2hqZ0duR2g2WnE0VVdKM1R4anE3ZEVmQUl1Zlg0U2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHNRN3phSEtmQVJ6b1V3VkZnUEJ3dkNKK0hhT0NqQXJZdG55bHNXWlY4ekFy?=
 =?utf-8?B?WjhQZitSNmdFdEU3eHdZcmVRMVNWSjdRYXd2bUFVNTlXSXVRc2VyVThHQ1c5?=
 =?utf-8?B?MDlqZXJYVUpScTZpMXJZS0Y4d0w0UDhmSm9pQm44cVluZHJQblArMlJlL1Ix?=
 =?utf-8?B?a21lc01RMXp6elhVLzZOK0p6d3lrbkF3c25MTWxFMlFYRFJZYyt2bGpUSnF5?=
 =?utf-8?B?YklYUTA5VTBicDN4YTRxUjVqandMcG1NZnlXOHZkdEJQSUQ2UW5aTTVTM3VD?=
 =?utf-8?B?cWV2MGthYTN6Y2d1NExtZ0tqZTQ2RGVJZ1VKZmRaS3F2d1ArclhhVldLdmZi?=
 =?utf-8?B?UGxxWEJDd3hPRmQwUldYUVRVb3lkUGd6RnRMREJhcjZWS0ZqZU5rVDhVVWI4?=
 =?utf-8?B?V01sQUdOOEZodkdOV0JnZUlHbnE1VnlxTU1tQ3RvSnlOUE51djg1UG9nbUhI?=
 =?utf-8?B?MUVYN0VXMGVJbllUV21zeUx6aXhuSmFMem8vdU1sVWIydHljUnJWTW8rcXRr?=
 =?utf-8?B?cmVMdzZTS05QWGUwc09mL3NVemQyWU83a21hbUpadnA4VTNqcDJ1NUtPeXJY?=
 =?utf-8?B?ZGhwT0hETTJkSXQxSFVaM2NKZ1lhcWRic25qUWpwaXRXRnMwbGdkQnFEL2lj?=
 =?utf-8?B?MnIrTEVyL2VBYVAwYlFiL3JKN2E2WHpDV25QYVYzWE9OOHdMUktkUWZPK0pJ?=
 =?utf-8?B?Q25xZVZNQU5SU2daM3NaYlFodjBNSjY0MDAveE80QkxtUXp1R2p0R0ttMnk4?=
 =?utf-8?B?MlE3ZUpsRE9kRU9JNG9oQS9CYXZPQlNXNzBjOWx3c2tFYVFzTUpNWEdKeHFk?=
 =?utf-8?B?aytZUktpMy9pWjgrWk01bkxuRENodEdVK2N6eWZuV0I0WFNzZFlJWnJZZFU2?=
 =?utf-8?B?aEloeWEvYzNianNveHpOMVJFaXFWUGdGc256S2JwNGI4cyswVkJPWitOdk9a?=
 =?utf-8?B?WEVxWjVveW43aVQ2czB4aGxjNUtZd2tvRGZyN3RHOWU0N2lBV0ZlRWo4UXFr?=
 =?utf-8?B?bG1laGRjcUtBUlJnNlJmbFFBaGZjc2ErSml4eTBHbHBoZ21ZcUlSMys3TWtk?=
 =?utf-8?B?MS9QUjFMU1Z3MTJvQjZkWEh6aGR6Rlp6ME9IS1dPSEkyMTRrNElWYm5LaDZk?=
 =?utf-8?B?VU5HYlhqVG9tUTc5WVltTlk5YjIrY2RqSTJ5Qzc3TzNxK05PcmV4M0RrMFBX?=
 =?utf-8?B?RnRKOHRvWVdnekhiSjByNVJIYzRRenJDSitiMWFCNy9MSFd6ck82Mk95cTd6?=
 =?utf-8?B?YjhFbjhHN3k3VVRUVmc1MngvRDdPc1prSmtDdWR1eXR1MUNYRXdLWG5pb3M2?=
 =?utf-8?B?R09COXBXQ1orT2REMVJpalM1SDd6cy9sYTFPR3QyS2VMd0dtTXFwZkNOcDc2?=
 =?utf-8?B?dGk3NnFTY1J4cDc2ZkVGa3lJMG5GYTR5SHdBeUtqdUdMUDIyb0dCK2FlT0Jz?=
 =?utf-8?B?VkF0dWtkTXNDTjVVb1hKNkx1K3FTalViYWtXckxrL0M5a2hnTnZlMS9GVjhV?=
 =?utf-8?B?bWg3aG8xT0tEZXR0S21SbDlCSGN5VDJvbU1CbkVXbFA2Y1lqS1dKNHJSWlF6?=
 =?utf-8?B?b3pKOGlwYXNac3JpNEZ4MStkdEVEOUhIM1RpNG9FMW5FeUdGeE1ZZjVCWTZh?=
 =?utf-8?B?bXFIODk2bFVYMmdKOVhwUVpwc0Z6cERWTnBLeW8vcGtCVldoR1lDazZLbGlo?=
 =?utf-8?B?eHlwKzF6S1dER2YybnVscjRwd1lMcUx0a0gzbk5ISmZEUnYvZFpIR2RlaUZs?=
 =?utf-8?B?RkgxRHc2UjlvVzkrV1FtcDVGb3hDK1F2N3gxdk0vMDJEZmNnVGV1NHpQQUZ4?=
 =?utf-8?B?OWNYOTRucExyaUFKZDRFQWhGK0VDYXpSNGtHdzZFNXhNeXpWOWM5aGVBUzBw?=
 =?utf-8?B?QkFINzhYc0lTakt3SXpRMkxEa0dqTVVRTEpxK1NNdVNCTnJibjFRNHZMT0lO?=
 =?utf-8?B?MHBlTUJPU1JzZWJ0NFRQYzZQc1RNSU1Ca0pJTUdMcmhMWkxOcFhLTXZ0V0tO?=
 =?utf-8?B?MHowckNGcVFuSE5mYzF5azlWS1pjV2JUY1l4RytaTloydFFrWTg3akl2bDdG?=
 =?utf-8?B?bW1qUWJ5M0UzQkxTV2JQc1dzR3ZFcmh1R0RIQUVYNm55b3J6Vmw3SjNUeHM4?=
 =?utf-8?B?OUpjMThPcWVxc3RyMkdqRVIyMlVzY0tOb095dXFBWWtPSzEyYU1lVytTU3Y1?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E041E0E94534C4F9B52D735CAEB46E6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd48811b-69bb-4772-b86c-08dcb6985d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 04:21:09.6084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ml26fxTIp2QM32JCvGdTxPKPKnTADYZ2z2uQ00GoNqIuU1d7bCthkFcjLkk3dJe5PleQNKuauJ1TRJo6sc9ODw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7308
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_212122_202773_7F483631 
X-CRM114-Status: GOOD (  13.13  )
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

T24gVGh1LCAyMDI0LTA4LTAxIGF0IDE2OjQzICswODAwLCB5ci55YW5nIHdyb3RlOg0KPiBGcm9t
OiBZUiBZYW5nIDx5ci55YW5nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBBRkUgQ29udHJvbCBS
ZWdpc3RlciAwIHRvIHRoZSB2b2xhdGlsZV9yZWdpc3Rlci4NCj4gQUZFX0RBQ19DT04wIGNhbiBi
ZSBtb2RpZmllZCBieSBib3RoIHRoZSBTT0YgYW5kIEFMU0EgZHJpdmVycy4NCj4gSWYgdGhpcyBy
ZWdpc3RlciBpcyByZWFkIGFuZCB3cml0dGVuIGluIGNhY2hlIG1vZGUsIHRoZSBjYWNoZWQgdmFs
dWUNCj4gbWlnaHQgbm90IHJlZmxlY3QgdGhlIGFjdHVhbCB2YWx1ZSB3aGVuIHRoZSByZWdpc3Rl
ciBpcyBtb2RpZmllZCBieQ0KPiBhbm90aGVyIGRyaXZlci4gSXQgY2FuIGNhdXNlIHBsYXliYWNr
IG9yIGNhcHR1cmUgZmFpbHVyZXMuIFRoZXJlZm9yZSwNCj4gaXQgaXMgbmVjZXNzYXJ5IHRvIGFk
ZCBBRkVfREFDX0NPTjAgdG8gdGhlIGxpc3Qgb2Ygdm9sYXRpbGUNCj4gcmVnaXN0ZXJzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWVIgWWFuZyA8eXIueWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0K
PiANClJldmlld2VkLWJ5OiBUcmV2b3IgV3UgPHRyZXZvci53dUBtZWRpYXRlay5jb20+DQoNCg0K
VGhhbmtzLA0KVHJldm9yDQo=

