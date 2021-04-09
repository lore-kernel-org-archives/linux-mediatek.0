Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ACAC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 22:44:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3683261165
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 22:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3683261165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/ebxTeAkp2eZZ6KxzoKKl+aP0kxMl5ICYHSlvwE+Hsk=; b=gu0b4gxPL9zCzD+CH1/9tGgTH
	KoyGWpha0MFcoYAcmCStNRixJHHN3/63JzpRhERjIH2gYzgKYoqHup5HisTVZOknB3N9k3wTygECS
	TIO900geG7+8Q1Ee+Nz6uQJqrSG7Icy4oHjR8NGYipiQOBbRbhhitsJJ5MfPTdo0nbWxcIH5O3F2G
	fLY0Q5EpkUFOo8FUveagXGJJ548UTB8LtsCtrDXGLP5d7AWrdW4u1IaeIDUJU3ogB0rEgL5rjsu8+
	/9i1tP99cewd2AjnDkQZYbaTLLgdYeekUtJ+dz/m1ddkucPH7xHZ6ButoY5VmzP06mha1NREimiPP
	glQsx7u0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUzrO-001dd1-6f; Fri, 09 Apr 2021 22:44:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUzp5-001dMd-CW; Fri, 09 Apr 2021 22:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=4aCJx9NpcPGAYgmQQAK4w5AHYMvMiRtxYc1FlnDWc6Q=; b=XGbAU+M218idfa7gjPvuplXBGO
 sr8zSv3u3oLzMQlh2MmexgqqqT6kdbAsrvdXuqdiYUwpYC3Fnb7BTxzfsJF0rX9HL1rfZyRo8SBgC
 xh5eduHCmxlntvK2kYIME7POXjAYlwCGoyF0yTEvl4K8sO2HI35MC1pBexJI+LgfynEtRv0CI6LI4
 V5SzhYKdI6rf5xgjb4dc98pK5kS9ltLVwb8guZy1fHX4CRX5cAt0MqXDevcUeEUbn4SnsVM76QJ5f
 sb2A579xGavvMm9LJaRYnfUnocQjeQJwBA3kWWDpj6YHhLUaUv7x3YN+eLC9VlUxfqF8it3SE+iVp
 QW6Tellw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUzp2-004q4H-QR; Fri, 09 Apr 2021 22:41:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BB0E611CA;
 Fri,  9 Apr 2021 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618008109;
 bh=kPU9MHQc5UBpAesVzgChKDqg5ezVTH1zzx3kKya3lS4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mfx9Ja5QDAcDuMJ0cIxsWj13awopKAanMQQzk+uzyiLfl6TBS7Xqs4+NpUjdzNUXC
 75PSiAv+VD5ODnnyL39lVTG/vhDVaXwWJ2E0MfPoxNMEXd/N0TnLm4k9lkt64NNf+c
 l+Bp0I2AC9QSs6qF+l5MmOKKOQzpmgmRHEmYpoXr3s44mYSjUKF+Cn4+8eOQ1Tc7MH
 YxHaByhjSpZ1f/9UG1k29pR6Z97BaFBRBtxI6BVt1LKOcx7F7Doq5fplTZ2ViyigxG
 D5vBngsUX2T3QOTDzGuvJZ/Dn73CQymnFUi9V6PtdVkgqFfrulmeI1SzHSQA2h2jC2
 cadyrrYvXPmIg==
Received: by mail-ej1-f52.google.com with SMTP id a7so11039896eju.1;
 Fri, 09 Apr 2021 15:41:48 -0700 (PDT)
X-Gm-Message-State: AOAM531TBNpAlhYvzpJHbXru99TvjUeT7HHQ5HarlZIx8A4xxbEu3vRK
 0BjHcBLYtHoRtKPzjIIlqbP2qz07LSKDPHEYow==
X-Google-Smtp-Source: ABdhPJxHH2lrOdOuGA1wZAlZs2TRipft1zFc1O4kBSOWkcjad7ttw50P23oLD4EgsHthvgWENyhgcC/G8ZhZKbbGe4U=
X-Received: by 2002:a17:907:700d:: with SMTP id
 wr13mr18342403ejb.310.1618008107597; 
 Fri, 09 Apr 2021 15:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210409084308.481185-1-narmstrong@baylibre.com>
In-Reply-To: <20210409084308.481185-1-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 10 Apr 2021 06:41:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-gqN2HCLg6AABsXYzJoBxpN8FkMfjqWFu2q=6noiY1qg@mail.gmail.com>
Message-ID: <CAAOTY_-gqN2HCLg6AABsXYzJoBxpN8FkMfjqWFu2q=6noiY1qg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm: mediatek: hdmi: check for valid modes on MT8167
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_154152_921601_19FC0210 
X-CRM114-Status: GOOD (  19.94  )
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

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIx5bm0NOaciDnml6Ug6YCx5LqUIOS4i+WNiDQ6NDPlr6vpgZPvvJoKPgo+IE9uIE1UODE2Nywg
b25seSBDRUEgbW9kZXMgYW5kIGFueXRoaW5nIHVzaW5nIGEgY2xvY2sgYmVsb3cgMTQ4NTAwIGlz
Cj4gc3VwcG9ydGVkIGZvciBIRE1JLiBUaGlzIGNoYW5nZSBhZGRzIHNvbWUgY2hlY2tzIHRvIG1h
a2Ugc3VyZSB0aGUKPiB2aWRlbyBmb3JtYXQgaXMgT0sgZm9yIE1UODE2Ny4KCkkgdGhpbmsgdGhp
cyBwYXRjaCBzaG91bGQgYmUgc2VwYXJhdGVkIHRvIDMgcGF0Y2hlcy4gY2hlY2sgQ0VBIG1vZGUs
CmNoZWNrIGNsb2NrLCBhZGQgbXQ4MTY3IGhkbWkgc3VwcG9ydC4KCj4KPiBTaWduZWQtb2ZmLWJ5
OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBO
ZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jCj4gaW5kZXggOGVlNTVmOWUyOTU0Li45OTFlMmU5MzViOTMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC0xNDgsNiArMTQ4LDggQEAgc3RydWN0IGhkbWlf
YXVkaW9fcGFyYW0gewo+Cj4gIHN0cnVjdCBtdGtfaGRtaV9jb25mIHsKPiAgICAgICAgIGJvb2wg
dHpfZGlzYWJsZWQ7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIG1heF9tb2RlX2Nsb2NrOwo+ICsg
ICAgICAgYm9vbCBjZWFfbW9kZXNfb25seTsKPiAgfTsKPgo+ICBzdHJ1Y3QgbXRrX2hkbWkgewo+
IEBAIC0xMjU5LDYgKzEyNjEsMTMgQEAgc3RhdGljIGludCBtdGtfaGRtaV9jb25uX21vZGVfdmFs
aWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm4sCj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIE1PREVfQkFEOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBpZiAoaGRtaS0+Y29uZi0+
Y2VhX21vZGVzX29ubHkgJiYgIWRybV9tYXRjaF9jZWFfbW9kZShtb2RlKSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIE1PREVfQkFEOwo+ICsKPiArICAgICAgIGlmIChoZG1pLT5jb25mLT5tYXhf
bW9kZV9jbG9jayAmJgo+ICsgICAgICAgICAgIG1vZGUtPmNsb2NrID4gaGRtaS0+Y29uZi0+bWF4
X21vZGVfY2xvY2spCj4gKyAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX0hJR0g7Cj4g
Kwo+ICAgICAgICAgaWYgKG1vZGUtPmNsb2NrIDwgMjcwMDApCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBNT0RFX0NMT0NLX0xPVzsKPiAgICAgICAgIGlmIChtb2RlLT5jbG9jayA+IDI5NzAwMCkK
PiBAQCAtMTgxMCwxMCArMTgxOSwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19oZG1pX2Nv
bmYgbXRrX2hkbWlfY29uZl9tdDI3MDEgPSB7Cj4gICAgICAgICAudHpfZGlzYWJsZWQgPSB0cnVl
LAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2hkbWlfY29uZiBtdGtfaGRtaV9j
b25mX210ODE2NyA9IHsKPiArICAgICAgIC5tYXhfbW9kZV9jbG9jayA9IDE0ODUwMCwKPiArICAg
ICAgIC5jZWFfbW9kZXNfb25seSA9IHRydWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX2hkbWlfb2ZfaWRzW10gPSB7Cj4gICAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1oZG1pIiwKPiAgICAgICAgICAgLmRhdGEgPSAm
bXRrX2hkbWlfY29uZl9tdDI3MDEsCj4gICAgICAgICB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxNjctaGRtaSIsCgoibWVkaWF0ZWssbXQ4MTY3LWhkbWkiIGRvZXMg
bm90IGV4aXN0IGluIGJpbmRpbmcgZG9jdW1lbnQsIHNvIGFkZCB0aGlzCnRvIGJpbmRpbmcgZG9j
dW1lbnQgZmlyc3QuCkluIGFkZGl0aW9uLCBjb3VsZCB5b3UgYWxzbyB0cmFuc2ZlciBtZWRpYXRl
ayxoZG1pLnR4dCB0byB5YW1sIGZvcm1hdD8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAg
ICAgICAuZGF0YSA9ICZtdGtfaGRtaV9jb25mX210ODE2NywKPiArICAgICAgIH0sCj4gICAgICAg
ICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1oZG1pIiwKPiAgICAgICAgIH0sCj4g
ICAgICAgICB7fQo+IC0tCj4gMi4yNS4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
