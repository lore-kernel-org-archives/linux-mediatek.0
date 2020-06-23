Return-Path: <SRS0=E2+4=AE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87FFC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2020 16:02:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B375B2073E
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2020 16:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJfSp49Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1IKjLsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B375B2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q0iC4XtTZxBtGxFzq5c9I9B7dTr9HDQlqfB61fyUsNA=; b=mJfSp49YZnUfcQkgOYGPx3Oyx
	vFZSYbQzdJ3+w9P813HS0jLLQdrp8IZt39o98C8wS+GrlrPng0j2oG8bEhxBTDzz50Up2cIxkwHys
	pcskpOj+jf9r1z8E/SBqGgmub7xQ/NHujiTCxdcHuIs6Kmhjt4XZTRHWaTZ/rJmQmk81w4I3IrcQG
	EQY3vD6M7jCgn67PE8UhSm5Ih6GpMJRfKU2TA+8v2pe9d/d+94Fgu6gzlclmrfWnMF9JGjrOihz2l
	iTpfKzB7ZvR9vp9d4HkfxYQSl1D1gtifdIGeSuV/8mGfNUWa3aZxR7ELdWWaHLirOgj5h9nQI3PqC
	uWb5+0N/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnlNL-0003hf-VZ; Tue, 23 Jun 2020 16:02:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnlNE-0003e6-6H; Tue, 23 Jun 2020 16:02:14 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7513A2073E;
 Tue, 23 Jun 2020 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592928130;
 bh=lgwtT19xKweBZEzgfBI2ZvdEk0sjRs5leWn5RlZvKaA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d1IKjLsEya0MJkIt+nk5fRxEmnGTb/EJDOBs5H+vqMjWkDwKLfesfZYGiCxf2kgpz
 b07f3BGARP6qlArza6MEGzQxbceDfhirf6Gxx9i7MJaOtg3fMJKTNqa+maZtXq8hgy
 16DoDeCeDN3cGYnxvVluzEZnHrVHD8qaimi679Ko=
Received: by mail-ed1-f54.google.com with SMTP id h28so4566747edz.0;
 Tue, 23 Jun 2020 09:02:10 -0700 (PDT)
X-Gm-Message-State: AOAM531tz+8vuIXGgBJuC4sLp7mFN+crf4V7r2vCRmMxLVEBxYN1ADhx
 YysYYisPX3f5iGiIYOrCFr34Rs+07tzu2HslRQ==
X-Google-Smtp-Source: ABdhPJzh79zfALzI26cvItAmyebzTyzXB9kb7DS7PCOiS06ZO4zZJ1rMJnd9vUT0V3TK0pqS41FF02ejyfhgY4fzBEE=
X-Received: by 2002:a50:cd53:: with SMTP id d19mr3588430edj.300.1592928128985; 
 Tue, 23 Jun 2020 09:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20200612160056.2082681-4-daniel.vetter@ffwll.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 24 Jun 2020 00:01:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Vvu8C97j3-zfUFeY4OgWZvUzqOm+=A2AQyJcRUWWidQ@mail.gmail.com>
Message-ID: <CAAOTY__Vvu8C97j3-zfUFeY4OgWZvUzqOm+=A2AQyJcRUWWidQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/mtk: Use __drm_atomic_helper_crtc_reset
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERhbmllbDoKCkRhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IOaWvCAy
MDIw5bm0NuaciDEz5pelIOmAseWFrSDkuIrljYgxMjowMeWvq+mBk++8mgo+Cj4gTm93IGFsc28g
Y29tZXMgd2l0aCB0aGUgYWRkZWQgYmVuZWZpdCBvZiBkb2luZyBhIGRybV9jcnRjX3ZibGFua19v
ZmYoKSwKPiB3aGljaCBtZWFucyB2Ymxhbmsgc3RhdGUgaXNuJ3QgaWxsLWRlZmluZWQgYW5kIGZh
aWwteSBhdCBkcml2ZXIgbG9hZAo+IGJlZm9yZSB0aGUgZmlyc3QgbW9kZXNldCBvbiBlYWNoIGNy
dGMuCj4KCkFja2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IENjOiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBNYXR0aGlhcyBCcnVnZ2Vy
IDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAxNiArKysrKyst
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IGluZGV4IGE3
ZGJhNGNlZDkwMi4uZDY1NGM3ZDUxNGJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2NydGMuYwo+IEBAIC0xMTIsMTkgKzExMiwxNSBAQCBzdGF0aWMgdm9pZCBtdGtfZHJt
X2NydGNfcmVzZXQoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
bXRrX2NydGNfc3RhdGUgKnN0YXRlOwo+Cj4gLSAgICAgICBpZiAoY3J0Yy0+c3RhdGUpIHsKPiAr
ICAgICAgIGlmIChjcnRjLT5zdGF0ZSkKPiAgICAgICAgICAgICAgICAgX19kcm1fYXRvbWljX2hl
bHBlcl9jcnRjX2Rlc3Ryb3lfc3RhdGUoY3J0Yy0+c3RhdGUpOwo+Cj4gLSAgICAgICAgICAgICAg
IHN0YXRlID0gdG9fbXRrX2NydGNfc3RhdGUoY3J0Yy0+c3RhdGUpOwo+IC0gICAgICAgICAgICAg
ICBtZW1zZXQoc3RhdGUsIDAsIHNpemVvZigqc3RhdGUpKTsKPiAtICAgICAgIH0gZWxzZSB7Cj4g
LSAgICAgICAgICAgICAgIHN0YXRlID0ga3phbGxvYyhzaXplb2YoKnN0YXRlKSwgR0ZQX0tFUk5F
TCk7Cj4gLSAgICAgICAgICAgICAgIGlmICghc3RhdGUpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuOwo+IC0gICAgICAgICAgICAgICBjcnRjLT5zdGF0ZSA9ICZzdGF0ZS0+YmFzZTsK
PiAtICAgICAgIH0KPiArICAgICAgIGtmcmVlKHRvX210a19jcnRjX3N0YXRlKGNydGMtPnN0YXRl
KSk7Cj4gKyAgICAgICBjcnRjLT5zdGF0ZSA9IE5VTEw7Cj4KPiAtICAgICAgIHN0YXRlLT5iYXNl
LmNydGMgPSBjcnRjOwo+ICsgICAgICAgc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBH
RlBfS0VSTkVMKTsKPiArICAgICAgIGlmIChzdGF0ZSkKPiArICAgICAgICAgICAgICAgX19kcm1f
YXRvbWljX2hlbHBlcl9jcnRjX3Jlc2V0KGNydGMsICZzdGF0ZS0+YmFzZSk7Cj4gIH0KPgo+ICBz
dGF0aWMgc3RydWN0IGRybV9jcnRjX3N0YXRlICptdGtfZHJtX2NydGNfZHVwbGljYXRlX3N0YXRl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAtLQo+IDIuMjYuMgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
