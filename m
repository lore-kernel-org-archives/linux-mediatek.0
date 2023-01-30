Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE97C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVigDApY7un8h6ML6ZZo1sBlsnNbAz456+hqa7hB+dw=; b=NKxtE0An/h+KjTGiXcu+8MdBji
	P7YK0v86s1HBMJ6Gq+4PRDzc0PU3B/RecYJ9QAEZcgUrHkxuehR1zoezZrPNI9jzSb402yINSQKYR
	iOhFMvEGXH6wxnZvETAJynDqSix4nh1BTyvmKiMBc9QP1vgXSO3CkUOVC+Kokqjai1ZUfOGmSCRGX
	Qua8E07SMfIZV3ooqIFCvKjAjq1h7K9Y/fcshUMVa4cWXAbTMFMSYX+ze1q/2/9hj5X52T8vLrCxp
	iRWYnSS0CCSs3d00nwo5BtyrdfkqcPeIFXzCGc/+GSjsJBgINyrecjouI112CJuz4drR/5Qnnlq0J
	AnhLPKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWnr-004BXw-5m; Mon, 30 Jan 2023 16:14:43 +0000
Received: from e10edge.fintech.ru ([195.54.195.159] helo=exchange.fintech.ru)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWmm-004BOw-SM
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 16:13:38 +0000
Received: from Ex16-02.fintech.ru (10.0.10.19) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 30 Jan
 2023 19:13:12 +0300
Received: from Ex16-01.fintech.ru (10.0.10.18) by Ex16-02.fintech.ru
 (10.0.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 30 Jan
 2023 19:13:11 +0300
Received: from Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9]) by
 Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9%7]) with mapi id
 15.01.2242.004; Mon, 30 Jan 2023 19:13:11 +0300
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
Thread-Index: AQHZNKePV9Tuf82zRk2tMrTfyN8UZK62u2sAgAA3O6D//9G7AIAANNZg///R24CAAFTb4A==
Date: Mon, 30 Jan 2023 16:13:11 +0000
Message-ID: <bbd1ce753d8144ee9d4d9da7f3033c68@fintech.ru>
References: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
 <20230130123655.86339-2-n.zhandarovich@fintech.ru>
 <Y9fAkt/5BRist//g@kroah.com> <b945bd5f3d414ac5bc589d65cf439f7b@fintech.ru>
 <Y9fIFirNHNP06e1L@kroah.com> <e17c785dbacf4605a726cc939bee6533@fintech.ru>
 <Y9fNs5QWbrJh+yH6@kroah.com>
In-Reply-To: <Y9fNs5QWbrJh+yH6@kroah.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.253.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_081336_934623_45FCF7CB 
X-CRM114-Status: GOOD (  11.81  )
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

PiA+ID4gV2hhdCBpcyB0aGUgImZhdWx0Ij8NCj4gPg0KPiA+IEluIDUuMTAueSAibXQ3NjE1X2lu
aXRfdHhfcXVldWVzKCkgcmV0dXJucyAwIHJlZ2FyZGxlc3Mgb2YgaG93IGZpbmFsDQo+ID4gbXQ3
NjE1X2luaXRfdHhfcXVldWUoKSBwZXJmb3Jtcy4gSWYgbXQ3NjE1X2luaXRfdHhfcXVldWUoKSBm
YWlscyAoZHVlDQo+ID4gdG8gbWVtb3J5IGlzc3VlcywgZm9yIGluc3RhbmNlKSwgcGFyZW50IGZ1
bmN0aW9uIHdpbGwgc3RpbGwNCj4gPiBlcnJvbmVvdXNseSByZXR1cm4gMC4iDQo+IA0KPiBBbmQg
aG93IGNhbiBtZW1vcnkgaXNzdWVzIGFjdHVhbGx5IGJlIHRyaWdnZXJlZCBpbiBhIHJlYWwgc3lz
dGVtPyAgSXMgdGhpcyBhDQo+IGZha2UgcHJvYmxlbSBvciBzb21ldGhpbmcgeW91IGNhbiB2YWxp
ZGF0ZSBhbmQgdmVyaWZ5IHdvcmtzIHByb3Blcmx5Pw0KPiANCj4gRG9uJ3Qgd29ycnkgYWJvdXQg
ZmFrZSBpc3N1ZXMgZm9yIHN0YWJsZSBiYWNrcG9ydHMgcGxlYXNlLg0KPiANCj4gdGhhbmtzLA0K
PiANCj4gZ3JlZyBrLWgNCg0KbXQ3NjE1X2luaXRfdHhfcXVldWUoKSBjYWxscyBkZXZtX2t6YWxs
b2MoKSAod2hpY2ggY2FuIHRocm93IC1FTk9NRU0pIGFuZCBtdDc2X3F1ZXVlX2FsbG9jKCkgKHdo
aWNoIGNhbiBhbHNvIGZhaWwpLiBJdCdzIGhhcmQgZm9yIG1lIHRvIGdhdWdlIGhvdyBwcm9iYWJs
ZSB0aGVzZSBmYWlsdXJlcyBjYW4gYmUuIEJ1dCBJIGZlZWwgbGlrZSBhdCB0aGUgdmVyeSBsZWFz
dCBpdCdzIGEgbG9naWNhbCBzYW5pdHkgY2hlY2suIA0KDQpAQCAtODIsNyArODIsNyBAQCBtdDc2
MTVfaW5pdF90eF9xdWV1ZXMoc3RydWN0IG10NzYxNV9kZXYgKmRldikNCiAJDQogICAgICAgIHJl
dCA9IG10NzYxNV9pbml0X3R4X3F1ZXVlKGRldiwgTVRfVFhRX01DVSwgTVQ3NjE1X1RYUV9NQ1Us
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1UNzYxNV9UWF9NQ1VfUklOR19T
SVpFKTsNCiAgICAgICByZXR1cm4gMDsNCg0KVGhlcmUgaXMgbm8gc3BlY2lhbCByZWFzb24gIGZv
ciBtdDc2MTVfaW5pdF90eF9xdWV1ZXMoKSB0byBpZ25vcmUgbGFzdCAncmV0Jy4gSWYgbGFzdCBt
dDc2MTVfaW5pdF90eF9xdWV1ZSgpLCBzbyBzaG91bGQgbXQ3NjE1X2luaXRfdHhfcXVldWVzKCku
IEFuZCB1cHN0cmVhbSBwYXRjaCAoYjY3MWRhMzNkMWM1OTczZjkwZjA5OGZmNjZhOTE5NTM2OTFk
ZjU4MikgYWRkcmVzc2VzIHRoaXMgYXMgd2VsbC4gDQpJZiB5b3UgZmVlbCBkaWZmZXJlbnRseSwg
SSB3aWxsIG9mIGNvdXJzZSBiYWNrIGRvd24uDQoNCnJlZ2FyZHMsDQoNCk5pa2l0YQ0K

