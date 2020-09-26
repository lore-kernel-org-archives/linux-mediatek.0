Return-Path: <SRS0=Ny8c=DD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7089AC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Sep 2020 17:12:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8B820789
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Sep 2020 17:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNp1oKjR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ERhpLLwM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D8B820789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3QyOJgBDotSlJfTqUe0tH9Yugrhl09HG2cr1160CMXE=; b=KNp1oKjRgoeHW/cC0enjQwwkT
	ZvvsbV0JoebGosTJDygWyuageGILEaGzg1m4drwmXwdBS4GzZ/r6201zVcmp6HrRfGOLVQc7bdsPg
	xtVESgP/BOkPihDqTl32aClOqTN9u+IW/5S/Cvca1TjZ0F0KB6OfCnX/xJCesXUHpcNKYUfmlTqo8
	B+jCmBuN8nk7tVCkMpQedOoZeUk0eFpFn1/TTLc1FmQiBJA/yt1cX9RdKMooW1lzFloZL/mX8UqKp
	L3TN12TVInoxcTyNwyKNFCoL677iuB5iy5gyab/bptBD3fsPIchgRAhKhD21h4y4qtyEIXjfKiHpF
	6W8xkeHTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMDkD-0005QF-OS; Sat, 26 Sep 2020 17:12:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMDk8-0005PS-E2; Sat, 26 Sep 2020 17:12:18 +0000
X-UUID: 77cbe579846a479aa9fbe7bc59685f28-20200926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ftBotKe73TtK65EhVOkqgCswQ7tnRRnYOTiRhxGmAnU=; 
 b=ERhpLLwMmjPQQd9FApwv/3I45ag0P/1it/RkPOLL0SwkjyiDBVHNSC1u5lJdG8biv6AYfhtd3H4zVAc4kt0XhgxMpdYu6Pa2piaqh35m4qG7xF704MtORiqsBsi4psLCslpPFbFaf2DyHjRDW3EV/p8GrZVWg9yiiJKUg5hx/NM=;
X-UUID: 77cbe579846a479aa9fbe7bc59685f28-20200926
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 446031254; Sat, 26 Sep 2020 09:12:08 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Sep 2020 10:12:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 01:11:51 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 27 Sep 2020 01:11:52 +0800
Message-ID: <1601140312.15228.12.camel@mtksdccf07>
Subject: Re: [PATCH v4 1/6] timer: kasan: record timer stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Sun, 27 Sep 2020 01:11:52 +0800
In-Reply-To: <87wo0htqco.fsf@nanos.tec.linutronix.de>
References: <20200924040335.30934-1-walter-zh.wu@mediatek.com>
 <87h7rm97js.fsf@nanos.tec.linutronix.de>
 <1601018323.28162.4.camel@mtksdccf07>
 <87lfgyutf8.fsf@nanos.tec.linutronix.de>
 <1601025346.2255.2.camel@mtksdccf07>
 <87wo0htqco.fsf@nanos.tec.linutronix.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_131216_598003_D11BB821 
X-CRM114-Status: GOOD (  17.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Marco Elver <elver@google.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Alexander
 Potapenko <glider@google.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Andrey
 Konovalov <andreyknvl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLA0KDQpPbiBTYXQsIDIwMjAtMDktMjYgYXQgMDA6NTkgKzAyMDAsIFRob21hcyBH
bGVpeG5lciB3cm90ZToNCj4gT24gRnJpLCBTZXAgMjUgMjAyMCBhdCAxNzoxNSwgV2FsdGVyIFd1
IHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAyMC0wOS0yNSBhdCAxMDo1NSArMDIwMCwgVGhvbWFzIEds
ZWl4bmVyIHdyb3RlOg0KPiA+PiA+IFdlIGRvbid0IHdhbnQgdG8gcmVwbGFjZSBERUJVR19PQkpF
Q1RTX1RJTUVSUyB3aXRoIHRoaXMgcGF0Y2hlcywgb25seQ0KPiA+PiA+IGhvcGUgdG8gdXNlIGxv
dyBvdmVyaGVhZChjb21wYXJlIHdpdGggREVCVUdfT0JKRUNUU19USU1FUlMpIHRvIGRlYnVnDQo+
ID4+IA0KPiA+PiBLQVNBTiBoYXMgbG93ZXIgb3ZlcmhlYWQgdGhhbiBERUJVR19PQkpFQ1RTX1RJ
TUVSUz8gTWF5YmUgaW4gYSBkaWZmZXJlbnQNCj4gPj4gdW5pdmVyc2UuDQo+ID4+IA0KPiA+IEkg
bWVhbiBLQVNBTiArIG91ciBwYXRjaCB2cyBLQVNBTiArIERFQlVHX09CSkVDVFNfVElNRVJTLiBU
aGUgZnJvbnQgb25lDQo+ID4gaGF2ZSB0aGUgaW5mb3JtYXRpb24gdG8gdGhlIG9yaWdpbmFsIGNh
bGxlciBhbmQgaGVscCB0byBkZWJ1Zy4gSXQgaXMNCj4gPiBzbWFsbGVyIG92ZXJoZWFkIHRoYW4g
dGhlIG9uZSBiZWhpbmQuDQo+IA0KPiBGb3IgT05FIHNwZWNpZmljIHByb2JsZW0gcmVsYXRlZCB0
byB0aW1lcnMgYW5kIHlvdSBoYXZlIHN0aWxsIG5vdCBzaG93bg0KPiBhIHNpbmdsZSB1c2VmdWwg
ZGVidWcgb3V0cHV0IHdoZXJlIHRoaXMgaW5mb3JtYXRpb24gaGVscHMgdG8gZGVidWcNCj4gYW55
dGhpbmcuDQo+IA0KPiA+IEkgYWdyZWUgeW91ciBzYXlpbmcsIHNvIHRoYXQgSSBuZWVkIHRvIGZp
bmQgb3V0IGEgdXNlIGNhc2UgdG8gZXhwbGFpbiB0bw0KPiA+IHlvdS4NCj4gDQo+IEluZGVlZC4N
Cj4gDQoNCkZpcnN0LCBJIHRoaW5rIHRoZSBjb21taXQgbG9nIOKAnEJlY2F1c2UgaWYgdGhlIFVB
RiByb290IGNhdXNlIGlzIGluIHRpbWVyDQppbml0IOKApuKAnSBuZWVkcyB0byBiZSByZW1vdmVk
LCB0aGlzIHBhdGNoIGhvcGVzIHRvIGhlbHAgcHJvZ3JhbW1lciBnZXRzDQp0aW1lciBjYWxsYmFj
ayBpcyB3aGVyZSBpcyByZWdpc3RlcmVkLiBJdCBpcyB1c2VmdWwgb25seSBpZiBmcmVlIHN0YWNr
DQppcyBjYWxsZWQgZnJvbSB0aW1lciBjYWxsYmFjaywgYmVjYXVzZSBwcm9ncmFtbWVyIGNhbiBz
ZWUgd2h5ICYgd2hlcmUNCnJlZ2lzdGVyIHRoaXMgZnVuY3Rpb24uDQoNClNlY29uZCwgc2VlIFsx
XSwgaXQgc2hvdWxkIHNhdGlzZmllcyBmaXJzdCBwb2ludC4gVGhlIGZyZWUgc3RhY2sgaXMgZnJv
bQ0KdGltZXIgY2FsbGJhY2ssIGlmIHdlIGtub3cgd2hlcmUgcmVnaXN0ZXIgdGhpcyBmdW5jdGlv
biwgdGhlbiBpdCBzaG91bGQNCmJlIHVzZWZ1bCB0byBzb2x2ZSBVQUYuDQoNClsxXWh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8wMDAwMDAwMDAwMDA1OTBmNmIwNWExYzA1ZDE1QGdv
b2dsZS5jb20vDQoNCg0KDQpUaGFua3MNCg0KV2FsdGVyDQoNCg0KDQoNCg0KPiBUaGFua3MsDQo+
IA0KPiAgICAgICAgIHRnbHgNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
