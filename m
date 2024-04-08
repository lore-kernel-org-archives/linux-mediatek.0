Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BEDCD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 05:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzWe7t8nWUUbcsHQMyAKdec8tKIUhO/q7iM2sPx03ns=; b=26jZSTF9NMziIKyy9oeZax/xLx
	nkCs9ZlzkvLPG8PX4hG5TQuISDhMv0ud2OWW3UTlCETEysEQcjWP9EqQo+hMcwRUzAfUdC1jN4k3C
	0ccAkZ9/lMNoUZ+g9HlFJ1giDUln5drP71zynF7Q5qniVGuPO42XjJs6CLzbXTLwJqQvzgd37I7c5
	6ooCMces0akkyrEWu9HT3YmjqDcq/F1LRXp/SxDNDNm2Z7QiHb/TGf4QQkiO9sOcjYSElc8GrOC6t
	iHSfQI+VFXY1jj574Y4e7G8g6E7+vh7+nuD5uEbu4yz6QJozjPPt8ZCWn2JJLYUSLa0+oFz5iYgyP
	0TkXEV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rti11-0000000ERuZ-0eps;
	Mon, 08 Apr 2024 05:57:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rti0w-0000000ERrI-1wN4
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 05:57:56 +0000
X-UUID: ecdac084f56c11eeac1957ae9f99f617-20240407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=bzWe7t8nWUUbcsHQMyAKdec8tKIUhO/q7iM2sPx03ns=;
	b=cIfQv+cidMBlaq2qHK4zn9SYLxWfEHGY9+ljGhuzzllUXapBYhUfTZaTG/AZr96Uea9T4QhWXvl7JkoY3YiWBss+m3u2K/piSluE7NoIKg3eNfQRHRrYC+YjAYleteBDBGAEVxASUYg+C1aJaQLfmcwxM/igckBfrcpmPqpjIvY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:70b807d6-c573-41a8-bb9f-e6a1699d4a89,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:07194f91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ecdac084f56c11eeac1957ae9f99f617-20240407
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 608268332; Sun, 07 Apr 2024 22:57:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 Apr 2024 13:57:45 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 Apr 2024 13:57:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4vzSiKepdOG2/xhdtWrPfPTyrj6UE/LJVJ8XO3/IKSPPUJLHe9k/Eb2bNhVcY2winCQccgOMzUJkD7wITrCB5a3H7EniNcjbKjCgOprxBs8ZJLG9VPr14l2ebbXKP5yP1FNP+DJ6hHzWv6Kfojlg9qv5yYK838k7vjulnqLG6oyTJi5q84dA8BQIQeMq3y/gTmQYRM5XYcJhL8Bdu7JcPXGxjZhSLkrByjFwWKQoKS8h5Fdn/gtCsHWnRxwu05XaW5EjSBdtO8v2P0iVS4odN2P1tnYYMGJcNHG1BaAw2c4Dw9aoir6SOQtAWMEpKiWISm0oWqclt8DejZ7g+XXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzWe7t8nWUUbcsHQMyAKdec8tKIUhO/q7iM2sPx03ns=;
 b=dSCQmRUGmkDRWGVMHafbl74zlZvpWCZyLGJ93RU7AqZmM4uPalLd+2NgD+2Oa3qwdA+0Q7Ouuk7aROsH8HC2UUjtXeNa0xbTw03A4lY8dK6IjYLRwbljm/SAe0PdqWxFlZnDjlyUfEI2QxsOXJqn3BQPCLLYCnaeON4Cc9YE3daNRxizCyLSNMWk8i5P1nvuWmRCmS5W8umBjJQEaVrqoJT6CpSXbDW8Wp+0vOmA3rzc5NZpAxFqjhgbO8XGyj4OYYG4eqHCPDR6H/Yl39CTcUO71HvsQUACkE23rbkE1cA7MK/60YMMAOZgUDeIb4RwupZQG0QMo3RIvUxPnx/GeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzWe7t8nWUUbcsHQMyAKdec8tKIUhO/q7iM2sPx03ns=;
 b=YWkxeXTeyrydne5koZhLZTQjYMsWOglZ5Sn9QoT+1Mdm9TsyRbfUIdIsQ8kKW9JiDCF4G51Cwd8+18qyhbhgoVY2IQs7pvibsUummQaERC2GqAffWVIICaahjXcOkwFJdc2yAvhfisMK4jSYOowfGRFFin7gaU1SV9WjMvkgfoM=
Received: from SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9)
 by SEZPR03MB7356.apcprd03.prod.outlook.com (2603:1096:101:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 05:57:43 +0000
Received: from SEZPR03MB6468.apcprd03.prod.outlook.com
 ([fe80::21b8:5774:e736:3a26]) by SEZPR03MB6468.apcprd03.prod.outlook.com
 ([fe80::21b8:5774:e736:3a26%7]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 05:57:43 +0000
From: =?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>
To: "nbd@nbd.name" <nbd@nbd.name>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Qm8gSmlhbyAo54Sm5rOiKQ==?= <Bo.Jiao@mediatek.com>,
	=?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
	"lorenzo@kernel.org" <lorenzo@kernel.org>, Ryder Lee
	<Ryder.Lee@mediatek.com>, =?utf-8?B?SGVucnkgWWVuICjpoY/kv67muqsp?=
	<Henry.Yen@mediatek.com>
Subject: Re: [PATCH 10/10] wifi: mt76: mt7996: add sanity check for NAPI
 schedule
Thread-Topic: [PATCH 10/10] wifi: mt76: mt7996: add sanity check for NAPI
 schedule
Thread-Index: AQHaercvxMSmnOyvs02XJMi6hhhMAbFWdfGAgAeH9wA=
Date: Mon, 8 Apr 2024 05:57:42 +0000
Message-ID: <93e25a8325d33a30d9ef288bb8904fb5ba3db711.camel@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
	 <20240320110918.3488-10-shayne.chen@mediatek.com>
	 <8fe81cdf-5807-4d6b-9bad-7a45208cd15a@nbd.name>
In-Reply-To: <8fe81cdf-5807-4d6b-9bad-7a45208cd15a@nbd.name>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6468:EE_|SEZPR03MB7356:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PsS5BbqethmcHtmTB1rbsY7cOQszijsy8ixX+tAt4eBqsY5X03kDQ1lNDw0g7vL8e+b2HOflCQ7I6f5YmAj8Md/94bQ1oHeZ1BvIvy9rjef9yKK2NJDb9UQZqsaIN6byXEuUXLeCI7U/fGBAusuQ2Jur8Vb2oAAbj6JVwjRwNIYi4rQazOCIs89h/Nwb0yPZkgkG0CnoUBbUyrd0BpBzF6QaXnuprcThqPuBNGGdoR2MpL8a481yfP009y1vhitpJKyv/gG5SPQnxM/ODY3efwv5H+LYHoDuqRk5hfVvSVruQBd4TMCSYOiPJRqufTjGFlzKuLrGUH3E/rNY4kt2RuUoS67paTD4K7gO7ItnqJBdbAagSWtYeAndHjZpSQJMxVv6csRXUE0a2I6UNGTIye4CdW0De2twaNO0TtUpWtoVy/okCEUadjt0D5jZyDSDoFfCcc9qs5AZJtcUlsTMK/KAonvJUzQ/2R3mkMFsTqPAsHcu5RqPByPGLgyK0nPtgjA0IgTO88+d2AE8PlF6GTS7iUj0zsxOQS0jztRzt2fg29YfnIfyc67iaqPkQyhQppw63B3cA+nNXY7yV5k6tmPNeMeKGMWAfjkGIs6tPowat6f6NHMIBl9rakilNb7sXH2MA3tF0ymoszxT0fPEOM6ZTjjXBmimcz9TMlGxQwY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzhpZkhrdEo2MEVXK0F3dzVkQzR2L1pRRjI0UkF1cUYwUmtoa3V4YzBHZjNR?=
 =?utf-8?B?Zjk2Mi8wQ3dXRFQ1WFpSY2N4VlZGZ1pCdmVQdFdFRkZzd2lEOUpITCtwMEhR?=
 =?utf-8?B?aW1mQWVKTmFwdi9mdmk1Ly9wR0pLMm14Z0dhRW05N2FqQ3pxRldoa0ZYaFYz?=
 =?utf-8?B?TXo3UFhzeDVPWEVFaFVZZGhkVjcvQ0xITWVnK0V4cXlVL2ZxalBwNHF5Wm5N?=
 =?utf-8?B?UjJVM0gxUFdOUlZRSGV0RFB1MFVOeFErMDhKRzMyS3JmVE9ETjZ6NXJqYk9O?=
 =?utf-8?B?LysyMERla0tIdEtweUFIblNYQ3h5d1lXa1hGTWhxcHhaK1N2MGVPd1JwYmpj?=
 =?utf-8?B?U1JnZ2VzcmFndE1QRy9Dclc2RzZHOTAvc3RqZDF2YVltY2dEVHNML25scDc0?=
 =?utf-8?B?UllpZUNFa09xWmNTMThZeGJKYkhzUXY4a1FNOGVDM3JsRS85aWZheC9GVlA5?=
 =?utf-8?B?VnhSMjY1MWxJQnFwc0Q0Wi9KT2M2YXBNT3FjSStQS3RZMklFM25wRWdDOWtZ?=
 =?utf-8?B?dXlPbW14VWwraG9HUnJaKy9WYUpoNkJ6OFp2YWI5QXE2VlJ2SUw1OU5ueDlX?=
 =?utf-8?B?UFkwaFVNUlF5Mzh1Y1IzUjhoYzF2dWVGQlNaTXljcVl4V2JkbEZVWkpRSm11?=
 =?utf-8?B?c0dvamRSNE9Tb0RSRThyUzl2WnRIVXRRelptNDBWTXl0N0hBZmZWNEorQ1kv?=
 =?utf-8?B?RlBSQjV1TzVNcWR5Vkt6WHc2cm0zbk1mbzdnYlhJeTRHeWVoVGlMK3VpYmk5?=
 =?utf-8?B?eitPU0lhcm1BczFxRVVWM1ZnM3JNemREUjN6MVNWSmI1Vmh0MGZieXNHVCsy?=
 =?utf-8?B?YWdxcTAyamxYSW4xZFFlRnI3QlIzSExOWFJFSlNPN0t4ODVwbzU1eXJlN0lY?=
 =?utf-8?B?UEVpL2JuK2ZSeXdsdm5kQkpuZkVtZFZqY1c2WjlHMlhBTElMdmcxcHArWWdS?=
 =?utf-8?B?OXhNYWdXdndjaTlBajZ6NlBiRGFtazIxT1hQTFBFMEVTbjhEdlZFdXUzZllJ?=
 =?utf-8?B?ZXRvWSs0VnJYazVaMWQ0bnljbUN3Tmh1YzlsSjJQaXQzSXVZcUhyZ0R3S2VK?=
 =?utf-8?B?SCtDSDNrdDBadUMvRHFUdkRzOXRrV2ZWR2FIWFFlUXM2OXhHamI2SlpKTTRE?=
 =?utf-8?B?R0g2UEhMRXdTUnFpdVhKaEw2ekhCa1ZjZjEwQURWTnZMeUw5eVh5eFJ4MnlT?=
 =?utf-8?B?NndBcFdjZGZCVFliTHhCWjFEZVlGWjFwUWY4L2k0S1hYWk03Z2hPM2VrVzNz?=
 =?utf-8?B?Ukhha0h4djFvcjlRc3F0U3dTbUtqbE93UnJ6M0ZOdW5tUkUvQk8wb2g1WDVP?=
 =?utf-8?B?aDNncXo5ZUhsUm9STjFkRzVRQnA3NVJpcFFWdUh2ckFXMjdTdHl4TW5SUGdF?=
 =?utf-8?B?eDBOeE95dmNTZ3VNM0p0OWhoVXlzZkhXc2l0RWZZQUdtRHZkMFVsaVMyY1Fq?=
 =?utf-8?B?a2FmSnRaSWJLVnRiTXhWVDZCcGtTa3ZhR3BLdklqWGtEUUFON0hwQlB0QWhw?=
 =?utf-8?B?d092REV6czdqOTNXUVc3L2JVL3lZL1hIMGhIRDRoa09lekd1Z2tmMVlJMmZq?=
 =?utf-8?B?VW5haFZoVGtOTzh5U0NqY0M1TGtLbDRnMDl1c055WWFGeXJrSFhQRHhENzd4?=
 =?utf-8?B?cjRCL3ZYWm9YQmxnRzIxUFRTSGVpdCtja0dPOHl4ZVp5WEFtdCtvN2JJYzdm?=
 =?utf-8?B?Q01zYzVCYzduRE5GN3d3M0NyUHF3Z0Yybk00eDA1TTBGR0NhOGFhM0gwNFBX?=
 =?utf-8?B?SWVhT3dTUUhKRG9kdXRLUlJLZXE0emxqdUd6VXdENy9odTA1ZEo0QzY5Wk80?=
 =?utf-8?B?NDVLWTd6UGJGeUVWMjlDdFQ4ZGsrWlllUUR1cmxqQWJDd0tabVgzUE5WTFRE?=
 =?utf-8?B?azF4UWV0eWpyRVZaQ0s2Vlo5OFlQc2FhNlptY0p3YmxkRmEzUThZYmlYVGFZ?=
 =?utf-8?B?NUY0UUNodmFuWGhJUkRsb3YwR2dWRUkyR0pNdDdNY1ExcFZiWDUrV1I0b21n?=
 =?utf-8?B?MGd5MW9SYUxpUjZuYXBsbGVKV1R0ajVrbmh6a3NtYXQ3R1FKUWxNTHErTXF3?=
 =?utf-8?B?TERZWlBTQ3REQmFhdlJWV2F6V1Jma0plWUErVmJNckh1YXBTdlEyWEVHak5y?=
 =?utf-8?B?dEY1THY5bG5kTXlRTW9IelUrL1FWZkZONlNzQkpCZXNXbGNINHRjeTNLdmVQ?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B19B40985CB412428850DAFAE77E6A39@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84893213-d9ce-4289-ebb9-08dc5790ce6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 05:57:42.9702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shP6Zx+lWDS9ajDmjw+JAhb6KV7IQBA/6eTqQWeq5BDo7/P9iXOjyzxfBkRbtliAcS2w1UMzlUezd5T27/vUtsgjdBHWmxM1DdX5g6xHp2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7356
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_225754_636339_216F26F2 
X-CRM114-Status: GOOD (  11.17  )
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

T24gV2VkLCAyMDI0LTA0LTAzIGF0IDEyOjU3ICswMjAwLCBGZWxpeCBGaWV0a2F1IHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIE9uIDIwLjAzLjI0IDEyOjA5LCBTaGF5bmUgQ2hlbiB3cm90ZToNCj4g
PiBGcm9tOiBIZW5yeSBZZW4gPGhlbnJ5LnllbkBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gSXQn
cyBvYnNlcnZlZCB0aGF0IGhvc3QgZHJpdmVyIG1pZ2h0IG9jY2FzaW9uYWxseSByZWNlaXZlDQo+
ID4gaW50ZXJydXB0cyBmcm9tIHVuZXhwZWN0ZWQgUnggcmluZywgd2hvc2UgUnggTkFQSSBoYXNu
J3QgYmVlbg0KPiA+IHByZXBhcmVkIHlldC4gVW5kZXIgc3VjaCBzaXR1YXRpb24sIF9fbmFwaV9w
b2xsIGNyYXNoIGlzc3VlDQo+ID4gd291bGQgb2NjdXIsIHNvIHdlIGFkZCBhIHNhbml0eSBjaGVj
ayB0byBwcmV2ZW50IGl0Lg0KPiA+IA0KPiA+IFdpdGhvdXQgdGhpcyBwYXRjaCwgd2UgbWlnaHQg
ZW5jb3VudGVyIGtlcm5lbCBjcmFzaCBpc3N1ZQ0KPiA+IGVzcGVjaWFsbHkgaW4gV0VELW9uICYg
UlJPLW9uIHNvZnR3YXJlIHBhdGguDQo+IA0KPiBEb2VzIHRoaXMgaXNzdWUgb2NjdXIgZXZlbiB3
aXRoIExvcmVuem8ncyBmaXggIndpZmk6IG10NzY6IG10Nzk5NjoNCj4gZml4IA0KPiB1bmluaXRp
YWxpemVkIHZhcmlhYmxlIGluIG10Nzk5Nl9pcnFfdGFza2xldCgpIj8NCj4gDQpUaGV5IGFjaGll
dmUgdGhlIHNhbWUgcHVycG9zZSwgcGxlYXNlIGRyb3AgdGhpcyBwYXRjaC4NCg0KVGhhbmtzLA0K
U2hheW5lDQo+IC0gRmVsaXgNCg==

