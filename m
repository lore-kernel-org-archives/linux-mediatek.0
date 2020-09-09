Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE4FC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 22:34:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D8A20C09
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 22:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXoTfc0U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMi/HJEh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D8A20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cF8FV71bzbHhko6b5sD5xWCJcQ0eMXQMYF1ycgJcK/k=; b=FXoTfc0UCkuwOxcgcDZsioNuN
	dbmM83WHwneQAKAI29ywbinvGKrKk5lpFMmMaNRgBG4qvtHLoJvwsCOwcxe+kE/JuKLTBbnJidSvU
	Fa3jcjAN1Y/RLJumGFvTd5LnSQn2w5jexfPKvmnVwnbd3KX0QQrHUxOeOMiXYrGmGZpHgQOYMboX9
	LwmSKbW6SO5ogz6tuV23XKHjIPfCVrYpMrPU480pk+l24tInrrgRTH1JhISO9QsR9HVPS4IV60SA2
	5zayB1Nh52miXBNAi24EDSBRf+BaW0qU9yztPkJ0ne9p6WeZIDEAe3dq5BRb0ZkL+2asAag7zFWEe
	Qpx47gibQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG8fI-00065X-SH; Wed, 09 Sep 2020 22:34:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG8fE-00063d-Hx; Wed, 09 Sep 2020 22:34:05 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFEC921D93;
 Wed,  9 Sep 2020 22:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599690841;
 bh=qn7F9kIfrQDK9ilpICfJwnlqi88jogiZeINUWgtswHo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iMi/HJEhuhW4pM1AwbvKOq53FSk1YcujGZPO1K9TA6pNwJS8gPW9uq4uB1TRnkz0F
 wPnYcbHWC65NpQ2jbU0bpRveJHozE3zgQXYJLBjYDNQj9MITMfR3fnPK2/CTdHi1Az
 C2sv9nmC8QuACfs+p4/pitJoXrx01d76ieNUkY0c=
Received: by mail-ej1-f54.google.com with SMTP id r7so5803040ejs.11;
 Wed, 09 Sep 2020 15:34:00 -0700 (PDT)
X-Gm-Message-State: AOAM530H9IddMPlUp1Sujl5E7qtCOI0jeb+RFFPCAn1/5pbzAJPyZ/Ln
 V6emgEAxMJqsb7UYrkjbAovIqCmut+FXzF5VAw==
X-Google-Smtp-Source: ABdhPJziy8hMosSfpL73I0q786HLEcsVS9kNOqzP/Nfn7KJ9FugubRKZT1YW+F3eOFoLVx5h6kQovjh9Mn2m2hErytY=
X-Received: by 2002:a17:906:a256:: with SMTP id
 bi22mr5766251ejb.375.1599690839500; 
 Wed, 09 Sep 2020 15:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200826085317.681385-1-enric.balletbo@collabora.com>
 <20200826085317.681385-2-enric.balletbo@collabora.com>
In-Reply-To: <20200826085317.681385-2-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Sep 2020 06:33:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-bix-mpn9rGmU0KGuByOJhG3oQQNS7w28oGdqDr_m4LQ@mail.gmail.com>
Message-ID: <CAAOTY_-bix-mpn9rGmU0KGuByOJhG3oQQNS7w28oGdqDr_m4LQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 1/2] drm/mediatek: mtk_dpi: Rename bridge to
 next_bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_183404_713234_FEEBFDB3 
X-CRM114-Status: GOOD (  22.03  )
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
 boris.brezillon@collabora.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEFuZHJ6ZWogJiBOZWlsOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0
Ym9AY29sbGFib3JhLmNvbT4g5pa8IDIwMjDlubQ45pyIMjbml6Ug6YCx5LiJIOS4i+WNiDQ6NTPl
r6vpgZPvvJoKPgo+IFRoaXMgaXMgcmVhbGx5IGEgY29zbWV0aWMgY2hhbmdlIGp1c3QgdG8gbWFr
ZSBhIGJpdCBtb3JlIHJlYWRhYmxlIHRoZQo+IGNvZGUgYWZ0ZXIgY29udmVydCB0aGUgZHJpdmVy
IHRvIGRybV9icmlkZ2UuIFRoZSBicmlkZ2UgdmFyaWFibGUgbmFtZQo+IHdpbGwgYmUgdXNlZCBi
eSB0aGUgZW5jb2RlciBkcm1fYnJpZGdlLCBhbmQgdGhlIGNoYWluZWQgYnJpZGdlIHdpbGwgYmUK
PiBuYW1lZCBuZXh0X2JyaWRnZS4KClRoaXMgaXMgYSBEUk0tYnJpZGdlIHJlbGF0ZWQgcGF0Y2gs
IGhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgaXQ/CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFJl
dmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJv
cmEuY29tPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+Cj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHBpLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmMKPiBpbmRleCBkNGYwZmI3YWQzMTIuLmY3MzcyZGJkYWMwZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYwo+IEBAIC02NCw3ICs2NCw3IEBAIGVudW0gbXRrX2RwaV9vdXRfY29s
b3JfZm9ybWF0IHsKPiAgc3RydWN0IG10a19kcGkgewo+ICAgICAgICAgc3RydWN0IG10a19kZHBf
Y29tcCBkZHBfY29tcDsKPiAgICAgICAgIHN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOwo+IC0g
ICAgICAgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKPiArICAgICAgIHN0cnVjdCBkcm1fYnJp
ZGdlICpuZXh0X2JyaWRnZTsKPiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiAgICAgICAg
IHN0cnVjdCBkZXZpY2UgKmRldjsKPiAgICAgICAgIHN0cnVjdCBjbGsgKmVuZ2luZV9jbGs7Cj4g
QEAgLTYxMCw3ICs2MTAsNyBAQCBzdGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgIC8qIEN1
cnJlbnRseSBEUEkwIGlzIGZpeGVkIHRvIGJlIGRyaXZlbiBieSBPVkwxICovCj4gICAgICAgICBk
cGktPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQoMSk7Cj4KPiAtICAgICAgIHJldCA9IGRy
bV9icmlkZ2VfYXR0YWNoKCZkcGktPmVuY29kZXIsIGRwaS0+YnJpZGdlLCBOVUxMLCAwKTsKPiAr
ICAgICAgIHJldCA9IGRybV9icmlkZ2VfYXR0YWNoKCZkcGktPmVuY29kZXIsIGRwaS0+bmV4dF9i
cmlkZ2UsIE5VTEwsIDApOwo+ICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhdHRhY2ggYnJpZGdlOiAlZFxuIiwgcmV0KTsKPiAgICAg
ICAgICAgICAgICAgZ290byBlcnJfY2xlYW51cDsKPiBAQCAtNzcwLDExICs3NzAsMTEgQEAgc3Rh
dGljIGludCBtdGtfZHBpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAg
ICAgICB9Cj4KPiAgICAgICAgIHJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYt
Pm9mX25vZGUsIDAsIDAsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTlVMTCwgJmRwaS0+YnJpZGdlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBOVUxMLCAmZHBpLT5uZXh0X2JyaWRnZSk7Cj4gICAgICAgICBpZiAocmV0KQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Cj4gLSAgICAgICBkZXZfaW5mbyhkZXYsICJG
b3VuZCBicmlkZ2Ugbm9kZTogJXBPRlxuIiwgZHBpLT5icmlkZ2UtPm9mX25vZGUpOwo+ICsgICAg
ICAgZGV2X2luZm8oZGV2LCAiRm91bmQgYnJpZGdlIG5vZGU6ICVwT0ZcbiIsIGRwaS0+bmV4dF9i
cmlkZ2UtPm9mX25vZGUpOwo+Cj4gICAgICAgICBjb21wX2lkID0gbXRrX2RkcF9jb21wX2dldF9p
ZChkZXYtPm9mX25vZGUsIE1US19EUEkpOwo+ICAgICAgICAgaWYgKGNvbXBfaWQgPCAwKSB7Cj4g
LS0KPiAyLjI4LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
