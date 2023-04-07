Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5984DC76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 02:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8Gt912pPMOUgRaVy0RPPFiMhXAA0eSrEY5J1lTHVMQ=; b=KNoErU074jz2GM3UuG/pojlZX7
	/oCjHgNCF6Ekak0dtxqWtv955KaWRPtpHtzyTAa2WTlpLbEmUecMSZfx+wAgEkPdxznYVEgVd9eT5
	mBl0OnlNrbKM1OzR6n3kkHwxFIEpY66hQ0KG9YwtsnrXVNi98G1SRx/PdCDkRt2Bk6qpG8BDYDY73
	b0B2m26JH4W+p+QbbAv9jlBNUaI2Wu4tH58n2L8/qGYvTH7+ClFr069PPtKRm9Qt7tuzYQ0qjggxP
	50Z4zJprotoZ8pPwA8i1cdEIDvS3nnM8U7TLpPOkkq1BztouB+vYKKAGkAGOdNOguUKcsjeasst+V
	JUaD6Dow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkc2O-00929f-2C;
	Fri, 07 Apr 2023 02:41:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkc2K-00928l-0Y;
	Fri, 07 Apr 2023 02:41:13 +0000
X-UUID: a4d8dac8d4ed11edb7d8d11f642b8e78-20230406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=T8Gt912pPMOUgRaVy0RPPFiMhXAA0eSrEY5J1lTHVMQ=;
	b=hVgrLDm6neIPMQSMzmeV/YWfglsYzvOPjsc6Y2KRQsyBbgALpnUmMQRgW1z7lu2sNtUcpF732RGktfTnLMmoJIPtfJFTHXhWc66XFAI5PI4X0hxxoVJ6OM1iTic4bjGgbT3YTp22rglR+E1rdTaGQeWXc5r4Ey4YHnOTN4GUo8w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d619d46b-042a-490d-978b-936aa1ee376d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:8c7b76b5-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a4d8dac8d4ed11edb7d8d11f642b8e78-20230406
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 473444431; Thu, 06 Apr 2023 19:41:05 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 10:40:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 10:40:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mszz17HeaJBUXMZSyoJ7Un2l/WklklS6leiOTYVOMY7g5mnhU7Ia6k6q6sHOj3IHTMNvTYxIOqp1PJLvppTk+jVdnSVI3j3LTHXgz4yaCKHVRaWIiO3VN685ISgC5UtlVVR5cWhwP1OFphIAigNHJLFd5MGCQ+i9KzjNlFbzhftopRbkEL5I5VtpizDvoCqeZ5UwvubrRlE4Gw4JFybptNVZozK1EWNtiu9Z2MD1NQGLxdohIOYKwtVdmOOE6eaOIqTDvzMWw40upE2xgZzn2Z5WEuojq51tAyWz3uQZOKOVt+0zo2ayS+qy0sRZ8/IkAqeW4C+OZ5ctNmDGdtPQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8Gt912pPMOUgRaVy0RPPFiMhXAA0eSrEY5J1lTHVMQ=;
 b=aZOEpRIuNZ1Y9156UxPQcwDOhqR3b0oAtDoy2BmygGK+nxQzChl4OdPrcInkhp5NVA7A4j7AY9nwIM0ya2gDBZ+IgvDLWiQK3SYEaVU/NvHD80fRTjL3Omx/RkLAVjer+oIGm3C7uMWak4Mi6AujhilKcZ1Mf88hLTfeAYaCH/+jbjeMCQivaw/v2mOCXX8OvA/9wjbOcWdfJV48JeIkj+NfZp+hxLzLmDvBicuMlyqyAF0OOsLpN8DyT7hfxEqZjrmptcsDInBvscFQiLnC2B4DnvTWjuZqHSqNqxl3ntmOh5qIlPv8j7vfR+mVAJVul9HDzkGgDczXyZuKs3rXzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8Gt912pPMOUgRaVy0RPPFiMhXAA0eSrEY5J1lTHVMQ=;
 b=Dnit7//l4zGONKxz1+gUF4aOD8mr0AYHeArHyIUFi1HVLVg6kTPzricLe3BwqmT8YDFQYma1IPNoJdOg9oeEy/zhnGdw67KvzFRg2fKWNKQofYuQ6fDMwI5wz9XDhO4D/7sv4Dhm9eZceglSLUlXMbEUrt4vyG1+daaKebFJzSg=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by SI2PR03MB5832.apcprd03.prod.outlook.com (2603:1096:4:144::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Fri, 7 Apr
 2023 02:40:24 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::82b9:eab9:b4e3:8464]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::82b9:eab9:b4e3:8464%7]) with mapi id 15.20.6254.035; Fri, 7 Apr 2023
 02:40:24 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "jstephan@baylibre.com" <jstephan@baylibre.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: add mtk-mipi-csi driver
Thread-Topic: [PATCH 1/2] dt-bindings: phy: add mtk-mipi-csi driver
Thread-Index: AQHZZf0897qjM/C1Gk2Yn/aWiln5nq8fKJ4A
Date: Fri, 7 Apr 2023 02:40:23 +0000
Message-ID: <b0fe05a91ef295d9b65c49f6724f1129b4d904da.camel@mediatek.com>
References: <20230403071929.360911-1-jstephan@baylibre.com>
	 <20230403071929.360911-2-jstephan@baylibre.com>
In-Reply-To: <20230403071929.360911-2-jstephan@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5062:EE_|SI2PR03MB5832:EE_
x-ms-office365-filtering-correlation-id: 034b555f-1059-42bf-fa3a-08db37116ff1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u5e8OepaIqP6NcUFY+AqdWMq7OytZWHvBS7d/W3my6NflrCQg8aPIwvCVyU1CI1yH8dOkVr2lU0bX2bLqJ42pI/IbQ8aeAzcb4s6dEU8uSy5FDgtXGYUChGZA6aGLdBs+OUSkIa7BF920gii1chIZSBN3+CMmTtOXmzNJTf3tYzaGitjfv5Y4JR97GTPaDuX3KFK8sX1d2EBT970WwDY1qywzm0tvFZqfJhQQBfKtQ9KLDgglcaPzCg9eoDZMhh111fvSxEdewhP7qisqF92I18/bHS7CMR3upN5T5mwsLvj/gRJgUUNXQL1nJB40rwxnwnJe++LKgLL9w6DNPV3ejnckZLhgfgIobJ5AVCrVZpnJcvYIravVqxoEhuXEOJi2m4gpfeYDHWDzH5X106qZecWWXYXcd+a9RIgtdw+kWv1kaKyEbcypfb6dYcLV77x/og8Ar9E1ZWIPZC+V5gToThdIueNCgROQbr8hRmz7d3pAZA4Q9ehzc3tIklEzp5BOWtWgdRb5l4i8eMzq92/mZEq8MEKxQXvOMcsYJd7DX0Q+CKJXpw2xfcih09slqCrmY2+oI9YI4ZL6Dt+rINxELYi0gjFa2fUnXUraZU+2fz0iKsTwMNAPwcukW+7KmG+Hkp0lik0BQCxo6LQXcYDdMCI9ArmVU7VbHDdjtQ9LBw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199021)(2616005)(83380400001)(966005)(71200400001)(478600001)(6486002)(186003)(26005)(54906003)(6506007)(6512007)(316002)(7416002)(5660300002)(2906002)(36756003)(85182001)(4326008)(38100700002)(122000001)(91956017)(66556008)(64756008)(66446008)(66476007)(6916009)(8676002)(66946007)(41300700001)(76116006)(8936002)(86362001)(38070700005)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFFHcnJqTWJIUXBVK1pPTks1aVYyOEpYTDJWQk1senhNcEhReXBVQkU3Ujl6?=
 =?utf-8?B?dWdpekI4Z2Zyc242MGRNT0o0eFhBSDI0UklVeldlclBDYnBFc3hvclVsOTZC?=
 =?utf-8?B?MDNkOG1yUEc3YXdLeTVGTTUzZkNYdlJkc0x1cG9oS0lWSEJ5YWJBSm9IV2VB?=
 =?utf-8?B?bUdBUEpkZnlaOUI1OXMwNTJlOCt6RVlCZ0VJcWtmNVpBQjkyclJQdDB2bWtP?=
 =?utf-8?B?Tmw4VkFNdmNkS1pXR3pPS2lVUHF6SEVwUTJxdWxlMERNTTJSV0hXeEpqY0Yw?=
 =?utf-8?B?ZjQwb0JVK2cyV0tIR2JSN2xyNWdxUUtLRDNsSkRYdUIwb1JiN0Q2TmJKTnRv?=
 =?utf-8?B?YU9NOGJibGpJOEpWVkNwQ3lWQUcyQWlPY0Z4c0xVMysveVY5STluTytYdTFO?=
 =?utf-8?B?UHl5WE9VbFFqWjlxZjJJZUZKSkJYL1cwR0tVc3F5NTUvR0lhVyswTDAzMHo2?=
 =?utf-8?B?NStiUEViejZRUlpjWXlXZUFOSGw1VTZMZUNIZjdEOHZWSXFoMGloakNuL2sv?=
 =?utf-8?B?RC94Z2NzNGJScVBQNnJsdEQ0cE9RRFcyZllLMUM2RHBEcXZpSlJNODJndG90?=
 =?utf-8?B?WVpwVW1QU1doVjczMjN5Z1BLSnM0dEZVZVNLVVR6SWIzNDVLMUsxUEhuWkFx?=
 =?utf-8?B?cE16Y0ZWZUxMeUdxMzE4NzJtQVRmdE4wZHZNQWd3MU81V0ZHcnJWQVUwaXVG?=
 =?utf-8?B?T1JFWEdacU52VklOWks5b1ZYcEVPdlV4QXFGT3ZvT0t2QkFxVWp5eEs2cmlB?=
 =?utf-8?B?ODhjc0J3bUhqc0VwOFl0WG11MlR1WldIeFhEQXZjN0RrdjZRMWpCbU9HK2Z1?=
 =?utf-8?B?aDF0UlpWamQvRzB6UFRjRWRLYmN3VVc4ZjBndTU5UjJkanJzT3E2b2JZb1BJ?=
 =?utf-8?B?ZWVmYk05N3A3a2VMS2g5SW1STTUyckhoWnNQR0d2VWZvTlllRFV1L1k2dzhz?=
 =?utf-8?B?cG0raGhLWXJUOWFUZVhpU0JFSGN4QTlWQm5LNU5aSHpZa21FQncvSmdKWWJD?=
 =?utf-8?B?Tkg2RXExcVp4UEZURlZiYlFURkhjSkh5RHhpNFkrWERER3hhZnN1NTl2VEJi?=
 =?utf-8?B?SndNV3EvNEhKV0IzY1YxQWNXajQ2aDhtaUIyY3o1SHU1YzFHajJzTmt3YlhJ?=
 =?utf-8?B?RVljL2YvQzhjaTNwNEpGM3NBc0lUVzBieERvYmx5WWd2VVdRTVpwUDkvazg4?=
 =?utf-8?B?dVJ1RzFQQWVYaytjYTdPcmFJcVRqS0hYZDFORU56WFZ3TzFrNmZoSkVLS1lW?=
 =?utf-8?B?WGlyY0VJdTV2Z0swbWF5VHNKcldCVkVBN2JndGNZRE45RUZod1BscXA1aUJp?=
 =?utf-8?B?QVlHMXBtdGUvWmcrY3dtN3dkNEw0OUt1bVR3K0NXZndZS2JZbjU0bWdDSlNk?=
 =?utf-8?B?OVZXNjFEZlJ0WENJSHozWDBGYUpZNDFOd2tIeDVjYTNjTWdNUEdER1NGYzJE?=
 =?utf-8?B?SGpQMHNDV3hGRkRUeTVLTU40WWJHR09sbSsyeGxpeVhGYWUrRVVHYjhMY1F1?=
 =?utf-8?B?bStOLzBJYVpSOWtENmlYUWV5Qm9ERXNsV2pBQml4SnVJZVZTZURCbDZHdjN2?=
 =?utf-8?B?Sjh3QXVoS2xpdmdJVDBoTXhGQWRYOGV3blRHQkZmRFFLRFJzbjhIMTF0QURZ?=
 =?utf-8?B?eU43S2JkVjFMeWxtQnJIL1RjNVpQbVRoczlsZ3ZvSVJhbllyemNHR0M1MUc0?=
 =?utf-8?B?bXZ0VmR4eGVZak5ZOWhBeHRjU3E2Z3pWalFsWmlLRFBLNTk0MW55eE4wRzNh?=
 =?utf-8?B?dEJheUtzaFo0Q1VqeDlJeEQ1a2l1REpOMlEyZjU5emxxSzRiR29vVkloalRp?=
 =?utf-8?B?TzlnemE2MGhxbmMvMzA4QmpWNUJudzZPbnFVdmJsU21RM1lZaStWUHBQai9E?=
 =?utf-8?B?aElIQzgvSnVyNjVpVXgzdEwwejZlWkhyVnIzb0MzNUVxN0lZN09IT2lna2tQ?=
 =?utf-8?B?bHJwNkloMnk1b1A2VlVkTFhsRC84YlNSbGFCOFB2My9IQjR2NTF3QlBydVAx?=
 =?utf-8?B?aHJ0MzJ2S3VsK0M5T1FrZVhSZ3p0N0p1bFZpendLYlgxTzg3Rnp2ZnlJZFYx?=
 =?utf-8?B?d2libFM4WDRtQUhLZHVoSm9KQ09xSXVVNVZ6ZjBGR0JOUFoxanNLdGhxQnZ2?=
 =?utf-8?B?VDJIcW9wVjRmR2NZVmczdmF4ZDdnNGpQVmR5TXhMS0dlUlI0RmpobTZqTVVk?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7418FCA044E22A47A9EC4C5DE00228EE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 034b555f-1059-42bf-fa3a-08db37116ff1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 02:40:23.4788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MXNDkHZyD7RtIee8cF2/b806/yAOHl3soVwYEFQTjZ3iV7Fn9B7l349+/GxKKxPRUXUvDNaE455CgEIlmgQvwKwa9zA8MQxmfYl8Jzu1xvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5832
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_194112_224739_B9E07D4D 
X-CRM114-Status: GOOD (  18.06  )
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

T24gTW9uLCAyMDIzLTA0LTAzIGF0IDA5OjE5ICswMjAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gDQo+IA0KPiBGcm9tOiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXls
aWJyZS5jb20+DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZl
c3RyZUBiYXlsaWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3Rl
cGhhbkBiYXlsaWJyZS5jb20+DQo+IC0tLQ0KPiAgLi4uL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxj
c2ktcGh5LnlhbWwgICAgICAgIHwgNDENCj4gKysrKysrKysrKysrKysrKysrKw0KPiAgTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGNzaS1waHkueWFt
bA0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aHkvbWVkaWF0ZWssY3NpLQ0KPiBwaHkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waHkvbWVkaWF0ZWssY3NpLQ0KPiBwaHkueWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmMwMjZlNDNmMzVmZA0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWss
Y3NpLXBoeS55YW1sDQo+IEBAIC0wLDAgKzEsNDEgQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wLU9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiArJVlBTUwgMS4yDQo+ICst
LS0NCj4gKyRpZDogDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9waHkvbWVkaWF0ZWssY3NpLXBoeS55YW1sKl9fO0l3ISFDVFJOS0E5
d01nMEFSYnchbVRiSVdLcGJfdlZHWFlCS2VrZWp1VllVMmtsSVI5LThRUE9naXoxMHEweDNaNkhK
RFBzUmZEUVNDZXUxNmtfd3Zmb0h5WHhSWTByVFNjaklwRFRwc3FjJA0KPiArJHNjaGVtYTogDQo+
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IW1UYklXS3BiX3ZWR1hZQktl
a2VqdVZZVTJrbElSOS04UVBPZ2l6MTBxMHgzWjZISkRQc1JmRFFTQ2V1MTZrX3d2Zm9IeVh4Ulkw
clRTY2pJYUhWUUJPSSQNCj4gKw0KPiArdGl0bGU6IE1lZGlhdGVrIFNlbnNvciBJbnRlcmZhY2Ug
TUlQSSBDU0kgQ0QtUEhZDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIEp1bGllbiBTdGVw
aGFuIDxqc3RlcGhhbkBiYXlsaWJyZS5jb20+DQo+ICsgIC0gQW5keSBIc2llaCA8YW5keS5oc2ll
aEBtZWRpYXRlay5jb20+DQo+ICsNCj4gK2Rlc2NyaXB0aW9uOiB8DQo+ICsgIFRoZSBTRU5JTkYg
Q0QtUEhZIGlzIGEgc2V0IG9mIENELVBIWSBjb25uZWN0ZWQgdG8gdGhlIFNFTklORiBDU0ktMg0K
PiArICByZWNlaXZlcnMuIFRoZSBudW1iZXIgb2YgUEhZcyBkZXBlbmRzIG9uIHRoZSBTb0MgbW9k
ZWwuDQo+ICsNCj4gK3Byb3BlcnRpZXM6DQo+ICsgIGNvbXBhdGlibGU6DQo+ICsgICAgY29uc3Q6
IG1lZGlhdGVrLG10ODM2NS1taXBpLWNzaQ0KPiArDQo+ICsgIHJlZzoNCj4gKyAgICBtaW5JdGVt
czogMQ0KPiArDQo+ICsgICcjcGh5LWNlbGxzJzoNCj4gKyAgICBjb25zdDogMQ0KUGxlYXNlIGRl
c2NyaWJlIHdoYXQgbWVhbnMgZm9yIGVhY2ggdmFsdWUNCg0KPiArDQo+ICtyZXF1aXJlZDoNCj4g
KyAgLSBjb21wYXRpYmxlDQo+ICsgIC0gcmVnDQo+ICsgIC0gJyNwaHktY2VsbHMnDQo+ICsNCj4g
K2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtleGFtcGxlczoNCj4gKyAgLSB8
DQo+ICsgICAgcGh5QDEwMDExODAwIHsNCj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgzNjUtbWlwaS1jc2kiOw0KPiArICAgICAgICByZWcgPSA8MCAweDEwMDExODAwIDAgMHg2
MD47DQo+ICsgICAgICAgICNwaHktY2VsbHMgPSA8MT47DQo+ICsgICAgfTsNCj4gKy4uLg0KPiBk
aWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCA2ZDU0ZjMxOTMw
NzUuLjkzMDhiNGJiODhiZiAxMDA2NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJ
TlRBSU5FUlMNCj4gQEAgLTEzMDk4LDYgKzEzMDk4LDEyIEBADQo+IEY6ICAgICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdnB1LnR4dA0KPiAgRjogICAg
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjLw0KPiAgRjogICAgIGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdnB1Lw0KPiANCj4gK01FRElBVEVLIE1JUEktQ1NJ
IENEUEhZIERSSVZFUg0KPiArTTogICAgIEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXlsaWJy
ZS5jb20+DQo+ICtNOiAgICAgQW5keSBIc2llaCA8YW5keS5oc2llaEBtZWRpYXRlay5jb20+DQo+
ICtTOiAgICAgU3VwcG9ydGVkDQo+ICtGOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BoeS9tZWRpYXRlayxjc2ktcGh5LnlhbWwNCj4gKw0KPiAgTUVESUFURUsgTU1DL1NE
L1NESU8gRFJJVkVSDQo+ICBNOiAgICAgQ2hhb3RpYW4gSmluZyA8Y2hhb3RpYW4uamluZ0BtZWRp
YXRlay5jb20+DQo+ICBTOiAgICAgTWFpbnRhaW5lZA0KPiAtLQ0KPiAyLjQwLjANCj4gDQo=

