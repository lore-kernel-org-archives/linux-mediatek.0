Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C63C6FD18
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 03:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/YaXUooNh3Y3ARn1kM6HRBh7eJutEK3iM5yy1dpuVE=; b=NTGYtGMqr4+kdWjGtBDAClyD2g
	j6G8PDBOJHlOdCZE7qjmAm7NHZzHQZ+UTiUw7fCMRj+g0f6PXiHBVX08tV0XOLSqiW7wBVBgPnZpM
	oWs0L+BwRYU32m1yhpRtO8ErT8xZQQyseWvhm31YOWBc+8Ezo1us2cSyJ7Ec7+/WLNdLFa5pi3hBi
	/5q9frWofluN2r/GGp1xQ1tm0swjiHXY98l9yFKSHmrZY50elzvWc5zGVhR9k8SyCXB2Dz4L/6mL1
	Lr5X93x5JSB769Qnjc4sPDwcExXnLqCwwp3XMt8S5zWvhvuHX2E54yIFbNntP12RavD0lxX0XRG7B
	9mtxvDUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppKZy-006vHJ-03;
	Thu, 20 Apr 2023 03:03:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppKZu-006vGg-1o
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Apr 2023 03:03:24 +0000
X-UUID: e15a288cdf2711ed8687db9d93187ff1-20230419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=n/YaXUooNh3Y3ARn1kM6HRBh7eJutEK3iM5yy1dpuVE=;
	b=HP+WPmq/ReS/CnkkTTJjfmME2XA7KBo0JvYaSFWa/wOzlCvqcQ31Q7NG0qNf3g2kpj6VxbNvi8ke4gTC9IVDx5jS37ecyC9k4OC6xV4zkP0Aof7w0SDjXbaQvBZpMXRip0CCrNi6DUcVWkQSlfmrK4tCClWtOWiLd/RzUSsVQuM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:ab1805ce-5fd7-4c4a-b37d-34489cd5f16c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:40
X-CID-INFO: VERSION:1.1.22,REQID:ab1805ce-5fd7-4c4a-b37d-34489cd5f16c,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:40
X-CID-META: VersionHash:120426c,CLOUDID:b47feba1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:2304201102419OJOIV09,BulkQuantity:1,Recheck:0,SF:17|19|48|29|28|102,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: e15a288cdf2711ed8687db9d93187ff1-20230419
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1540503126; Wed, 19 Apr 2023 20:03:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 20 Apr 2023 11:02:37 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 20 Apr 2023 11:02:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgjPjEPlKkEVBXY/jfI0G0SSgeUY9yeBeDIWm3hSN3kkaQtzEHuy0qJBylnd5IRbBOmjM2j1wQvTq5dJeGLwDbDUitoV8sosKOOqzhcQ53j1hvTF1yXfxExi1uxkD6J7GeuHYxiEbK874xT4BR2+iogrNQ0KjDqzBVGxdM+dtXJd292hC8BEak7T0MSN+Nl0OqxT+3F83QdmktB+SzTk5ii3A3dM6EjNsCSqSPFW4d0RVojpRsCvisOxn83oRXZ7MYBYU2Xep4JTlI2F5XmKDeSUTB7P15N0MnRC75RMGK/St/eamXfsqeHd2WatVi7p05DRzFkTy0GF4vEoRGxOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/YaXUooNh3Y3ARn1kM6HRBh7eJutEK3iM5yy1dpuVE=;
 b=jF9UzJS7b70RZ148byubesHk1kK15G4Jyp+b4DbDm3VIfLiN9xd8H9fgCYhofbz8kyhf5FVAQzez/NK4rUj0vC/nlv9n55inqoHaHfFOkNOWmm+L6eR+fNzTwSqgNUkExg7G8y4gkEhjl7PjQWwTOIVhQxIlYM3+NKZcEToXczOsdAPFoLwgsR04TDgQ75uhvoJTgGaFQuaVXjevS67TbyJfIPKBHK+HG5eTdmSejBRNlP2FViFQyEPfPBENBGG/paJnXcGvAfB+RzUCcCwpVhIN+rSG2QMH1dbW1/CCkGz1U6dKXqL6mppXLlFP5LdbduWAX2l2yJjt06Ln5qPH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/YaXUooNh3Y3ARn1kM6HRBh7eJutEK3iM5yy1dpuVE=;
 b=DSQVcbVT+l00Ln2OqfnYNijKnj6ms0dU3SI0ArVxmSbxnx3fjWG/or7amjXbwsuvQdN2pWA7XCWxAUmmXO4ScfBeCEsi/YkUXLZb0Ozn6MK6a9HLoZGQEV2abYK9MhlaAL2ZwnALZ2aym6BtjwmnVfAnDExydF00R4GIGwFsWA8=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by KL1PR03MB7080.apcprd03.prod.outlook.com (2603:1096:820:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 03:02:35 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::a9f2:b477:6a2d:b8aa]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::a9f2:b477:6a2d:b8aa%4]) with mapi id 15.20.6298.045; Thu, 20 Apr 2023
 03:02:35 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [bug report] drm/mediatek: Add drm ovl_adaptor sub driver for
 MT8195
Thread-Topic: [bug report] drm/mediatek: Add drm ovl_adaptor sub driver for
 MT8195
Thread-Index: AQHZcqipj1XVDhArVEqMKpkj5uS6BK8zg8mA
Date: Thu, 20 Apr 2023 03:02:33 +0000
Message-ID: <4cb573b840cf5fec2e28e5f5f6dcb0bf4b0bfe17.camel@mediatek.com>
References: <58bfb6b0-8dea-4d96-925e-bb96d80629b2@kili.mountain>
In-Reply-To: <58bfb6b0-8dea-4d96-925e-bb96d80629b2@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|KL1PR03MB7080:EE_
x-ms-office365-filtering-correlation-id: ebedbe82-0fde-4157-a5a9-08db414bb05f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fBr2zyqnk7bx7AWCZ2JTp9iIliyhMXsecNFbxYhXs7YMYqqYs4/KXspHI+yMU1dPdF8fLk2dtI0bLXPJcdNW9BW62TVwbwIgUJUhl3APkXyh6B44wb2gKNNUBj5x60SSDF01ThDcvl8QBixW9dz1axFdYYfUUXhzBpYmLWVToLqQN/EP5VbbbZTwWKbKhFTuGlrsHDACAIM2nJvkVt0KtJSrxEYhaFfFvFZAX8wlAUdJGBzrd2jfr0xVf6pW154aGIT9i+74Wiln7qJSsOL0M9Q4fOMABRMUaOuoz14Pv2vfnoM290OYkNIHMbgs+b03QQB43Yn1jZtvXVMhp0Oqvu5kgnE+H+CSjuoLYB6FeOSYYUuuKyuJsrqNEaOpzH+Ut3D/BoTwM+fvf04K7yrNQs8PhCcpbtT2pjg2Lh1gYAhgorLlBVHnS16FU9xpHfZ0/LRLjYcJYqtxLuOKZIVx2SEVppU2nas/VeQfWyv/zyuItErmvzESvnJMiKEZCrMXF7yojFyDoW7fKieS09SGrQ4pbYfktnI93PSxS85XwXCtXZTqdW+vJVEMvV4UqJejL8H2Wsmo0B7dBy+JMyaH3TXzsXXlzDPOVjdp5VRa7Sq2WjSNUL1V6xCF5qNGDhRWGX/oc8zb1Asr9eNfKMVkLkKjtbK8BXbvPboRXKJNxgk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5175.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(478600001)(186003)(86362001)(6486002)(71200400001)(66556008)(83380400001)(91956017)(316002)(2616005)(6512007)(6506007)(26005)(66476007)(66446008)(64756008)(76116006)(4326008)(66946007)(6916009)(5660300002)(8936002)(8676002)(2906002)(122000001)(41300700001)(38070700005)(38100700002)(85182001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnVCckppR3gxcmFESDNXWmxVS1hVU0tVNnVpUkFKUlNHQ1RqWDZ0RmpoMUpz?=
 =?utf-8?B?SFVoYUpyNS9XWU5lcisxL0hqSmJHTHkwelhGRUw0cDk3S2s5T2Z0UTlGSUox?=
 =?utf-8?B?N1FRVDByN0kyNG5KMzcvazY1U3IvOHkxaTlPc2NYSHBsa3pqSkxONERJMWJS?=
 =?utf-8?B?dkdDQ2tkOEJOQ01sTGdWcVBxSUZZUFBKMU1RNzl3cHkwNkNCTUZyTVZHQ3Q5?=
 =?utf-8?B?QWdjUXhud1U2dVE5bXd4UERPUFVieXRseEdQSFZTK3BiRm8xcDJSNFc2d0M1?=
 =?utf-8?B?dHorZ0QyNmpvTERSLzBqYVFyZmpkVVRpcXlRbDMwc1FjOEErcjVzT0tHLytJ?=
 =?utf-8?B?VVplNW9JalhFSk9wY2c5VDgvcWV5V09OK2FzYmw4UXJCQXRYZTQ5bXRPTFVP?=
 =?utf-8?B?elVrVGtGMGF2UjJTa1JXU3BjbnJsaGVSUlZVTU0vQkFUcmZWSVFwNHVHclND?=
 =?utf-8?B?djBNUWZHWTl1UlAvTURTVnBYd212eXBxYXVZbnYwMGlIREZvdnZmMlJ4bWgy?=
 =?utf-8?B?YStBeFBIRVloVHNQQ3E5SC81K2I2NUNkTFdZaGV2azR0UzlVbThXRzlPTW1H?=
 =?utf-8?B?eWNja3BwV2lzelZ6bHo3dFlWenVjRkVzTEd4Y2pTUFNlK2JlNVFEUjRpOVMr?=
 =?utf-8?B?WVloUTNUdEo1VjRiWHdBdjFDSHhyNGI0WXozY3FtY04vUnM2TlBpL3A4amdM?=
 =?utf-8?B?cUh0ckRoQnBRNTRtQXd4Q3NmckttSmdwK0RXOW5tUyswQWlVNVZVMnhIT2dN?=
 =?utf-8?B?T3dPMC90eUwvSFVzSUE2ZUNiR1ROR3JwbzhkeWRNcENkRVBUTk1QUWdoTldD?=
 =?utf-8?B?ZTY0aitDSU90eW1WNW9kc3BGT3dyakNicnl0NFdxanVLTExDNElVT1luZkU3?=
 =?utf-8?B?T0NhdEZXVllTK3hlK1dNOFRkS3UwNUdKR2VNWTBHR1FNRkVtYUV3bXluNnhQ?=
 =?utf-8?B?NXVUYUZEM3krbUMwSGJCVUNLUTRUTDhPSXdYV21NaUgydklWOERENGNsdnFz?=
 =?utf-8?B?eFoxdkdyVHp5UDVFMmMveHlCckdXSFlTdXRldlcwZjQwMW5jRVYvZ3BZZjFQ?=
 =?utf-8?B?Tm4ycnh3cmFIVG9Hai90Q0IvQVo2alIyWC90bHJkTXM1VzMxUWJPRWZnMExB?=
 =?utf-8?B?YVRrb0lIY0Fhbzh2NFlvcVZCM1RPdWtQUzhNOWNBckhYK1dPVU5vZDJKbzRO?=
 =?utf-8?B?ZHU0M2w2L29WNVRwTlkxdGlIUU93WVNYcitkWVRIdEN5MTVKWllsRkZzeUdK?=
 =?utf-8?B?bUtQMUZ3OU5MSTdIOU5iMHBCTmJsZHFlczNVQmJZUXA2OExQWjRNbzBvdWRs?=
 =?utf-8?B?WE9LR1Y2THRyMVE3azAyaDFod1FFNnVnRDBKQjlzWndzbGlscGt5RWlzejR0?=
 =?utf-8?B?MG9yN1FxRkJjR3ZyaGl6amZBWGtrTE1rMGNib0FocEx3QzFhN3Q1N3ZJUFE5?=
 =?utf-8?B?ZjZKOEdDRXpiZVhDMHVETS9KODl4WkF1b2QwSHVsU0ZrSmlGYnFHNitNaWFa?=
 =?utf-8?B?cUVBU1hlaE5CUG8wQjhRRXVpcjVOMExaVzBES1lkMEhHdHdveG8va3dUejR3?=
 =?utf-8?B?Zkh5S3IyZ2hXMVRIc2ozNlZ6SFFBUlRpUmNPQ0d4MytTclVEOFFMS1VPdVRM?=
 =?utf-8?B?a2JiVUpuMFF6TlpHU2xJRG1mVCtOWElZN2w2UWxWdFpSMEZUa0JObkZVYVhC?=
 =?utf-8?B?bTcvQXV0YzVmS3VXbU44Ny9nV0tQam1xQkZTeHZweDRQRmJsRDJoZUcxSjEy?=
 =?utf-8?B?MFU3ODJaNEszZ01YZmo5VnY1aHNpQ2VRQno5QTZ4SnF2eFB1Z0ZFMFlPTjBS?=
 =?utf-8?B?ZnlPVjhoZnVWVGdZaVY4ay9kUFpCbXJLMjNJTjFoSXRWb2VsRUd5OW9EWWls?=
 =?utf-8?B?ZU5CRXpGdmEvbjZXOHM5emQ1eFc5bDY4dEVKbG5OSHdpZXBIRVU5alVwOWUx?=
 =?utf-8?B?QzF1SjJ4dHRjVmoybllpdnpqaUlOOHd0ODNLdVp1c1ZMZWNwdkpkSVBNR0Js?=
 =?utf-8?B?dzJicE5hekw2UUJhT3hwZTkzLzM0NzZxT2xTSFM2ZE1iZGlRUlZuRkZ4T0lV?=
 =?utf-8?B?QXlYcUt0aUJRYkg2R0h3aGRuWmhVMnpPOFNBZ1MwZkhDSGJiK2x2QXE5SHVW?=
 =?utf-8?B?L0N3V0svampzbGNTbFg3S1VaOVF0NlE3OW1nVEJ3NE0wZEdDcmwyS2tCQzFG?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5ED1C3F9E0A6447A946E46173160958@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebedbe82-0fde-4157-a5a9-08db414bb05f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 03:02:33.9969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ooN1w94yb8pKEJp3rpXz6irg75IvlI4Z1BF0643qKYMHPQLHWnrb6RWa+LplX5qj1bb0QhM6lQyV8nUMircZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_200322_663884_C30BEE83 
X-CRM114-Status: GOOD (  15.16  )
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

SGkgRGFuLA0KDQpTb3JyeSBmb3IgdGhlIHdhcm5pbmcuDQpJIHdpbGwgc2VuZCBhIHBhdGNoIHRv
IGZpeCBpdC4NCg0KUmVnYXJkcywNCk5hbmN5IA0KDQpPbiBXZWQsIDIwMjMtMDQtMTkgYXQgMTM6
MjAgKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNl
IGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZl
IHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSGVsbG8gTmFu
Y3kuTGluLA0KPiANCj4gVGhlIHBhdGNoIDBkOWVlZTkxMThiNzogImRybS9tZWRpYXRlazogQWRk
IGRybSBvdmxfYWRhcHRvciBzdWIgZHJpdmVyDQo+IGZvciBNVDgxOTUiIGZyb20gTWFyIDIxLCAy
MDIzLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMNCj4gY2hlY2tlciB3YXJu
aW5nOg0KPiANCj4gICAgICAgICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5jOjYwNg0KPiBtdGtfZGRwX2NvbXBfaW5pdCgpDQo+ICAgICAgICAgZXJyb3I6IHVuaW5p
dGlhbGl6ZWQgc3ltYm9sICdjb21wX3BkZXYnLg0KPiANCj4gZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiAgICAgNTQ2IGludCBtdGtfZGRwX2NvbXBfaW5pdChz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdA0KPiBtdGtfZGRwX2NvbXAgKmNvbXAsDQo+
ICAgICA1NDcgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjb21wX2lkKQ0KPiAg
ICAgNTQ4IHsNCj4gICAgIDU0OSAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmNvbXBf
cGRldjsNCj4gICAgIDU1MCAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX3R5cGUgdHlwZTsNCj4g
ICAgIDU1MSAgICAgICAgIHN0cnVjdCBtdGtfZGRwX2NvbXBfZGV2ICpwcml2Ow0KPiAgICAgNTUy
ICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQ0KPiAgICAgNTUzICAgICAgICAgaW50
IHJldDsNCj4gICAgIDU1NCAjZW5kaWYNCj4gICAgIDU1NQ0KPiAgICAgNTU2ICAgICAgICAgaWYg
KGNvbXBfaWQgPCAwIHx8IGNvbXBfaWQgPj0NCj4gRERQX0NPTVBPTkVOVF9EUk1fSURfTUFYKQ0K
PiAgICAgNTU3ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gICAgIDU1OA0KPiAg
ICAgNTU5ICAgICAgICAgdHlwZSA9IG10a19kZHBfbWF0Y2hlc1tjb21wX2lkXS50eXBlOw0KPiAg
ICAgNTYwDQo+ICAgICA1NjEgICAgICAgICBjb21wLT5pZCA9IGNvbXBfaWQ7DQo+ICAgICA1NjIg
ICAgICAgICBjb21wLT5mdW5jcyA9IG10a19kZHBfbWF0Y2hlc1tjb21wX2lkXS5mdW5jczsNCj4g
ICAgIDU2MyAgICAgICAgIC8qIE5vdCBhbGwgZHJtIGNvbXBvbmVudHMgaGF2ZSBhIERUUyBkZXZp
Y2Ugbm9kZSwNCj4gc3VjaCBhcyBvdmxfYWRhcHRvciwNCj4gICAgIDU2NCAgICAgICAgICAqIHdo
aWNoIGlzIHRoZSBkcm0gYnJpbmcgdXAgc3ViIGRyaXZlcg0KPiAgICAgNTY1ICAgICAgICAgICov
DQo+ICAgICA1NjYgICAgICAgICBpZiAobm9kZSkgew0KPiAgICAgNTY3ICAgICAgICAgICAgICAg
ICBjb21wX3BkZXYgPSBvZl9maW5kX2RldmljZV9ieV9ub2RlKG5vZGUpOw0KPiAgICAgNTY4ICAg
ICAgICAgICAgICAgICBpZiAoIWNvbXBfcGRldikgew0KPiAgICAgNTY5ICAgICAgICAgICAgICAg
ICAgICAgICAgIERSTV9JTkZPKCJXYWl0aW5nIGZvciBkZXZpY2UgJXNcbiIsDQo+IG5vZGUtPmZ1
bGxfbmFtZSk7DQo+ICAgICA1NzAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUFJP
QkVfREVGRVI7DQo+ICAgICA1NzEgICAgICAgICAgICAgICAgIH0NCj4gICAgIDU3MiAgICAgICAg
ICAgICAgICAgY29tcC0+ZGV2ID0gJmNvbXBfcGRldi0+ZGV2Ow0KPiAgICAgNTczICAgICAgICAg
fQ0KPiANCj4gY29tcF9wZGV2IG5vdCBpbml0aWFsaXplZCBvbiBlbHNlIHBhdGguDQo+IA0KPiAg
ICAgNTc0DQo+ICAgICA1NzUgICAgICAgICBpZiAodHlwZSA9PSBNVEtfRElTUF9BQUwgfHwNCj4g
ICAgIDU3NiAgICAgICAgICAgICB0eXBlID09IE1US19ESVNQX0JMUyB8fA0KPiAgICAgNTc3ICAg
ICAgICAgICAgIHR5cGUgPT0gTVRLX0RJU1BfQ0NPUlIgfHwNCj4gICAgIDU3OCAgICAgICAgICAg
ICB0eXBlID09IE1US19ESVNQX0NPTE9SIHx8DQo+ICAgICA1NzkgICAgICAgICAgICAgdHlwZSA9
PSBNVEtfRElTUF9HQU1NQSB8fA0KPiAgICAgNTgwICAgICAgICAgICAgIHR5cGUgPT0gTVRLX0RJ
U1BfTUVSR0UgfHwNCj4gICAgIDU4MSAgICAgICAgICAgICB0eXBlID09IE1US19ESVNQX09WTCB8
fA0KPiAgICAgNTgyICAgICAgICAgICAgIHR5cGUgPT0gTVRLX0RJU1BfT1ZMXzJMIHx8DQo+ICAg
ICA1ODMgICAgICAgICAgICAgdHlwZSA9PSBNVEtfRElTUF9PVkxfQURBUFRPUiB8fA0KPiAgICAg
NTg0ICAgICAgICAgICAgIHR5cGUgPT0gTVRLX0RJU1BfUFdNIHx8DQo+ICAgICA1ODUgICAgICAg
ICAgICAgdHlwZSA9PSBNVEtfRElTUF9SRE1BIHx8DQo+ICAgICA1ODYgICAgICAgICAgICAgdHlw
ZSA9PSBNVEtfRFBJIHx8DQo+ICAgICA1ODcgICAgICAgICAgICAgdHlwZSA9PSBNVEtfRFBfSU5U
RiB8fA0KPiAgICAgNTg4ICAgICAgICAgICAgIHR5cGUgPT0gTVRLX0RTSSkNCj4gICAgIDU4OSAg
ICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgICA1OTANCj4gICAgIDU5MSAgICAgICAgIHBy
aXYgPSBkZXZtX2t6YWxsb2MoY29tcC0+ZGV2LCBzaXplb2YoKnByaXYpLA0KPiBHRlBfS0VSTkVM
KTsNCj4gICAgIDU5MiAgICAgICAgIGlmICghcHJpdikNCj4gICAgIDU5MyAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07DQo+ICAgICA1OTQNCj4gICAgIDU5NSAgICAgICAgIHByaXYtPnJl
Z3MgPSBvZl9pb21hcChub2RlLCAwKTsNCj4gICAgIDU5NiAgICAgICAgIHByaXYtPmNsayA9IG9m
X2Nsa19nZXQobm9kZSwgMCk7DQo+ICAgICA1OTcgICAgICAgICBpZiAoSVNfRVJSKHByaXYtPmNs
aykpDQo+ICAgICA1OTggICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHByaXYtPmNsayk7
DQo+ICAgICA1OTkNCj4gICAgIDYwMCAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkN
Cj4gICAgIDYwMSAgICAgICAgIHJldCA9IGNtZHFfZGV2X2dldF9jbGllbnRfcmVnKGNvbXAtPmRl
diwgJnByaXYtDQo+ID5jbWRxX3JlZywgMCk7DQo+ICAgICA2MDIgICAgICAgICBpZiAocmV0KQ0K
PiAgICAgNjAzICAgICAgICAgICAgICAgICBkZXZfZGJnKGNvbXAtPmRldiwgImdldCBtZWRpYXRl
ayxnY2UtY2xpZW50LQ0KPiByZWcgZmFpbCFcbiIpOw0KPiAgICAgNjA0ICNlbmRpZg0KPiAgICAg
NjA1DQo+IC0tPiA2MDYgICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShjb21wX3BkZXYsIHBy
aXYpOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eDQo+
IFdhcm5pbmcgbXNnIHRyaWdnZXJlZCBoZXJlLg0KPiANCj4gICAgIDYwNw0KPiAgICAgNjA4ICAg
ICAgICAgcmV0dXJuIDA7DQo+ICAgICA2MDkgfQ0KPiANCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBl
bnRlcg0K

