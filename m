Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429A6C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 17:07:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4E4208B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 17:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gb6cT05q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uul/3MRW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4E4208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zyn/N+87JiIoDRushOWiL1ZvY5k+s2rRYGf2cD10hNc=; b=Gb6cT05q5q2PWudgTzGOiEJQu
	4hnNTak0qzIHeqr4wSqVJazKdF1Za/NPPL3pjEixZeZldxOemcXBhKanfzvcBHdHd3ZPtFZpTW847
	2/eg/3FPYtLxgTyUM478OW7BoeopvHGYEHW0n1AV4Aznck3we5LXpXqOPADU4W/Yvw4LuwLaY3IfQ
	0mdYD6Q1actxOtfb/v9nLi5/Ha7ucIKeTa0ryB8QrqHksuWYJmrvr8XMl1bPlHco2+hRBZLSycbgl
	uGkxk+as9Bjz76SSekRHgx4R13Dm235rctWFNv4vxHYeOY878E9esLscxeM5CZKjcfYrwesivqfL/
	Fcmpbi1Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVHa6-0001OZ-Iz; Wed, 21 Oct 2020 17:07:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVHa2-0001NP-Qn; Wed, 21 Oct 2020 17:07:19 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 240042242F;
 Wed, 21 Oct 2020 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603300037;
 bh=cmX/YO3xz5pAF8CH4Yv2e+wNRl4pkQd8JHkdyLyXh1A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uul/3MRW1yCz1Mj6OHpN7L03VExvPsGkMsRM10hBPxslr6UgE2cIwbYwiJ6/srP9X
 eIJ0xDyWl5glw48AD5rG8IcPylxHA8AD7VQGdMeYPeEsPhfUYA6gLMq2yle8ZFkl1F
 +ZxctGWTnlfLf3f94y4EC0kzdcu+cJao5JZ8m0r0=
Received: by mail-ej1-f52.google.com with SMTP id z5so4294562ejw.7;
 Wed, 21 Oct 2020 10:07:17 -0700 (PDT)
X-Gm-Message-State: AOAM532sOYo2QAMxNuNPBayYpG0aCNA7O/mIV0I/t4teGqoLdAZlesWw
 WPwwVpjb+01e3QGjp+9uE305wDoNfQApAZsTIw==
X-Google-Smtp-Source: ABdhPJzkI1tdwAjD8c04bQdTDw9wZakzcNHkiciym4rO8nnPUMoynFasWgKThhVCIRKLRPIRtHqBKCELzLsq4X0lGu8=
X-Received: by 2002:a17:906:95d1:: with SMTP id
 n17mr4668586ejy.75.1603300035519; 
 Wed, 21 Oct 2020 10:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-5-fparent@baylibre.com>
In-Reply-To: <20201020174253.3757771-5-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 01:07:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Y98yHq7GcypUMryG4jMEdrDJeCeRXEKX3mb5g39y+sg@mail.gmail.com>
Message-ID: <CAAOTY_9Y98yHq7GcypUMryG4jMEdrDJeCeRXEKX3mb5g39y+sg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/mediatek: dsi: add pdata variable to start clk in
 HS mode
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_130718_954947_B7489B5D 
X-CRM114-Status: GOOD (  22.68  )
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
Cc: DTML <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPgo+IE9uIE1UODE2Nywg
RFNJIHNlZW1zIHRvIHdvcmsgZmluZSBvbmx5IGlmIHdlIHN0YXJ0IHRoZSBjbGsgaW4gSFMgbW9k
ZS4KPiBJZiB3ZSBkb24ndCBzdGFydCB0aGUgY2xrIGluIEhTIGJ1dCB0cnkgdG8gc3dpdGNoIGxh
dGVyIHRvIEhTLCB0aGUKPiBkaXNwbGF5IGRvZXMgbm90IHdvcmsuCj4KPiBUaGlzIGNvbW1pdCBh
ZGRzIGEgcGxhdGZvcm0gZGF0YSB2YXJpYWJsZSB0byBiZSB1c2VkIHRvIHN0YXJ0IHRoZQo+IERT
SSBjbGsgaW4gSFMgbW9kZSBhdCBwb3dlciBvbi4KClRoaXMgcGF0Y2ggbG9va3MgbGlrZSBhIGhh
Y2sgcGF0Y2guIElmIHlvdSBjb3dvcmsgd2l0aCBNZWRpYXRlaywKcGxlYXNlIGZpbmQgb3V0IHRo
ZSBjb3JyZWN0IHNvbHV0aW9uIG9yIGdpdmUgYSByZWFzb25hYmxlIGV4cGxhbmF0aW9uLgpJZiB5
b3UgY291bGQgbm90IGdldCBoZWxwIGZyb20gTWVkaWF0ZWssIEkgd291bGQgd2FpdCBmb3IgY29t
bWVudCBvbgp0aGlzIHBhdGNoLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2Zm
LWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYwo+IGluZGV4IDRhMTg4YTk0MmMzOC4uNDYxNjQzYzA1Njg5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTE3NSw2ICsxNzUsNyBAQCBzdHJ1Y3QgbXRrX2RzaV9k
cml2ZXJfZGF0YSB7Cj4gICAgICAgICBjb25zdCB1MzIgcmVnX2NtZHFfb2ZmOwo+ICAgICAgICAg
Ym9vbCBoYXNfc2hhZG93X2N0bDsKPiAgICAgICAgIGJvb2wgaGFzX3NpemVfY3RsOwo+ICsgICAg
ICAgYm9vbCB1c2VfaHNfb25fcG93ZXJfb247Cj4gIH07Cj4KPiAgc3RydWN0IG10a19kc2kgewo+
IEBAIC02NzEsNyArNjcyLDcgQEAgc3RhdGljIGludCBtdGtfZHNpX3Bvd2Vyb24oc3RydWN0IG10
a19kc2kgKmRzaSkKPgo+ICAgICAgICAgbXRrX2RzaV9jbGtfdWxwX21vZGVfbGVhdmUoZHNpKTsK
PiAgICAgICAgIG10a19kc2lfbGFuZTBfdWxwX21vZGVfbGVhdmUoZHNpKTsKPiAtICAgICAgIG10
a19kc2lfY2xrX2hzX21vZGUoZHNpLCAwKTsKPiArICAgICAgIG10a19kc2lfY2xrX2hzX21vZGUo
ZHNpLCAhIWRzaS0+ZHJpdmVyX2RhdGEtPnVzZV9oc19vbl9wb3dlcl9vbik7Cj4KPiAgICAgICAg
IHJldHVybiAwOwo+ICBlcnJfZGlzYWJsZV9lbmdpbmVfY2xrOgo+IC0tCj4gMi4yOC4wCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
