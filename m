Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D98C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0VH7eSzS0DKnM3OQPaMHFVdgW9CYKamXg6DgWCSiT7k=; b=CAswYNf/3/IAgVIP24QNVzGVAE
	wEy0n5nRy8kmbPlQoWq4V2UdTwLE+LdWezcb8hrdPlLfVBaaFlh6OGo8WI+cz/UKzYc9KCMfPY7mu
	QdUqh+/aOz2272Tm26buz7LxP3vTDcv9rXETb63xQ1Px6mBt/XS3uvj9FBznYVuZ09kojkSTZVges
	3cngI1ym62ZYkWtWlTaD4iAJuQEey8AyuTi5a7jbCMejxd4gATJzXHzU5HyfuuHrpQXXKOoV/mwc/
	4u0E1amSZ2IHWyTDiF8hB9pgb7BHuzrHIAPruho2ESV1sEIsHmA4Wtuqnv1SMSOQ9etQo4+gAZroj
	zhfXumuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4eDL-002fL8-0u;
	Thu, 01 Jun 2023 09:03:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4eDJ-002fK9-1c
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jun 2023 09:03:22 +0000
X-UUID: 2640e5a4005b11ee912e1518a6540028-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=0VH7eSzS0DKnM3OQPaMHFVdgW9CYKamXg6DgWCSiT7k=;
	b=NnFUXVa8jOl+WgZBrkO3kW3YP+l05czKlxspkKaJZZD7pve2mRzps4EzB2czcRLM22GGC9OESwBBElyn+Gfpp60ki5j6VP4/ADe4g/feg8vWF+VvBAcISoM83eIZKAR1pSxQUrB48G5zm97NkvaMa824aU1v6UQTH4HeZegYgYc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:2efd5fa3-416c-410b-b301-dcce96b12429,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:10,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:30
X-CID-META: VersionHash:d5b0ae3,CLOUDID:36b73f3d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 2640e5a4005b11ee912e1518a6540028-20230601
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1238483975; Thu, 01 Jun 2023 02:03:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 16:43:15 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 16:43:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAPiUKmQdcLCS5UldZSsaNEEVl+w48W+fmEXDUhHDv2P8EgfuFYX9/KMDaTM8ey9ZiVspmsdXKqhECDDpNOxZnjVJ32y9meqaLwcJe9daov061yj3n6Z6lerPlL229fHPH8xWe5Ls34jVczku7qPWzQ8XPsOmtPhi+zXvHhnwSTrls6qm1TWrQlTGAL6evEG30DELxQloitZVIrHiP1WMqg25VPp0SoO/J11ouScazb8g5sBArw2svsTIeKSXqRzZvtUkHX2Gx70pLqtMcS2CBw3zRVuYu5ZeepIqJJfWdIakSz7Uyar9PhpiVmz1TzXbeD94x3AAcjltslejPlW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VH7eSzS0DKnM3OQPaMHFVdgW9CYKamXg6DgWCSiT7k=;
 b=iG5Ri7i7fHVATF+CJWXsKtyVq+UmZzA2VCPAiVXWCtu5XgaibcQN4PP1cSfW7voyHExrjF1MMsBD3YV2r0JqU6V9hkrhMUyFOXebQu4tCmwaXmUZ1z/fzE7h/DAENtR/xj3zroU0oqErJeRXwpV9kG85IvbWONFIiTD+Ra1tU+nK7F8VRYy+QQJqAbPUmZhhMVxHOgPaiyWOuA8FYvCUHkTBFZWk08L233qQpSwtgeI4uLtRyDacGQxe8P17Lz/JbAVcl8zRAnok/oIM7Rty5fTbDOfGmpCq9lf+emakRSSlY82nLuQ0So9fdpIJoxgcSRYN7HKITeXbN8cS8xytKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VH7eSzS0DKnM3OQPaMHFVdgW9CYKamXg6DgWCSiT7k=;
 b=hzm5gkxlBQfhNPKwJ2/oHe04CN8E/+UORnLKWS/sZ/9/Nt8ubAXIqqpnCtM6w5e8kaURQ/z1fT3ymbZBUMw/t3qmQkGqDg7Rew5/immcpS/Z97DPRTWY/q61eOllwLKa8mcsgcrCuqEw+t/XdG1Es3fxm1wNr3fCCkbWNEJtO6I=
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com (2603:1096:100:4e::10)
 by TYZPR03MB7002.apcprd03.prod.outlook.com (2603:1096:400:268::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 08:43:12 +0000
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::8fce:558a:2511:c41b]) by SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::8fce:558a:2511:c41b%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 08:43:12 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: [PATCH v2] pull request: Update mt8195 SCP firmware to support hevc
Thread-Topic: [PATCH v2] pull request: Update mt8195 SCP firmware to support
 hevc
Thread-Index: AQHZlGUZ5HIiAf5iVEeTWYmtYrePfQ==
Date: Thu, 1 Jun 2023 08:43:12 +0000
Message-ID: <39201cca692b6fad77749bdc56d551c3aab9bc64.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4153:EE_|TYZPR03MB7002:EE_
x-ms-office365-filtering-correlation-id: 7c4b0f05-5035-4499-448c-08db627c3bb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3RZeCojtqScbFnhAnb7m+34MuYGg3tziHSXwvBSbdmM9y0SeEH5ZQpF/JZJOO1hyM6YEbSFYosDzuvbpQ7NolYSlSWLgFuGEPgIhDckqo7SDHVabCbh58y00x4qaAtRlsOCNm0cJ32OZfuljxGllNzhT/4LyWSpiUwTdoZl6ThD84YCaPE4etBbWV7zrENjCxJwPdlTbnRGOp5JBEwaEGvJ9Y0HOWJXdDaoKhDSH4YTKA35ii3bxqLXD9FLU5oZNKzpXm54ExAHmudBzXaL8NQPIDQDdBlgOCXPneQdJt/0U197rWU0Jlb5jx9ulN4sL3Js+E4aE2HY7QDak0lhToMBvSpwmobVnzfZ0/JelCnIpOCcZhfAQeu4NeUqX737tNjmpicpJ061HlahEtxxju3bxTqdW/s7zjKGBCNZaWNZtS0ZpJtKKE0VqfvvIEGMIh0JK6SBkTjZVIKO3TH3LotEg9KRpHf2IXwbeh9aiVicVV+oqrqfuxth6Y4F//I7JQhH6DWvUUepl8L+obT5tqH/gmWeFt9yIQxV6NBZfWpVijsfg/yBEYf3PagSvwNKyeZikMbk4bhLyiYI7vytP6z6/7sSmX9pxTKV8trwzlz70htYdkr1sDZ3kaZxmrCP9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4153.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199021)(4744005)(2616005)(2906002)(83380400001)(186003)(38070700005)(85182001)(38100700002)(122000001)(36756003)(8676002)(8936002)(966005)(478600001)(4326008)(66446008)(66946007)(5660300002)(86362001)(66556008)(6916009)(66476007)(91956017)(64756008)(76116006)(6486002)(41300700001)(26005)(316002)(6506007)(6512007)(15650500001)(71200400001)(107886003)(54906003)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnYyZDQzN2dDWXFXOWhjbGo2ZGxlRkUwR1UvcUh4NXJQT2dhc3NtRTZidnFj?=
 =?utf-8?B?aXNmZ0ZmR05VMGdQcHYxZW5OWXQ1cGIwMU1qeHNyZFNyU1JJT1FnK1JnbXBr?=
 =?utf-8?B?ZVVDMXJqRU1VWC9MZFJJRTkrSmlWK1hUOE1KNm1RaXpWU2VFQ01weUVJV2ov?=
 =?utf-8?B?RkZReWRwV1hCeFVxNFRzU1lZT1NaWVZ3Z0VGU0VrVE82Q3RES3E3cG5GK1Jw?=
 =?utf-8?B?d2RDbGdHOG8vb2ZaUTh0dHdneUI3aFc3ZXlUVHpGa3pzWFNsTWJISWhhaWRT?=
 =?utf-8?B?UmpTVStDcjhHRWE0SVgrVy90TVp6eHd1bmY4VWl2UWJLdW9RRmNsUVZTM202?=
 =?utf-8?B?dnpvckF0M2Y4VG1VWHVXZWxzWmhmVnhYVTVVdTAzc1YxK0QvN3J2RHBKbnZz?=
 =?utf-8?B?bVYwa2ViZndmTXUzWllwK1BhZThPekM5MzI0bGR6SENsYkRFd0llOTZxcUJu?=
 =?utf-8?B?NTRiVktCa1ZHYWlUdEo4V2NrVDRrZC80UktGUytnWnpwbHBtbHRPWndpSGJ3?=
 =?utf-8?B?YmdDamoyaWVUancrQWtabWFmZ08zMnMxSWoyRWpDZXl2bDhveWtvWWt0VDht?=
 =?utf-8?B?K3FYV0pabS9TZ2lKV0pGVzBoTE11RGdZVHBKOTRaWUxRRk45aHBTL3NsNGVB?=
 =?utf-8?B?dktsZWJPOVRucy9EY3pVdXJPV3dkcUlqVVZ0eHpCcFRiUmg5TFZldjdNMTh3?=
 =?utf-8?B?WHFEL0VHNXBvUkJXck5XZGlSVEIxU2pQeVRteGYvU3NWenN4Z21tMXF1alBW?=
 =?utf-8?B?a2M4NHB5a2ZTV01FVTlqd0JPbjdsV2prSzZoS2RveGFhekN3SzV0ZXJMTXNL?=
 =?utf-8?B?TWJJck1vZklnNnRaSllmeU4wK3RsOUVaVVJQanRQN0c0ek1tak5TNUFtRER5?=
 =?utf-8?B?V1F4d0l4Vkg4anpyQlBoei9XR2Z6bVlzNHBacFZTbFJlems4blJXN3R6S0JS?=
 =?utf-8?B?ODZadHFOaW1rM2Y1NnU0c2pUdlF4T1MrZDNuMXNwa3M0R1dxb2UzWWZTcW5o?=
 =?utf-8?B?Q1hBWmY4bDIrdmNYMDlhNTloaE9DSGQ1aVlyeGlrQkFzdzRVeDNJRS9QcUdu?=
 =?utf-8?B?R0F0enNIL0QyYTBZY0J4Vjl4aTFwK0tpZTkxeU53VWFFUjBPK2o4UUhnNzJw?=
 =?utf-8?B?RTdvMGVYRmU2b2htTkkyZm9RU1hpeDJvQ1ZySFJzTU5IbGg1MXM1cnRVQmZY?=
 =?utf-8?B?S3JyUzR0cDVWWWRvVExjTk5rTDlZZjVFa01KeVFRWWtxUEpWbmlxdTllRXZj?=
 =?utf-8?B?alNndkp6N0F2dko4TEZCdkdKL1JqUzFkeFNaM3VhaXhUbVB3dnAwV3FqMVM5?=
 =?utf-8?B?THRnbXBnVjJndkd3YjRsQXZuNENUd0xFZFBHbFJBSGh0dUVwdnE5a0YvNldB?=
 =?utf-8?B?aHJhMm5aNEE1ZHNrNk90US9mN1A0YmNEMlM5TXVMdHFFRCtlUGdaQUxxQVQ2?=
 =?utf-8?B?SVRsblZCdWlGZ2wxeThTSDBsY0FRV1NwaVpPckUyaVRYTkZVNTd6cENmMXla?=
 =?utf-8?B?S25KekZPQ3NFYStNZkYvR0ZEQytsRWd4QktjQzNOMi9Nak1WejZURTU5Qkxt?=
 =?utf-8?B?dlpmZWlkd3FoSmd2bGM0SEoyeU9DTHVENDRSNGJrakhQUEUwK0txQkFvS05z?=
 =?utf-8?B?RjliVHNHak05M0VkZFBPNGpXWlNRTnlDbXlKOGpJVk9jaUtnMWpQTnVRWm9N?=
 =?utf-8?B?NEJia0pKek13SlRUeFhDbWtUajFSeXh4djJSemVZOHJVMmdJMm5taVNkRFJD?=
 =?utf-8?B?ckIzUlJ0d2pwMG9PZVlaS1Y2bjVwYnQvNDlXdHJ5TDh2V2Z6QjlSdmREaHhK?=
 =?utf-8?B?R0pjeUd1REFESnc5aXBqYTVzNFpwQjRQMzMxbkhwRUdTSGYwdEU3citGOVFV?=
 =?utf-8?B?THBJVmZGY2FDYmNaYU5QeWZvSyticW42Z3NzQk56NnExdzVDV0QyYnpOR1NO?=
 =?utf-8?B?Q2c5QnUrTFlXOHo5RldVUExkQ0w3WVVnakR4SGNCVC9scEJxNFpCVUZaYmwy?=
 =?utf-8?B?VEx5TllzQkM1TkJwT0g4ME1hMHBNSXJhb0E5K09FR3Vab1YzdW9tcUI0cmhl?=
 =?utf-8?B?Mm10WFZuVmJ2V1B2WFZERFdyaEFyWlVFMUhueWYvekxZMjkxUmF3RGxoQUNS?=
 =?utf-8?B?UjBxWmd2LzYvWFZWM1h4OXhRU1ViRFFGeVE5S1hka25KRmlIZGhQZGZ3R25U?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D38B2B9371966344B5A56327F0E1E9CD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4153.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4b0f05-5035-4499-448c-08db627c3bb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 08:43:12.0211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTmHWlSG7ufltbupQ+btZV+HNVijoYIOd6yh59ywNP8lc1E29mpiRIzcjmZtyPdc5NlFAMWKbdcd5eq2cgl04zb4BAqXtIg9lpz9/eIPW2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7002
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_020321_549990_A01B5A89 
X-CRM114-Status: UNSURE (   8.02  )
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

SGksDQoNClRoaXMgaXMgdXNlZCB0byBhZGp1c3QgaGV2YyBoYXJkd2FyZSBkZWNvZGVyLg0KDQpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMgYW55IGlzc3VlLCB0aGFuayB5b3UuDQoNCi0t
LQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQoxZjk2NjdlYmQ4ZTZhYWMy
M2JhYjhlOTViMGQ1NTUxODFkZDQzMmJhOg0KDQogIE1lcmdlIGJyYW5jaCAnZm9yLXVwc3RyZWFt
JyBvZiANCmh0dHA6Ly9naXQuY2hlbHNpby5uZXQvcHViL2dpdC9saW51eC1maXJtd2FyZSAoMjAy
My0wNS0zMCAwNzo0NjoyMA0KLTA0MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS95dW5mZWktbXRrL2xpbnV4X2Z3X3Nj
cCB2Mi4wLjIxNDc4DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KYTg4OWMzZDI4
YjIxMjk1ZWMzM2YyYzQyZGQzYjk3NjcyMGNjN2UzZjoNCg0KICBtZWRpYXRlazogVXBkYXRlIG10
ODE5NSBTQ1AgZmlybXdhcmUgdG8gc3VwcG9ydCBoZXZjICgyMDIzLTA2LTAxDQoxNjoyNzoyMCAr
MDgwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KWXVuZmVpIERvbmcgKDEpOg0KICAgICAgbWVkaWF0ZWs6IFVwZGF0
ZSBtdDgxOTUgU0NQIGZpcm13YXJlIHRvIHN1cHBvcnQgaGV2Yw0KDQogV0hFTkNFICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0NCiBtZWRpYXRlay9tdDgxOTUvc2NwLmltZyB8IEJpbiA1ODc4Mjgg
LT4gNjM5NzAwIGJ5dGVzDQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KDQotLS0NCkJlc3QgUmVnYXJkcywNCll1bmZlaSBEb25nDQo=

