Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A772C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xoEy1Zy6cZLvrlDI4IgKYmUJ4eIq8ptFig1g0zdly4=; b=sA9A48iLQNAPpE2auKEGxi/9w0
	UvkBs+o3LIq3AQI4JAtpb0hpFY6xypCMA9vFpMEGXPmqjCt3s55t0MX+yAHU4KWltSeW71pAKGMa6
	lo/7Rb/qtpASDB6sVoTMSZlBtjERGnVxSk16158LREI5W+z7tHUgKogL+Hu8/ShopmtvE7/JmwfNm
	GUZ2Ms+K3QsHH3SCp8Iu/yf+hn48hyER1quuAVI39oilSdS0RDITsozaOgGLl4Um3nfDk5DMoMJVq
	ouBbHtFLHlSSm4brhi8ag5FFOIwiDITUdwOuScQ2D1rHmKUrnc25kvkaiJ9OuS8xcKf/MNfNdeNyz
	ABPQCLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUCk-003g02-J1; Mon, 30 Jan 2023 13:28:14 +0000
Received: from e10edge.fintech.ru ([195.54.195.159] helo=exchange.fintech.ru)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUC0-003fyv-RE
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 13:27:29 +0000
Received: from Ex16-02.fintech.ru (10.0.10.19) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 30 Jan
 2023 16:27:26 +0300
Received: from Ex16-01.fintech.ru (10.0.10.18) by Ex16-02.fintech.ru
 (10.0.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 30 Jan
 2023 16:27:26 +0300
Received: from Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9]) by
 Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9%7]) with mapi id
 15.01.2242.004; Mon, 30 Jan 2023 16:27:26 +0300
From: =?utf-8?B?0JbQsNC90LTQsNGA0L7QstC40Ycg0J3QuNC60LjRgtCwINCY0LPQvtGA0LU=?=
 =?utf-8?B?0LLQuNGH?= <n.zhandarovich@fintech.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Alexey
 Khoroshilov" <khoroshilov@ispras.ru>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: RE: [PATCH 5.10 1/1] mt76: fix mt7615_init_tx_queues() return value
Thread-Topic: [PATCH 5.10 1/1] mt76: fix mt7615_init_tx_queues() return value
Thread-Index: AQHZNKePV9Tuf82zRk2tMrTfyN8UZK62u2sAgAA3O6A=
Date: Mon, 30 Jan 2023 13:27:26 +0000
Message-ID: <b945bd5f3d414ac5bc589d65cf439f7b@fintech.ru>
References: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
 <20230130123655.86339-2-n.zhandarovich@fintech.ru>
 <Y9fAkt/5BRist//g@kroah.com>
In-Reply-To: <Y9fAkt/5BRist//g@kroah.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.253.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_052728_900026_A39F10E3 
X-CRM114-Status: UNSURE (   9.03  )
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

PiBXaGF0IGlzIHRoZSBnaXQgY29tbWl0IGlkIG9mIHRoaXMgdXBzdHJlYW0/DQo+IA0KPiBBbmQg
SSBjYW4ndCBhcHBseSB0aGlzIGFzLWlzIGZvciB0aGUgb2J2aW91cyByZWFzb24gaXQgd291bGQg
bWVzcyB1cCB0aGUNCj4gY2hhbmdlbG9nLCBob3cgZGlkIHlvdSBjcmVhdGUgdGhpcz8NCj4gDQo+
IGNvbmZ1c2VkLA0KPiANCj4gZ3JlZyBrLWgNCg0KQ29tbWl0IGluIHF1ZXN0aW9uIGlzIGI2NzFk
YTMzZDFjNTk3M2Y5MGYwOThmZjY2YTkxOTUzNjkxZGY1ODIgdXBzdHJlYW0uIEkgd2Fzbid0IGNl
cnRhaW4gaXQgbWFrZXMgc2Vuc2UgdG8gYmFja3BvcnQgdGhlIHdob2xlIHBhdGNoIGFzIG9ubHkg
YSBzbWFsbCBwb3J0aW9uIG9mIGl0IHBlcnRhaW5zIHRvIHRoZSBmYXVsdCBhdCBxdWVzdGlvbi4N
Cg0KV291bGQgYmUgZXh0cmVtZWx5IGdyYXRlZnVsIGZvciBkaXJlY3Rpb25zIGhvdyB0byBwcm9j
ZWVkIGZyb20gaGVyZS4NCg0Kc29tZXdoYXQgZW1iYXJyYXNzZWQsDQoNCk5pa2l0YQ0K

