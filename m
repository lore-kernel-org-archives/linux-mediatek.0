Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5DAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 23:47:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E212360D
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 23:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E212360D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kN/1NTatdfhwgNISNgtlpf93LJgucJHDr3f2Sd07Wfk=; b=jxn9A5CGb1/xe+ZX9x5XrQtfI
	NQ+FaxTN2m6bzfTyHxnhnAb0BhNJH/0BpB/ban1/6zD9+xbFGEc5qCODM1CocEeqXvNj/dIfYcYSI
	3nuFfUFNuphTGd2dMdKvLYGhnZwnssaavfqEn9H9RlmjbYA6AfdHuIuSJda1ov6+76ie1XFZpdDbn
	lZvCfidQD/StudTsh32s9kVz32zPOLK0fHMcb7dAo6rtlIM/2UXSoQfejkFpV7cO4GfH8ECkdwlX3
	TJLSx2tPh9tYyiLLT42EZ/Ro5LcX85KS/XgL+Kay2lQ2Nkq/2RAwgZAZi59HQ4jOFd7q0EhDbfwph
	oOZTC/Ddw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2NBs-0006x0-Sx; Wed, 20 Jan 2021 23:47:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2NBl-0006u5-3Q; Wed, 20 Jan 2021 23:47:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D386623718;
 Wed, 20 Jan 2021 23:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611186420;
 bh=0WJekRe162njhz/lN/s1NsUfes3ExpoWd49kVBnEejU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dlb2GafUES632XMG7xdeT6FSzA/aAwE13grNWfpunJA+7lNdexHZA6/QYAs7SFKPO
 L6cbuaCB4dTuFxVBT8hBPP6/2uiOULwpuVH8LKH7KdSVM13adQ78pHDn2xR8t6oaWF
 I5SedOZO7iEhqJ2hQ5nwQjKNsoFfhqEOtwNk5aN/UfPTfO2Kd/UgBcL/xDPZc/wG3T
 xLhWN49VGhxmxtTB4Of+7Yyxny6qEbxw+xwH+JrYoDWlQZcIUwb4EkwcfgpcJy3BpS
 RVzxrWfKXhAZjlLMq+9cd7lZSYKWy9jfgoC5DEmyISRKSXl+d3+RJzbHD4GdwwZ4Lf
 PKbr9yMGlV7CA==
Received: by mail-wr1-f53.google.com with SMTP id a1so40229wrq.6;
 Wed, 20 Jan 2021 15:46:59 -0800 (PST)
X-Gm-Message-State: AOAM531lZ9DaaKQ20Y8lByaZPGARaWcyN7yadaT7/HhUyVBXd/eielCW
 U/8FTGi4HMtqwOKTZJPcxQKg60NJAM9kC1TcpA==
X-Google-Smtp-Source: ABdhPJyOeJAtpzLliOtYNxoGXZZfEVvmUMa8zd9WYN928+G7DsPAZ514fbLy1jNVz+KdZq3J5WPxeP/R7tiMsnrbC4c=
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr2662537wrd.134.1611186418365; 
 Wed, 20 Jan 2021 15:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
 <20210106231729.17173-4-chunkuang.hu@kernel.org>
 <YAh2JGUUpMcgyke0@ziggy.stardust>
In-Reply-To: <YAh2JGUUpMcgyke0@ziggy.stardust>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 21 Jan 2021 07:46:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
Message-ID: <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/mediatek: Change disp/ddp term to mutex in mtk
 mutex driver
To: Matthias Brugger <matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_184701_683804_19BECDFB 
X-CRM114-Status: GOOD (  20.68  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGtlcm5lbC5vcmc+
IOaWvCAyMDIx5bm0MeaciDIx5pelIOmAseWbmyDkuIrljYgyOjI35a+r6YGT77yaCj4KPiBPbiBU
aHUsIEphbiAwNywgMjAyMSBhdCAwNzoxNzoyN0FNICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3Rl
Ogo+ID4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Cj4gPiBtdGsgbXV0ZXgg
aXMgdXNlZCBieSBib3RoIGRybSBhbmQgbWRwIGRyaXZlciwgc28gY2hhbmdlIGRpc3AvZGRwIHRl
cm0gdG8KPiA+IG11dGV4IHRvIHNob3cgdGhhdCBpdCdzIGEgY29tbW9uIGRyaXZlciBmb3IgZHJt
IGFuZCBtZHAuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwu
b3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
IHwgIDMwICstLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8
ICAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICB8ICAg
MiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXV0ZXguYyAgICB8IDMwNSAr
KysrKysrKysrKystLS0tLS0tLS0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X211dGV4LmggICAgfCAgMjYgKy0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE4MiBpbnNlcnRpb25z
KCspLCAxODMgZGVsZXRpb25zKC0pCj4gPgo+IFsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19tdXRleC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19tdXRleC5jCj4gPiBpbmRleCAxYzhhMjUzZjQ3ODguLjk4YTA2MGJmMjI1ZCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXV0ZXguYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdXRleC5jCj4gWy4uLl0KPiA+Cj4gPiAtc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZGRwX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG11dGV4X2RyaXZlcl9kdF9tYXRj
aFtdID0gewo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1t
dXRleCIsCj4gPiAtICAgICAgIC5kYXRhID0gJm10MjcwMV9kZHBfZHJpdmVyX2RhdGF9LAo+ID4g
KyAgICAgICAuZGF0YSA9ICZtdDI3MDFfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItZGlzcC1tdXRleCIsCj4gPiAtICAgICAgIC5k
YXRhID0gJm10MjcxMl9kZHBfZHJpdmVyX2RhdGF9LAo+ID4gKyAgICAgICAuZGF0YSA9ICZtdDI3
MTJfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxNjctZGlzcC1tdXRleCIsCj4gPiAtICAgICAgIC5kYXRhID0gJm10ODE2N19kZHBfZHJp
dmVyX2RhdGF9LAo+ID4gKyAgICAgICAuZGF0YSA9ICZtdDgxNjdfbXV0ZXhfZHJpdmVyX2RhdGF9
LAo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1tdXRleCIs
Cj4gPiAtICAgICAgIC5kYXRhID0gJm10ODE3M19kZHBfZHJpdmVyX2RhdGF9LAo+ID4gKyAgICAg
ICAuZGF0YSA9ICZtdDgxNzNfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gICAgICAge30sCj4gPiAg
fTsKPiA+IC1NT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkZHBfZHJpdmVyX2R0X21hdGNoKTsKPiA+
ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdXRleF9kcml2ZXJfZHRfbWF0Y2gpOwo+Cj4gSSB0
aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIGluIGEgZm9sbG93LXVwIHBhdGNoIHRvIHVwZGF0ZSB0
aGUgYmluZGluZwo+IHRvIHVzZSAibWVkaWF0ZWssbXQyNzAxLW11dGV4IiB0byByZWZsZWN0IHRo
YXQgbXV0ZXggaXMgdXNlZCBmb3IgZHJtIGFuZAo+IG1kcCBkcml2ZXIuIE1ha2Ugc2Vuc2U/CgpZ
ZXMsIGl0IG1ha2Ugc2Vuc2UuIEkgd291bGQgdHJ5IHRvIHVwZGF0ZSB0aGUgYmluZGluZywgYnV0
IEkgd29uZGVyCmRldmljZSB0cmVlIHNob3VsZCBiZSBiYWNrd2FyZCBjb21wYXRpYmxlPyBMZXQn
cyBkaXNjdXNzIGluIHRoYXQKZm9sbG93LXVwIHBhdGNoZXMuCgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPgo+IFJlZ2FyZHMsCj4gTWF0dGhpYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
