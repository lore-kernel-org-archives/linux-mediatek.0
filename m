Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFA4C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 13:06:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AF976121F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 13:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AF976121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=da9rqUBRepV1M86oeIIRGD9Y2f3gbWTtbp9DInCetQc=; b=FKpVXO05Lq6jM8
	I0n2cmo4MBUj3nBMEdy8RUXmr9EA16qknm5nYSP8fHSVBBHjCtBVDpmC/MAWVjiv0ZSf9aG6QoZh2
	3jygRjBlQnYz4coyu+zH7mM25bWrQhEhK1O31D591GB6bF5ZTVlCH/cwu/1CCWZFYxYGfVPOzAi7W
	XANsCJRbUOmwiuoBdWOFXODqtjUTl19nWkWVxUydI39aJAaHBlzWXoempN0qzHcd/5TVQbR/KvTPG
	E93A9u22rc0IHnf8CtNznmKvYA5YTM8k0cF57+mpgHu7LQQWqVBKewaJ0CYG4BXTQQ+DQBuwCaLnQ
	/Sj57lU7PY5NFmshkMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Bvb-00Fhtl-S9; Wed, 21 Jul 2021 13:06:23 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6BvW-00FhtE-HH
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 13:06:22 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id h5so1357993vsg.12
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sE5V6logeIB6yN4Rh0mfzUJ1rGMZI822LGADa05C45E=;
 b=Bj7bk/C1PKkuSzV5YRthYWTCkuufUKTTiVbPn4NU1EPzJdN8DRLfPg6ae8XCATPHBq
 pd+kUYv9wqu2Rr+Y6yw7c/BUKey/G2MxviKwFxh/HOdNK7Ui5sbpLQ0o+eOECLOrZ8wL
 pdVA1KzoZq1MjDKOvgaP1gL63WJWVdsOK0OBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sE5V6logeIB6yN4Rh0mfzUJ1rGMZI822LGADa05C45E=;
 b=iDlPN5xmV+ZbyPx2aLYfaFUly3ke04AWmAOA7vG/aWamxlDX4Qskeg9lNEeDvpn8aL
 pNUZxhhs06Ipjtr8x7KrktBWAHtMKWcjHZdjX8SvjDzsTj4AlU2bWENf5/SRD2bvI3kD
 O/KMgDxcJFY5tb3LCG3SvY9uBaYXNoMGWddoTc/OlfivAdoq7c1RvmXqURnjGOEEmG+o
 jkyc34qptVYcBs9zsJhS9QeS1gvdbJIgNFZalZfhNzBEdPTyiHGw2CezfNSlNGYiJdwa
 wuXHuAHqpAZpFYSImDqkRI6uZEmX/2HpupSIvDiPejnUy/Y4QCY7L7G7l8Z8waA81/lH
 3S7Q==
X-Gm-Message-State: AOAM530U6c9l0FPjkqsS9PuCnAqZDwrwyTaLpc0RHlPEQcI8BpNvCzsP
 0UHJIcKJM8+QpY+A8cwxx+c4vgNbF8Xcl897
X-Google-Smtp-Source: ABdhPJxjIAxTA7jhzmdVnau8Yv3xBnzIzmA+aqu/lVbhin80ktLzmu6m1R2d6WsB798zHy1pxcyPng==
X-Received: by 2002:a05:6102:3089:: with SMTP id
 l9mr35033331vsb.2.1626872770884; 
 Wed, 21 Jul 2021 06:06:10 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id f193sm1715172vkf.39.2021.07.21.06.06.08
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 06:06:10 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id m33so508096vkf.6
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 06:06:08 -0700 (PDT)
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr31887451vke.2.1626872768157; 
 Wed, 21 Jul 2021 06:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210720074734.22287-1-jason-jh.lin@mediatek.com>
 <20210720074734.22287-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210720074734.22287-2-jason-jh.lin@mediatek.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 21 Jul 2021 09:05:29 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLuhmRwWSUx9ODP59VK6Xe=RzLwGOn6FB=OLxs04oQmbw@mail.gmail.com>
Message-ID: <CAOw6vbLuhmRwWSUx9ODP59VK6Xe=RzLwGOn6FB=OLxs04oQmbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/mediatek: Fix cursor plane didn't update
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Maxime Ripard <maxime@cerno.tech>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 singo.chang@mediatek.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, 
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
 David-YH.Chiu@mediatek.com, Hsin-Yi Wang <hsinyi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_060618_604812_D4F4BEB3 
X-CRM114-Status: GOOD (  22.74  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjAsIDIwMjEgYXQgMzo0NyBBTSBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+Cj4gVGhlIGN1cnNvciBwbGFuZSBzaG91bGQgdXNlIHRo
ZSBjdXJyZW50IHBsYW5lIHN0YXRlIGhvb2sgaW4KPiBhdG9taWNfYXN5bmNfdXBkYXRlIGJlY2F1
c2UgaXQgd291bGQgbm90IGJlIHRoZSBuZXcgcGxhbmUgc3RhdGUgaW4KPiB0aGUgZ2xvYmFsIGF0
b21pYyBzdGF0ZSwgc2luY2UgZHJtX2F0b21pY19oZWxwZXJfc3dhcF9zdGF0ZSBoYXBwZW5lZAo+
IHdoZW4gdGhvc2UgcGxhbmUgc3RhdGUgaG9vayBhcmUgcnVuLgo+Cj4gRml4IGN1cnNvciBwbGFu
ZSBkaWRuJ3QgdXBkYXRlIGlzc3VlIGJ5IGJlbG93IG1vZGlmaWNhdGlvbjoKPiAxLiBSZW1vdmUg
cGxhbmVfaGVscGVyX2Z1bmNzLT5hdG9taWNfdXBkYXRlKHBsYW5lLCBzdGF0ZSkgaW4KPiAgICBt
dGtfZHJtX2NydGNfYXN5bmNfdXBkYXRlLgo+IDIuIEFkZCBtdGtfZHJtX3VwZGF0ZV9uZXdfc3Rh
dGUgaW50byBtdGtfcGxhbmVfYXRvbWljX2FzeW5jX3VwZGF0ZSB0bwo+ICAgIHVwZGF0ZSB0aGUg
Y3Vyc29yIHBsYW5lIGJ5IGN1cnJlbnQgcGxhbmUgc3RhdGUgaG9vayBhbmQgYWRkIGl0IGludG8K
PiAgICBtdGtfcGxhbmVfYXRvbWljX3VwZGF0ZSB0byB1cGRhdGUgb3RoZXJzIHBsYW5lIGJ5IHRo
ZSBuZXdfc3RhdGUuCj4KPiBGaXhlczogMzc0MThiZjE0YzEzICgiZHJtOiBVc2Ugc3RhdGUgaGVs
cGVyIGluc3RlYWQgb2YgdGhlIHBsYW5lIHN0YXRlIHBvaW50ZXIiKQo+IFNpZ25lZC1vZmYtYnk6
IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiBUZXN0ZWQtYnk6IEVu
cmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgfCAgMSAtCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgfCA2MCArKysrKysrKysrKysr
Ky0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyNyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRl
eCA0NzRlZmI4NDQyNDkuLjA2M2M3NWJhYjNhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAtNTM4LDcgKzUzOCw2IEBAIHZvaWQgbXRrX2RybV9jcnRj
X2FzeW5jX3VwZGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lLAo+ICAgICAgICAgaWYgKCFtdGtfY3J0Yy0+ZW5hYmxlZCkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuOwo+Cj4gLSAgICAgICBwbGFuZV9oZWxwZXJfZnVuY3MtPmF0b21pY191cGRhdGUocGxh
bmUsIHN0YXRlKTsKCnBsYW5lX2hlbHBlcl9mdW5jcyBpcyBub3cgdW51c2VkCgouLi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmM6NTc4OjM5OiB3YXJuaW5nOiB1bnVzZWQK
dmFyaWFibGUg4oCYcGxhbmVfaGVscGVyX2Z1bmNz4oCZIFstV3VudXNlZC12YXJpYWJsZV0KCj4K
PiAgICAgICAgIG10a19kcm1fY3J0Y191cGRhdGVfY29uZmlnKG10a19jcnRjLCBmYWxzZSk7Cj4g
IH0KPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFu
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYwo+IGluZGV4IGI1
NTgyZGNmNTY0Yy4uZTZkY2IzNGQzMDUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9wbGFuZS5jCj4gQEAgLTExMCw2ICsxMTAsMzUgQEAgc3RhdGljIGludCBtdGtfcGxh
bmVfYXRvbWljX2FzeW5jX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUsIHRydWUpOwo+
ICB9Cj4KPiArc3RhdGljIHZvaWQgbXRrX3BsYW5lX3VwZGF0ZV9uZXdfc3RhdGUoc3RydWN0IGRy
bV9wbGFuZV9zdGF0ZSAqbmV3X3N0YXRlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKm10a19wbGFuZV9zdGF0ZSkKPiArewo+
ICsgICAgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBuZXdfc3RhdGUtPmZiOwo+ICsg
ICAgICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW07Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX2Ry
bV9nZW1fb2JqICptdGtfZ2VtOwo+ICsgICAgICAgdW5zaWduZWQgaW50IHBpdGNoLCBmb3JtYXQ7
Cj4gKyAgICAgICBkbWFfYWRkcl90IGFkZHI7Cj4gKwo+ICsgICAgICAgZ2VtID0gZmItPm9ialsw
XTsKPiArICAgICAgIG10a19nZW0gPSB0b19tdGtfZ2VtX29iaihnZW0pOwo+ICsgICAgICAgYWRk
ciA9IG10a19nZW0tPmRtYV9hZGRyOwo+ICsgICAgICAgcGl0Y2ggPSBmYi0+cGl0Y2hlc1swXTsK
PiArICAgICAgIGZvcm1hdCA9IGZiLT5mb3JtYXQtPmZvcm1hdDsKPiArCj4gKyAgICAgICBhZGRy
ICs9IChuZXdfc3RhdGUtPnNyYy54MSA+PiAxNikgKiBmYi0+Zm9ybWF0LT5jcHBbMF07Cj4gKyAg
ICAgICBhZGRyICs9IChuZXdfc3RhdGUtPnNyYy55MSA+PiAxNikgKiBwaXRjaDsKPiArCj4gKyAg
ICAgICBtdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcuZW5hYmxlID0gdHJ1ZTsKPiArICAgICAgIG10
a19wbGFuZV9zdGF0ZS0+cGVuZGluZy5waXRjaCA9IHBpdGNoOwo+ICsgICAgICAgbXRrX3BsYW5l
X3N0YXRlLT5wZW5kaW5nLmZvcm1hdCA9IGZvcm1hdDsKPiArICAgICAgIG10a19wbGFuZV9zdGF0
ZS0+cGVuZGluZy5hZGRyID0gYWRkcjsKPiArICAgICAgIG10a19wbGFuZV9zdGF0ZS0+cGVuZGlu
Zy54ID0gbmV3X3N0YXRlLT5kc3QueDE7Cj4gKyAgICAgICBtdGtfcGxhbmVfc3RhdGUtPnBlbmRp
bmcueSA9IG5ld19zdGF0ZS0+ZHN0LnkxOwo+ICsgICAgICAgbXRrX3BsYW5lX3N0YXRlLT5wZW5k
aW5nLndpZHRoID0gZHJtX3JlY3Rfd2lkdGgoJm5ld19zdGF0ZS0+ZHN0KTsKPiArICAgICAgIG10
a19wbGFuZV9zdGF0ZS0+cGVuZGluZy5oZWlnaHQgPSBkcm1fcmVjdF9oZWlnaHQoJm5ld19zdGF0
ZS0+ZHN0KTsKPiArICAgICAgIG10a19wbGFuZV9zdGF0ZS0+cGVuZGluZy5yb3RhdGlvbiA9IG5l
d19zdGF0ZS0+cm90YXRpb247Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIG10a19wbGFuZV9hdG9t
aWNfYXN5bmNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSkKPiAgewo+IEBAIC0xMjYsOCArMTU1LDEwIEBAIHN0YXRpYyB2b2lkIG10a19wbGFuZV9hdG9t
aWNfYXN5bmNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAgICAgICAgcGxhbmUt
PnN0YXRlLT5zcmNfaCA9IG5ld19zdGF0ZS0+c3JjX2g7Cj4gICAgICAgICBwbGFuZS0+c3RhdGUt
PnNyY193ID0gbmV3X3N0YXRlLT5zcmNfdzsKPiAgICAgICAgIHN3YXAocGxhbmUtPnN0YXRlLT5m
YiwgbmV3X3N0YXRlLT5mYik7Cj4gLSAgICAgICBuZXdfcGxhbmVfc3RhdGUtPnBlbmRpbmcuYXN5
bmNfZGlydHkgPSB0cnVlOwo+Cj4gKyAgICAgICBtdGtfcGxhbmVfdXBkYXRlX25ld19zdGF0ZShu
ZXdfc3RhdGUsIG5ld19wbGFuZV9zdGF0ZSk7Cj4gKyAgICAgICB3bWIoKTsgLyogTWFrZSBzdXJl
IHRoZSBhYm92ZSBwYXJhbWV0ZXJzIGFyZSBzZXQgYmVmb3JlIHVwZGF0ZSAqLwo+ICsgICAgICAg
bmV3X3BsYW5lX3N0YXRlLT5wZW5kaW5nLmFzeW5jX2RpcnR5ID0gdHJ1ZTsKPiAgICAgICAgIG10
a19kcm1fY3J0Y19hc3luY191cGRhdGUobmV3X3N0YXRlLT5jcnRjLCBwbGFuZSwgc3RhdGUpOwo+
ICB9Cj4KPiBAQCAtMTg5LDE0ICsyMjAsOCBAQCBzdGF0aWMgdm9pZCBtdGtfcGxhbmVfYXRvbWlj
X3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgICAgICAgIHN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKm5ld19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZShzdGF0
ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwbGFuZSk7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX3BsYW5l
X3N0YXRlICptdGtfcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUobmV3X3N0YXRlKTsK
PiAtICAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IG5ld19zdGF0ZS0+Y3J0YzsKPiAtICAg
ICAgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gbmV3X3N0YXRlLT5mYjsKPiAtICAgICAg
IHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtOwo+IC0gICAgICAgc3RydWN0IG10a19kcm1fZ2Vt
X29iaiAqbXRrX2dlbTsKPiAtICAgICAgIHVuc2lnbmVkIGludCBwaXRjaCwgZm9ybWF0Owo+IC0g
ICAgICAgZG1hX2FkZHJfdCBhZGRyOwo+Cj4gLSAgICAgICBpZiAoIWNydGMgfHwgV0FSTl9PTigh
ZmIpKQo+ICsgICAgICAgaWYgKCFuZXdfc3RhdGUtPmNydGMgfHwgV0FSTl9PTighbmV3X3N0YXRl
LT5mYikpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+ICAgICAgICAgaWYgKCFuZXdfc3Rh
dGUtPnZpc2libGUpIHsKPiBAQCAtMjA0LDI0ICsyMjksNyBAQCBzdGF0aWMgdm9pZCBtdGtfcGxh
bmVfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBnZW0gPSBmYi0+b2JqWzBdOwo+IC0g
ICAgICAgbXRrX2dlbSA9IHRvX210a19nZW1fb2JqKGdlbSk7Cj4gLSAgICAgICBhZGRyID0gbXRr
X2dlbS0+ZG1hX2FkZHI7Cj4gLSAgICAgICBwaXRjaCA9IGZiLT5waXRjaGVzWzBdOwo+IC0gICAg
ICAgZm9ybWF0ID0gZmItPmZvcm1hdC0+Zm9ybWF0Owo+IC0KPiAtICAgICAgIGFkZHIgKz0gKG5l
d19zdGF0ZS0+c3JjLngxID4+IDE2KSAqIGZiLT5mb3JtYXQtPmNwcFswXTsKPiAtICAgICAgIGFk
ZHIgKz0gKG5ld19zdGF0ZS0+c3JjLnkxID4+IDE2KSAqIHBpdGNoOwo+IC0KPiAtICAgICAgIG10
a19wbGFuZV9zdGF0ZS0+cGVuZGluZy5lbmFibGUgPSB0cnVlOwo+IC0gICAgICAgbXRrX3BsYW5l
X3N0YXRlLT5wZW5kaW5nLnBpdGNoID0gcGl0Y2g7Cj4gLSAgICAgICBtdGtfcGxhbmVfc3RhdGUt
PnBlbmRpbmcuZm9ybWF0ID0gZm9ybWF0Owo+IC0gICAgICAgbXRrX3BsYW5lX3N0YXRlLT5wZW5k
aW5nLmFkZHIgPSBhZGRyOwo+IC0gICAgICAgbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLnggPSBu
ZXdfc3RhdGUtPmRzdC54MTsKPiAtICAgICAgIG10a19wbGFuZV9zdGF0ZS0+cGVuZGluZy55ID0g
bmV3X3N0YXRlLT5kc3QueTE7Cj4gLSAgICAgICBtdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcud2lk
dGggPSBkcm1fcmVjdF93aWR0aCgmbmV3X3N0YXRlLT5kc3QpOwo+IC0gICAgICAgbXRrX3BsYW5l
X3N0YXRlLT5wZW5kaW5nLmhlaWdodCA9IGRybV9yZWN0X2hlaWdodCgmbmV3X3N0YXRlLT5kc3Qp
Owo+IC0gICAgICAgbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLnJvdGF0aW9uID0gbmV3X3N0YXRl
LT5yb3RhdGlvbjsKPiArICAgICAgIG10a19wbGFuZV91cGRhdGVfbmV3X3N0YXRlKG5ld19zdGF0
ZSwgbXRrX3BsYW5lX3N0YXRlKTsKPiAgICAgICAgIHdtYigpOyAvKiBNYWtlIHN1cmUgdGhlIGFi
b3ZlIHBhcmFtZXRlcnMgYXJlIHNldCBiZWZvcmUgdXBkYXRlICovCj4gICAgICAgICBtdGtfcGxh
bmVfc3RhdGUtPnBlbmRpbmcuZGlydHkgPSB0cnVlOwo+ICB9Cj4gLS0KPiAyLjE4LjAKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
