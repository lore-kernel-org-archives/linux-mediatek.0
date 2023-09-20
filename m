Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37C9CE79AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 06:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25fqdOIQDtdF2xvO7u8SLHIQsCbRtX+ntWSZBTIqvvY=; b=DXMts1XzH+zaT5YkcnH1Syx2fH
	nIi/LwbULlDOSfZCun/cu2d9aVb+h6gg4DIjU8dMr1DV/uy/jiSyntXREj5CvVXqYRzKppQP4Z2i3
	hz6URNUvwxmMNxmmD6Uq1uqv/Igsqc370F/khK6vn1bjF7PwD7Uedza5D0VFg2zUjcY7a54eMU8hH
	kt0ur2J8B9XA5lvtx02jEgVxUVlI9JP1W/VI3ispy3ztRRXkOVBncBVvym5QQCMFpwGnGRBrdXO3d
	uM0xR6jZ5IjNAzH/JupK1yFIlumi5+dDhaNj8TjGJZuFEm6j4lUdkygN3t2/QgektvmLscAd1RIHB
	eVB1SECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqMJ-001zHE-0i;
	Wed, 20 Sep 2023 06:06:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqMF-001zGD-0n;
	Wed, 20 Sep 2023 06:06:44 +0000
X-UUID: dba5a264577b11ee9b7791016c24628a-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=25fqdOIQDtdF2xvO7u8SLHIQsCbRtX+ntWSZBTIqvvY=;
	b=Y3JJZLzXBq8n29ThP1xUoZa8WlMRfMSXtbs2H+B3GiVhpsqSRqFHXqdolRuuqVcdrjQo7F7milsinBcidc15fpyLc+t/kD50ERJ4LmsGA4k+bde7sWNHlNTbjx/K3dGJYAMIKjP1a10dCHcqtJbc1FOqGnSdZhJtnEvkR4RGNWs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:d32eeebd-1fea-47a0-93cc-8f900265c67f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:c8fe3cc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dba5a264577b11ee9b7791016c24628a-20230919
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 392005816; Tue, 19 Sep 2023 23:06:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Sep 2023 14:06:11 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Sep 2023 14:06:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaGt2YsOCjtkE+wd7FopTWTJ9vh1ucdwqjQSsHCcmXvnVc8mlmOKVj38lzN6JInfmiiqPjLcVA80jZthmee0NuJdCDU8x09oWoHXVFVe+/0PlEkVUuweHkjlGN7UrzeezC+TK1vGdDEqta4T0vKUSYf+kdjP23g408nCaKnAyNdWjoAAoNW9iGB6lNgG9WJKgiuFLq90CakdA+3GzfUkS3x2P0pYYjwJ7fC1yYEY64ov0coE0kjWWPRrX+7tUq2HjgRDfSw/ZlxM7QGDjXkViBLn3eNkQc1X6e0xTAgjJxLP5T1MHR9Z51Y6SK4x0fF2DIHNhx3h2ieZ+ChSq5imfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25fqdOIQDtdF2xvO7u8SLHIQsCbRtX+ntWSZBTIqvvY=;
 b=HeHWrwvKyaXUPyuLPn+7HBgzC+6Gr2Yy4rLV/690vOvDytpCzKMxeotJpnkS4Odi6fy/KEa66o9j4xkZzQru31whQt6Op3HdJ2/sP8GR5ooIhLBzGkhq6hh7rYmlANh+Ms17dEdOwUZywRZbNlDv46Y+LJfQs6ZD+Sp4dv5mMIVgD4sVPCbIFKUezNR0yufmDsExN2IaSzHU6EsWOA4p1soby9rn/w7KO8pyDmBjppFBgh+7fi7umed7TI2lnHp/rCsj6ahAyC/sy+iFVKUAYBR9A6Px9P1uU/kPLXf3hKfyT4mNkssYEScKV7PQ3URcoYLfrwokh6wkHYELXWuppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25fqdOIQDtdF2xvO7u8SLHIQsCbRtX+ntWSZBTIqvvY=;
 b=Dt0McfQ80zvGjTzpRF41rE6aJz/m3vMtOmnf4QSZs0whtxhIQ86hurBxSM1G9pc7m2G+hWtE5ndAD5/gyIIo6xq04GtCS0UQy9WIZSaixWWDP1TdTz6t0D4Eeg8aUTrte5VwnRRLu+H/2lXeDCl9J776pCynsV+7+iquPUFoG7I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7598.apcprd03.prod.outlook.com (2603:1096:820:e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 06:05:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 06:05:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
Subject: Re: [RESEND PATCH v6 02/20] dt-bindings: display: mediatek: mdp-rdma:
 Add compatible for MT8188
Thread-Topic: [RESEND PATCH v6 02/20] dt-bindings: display: mediatek:
 mdp-rdma: Add compatible for MT8188
Thread-Index: AQHZ5IOsiookTJjrakCaCjdgbjcM/7AjR+MA
Date: Wed, 20 Sep 2023 06:05:31 +0000
Message-ID: <a901611a3c3f7df4401cdfbd1373ffb76ecf833e.camel@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
	 <20230911074233.31556-3-shawn.sung@mediatek.com>
In-Reply-To: <20230911074233.31556-3-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7598:EE_
x-ms-office365-filtering-correlation-id: 6451ef95-8e31-4b1d-0a35-08dbb99f98af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ShKe6DTpVFHVRf3pbZymyDPBSnuQncTj6Z3oGlQhr9GDZhZ04HEnv/PsHLkPZquH4OLSaYRShnKHkXu7HH8Pw10hSv3lvRqsy1KamTsBJBT8G06D2j4kvwdtiM+GQvop+5CHA4f+GIN7vMeDatF6YZWd/x0g7JoZJIHWDpbZiZSQZ3259qj7CiJI1VL/XL4W3dbk2+B8q1TWcBhDYbfNfQBmraA+gmBLnXmNkqig8lsxKM1QpuE4NZL1Ow2edzEHVQId6Myr6ELWGmH2v4GFA9B/sTM9WeoUyD2il1ygrH56LggS/85LOafehkP5aABJy3TbpxYY2KdBKXC9YI+ASZwTBB1R+le654ZbZk+WN1i1mB4IpGqp4t8QvQwCgLlZ1zD56ACNLuGDzABpS/wwBW3PhDWN1e/Lc1/1sVkTsk+T91ocvF+jAotrlmV0br1EYHYGaYLxUTIjkDnkR1C9UWCt56LJsKDGP19xmq4hLsfJ7AUbT3fPKuaZLMOmawqzPYMz5kWDzzyyiFtlXwoGlXuvZ2zW9DWKNvZXSOsvrEDQTf99/J7cm6efHikdj9kITzo41sHWLRVEauSEHlu9HbOm48TfMG9Wtt0bO0f6as0s2PBAzvO2WzYo2Ji7rVM05VdgIVars8WI8DUu6Jt43AcggqiwrZkpzf99woPe0Mk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(1800799009)(186009)(451199024)(2616005)(83380400001)(4326008)(5660300002)(8676002)(8936002)(6506007)(6486002)(6512007)(26005)(478600001)(71200400001)(122000001)(66476007)(316002)(66946007)(76116006)(110136005)(54906003)(64756008)(66556008)(66446008)(41300700001)(7416002)(86362001)(36756003)(85182001)(2906002)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MG1PdkMyQzJxcldnMHpiSm95ci9NTGcxRk5UbWpzZEk0c1lmUkloZkdpM1ZN?=
 =?utf-8?B?bTVBclI3ZU14L1RRRkNhNm1KeWNvSmZYT0RGSXEzS0tZb1lIbDVvR3VwZnFR?=
 =?utf-8?B?OEN6M1dWM3Brb2NyZjlCZER0dDFMRzhZelF2d0psVDE5MC9qYk9pYysxek05?=
 =?utf-8?B?NkZLZDZEbDd0QXk2MEl5ZzNtMDRJekY1VEtTUUUrZzQwR0crekhyY2tMTlQz?=
 =?utf-8?B?U0doU2YwNERMMUtoOVZwdEVkZzhxSEllSWh2TFRyZEI0RTlYdFZBdTBraGtF?=
 =?utf-8?B?bytEYzNvdFdPNW5KRUtrekJKbkZlR3pEWVpJU3FLQVloaUZDL1ZIS3JpZUJH?=
 =?utf-8?B?dG51ZHFhb3lJVFZBKy82QWR3Nk05NnUwaTFpcElqRkZWRHVjMkdOQVRBSVgx?=
 =?utf-8?B?TE1BZTVXck1jWmsydjhzZy9KZXpCN0NZU0lnTWNOTlF2aVVic2tQQm1qalZP?=
 =?utf-8?B?enZRWndsaG4xWnF2N0czbjhBUEgxTkVseFF6amZMM01hbW8vZGVjUHN0OG8x?=
 =?utf-8?B?SldtTTVYMXI0ditDR25GWVJrdjNsa3JNbTBQMWU1ak1Dd25wNndRNktHSi91?=
 =?utf-8?B?WVZ6NUJaYU5VTEYyV1BsdmNEbWs0WXF5TkZnYnB6SHFLZXkzL2RpaWxwTTd4?=
 =?utf-8?B?MEJKNUt6dk15S1hIcDNRVy9DWHBSaTEzVjR5S2Q3dThpUFpTL0tRbmNBNHZG?=
 =?utf-8?B?OCtYMmMrMFlpMWpUYmsvS0RxYnJueGVNMnR6U1o3TjZoQ2doMUw4K0dzWkdy?=
 =?utf-8?B?QllacVFUSWNzc0htNTBzQy8vanlUd2NRazhzTnQ3YlJYdXZMSG1vQzhrOEMz?=
 =?utf-8?B?aHRwanlKd2pSVDd0c1ErdTIvWFhPZjZEUitSek5qZldCb0lSeWcvL2hESXJZ?=
 =?utf-8?B?RUlodDFYaG5MeDQwN2ZkU05ObmIvaThjYkN6azQrZWg0TW5lZTFQUzEybkda?=
 =?utf-8?B?eVFnY0tLNXRZZ3dQckN6Y3VjS2t1bzhuWW9hTThreDhKVW5oaTdrdHliYmdR?=
 =?utf-8?B?VTlvRHlDRG5OVE9RZkJyS3hDajFLdlZoWWMwZEd1eFJOc2lvNkxjTSszTyt4?=
 =?utf-8?B?SFB5Z3l5SGhPYXV2Zk1yaXJIdXk2ODdCcFNmdjJMOHJ1amJNRzZpK2pNbmlM?=
 =?utf-8?B?cVpUeUpCUlN1R04zcnY0eTlrREhSb0xXU0RaY1l2czFNRnJNWExOMkVzRE9u?=
 =?utf-8?B?QzVoQmZsaDNKN1MxdmdWSFFBZWd5WjdraFZlRDlvajk3RzVPZG9jQzBWRU1q?=
 =?utf-8?B?aEh0aFgvbDAyRzBsSXhSSVNOZVZJL3VIeWVLWVMvUlZVRFVFS3RUbWZwZENz?=
 =?utf-8?B?U0xtYWk2YktLS1RQMGlxTHE1QWE3V1E5cEVTMG12UTV3UG42dHJyMkQxZko4?=
 =?utf-8?B?T1pYOWpWNlBFdDRpc2JFdDZTeW00VDVZN2k2SFVDYm55OGhVRFJHdjZqUGFt?=
 =?utf-8?B?ZGtTend6TWZWLzBrRE1QVks0SVpTMnQrRXhFTVhXUUpaaEQrSWNFcmwwdUo3?=
 =?utf-8?B?Z0tjSS82NncrUU1xekY5Um12eXBvR0V4R0lxeVpNQk1wbHF1TkMzaHhUWFp1?=
 =?utf-8?B?QVIyN3ZqYW9EK3RoTS9hdzZTWDNSU3FXOGpDMVAxVFFqdU5NK1VRZWdQQUJY?=
 =?utf-8?B?RGxLQ2dBOWYxOS8xN3hZL1Z0VUZab3hoYXptNVFBVW5POFB3Nk1BSFlqRy93?=
 =?utf-8?B?SHlxcDY1a3pGWHpUYU9Lb0NBL3p4VS9PeHQyS0lPV0d1UWh5NXU3QjdUditx?=
 =?utf-8?B?SThEaDN6MXU2UEJMSDNEZEJ4eExRbjlXS3pxQ3VRV2dZYld4aUc3SmN3amJ2?=
 =?utf-8?B?UFk4YWJzZU9kMEdsLzFpaDNWeU9lVUZEZHMvaEVJVHoyNDJRQ21mWlFyajY1?=
 =?utf-8?B?djBXcEhaclFUUlpBL3E3K2FKVzlLSWl6d3VvQ0JqazY1TmEwa0J4Y2hPSHpk?=
 =?utf-8?B?T0dLYXJHQ1dJTk1xZVc3dndiQ3dteHNmdGEwazJSTEhiS2FPNDZSUEZzYTJW?=
 =?utf-8?B?VldlOEs5bS9TdGVPMUd4bnNUM2JnK1o4NzhtRzBQRWdwU0JpZlI1eHpCRnZB?=
 =?utf-8?B?ODZQc1Jqdzl5QVJNZTBRNmM2SEFXTlNNTTBERmhRekxqNmpQVjJ1MEtiV04y?=
 =?utf-8?Q?1qiZOV2YPkCu+ES8z0BA9d2el?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6280A5389882C049B810F2737BE7A6B8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6451ef95-8e31-4b1d-0a35-08dbb99f98af
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 06:05:31.5088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43yUQ2qMu2qdL8NQhRUvDpFLmCr6E9C5TKaffhh9gA/I98tbhebRJDXq/EhP65ioXJRNjHvO8FHKUODxkpMAtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_230643_290735_1F7EBCF1 
X-CRM114-Status: GOOD (  12.92  )
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

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBNb24sIDIwMjMtMDktMTEgYXQgMTU6NDIgKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IEFkZCBjb21wYXRpYmxlIG5hbWUgZm9yIE1lZGlhVGVr
IE1UODE4OCBNRFAtUkRNQS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+
IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gQWNrZWQtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2ln
bmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+
IC0tLQ0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJkbWEu
eWFtbCAgICAgICAgfCA2DQo+ICsrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4gcmRt
YS55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssbWRwLQ0KPiByZG1hLnlhbWwNCj4gaW5kZXggZGQxMmUyZmY2ODVjLi43
NTcwYTA2ODQ5NjcgMTAwNjQ0DQo+IC0tLQ0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4gcmRtYS55YW1sDQo+ICsr
Kw0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLG1kcC0NCj4gcmRtYS55YW1sDQo+IEBAIC0yMSw3ICsyMSwxMSBAQCBkZXNjcmlw
dGlvbjoNCj4gDQo+ICBwcm9wZXJ0aWVzOg0KPiAgICBjb21wYXRpYmxlOg0KPiAtICAgIGNvbnN0
OiBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hDQo+ICsgICAgb25lT2Y6DQo+ICsgICAgICAtIGNv
bnN0OiBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hDQo+ICsgICAgICAtIGl0ZW1zOg0KPiArICAg
ICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4OC12ZG8xLXJkbWENCj4gKyAgICAgICAgICAt
IGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hDQo+IA0KPiAgICByZWc6DQo+ICAgICAg
bWF4SXRlbXM6IDENCj4gLS0NCj4gMi4xOC4wDQo+IA0K

