Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCF1C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 06:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c2db92yvBtvNuagDfbPeQZPNF7xoSlQ9EFH0H1isu08=; b=k5c3EpwGrY9fWHKrwn7Ydi25Ls
	SNmdOsacV8s8Gt0ldU/GN1gIQmvh0RAueCfw3wJbXPgGUKWUNp2jQT2G7lR7c9BApaKSVtmrj3dT+
	e9/X2+SnOzpj9fhgw6fhzkM2P4diDzNYRzG5K8WEkgH4dOwrZFPfq0esfFNAWQt1XDMDi4H7vVPUD
	41qwWuke+K+eQF2WdfiEGoMzktpL7dpnNoEyz3PdJ0nuqlwKMkGqOVkwrG+gAQoAmaEkG+lvguR1q
	SaP3ZwtTF+kpm7Z+PAgUL0KwtxVXehhhTDSfwVQzvAMmTKWUUOP9gV1wxO44mgAMjkQJu4K4ZzwvP
	O8/lu7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnYSR-00000006116-3SiD;
	Fri, 22 Mar 2024 06:32:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnYSO-000000060z6-1jBI
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Mar 2024 06:32:49 +0000
X-UUID: f9716ec4e81511ee9aa9374d6d45775a-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=c2db92yvBtvNuagDfbPeQZPNF7xoSlQ9EFH0H1isu08=;
	b=o5f5qNTLloj9Bq8/K4WaSt17h/hIMbro0DbfbyREUZ6ww0dm7CDgWYSMdwbZFJvH5y2b9bW9uKSLygPvF3iUgSTMYjaZAP7jk7w4s1a9sKSvrsOHBibxnnq3lMyftDrFhqtoB4PkJ6x1zbvQO7LQNMdSwO4y/n8XEjuG5crBlBE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ca4cd31d-3ae4-4688-bc91-bba04264d9e5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:2,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-3
X-CID-META: VersionHash:6f543d0,CLOUDID:e58b4d85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: f9716ec4e81511ee9aa9374d6d45775a-20240321
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 344901437; Thu, 21 Mar 2024 23:32:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 14:32:33 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 14:32:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSGSUPpr8yUKe8hFNd1aPNqPDXURAOpCzvLNgqN1qbUxkLdz88MI64lmydzM3gvPzponMyGxxIdykqPjy33H58+rFANuocy2EfwnEGcLKvXtQEh0UpFdTnNKhTcf0UlfnwnT+/2nRUaBZ6gc28reMC1IMmL+K3uxHFMFCeIxQzY7OXf/7jkRfKDRanB2IAMqJ4xhTxtRvoWK6YLtpRQDszjwjGUBCswjIRM2ax2UqJ+yY1oRvdR+mY60KkEdI/JxGcczQgPpW1tLaoBwvQ0f//c8Pl+8G4pqxiU7OJyDO0SPqw1S4DKIbCAMRcyvMOpvhG5VUhSdE8nY6N5g0RMP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2db92yvBtvNuagDfbPeQZPNF7xoSlQ9EFH0H1isu08=;
 b=h3Ieuw9o3KB5HiEGhctvA4PE+s+orjLjXGF58XmmRSUjtWgEn6B18QePnHEARQoofo9WVArqkRHGRaYHc1+UUqyL5W0QtQg8LxuXnFigFwTQPGm+tNGksA828frZKH0TyZzshIcvjB/VTy+tGnQIqDAODhnwcf/Q222Unu/fUkII70ApVDXlL1lJc2lvgVkCtxlJkksym0hn86b9iDU6XWGMpoaNAzez5/es3NiPR1hoRyXYQkQZ/TaHAOa4TSRuh4yax/UFkdfoOH0TCMcP7lRSeBbWLNf/Vpd+roCETnWChMj00gTtTHCJpvyMkr5JPAs3VJRKP/+EoXsfgIgazg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2db92yvBtvNuagDfbPeQZPNF7xoSlQ9EFH0H1isu08=;
 b=IO3iVugkh0KNwetGprDOaoqvNt3P2QRDkIuu/iPswoMPs48GtkeFyLeMahCZhI9vpswfeS7GJM5q5qZcR69gcT96eSg/gXOwKRsPodVF7pGAWtZep+ow2nZJmvJRQAtCRvXWUcO9ueGr6iLzsKR8Q8Pvf0i/sqATtTmpUMjTU3I=
Received: from KL1PR03MB6002.apcprd03.prod.outlook.com (2603:1096:820:8f::5)
 by SI2PR03MB6464.apcprd03.prod.outlook.com (2603:1096:4:1a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Fri, 22 Mar
 2024 06:32:31 +0000
Received: from KL1PR03MB6002.apcprd03.prod.outlook.com
 ([fe80::aa3e:806f:ea70:5a19]) by KL1PR03MB6002.apcprd03.prod.outlook.com
 ([fe80::aa3e:806f:ea70:5a19%3]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 06:32:31 +0000
From: =?utf-8?B?SGFpbG9uZyBGYW4gKOiMg+a1t+m+mSk=?= <Hailong.Fan@mediatek.com>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: [PULL] mediatek: Update mt8186 SOF firmware to v2.0.1
Thread-Topic: [PULL] mediatek: Update mt8186 SOF firmware to v2.0.1
Thread-Index: AQHafCK3LBmGukjviUq1hqP+kZ8hfA==
Date: Fri, 22 Mar 2024 06:32:31 +0000
Message-ID: <525b0c6c738a18b04abaec9cbd8a564ec8605630.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6002:EE_|SI2PR03MB6464:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kfMtfGMlYoVaTJRFHRlXtHohj91MMEe5afQJ7SKXlrncFocb3KzQXOlPPAphPyKc2fUg5F/W8RTz1Z2XOoDrtuUDeSO2hnJ6hh2UoBG3SXSC9ZXcLrzQMtu6hsAgJ143g8mDqZxxEXh831x1qF/0k/EE4cc4VdxbvJrCYHF+Juifyhh+GbAZ8QOmDDFXs9Ye/1ZQAZYWMO80iiiroWs/iGW97GQeRpjvD5oEo0F2b7N2ARLYUqlOElxgbqJhjJnICqvbq5QEidUO0BHeKxEOMuOac27eGaE59INw6EBAwGccZwZxtd1hJsZzwjPmlK7qmS8gcBplH4BVbW1Fld+7Hf/WyV6UeK3acsp9+gILYoM8ud2FaUNZx0BvOoHQINcIVdBkWQEcwtUgsEV0SGKgpIbbi2mDjkcVZ5tstGA+3+PtYmIJB2uHxSA2x5n6ZJD5ATfWHMTD0doP4TbtWvfITGo6tCKhdzjyP3l39DgIS5xfGsrF1wstPvJRJz9Gk26aHgZcG2DfNc9LrE+0usAvZvX2RfvdOQApxz3u0IwN+zcIdP9lFFM+e4Vn1PrW9jQwxs+lj7/bkBCfTadA8y4YPV7fdWeRLyzr6IHsNaMQz8U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6002.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXRjTHF5ME9xZVVZcFhuVXgvSVcxK01ZNHFkU0J5T25maGlEVnF2MkJHN0JM?=
 =?utf-8?B?TkRRSStkSGNhK0dQK29nR0s4M3lhYlozUlRVYlRhKzZmMU11T2c2OUY0WUYw?=
 =?utf-8?B?Z2lmVGt0dFpsNmw5STFDeXVUUWprcjJ4NGtYejUyOWNoUzlTS0xyd1Z1bE0w?=
 =?utf-8?B?ZzZEV2h2cVNLTElXN1VWWS9uRW4vYWp2bG80TEttRmxEY2FZNzFVRjY2NC90?=
 =?utf-8?B?dDZhOEN5b3ovc0xrUGkzZFdTU2k1MlF3ZS8xbytpNkhrMWdDaXd4Z0xtSkww?=
 =?utf-8?B?UU9RZTB2TkFQNnRPKzRWMWZ4MFVwSkd1VEhmU3FOa0lTT2Nid0hmQ2JWSmJs?=
 =?utf-8?B?TVFpQ00rbWFydVdtL2tuS2gyL2IxWWtsVzN0azNBMUNBYTJDNFlpbGxuQ3RZ?=
 =?utf-8?B?R2VGTXZYeGZ3QUR2NFZCR1AySEk5K01EZGcxTzZSU3k1UW1QVEI1dkdSZlAw?=
 =?utf-8?B?L0dmWmZpY1B5WXVVTFF2bUNwOEtQa2htcHFYV3FKTisxdDJCUW56YjZmOE0w?=
 =?utf-8?B?L3E2ck02cEY0amVkbVliZEx5SDBSNXR3blhjT2ZodmRRdUVDY2pNR3hUNHpK?=
 =?utf-8?B?blgvL1dWYjNhaWg4emdNRzBaSkUrQVV2NHB1U1k3NVBIclhabC9PU2RWT2RK?=
 =?utf-8?B?bCtQVlZTd1RMRjFoMmF2V05NQkpLS2lobjlMN3ZyYlhhSkVHSWIrUnRFU1Vl?=
 =?utf-8?B?NkRxdDBlbnRyR1BZZVdoU2k2ajBSK29SMXkyRkFMTWZ2a08rbVdJMVMzN0Jh?=
 =?utf-8?B?YWZOeUN2R0NGNUlBY3RCNUxVcU5EL1ZONGtrOEEvR2VwWDQvNXpuQldoeXB4?=
 =?utf-8?B?WDg2RWZTdGJPRENIUjNYd2NKRTM2bUFCdFRIUzhRUHcvbHJEbGdHWmEwb3BL?=
 =?utf-8?B?OGEzUkRGQmdsaWZkdElmcm03QnJ1Vk12MlVNdzdLMEpWYkttREtLR0QxQm1N?=
 =?utf-8?B?ZFBLWlhXYkg3dS9VK2EzS2I2WnBCWkpra25CbnBBWXVZcGZJRDBWL3hNRTcx?=
 =?utf-8?B?ZXI1RHBNeVlENXFsUVdmWVlwVEUyME5qV2xjSkljbXF5L25tY0ZSY3dtcTRX?=
 =?utf-8?B?dEkxRVpkNVlNeDZZa0hzRnozUWtkSlpyRVJFemkxaThTUmxxbnkrcDFUa2Nj?=
 =?utf-8?B?Q2dESEpadDU4bnB1dDJ5d0l3MFBmUk1QQ09udW1WR0U3WVNha2w3aSt3UU0y?=
 =?utf-8?B?VHJuOXVna2oyd0ZROFh4OGR5dnFKd1Z6RThOdmczUkhBaCsvdHFXQmR3bjdm?=
 =?utf-8?B?bXQ4SFNkd1Brb3BPNXNGeGxlMEE4eUx6TDdXSDVwRGpGenFSU3BBdjJBd3U1?=
 =?utf-8?B?TTlnRFJtMzJsQ0tWU0l2SzZVenFwYkE1L05TOHdRcm1MeXF6Myt4QXA1SFRL?=
 =?utf-8?B?eEx4L2IxQ0dYSVYvdHM5ZjQ5UGZjR0xwUFZLQnNYQm04UGFQQ3hGOTVOQ2pj?=
 =?utf-8?B?TWFPdXk2MS9jMEo2ekRsalFXQ1pEYXB0Y2hTVStQeERJcEppL1cveXN4MEJE?=
 =?utf-8?B?YmljMGlmY1JTTDNXNzhvVmk1SjVqRFJPaDdBdE12V0NTWCtuRHY0Zy9EQlYw?=
 =?utf-8?B?ZnpTbkxIdzhZVVU0OTIxMjZNRXRZTE1VQ1AvZ01JVGNUOVd2MXliT29pTmNs?=
 =?utf-8?B?VnV6WW1JZDFLeDlIWXNtVWZoeVdTK3lySmpxRURyenppVURSQk0wU1ltNWtT?=
 =?utf-8?B?K1AvUkZHMlpleDlHK1hnQmRVS3hNSEN4K09uMUZoT2JyT3JFZE0wSGVpNTln?=
 =?utf-8?B?OHFRUU9OMlZ4NktZT1NlWnhNOEN4K05ueHREbzJLa25NbkJLTU1uVi91R25z?=
 =?utf-8?B?SGdSbEJFK0dLTlM3S3ZaMGlVdUo3WUdSTVpuSFVzTnF4YVF2U2lXdmlISzVa?=
 =?utf-8?B?KzVIRm5PYjF1MXRGcHlFRHhxdjdPMmJqSTdxU2pMV05Ta3FseGVUV0p5K3Qx?=
 =?utf-8?B?SER5N04vYU9XNFdSN2JSZ3pJL2dPM2dHMWJZbWFwT1J3blEza3Q2eDRxc0VJ?=
 =?utf-8?B?cnlXZ1ROM0taM0NmR1FZa1dKTURhbnRTK0N4cnFvdlplL2wra1M2eWR2OHlU?=
 =?utf-8?B?L3ZQOXNrRnAwL2RCdElNZlBlaFNYNjMrTlVvaTYxUnVEK0xVOUhOdVdZeUll?=
 =?utf-8?B?cUpnYzNudWxscEdJdXRuSE8vTmEyQ283Z3hNaGJOMEFiNXErS2E2VTJRMzkr?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <022E83D1E083284E859A150524CCD16B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6002.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515567cc-d575-4c93-2a61-08dc4a39da0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 06:32:31.1355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2w68Qx5P81GTdZBdJ8nsra+nJICBB4gsT02jEqSU4q01Ukvdis8I8sNvGg5xFv02JUn4CBigTIz3xKuvKdvQLdi4l4qxRezPU11X+Sybes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_233248_579982_FE18326C 
X-CRM114-Status: UNSURE (   9.31  )
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

SGkgbWFpbnRhaW5lcnMsDQoNClRoaXMgcHVsbCByZXF1ZXN0IHVwZGF0ZXMgTVQ4MTg2IFNPRiBm
aXJtd2FyZS4NCg0KSWYgdGhlcmUgaXMgYW55IHByb2JsZW0sIHBsZWFzZSBsZXQgbWUga25vdy4N
ClRoYW5rIHlvdS4NCg0KQmVzdCByZWdhcmRzLA0KSGFpbG9uZw0KDQotLQ0KDQpUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo5N2I2OTNkMjQzZjBiYjQ2NDgxOWZhM2Y4MzI2ZWRk
NDA5MTAzMmU0Og0KDQogIE1lcmdlIGJyYW5jaCAnbWVkaWF0ZWsnIGludG8gJ21haW4nICgyMDI0
LTAyLTIwIDE1OjEzOjAxICswMDAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vaGFpbG9uZ2Zhbi1tdGsvbGludXhfZndf
YWRzcF9zb2YgdjIuMC4xDQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KNDBmMTc4
NDM4NjQwODFiODI0OGM1Mjg1YTljYzUxZWYxNWUwNmIzMToNCg0KICBtZWtkaWF0ZWs6IFVwZGF0
ZSBtdDgxODYgU09GIGZpcm13YXJlIHRvIHYyLjAuMSAoMjAyNC0wMy0wNiAxMToxMzowOQ0KKzA4
MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCkhhaWxvbmcgRmFuICgxKToNCiAgICAgIG1la2RpYXRlazogVXBkYXRl
IG10ODE4NiBTT0YgZmlybXdhcmUgdG8gdjIuMC4xDQoNCiBtZWRpYXRlay9zb2YtdHBsZy9zb2Yt
bXQ4MTg2LnRwbGcgfCBCaW4gMTYxOTEgLT4gMTYxOTEgYnl0ZXMNCiBtZWRpYXRlay9zb2Yvc29m
LW10ODE4Ni5sZGMgICAgICAgfCBCaW4gNDg0MzYgLT4gNDg1NjQgYnl0ZXMNCiBtZWRpYXRlay9z
b2Yvc29mLW10ODE4Ni5yaSAgICAgICAgfCBCaW4gMTI4NzEyIC0+IDEyOTMwNCBieXRlcw0KIDMg
ZmlsZXMgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0K

