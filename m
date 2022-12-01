Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B11C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyHaAMHVQTkcdy6RTZkXnz3RZsJ0Eo+VX3AAICXP64I=; b=4JZAl01I9e1HAAgLY2Jle8faOr
	P1lCzvfCaGy6AWAQBdHf23fQgmp5kzQoIzyFhTeynSkehTigt4IhjkjjSCt7HRzDDXu8EPN20eaZE
	NcxMLQKaN4ot79PGuD1UAe/hqeyjdBhdQHn7klq6+qN7na6O3IYn/e/hkG3q4Ak8v5+OI83VeqvI8
	bJpFBAaHjhpd7y1GrRJWRfSHVnXEQO/vhLGR2EMvHAq+q2gv6CEF0o4x2SZHLyuZx3l0KUx8+WfLy
	k1fBjZCpem8pfYc6kOtNsT2VQc7jEdPpaHa6hyfxLqbGMoCt25JGalVdyADV0uV0TR9U4/Jxgx3z/
	mNcEayRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gUl-006aOc-6Z; Thu, 01 Dec 2022 10:08:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gUZ-006aJ5-26; Thu, 01 Dec 2022 10:08:32 +0000
X-UUID: 584a38c5edf54792be76256cba633e9d-20221201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zyHaAMHVQTkcdy6RTZkXnz3RZsJ0Eo+VX3AAICXP64I=;
	b=VXu0GTZZveGgNeYkAwbxb8bW/aFwrsVkPlyDMwZ1yzUhx1kHZgfwS/szrrQPvOjR1QZkBuu9dyfG+O/MPYFgKmKpetBl3agsGrNwoFfVbYlRH80EryLl0V8wnS5wzkQOMYmrEEFLmAuRtusf78n7yJfD3VLtSy4pdRS18NgRA44=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:5ae1cce0-a5fd-454a-a206-b855ec5510ee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:3128446c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 584a38c5edf54792be76256cba633e9d-20221201
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <henry.yen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 949203995; Thu, 01 Dec 2022 03:08:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 1 Dec 2022 18:07:52 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 18:07:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnQJQ/MnGhKg17+lv4lPglxjnB+735NoEjzrZKzYOBZz85ure0XkXPYzH7lavIV7R4YkuAXnwAodyZ3XeEU5QB5rUtw94LMDFXZTiNpdkN36OYgWv3ZmUmq6hm6LRxT4x93RdgEBrcmoMDt8C08FeHZxG6ob+WIIqv0waPw6SBKWmRPeF9/riAMxwh2kc8UiC525oMRIRJiMMINaKjITbe6ML+3diIYgOA3MwOuRbP/v5u3slNHYKH6cGm3wHso2YMDrqKdEjkxEugvIiruGDLLY4vN8dnvI0TPgPV9zcO4ZLkd/4eQRL4z7TPzDXIX2auMfD84LZS3b+cgbUfXmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyHaAMHVQTkcdy6RTZkXnz3RZsJ0Eo+VX3AAICXP64I=;
 b=P3ZMDtqOOjibfQFMjziNe9IxExbZC3U+ZH73otB+aPOB0sdz8JWwbsorBnZxdxORpw+5dRXrcpAceVTNBLaaoCvvTcstQ/tkNzho716tIpDVrp3kgWLBk5gwGrfjtC/SCgyT+J3GSfTVh1dqY55iUFSsVIZzmQjhTSHjPdAsbyKs0njzKoeuHqHRgTojw/sbfTc0gUWTnVHLp0AjdTp5pE6JGlWLyqHvucdI5tBlth1brqNMf2JY8oMU1LquTVG5d8Y+Gpi4+AcFe9RJ51geXxSX8JIDY2lDtZoTD4oLwM99vTQ0cAy8OFbvw21koCjAtZQAT/qNJ1IaWvHGltoTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyHaAMHVQTkcdy6RTZkXnz3RZsJ0Eo+VX3AAICXP64I=;
 b=WW+d0ktRqLUhRGAjbAqTTM4SvXfPUfPbLJ0E5OYrdC5cuqIGaKl74sZN+0kK/RHecZDaMviiRw4JqH3izxiY+Z6z1R7YDOyoPtG6IqjUGx6lpIQD837//066ziJKOiMXzPAxkZ1jjYcM1O0T4QhmD0TeplhpOJxtq7rtPh4kf/Y=
Received: from SI2PR03MB5723.apcprd03.prod.outlook.com (2603:1096:4:151::10)
 by SEYPR03MB6482.apcprd03.prod.outlook.com (2603:1096:101:52::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 10:07:50 +0000
Received: from SI2PR03MB5723.apcprd03.prod.outlook.com
 ([fe80::51a8:a88:b4f7:c4c7]) by SI2PR03MB5723.apcprd03.prod.outlook.com
 ([fe80::51a8:a88:b4f7:c4c7%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 10:07:50 +0000
From: =?utf-8?B?SGVucnkgWWVuICjpoY/kv67muqsp?= <Henry.Yen@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "rui.zhang@intel.com"
	<rui.zhang@intel.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "amitk@kernel.org"
	<amitk@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "daniel@makrotopia.org"
	<daniel@makrotopia.org>
CC: =?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	=?utf-8?B?SGVucnkgWWVuICjpoY/kv67muqsp?= <Henry.Yen@mediatek.com>
Subject: Re: [PATCH v2 1/2] thermal: mediatek: add support for MT7986 and
 MT7981
Thread-Topic: [PATCH v2 1/2] thermal: mediatek: add support for MT7986 and
 MT7981
Thread-Index: AQHZBL6KasPYnH0h+U6nQ1RhyFZEYK5Y0AiA
Date: Thu, 1 Dec 2022 10:07:50 +0000
Message-ID: <5240196f01f4b2c053331ac475a571b580a988c2.camel@mediatek.com>
References: <Y4dYazyXF02eRGC5@makrotopia.org>
In-Reply-To: <Y4dYazyXF02eRGC5@makrotopia.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5723:EE_|SEYPR03MB6482:EE_
x-ms-office365-filtering-correlation-id: 78292c50-f900-4515-e9fa-08dad383e76b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2x+IPpa5VOgqNyspAVpOvq3I5OdTyJEcXRlCDvaVTG05csyN3UqkaUKvPASwQBIsevsseFqr8q7Kv5jyB8lAbWyPDA3z5liO41mrgaeZ7t+W8C5GgsO/6cau5acCZOp4KVpYeTWhg6sksUvRh02mXGSDW1q6IOQc+lHHWedZZUSJ8PbRFx+2ygtwqcJ3hlmR/Tw7BAZ6XQMvTBnMJHbgzphpVeY8owbbP717cyjsBXsxOitb64+KynvQ0CYZ2uJoLNcBXM3gQHsAolpbud1JQLIMUEHOBCOxV8FhQo8SaXTBvRG7ykOYzQHiGMYDIK5R2o6DG3YC7B6ybrkSdQJhATsIzyKWineCgph+PoosGhBtY31lFnrIRZ9B2kMtoe20Zw++TGvn/xbAW5a07fSlG7cfmoq1DZ77w8rasnAHzXvVPX8+mtHMIO5mqcKln/OH5AHG6IJ3xBndNV0GQqgVyau6X/y3FL5ZHub7J0PzoS+EzZn+AcFAk40LgqC/g5j+nhVRuRuCPPeUKTAvOc3uYzFdn7bZO9QX+oWevHwn1E9P+SbBwl32eHqnAGmD+hH4j7NduI63JkOMYpaP2Z6ek9ybOeOnqAE6EvyFgkSXE/eGBf0rjhIiRIo2bEXISSriPBhhs3pP7FQ2W+BPkYD0wFgpObkLzJCjGYjmlIVGxnzjGy2mPI8cz1PFrFylr7Lafy4dl4Hv/qcIdr55f5DuT+KC7QKpi5ly1S1nBRpbuQ+O8+Xxk6HDzWD5USUqUu0V
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5723.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199015)(54906003)(966005)(6486002)(186003)(41300700001)(478600001)(38070700005)(2616005)(7416002)(4744005)(38100700002)(6506007)(6512007)(110136005)(26005)(107886003)(316002)(71200400001)(122000001)(86362001)(66446008)(76116006)(66556008)(66476007)(64756008)(8676002)(4326008)(8936002)(66946007)(85182001)(5660300002)(36756003)(921005)(4001150100001)(2906002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVZrUkhuT2xtQWxPT2FmMnJTdzZxMEF2ajVNV2hQMWVZTC9BVWI5b2ZTOUZD?=
 =?utf-8?B?ZUdMd3lLaXNJQ0NBWDNjU0ZRNnZsMjQ4ZWtkZ1ZSUEZGK1RBNU1URmtrQ1F5?=
 =?utf-8?B?dERUZ1lMRE43ak93dzJjVjBvTGNtUzZJUzczK25mWHBPanBIUFRQZHprM1lZ?=
 =?utf-8?B?UkZjd1hsdXJxWXIyU21yeUc4MFBPSG1JWjFnM1VsYnJuNFcrVDN4TUt0cG04?=
 =?utf-8?B?MjRIdmVKak5iOU0yVjRIWUZYZitkWFJiVEhURzFUS2U5RWxERGFQWGphblpi?=
 =?utf-8?B?MTBkMUFkSlpUVlBwYlhQMXNPM1BTWjRRWkpVeTVqbWYxS05oMS9FMkJwR2hZ?=
 =?utf-8?B?NzV0SWlRVWRWTTBLLys2WjZXS1VEMzFFdVlGM0dlNm5NOHh5SHhUYXo2eTkx?=
 =?utf-8?B?TXVwM2d5b1NaT0xyQU5jalVYdXMvZEtzQThjdyt3ekNxOE5QWC94SVJsNGdq?=
 =?utf-8?B?bjk4dHpRNDJXYVVYUVpEYm9qdCtLazQ5SU1KeEw3ZWxKSEpyUHNCZlJUYkpl?=
 =?utf-8?B?VjcvYnJJd0V3cU43RU5nbmN5VzJUQ3Z0eXFiSDB3bGV1Tk5TVi8xbXBtM2hx?=
 =?utf-8?B?eW8wWFRvb2FKS0xrSUgwdFcvTHFVbWFweWlrRmY4bmV3UEVnbWV4YjUrU0lk?=
 =?utf-8?B?VmQ0aExVeVI1RGtkZGtSaGZrbEFueGNoQjh0SXBCV3ZHQjBpenAya1lFdmZ1?=
 =?utf-8?B?UnRHN3RKVzNwQzdMalNmeU9mYzY5N2puRk9nWTk3b3ZMek1tbHVVbmFoMU4z?=
 =?utf-8?B?M0k1bmVCQ2JOYW1XdEZ6QlVhWGV5dlBWTEFKbktORWw0WXMzL0VBOXcrRXQ5?=
 =?utf-8?B?NHNxWERkLytoMHJxY2ZOUzZOV1Z0S3Foa2x3N2o5bGt4SmVnejh6VUJFVUJ0?=
 =?utf-8?B?QWxEbEIwTUUyenE4aGZBdjR2S0pJZmtLbnFBaTcrbk5Rbm44YXhJaWZ3Q2wy?=
 =?utf-8?B?ZGUxL3ZZK0VWSzZMMmdEYlJVcVlmVTkzUzZKaFlqeEhpS2RyL0JsKzlDdndG?=
 =?utf-8?B?QkVEWjk1Q2RIVUQ1WE1KYnN3NEl3WnlHK0ZLL2xZU3lpRUZWS0hNbk5XTkJB?=
 =?utf-8?B?aGhNOFlPclU0UXh5YVBvb3BPREpjVEJydmNTTWFxQ0h1bHdYbkZwQTdzaEdB?=
 =?utf-8?B?L2hHbHhBMDRJQ0xDRmdFdVdrT2M2M1JzL2dmalZuL1h6UHdJbTJ5SHQ5VjNs?=
 =?utf-8?B?TnA4TVBhajdWOHZGWU9lNi9YQk5UYUtxK1JkNUlQZkF6YjhPZUd0ZTRBQTVi?=
 =?utf-8?B?NmduNkZDQzBQSGpxTFp6bzZ3cVVsUC9uS3hWYTZCT2dPSm9ORCtQSElMendi?=
 =?utf-8?B?MzNjQ1A3ODFhbGlXS3BSUjBpeFkzaXpNekdHM3dYRGxCM3F0MnpsU2NDbTFp?=
 =?utf-8?B?cmppRUtlU1gyVWRiUFFHb2RSU0YrUThYTUVPMEU0NFpSRzVqT0NjNFBzb0Nz?=
 =?utf-8?B?YytJS09qK2VrbFduSnBNWVovQ3ZjNFFoK2wycGRNRCtlVE1GRlFndDZmUXZS?=
 =?utf-8?B?L0lGRXBzS1c5TG9KSGtaaDJjVFNlVEtZOFd6a1NLSnJqaGVGNVBHWFFKVVpH?=
 =?utf-8?B?RlNSeHFWaS9WTE1vQkFqbHA1bnVRamNVMjBuem5oMDBnZjcycnJrK0VmYmF3?=
 =?utf-8?B?V2NQNTVyZk5jQVBhczQ2Z1dNS1NjSlE5RURFeVBpM3ptdlVpdnFTVVV6M0ZV?=
 =?utf-8?B?WFJJbE93Q2tGZkhKYVA1V0RWNFUvUVplQU93UEFPSXpnd3N3bFQvWTE0RExF?=
 =?utf-8?B?eWpqWXo2bzYrcEsvS2FpaUVrR2tMV2ZQcTJvV3NZTGxTOUc4S2xNV2VZK0JH?=
 =?utf-8?B?MTFGN2ZWVjJJNVRTOENIeVRMK1YxYlhlYVJJa0JHUHdXSkRKRHhidm1ZWFJZ?=
 =?utf-8?B?SDBhTU95ODJRL2NWZ3F6Tm9mbkw2N3Y3YXZ4ckF5bGc3NlI0bi93eEdQSWdL?=
 =?utf-8?B?NCtIdTI1c1ZHV2N2UGdySEcrMVFyeEJsYm5ucTk2Q0JFSVRTbkw5bjgxWUlP?=
 =?utf-8?B?VGR5R2p3UUJSWEVaYU9XTU5KUzVIS1lsODMzT2pGS3dVS0VKNk9odnpXQUNl?=
 =?utf-8?B?TEM1VHJKQkdkei9UdTZTOHVUSjl1d2lhNTBySU9XSzVxanFvcU44Sk03bWYz?=
 =?utf-8?B?ajhWYnk4SmkwZ1NZTWZoQi9Ld0FtM3IwOGhFVFBzemx5eExkdFEwRUo4bm1F?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1A3480423D08F49A3D06AC0DDEAC6C7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5723.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78292c50-f900-4515-e9fa-08dad383e76b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 10:07:50.2663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8+XcHpwyk+EPPGqNxhIxQD5/3I8mmSY0K+x4WbzBqUvfIpiNLSQLfkZ9VMdUxjZFs0GpElG10881ARV9/wr4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6482
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_020831_357669_9970AAAE 
X-CRM114-Status: GOOD (  10.38  )
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

T24gV2VkLCAyMDIyLTExLTMwIGF0IDEzOjE5ICswMDAwLCBEYW5pZWwgR29sbGUgd3JvdGU6DQo+
IEFkZCBzdXBwb3J0IGZvciBWMyBnZW5lcmF0aW9uIHRoZXJtYWwgZm91bmQgaW4gTVQ3OTg2IGFu
ZCBNVDc5ODENCj4gU29Dcy4NCj4gQnJpbmdzIGNvZGUgdG8gYXNzaWduIHZhbHVlcyBmcm9tIGVm
dXNlIGFzIHdlbGwgYXMgbmV3IGZ1bmN0aW9uIHRvDQo+IGNvbnZlcnQgcmF3IHRlbXBlcmF0dXJl
IHRvIG1pbGxpZGVncmVlIGNlbHNpdXMsIGFzIGZvdW5kIGluDQo+IE1lZGlhVGVrJ3MNCj4gU0RL
IHNvdXJjZXMgKGJ1dCBjbGVhbmVkIHVwIGFuZCBkZS1kdXBsaWNhdGVkKQ0KPiANCj4gWzFdOiAN
Cj4gaHR0cHM6Ly9naXQwMS5tZWRpYXRlay5jb20vcGx1Z2lucy9naXRpbGVzL29wZW53cnQvZmVl
ZHMvbXRrLW9wZW53cnQtZmVlZHMvKy9iYWYzNmM3ZWVmNDc3YWFlMWY4ZjI2NTNiNmMyOWUyY2Fm
NDg0NzViDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBHb2xsZSA8ZGFuaWVsQG1ha3JvdG9waWEu
b3JnPg0KDQpSZXZpZXdlZC1ieTogSGVucnkgWWVuIDxoZW5yeS55ZW5AbWVkaWF0ZWsuY29tPg0K
DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOiBEcm9wIHVzZSBvZiBhZGNfb2UgZmllbGQgaW4g
ZWZ1c2UsIEhlbnJ5IFllbg0KPiBjb25maXJtZWQNCj4gaXRzIHVzZSBoYXMgYmVlbiBkcm9wcGVk
IGludGVudGlvbmFsbHkgaW4gTVRLIFNESyBhcyB3ZWxsLg0KPiANCj4gIGRyaXZlcnMvdGhlcm1h
bC9tdGtfdGhlcm1hbC5jIHwgMTIyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0NCg==

