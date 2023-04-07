Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B191BC77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 05:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UGh93OR0SoTo/0SDhoWYJQpKccMqywh2ToX0RVXots=; b=oO/URtVOXgbRzz0OaQJ/r2s4HB
	4uAXnQdln6/N179ePyQrmQ0+ivO8C/CdvHzbfoSuclB6BOayA1Z08WOGOIlr2FhxdZretmA5e1KG+
	jYHAKiqBjnUsNO1YNh5wTKHeL5MmNwU9WmgXJRl83lVqVLgKMWs99lZEEssMXv8a8uMxlCXKDHiVU
	U8KGT6r2bErprny3XqL0Q5j6rhAjKCYrX9OG+MGSCVtyf+51FLRLjaxClOmZKGsqDJY8POI/Ro4vk
	2Xv5MWaG2/HcaecWZSU9T4mi+ro05dSZJm+642HIgGqDZ7u4eQbSsBiptue57Hxn2gM++ndsuSi93
	xH6kB4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkegt-009CHV-0e;
	Fri, 07 Apr 2023 05:31:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkego-009CGl-2D;
	Fri, 07 Apr 2023 05:31:12 +0000
X-UUID: 62aab938d50511ed8687db9d93187ff1-20230406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6UGh93OR0SoTo/0SDhoWYJQpKccMqywh2ToX0RVXots=;
	b=oui8uGxMK52u1YS17dABAa6lOJmv6kyV1Y5SJWNi/axb8yjhWy5hhOFN0dJUAcokSYPTGNTTldkbg26Dnqd/R0852oRZsv+wAEyX+DqSVNeYeh7AYHWx74V7khmGtyPRdpdjz4oN7zRcrUr/SVuxiHIKQ2O2fnaMBqjXRt7HJhY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:a0c5f23c-5caa-4bd2-9744-2515a29ccd65,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.22,REQID:a0c5f23c-5caa-4bd2-9744-2515a29ccd65,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:120426c,CLOUDID:2b677bb5-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:2304071331022W1M8Y66,BulkQuantity:0,Recheck:0,SF:28|17|19|48|29|102,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 62aab938d50511ed8687db9d93187ff1-20230406
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 293268258; Thu, 06 Apr 2023 22:31:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 13:30:59 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 13:30:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdzA6y/u5z9mPSLsy/E0b5tBXJW6qUV7FgTxBBFekFtRF3EVh7tGlvuR4fEewjQw1v89sQyVSJa6K2KKU46VA6PsfG95IwO+6bjwuOqPU/s2VEOrBzVx7/hS0uKe1P47yD+UDyWvB62mf5Mz4ZEdMr1a5peN7ry9QekyAj4BXxLWCsdQ4k3vP705f9uqQrJF6jKTOnIHMu9eKnKKyY7lbol548dshMPpV62c0kxAo+G7YQY10ooc3JC69pHB5Ob+sMZyahbBmK26cFDqmQO/IYOKxr8bcIrPTDU0XwnFOp0xBcPFbYbdQTMG1S6rdMga7UQ75Gs/z/iSc4qp1amlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UGh93OR0SoTo/0SDhoWYJQpKccMqywh2ToX0RVXots=;
 b=CngbrMzk6AztTVLgDbdSZySsvzgSj9Am+Yc0kdzNMFZHJYFSYIOu543H5ZNUC9C2nO4ThYSDSX45t2IeNr8WDJERrCTAHjrheNg195v2VxAhATf059B0ClPKjQDUZJgybVXCu9giykKQVDyVtkhITeLzKNzmVhc7CW1fl9Bf09wsIK2cGPrUpeKdhBBj65cFO58iS5hrjQg6IyqSsXhSr8L+0Ki5WXN4BdvELPo3nJ1+/dg8/ioXTgw57YCEOebf/jhwULA1PsRlpBsuCUqtnWRDZ6smcsVuseTzGnVkKUkmEMxXQ1Yz4CxdrLtzSSbdTXV+PsnqSqwLuOTsKbPAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UGh93OR0SoTo/0SDhoWYJQpKccMqywh2ToX0RVXots=;
 b=YN766vti/2yIKHqD67dqAxRg3E2gzVaBRgLyrF64ihJwCSwxkJihegoCFS9yeoA5Wu4MG35q3mckIpn8RbTa2QXZWhspnAHR04rVs8cHBRvkmGaLAi4sdKOr1CWx2ARo1h0eJglmevz70ozKCVGZIjdpcjhQB94gCglsFKRUj00=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by TYZPR03MB5263.apcprd03.prod.outlook.com (2603:1096:405:6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Fri, 7 Apr
 2023 05:30:57 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::82b9:eab9:b4e3:8464]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::82b9:eab9:b4e3:8464%7]) with mapi id 15.20.6254.035; Fri, 7 Apr 2023
 05:30:56 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "vkoul@kernel.org" <vkoul@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= <Eddie.Hung@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 1/2] phy: core: add debugfs files
Thread-Topic: [PATCH v9 1/2] phy: core: add debugfs files
Thread-Index: AQHZV9cDPkGBtXB0Aki6NkGjBbxDxq8ZzCGAgAWn34A=
Date: Fri, 7 Apr 2023 05:30:56 +0000
Message-ID: <81084a539ef4de55b9cd8bba9cfe41e4d73740ec.camel@mediatek.com>
References: <20230316071452.9161-1-chunfeng.yun@mediatek.com>
	 <ZCrrhZzj98WdWkd3@matsya>
In-Reply-To: <ZCrrhZzj98WdWkd3@matsya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5062:EE_|TYZPR03MB5263:EE_
x-ms-office365-filtering-correlation-id: e2d00676-de84-4b0f-b6d6-08db37294354
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dMnMQ43M4xYnmPH4B4T96DRAJv+HIerV3aeNaBa9QkUpgGH2P7egHY5+lg2NsXUu85i2UmdeDZ1jt+whDsbjpYlytrGwPqHy3xHom5+E2uriCLXG5DSFyQUTqG8yH252LbcEfL44VkGkaSU34DvOOwXN9RHD7scjcO8jOgD6jVEwl4HpCKsT2uqd97JiLsz/gQ9hCDMN6Cw/gaEhG+wFq53OjS7WxC1IojuvKYJaVdzjtdtrgmnva+YJxXaG583401CrP47T/d7jYkr+6xfdHfBVheFx7YRb4rh3zDysUFGGI8A/lXAF/+nxM2V22ls0xhoovCD7PXYxfT+Pa60R9jcHm03ftG3iJG3zM1ToQPzKTGarKRMXko+LmpwMKCURRoVPtU+KhDRC+1aCaSnqAlIksCuFfSpEsaDTS1tGWeI9oXpySDR8fMWoZHwUv1ZXZVs1cflUs7fvsZGhEjzblMl6m66khn9m1BrfV1y5gU+Xwcl2EWxxgIlljpULRYbo+HAnl+7USl4/qFl1jFC++HwAQhM1qrYatKXnyzcErBNkEi2ImdEwl9h8mFq7LD4XobKjk/A+K0S443YOAVtC1JljKlY4x2d4tYsiwHy96qbghB1jTVvMJ2HLoG5lKqZXOmfaQ3fN/pCrtCQ+osFJUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5062.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(85182001)(122000001)(38100700002)(5660300002)(2906002)(64756008)(4326008)(76116006)(38070700005)(8936002)(86362001)(66476007)(66946007)(66446008)(8676002)(41300700001)(66556008)(6486002)(6916009)(83380400001)(36756003)(2616005)(91956017)(54906003)(53546011)(6506007)(26005)(478600001)(6512007)(186003)(71200400001)(316002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlJxRjlVMUpBT3AyQmtmYTFoU3JveVNISENzNndNS0RMaWRHeGJESkgzdTdu?=
 =?utf-8?B?c2x4RUxJWlQ5dFVyemZLR2dIMDNsRmpNeDk5cXNxdHZNS2hjRFVvN2Q4RlAx?=
 =?utf-8?B?eFhBb3RxS0ZVSmRNUWVKcEIyUnEvaXRReVhtTVRSSnAvVFdhN2k1VUlZdVRS?=
 =?utf-8?B?ZERianZscGg5QVhoQUp6OXc3d0VNbmt5eE5EUnI3MkliZ0FOTEJNRGpCdkk2?=
 =?utf-8?B?bmVsZ3pmM3FtbU8xck9SYVNlcGJacDNLMXpmVEFMMzBNd3hhWW4wVkhNL3BO?=
 =?utf-8?B?WjJJUm9nMG0vRkdLckMzTjVESE83K3RJU3k4WlZLaGdldWhxZXFnWUF3T1J4?=
 =?utf-8?B?dHByUGRhbit2M1Jzdks0UVZhM1JYUTJOV0RQTnZ2VkFWQ1BEbGdoczFLRm5y?=
 =?utf-8?B?NlhnSGpBaWpZM1UxRndKZitIWkdZTEVTRCtvRm9JZ1Y0ZVdSNWhZMVhHQnNS?=
 =?utf-8?B?dUZnUjlBV2lWdzM1aWRMRENXeUtzTnhWWnJVUXlDanlyeDhSZmZjWXNWMjFB?=
 =?utf-8?B?ZXo5ZVNKUUJkbjhOeTNJdkJrMmVmKzFZTm1LOXp2emp5V0prT3lVVVpLNUdL?=
 =?utf-8?B?eUtRY2x6ZmJEQUgzWTJEbEc0aFRZUnpsZkI2WXBNSXU4c1hqeDNaVExhUk9L?=
 =?utf-8?B?YlMvVWVKY1JwS1hiTGF0WEErVHJkQlRJNXR0WnlNV1RHc2ZlcWlBWXJkZTBI?=
 =?utf-8?B?RFVEMTlSa0ZhK2lsMTFwSGpaTnJ0cDNLRFAzUDR0MFdLMHRJMm1LaEluQjEr?=
 =?utf-8?B?SFg0aHllUUx4VnRoSldBL3A1L1lvWTU0US92UWZKVlpQcjRMcjluVVgwR3p0?=
 =?utf-8?B?aFBRanJzTmVuY1oydDJtS3liN2F6bkZFQTZVY0d5THF3THBybS9TcXRNTzNF?=
 =?utf-8?B?ZnNvMVNHUURkN1ZjUVd1VHRpdEJ6dkVCeWZsS213Q3VwMkgzWjdCdGxwYVJB?=
 =?utf-8?B?N1lyNWNQQy9mLzFNWDNZQ0J1Vll4VklNenMxMUVZV1UrUEtTZ1p5UytIcUs2?=
 =?utf-8?B?dHB1NkY2WkZQdGJBWjQvS2NRY1VYOFJmbmtCUGNRS3hBbmlEb05LN3doN1ND?=
 =?utf-8?B?SjBMY2kxd3dqZnptc253blBBbTNrT3dKRk1xUy95MDUvWERlWW1jTllJeTBp?=
 =?utf-8?B?cE83V1YwZ1NXQ24wdmRlVzRUZS9sQ3FuaE9Gb3JYVWdwWXJBRXFKbFM0OW5q?=
 =?utf-8?B?alNPdE1aVU1xbVpZekRxQ1ZzUWFXczRhbGhvYnhyZmtPcW5oYnpkdkNjWERi?=
 =?utf-8?B?NGlmdVB1dkpXVEN1eld3M3o5SWFXcUhDU2hlTmZ6a3ZDdkUxZzRjOWJFZitz?=
 =?utf-8?B?dmlBM0lVVzdtc1V3Zm1GVmZSaFNQUEdJSzNNVUlGb0wzMlE2ajBxNWR3WkFr?=
 =?utf-8?B?OEFVY0FYbjR1VE5wYStEZDZidWtQeDhkSlY4czhyNG95elhJMVRNUnRIZ1pv?=
 =?utf-8?B?RHpKY0p0SXd0Q29ucGxwNUFINGtWRmZLQzZ0ekZVcE5QTk1jTGVvQlc4dHRQ?=
 =?utf-8?B?Y2R1dVZmd3Z5dmYyTnZkSE5NeUFyMTFPM3B2aVdkaWhnM3Y4N0Qxd1daRDFh?=
 =?utf-8?B?RWdkSFpWdXNiSVlXV0cwZUZQMzNoYVZHVk5Qd0h2Q3pOR1RFQ1ZhQmVvMG1R?=
 =?utf-8?B?TVF5Z3BCWWlpeStFNHBHbTJEalg1REhONzVVSDloTWpRM2M4eUVzMlVGcHVh?=
 =?utf-8?B?SzhpRElNanpEQWtWczJEYnBnb1VMenBGRU9GdmlMYTk4K1dYVjUwTDd4RklM?=
 =?utf-8?B?WElINlUxeVdndG9ZeHpiVG5EaExXUkZuaVVUNUd2dUlKNmhROG5IV2E3Qzd6?=
 =?utf-8?B?bDVtN2tINDY3RnlONUw4V09OV3FXVXc1Vm1xOUFlNGNmekhSUkdPeXJwRjYv?=
 =?utf-8?B?VVMrYmNmRDl5ZHFsWWMyV3A5Uzl3Rjh0enVycVF4dFNmWkF6R0pkUjRHZ1BD?=
 =?utf-8?B?OGcyZWtPRnB0aEJML01aN3pIRXJtZ3FtcW9LczZxeGJUMkJUR2lTcmpqU2Rk?=
 =?utf-8?B?TDdycUlVMVhnVkQ5SVpzTEFmeFFkUzFuRU80bTJwOGg3S0s1aDEzWFB1eEtq?=
 =?utf-8?B?dGQva21Mc0lSdS9tWTBsYlRjQUhRNFVMVmxya2RpQ1hpZ2hjTks2dEtQTms2?=
 =?utf-8?B?ZDFEcmE3TDNwUEQ2RTRDM3laem1DM1FwZHFVNFU3UDBEWStMOXd2MkJhcytq?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F80B611D5EA5F44A211D5EB8802BB58@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d00676-de84-4b0f-b6d6-08db37294354
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 05:30:56.5351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PS0mcNgcmMLVJWSn/4VdXw5r5BgDRkBI0b1Z2/94ex+K3oYW77roVr2C7zK9FR6HNjsrKw0EGpd4LmoF1EBMBo4E7SC+GZrCNz7vEyBXHCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5263
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_223110_943261_106F74A4 
X-CRM114-Status: GOOD (  26.04  )
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

T24gTW9uLCAyMDIzLTA0LTAzIGF0IDIwOjM2ICswNTMwLCBWaW5vZCBLb3VsIHdyb3RlOg0KPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IE9uIDE2LTAzLTIzLCAxNToxNCwgQ2h1bmZlbmcgWXVuIHdyb3RlOg0KPiA+
IEFkZCBhIGRlYnVnZnMgcm9vdCBmb3IgcGh5IGNsYXNzLCBhbmQgY3JlYXRlIGEgZGVidWdmcyBk
aXJlY3RvcnkNCj4gPiB1bmRlcg0KPiA+IHRoZSByb290IHdoZW4gY3JlYXRlIHBoeSwgdGhlbiBw
aHkgZHJpdmVycyBjYW4gYWRkIGRlYnVnZnMgZmlsZXMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
IHY5OiBjcmVhdGUgYSAncGh5JyBkZWJ1Z2ZzIHJvb3QsIGFkZCBhIGRlYnVnZnMgZW50cnkgaW4g
c3RydWN0IHBoeQ0KPiA+IHN1Z2dlc3RlZCBieSBWaW5vZDsNCj4gPiANCj4gPiBObyB2OCBzZW50
IG91dDsNCj4gPiANCj4gPiB2Mn52Nzogbm8gY2hhbmdlcw0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L3BoeS9waHktY29yZS5jICB8IDE0ICsrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvbGludXgv
cGh5L3BoeS5oIHwgIDIgKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3BoeS1jb3JlLmMgYi9kcml2ZXJz
L3BoeS9waHktY29yZS5jDQo+ID4gaW5kZXggOTk1MWVmYzAzZWFhLi4wNTcxNTM1Mjg4MWUgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9waHkvcGh5LWNvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
cGh5L3BoeS1jb3JlLmMNCj4gPiBAQCAtMTEsNiArMTEsNyBAQA0KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvZXhwb3J0Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiAgI2luY2x1
ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPg0KPiA+ICAj
aW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+
ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+IEBAIC0yMCw2ICsyMSw3IEBADQo+ID4gICNp
bmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCj4gPiANCj4gPiAgc3RhdGljIHN0
cnVjdCBjbGFzcyAqcGh5X2NsYXNzOw0KPiA+ICtzdGF0aWMgc3RydWN0IGRlbnRyeSAqcGh5X2Rl
YnVnZnNfcm9vdDsNCj4gPiAgc3RhdGljIERFRklORV9NVVRFWChwaHlfcHJvdmlkZXJfbXV0ZXgp
Ow0KPiA+ICBzdGF0aWMgTElTVF9IRUFEKHBoeV9wcm92aWRlcl9saXN0KTsNCj4gPiAgc3RhdGlj
IExJU1RfSEVBRChwaHlzKTsNCj4gPiBAQCAtOTk2LDYgKzk5OCw4IEBAIHN0cnVjdCBwaHkgKnBo
eV9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSwNCj4gPiAgICAgICAgICAgICAgIHBtX3J1bnRpbWVfbm9fY2FsbGJhY2tzKCZwaHktPmRldik7
DQo+ID4gICAgICAgfQ0KPiA+IA0KPiA+ICsgICAgIHBoeS0+ZGVidWdmcyA9IGRlYnVnZnNfY3Jl
YXRlX2RpcihkZXZfbmFtZSgmcGh5LT5kZXYpLA0KPiA+IHBoeV9kZWJ1Z2ZzX3Jvb3QpOw0KPiA+
ICsNCj4gPiAgICAgICByZXR1cm4gcGh5Ow0KPiA+IA0KPiA+ICBwdXRfZGV2Og0KPiA+IEBAIC0x
MjI2LDYgKzEyMzAsNyBAQCBzdGF0aWMgdm9pZCBwaHlfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ID4gDQo+ID4gICAgICAgcGh5ID0gdG9fcGh5KGRldik7DQo+ID4gICAgICAgZGV2X3Zk
YmcoZGV2LCAicmVsZWFzaW5nICclcydcbiIsIGRldl9uYW1lKGRldikpOw0KPiA+ICsgICAgIGRl
YnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShwaHktPmRlYnVnZnMpOw0KPiA+ICAgICAgIHJlZ3VsYXRv
cl9wdXQocGh5LT5wd3IpOw0KPiA+ICAgICAgIGlkYV9zaW1wbGVfcmVtb3ZlKCZwaHlfaWRhLCBw
aHktPmlkKTsNCj4gPiAgICAgICBrZnJlZShwaHkpOw0KPiA+IEBAIC0xMjQyLDYgKzEyNDcsMTUg
QEAgc3RhdGljIGludCBfX2luaXQgcGh5X2NvcmVfaW5pdCh2b2lkKQ0KPiA+IA0KPiA+ICAgICAg
IHBoeV9jbGFzcy0+ZGV2X3JlbGVhc2UgPSBwaHlfcmVsZWFzZTsNCj4gPiANCj4gPiArICAgICBw
aHlfZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJwaHkiLCBOVUxMKTsNCj4gPiAr
DQo+ID4gICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiAgZGV2aWNlX2luaXRjYWxsKHBoeV9j
b3JlX2luaXQpOw0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgX19leGl0IHBoeV9jb3JlX2V4aXQo
dm9pZCkNCj4gPiArew0KPiA+ICsgICAgIGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShwaHlfZGVi
dWdmc19yb290KTsNCj4gDQo+IFRoaXMgc2hvdWxkIGJlIG1vdmVkIHRvIHBoeV9yZWxlYXNlKCkg
d2Ugd2FudCB0aGUgZGVidWdmcyB0byBiZQ0KPiBjbGVhbmVkDQo+IGZpcnN0DQpwaHlfcmVsZWFz
ZSgpIHdpbGwgcmVtb3ZlIGl0cyBkZWJ1Z2ZzIGZpbGVzLCBoZXJlIGl0IGlzIHRoZSBkZWJ1Z2Zz
DQpyb290IG9mIHBoeSBjb3JlLg0KPiANCj4gPiArICAgICBjbGFzc19kZXN0cm95KHBoeV9jbGFz
cyk7DQo+IA0KPiBobW1tIHdlIGFyZSBtaXNzaW5nIHRoaXMgYWxyZWFkeSwgdGhhdCBtaWdodCBi
ZSBhbiBpc3N1ZSENCj4gDQo+ID4gK30NCj4gPiArbW9kdWxlX2V4aXQocGh5X2NvcmVfZXhpdCk7
DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oIGIvaW5jbHVkZS9saW51
eC9waHkvcGh5LmgNCj4gPiBpbmRleCAzYTU3MGJjNTlmYzcuLmY2ZDYwN2VmMGU4MCAxMDA2NDQN
Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BoeS9waHkuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvcGh5L3BoeS5oDQo+ID4gQEAgLTE0OCw2ICsxNDgsNyBAQCBzdHJ1Y3QgcGh5X2F0dHJzIHsN
Cj4gPiAgICogQHBvd2VyX2NvdW50OiB1c2VkIHRvIHByb3RlY3Qgd2hlbiB0aGUgUEhZIGlzIHVz
ZWQgYnkgbXVsdGlwbGUNCj4gPiBjb25zdW1lcnMNCj4gPiAgICogQGF0dHJzOiB1c2VkIHRvIHNw
ZWNpZnkgUEhZIHNwZWNpZmljIGF0dHJpYnV0ZXMNCj4gPiAgICogQHB3cjogcG93ZXIgcmVndWxh
dG9yIGFzc29jaWF0ZWQgd2l0aCB0aGUgcGh5DQo+ID4gKyAqIEBkZWJ1Z2ZzOiBkZWJ1Z2ZzIGRp
cmVjdG9yeQ0KPiA+ICAgKi8NCj4gPiAgc3RydWN0IHBoeSB7DQo+ID4gICAgICAgc3RydWN0IGRl
dmljZSAgICAgICAgICAgZGV2Ow0KPiA+IEBAIC0xNTgsNiArMTU5LDcgQEAgc3RydWN0IHBoeSB7
DQo+ID4gICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgcG93ZXJfY291bnQ7DQo+ID4gICAg
ICAgc3RydWN0IHBoeV9hdHRycyAgICAgICAgYXR0cnM7DQo+ID4gICAgICAgc3RydWN0IHJlZ3Vs
YXRvciAgICAgICAgKnB3cjsNCj4gPiArICAgICBzdHJ1Y3QgZGVudHJ5ICAgICAgICAgICAqZGVi
dWdmczsNCj4gPiAgfTsNCj4gPiANCj4gPiAgLyoqDQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gDQo+
IC0tDQo+IH5WaW5vZA0K

