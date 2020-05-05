Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4A7C47254
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 13:26:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBB82078D
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 13:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="loUldV8U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jl6xMq65"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBB82078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEDiXxBW3OdIoSbfDiNw8nFe2eONv53JVGxyH0ZRUwg=; b=loUldV8UHA4vzF
	mdKYD2f/BdRRXq50vd3r1BQqOcZrDSpmoKZN7gkxxafpffK6PD5dlIeIVWZT9R1i4SVe2W9GAPt6f
	0HkAfMokTvTNZ4HX+o02+1In+8byTXmNmAWiFS6pMgd8IgbK3i099waOFuLly93KRPaQpIGaWB+6g
	//6J4SlIebhuCK9VTbLLCzTtjIE1aiYTXZMu6aI9uOOocdEEyg3VPiYxFHnDlSbzY/7Rxoxm+SP1X
	728A0Y558Ro0JLS7aH3nmMLtaueWUH0370rWkebEVUuIu4t8iyRegD8ZZLqqeKEnPgPGZIOQ1qj9H
	pluE4w7pBnBwAtloL6jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVxac-0008Ej-Cl; Tue, 05 May 2020 13:26:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVxaV-00086h-Bn; Tue, 05 May 2020 13:26:20 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C52392083B;
 Tue,  5 May 2020 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588685179;
 bh=Cg3Aww/DWiRcPHXAAcy63wB+BBaJMxE4W5SjVqI52xM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jl6xMq65m2X3WEe5EWx7+ejjvCPFF50UyIRkX3tbpEfiDyIj1915/uLUMrzdtJfaw
 6iqUX04UY73+GzpazFnWSkIkB5sok0LeDe9adoCvV8vdgJ9jAbOWhaT/RPnEuGXDM0
 FaX+THGQl4IkBFpR2xkMR512gckbveC1akdYSSOE=
Received: by mail-ej1-f50.google.com with SMTP id n17so1638182ejh.7;
 Tue, 05 May 2020 06:26:18 -0700 (PDT)
X-Gm-Message-State: AGi0PubPb/lCWZWe4becTGmiNvfbUaVLpbJ9XSsHjrqE1k5RVxuGsJdy
 coWekjNaPyOflFEZrUTM989kBf4qdW8FD4HPsg==
X-Google-Smtp-Source: APiQypJhGBe4KM2v2+R7Tdau70M9ldxuxhIcdizZA6GeTupSyTsy4bkN4GwbSWQLG63deM2MBxQgW+u07ypp/LcOr8Q=
X-Received: by 2002:a17:906:2ad4:: with SMTP id
 m20mr2786571eje.324.1588685177209; 
 Tue, 05 May 2020 06:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141408.60877-1-enric.balletbo@collabora.com>
 <20200504141408.60877-4-enric.balletbo@collabora.com>
In-Reply-To: <20200504141408.60877-4-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 May 2020 21:26:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9pFfrKjg6qD5fF0gnuj0aLG7DZh1k0htg=YZGaJE9Hww@mail.gmail.com>
Message-ID: <CAAOTY_9pFfrKjg6qD5fF0gnuj0aLG7DZh1k0htg=YZGaJE9Hww@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mediatek: mtk_dpi: Use simple encoder
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_062619_441116_8F7D52C0 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyINOaXpSDpgLHkuIAg5LiL5Y2IMTA6MTTlr6vpgZPvvJoK
Pgo+IFRoZSBtdGtfZHBpIGRyaXZlciB1c2VzIGFuIGVtcHR5IGltcGxlbWVudGF0aW9uIGZvciBp
dHMgZW5jb2Rlci4gUmVwbGFjZQo+IHRoZSBjb2RlIHdpdGggdGhlIGdlbmVyaWMgc2ltcGxlIGVu
Y29kZXIuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFs
bGV0Ym9AY29sbGFib3JhLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jIHwgMTQgKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMK
PiBpbmRleCBiYWFkMTk4YzY5ZWIuLjgwNzc4YjJhYWMyYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYwo+IEBAIC0yMCw2ICsyMCw3IEBACj4gICNpbmNsdWRlIDxkcm0vZHJtX2Jy
aWRnZS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJt
X29mLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmg+Cj4KPiAgI2lu
Y2x1ZGUgIm10a19kcGlfcmVncy5oIgo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIgo+
IEBAIC01MTAsMTUgKzUxMSw2IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2Rl
KHN0cnVjdCBtdGtfZHBpICpkcGksCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLXN0YXRp
YyB2b2lkIG10a19kcGlfZW5jb2Rlcl9kZXN0cm95KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
cikKPiAtewo+IC0gICAgICAgZHJtX2VuY29kZXJfY2xlYW51cChlbmNvZGVyKTsKPiAtfQo+IC0K
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBtdGtfZHBpX2VuY29kZXJf
ZnVuY3MgPSB7Cj4gLSAgICAgICAuZGVzdHJveSA9IG10a19kcGlfZW5jb2Rlcl9kZXN0cm95LAo+
IC19Owo+IC0KPiAgc3RhdGljIGludCBtdGtfZHBpX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9i
cmlkZ2UgKmJyaWRnZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGRy
bV9icmlkZ2VfYXR0YWNoX2ZsYWdzIGZsYWdzKQo+ICB7Cj4gQEAgLTU5MSw4ICs1ODMsOCBAQCBz
dGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAg
ICAgIH0KPgo+IC0gICAgICAgcmV0ID0gZHJtX2VuY29kZXJfaW5pdChkcm1fZGV2LCAmZHBpLT5l
bmNvZGVyLCAmbXRrX2RwaV9lbmNvZGVyX2Z1bmNzLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBEUk1fTU9ERV9FTkNPREVSX1RNRFMsIE5VTEwpOwo+ICsgICAgICAgcmV0ID0gZHJt
X3NpbXBsZV9lbmNvZGVyX2luaXQoZHJtX2RldiwgJmRwaS0+ZW5jb2RlciwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX0VOQ09ERVJfVE1EUyk7Cj4gICAg
ICAgICBpZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRv
IGluaXRpYWxpemUgZGVjb2RlcjogJWRcbiIsIHJldCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8g
ZXJyX3VucmVnaXN0ZXI7Cj4gLS0KPiAyLjI2LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
