Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 06:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ExRHOsKa+o4/xRHb1iJaK+uFwqa3iR/Z+qzXKUe3Ao=; b=dltIgVYDfyIEP9RqUj672PJQTy
	CYtLycU693bsXFaM87viJIhyio2nhRxhfqsiZEL5deBm1q5tBb72gH4kCLcKPo+vIYAkiLmZTol1I
	1zKPVn9IctYAZFBDh77C1JO4eB4up7jKyGv6tQuA+Pi/1ARcOkdpOSiPb0Crfl+5KOO5rYKOwDS0Z
	WmIkqmA2ggR6oU6hej5UgVOkwobv8QxYdmYCKFcEkxvS51Gsf5qfnRpn9pbfoWZ9DGN5l9c/dRjZw
	Qcvlbz7mWGJo2P3Y1jl1sTNv3C3DztYB9dYLtmgScEFCaX1zZ0ZU35YQDBBJoUWjdllEaKTV4UMYZ
	BIa1q/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4te-00FGPI-4F; Thu, 23 Feb 2023 06:16:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4tb-00FGOM-9Y
	for linux-mediatek@lists.infradead.org; Thu, 23 Feb 2023 06:16:01 +0000
X-UUID: 8266cbe4b34111edbbe3f76fe852e059-20230222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+ExRHOsKa+o4/xRHb1iJaK+uFwqa3iR/Z+qzXKUe3Ao=;
	b=hb1FB1nxR/uRY1sKUbUpK/Z2+XlucEKD9F3BUZU7qOL4hQ3VulHuIlZO0vQEs9BZhhWtB+NiC19+3KpgOU8M8TJ6uqGURYRPC27N5EZjbh36Mnb66cUX9w9VPen00+Ln2A3ZdNnffXSskFN5E7S7eMKET1hU04b2JIS7JdYKibA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:d9471a2f-a4a2-4c19-8dbe-2e23f17dff41,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.20,REQID:d9471a2f-a4a2-4c19-8dbe-2e23f17dff41,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:25b5999,CLOUDID:502de2f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230223141548XZC8UN0O,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|102,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 8266cbe4b34111edbbe3f76fe852e059-20230222
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 514538881; Wed, 22 Feb 2023 23:15:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 23 Feb 2023 14:15:43 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 23 Feb 2023 14:15:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqlhIp79NDoiggOBiTFGvSAdf2BOrj1IKwRsqd9IDB3VhoKYtbBjbDFP1gdI/HYiIXLMhLgYUYdS0Ad+FT+yycyWSE864/X2xfjdCcfURKawmUihDjtEOHcZbRS4GPC63GJQmWi+7OPeoQRc7AxHAN4S7Y017fHUmqKerSlPJDHW5T175zQ/6RviamD2tkaZ1N0VMmvn6ZV9Fvm8DL/wQ2h6i/iNc+tfWW+uGvrO2CivNLdRdf0kIULnAC0zDIRtXGc50sKqvecqZrzJZpE0MhJvW/t2y6S0Ihu7LsIItf+CyuR99CgS45nRIgPFeKP12Wg6J5Sk4pS4e7w53CXw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ExRHOsKa+o4/xRHb1iJaK+uFwqa3iR/Z+qzXKUe3Ao=;
 b=CQqbIBkHgj9/VDbdZNOw0BZ76xTASG+2Tnp0O3oG17J0Ihh//vdwHs+ccv5e4wCVe/NEiks4UGamMyKTvUUdJiNzxq+3nw08mCsCfFLorAprAUM/z5UdSDxMH/feH2k4drSO+eXKP8nA0mZRb72G9uWtjZrvYu0wgfILsPSTTm+7qatmBbM8ivxKgm0o+cqWbejXvzOWWFQWrGmuFswMTt6heGMG8Nk7+sPVOkx3YUsUuPEjHncN8vGuM8woM/9vyYpSlOnbK3cUZ19OI9w3Xy27SaOR/CHuXK78OnpiijLfcuiewddWIwKA99/RL5edraN3+RvYPmZUHxJ4yWoZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ExRHOsKa+o4/xRHb1iJaK+uFwqa3iR/Z+qzXKUe3Ao=;
 b=NEp2C6Q6SfTUDAdTdQsgyNFgGYdIJPdJIQUHHY0A42c29wLVI5Xybj6l/ZpdyJgw/cJfyl5xOeTkpAW1wSIdodKitFoFynSN3piRt+vE8eAms9WhLj4JoLN6O30h4RAiS2NVQL6SiEFHMXj0y5VuJrmQln3TJE3LAZ8Omy6e8jI=
Received: from TYZPR03MB5280.apcprd03.prod.outlook.com (2603:1096:400:3c::13)
 by PUZPR03MB5794.apcprd03.prod.outlook.com (2603:1096:301:a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Thu, 23 Feb
 2023 06:15:42 +0000
Received: from TYZPR03MB5280.apcprd03.prod.outlook.com
 ([fe80::5610:a61d:29de:d7e8]) by TYZPR03MB5280.apcprd03.prod.outlook.com
 ([fe80::5610:a61d:29de:d7e8%7]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 06:15:41 +0000
From: =?utf-8?B?SG93YXJkLVlIIEhzdSAo6Kix6IKy6LGqKQ==?=
	<Howard-YH.Hsu@mediatek.com>
To: "kvalo@kernel.org" <kvalo@kernel.org>
CC: "lorenzo.bianconi@redhat.com" <lorenzo.bianconi@redhat.com>,
	=?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>, =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
	<Evelyn.Tsai@mediatek.com>, Ryder Lee <Ryder.Lee@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: mt76: mt7915: rework init flow in
 mt7915_thermal_init()
Thread-Topic: [PATCH] wifi: mt76: mt7915: rework init flow in
 mt7915_thermal_init()
Thread-Index: AQHZRZ5GRDklrGFmlkK3N8sIVkJtSa7Y8MDIgAMghAA=
Date: Thu, 23 Feb 2023 06:15:41 +0000
Message-ID: <2b921d0137d6f0b6fe2a5da3a978f46e2310e7e3.camel@mediatek.com>
References: <20230221024317.3218-1-howard-yh.hsu@mediatek.com>
	 <87wn4b34zz.fsf@kernel.org>
In-Reply-To: <87wn4b34zz.fsf@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5280:EE_|PUZPR03MB5794:EE_
x-ms-office365-filtering-correlation-id: e394fa74-cea7-4f89-4d49-08db15656421
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: adxMs3zjVeNcdh5fd/DbU2tY2AoCzJFqttSovTuKH5w/2AzBHoj7GpvHcFpXJHGa5Jd09XWivyyravdxb49Jz3ttv+vstA2heX79klF7RL0+H5hgkK+aKs66Vr6vHTV10+HqoOeOW8IgMz/qVh2/8T70mSlBlNbb8ZfNcWAiulrD6uJ2/2FJQSlg9IK1PNpjp+ODCYMGOirfEG8pIThmp3ptnGhHeBWVOJfbWrVGnN5jkiLuUdAWu0zSclC5J13Xoy4BlXlfP52jgcOAAEsvqp33JlsQuNshVT55gBQWqIpZ8HG4LVoR/2DeCgbl2/4Xj6CgrK/rQwqRZ96G7MNpDd9YQBaEJtt8sVp/HrqJO2tDf6pASTlm6BIMUG7Up9vvxt39/FuvjZ9ZfdInmCX5j3E2XPocAeI1Fju5YeJLjFKF6NCuCO9YC9Fj5eoJ+TM7UKyUOnMsnYlFhVOa8xu8J7MOGaBCn67XfsyEQSeiWSgjE5NbVbv9UOw7CWf33wSSnkyvTgUN0TpyzccoNTeOfRBOqK42yu9gxBDwyxfTCv/oiMCTnuQqsw4gO71wVlO0XmsA/qLRNvW6ReiBLuMoANns+cezOokDJQ467/4J3YQquZpxPKA6N0wbTr1b5DCmP8bVxE6qnv8TlJndZqSq0aAr4iHSagKO/r2VyxhriUdWEZ92l88U+eJPkqDMEjenuwoGD3HirZcUVaq9zjMIDD5shqYW1aDXHUC3deg4ErVlRE62v5R2UncoHeth/0lV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5280.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(5660300002)(38100700002)(76116006)(66946007)(8676002)(64756008)(66446008)(66476007)(4326008)(6916009)(66556008)(41300700001)(478600001)(186003)(2616005)(26005)(6506007)(38070700005)(6512007)(122000001)(4744005)(2906002)(8936002)(83380400001)(36756003)(6486002)(86362001)(85182001)(71200400001)(316002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yjg5dlJ2cHBSMzA5cHloVUZzbmdMODVWV3VBQzdrbWJ3UmgwOU8xWXpjTFQy?=
 =?utf-8?B?UnlJVGpJaXRydVAvL3B0OUpKQXhxamdHcXJ5RFJpOFEvYm5Sb2tKZnRabCtQ?=
 =?utf-8?B?OWNuUVBmYVQ0TXZsWEFVR1hNODAweUx4aFVUUGtWQWhsc205N1VoOFgrNjk4?=
 =?utf-8?B?YVFVQnVSdGZqdmpIUzFZUlpZaFVqWjM4RG4rdTZpSzlRbHoyUVM2YXJMTmI2?=
 =?utf-8?B?MFRLSmtzZHNEQ0c5Rkh3cGlWQ0t5QjZ5NWRURmY3UlQyeXd0dmVWSENEc3RW?=
 =?utf-8?B?TEJqUm1UZnB6R1kyZmlCM0pYSllwMThyaHhuM1huQnpJRDFBdUhPSjZNQ0ZK?=
 =?utf-8?B?OVRsY0hjVDJVQit5bXQ5cHVqWkhkRWNqOTdZN0VkMXBhcnBnbFJ3VGN4VE96?=
 =?utf-8?B?TDJ4ay9QbjQyV3U3c0gySHlUY2hVeHQrTTBjcWlBdEJGdXlibDlpZzJoRjR5?=
 =?utf-8?B?WHY0U3FWUldzZXNVaUFZVjlCNnp4Ui83L2FaeTNOOENWZWF0Z1RXbkZISjJk?=
 =?utf-8?B?TndtcVJockZXamR6Z3F0QTUvUjhma1hPeVNWMDJaMVlvWUxMSnEvQWpSUVhl?=
 =?utf-8?B?dlpEdkwxYk1hczFrMFp0blNkQ3Rhc2NjN1NDekpDNi9rY1BBUWJncXgzazZo?=
 =?utf-8?B?MjkxTUwyYjhBYXVMTnV2cnFjLzVySzd4aXNSSkU4b1JvVVJpSnhibyt6aXEw?=
 =?utf-8?B?QitVNWp1cnN4dm0xL2hHamxmRWE4ajV5MnBpQkFlOXR4WnJUcWgrNmVRMUNP?=
 =?utf-8?B?V2hWUGNCbUIxNGhqdHpyVFY4Q3FscnVWMzRsUDlpVFFWa2Y5NlZ4UVMwdlBJ?=
 =?utf-8?B?VUFVbmI0WUF5c21RM0RDakR1NEFkTDdhWG9MNnQ4ZDhRRHpUZDFrS1AzTlNi?=
 =?utf-8?B?Q1BGNWtYbjNtUjZnb01QZUM3WkZ1cEwreTZLblkwcU9RVzgxOUkzOFovTkw0?=
 =?utf-8?B?ZFZPYTgwaENESkVaSlZIY0IvTGo4VzZYbkxrVE9JREgvUUpJbXJaVVJwbXR5?=
 =?utf-8?B?bkxoa2UyOU1JRlJRNExGRHBxWGVOM2FxV2E2ODVrWGFJbEtxazBGczQ3WlIx?=
 =?utf-8?B?MlBqRndXM1BaTXVFNmlLUjRyeUFCdVY4VWtlMk5SZnZUTkZGRlB0WkY1emRC?=
 =?utf-8?B?Vi9yeHhYTjZOWFQ3OHNLa0F3UEJsci9tYmExRHdKL3gvVGxNdmVXTHIyczBR?=
 =?utf-8?B?NDRLRWxENFBxVnA5V2pIMEkyVjgwZGhNSlBPMVJEL3hXYjZIejZwOXFqb2tK?=
 =?utf-8?B?MDhFQUcvK1JCVE84UFNON1NWblNmb2FQL1Z6ZHltckMwZWRrcm5tR1dzQVp1?=
 =?utf-8?B?NnpoL0FBVzZ3RWJOSGhaM1BEUm8rMDhhdEtnUU5LQnFkcjFGQ3oycXE4QUJl?=
 =?utf-8?B?ZnczUXBOSEJmc0Z2aW9rQ01FUlRqSGdaand3Y0ttbjd1K2xlTzMrdUhFczdJ?=
 =?utf-8?B?U3lheWxpTmM1TGFvYWhYMGpqQ1BOaFhpUGgzalhyL0xvWjI5Q3lhMFBnM3FK?=
 =?utf-8?B?c2JOaEtVUmlJMlBEUjllWjZNRUtoN05YWVAxVUNFWEk4L09uQTYvc1ZpWWU4?=
 =?utf-8?B?elpnSTM5bi9HMm9vWUQ2VGhTOEwyYkJjNi9seEVYQjhGb25mUWRETVJEc0Rx?=
 =?utf-8?B?RVRUNU0ySUxqbkZLdm5pUHZ6N0cvRW1hTTlTbkx1a00yUUhNb2hIY3drUTZn?=
 =?utf-8?B?eVpUY2JSRXhUTjVyMkJFYTRZTVBXWm9vdFp1QXhqME8rUHJZZXJsRm5KZWlX?=
 =?utf-8?B?MDRuMloyajhUZUlDcFJQZXhWQXl0M0k5QmhaSG9adHhUbCtQeHR6UGlFRUoy?=
 =?utf-8?B?RkNxcGcrdFBWdzNxSDVRdUpZdktZeXBUMWw3NnhzOGs4L3l2MEhDVG9YZG84?=
 =?utf-8?B?dXJBekVLRU1FWTZtMlhMTGpZTnAvdk9ZV3liWG5LcDR1azMrR0JVTHQrTVZB?=
 =?utf-8?B?NTRzUzFwU05ZMlloelR2UC9FbzhuRmhKQ2hYcXVpTFlVdjA1SzkxM0RwKzJY?=
 =?utf-8?B?ais5d1VEaENwM25vR3FFenhYMkRGWEovTHpxTlpZalp3QTlQNHc3Znd4ZWs4?=
 =?utf-8?B?Q3RCa1hzRmxlYkw0UzdnQTFtN2M0RXgrOWlTWkUvcUtQb3pNSXRVQUYvaklk?=
 =?utf-8?B?bEtXRlhPUGlCald3TThMa1JyaTBiak5ka1FVSk5vUFhpRWhzcVdoNzlUemNP?=
 =?utf-8?Q?ckiifxJYfELwLJT69Emlk6k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B42C41B968A27B49B4226D258C0E00D6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5280.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e394fa74-cea7-4f89-4d49-08db15656421
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 06:15:41.8528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEUBzZJ3Lfziwmp6i4o9n72rcKgNEMQvVI6GfGZZHqUyBycQqSV7ieHuhKE6OVBXGp6HUo1OLZxaKhiPIzcm64osgJ9y3VX0kwAruo2rK3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB5794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_221600_169302_70AC4BE3 
X-CRM114-Status: GOOD (  12.06  )
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

T24gVHVlLCAyMDIzLTAyLTIxIGF0IDA4OjMwICswMjAwLCBLYWxsZSBWYWxvIHdyb3RlOg0KPiBI
b3dhcmQgSHN1IDxob3dhcmQteWguaHN1QG1lZGlhdGVrLmNvbT4gd3JpdGVzOg0KPiANCj4gPiBJ
ZiBrZXJuZWwgZG8gbm90IGVuYWJsZSBDT05GSUdfSFdNT04sIGl0IG1heSBjYXVzZSB0aGVybWFs
DQo+ID4gaW5pdGlhbGl6YXRpb24gdG8gYmUgZG9uZSB3aXRoIHRlbXBlcmF0dXJlIHZhbHVlIDAg
YW5kIHRoZW4gY2FuIG5vdA0KPiA+IHRyYW5zbWl0LiBUaGlzIGNvbW1pdCBmaXhlcyBpdCBieSBz
ZXR0aW5nIHRyaWdnZXIvcmVzdG9yZQ0KPiA+IHRlbXBlcmF0dXJlDQo+ID4gYmVmb3JlIGNoZWNr
aW5nIENPTkZJR19IV01PTi4NCj4gPiANCj4gPiBGaXhlczogN2QxMmIzOCAoIndpZmk6IG10NzY6
IG10NzkxNTogY2FsbA0KPiA+IG10NzkxNV9tY3Vfc2V0X3RoZXJtYWxfdGhyb3R0bGluZygpIG9u
bHkgYWZ0ZXIgaW5pdF93b3JrIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBIb3dhcmQgSHN1IDxob3dh
cmQteWguaHN1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IFNob3VsZCB0aGlzIGdvIHRvIHY2LjM/DQo+
IA0KDQpJIHdpbGwgc2VuZCB0aGUgdjIgcGF0Y2ggdG8gZml4IHRoaXMgcGF0Y2guIFBsZWFzZSBo
ZWxwIHRvIHB1dCB2MiBwYXRjaA0KaW50byB0aGUgcXVldWUgb2YgdjYuMy4NCg==

