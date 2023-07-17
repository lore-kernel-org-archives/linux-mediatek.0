Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57EEC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH54V72aOY3ogSKUOINjMnAMtLyl5t2LpD7MwgpBD1k=; b=f9uZyVC3UypQoAoyogJb2KgLZv
	aSFxyWRGLkfRYcywkvkWRAtH8RuObW+iop0XkDsCIKkHY4PxEDCKMdrF6PiF0BJiS83774ztlu1Jg
	kmw25iu//gLgb4qDKGXgci17tPkZh/zS/o9xBfkZ1mBISwivHXu3N3G8z2SHO9JGQf+u1x/CIgcwa
	OQ9uL+x1zkHqKXkbSNL4sFAZNgJvGucqCJLmMCi3QPbYRsHbIlLKbLyEh+LYlMRl3UQMItH32txeC
	5zRWEADNt3ALTCKAwYvqZUTrNUmoO5/sUtP22UM1/qg+6r2pqkPh1t6AyoYrPKnUo3Z89kimNXD+v
	h4/6gG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0ve-005sDP-1n;
	Wed, 19 Jul 2023 06:44:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0vU-005s7F-17;
	Wed, 19 Jul 2023 06:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VH54V72aOY3ogSKUOINjMnAMtLyl5t2LpD7MwgpBD1k=; b=dN93Dx8Hg9jl700rhw4nauUJid
	HqSeJ8plWYGmtTdYra1gFhBCY5wYonA8jGyMeEF3cMtd0BH7lJ4BwDGipliCvJRPknBBNblMS3PEX
	hM9ghPqUGoI00+UzUUUSxISzzTobFsY1nHTb83rNd/StWgD9Qi++tWftHiVSvCGgND+//lnBg5aOi
	zye6x2uewJbQ8Ad+4DJcAbdeI1/+Jkdnt8UGlzQG79sbFq+DHUL/6m5eREduHEsao0tQwZU08wPdZ
	DH/ju19F5SsGm8Hlt5m1GkslAp3W8P1MLFE7xFjk2T/V/SbkGJIaNag09pZugqeOVlExEU3U/FBzk
	IOyUJQLQ==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLTly-009Efr-2F;
	Mon, 17 Jul 2023 19:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689621612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VH54V72aOY3ogSKUOINjMnAMtLyl5t2LpD7MwgpBD1k=;
	b=yP2aG/l/BcAOIH9TVYi+sSms/ywPuGo+vB9qPeY/YWR/dpOVAMFasz5X3Lk79VnXxkuZJA
	jahCOB2APvNis4xyyvFFGg6gWEuB8dYtA/S3NJHahOWyTmCy4lagb+zsg1mbE5CtfXHQgi
	RXhFo+EX+9xJaQBIh/7VM7OitWq3rUA=
Message-ID: <1f77bcc8ec861dc2abb9defb062ed9178d3d292e.camel@crapouillou.net>
Subject: Re: [PATCH v2 02/10] pinctrl: baytrail: Make use of pm_ptr()
From: Paul Cercueil <paul@crapouillou.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Balsam CHIHI <bchihi@baylibre.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
  Thierry Reding <thierry.reding@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org,  linux-pm@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Mon, 17 Jul 2023 21:20:09 +0200
In-Reply-To: <20230717172821.62827-3-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_202044_081875_634DDD31 
X-CRM114-Status: GOOD (  18.55  )
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

SGkgQW5keSwKCkxlIGx1bmRpIDE3IGp1aWxsZXQgMjAyMyDDoCAyMDoyOCArMDMwMCwgQW5keSBT
aGV2Y2hlbmtvIGEgw6ljcml0wqA6Cj4gQ2xlYW5pbmcgdXAgdGhlIGRyaXZlciB0byB1c2UgcG1f
cHRyKCkgYW5kICpfUE1fT1BTKCkgbWFjcm9zIHRoYXQKPiBtYWtlIGl0IHNpbXBsZXIgYW5kIGFs
bG93cyB0aGUgY29tcGlsZXIgdG8gcmVtb3ZlIHRob3NlIGZ1bmN0aW9ucwo+IGlmIGJ1aWx0IHdp
dGhvdXQgQ09ORklHX1BNIGFuZCBDT05GSUdfUE1fU0xFRVAgc3VwcG9ydC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4KClJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KCkNo
ZWVycywKLVBhdWwKCj4gLS0tCj4gwqBkcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1iYXl0
cmFpbC5jIHwgMTEgKysrLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9pbnRl
bC9waW5jdHJsLWJheXRyYWlsLmMKPiBiL2RyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJsLWJh
eXRyYWlsLmMKPiBpbmRleCAyN2FlZjYyZmM3YzAuLjY2YWFiYWM2YmU5YyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1iYXl0cmFpbC5jCj4gKysrIGIvZHJpdmVy
cy9waW5jdHJsL2ludGVsL3BpbmN0cmwtYmF5dHJhaWwuYwo+IEBAIC0xNzMzLDcgKzE3MzMsNiBA
QCBzdGF0aWMgaW50IGJ5dF9waW5jdHJsX3Byb2JlKHN0cnVjdAo+IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9Cj4gwqAKPiAtI2lmZGVmIENP
TkZJR19QTV9TTEVFUAo+IMKgc3RhdGljIGludCBieXRfZ3Bpb19zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX3BpbmN0cmwgKnZn
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gQEAgLTE4MTcsOSArMTgxNiw3IEBAIHN0YXRpYyBp
bnQgYnl0X2dwaW9fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiDCoMKgwqDCoMKgwqDCoMKg
cmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmJ5dF9sb2NrLCBmbGFncyk7Cj4gwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAwOwo+IMKgfQo+IC0jZW5kaWYKPiDCoAo+IC0jaWZkZWYgQ09ORklHX1BN
Cj4gwqBzdGF0aWMgaW50IGJ5dF9ncGlvX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IEBAIC0xODI5LDE5ICsxODI2
LDE3IEBAIHN0YXRpYyBpbnQgYnl0X2dwaW9fcnVudGltZV9yZXN1bWUoc3RydWN0Cj4gZGV2aWNl
ICpkZXYpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IMKgfQo+IC0jZW5kaWYK
PiDCoAo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGJ5dF9ncGlvX3BtX29wcyA9
IHsKPiAtwqDCoMKgwqDCoMKgwqBTRVRfTEFURV9TWVNURU1fU0xFRVBfUE1fT1BTKGJ5dF9ncGlv
X3N1c3BlbmQsCj4gYnl0X2dwaW9fcmVzdW1lKQo+IC3CoMKgwqDCoMKgwqDCoFNFVF9SVU5USU1F
X1BNX09QUyhieXRfZ3Bpb19ydW50aW1lX3N1c3BlbmQsCj4gYnl0X2dwaW9fcnVudGltZV9yZXN1
bWUsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IE5VTEwpCj4gK8KgwqDCoMKgwqDCoMKgTEFURV9TWVNURU1fU0xFRVBfUE1fT1BTKGJ5dF9ncGlv
X3N1c3BlbmQsIGJ5dF9ncGlvX3Jlc3VtZSkKPiArwqDCoMKgwqDCoMKgwqBSVU5USU1FX1BNX09Q
UyhieXRfZ3Bpb19ydW50aW1lX3N1c3BlbmQsCj4gYnl0X2dwaW9fcnVudGltZV9yZXN1bWUsIE5V
TEwpCj4gwqB9Owo+IMKgCj4gwqBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBieXRfZ3Bp
b19kcml2ZXIgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoC5wcm9iZcKgwqDCoMKgwqDCoMKgwqDCoCA9
IGJ5dF9waW5jdHJsX3Byb2JlLAo+IMKgwqDCoMKgwqDCoMKgwqAuZHJpdmVywqDCoMKgwqDCoMKg
wqDCoCA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA9ICJieXRfZ3BpbyIsCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC5wbcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoD0gJmJ5dF9ncGlvX3BtX29wcywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLnBtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPSBwbV9wdHIo
JmJ5dF9ncGlvX3BtX29wcyksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuYWNw
aV9tYXRjaF90YWJsZcKgwqDCoMKgwqDCoMKgPSBieXRfZ3Bpb19hY3BpX21hdGNoLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnN1cHByZXNzX2JpbmRfYXR0cnPCoMKgwqDCoD0g
dHJ1ZSwKPiDCoMKgwqDCoMKgwqDCoMKgfSwKCg==


