Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7450FC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:48:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 196F920756
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SPXNXlau";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="IHIGL3sD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 196F920756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cf2VgTLTUsQqaKs7G1qthRGocETaEfR3ZuUfOFKxkWg=; b=SPXNXlauLmpcqsjXUAVp4D03H
	j0K8I4PTVa35yHt1EkAMCAe2xK8R/mq1xrA8u0KgbfjVzZKZKfskw7hv9QBkDDKHHsLkWkbI6VxKh
	AygESYNq9nL1Ox3VFZHyXzZr5kkwHd4P+b59BM7i9lLRyjs770llpD9ERFgskQ+/F+AjrmbYfKlf9
	9iMeqiS5wLzDrtd7hYQdg+mQ1AHMFjRHh+h+YhYUKUdtW0egmrLHzZoDFJY7GOY3pcoyCEJP+7wOb
	jeiuNuZPRK9LZT5qgC00gW5VMoFeWsVAImLdSdv5PfRg9Xb2MJdiMqces+w+q3MCCPI4Mpyz6uUL2
	VVazFgixQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFRs-0007bX-31; Thu, 10 Sep 2020 05:48:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFRm-0007ZK-K9
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 05:48:39 +0000
Received: by mail-wr1-x442.google.com with SMTP id s12so5233837wrw.11
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 22:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=I7HXHoZUPjIWa51xLsX5lBcbKjI+7D42UiOnxk3Dydc=;
 b=IHIGL3sDLvhkFznmNhPIuTfgebgiVyomeJUGTpz7IKwGJP5eW7teIcEDQ9GqsdMlWI
 0L2LH5UG4vwLK+uV+coa2eSC9TpWvABAM9m2SltZ18r/qhNwLC9o+FN5vixIYyYhezMM
 g7BZa3zsUZJh27H/drt6gipvU78m9FuDo5xiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=I7HXHoZUPjIWa51xLsX5lBcbKjI+7D42UiOnxk3Dydc=;
 b=ZNHAHj9MUuxWw+wjZ5Y7EFX5dsZfv3Wobk446MnseoiR1hwHDsGJh/7BGcFmLbMnD9
 Sy3fI+wn+6GC/izyW6NxpK8XbTePd5OFqcsX88kEQxutftgkhQqGhrh+lkOEogcrmIKi
 yQ+Cl0kjv3wLXvdBcmHc2KeRigxRFIQZxcu9JzC44pZsrdoMM1gjBRoEAarpPJ67D1iE
 GbvXO2d/Cou+8eLHaJyk4xcvpYgpfie1RU2BwJjvKYLGItysMpKFZKZkTBoKYU2UxVP3
 DC6UtLFQYXXgJFM2XO3ImPPTwhGOJA/Hw7u8IgngoHOgXyykbjxtWc1MbH6zhTMtw4PM
 HfkA==
X-Gm-Message-State: AOAM532IXYCeM4/MGSzWkq5kf2l5/Z60wUL++op3AFZ0lEdqaOvX0RED
 bi/oBWabTGB4zerg/vsJAg2jzQ==
X-Google-Smtp-Source: ABdhPJxFksw3Uz6l+VgxdkO/ALbi5Kpv2LgTIRZ0Cc4P7Dxld4TE/oZaQUaG//4MLORTkGsUhKz/xw==
X-Received: by 2002:adf:82b1:: with SMTP id 46mr7684464wrc.271.1599716916109; 
 Wed, 09 Sep 2020 22:48:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g143sm1918363wme.0.2020.09.09.22.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:48:35 -0700 (PDT)
Date: Thu, 10 Sep 2020 07:48:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [RESEND PATCH v2 2/2] drm/mediatek: mtk_dpi: Convert to bridge
 driver
Message-ID: <20200910054828.GC438822@phenom.ffwll.local>
Mail-Followup-To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, boris.brezillon@collabora.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
References: <20200826085317.681385-1-enric.balletbo@collabora.com>
 <20200826085317.681385-3-enric.balletbo@collabora.com>
 <CAAOTY__UwVCDn_J1RWesrm7eTS=Ti4LS9FutaydomFNLBVsF2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY__UwVCDn_J1RWesrm7eTS=Ti4LS9FutaydomFNLBVsF2g@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_014838_690672_891F8A85 
X-CRM114-Status: GOOD (  26.13  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, boris.brezillon@collabora.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMTAsIDIwMjAgYXQgMDY6MzU6MjFBTSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3
cm90ZToKPiBIaSwgQW5kcnplaiAmIE5laWw6Cj4gCj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8
ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4g5pa8IDIwMjDlubQ45pyIMjbml6Ug6YCx5LiJ
IOS4i+WNiDQ6NTPlr6vpgZPvvJoKPiAKPiA+Cj4gPiBDb252ZXJ0IG10a19kcGkgdG8gYSBicmlk
Z2UgZHJpdmVyIHdpdGggYnVpbHQtaW4gZW5jb2RlciBzdXBwb3J0IGZvcgo+ID4gY29tcGF0aWJp
bGl0eSB3aXRoIGV4aXN0aW5nIGNvbXBvbmVudCBkcml2ZXJzLgo+ID4KPiAKPiBUaGlzIGlzIGEg
RFJNLWJyaWRnZSByZWxhdGVkIHBhdGNoLCBob3cgZG8geW91IHRoaW5rIGFib3V0IGl0PwoKYnJp
ZGdlIHN0dWZmIGlzIGFsc28gbWFpbnRhaW5lZCBpbiBkcm0tbWlzYywgc28gZ29vZCB0byBnbyBp
bW8uCgpGb3IgdGhlIGJpZ2dlciBwaWN0dXJlIEkgdGhpbmsgaXQnZCBiZSByZWFsbHkgZ29vZCBp
ZiBicmlkZ2VzIGRyaXZlcnMKd291bGQgdXNlIHRoZSBvZiBicmlkZ2UgbG9va3VwLCBhbmQgbm90
IGhhbmQgcm9sbCBzb21ldGhpbmcgd2l0aApjb21wb25lbnQuIFNvIDJuZCBzdGVwIG9mIGNvbnZl
cnRpbmcgdGhpcyBvdmVyIHRvIGEgcHJvcGVyIGJyaWRnZSBkcml2ZXIKd291bGQgYmUgdG8gcmVw
bGFjZSB0aGUgY29tcG9uZW50IGNvZGUgaGVyZSB0b28uCgpDaGVlcnMsIERhbmllbAoKPiAKPiBS
ZWdhcmRzLAo+IENodW4tS3VhbmcuCj4gCj4gPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRi
byBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPgo+ID4g
Q2hhbmdlcyBpbiB2MjoKPiA+IC0gTWFpbnRhaW4gZXJyb3IgbWVzc2FnZSB3aGVuIGF0dGFjaCB0
byBicmlkZ2UgZmFpbHMuIChCb3JpcykKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYyB8IDcxICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+IGluZGV4IGY3MzcyZGJkYWMwZS4uNTg5ZWYzM2Ex
NzgwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gQEAgLTY0LDYg
KzY0LDcgQEAgZW51bSBtdGtfZHBpX291dF9jb2xvcl9mb3JtYXQgewo+ID4gIHN0cnVjdCBtdGtf
ZHBpIHsKPiA+ICAgICAgICAgc3RydWN0IG10a19kZHBfY29tcCBkZHBfY29tcDsKPiA+ICAgICAg
ICAgc3RydWN0IGRybV9lbmNvZGVyIGVuY29kZXI7Cj4gPiArICAgICAgIHN0cnVjdCBkcm1fYnJp
ZGdlIGJyaWRnZTsKPiA+ICAgICAgICAgc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdlOwo+
ID4gICAgICAgICB2b2lkIF9faW9tZW0gKnJlZ3M7Cj4gPiAgICAgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldjsKPiA+IEBAIC04Myw5ICs4NCw5IEBAIHN0cnVjdCBtdGtfZHBpIHsKPiA+ICAgICAgICAg
aW50IHJlZmNvdW50Owo+ID4gIH07Cj4gPgo+ID4gLXN0YXRpYyBpbmxpbmUgc3RydWN0IG10a19k
cGkgKm10a19kcGlfZnJvbV9lbmNvZGVyKHN0cnVjdCBkcm1fZW5jb2RlciAqZSkKPiA+ICtzdGF0
aWMgaW5saW5lIHN0cnVjdCBtdGtfZHBpICpicmlkZ2VfdG9fZHBpKHN0cnVjdCBkcm1fYnJpZGdl
ICpiKQo+ID4gIHsKPiA+IC0gICAgICAgcmV0dXJuIGNvbnRhaW5lcl9vZihlLCBzdHJ1Y3QgbXRr
X2RwaSwgZW5jb2Rlcik7Cj4gPiArICAgICAgIHJldHVybiBjb250YWluZXJfb2YoYiwgc3RydWN0
IG10a19kcGksIGJyaWRnZSk7Cj4gPiAgfQo+ID4KPiA+ICBlbnVtIG10a19kcGlfcG9sYXJpdHkg
ewo+ID4gQEAgLTUyMSw1MCArNTIyLDUzIEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxh
eV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksCj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gIH0K
PiA+Cj4gPiAtc3RhdGljIGJvb2wgbXRrX2RwaV9lbmNvZGVyX21vZGVfZml4dXAoc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRq
dXN0ZWRfbW9kZSkKPiA+ICtzdGF0aWMgdm9pZCBtdGtfZHBpX2VuY29kZXJfZGVzdHJveShzdHJ1
Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gPiAgewo+ID4gLSAgICAgICByZXR1cm4gdHJ1ZTsK
PiA+ICsgICAgICAgZHJtX2VuY29kZXJfY2xlYW51cChlbmNvZGVyKTsKPiA+ICB9Cj4gPgo+ID4g
LXN0YXRpYyB2b2lkIG10a19kcGlfZW5jb2Rlcl9tb2RlX3NldChzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmFkanVzdGVkX21vZGUpCj4gPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBtdGtfZHBpX2VuY29kZXJfZnVuY3Mg
PSB7Cj4gPiArICAgICAgIC5kZXN0cm95ID0gbXRrX2RwaV9lbmNvZGVyX2Rlc3Ryb3ksCj4gPiAr
fTsKPiA+ICsKPiA+ICtzdGF0aWMgaW50IG10a19kcGlfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpZGdlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51
bSBkcm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKPiA+ICB7Cj4gPiAtICAgICAgIHN0cnVj
dCBtdGtfZHBpICpkcGkgPSBtdGtfZHBpX2Zyb21fZW5jb2RlcihlbmNvZGVyKTsKPiA+ICsgICAg
ICAgc3RydWN0IG10a19kcGkgKmRwaSA9IGJyaWRnZV90b19kcGkoYnJpZGdlKTsKPiA+ICsKPiA+
ICsgICAgICAgcmV0dXJuIGRybV9icmlkZ2VfYXR0YWNoKGJyaWRnZS0+ZW5jb2RlciwgZHBpLT5u
ZXh0X2JyaWRnZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkcGktPmJy
aWRnZSwgZmxhZ3MpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBtdGtfZHBpX2JyaWRn
ZV9tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKmFkanVzdGVkX21vZGUpCj4gPiArewo+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX2RwaSAq
ZHBpID0gYnJpZGdlX3RvX2RwaShicmlkZ2UpOwo+ID4KPiA+ICAgICAgICAgZHJtX21vZGVfY29w
eSgmZHBpLT5tb2RlLCBhZGp1c3RlZF9tb2RlKTsKPiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyB2b2lk
IG10a19kcGlfZW5jb2Rlcl9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiA+
ICtzdGF0aWMgdm9pZCBtdGtfZHBpX2JyaWRnZV9kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UpCj4gPiAgewo+ID4gLSAgICAgICBzdHJ1Y3QgbXRrX2RwaSAqZHBpID0gbXRrX2RwaV9m
cm9tX2VuY29kZXIoZW5jb2Rlcik7Cj4gPiArICAgICAgIHN0cnVjdCBtdGtfZHBpICpkcGkgPSBi
cmlkZ2VfdG9fZHBpKGJyaWRnZSk7Cj4gPgo+ID4gICAgICAgICBtdGtfZHBpX3Bvd2VyX29mZihk
cGkpOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIHZvaWQgbXRrX2RwaV9lbmNvZGVyX2VuYWJsZShz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gPiArc3RhdGljIHZvaWQgbXRrX2RwaV9icmlk
Z2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gPiAgewo+ID4gLSAgICAgICBz
dHJ1Y3QgbXRrX2RwaSAqZHBpID0gbXRrX2RwaV9mcm9tX2VuY29kZXIoZW5jb2Rlcik7Cj4gPiAr
ICAgICAgIHN0cnVjdCBtdGtfZHBpICpkcGkgPSBicmlkZ2VfdG9fZHBpKGJyaWRnZSk7Cj4gPgo+
ID4gICAgICAgICBtdGtfZHBpX3Bvd2VyX29uKGRwaSk7Cj4gPiAgICAgICAgIG10a19kcGlfc2V0
X2Rpc3BsYXlfbW9kZShkcGksICZkcGktPm1vZGUpOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIGlu
dCBtdGtfZHBpX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0
Y19zdGF0ZSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9j
b25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpCj4gPiAtewo+ID4gLSAgICAgICByZXR1cm4gMDsK
PiA+IC19Cj4gPiAtCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJf
ZnVuY3MgbXRrX2RwaV9lbmNvZGVyX2hlbHBlcl9mdW5jcyA9IHsKPiA+IC0gICAgICAgLm1vZGVf
Zml4dXAgPSBtdGtfZHBpX2VuY29kZXJfbW9kZV9maXh1cCwKPiA+IC0gICAgICAgLm1vZGVfc2V0
ID0gbXRrX2RwaV9lbmNvZGVyX21vZGVfc2V0LAo+ID4gLSAgICAgICAuZGlzYWJsZSA9IG10a19k
cGlfZW5jb2Rlcl9kaXNhYmxlLAo+ID4gLSAgICAgICAuZW5hYmxlID0gbXRrX2RwaV9lbmNvZGVy
X2VuYWJsZSwKPiA+IC0gICAgICAgLmF0b21pY19jaGVjayA9IG10a19kcGlfYXRvbWljX2NoZWNr
LAo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBtdGtfZHBpX2JyaWRn
ZV9mdW5jcyA9IHsKPiA+ICsgICAgICAgLmF0dGFjaCA9IG10a19kcGlfYnJpZGdlX2F0dGFjaCwK
PiA+ICsgICAgICAgLm1vZGVfc2V0ID0gbXRrX2RwaV9icmlkZ2VfbW9kZV9zZXQsCj4gPiArICAg
ICAgIC5kaXNhYmxlID0gbXRrX2RwaV9icmlkZ2VfZGlzYWJsZSwKPiA+ICsgICAgICAgLmVuYWJs
ZSA9IG10a19kcGlfYnJpZGdlX2VuYWJsZSwKPiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMgdm9pZCBt
dGtfZHBpX3N0YXJ0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gPiBAQCAtNjA1LDEyICs2
MDksMTEgQEAgc3RhdGljIGludCBtdGtfZHBpX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gPiAgICAgICAgICAgICAgICAgZGV2X2Vy
cihkZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBkZWNvZGVyOiAlZFxuIiwgcmV0KTsKPiA+ICAg
ICAgICAgICAgICAgICBnb3RvIGVycl91bnJlZ2lzdGVyOwo+ID4gICAgICAgICB9Cj4gPiAtICAg
ICAgIGRybV9lbmNvZGVyX2hlbHBlcl9hZGQoJmRwaS0+ZW5jb2RlciwgJm10a19kcGlfZW5jb2Rl
cl9oZWxwZXJfZnVuY3MpOwo+ID4KPiA+ICAgICAgICAgLyogQ3VycmVudGx5IERQSTAgaXMgZml4
ZWQgdG8gYmUgZHJpdmVuIGJ5IE9WTDEgKi8KPiA+ICAgICAgICAgZHBpLT5lbmNvZGVyLnBvc3Np
YmxlX2NydGNzID0gQklUKDEpOwo+ID4KPiA+IC0gICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRh
Y2goJmRwaS0+ZW5jb2RlciwgZHBpLT5uZXh0X2JyaWRnZSwgTlVMTCwgMCk7Cj4gPiArICAgICAg
IHJldCA9IGRybV9icmlkZ2VfYXR0YWNoKCZkcGktPmVuY29kZXIsICZkcGktPmJyaWRnZSwgTlVM
TCwgMCk7Cj4gPiAgICAgICAgIGlmIChyZXQpIHsKPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJy
KGRldiwgIkZhaWxlZCB0byBhdHRhY2ggYnJpZGdlOiAlZFxuIiwgcmV0KTsKPiA+ICAgICAgICAg
ICAgICAgICBnb3RvIGVycl9jbGVhbnVwOwo+ID4gQEAgLTc5MSw4ICs3OTQsMTUgQEAgc3RhdGlj
IGludCBtdGtfZHBpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPgo+ID4g
ICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkcGkpOwo+ID4KPiA+ICsgICAgICAg
ZHBpLT5icmlkZ2UuZnVuY3MgPSAmbXRrX2RwaV9icmlkZ2VfZnVuY3M7Cj4gPiArICAgICAgIGRw
aS0+YnJpZGdlLm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gPiArICAgICAgIGRwaS0+YnJpZGdl
LnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJOwo+ID4gKwo+ID4gKyAgICAgICBkcm1fYnJp
ZGdlX2FkZCgmZHBpLT5icmlkZ2UpOwo+ID4gKwo+ID4gICAgICAgICByZXQgPSBjb21wb25lbnRf
YWRkKGRldiwgJm10a19kcGlfY29tcG9uZW50X29wcyk7Cj4gPiAgICAgICAgIGlmIChyZXQpIHsK
PiA+ICsgICAgICAgICAgICAgICBkcm1fYnJpZGdlX3JlbW92ZSgmZHBpLT5icmlkZ2UpOwo+ID4g
ICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjb21wb25lbnQ6ICVk
XG4iLCByZXQpOwo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgICAgICAgIH0K
PiA+IEBAIC04MDIsNyArODEyLDEwIEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4KPiA+ICBzdGF0aWMgaW50IG10a19kcGlfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgewo+ID4gKyAgICAgICBzdHJ1Y3Qg
bXRrX2RwaSAqZHBpID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gPiArCj4gPiAgICAg
ICAgIGNvbXBvbmVudF9kZWwoJnBkZXYtPmRldiwgJm10a19kcGlfY29tcG9uZW50X29wcyk7Cj4g
PiArICAgICAgIGRybV9icmlkZ2VfcmVtb3ZlKCZkcGktPmJyaWRnZSk7Cj4gPgo+ID4gICAgICAg
ICByZXR1cm4gMDsKPiA+ICB9Cj4gPiAtLQo+ID4gMi4yOC4wCj4gPgoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
