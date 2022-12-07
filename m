Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A54C3A5A7
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 02:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KQSM1Yk9A7hSU9wOj/d38+aHfeHHP0fnBgiT8M7oFs=; b=Nr/kw0YMahqq/9jhMkRv2cxba3
	4FOz+fGTp/aW3oIQFI/C2lLY/SQ+RJCiywLCqvMSG3zCB0C3BAemo46EA5f3cd62zsq0zGX1LSDS4
	sBAZ6U5LA6MVOWVmRZRzbEtRNHV8dvGCSR8FzsoMz6Xk0OTEOUVMWKSGD8QcOq7UA3/dr4MVo1EHr
	qC2ibjPta0X7rp2x4z72tFckVG4t1mhznYK5aqOnqBn0fgRyQcTig5zYSoXFOA5CoN1zmB3zID5b2
	upYjPnA7eaDviCM5LgJ87R1XoGTAj1sUlXjQYoFl4rh0me89MCaED9eZd9d07e3qhXtK+et3TzsFU
	Dyzw3bCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2kQL-008qOy-I1; Wed, 07 Dec 2022 02:44:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2kQI-008qHz-3n
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 02:44:39 +0000
X-UUID: de3b034982524ba094193030c5a7036c-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7KQSM1Yk9A7hSU9wOj/d38+aHfeHHP0fnBgiT8M7oFs=;
	b=DWAW5tuBafrRK8qeg8xfe+Wyuyar8wgN+kNB3kUrj1Ls7JMDR1cjmtqnoPs9PYWjuUIZ2m+NL8LYHu2mwbWdtdTQ6Ci8cR9AsraeTaC7s2yw0g7am71HkyCl362zIvy3i/CD4r43u+zjFC0GaSHGaW7ZSateFyMQOEFWXUPG8e4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:0887e3ee-30c3-4010-9efd-942beefe9935,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:62b1dad1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: de3b034982524ba094193030c5a7036c-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yanchao.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 485023136; Tue, 06 Dec 2022 19:44:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 10:33:58 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 10:33:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Coi0dKjBzqaE+CIw7R8mp7WRqrKzhdk+u718qdMdeH9vbzulpvYQaIq44j81n4gfPYVqONvcF2GLG6hYuson8QIU6SEKfE1yPPTgyGzVdUH9uVA1fKS+HqLUzQS0fuB+0VZXeU4uBOxQ12tbMUZfOLD9Nz5EXhiXg45VNJzeNzkxn5xhzvsm6tseEj7VQK4eOfAzFHrhSG+iYP3d04SVPk7+2EZueI5Eotnj5srIHdDJUVuu495vnoqWfg9XFl4zkkrdfhGyxnroPp/w/m0yFtY7BbLP9CjhXyQraK9WJRRd8fq7ddtUAFZcvPnekDlUbo0x+zV+NZSJ969bEP0ypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KQSM1Yk9A7hSU9wOj/d38+aHfeHHP0fnBgiT8M7oFs=;
 b=dc93Tcr170C9+HSshHL5kk1g9J4nDB7H8+6RiGUWOdTrTphPull6YZ6p/5ytsSoPlVJy3cnNYz5YAJfZ9q4LkcZqjRggi3njkxnuRGuriFDkSmFom+GagQ5DMBoc20CnJjCy/pIL6X/s3xY/noKJoABjar/FnIU5GZcsBli1bOm/8RiW3DsUKu222uCs0+cdnl3oyh6cusNMoDTw6cnMO1eYIZgbrUNBZz8IFqG/+s94WGs0YmoXfdRfH7mOQ3mHpJbu9TYoJ8iS41nmEo6XHCkH4N6uCuIWJNKo6wXJ1yvNtAFbrNkMUJH9tVplBzY4JNk+0Czl09VvtuyOmXArSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KQSM1Yk9A7hSU9wOj/d38+aHfeHHP0fnBgiT8M7oFs=;
 b=I2xIODfgsBn7kh2odqhGXOViuhZ6MaNTIY/bayEfQcg/QYEGajnAGeTHLBPz5k37UmCztTUtzBlckxqn9CC4sk/iXaLaGm2qYED7WUaKowpfjU70WcKPRpNYxwyBUZaP3fYBzYpBJ14TR5PsKZdVzdizkAoTMHR3oZzfpihANpQ=
Received: from TYZPR03MB6161.apcprd03.prod.outlook.com (2603:1096:400:12c::13)
 by KL1PR03MB6060.apcprd03.prod.outlook.com (2603:1096:820:8a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 02:33:55 +0000
Received: from TYZPR03MB6161.apcprd03.prod.outlook.com
 ([fe80::b159:85e8:5e32:e20e]) by TYZPR03MB6161.apcprd03.prod.outlook.com
 ([fe80::b159:85e8:5e32:e20e%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 02:33:55 +0000
From: =?utf-8?B?WWFuY2hhbyBZYW5nICjmnajlvabotoUp?= <Yanchao.Yang@mediatek.com>
To: "ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>
CC: =?utf-8?B?Q2hyaXMgRmVuZyAo5Yav5L+d5p6XKQ==?= <Chris.Feng@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TWluZ2xpYW5nIFh1ICjlvpDmmI7kuq4p?= <mingliang.xu@mediatek.com>,
	=?utf-8?B?TWluIERvbmcgKOiRo+aVjyk=?= <min.dong@mediatek.com>,
	"m.chetan.kumar@intel.com" <m.chetan.kumar@intel.com>,
	"linuxwwan@mediatek.com" <linuxwwan@mediatek.com>,
	=?utf-8?B?TGlhbmcgTHUgKOWQleS6rik=?= <liang.lu@mediatek.com>,
	=?utf-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>,
	=?utf-8?B?SGFvemhlIENoYW5nICjluLjmtanlk7Ip?= <Haozhe.Chang@mediatek.com>,
	=?utf-8?B?SHVhIFlhbmcgKOadqOWNjik=?= <Hua.Yang@mediatek.com>,
	"linuxwwan@intel.com" <linuxwwan@intel.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "johannes@sipsolutions.net"
	<johannes@sipsolutions.net>, =?utf-8?B?VGluZyBXYW5nICjnjovmjLop?=
	<ting.wang@mediatek.com>, "edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	=?utf-8?B?QWlkZW4gV2FuZyAo546L5ZKP6bqSKQ==?= <Aiden.Wang@mediatek.com>,
	=?utf-8?B?RmVsaXggQ2hlbiAo6ZmI6Z2eKQ==?= <Felix.Chen@mediatek.com>,
	=?utf-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	=?utf-8?B?TWluZ2NodWFuZyBRaWFvICjkuZTmmI7pl68p?=
	<Mingchuang.Qiao@mediatek.com>, =?utf-8?B?R3VvaGFvIFpoYW5nICjlvKDlm73osaop?=
	<Guohao.Zhang@mediatek.com>, =?utf-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?=
	<Xiayu.Zhang@mediatek.com>
Subject: Re: [PATCH net-next v1 01/13] net: wwan: tmi: Add PCIe core
Thread-Topic: [PATCH net-next v1 01/13] net: wwan: tmi: Add PCIe core
Thread-Index: AQHY/mOOLXwwV7yd6EmMw/xxfngMlK5eJmEAgAOlhQA=
Date: Wed, 7 Dec 2022 02:33:54 +0000
Message-ID: <8878ed64fadfda9b3d3c8cd8b4564dd9019349b6.camel@mediatek.com>
References: <20221122111152.160377-1-yanchao.yang@mediatek.com>
	 <20221122111152.160377-2-yanchao.yang@mediatek.com>
	 <64aada78-8029-1b05-b802-a005549503c9@gmail.com>
In-Reply-To: <64aada78-8029-1b05-b802-a005549503c9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6161:EE_|KL1PR03MB6060:EE_
x-ms-office365-filtering-correlation-id: 0f52c9f4-d411-4211-72fd-08dad7fb7c47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MzaIkQomY2sVmkzsPpo14jJ5ko0e6kowbGekTAHv5mBDA2gujSrPRPDAtjM2pSdywXHycmkoSx5rHvbylfhDKLxP5kKsE8bAieekTkQRQJZrPQ3Roi0gAOKKW0kGKbD90gOnR55PPHy7eAH430ZeLfL1SiYcAHRrquAf9ECinko4H1LC6+7zRrBHGEHqBRCI5hvN2Z3UtRyyrRILbqUdsahGscJILcJl2i15RQAlJcQpFE0fi51Q+mrFsqucKlbjQCapazNohWv+M0wVX4aH8GCQt7EK+zyH2daSBzaAHyjkfxSQ6281TqVkknoY5FKRBZo3fknhlZ2vnA62D0wSSLJWK6RuxkHrqcrLYCIZjDBHMhEyE0lk0lYMteRHITGPUwrYx4j83KBTcNhwrgOEMuFNRfCw6I9B5/ClLT2/4NDTNDAEkV7ZtBJ6o3JMm3Hoa4ynvZC/fY6aFRFuYK1vkYpyvHkqj2nMd0tULAP5X5Vw2+47mVrVhGkEEn4Cekd1s8RrLLLgyh1WQGGOTk0KE3OKKTE5HT/y+hLd8zRrjSefVlebGRYljzWAgExxVsz8PQEQh63sx7nNz75ntPglbW55Au2+HLQcH5XonqeVe8yC09Yq3l/8at0LwTLF8f7uwiybKpy2FLbhyf+S7uKXX+AA9P9qWYQe75AF2A1SBel04BNGHEWKZfwuWZrRy8M7yIn8ZhI78kyynrmkr5dOb4VvudaAkPFgo15/bYQybcI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6161.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(85182001)(36756003)(5660300002)(91956017)(8936002)(86362001)(4326008)(41300700001)(2906002)(38070700005)(7416002)(122000001)(83380400001)(66476007)(54906003)(316002)(76116006)(66446008)(6486002)(2616005)(66556008)(66946007)(6916009)(71200400001)(38100700002)(8676002)(107886003)(478600001)(186003)(6506007)(6512007)(53546011)(26005)(64756008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDdraDREWjhGb01Pd3BEVGhlY0p3UzEyVU9xL0ZibjV1U2JqUHVWaWJnbXJP?=
 =?utf-8?B?R1lyWm9Eb2c3dFh2NUFlVGd5S2NsQTNCSXJKVytWOE54VGZ0blV0aktYanpM?=
 =?utf-8?B?U2lXOTR5d3RMT2N5VnRReW9NckVoRS9heFRGeVRpM1owM3RPQWd4NWtqMUtu?=
 =?utf-8?B?R3ByU0Vuc1ZLV3FoWHM4S2JHZ3pxYVRpNGo4ZXFpcllNY2ZISFNZZ08yT2VF?=
 =?utf-8?B?NmhVanRqRy9CNm9rQXdpUmJYc1dwVDRQQTFLZm5kdWxoMjd6alU2L3gvSS9r?=
 =?utf-8?B?eGN1WTdxZ25CdldJOXRmY3dlSUsrbUdmOVdORUQzN0VTUncxY3BCWjBxcG5B?=
 =?utf-8?B?SSt5OWlMMWkvc1dTNlhZQnhtRzducXF3Q0VFalU1bUw2b0xJS1ZIK1VBV0lS?=
 =?utf-8?B?Snl3WjNTeUhLVFA5SlFxSWdwUDhFbEVhdVBTMFRVWGRwemQ5Y2x6OUxVaXdm?=
 =?utf-8?B?YWxaV2kzdmZCQ0FjdHVpdU5lTVJpTUZ3YzR2STM3SGFEVXI5dEdkUzRDeGdU?=
 =?utf-8?B?YVg2SGtvRHl6OUw3YlJVdVpHMjlUOHdoOXJuZUVlbGdXdUNoWmQvcWQ0UHJI?=
 =?utf-8?B?SldlN3MwZ3JITXUvSUgzaWh2RndlZjF6Vk5BdElTalR5b2dadkpscDBSVC9y?=
 =?utf-8?B?a3FLQ1J1RjM1R1VFMVdRdHNhZFJhekhkTE9xM2ZhTUhJUS9IalBNNkI5NnRX?=
 =?utf-8?B?R0NydXBhczNESlVwTlg0aVk3eDBlRk4yTVdxeVlNYTRZOFVMOVQzaitQV2xE?=
 =?utf-8?B?amZUOVBpS2kwT3l1ZW04ODRhcG85UlZFUE9Ia1lOZVFzUytmbXp6VHdBcnJT?=
 =?utf-8?B?YXZUVFg4T0xqVm1GQWVYbGhQcGVuK0lJb2dqVUtDMzczYnJ5MzdUekk0aFFM?=
 =?utf-8?B?aXc3OU1VbzZaQXdLUnJRRjdMUUs2dkNSR2JYQWh5VFZWTkxQdFhKclIzL3B5?=
 =?utf-8?B?bEhSdG4yVHBTNHdrQndpcWpjc3VXV0k4UStiMFBadDJ4U0NWaDFpMkhZaTFk?=
 =?utf-8?B?ZktFMEVHYUVpcWRsT0d4b1FUS1ZiQ2gxK1dEU1pIUmZCVDZLU0NwTG9wcGFr?=
 =?utf-8?B?RUtIbVYzM3dHM1BDNGxDdWNOaWJsQW80bUVaTUhoZ3lJOWFKbTR2azRhTzYz?=
 =?utf-8?B?U2N5SnV5bWNtNXlaQmJUU3FxZzgwQ0k0dmUzSnowL2h6MC9QUDVhZGF6NlMw?=
 =?utf-8?B?UkVybEFRMTQ0Sk9PYkVXdEhYOGZrd3d4OVVlRVQ5ZFEzUDZSWmhwVDQzdDRq?=
 =?utf-8?B?L1k4ZmdKcERLREdWOGJ1cnM0aXBvUWtrK3c0dllDeHEyKzVpMVlCZHF3amtx?=
 =?utf-8?B?dUZKQkc1ZXRZOHUyeDZ2dGtXeXV2VTN4SnRQd0tZZnUwRlhoYVp4M2ZYREYx?=
 =?utf-8?B?aG5JOXAwS29uQi9UdVdrdnYweTBDVTU4M2haa1plYytrNGVjU2MwcWhpeWpM?=
 =?utf-8?B?eCsrT0dUVWdJWjM1NG14YkZ4RTVFa2U4YlloVXFBV3l2SnVCb0pjSTdHK2ta?=
 =?utf-8?B?dVpIQ2lCS1E1bWE5TkNrLzNySmowZUxxMFJldnNnenRmYWZhbVdYdDJYM0VE?=
 =?utf-8?B?QWc0TnFCcXc2Nzd6VjlvdVExeUFVcUMxejNVM2VNSC9UOTJXcHhObnRuWWhO?=
 =?utf-8?B?WWlFc24ybWdVYVprZ3drbUJqYkFsazhXNTkybUJvY0ovZ0U1RFVlOFpYZ3Ry?=
 =?utf-8?B?c1ROOEVMbzErenByYXh4T243aG1ncEVYMVh6Rmw2M3NpWUZCY3VqS2YrOXJp?=
 =?utf-8?B?UzYrRlpvcUU1anlqWFVFY29qVHJrMEFnSzF2cm02RFZOb3JWYUswdVl2Lzl6?=
 =?utf-8?B?dW0wdzU1T0gvYjJMNXV1QUY2VDAwd0REK3ZlRFlIM0E0UjN0dUdkMnFrTC9R?=
 =?utf-8?B?aEh2RjUxT0pBRzl5UGtjeVNkN1UvWU1oQjJoY1lOUUluaGd4TGFSQUNTTUp2?=
 =?utf-8?B?UHlndFlSNHN1WmtvZWN2blUzMVo1TWVWODZ3MHB0NDJKNHM4b1g1dUk5ZTNU?=
 =?utf-8?B?SXp0cS9CYXRyTXdWRTlDUkdPM01LS1FlT0xFbW9tdnBCb05GR3FycEY0eEh3?=
 =?utf-8?B?V050UHhLYzYyK0hMNTQ4RlduOUJadVhWcXVJZ1Q0dWdzdXprcGZUMk41RFBv?=
 =?utf-8?B?SisxbGxpaHRObmJJNmcxV3hBV2FsZXR4K0RFMmNvdlJTcFQ5TnFJR0dOaGMz?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E04DF7CE52B8D4B92C2D5A8FE9241EF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6161.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f52c9f4-d411-4211-72fd-08dad7fb7c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 02:33:54.7542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7ZCCjC1G8+2m5XnXx5XRNACSYO9xUjxnLZP5q1/Nkz7dlc6fBtNyOiqNlmwjtS5lAzQ7R7pT1W0YSg+/kLJLcCfFSvFiqWTucuooK395Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6060
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_184438_374421_1302E011 
X-CRM114-Status: GOOD (  21.16  )
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

SGVsbG8gU2VyZ2V5LA0KDQpPbiBTdW4sIDIwMjItMTItMDQgYXQgMjI6NTIgKzA0MDAsIFNlcmdl
eSBSeWF6YW5vdiB3cm90ZToNCj4gSGVsbG8gWWFuY2hhbywNCj4gDQo+IE9uIDIyLjExLjIwMjIg
MTU6MTEsIFlhbmNoYW8gWWFuZyB3cm90ZToNCj4gPiBGcm9tOiBNZWRpYVRlayBDb3Jwb3JhdGlv
biA8bGludXh3d2FuQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBSZWdpc3RlcnMgdGhlIFRNSSBk
ZXZpY2UgZHJpdmVyIHdpdGggdGhlIGtlcm5lbC4gU2V0IHVwIGFsbCB0aGUNCj4gPiBmdW5kYW1l
bnRhbA0KPiA+IGNvbmZpZ3VyYXRpb25zIGZvciB0aGUgZGV2aWNlOiBQQ0llIGxheWVyLCBNb2Rl
bSBIb3N0IENyb3NzIENvcmUNCj4gPiBJbnRlcmZhY2UNCj4gPiAoTUhDQ0lGKSwgUmVzZXQgR2Vu
ZXJhdGlvbiBVbml0IChSR1UpLCBtb2RlbSBjb21tb24gY29udHJvbA0KPiA+IG9wZXJhdGlvbnMg
YW5kDQo+ID4gYnVpbGQgaW5mcmFzdHJ1Y3R1cmUuDQo+ID4gDQo+ID4gKiBQQ0llIGxheWVyIGNv
ZGUgaW1wbGVtZW50cyBkcml2ZXIgcHJvYmUgYW5kIHJlbW92YWwsIE1TSS1YDQo+ID4gaW50ZXJy
dXB0DQo+ID4gaW5pdGlhbGl6YXRpb24gYW5kIGRlLWluaXRpYWxpemF0aW9uLCBhbmQgdGhlIHdh
eSBvZiByZXNldHRpbmcgdGhlDQo+ID4gZGV2aWNlLg0KPiA+ICogTUhDQ0lGIHByb3ZpZGVzIGlu
dGVycnVwdCBjaGFubmVscyB0byBjb21tdW5pY2F0ZSBldmVudHMgc3VjaCBhcw0KPiA+IGhhbmRz
aGFrZSwNCj4gPiBQTSBhbmQgcG9ydCBlbnVtZXJhdGlvbi4NCj4gPiAqIFJHVSBwcm92aWRlcyBp
bnRlcnJ1cHQgY2hhbm5lbHMgdG8gZ2VuZXJhdGUgbm90aWZpY2F0aW9ucyBmcm9tDQo+ID4gdGhl
IGRldmljZQ0KPiA+IHNvIHRoYXQgdGhlIFRNSSBkcml2ZXIgY291bGQgZ2V0IHRoZSBkZXZpY2Ug
cmVzZXQuDQo+ID4gKiBNb2RlbSBjb21tb24gY29udHJvbCBvcGVyYXRpb25zIHByb3ZpZGUgdGhl
IGJhc2ljIHJlYWQvd3JpdGUNCj4gPiBmdW5jdGlvbnMgb2YNCj4gPiB0aGUgZGV2aWNlJ3MgaGFy
ZHdhcmUgcmVnaXN0ZXJzLCBtYXNrL3VubWFzay9nZXQvY2xlYXIgZnVuY3Rpb25zIG9mDQo+ID4g
dGhlDQo+ID4gZGV2aWNlJ3MgaW50ZXJydXB0IHJlZ2lzdGVycyBhbmQgaW5xdWlyeSBmdW5jdGlv
bnMgb2YgdGhlIGRldmljZSdzDQo+ID4gc3RhdHVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IFRpbmcgV2FuZyA8dGluZy53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBN
ZWRpYVRlayBDb3Jwb3JhdGlvbiA8bGludXh3d2FuQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvbmV0L3d3YW4vS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgIDExICsNCj4g
PiAgIGRyaXZlcnMvbmV0L3d3YW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgICAxICsNCj4g
PiAgIGRyaXZlcnMvbmV0L3d3YW4vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgfCAgIDEyICsNCj4g
PiAgIGRyaXZlcnMvbmV0L3d3YW4vbWVkaWF0ZWsvbXRrX2NvbW1vbi5oICAgfCAgIDMwICsNCj4g
PiAgIGRyaXZlcnMvbmV0L3d3YW4vbWVkaWF0ZWsvbXRrX2Rldi5jICAgICAgfCAgIDUwICsNCj4g
PiAgIGRyaXZlcnMvbmV0L3d3YW4vbWVkaWF0ZWsvbXRrX2Rldi5oICAgICAgfCAgNTAzICsrKysr
KysrKysNCj4gPiAgIGRyaXZlcnMvbmV0L3d3YW4vbWVkaWF0ZWsvcGNpZS9tdGtfcGNpLmMgfCAx
MTY0DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgZHJpdmVycy9uZXQvd3dhbi9t
ZWRpYXRlay9wY2llL210a19wY2kuaCB8ICAxNTAgKysrDQo+ID4gICBkcml2ZXJzL25ldC93d2Fu
L21lZGlhdGVrL3BjaWUvbXRrX3JlZy5oIHwgICA2OSArKw0KPiA+ICAgOSBmaWxlcyBjaGFuZ2Vk
LCAxOTkwIGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25l
dC93d2FuL21lZGlhdGVrL01ha2VmaWxlDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9uZXQvd3dhbi9tZWRpYXRlay9tdGtfY29tbW9uLmgNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL25ldC93d2FuL21lZGlhdGVrL210a19kZXYuYw0KPiA+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbmV0L3d3YW4vbWVkaWF0ZWsvbXRrX2Rldi5oDQo+ID4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9uZXQvd3dhbi9tZWRpYXRlay9wY2llL210a19wY2kuYw0KPiA+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbmV0L3d3YW4vbWVkaWF0ZWsvcGNpZS9tdGtf
cGNpLmgNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC93d2FuL21lZGlhdGVr
L3BjaWUvbXRrX3JlZy5oDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3d3YW4v
S2NvbmZpZyBiL2RyaXZlcnMvbmV0L3d3YW4vS2NvbmZpZw0KPiA+IGluZGV4IDM0ODZmZmU5NGFj
NC4uYTkzYTBjNTExZDUwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3d3YW4vS2NvbmZp
Zw0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3d3YW4vS2NvbmZpZw0KPiA+IEBAIC0xMTksNiArMTE5
LDE3IEBAIGNvbmZpZyBNVEtfVDdYWA0KPiA+ICAgDQo+ID4gICAJICBJZiB1bnN1cmUsIHNheSBO
Lg0KPiA+ICAgDQo+ID4gK2NvbmZpZyBNVEtfVE1JDQo+ID4gKwl0cmlzdGF0ZSAiVE1JIERyaXZl
ciBmb3IgTWVkaWF0ZWsgVC1zZXJpZXMgRGV2aWNlIg0KPiA+ICsJZGVwZW5kcyBvbiBQQ0kNCj4g
PiArCWhlbHANCj4gPiArCSAgVGhpcyBkcml2ZXIgZW5hYmxlcyBNZWRpYXRlayBULXNlcmllcyBX
V0FOIERldmljZQ0KPiA+IGNvbW11bmljYXRpb24uDQo+ID4gKw0KPiA+ICsJICBJZiB5b3UgaGF2
ZSBvbmUgb2YgdGhvc2UgTWVkaWF0ZWsgVC1zZXJpZXMgV1dBTiBNb2R1bGVzIGFuZA0KPiA+IHdp
c2ggdG8NCj4gPiArCSAgdXNlIGl0IGluIExpbnV4IHNheSBZL00gaGVyZS4NCj4gDQo+ICBGcm9t
IHRoaXMgYW5kIHRoZSBzZXJpZXMgZGVzY3JpcHRpb25zLCBpdCBpcyB1bmNsZWFyIHdoaWNoIG1v
ZGVtDQo+IGNoaXBzIA0KPiB0aGlzIGRyaXZlciBpcyBpbnRlbmRlZCBmb3IgYW5kIGhvdyBkb2Vz
IGl0IGNvcnJlbGF0ZSB3aXRoIHRoZSBUN3h4IA0KPiBkcml2ZXI/IElzIHRoZSBUTUkgZHJpdmVy
IGEgZHJvcC1pbiByZXBsYWNlbWVudCBmb3IgdGhlIHQ3eHggZHJpdmVyLA0KPiBvciANCj4gZG9l
cyB0aGUgVE1JIGRyaXZlciBzdXBwb3J0IGFueSBULXNlcmllcyBjaGlwcyBleGNlcHQgdDd4eD8N
ClRoZSBkcml2ZXIgaXMgaW50ZW5kZWQgZm9yIHQ4eHggb3IgbGF0ZXIgVC1zZXJpZXMgbW9kZW0g
Y2hpcHMgaW4gdGhlDQpmdXR1cmUuIEN1cnJlbnRseSwgdDd4eCBpcyBub3Qgc3VwcG9ydC4NCj4g
DQo+ID4gKw0KPiA+ICsJICBJZiB1bnN1cmUsIHNheSBOLg0KPiA+ICsNCj4gPiAgIGVuZGlmICMg
V1dBTg0KPiA+ICAgDQo+ID4gICBlbmRtZW51DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3d3YW4vTWFrZWZpbGUgYi9kcml2ZXJzL25ldC93d2FuL01ha2VmaWxlDQo+ID4gaW5kZXggMzk2
MGMwYWUyNDQ1Li4xOThkODA3NDg1MWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvd3dh
bi9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3d3YW4vTWFrZWZpbGUNCj4gPiBAQCAt
MTQsMyArMTQsNCBAQCBvYmotJChDT05GSUdfUUNPTV9CQU1fRE1VWCkgKz0gcWNvbV9iYW1fZG11
eC5vDQo+ID4gICBvYmotJChDT05GSUdfUlBNU0dfV1dBTl9DVFJMKSArPSBycG1zZ193d2FuX2N0
cmwubw0KPiA+ICAgb2JqLSQoQ09ORklHX0lPU00pICs9IGlvc20vDQo+ID4gICBvYmotJChDT05G
SUdfTVRLX1Q3WFgpICs9IHQ3eHgvDQo+ID4gK29iai0kKENPTkZJR19NVEtfVE1JKSArPSBtZWRp
YXRlay8NCj4gDQo+IFRoZSBkcml2ZXIgaXMgY2FsbGVkIG10a190bWksIGJ1dCBpdHMgY29kZSBp
cyBwbGFjZWQgdG8gdGhlDQo+IGRpcmVjdG9yeSANCj4gd2l0aCB0b28gZ2VuZXJpYyBuYW1lICdt
ZWRpYXRlaycuIERvIHlvdSBwbGFuIHRvbyBrZWVwIGFsbCBwb3NzaWJsZSANCj4gZnV0dXJlIGRy
aXZlcnMgaW4gdGhpcyBkaXJlY3Rvcnk/DQpZZXMsIHdlIHBsYW4gdG8gcHV0IGFsbCBtZWRpYXRl
aydzIHd3YW4gZHJpdmVyIGludG8gdGhlIHNhbWUgZGlyZWN0b3J5Lg0KQ3VycmVudGx5LCB0aGVy
ZSBpcyBvbmx5IFQtc2VyaWVzIG1vZGVtIGRyaXZlci4gU28gd2UgZG9uJ3QgY3JlYXRlDQondG1p
JyBmb2xkZXIgdW5kZXIgJ21lZGlhdGVrJyBkaXJlY3RvcnkgZXhwbGljaXRseS4NCj4gDQo+IC0t
DQo+IFNlcmdleQ0KDQpNYW55IHRoYW5rcy4NCllhbmNoYW8ueWFuZw0K

