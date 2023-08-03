Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C123C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 07:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHjLPv6lKKjxpcbbii8TX12nwTbmkJIcCqXMHXT9osE=; b=wmuExonSv+/S3dMhRngqTxG5ka
	VkHM0+EkAv2TR9FBfDKfE5L+r+ezqYszRNsgRVCEl/DNlzkFUUofmodtNgxYrOEkHJrddtjTI3H3z
	xmTnI1WQ4lzNBFzNeE7vESCgsyoUqr+djYXoGsCR+kI2o3rTDs7Q4iWQnJKJGc6EU/SKpPkBTq0Qt
	/hRcM95t6EOPOhMTMjQB18eEPV+avD0zqgvzp/bR4vlBGRsykcNU/ffnI1RYgfpdbIjmDiY1kXFCP
	dGDEy0cfYY1U4zHDi0ug3t3YUQTZxOmKfZHWB3MbW/klovdr9zHCUdsGjKmzXDY6w+G+oj1gKcgIb
	Hj/Urx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSbA-006qwe-1E;
	Thu, 03 Aug 2023 07:18:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSb7-006qv1-1U
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 07:18:14 +0000
X-UUID: e476395431cd11ee912e1518a6540028-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=uHjLPv6lKKjxpcbbii8TX12nwTbmkJIcCqXMHXT9osE=;
	b=ubIwF6jmeL8gN1tX68MQL64QDm8PkCXI5l7HocWlHIxayVsq/XFJ4qXW7xt6tdPmoEgrs5tb9a09L2lxcOcHZKiMJ0i/kqWs6H54he32Xp6wqyYYjh8F5nQcLnkrcwsJ0UIxxIujBXs9FINk+YNMT5k6EzFRjqKNtBj3NbtqW2U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:99374186-8e76-4ba7-ab14-8ecb0c4cb9a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:61e319b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e476395431cd11ee912e1518a6540028-20230803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 316988741; Thu, 03 Aug 2023 00:18:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 14:58:03 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 14:58:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7Ltk+GC5IHnxa8ElQqlcjjV7wzI5HSVMg/ylbVTw/XOT8TWwJ8fTo2GEpVIijBG/86N0fcOfpyKGohDcp/fkzpMCs7MaRK+d2srlsHegIu2honZNi6RxU7FXR8yucFjDIDbavt0oCmXF+RmsHvP2Rj+14I6DJJn+dM0xP211tdUJ5lHcueQxKCBgIwIA8LzwhJJTzNSGMUC/KYwde1GtIsGILi4wl73YygbOD087J3R4a1IeD0uraP5UbBmz3sL9rspZBCDOMX6z6LJynWuv0EHpTtQhqkuYc8oS7Yl8sLJpeVGSNn+ts3YNAak6h7xssq6nfdjgck6VNV7wutBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHjLPv6lKKjxpcbbii8TX12nwTbmkJIcCqXMHXT9osE=;
 b=jLtjcmRgQy6OYrf+OexVW6ecQYEG284f6YSdTGEZRoFp9X5bIzKUimKjnxvgoYP5iLjJkUJ7jZR3cVYvc0+iVr9q4GwM3DMvSyxmJnDfbSMx4NfUeGFqXddoCmoAAn2Z0X5ZNZx3/aotNtK98OBgk3z/ZCoYkoGDMp0+LagWO4NdsxdG/Ssx/aibJzR6fUFLq2AkqlrCbjw64GKSWuTQGI5y2qE0ES8IGBn9lN/GSjN7J5lLAovEh8ORH3/QyaF2vYBesQmZHvgpTyVaQVZujHEupJiSyi65UysQEFR4rl7xvFXZNAV5KgfbK49UFeY9hBk1Aux1T2fHFvymEeE1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHjLPv6lKKjxpcbbii8TX12nwTbmkJIcCqXMHXT9osE=;
 b=GTBxtSxDmwgpsghQ3JN8bvnQf3Ce89ez9Yrv2Ee4EjxWu9PIv/Hjl4xKaLipHrvpKd/LSTxMnO4JVCSA6P5OCZnN5wj8muuKBpWJ2TML2W6TPHtcScoiTLlYyCIeR1ar1tld0aHRMLLIq2bFByjd5NMeWFyjFA3CS5lnDq3RGBk=
Received: from SG2PR03MB6343.apcprd03.prod.outlook.com (2603:1096:4:17a::6) by
 SEYPR03MB7508.apcprd03.prod.outlook.com (2603:1096:101:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 06:58:01 +0000
Received: from SG2PR03MB6343.apcprd03.prod.outlook.com
 ([fe80::aaa0:7b9b:faaf:5bab]) by SG2PR03MB6343.apcprd03.prod.outlook.com
 ([fe80::aaa0:7b9b:faaf:5bab%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 06:58:01 +0000
From: Ryder Lee <Ryder.Lee@mediatek.com>
To: "kvalo@kernel.org" <kvalo@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"lorenzo.bianconi@redhat.com" <lorenzo.bianconi@redhat.com>, "nbd@nbd.name"
	<nbd@nbd.name>, =?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?=
	<Shayne.Chen@mediatek.com>, =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
	<Evelyn.Tsai@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: mt7915: enable BSS_CHANGED_MU_GROUPS support
Thread-Topic: [PATCH] wifi: mt76: mt7915: enable BSS_CHANGED_MU_GROUPS support
Thread-Index: AQHZxccXpptS0KFQfUOkZlQMOmakta/YJB6A
Date: Thu, 3 Aug 2023 06:58:01 +0000
Message-ID: <ec7643c5d10b3cee3bbcd893cb08dccdecfffa6f.camel@mediatek.com>
References: <ff63866d7d62d088edd4a9f7587320f8f59a361f.1690999957.git.ryder.lee@mediatek.com>
	 <87bkfozpr4.fsf@kernel.org>
In-Reply-To: <87bkfozpr4.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6343:EE_|SEYPR03MB7508:EE_
x-ms-office365-filtering-correlation-id: 8679141b-5460-4ad8-cc02-08db93eefa3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TUDsehzGJzgNn7+VGUC8REda4/Lb2G5yDLxG35sr/sTYG1j/6evgobwrHxoZEdRVJHHWLcD4Dyer314HyZcBxW7XOVKo4oED4UIy/rl6+LZXNHuqiXo+jFsFVzGa5IeI54yDBkY5CcsWHl1ElnOMpTodgnjcHfdqqxIpAwMp+eTITUnb9VfMAilsG8X75taFIOuoAwJeMD2eAC28aR0ec4zrFft636EiXIX/5Y90bqwWQf8BASt66FYFtpenn+/hgXASMpEofBlZkhUXxH7trvMe4fWF1L5HRKqPGZL9F12rA3pvUVxTqfbmIFd27QOxsNcC+K9Sy2WSFE9t2XbBegpCGAzG9rOShccOSfGG2hTdkeRddk80QNuy3dtKmoHanYzL9jevEvLA2wa0/cRiE2pTGP6XuBZFwwbRTMlTHwwLnml8lm4xGB3Gg6j6egj6nQc9tLUYjjLG+UzN1V2e0rr2kRKLtw5eIhSY5uYv1lVq0lQ6ATkx9IW4ZxT2x2Vp2Yju7+h2pQ7i7JUsinCZ59HoB7eEjTd8nu0j4vp3ZKKQntW2Q2kfSRwYZiRB2GpTtqYZlznX8EIuk45VmGTlMpE+J2SJTDRXgWVLVu8CvIAFaOgLwfX0xIBdZ5DxOXbi97I40qY1UMwghwYB2655Wd+FBJxE0935sODzQPDI6UQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6343.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(6506007)(122000001)(26005)(38100700002)(186003)(38070700005)(2616005)(83380400001)(2906002)(36756003)(5660300002)(8676002)(478600001)(54906003)(86362001)(6512007)(71200400001)(6486002)(41300700001)(316002)(91956017)(8936002)(6916009)(4326008)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RS9FQW1rb2s1L3F4WEErZjZ2VlIxeER0QXl0Q1JKOWVnS241VXpnUHdteVc1?=
 =?utf-8?B?TFV1aVFyYVJ1UHBTNE16WUxEdGF5bHN2M05ZaHRTcjdCTVBLM3ZSQno4MTA0?=
 =?utf-8?B?ZUUzM2Zmekt6MTJXazB0cVN1YUlxSlBmT1RJVW1CbEMxTGFJL28yNStCRTNn?=
 =?utf-8?B?RVBWOEU2SnFNa3FnZng5NnZuTi9QbmVWaGtRb2F1dDlUanUrKzlmd1FuQkRh?=
 =?utf-8?B?cU5YVnpGQ3czU0lvZVB1cEY0R1ByRGtVR2EydUo3NlprSjNoam9KR0hXc21j?=
 =?utf-8?B?d20yTUZXSVkrclE1SUhCelpodEQ3L0lsMGNiQjFxckM1U0JCUUFSQ0Z5dmxt?=
 =?utf-8?B?b2JTbEtEenBIbkNabWRBb2RxTm1kVjZSbDVuaVZ4Rlp2REFZdEFBLytaRmty?=
 =?utf-8?B?MXA5ZEoxa201YWc0Y0dnT1JidnNiVW8vb2g3Z2dMR0J6T3hYMDd0NnNhQ2dD?=
 =?utf-8?B?dFBOZnFDYk5MMk9wVSsvSW1hK3R6TUNkVGtQQWd6ZGl3RTU5Ui9iS3gxeVJP?=
 =?utf-8?B?dE84UHExd2k2ZHNMYWxHdGtZdllOODV1N0tLRldpTTc2RWFJUGFBaUF3R0hX?=
 =?utf-8?B?dUdiNFBWMmdRN2g2OG5xQTVoeDhhbUVMN1B4NTdnbTdBWFFaRXdnQW5sL1Jx?=
 =?utf-8?B?b2JlYk1DRDF3bVNHb1dxWFZsMjUvWnJvSnVoOHVkSGhVZWZST3hzYUptT0FM?=
 =?utf-8?B?OXIybnA4VXVZMWZNdzk3ZDVyWEMyMC9sancyMDRuV2trU3ZzMWhkV1pibFFn?=
 =?utf-8?B?STZkbjVwdjJ0Z0VkOUhDemt6aXhzMVZoVUh5QlJMZ0UwNmVGdkhENzI2ZjE2?=
 =?utf-8?B?dkUwK0tLS29hZDYxVjIvTFJoY3NMWldCUXlaYklYbVQ2cEhvL0crd3BjYm9s?=
 =?utf-8?B?ZG1MZFJVZ1A2N2NMTTVjOGlQU1BGMW5DWFZBbHIyQmJPL1dzODIxYzZoSVJ0?=
 =?utf-8?B?aTJSaFh1dU1VcHN0Wm9hVzZLbEV6aTMrV3IrRjV1TGpuMjVsWnB5dDV5WnlP?=
 =?utf-8?B?TVpyRFVXaHE3M2NyMlhEcXVPTktyeTV3WDZxam5CeDJ0cHNzU1ZRbE8wc1E5?=
 =?utf-8?B?cG5XVnJReko2K0YwQmovWEM0Unhsci9ZN016b3lMNXBEbERJOEhnRFVWQjl1?=
 =?utf-8?B?SlFvcVphckNEeTZWMFk2U2JaVVp3YnU2RDdUQjJrcndkOGdpUHUrbUFFTk5x?=
 =?utf-8?B?L0ZQNSsvT1JCdzZPTzVZRDRDNU4wWDZmVzMwS0tPSkNzT2Vrekx4QkxFRlJk?=
 =?utf-8?B?cnBlUVRUQ0lnTlJXWkVGM1VQUU4waThCUkw0MTlmUW5wbXVDUUVndENvT0pP?=
 =?utf-8?B?T3NZb2lqUUZHMlpybmlEQ1ZFSnZqamNwc0xFb0s5Yjl5dHpQY2hFbXZCTlhR?=
 =?utf-8?B?U0dNWVRwVGVhT3E0eTc4TW5ZWjQ4OFRCbEk4VTRORlJDV1VSTVI3Mk82aFdp?=
 =?utf-8?B?MGd1Tk5CWGl0OHpGczJNd2FiVm0rU2VpOVd3RFMxYS9KSHRteFpCdmJoWmtr?=
 =?utf-8?B?SVRRbWlhNVVuN0RaWXoxRDV2K3c5Z0FqcXN5cElqNDFERU9wTERpOWpkZy9m?=
 =?utf-8?B?aHVUQnc4aDUyNm5sRkkwQmpZUWNCUllNNGdzMFp3VWs0TVhkNjVTRTNmRmZM?=
 =?utf-8?B?c3pDcDQ5SUFPcFkzYVdRL1B6dzMxSzNkU1Z4Q2tIMCt5OVRyOFJGRDJqTnFT?=
 =?utf-8?B?NDZsMyswWUVvRzNPV3JlMXBjbHJzWVBCdHVsRElnSjdwQ2ZMRUFwTnZ1dCtF?=
 =?utf-8?B?RE81SFJmT1haVEN5U29GcHJKaU1ub0p2OUY1UFc2QW1DUkd6UGFqV0ZkUUN1?=
 =?utf-8?B?SThjd1kzU0F4bk1MRWZpandnbW1nQ2tscmRPcGlnd2xHU1BCVXR5S3pGQktx?=
 =?utf-8?B?QlBpZ3BXbFpkbVA5VkZoWXlzdFVuMGsxeFRDNlVDYWtjbEh3dnVMcExRSnFV?=
 =?utf-8?B?QWk2cUhHS3l0eW5XQ2JOemkxQWk2SVdMVXZoeEt4MDBjVzRlWXNDRzhIeStn?=
 =?utf-8?B?RjAyS1Y0dlJ5SXJRYm94VVJSWjhmZmx1bU02ZVlQV1hEaFJ2VUljcnZHdnY4?=
 =?utf-8?B?cVJDYzhFK29rUXNiTmNVK0VJUWU2OVM1d25Ra09HNHdQcjQ1TUx3MVl6MWV0?=
 =?utf-8?B?ZmQ1ckNVUVBta1RUMzNDd3NFZ0p2VkRDZVhDVDVadlhqd1lZVkxHUHIzMGFJ?=
 =?utf-8?B?SFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8D66901D9ADFC48AD6F31AFE00A2C1E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6343.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8679141b-5460-4ad8-cc02-08db93eefa3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 06:58:01.2498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFDN+eIgs3nVzVXEj0Z3antDxVwiVIQiYD4AVPO7L9lzoukRI1WBuhz61Z6olyy5ZmOiqqbPAMa7kKgbwm+aVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_001813_593465_A902E227 
X-CRM114-Status: GOOD (  16.57  )
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

T24gVGh1LCAyMDIzLTA4LTAzIGF0IDA3OjU4ICswMzAwLCBLYWxsZSBWYWxvIHdyb3RlOg0KPiAg
CSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gIFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4gd3JpdGVzOg0K
PiANCj4gPiBUaGUgR3JvdXAgSUQgTWFuYWdlbWVudCBmcmFtZSBpcyBhbiBBY3Rpb24gZnJhbWUg
b2YgY2F0ZWdvcnkgVkhULg0KPiA+IEl0IGlzIHRyYW5zbWl0dGVkIGJ5IHRoZSBBUCB0byBhc3Np
Z24gb3IgY2hhbmdlIHRoZSB1c2VyIHBvc2l0aW9uDQo+ID4gb2YgYSBTVEEgZm9yIG9uZSBvciBt
b3JlIGdyb3VwIElEcy4NCj4gPg0KPiA+IEFsc28sIHNuaWZmZXIgY2FuIHVzZSBhIGdpdmVuIGdy
b3VwIGlkIHRvIG1vbml0b3IgU1RBIHRoYXQgYmVsb25ncw0KPiA+IHRvIHRoYXQgZ3JvdXAuDQo+
ID4NCj4gPiBOb3RpZnkgdW5kZXJseWluZyBkcml2ZXIgb2YgY2hhbmdlcyB2aWEgQlNTX0NIQU5H
RURfTVVfR1JPVVBTLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUnlkZXIgTGVlIDxyeWRlci5s
ZWVAbWVkaWF0ZWsuY29tPg0KPiA+IENoYW5nZS1JZDogSTNkMmY1NTA4YTJiNmViN2M5MjljMzk5
N2MzMWE5Mjg1NzEzYzhiZWENCj4gDQo+IE5vIENoYW5nZS1JZCwgcGxlYXNlLg0KPiANCm9rLg0K
DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUvbWFp
bi5jDQo+ID4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MTUv
bWFpbi5jDQo+ID4gQEAgLTU5Myw2ICs1OTMsMzQgQEAgbXQ3OTE1X3VwZGF0ZV9ic3NfY29sb3Io
c3RydWN0IGllZWU4MDIxMV9odw0KPiAqaHcsDQo+ID4gIAl9DQo+ID4gIH0NCj4gPiAgDQo+ID4g
K3N0YXRpYyB2b2lkDQo+ID4gK210NzkxNV91cGRhdGVfbXVfZ3JvdXAoc3RydWN0IGllZWU4MDIx
MV9odyAqaHcsIHN0cnVjdA0KPiBpZWVlODAyMTFfdmlmICp2aWYsDQo+ID4gKwkJICAgICAgIHN0
cnVjdCBpZWVlODAyMTFfYnNzX2NvbmYgKmluZm8pDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdDc5
MTVfcGh5ICpwaHkgPSBtdDc5MTVfaHdfcGh5KGh3KTsNCj4gPiArCXN0cnVjdCBtdDc5MTVfZGV2
ICpkZXYgPSBtdDc5MTVfaHdfZGV2KGh3KTsNCj4gPiArCXU4IGksIGJhbmQgPSBwaHktPm10NzYt
PmJhbmRfaWR4Ow0KPiA+ICsJdTMyICptdTsNCj4gPiArDQo+ID4gKwltdSA9ICh1MzIgKilpbmZv
LT5tdV9ncm91cC5tZW1iZXJzaGlwOw0KPiANCj4gSXMgdGhpcyBzYWZlIG9uIGJpZyBlbmRpYW4/
DQo+IA0KDQpobW1tLCBJJ20gdGhpbmtpbmcgYWJvdXQgdGhpcy4gRG9lc24ndCB0aGlzIGJ5dGUg
YXJyYXkgY292ZXJ0IChhbmQNCnRoZW4gd3JpdGUpIHRvIHRoZSBzYW1lIGNwdSBlbmRpYW5lc3M/
DQoNCl9fbGUzMiBtdSA9IChfX2xlMzIgKilpbmZvLT5tdV9ncm91cC5tZW1iZXJzaGlwDQp3cml0
ZSguLi4sIGxlMzJfdG9fY3B1KG11KSk7DQpJIGtub3cgc29tZXRoaW5nIGxpa2UgYWJvdmUgY2hh
bmdlIGlzIHNhZmUsIGJ1dCBqdXN0IGNoZWNraW5nLi4uDQoNClJZZGVyDQo=

