Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8BEC46CD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Dec 2023 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iK1H3mIAuLVmlHpiuoEqpHIzJ2Skq742Pxw52BehNc=; b=s1JQnktIo00h9i8PPRg18Cbhu6
	jlf2g/wNWm9cFUrkOWy2Jk3YxDVk3Y4zQW5Hyt+DE2fbh9kEntDYHn0XrLgYmTwwItwLEzR5KEYir
	yA122qXrCuKBnxgwZa4EtgKh6hylCfpEJCuK3ZOVcBsZLxemnuz++XY9yWDaU1bbIEwilm0sWrH8m
	MMm/OXuCSOrVH+9+lKF5NdatIGDdS501s605mIfA7cO2wu6jkTxI8ifMHvmSimdv1dP0gcSCXljuN
	QH424SWOTWb4TJvScjG4AfPi+3xcikFXcFU5j0EyGjhwtrFP99m4kzjoQL21U7fgyISzbnOhvdZgk
	/+WIFQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHbLy-00A97f-1j;
	Mon, 25 Dec 2023 03:10:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHbLu-00A96q-2w;
	Mon, 25 Dec 2023 03:10:04 +0000
X-UUID: 1410774ea2d311ee958cff29c719f35b-20231224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6iK1H3mIAuLVmlHpiuoEqpHIzJ2Skq742Pxw52BehNc=;
	b=sUtznIXl4d4Qjj+b4GxZJneNO90b2puhF6A8/wpol5YbM24ywViLwGT+d6mD0/eFbV6UMQ0oNcnhZksTI7bdZovhptD/51J8lGOU/cb4+Ucs/OtHiTQgQFxhbxrmJv3/6lSNCGTJ26cKQNX3IjWmL8RIbkOmTafwaeMuKyAAtxY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ae3fad24-bc6e-4a2d-a475-132ccf422015,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:a99da07e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1410774ea2d311ee958cff29c719f35b-20231224
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 57893355; Sun, 24 Dec 2023 20:09:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Dec 2023 11:09:39 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Dec 2023 11:09:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBfgYrojzpMnyNKE+1LXMYc7yktOw/fSryZIpxaR/wIAHypsKh6zyYVzU18ONDzZLJt22KuVz/dbtxSws96e1hKLR+zSM9RivjvZFrrCQ+P9wfaEmFwM6Fmgm5hRlkSllOUSlKlYh4Wws3eAhE9P+jsRJ0XUY+jCd5VjebUX+kOzN4IaF2IVsOlDuJ0dyAI847+ZvKswd/bUfLWRYyowL9WK69o5203U1nPZX0tb17GXhm1rMv3JEMyBM8HiLJbghniB0Bli4GQ+DQHrYhc95lNLsDtbMBXdTlX3Ark/wQ5MXVsJ3u/MCm9sm/rM/mInYRk5KFcS8A5/xKlqD4lwOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iK1H3mIAuLVmlHpiuoEqpHIzJ2Skq742Pxw52BehNc=;
 b=MUFij/KU34iwDedDbdBioVUfjSGg3jlFl38+mtOc4fKjDT/YYyNxGtsW7Igu37ucPQBY/VVC6Ey4wI+EfznZ0srzrc/XzUTJx0Os7TODPOlyKZsFCgqIqif/Svatn+UkrECyIi4UuK7Terss25Y0ZpLZz01WDN7mf8UJATkDqQ4t/rvVjBWTkXF8S5zmqIsMcmBqp+4FowxyM9cJ0ILqmBKe1T5qu1Z60B3BCYxh4YrSDjkmEuv7AB8m432+AcuvuNpIgDAYRduujmng+xCwfxsRWWBiynUTXHxMLwTTPjxf5miNRaHPXQGrtTPeWRc0ZODq66oiW3T6MobFj2hyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iK1H3mIAuLVmlHpiuoEqpHIzJ2Skq742Pxw52BehNc=;
 b=DRz0eOuCRQqEP7hLTxFp7RttgSIj9kRrINkHbNGQuWt7Yf+Xu5RO/fCz8zdHXxySMJzthWR+4dHSo7L2ZEY4ap3RhsIzKHwiYZaMk6vFWvYTv9Bxbeldus5ZPtwRHWbfB2RBbbtJFeG5sWr0Quvd/c3+0XYr2E1+pxZNsFjBEy4=
Received: from TYSPR03MB7370.apcprd03.prod.outlook.com (2603:1096:400:414::14)
 by SEYPR03MB6904.apcprd03.prod.outlook.com (2603:1096:101:b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Mon, 25 Dec
 2023 02:55:34 +0000
Received: from TYSPR03MB7370.apcprd03.prod.outlook.com
 ([fe80::32b7:1e56:be0d:4411]) by TYSPR03MB7370.apcprd03.prod.outlook.com
 ([fe80::32b7:1e56:be0d:4411%5]) with mapi id 15.20.7113.023; Mon, 25 Dec 2023
 02:55:34 +0000
From: =?utf-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "msp@baylibre.com"
	<msp@baylibre.com>
CC: "fparent@baylibre.com" <fparent@baylibre.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?QmVuIExvayAo6Zm45b+X5oGGKQ==?= <ben.lok@mediatek.com>,
	=?utf-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
	<Chris-qj.Chen@mediatek.com>, =?utf-8?B?TG91aXMgWXUgKOa4uOaUv+mMlSk=?=
	<louis.yu@mediatek.com>, =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?=
	<bear.wang@mediatek.com>, =?utf-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?=
	<MandyJH.Liu@mediatek.com>, "amergnat@baylibre.com" <amergnat@baylibre.com>,
	"afgros@baylibre.com" <afgros@baylibre.com>,
	=?utf-8?B?WGl1ZmVuZyBMaSAo5p2O56eA5bOwKQ==?= <Xiufeng.Li@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
	<fan.chen@mediatek.com>, "abailon@baylibre.com" <abailon@baylibre.com>
Subject: Re: Discuss Mediatek Power Domain Driver Support Mulitle Smi Clamp
 Protection
Thread-Topic: Discuss Mediatek Power Domain Driver Support Mulitle Smi Clamp
 Protection
Thread-Index: AQHaMyf3Pw5T92RR2kOvGPBTY4rb8LCyJcaAgAFDlICAAEOWgIAFqGeA
Date: Mon, 25 Dec 2023 02:55:34 +0000
Message-ID: <6fe4d15afc6220c0f131d33925b82dd24bedcd06.camel@mediatek.com>
References: <a3aaf3180fdb3da117132089bd160ba4d5cebc17.camel@mediatek.com>
	 <b4fa9b7f-512f-4a34-884a-a99a3b035d34@collabora.com>
	 <f8150ce2859bc8d22d2fa7cbc671bf2d43d4a86d.camel@mediatek.com>
	 <e80dbd42-b9c8-4564-be4e-6ee449d24c70@collabora.com>
In-Reply-To: <e80dbd42-b9c8-4564-be4e-6ee449d24c70@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR03MB7370:EE_|SEYPR03MB6904:EE_
x-ms-office365-filtering-correlation-id: 39ae7c4d-6fec-4911-dedd-08dc04f4f6fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6a+xAJjWJ/wXErcW4Fz3iRoxA3F1qEph9lwLi0Totb42sJVKJAQySyMtns1GRzOLpnT24UBv3n+4C01MgRuoEYMwuXb1l1Qw829n8lxYUSe9ZplRq62KolTkABa3ATr7HsYbTaIeeUBUlMGqyR3kdtPdo6o17Ni9+HaF31PiDEnR0hQN679O16kz5xxULWCalulCrS7BSDRr2XfzosN3VTfcwUbED18ZTVdkx+HTqoQhlKw5ZB8nbqhEKkZ2Fk9nnwTBf4ofHK23A+W51Sj1YrYKsrHHY3EF8e7jVbRSEst0v1ycntY8MBFcmvj8nw7d1JASCZ9ZrZKC1uh6AkUDXTx+eoybwuz95jljHkcqf5Eoicg2pkbR7cdU8pL1DGW0gtsaUtfvZPy64n/JXBV4/gelRnLu0DpAHpZzMMhba9AiGWYo/bvK/ImWq+vV5b3xOPSr2whJREaNO58usUwJWnIuLdEGvFwpQbFbeq8TRql+HgiEE/YsJsTG9c/qN2DH3JEZZj86znqx65XXqBMU33o29r7OiUPTpbAUaZZzpe59xozCPzZ9V4AMb+qQneybr4RYvXDQCAFYxuj9XfF0BfLnYY2qT0BDTy/jdGk5pv+iJPUh3BJ5jSubay/mINf/7agRJhcH8EqDb3kqTk8M79FafaRgAOL/F5dAtyISUyY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB7370.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(71200400001)(6486002)(478600001)(2906002)(8676002)(8936002)(122000001)(5660300002)(85182001)(36756003)(6512007)(6506007)(4001150100001)(66446008)(64756008)(66476007)(66556008)(66946007)(38070700009)(110136005)(4326008)(54906003)(316002)(76116006)(2616005)(83380400001)(86362001)(26005)(41300700001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWtBaFI2d0hrQ25sRm5QdERXbFJDUUFUVnltRERqcERXeThMQVp6VG1yVXJ4?=
 =?utf-8?B?MXNTUmIvbXBwR3Z2TXBCR0pLZmxlaUp1WTROUUo1YkliMHdaWldqSkcwQ3VC?=
 =?utf-8?B?VWlrWENNQUIyRkZqZW5XOG9RWDAvMnhZdVNEZTJRNVJ6L2xYL3QxcTBNY2dN?=
 =?utf-8?B?U2FYLytzQ1VVSEx6MllML2pOcXhKS09LT2RTV0lvSmRraWt5WENwQzcwWTZD?=
 =?utf-8?B?OFpONUNLV0Q0cVpnWEVweFVGQXhYdHI2Z0l1dnQwSjQ2ZWUwSGNFQXVUSUky?=
 =?utf-8?B?K1ZmNUgyY3VQNGRvNGJGMFZ1SEFtSTROTHRsck9jM0o2TnF1UE4yc0thOGNR?=
 =?utf-8?B?L0hUWDIrVkxKMEJWZUZ5MldRN2xhZ0plRzM1MGpRcGRnempVQ3BsN0E1Tmt5?=
 =?utf-8?B?YzE1djkvYmdXSzcvaEV0aXRpb24wUi9qNmF4UExPbWxBaU9ZR3FBaUxBeHdq?=
 =?utf-8?B?TVBZem1wSjRNNFp6YlJWZ245SkNwODRTTnY5RkZRZ2huYVM3SnQxN2E0WlBZ?=
 =?utf-8?B?TmJtREtpRUpwQ3ZnS3lSTU45ZU5xU080a2dOT2x6Y2VJWmtZb2hQdGZ6NUs0?=
 =?utf-8?B?N3NncUg1VkhhdUtUL08zUmRqakk1QXloamxockRpbFRDUHJoRGV1T3VnVlB0?=
 =?utf-8?B?cnRzbkFDWnZBT1BLNjlBazRJV3VWZ2NZZU5WeWQvMm1iV25xVHU0YWFoNDMw?=
 =?utf-8?B?T3h1NzVnRnZzL3A4aHM3QVdvS093OUlXQVFSWGVIbW5UOUVlaTMxL0RJZ2tO?=
 =?utf-8?B?bVV6eHI3OHRYQkR3Mk9qU0xyd0tVTVdITUtrYUNoZGY1K1lNUmJLb1VTZnls?=
 =?utf-8?B?M2E1NFdpTjJDWWg0RjVaZnVEbWwyRnZWbnFROWxFK3hrQ2N6dGV3TFBXdkhF?=
 =?utf-8?B?TWV4SlV1U0NYa1IwR1pNbUdmNUVBdnlNNkNPL0hFZS8rekpEZFhGRWlTZHVh?=
 =?utf-8?B?Zkd5WTFGL3BjVnRHdDMrSitUOFJwamh0cmN1YjcvQTIxbXljNnEvK1pMSmNt?=
 =?utf-8?B?aU9ZZXYvTlgrK3N1d0pNMGxvS1NqZU5KYy84TzliRFlrME9zUW4xdE8vN05m?=
 =?utf-8?B?NXMxdXptdEhibGFnN3hHcDJrQXRIUkFnck9tRnEyUGZGZWhlTHJ1engxVVVJ?=
 =?utf-8?B?em5XSmJJd05jekQ2N2l4SS9qMjhNVHptMFJEY2plUzZwSUZjZWtVMFg5NzN1?=
 =?utf-8?B?cVBRSDU5VlJrTUFjTmxpMlRRY3VtM0NJRkFGVGtEYytKeEpSMitmRDU0KzNs?=
 =?utf-8?B?a3BCOGxlT2RPdGdMQy9BSWk0NGxFSHRhVXMvRFYzRzI0bGhSc3RxbEh1U1ZU?=
 =?utf-8?B?dWNsNTdUSlpvbFZuMmVTZlpPOUprM1ZQUlFhVFJ5Wm9WcG9iUjNrUDNuZEZ0?=
 =?utf-8?B?c1hGRFlpdm50akFDK1VhZUZFd0J4VGJjY2ZxeUdOVW5HWHNoWjBHWHZVeU9P?=
 =?utf-8?B?ZDhkN1dmeHNZUVhkb21zZTlFYkVGRWRDNnR5QitYeU16UlZ0RXhGeGhqdDhZ?=
 =?utf-8?B?NG9SWENUc1NCVWU4amhrNHhoaTZyQ09SSnovVnduS3dSWWwxUTJ5MTF1UHph?=
 =?utf-8?B?cFJmeWxCT0RnRGNqYXdtaUJlZzA1UnFxQU4vWlZLRnUrMG1mZlY4MmlVUGJw?=
 =?utf-8?B?Q0xXYS9OeHZPd0dxeGZnNTBMa3BxTTZmYWh0bU5FQjNock83Z3lJaEYyQUxX?=
 =?utf-8?B?ZVJDVTBDZ3ZmMHJmNlk4VnQ1MEJ4TzRnSy9XNjUyYkpsUWFqUU00WDcwU3dH?=
 =?utf-8?B?b2g3akExbmZsNmhaZkNuLzF2K1J2Y3B0dnFGSTNHam9WMUtkUEhEU3dXWjJw?=
 =?utf-8?B?RXk5MFpsTTRHdkhYWkViQVhUWGxwUGFWa3RIakpRT2pTbGxzcGZHV0piWWVY?=
 =?utf-8?B?dDdKbnV3M1dIdXpoSHhXY3RoMUdlYmNla3JCQmJFanFuUXNPdk1EVVJGVmRy?=
 =?utf-8?B?WHNCdVJrTnBTTVZIU2IwZlVtdmczNlk3QVg5ZCtidVBueFB2c3Fjc1BSVHdY?=
 =?utf-8?B?S2t2c1FpOGZkV0tKaFF0eXd3NFoyQ3p3OTNFMmRUeWdvdHlWb003ZzJpUUJj?=
 =?utf-8?B?RnpXNUFvbDUvWFZyTE1iaDNvTmQwejhCQ0xkdllCalBScHMyTzU1NkNHVGFx?=
 =?utf-8?B?UGVDYnlBNlB5TDVDd1orTk1VdkY4VmZ4eUFqRU9DN1VCaThpbS9BaXhzczBN?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B68A385E58F4643AF934426EE20A89C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB7370.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ae7c4d-6fec-4911-dedd-08dc04f4f6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2023 02:55:34.1594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOCyJ/xPrTuJuE6PWW5TgnJJg7wLZh2TLWAwEjKKIepgKxBy2ToSPFRjnHycI78hndSKQ5RsU3a9waZwnFvy4yR/bTaMlFeeK1HpdSHEQMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_191003_001730_BC086E9F 
X-CRM114-Status: GOOD (  21.12  )
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

T24gVGh1LCAyMDIzLTEyLTIxIGF0IDEzOjMxICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gPiANCj4gPiBXZSBjYW4gY2xhbXAgSU1HMSBiZWZvcmUgY2xhbXBpbmcg
SU1HMCwgSSBhbSBtb3JlIGNvbmNlcm5lZCB3aXRoDQo+ID4gdGhlDQo+ID4gb3JkZXIgYmV0d2Vl
biBpbmZyYSBhbmQgc21pIHJhdGhlciB0aGFuIHRoZSBvcmRlciBiZXR3ZWVuIHNtaS4gQW5kDQo+
ID4gSQ0KPiA+IHRoaW5rIGN1cnJlbnQgc3RydWN0dXJlIG1peGVkIHNtaSBhbmQgaW5mcmEgbWF5
IGFsc28gaW50cm9kdWNlDQo+ID4gbWlzdW5kZXJzdGFuZGluZyBpbiB0aGUgZnV0dXJlLiBNYXli
ZSBzZXBhcmF0ZSB0aGUgYnBfY2ZnIGFuZCBtYXRjaA0KPiA+IHRoZQ0KPiA+IHNtaSBuYW1lIHdp
dGggc21pJ3MgYnVzIHByb3RlY3Rpb24gc3RlcCBjb3VsZCBiZSBhIGRpcmVjdGlvbiB0byBmaXgN
Cj4gPiB0aGUNCj4gPiBwcm9ibGVtPw0KPiA+IA0KPiANCj4gVGhhdCBjb3VsZCB3b3JrLCB5ZXMu
IFlvdSBjb3VsZCBhbHRlcm5hdGl2ZWx5IGJ1aWxkIGFuIGFycmF5LCBvciBhIDMyDQo+IGJpdCB2
YWx1ZSBmb3INCj4gd2hpY2ggZWFjaCBiaXQgY29ycmVzcG9uZHMgdG8gdGhlIHBvc2l0aW9uIG9m
IGEgQlVTX1BST1RfV1IgZW50cnkgaW4NCj4gLmJwX2NmZywgYW5kDQo+IHRoZW4gdXNlIHRoYXQg
dG8gbG9jYXRlIFNNSSB2cyBJTkZSQSBidXMgcHJvdGVjdGlvbiBlbnRyaWVzLg0KPiANCj4gVGFr
aW5nIGFzIGFuIGV4YW1wbGUgYSAibWVzc3kiIGJwX2NmZzoNCj4gDQo+IC5icF9jZmcgPSB7DQo+
IAlCVVNfUFJPVF9XUihJTkZSQSwgb3RoZXJfcGFyYW1zKSwNCj4gCUJVU19QUk9UX1dSKFNNSSwg
b3RoZXJfcGFyYW1zKSwNCj4gCUJVU19QUk9UX1dSKElORlJBLCAuLi4pLA0KPiAJQlVTX1BST1Rf
V1IoSU5GUkEsIC4uLiksDQo+IAlCVVNfUFJPVF9XUihTTUksIC4uLiksDQo+IH0NCj4gDQo+IHBy
b2JlX2Z1bmN0aW9uKCkgew0KPiAJLi4uDQo+IA0KPiAJZm9yICguLi4uKSB7DQo+IAkJaWYgKC5i
cF9jZmdbaV0gPT0gU01JKQ0KPiAJCQlwZC0+c21pX2JwX21hcCB8PSBCSVQoaSk7DQo+IAl9DQo+
IA0KPiAJLi4uLg0KPiB9DQo+IA0KPiBwb3dlcnVwX2Z1bmN0aW9uKCkgew0KPiAJLi4uDQo+IAl1
MTYgc21pX2JwX21hcCA9IHBkLT5zbWlfYnBfbWFwOw0KPiANCj4gCWZvcl9lYWNoX3NldF9iaXQo
aSwgJnNtaV9wZF9tYXAsIDE2KQ0KPiAJCWJ1c19wcm90ZWN0X3NtaV93cml0ZShzb21ld2hlcmUt
PmJwX2NmZ1tpXSk7DQo+IA0KPiAJLi4uDQo+IA0KPiAJYnVzX3Byb3RlY3RfaW5mcmFfd3JpdGUo
KQ0KPiANCj4gCS4uLg0KPiB9DQo+IA0KPiANCj4gT3IsIHNpbXBseSwgd2UgY2FuICplbmZvcmNl
KiBvcmRlcmluZyBpbiBicF9jZmcsIHNvIHRoYXQgYWxsIG9mIHRoZQ0KPiBTTUkgZW50cmllcw0K
PiBhcmUgYmVmb3JlIElORlJBLCBsaWtlOg0KPiANCj4gLmJwX2NmZyA9IHsNCj4gCS8qIE9yZGVy
aW5nIGlzIGltcG9ydGFudCBoZXJlOiBTTUkgYnVzIHByb3QgYWx3YXlzIGJlZm9yZSBJTkZSQQ0K
PiAqLw0KPiAJQlVTX1BST1RfV1IoU01JLCBvdGhlcl9wYXJhbXMpLA0KPiAJQlVTX1BST1RfV1Io
U01JLCAuLi4pLA0KPiAJQlVTX1BST1RfV1IoSU5GUkEsIG90aGVyX3BhcmFtcyksDQo+IAlCVVNf
UFJPVF9XUihJTkZSQSwgLi4uKSwNCj4gCUJVU19QUk9UX1dSKElORlJBLCAuLi4pLA0KPiB9DQo+
IA0KPiAuLi5zbyB0aGF0IHdlIG5ldmVyIGJ1aWxkIGFueSBwb3NpdGlvbmFsIGluZm9ybWF0aW9u
IC8gYml0bWFwcy4NCj4gDQo+IFNpbmNlIHRoZSBTTUkgdnMgSU5GUkEgb3JkZXIgaXMgcmVhbGx5
IGltcG9ydGFudCwgd2UgY291bGQgYWRkIGENCj4gImZhaWxzYWZlIiBjaGVjaw0KPiBpbiB0aGUg
cHJvYmUgZnVuY3Rpb24sIGxpa2U6DQo+IA0KPiBwcm9iZSgpIHsNCj4gCWJvb2wgc21pX3Byb3Rf
Zm91bmQ7DQo+IA0KPiAJZm9yICguLi4uKSB7DQo+IAkJaWYgKCguLi4tPmJwX2NmZ1tpXS5mbGFn
cyAmIEJVU19QUk9UX0NPTVBPTkVOVF9JTkZSQSkNCj4gJiYNCj4gCQkgICAgc21pX3Byb3RfZm91
bmQpIHsNCj4gCQkJZGV2X2VyciguLi4gLCAiU01JIGJ1cyBwcm90IGNhbm5vdCBiZSBtaXhlZA0K
PiB3aXRoIElORlJBIik7DQo+IAkJCXJldHVybiAtRUlOVkFMOw0KPiAJCX0gZWxzZSBpZiAoLi4u
Li0+YnBfY2ZnW2ldICYgQlVTX1BST1RfQ09NUE9ORU5UX1NNSSkNCj4gCQkJc21pX3Byb3RfZm91
bmQgPSB0cnVlOw0KPiAJfQ0KPiB9DQo+IA0KPiBPYnZpb3VzbHkgdGhlIGVycm9yIG1lc3NhZ2Ug
ZXRjIHNob3VsZCBiZSByZXdvcmRlZCwgYWxsIHRoZSBhYm92ZSBpcw0KPiBqdXN0DQo+IGV4YW1w
bGVzIHRvIHNvbHZlIHRoZSBpc3N1ZSB3aXRob3V0IGhhdmluZyBhbnkgbWVhbmluZ2Z1bCBvdmVy
aGVhZCBpbg0KPiB0aGUNCj4gcGVyZm9ybWFuY2UgcGF0aHMgW3NjcHN5c19wb3dlcl9vbigpIGFu
ZCBzY3BzeXNfcG93ZXJfb2ZmKCldLg0KPiANCj4gRG9lcyB0aGF0IGhlbHAgeW91Pw0KPiANCj4g
Q2hlZXJzLA0KPiBBbmdlbG8NCg0KSGkgQW5nZWxvOg0KDQpUaGFua3MgZm9yIHlvdXIgZ2VuZXJv
dXMgZmVlZGJhY2sgYW5kIGFkdmljZSwgSSB3aWxsIHRoaW5rIGFib3V0IGl0Lg0KU2VlIHlvdSB1
cHN0cmVhbSB0aGVuLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1DaGFuZy5MZWUNCg0KDQo=

