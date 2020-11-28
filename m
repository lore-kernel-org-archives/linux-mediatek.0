Return-Path: <SRS0=gn/N=FC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00DAC63697
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2020 09:00:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8A022256
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2020 09:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wLE6ZHIe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0Th5J3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8A022256
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DIURuGx49jWPd4lCxvV1fWoX+H5kEwkbE4vwT/01fXM=; b=wLE6ZHIerLJHF6QP71T1hmEkt
	6eq7FK+9TR8IgrrF35qN46SIVD9S8Iy/VNMRl0+ocM5xSUCRmkaHysDQxJS+qJq8ZTs9WABJ/mv3x
	+y7SWn7r9jXpsMro6jHNPGeZfwov+1byuLznywT7tro0XRvomrLmvmsxXN6r/h1liZ89JZJ6nWY+a
	SNCUO72AlcAN2RJu02Ic9aPWKBsXHiMHK35F+WnoQGiIow2m6YX2YFIQ51GgLbREpIAUdmqOQDF9Q
	RLTJLkqf+OxyfL/9RolQ/ayN6xvUajB4nBdlMLh+K+jr1xelhJDPZyfIcydFzFxbagCR4BeArD1YS
	v9Wcit3aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiw5t-00031b-BY; Sat, 28 Nov 2020 09:00:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiw5g-00030E-Is; Sat, 28 Nov 2020 09:00:29 +0000
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86111222B9;
 Sat, 28 Nov 2020 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606554021;
 bh=tCh3C64HLBruiQe7woUJh3PomiEkJaLuMsK2cYyZ3AE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f0Th5J3kNwanqwLrsUfcFVjKjBzG0T5dTMjmemdj2OHzf3R85LAQ5cvSp9donQn1q
 Da3O0EVQmMoPGwAkX8Q7/8OWXsu2pcL9ecIE8qQkDssINevLLPWWAEDfpQLrs9VO9q
 k0G2OrM0FzU/FxBRyGq71l4ts5SlyrbXAPQ5itYs=
Received: by mail-wr1-f41.google.com with SMTP id e7so7981764wrv.6;
 Sat, 28 Nov 2020 01:00:21 -0800 (PST)
X-Gm-Message-State: AOAM531uXITlEjyW+pkAUlbkPK4tGyeYuvIfKX2XjpyHWjAtn/h209Fy
 zjPFhR7kJjxrvaoJZwn1BGzN2X4fw+63L/8obg==
X-Google-Smtp-Source: ABdhPJwaGpEa4Ug6G0e4ekBFpVOFIur24PSU0U73IWrhh0O8+yKHfKhXm6k7CY8fPX51ghX7CTQgvKr1wmwXSEjAldg=
X-Received: by 2002:adf:c147:: with SMTP id w7mr16556337wre.60.1606554020099; 
 Sat, 28 Nov 2020 01:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20201127110204.1984789-1-enric.balletbo@collabora.com>
In-Reply-To: <20201127110204.1984789-1-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 28 Nov 2020 17:00:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9udVi7s5HoB+4SMNsTRQp9WPnHXLhz8b0CCWzW73BNSw@mail.gmail.com>
Message-ID: <CAAOTY_9udVi7s5HoB+4SMNsTRQp9WPnHXLhz8b0CCWzW73BNSw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Use correct aliases name for ovl
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_040027_922135_A441F4DC 
X-CRM114-Status: GOOD (  17.79  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQxMeaciDI35pelIOmAseS6lCDkuIvljYg3OjAy5a+r6YGT77ya
Cj4KPiBBbGlhc2VzIHByb3BlcnR5IG5hbWUgbXVzdCBpbmNsdWRlIG9ubHkgbG93ZXJjYXNlIGFu
ZCAnLScsIHNvIGZpeCB0aGlzCj4gaW4gdGhlIGRyaXZlciwgc28gd2UncmUgbm90IHRlbXB0ZWQg
dG8gZG8gIm92bF8ybDAgPSAmb3ZsXzJsMCIgaW4gdGhlCj4gZGV2aWNlLXRyZWUgaW5zdGVhZCBv
ZiB0aGUgcmlnaHQgb25lIHdoaWNoIGlzICJvdmwtMmwwID0gJm92bF8ybDAiLgo+CgpBcHBsaWVk
IHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9n
Lz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiBGaXhlczogZGQ4
ZmViMjI2MmQ5ICgiZHJtL21lZGlhdGVrOiBhZGQgY29tcG9uZW50IE9WTF8yTDEiKQo+IEZpeGVz
OiBiMTdiZGQwZDdhNzMgKCJkcm0vbWVkaWF0ZWs6IGFkZCBjb21wb25lbnQgT1ZMXzJMMCIpCj4g
U2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29s
bGFib3JhLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
Ywo+IGluZGV4IDhlYmE0NGJlM2E4YS4uMzA2NGVhYzFhNzUwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTM1OSw3ICszNTksNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBkZHBfdWZvZSA9IHsKPgo+ICBz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10a19kZHBfY29tcF9zdGVtW01US19ERFBfQ09NUF9U
WVBFX01BWF0gPSB7Cj4gICAgICAgICBbTVRLX0RJU1BfT1ZMXSA9ICJvdmwiLAo+IC0gICAgICAg
W01US19ESVNQX09WTF8yTF0gPSAib3ZsXzJsIiwKPiArICAgICAgIFtNVEtfRElTUF9PVkxfMkxd
ID0gIm92bC0ybCIsCj4gICAgICAgICBbTVRLX0RJU1BfUkRNQV0gPSAicmRtYSIsCj4gICAgICAg
ICBbTVRLX0RJU1BfV0RNQV0gPSAid2RtYSIsCj4gICAgICAgICBbTVRLX0RJU1BfQ09MT1JdID0g
ImNvbG9yIiwKPiAtLQo+IDIuMjkuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
