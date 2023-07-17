Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2F9C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2FsRW/iD1SQYNbltu5CgyPfz65E+yDxeasl/fxtjIM=; b=vS2ZLk2fpQ/iZj+WWF8mLNiET3
	dABNWbmSwagyNmHgNgFq4kqa9p/JhgWfGnZ77vppXU7Qg/v4FR20SKrbvrvsLC+CCbtwZg2oNS9Mm
	MQ4JOzrvMVigpvVPhjA4VfQ+du+pF/zs287dgvB5ukKJGX9DSUVmnjoElbL1CjDtNvLtcA4inBXbg
	lQe6Tj/gFeDmQgdkHr9W5g9fX9msxXvjHYA748gxuzoY1aUJlXNYNW2SyeKpXRvSP0jHdeIn+Af5Z
	8eB6drBf/rqkg/PxvTw/8qKTIacymzM5PsJLRiQH2s1XS+dBMwj8mt1BTZPVEAXQF+ZWFjFIT++nv
	HxLztLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Pp-006IWY-1P;
	Wed, 19 Jul 2023 08:20:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Pl-006IUQ-0I;
	Wed, 19 Jul 2023 08:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=f2FsRW/iD1SQYNbltu5CgyPfz65E+yDxeasl/fxtjIM=; b=k9wRMQOIRd/UL5KMk8mzirQr4Q
	0KVbH7ph8Vvq9z3QwQBpq89Ck2EjdjVrRHCctkQAZpb/K/wAOePZOLsHbxFTB7t3f9S0XKpDlilzf
	xGFevW3Ix+hJLxi1os65vNoM4dkzw7nktwvm6a9rzKlHzRr9ozbD8nzcFnrhL9dzRwv8x96+0/dDQ
	D2DGdL+E7G3eMecADmDphxZs8FLYyvyjqzTQyjQ8pZsOQS3Z8nLeCvfVo8q8e9EW5AHZmMQ0uZZg8
	b8TdJHa/EmE0CK1STJ9ZFryjNcYPUdabzNS6R/RUTcVFe2mNhogVHWHFEriCeSd3i7KKBp9DFWfgl
	n9lTKRPg==;
Received: from aposti.net ([89.234.176.197])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLToj-009EkU-2g;
	Mon, 17 Jul 2023 19:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1689621782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2FsRW/iD1SQYNbltu5CgyPfz65E+yDxeasl/fxtjIM=;
	b=QUSTalgEXSQDjPMLrB5o7QMCahRiCifDFiugm9rnJcn71JCyT7aOLymUOW/gQZyyCiY6hr
	lbE3nKSj+Z4PhaVzbZbruA3x7Vy7tFZknM9Ts+Ht4ZWqsyw8XWam2OvmFRb7OQ5mbs1LP6
	Ru1DyJG3Rjmuhfv6vH5laLD4/TLKACc=
Message-ID: <108dbf8d020d7a4335743aa196ec7be9c8a777a3.camel@crapouillou.net>
Subject: Re: [PATCH v2 05/10] pinctrl: lynxpoint: Make use of pm_ptr()
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
Date: Mon, 17 Jul 2023 21:23:00 +0200
In-Reply-To: <20230717172821.62827-6-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	 <20230717172821.62827-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_202334_413159_97A0DC88 
X-CRM114-Status: GOOD (  17.43  )
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
ZWVycywKLVBhdWwKCj4gLS0tCj4gwqBkcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1seW54
cG9pbnQuYyB8IDcgKysrLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL2ludGVsL3Bp
bmN0cmwtbHlueHBvaW50LmMKPiBiL2RyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJsLWx5bnhw
b2ludC5jCj4gaW5kZXggY2RhY2U1NWFhZWFjLi41MGQ5MmJmODBlMjAgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9waW5jdHJsL2ludGVsL3BpbmN0cmwtbHlueHBvaW50LmMKPiArKysgYi9kcml2ZXJz
L3BpbmN0cmwvaW50ZWwvcGluY3RybC1seW54cG9pbnQuYwo+IEBAIC05NDgsOSArOTQ4LDggQEAg
c3RhdGljIGludCBscF9ncGlvX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gwqB9Cj4gwqAK
PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBscF9ncGlvX3BtX29wcyA9IHsKPiAt
wqDCoMKgwqDCoMKgwqAucnVudGltZV9zdXNwZW5kID0gbHBfZ3Bpb19ydW50aW1lX3N1c3BlbmQs
Cj4gLcKgwqDCoMKgwqDCoMKgLnJ1bnRpbWVfcmVzdW1lID0gbHBfZ3Bpb19ydW50aW1lX3Jlc3Vt
ZSwKPiAtwqDCoMKgwqDCoMKgwqAucmVzdW1lID0gbHBfZ3Bpb19yZXN1bWUsCj4gK8KgwqDCoMKg
wqDCoMKgU1lTVEVNX1NMRUVQX1BNX09QUyhOVUxMLCBscF9ncGlvX3Jlc3VtZSkKPiArwqDCoMKg
wqDCoMKgwqBSVU5USU1FX1BNX09QUyhscF9ncGlvX3J1bnRpbWVfc3VzcGVuZCwKPiBscF9ncGlv
X3J1bnRpbWVfcmVzdW1lLCBOVUxMKQo+IMKgfTsKPiDCoAo+IMKgc3RhdGljIGNvbnN0IHN0cnVj
dCBhY3BpX2RldmljZV9pZCBseW54cG9pbnRfZ3Bpb19hY3BpX21hdGNoW10gPSB7Cj4gQEAgLTk2
NSw3ICs5NjQsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBscF9ncGlvX2RyaXZl
ciA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgLnJlbW92ZcKgwqDCoMKgwqDCoMKgwqAgPSBscF9ncGlv
X3JlbW92ZSwKPiDCoMKgwqDCoMKgwqDCoMKgLmRyaXZlcsKgwqDCoMKgwqDCoMKgwqAgPSB7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAubmFtZcKgwqAgPSAibHBfZ3BpbyIsCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5wbcKgwqDCoMKgwqA9ICZscF9ncGlvX3Bt
X29wcywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnBtwqDCoMKgwqDCoD0gcG1f
cHRyKCZscF9ncGlvX3BtX29wcyksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAu
YWNwaV9tYXRjaF90YWJsZSA9IGx5bnhwb2ludF9ncGlvX2FjcGlfbWF0Y2gsCj4gwqDCoMKgwqDC
oMKgwqDCoH0sCj4gwqB9OwoK


