Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25414C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 13:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pagLYVryC/IKfDYHJLZVJQyihcuWQZnu77ByaJ+g7Y=; b=2vubuNAyKkIyU8pzj0cMSDIYjD
	uazADpQ3pO5DNcjzVERV/enZ3/kSSGSM9aRKckw5M3P6hB/CMA9GN6ji/ReBNIVU/ICz01AFKa2mV
	8PiVTJ/6bFzDGaQtxRixe09t0Vzzr5WdXpikP3Ecl1z7M7J47zN94SyyZcXtbtG/fupRC66HpJUaL
	Zl0MW6T0HzmniI+Su+OIlXROnEzVeL/jsEkCIRZUFrPcY88sSSFXNopg8DgcR6HJ5pz88Gp/p3y6R
	Z5yY9PPtn+PGX8IX85L7dblD7wrHqyZqAqXFGRWi2FhWSZjmqbbS70SEipM5hqgTfyOjlYpYsg9wn
	uh3KOcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUX2-003kFp-IG; Mon, 30 Jan 2023 13:49:12 +0000
Received: from e10edge.fintech.ru ([195.54.195.159] helo=exchange.fintech.ru)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUWJ-003kDi-Pv
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 13:48:29 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 30 Jan
 2023 16:48:24 +0300
Received: from Ex16-01.fintech.ru (10.0.10.18) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 30 Jan
 2023 16:48:24 +0300
Received: from Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9]) by
 Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9%7]) with mapi id
 15.01.2242.004; Mon, 30 Jan 2023 16:48:24 +0300
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
Thread-Index: AQHZNKePV9Tuf82zRk2tMrTfyN8UZK62u2sAgAA3O6D//9G7AIAANNZg
Date: Mon, 30 Jan 2023 13:48:24 +0000
Message-ID: <e17c785dbacf4605a726cc939bee6533@fintech.ru>
References: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
 <20230130123655.86339-2-n.zhandarovich@fintech.ru>
 <Y9fAkt/5BRist//g@kroah.com> <b945bd5f3d414ac5bc589d65cf439f7b@fintech.ru>
 <Y9fIFirNHNP06e1L@kroah.com>
In-Reply-To: <Y9fIFirNHNP06e1L@kroah.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.253.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_054827_863001_75C2B53E 
X-CRM114-Status: GOOD (  14.73  )
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

PiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAwMToyNzoyNlBNICswMDAwLCDQltCw0L3QtNCw0YDQ
vtCy0LjRhyDQndC40LrQuNGC0LAg0JjQs9C+0YDQtdCy0LjRhw0KPiB3cm90ZToNCj4gPiA+IFdo
YXQgaXMgdGhlIGdpdCBjb21taXQgaWQgb2YgdGhpcyB1cHN0cmVhbT8NCj4gPiA+DQo+ID4gPiBB
bmQgSSBjYW4ndCBhcHBseSB0aGlzIGFzLWlzIGZvciB0aGUgb2J2aW91cyByZWFzb24gaXQgd291
bGQgbWVzcyB1cA0KPiA+ID4gdGhlIGNoYW5nZWxvZywgaG93IGRpZCB5b3UgY3JlYXRlIHRoaXM/
DQo+ID4gPg0KPiA+ID4gY29uZnVzZWQsDQo+ID4gPg0KPiA+ID4gZ3JlZyBrLWgNCj4gPg0KPiA+
IENvbW1pdCBpbiBxdWVzdGlvbiBpcyBiNjcxZGEzM2QxYzU5NzNmOTBmMDk4ZmY2NmE5MTk1MzY5
MWRmNTgyDQo+ID4gdXBzdHJlYW0uIEkgd2Fzbid0IGNlcnRhaW4gaXQgbWFrZXMgc2Vuc2UgdG8g
YmFja3BvcnQgdGhlIHdob2xlIHBhdGNoDQo+ID4gYXMgb25seSBhIHNtYWxsIHBvcnRpb24gb2Yg
aXQgcGVydGFpbnMgdG8gdGhlIGZhdWx0IGF0IHF1ZXN0aW9uLg0KPiANCj4gV2hhdCBpcyB0aGUg
ImZhdWx0Ij8NCg0KSW4gNS4xMC55ICJtdDc2MTVfaW5pdF90eF9xdWV1ZXMoKSByZXR1cm5zIDAg
cmVnYXJkbGVzcyBvZiBob3cgZmluYWwNCm10NzYxNV9pbml0X3R4X3F1ZXVlKCkgcGVyZm9ybXMu
IElmIG10NzYxNV9pbml0X3R4X3F1ZXVlKCkgZmFpbHMgKGR1ZSB0bw0KbWVtb3J5IGlzc3Vlcywg
Zm9yIGluc3RhbmNlKSwgcGFyZW50IGZ1bmN0aW9uIHdpbGwgc3RpbGwgZXJyb25lb3VzbHkNCnJl
dHVybiAwLiINCg0KVGhpcyB3YXMgZml4ZWQgdXBzdHJlYW0sIGFsdGhvdWdoIHRoYXQgcGFydGlj
dWxhciBjb21taXQncyBzY29wZSB3YXMgYnJvYWRlci4NCg0KPiBBbmQgd2h5IG5vdCB0YWtlIHRo
ZSB3aG9sZSB0aGluZz8gIFdoYXQncyB3cm9uZyB3aXRoIHRoYXQ/ICBXZSBhbG1vc3QNCj4gYWx3
YXlzIHdhbnQgdG8gdGFrZSB3aGF0ZXZlciBpcyBpbiBMaW51cydzIHRyZWUgYmVjYXVzZSB3aGVu
IHdlIGRvIG5vdCwgd2UNCj4gYWxtb3N0IGFsd2F5cyBjYXVzZSBidWdzIG9yIG90aGVyIHByb2Js
ZW1zIChsYXRlciBtZXJnZSBpc3N1ZXMuKQ0KPiANCj4gU28gYWx3YXlzIHRha2UgdGhlIG9yaWdp
bmFsIGZpeCBwbGVhc2UuDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGstaA0KDQpUaGF0IG1h
a2VzIHNlbnNlLCBvZiBjb3Vyc2UuIFRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSwgd2lsbCB3b3Jr
IHRvd2FyZCBiYWNrcG9ydGluZyB0aGUgd2hvbGUgdGhpbmcuDQoNCnJlZ2FyZHMsDQoNCk5pa2l0
YQ0K

