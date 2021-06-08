Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046F7C47094
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 00:21:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B783761246
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 00:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B783761246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxrtYJXqhgxa95B6BertCqiwgHjOtuhNb18fyqMYblc=; b=ll0Gg8jLKHKMM3
	JjXEEL2cwrdh46UI/d7ITEJYNvsgI6x9MWRf5vaLMpXTqqsLWwMfZw16g0khsgdv/Rhg4vB+pTnwD
	Qdvae8GGFPny9VVCHlMmt4oGcB3hqrdEEIhdL5KOCyhO2LZI1NkUrX/R88laB1I80Z3cku8QIKxFC
	ZFJ0gZ6dLuZ01dxldyvS9FF/nDt/b2tPBI8jYbLQKNnXuwS5cGVCgsxeS+u1gU6xvW34ko6YBAujF
	6OgljzO0PGbiSCmIeMl6HQSDBlVG+pAdnc49qXc4kxnKf1SjOnUYZRoOTINtqnEe+mooNglpO8VUI
	G57Amx/iBBedCRVs6ufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqPSI-005mx1-4d; Tue, 08 Jun 2021 00:18:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqPS4-005mta-Ny; Tue, 08 Jun 2021 00:18:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2A6F61260;
 Tue,  8 Jun 2021 00:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623111520;
 bh=NBPR/t6DpZyrcU0kswew7pL5+ZXvRXVXN2mhIR75M3A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gV5zOji+r2/clAW2Kobd6MnI0MfssYmgx1A7OFqpRsqOuiXpgXhAxKja3W5optCT3
 wuQhpkht84p5KG8cExyvNV85/GZC0CSCOV6ubQ02s2AS9JrnllVAKwb+ENsCZeg2cI
 VybfOTx9cW4Nr5y5nHIkeHQfAAwFS0GAhpwkYjOB6G1QauforodVXCE0G74xM+vqVS
 6rotESXDnqMABHo8l2b296r38xnuDu1C9L2huoX83MOkZW4s008WmiUwea5WdHC0Q+
 aczZ+y8zonQasglwTTyXQiLFHlCejATeI1D+M6Y548293Vd4KKBo79xEFzBLZJx7US
 2MEjsu++d57OQ==
Received: by mail-ej1-f45.google.com with SMTP id a11so28855605ejf.3;
 Mon, 07 Jun 2021 17:18:39 -0700 (PDT)
X-Gm-Message-State: AOAM530+NRqrxFbd4T2RP1XNiSgcbeIYIMwA537E3JZIoJil/7R40/Rs
 wUm5HjCb7w6nQNlrspAM7Cw3EWi9tBppeCwukQ==
X-Google-Smtp-Source: ABdhPJzndobiLhNjhOA4a7KXYaL6sXYZqGPxAn2dbv51QSkEkDv6RsyhwbgaVH6hMrbCM0A78i6voDNrMTPycwcs2lQ=
X-Received: by 2002:a17:906:b0cb:: with SMTP id
 bk11mr20679861ejb.310.1623111518484; 
 Mon, 07 Jun 2021 17:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210603111455.5963-1-bernard@vivo.com>
In-Reply-To: <20210603111455.5963-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 8 Jun 2021 08:18:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-QpO1d6+jnQsun8htG8sGqrVVA3Jy1kvLqOZC+CExxTQ@mail.gmail.com>
Message-ID: <CAAOTY_-QpO1d6+jnQsun8htG8sGqrVVA3Jy1kvLqOZC+CExxTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: remove redundant error log print
To: Bernard Zhao <bernard@vivo.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_171840_823508_6665C789 
X-CRM114-Status: GOOD (  13.89  )
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

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIx5bm0
NuaciDPml6Ug6YCx5ZubIOS4i+WNiDc6MTXlr6vpgZPvvJoKPgo+IEZpeCBjb2NjaWNoZWNrIHdh
cm5pbmc6Cj4gZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYzoxMDc0OjItOTogbGlu
ZSAxMDc0IGlzCj4gcmVkdW5kYW50IGJlY2F1c2UgcGxhdGZvcm1fZ2V0X2lycSgpIGFscmVhZHkg
cHJpbnRzIGFuIGVycm9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDxiZXJuYXJk
QHZpdm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwg
NCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IGFlNDAzYzY3Y2JkOS4uZTJl
NGZjOGIxMzYwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTEwODIs
MTAgKzEwODIsOCBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPgo+ICAgICAgICAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2
LCBpcnFfbnVtLCBtdGtfZHNpX2lycSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
SVJRRl9UUklHR0VSX05PTkUsIGRldl9uYW1lKCZwZGV2LT5kZXYpLCBkc2kpOwoKZGV2bV9yZXF1
ZXN0X2lycSgpIHdvdWxkIGhhdmUgYmVsb3cgY2FsbCBzdGFjayB0byBhbGxvY2F0ZSBtZW1vcnku
CldoZW4gYWxsb2NhdGUgbWVtb3J5IGZhaWwsIGl0IHdvdWxkIG5vdCBwcmludCBhbnkgZXJyb3Ig
bWVzc2FnZSwKZG9lc24ndCBpdD8KCmRldm1fcmVxdWVzdF9pcnEoKSAtPiBkZXZtX3JlcXVlc3Rf
dGhyZWFkZWRfaXJxKCkgLT4gZGV2cmVzX2FsbG9jKCkgLT4KZGV2cmVzX2FsbG9jX25vZGUoKSAt
PiBhbGxvY19kcigpIC0+IGttYWxsb2Nfbm9kZV90cmFja19jYWxsZXIoKQoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gLSAgICAgICBpZiAocmV0KSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIo
JnBkZXYtPmRldiwgImZhaWxlZCB0byByZXF1ZXN0IG1lZGlhdGVrIGRzaSBpcnFcbiIpOwo+ICsg
ICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfdW5yZWdpc3Rlcl9ob3N0
Owo+IC0gICAgICAgfQo+Cj4gICAgICAgICBpbml0X3dhaXRxdWV1ZV9oZWFkKCZkc2ktPmlycV93
YWl0X3F1ZXVlKTsKPgo+IC0tCj4gMi4zMS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
