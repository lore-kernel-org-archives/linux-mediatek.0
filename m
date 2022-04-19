Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KqhqQIrzD5mUAXRm0pzfTzhxHZYVIZ8RP2hV2/7VOc=; b=TNaUcnL0tGG9nl
	fL3gdtieeCtQuoAeW2NQh6ZXUZKsgWWCXVz9Yy0gGeNNZ4AzYVnH6jt6hZoh9DfmJ0NbvIfFs/9mD
	oTHMNJ9gosUFSXtnbvrlZIpbD69fO1gN0q+OForOVncfhGKUDGHFasr6V2nNd7gpKiYCOsSUgCs1w
	LX4XtDtff9RiQIwWuFK4gy0F3JCvMYCsbZu+yPHXRP9jkSnxCGBDOxWHTXQ+r7OLiY9jFxf4U+7uE
	8IDF/gdCed7bnnZFU/i+Vjt72aUc4A2U+LAQQb4c1vTb4Xv4UxNNnTc9f1qlkyC0UAc0pTyss8B0v
	ac6OerZdZM199p7zgr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngvCF-006Nle-ET; Tue, 19 Apr 2022 21:15:39 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngvC2-006Ng5-2u
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 21:15:27 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2eba37104a2so187372577b3.0
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 14:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bOCs7bEkMlCU55rgehqm/ct2scIWY/qXcB9Xu0/dpE8=;
 b=a1axMsNeO7mFl02JraXPiyLN/63tZlUj4XEXh/1CG6XkrIAezaf7iBU9QKG4hkCErY
 aEr4uvTAiD3Rt3vDMQfP3i/b8XDDanKX74ykjXZo+GnFDOS2CZH0drTPyqIGkWT35+Yr
 UREgvW73HeKNaB8aoW5EBdgfJVRxbP5LCYs/FEkl/lI49OZn6pQAoYYljOTf8N5rXOZV
 7WKheKCohzx5N2LpDrJwyP6xUOoatVjgrnh03VItZlUqrXOqi/pbnP8qgpF9skKMqxPJ
 EBZUbkrwqZwKXy2R0X7Xx1m+0RyoKS3ep9RFtJD5uirgN76KvRUn+FsGr9AUubGp/cu9
 AbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bOCs7bEkMlCU55rgehqm/ct2scIWY/qXcB9Xu0/dpE8=;
 b=Ozn59tYoUksjhFHqsPYWtfNkME0P5TbmdY4cdZHaG+cuQC2oJJWVooNn4Agvk8nunv
 lW98xwPd9DqVi7pdJ5yrW5w9cnl5X853qLGFvWr4yIlMZ1P00G6yeKM4xAX8i6eK3/7T
 i8GStCuum1K58vKI9tx7+6mfeh/tZEZkdouPpY7o+HNvjdocEHQG9vFyMdf03gmfYVFv
 mJ26TFmd35IGhudIfULYbNiPh6ScjEXSzPgPhjA+RxYLujV/8NesdkkMwk+YyMeqiDYM
 KcpvRjB/P2FzJSsqNsa0cUipaXhWVLNZ+Au1R1kglOmtXVQDSivZXMt3+6108AQfEkw6
 /1RQ==
X-Gm-Message-State: AOAM533mXweu/rXCm8jECtbppAg9oPdwGG2dVlpTA0zFJTFtXgMPX7W6
 tmuDYM1qGvMZpxB9tcGU9xnwEeXJO7eFcVJPXVE1zA==
X-Google-Smtp-Source: ABdhPJyA/B/8ozJTOa4FYCgN2HReHc/Scq8Wo6z6yHWfCrTkAc6WTAwjAyoG3E8aJQiE7sq+YIEG84NwzJ5InDW+ukg=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr19141326ywh.140.1650402923618; Tue, 19
 Apr 2022 14:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-5-nfraprado@collabora.com>
In-Reply-To: <20220315211936.442708-5-nfraprado@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Apr 2022 23:15:12 +0200
Message-ID: <CACRpkdYSJFYMnUVLUy-weaiOU=93HEygw-uLUjP8Ovc6Uq1HNw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] dt-bindings: pinctrl: mt8192: Add gpio-line-names
 property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_141526_162306_9ED02275 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBNYXIgMTUsIDIwMjIgYXQgMTA6MjAgUE0gTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8K
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gQWRkIHRoZSBncGlvLWxpbmUtbmFt
ZXMgb3B0aW9uYWwgcHJvcGVydHkgdG8gdGhlIHBpbmN0cmwtbXQ4MTkyIGJpbmRpbmcKPiB0byBw
cmV2ZW50IGR0X2JpbmRpbmdfY2hlY2sgd2FybmluZ3Mgd2hlbiBpdCBpcyBwcmVzZW50IGluIHRo
ZSBwaW5jdHJsCj4gbm9kZSBpbiB0aGUgRGV2aWNldHJlZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KClBhdGNoIGFw
cGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
