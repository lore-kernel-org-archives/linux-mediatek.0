Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD87C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EusRS5BHPcMgJ2EvJXqr6C9Kx4/QcVSxsekP8lacBzU=; b=XzjaCHNqwTO7jp
	HZ/L1C4SxSwNj8uysX5KRTlyM6GDRvy4rnzjHa7toN5W1244Zxtt6qU4yPPYGYOFew7nnvhnyByTK
	FDG7srcRyPwe71lMM5eH1q1C/r6jFayg3FJ7WegTsmnla0DVkSaS3j/eoU4AR3XDuLNNgfW9CdIfS
	SOhaG3nQg7645vmSgkumPpyWBOjWflBR7VAhbsaC/ttSMZzB43u1VM5/YNG96X+A21rzDa8fDwCpH
	092P/cApWLRDu7OZkt1EmZmD8n3XyI7N7rBEW5p2hWD+xfVnIJKWY81vV9LPOInqsPQrWXi7oUEiM
	4WeKfmdZMEJcFi5iuUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvb5R-005zs5-SA; Mon, 30 May 2022 08:49:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvb5G-005znF-50
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 08:49:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id n28so3771014edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KdmTZKV5bAWWibsKGoDyDVnawfDT1ekKG/l9wkg6Dbo=;
        b=O+tMK7fKkNS3cdG00a7FIZz8rDmwpiQ4s28vmwkRJ4H+PxsdNK2NP/kzmoyI32uKvn
         ceLHtiBCigj8mIKJSpIuJW2SCh3qDetUFXBtiFO2K8AkKdlUVjoULSwy+w0+2dj3iHd5
         P6msn19xSYiMEMXSxiI1LrXQQMSQzIACSBdmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KdmTZKV5bAWWibsKGoDyDVnawfDT1ekKG/l9wkg6Dbo=;
        b=HHacbrFXMlWhOt+WnQ+dtlM/5xAHhrfhlWSSWlu0+fnOq8fxAjVzklO4TIk00Twwnj
         zdXHqkNOmqOLYifeEf49Q/XTwGDe8KLHLlrKydy0Pe34JGix1mNoJ0iZdSd0rBHbP5KD
         PEMRJCaER7B9wnoj2AVoeQRX14wumAAkMMlDwEiftwc/WeGnIgJdrFp8ls3Xd4lgKcrY
         jb3KXCjU1dcjlmYkvY2u82pzhKXoS0oZOyvm1l0l7F0T0xCCGx/hSLmD1QRhA1ZtYy+O
         WSmJw1gWjhGlu8Ngl93R3mRZe7UXtOX0pTvxdbdghXK9xmbc/EPldxtycAQ7wgMsEwfu
         eSSw==
X-Gm-Message-State: AOAM530FIL5AQjTo4x2JBYF+jz28mfWueBc2WXBczx/VgB4CuPUCjBgd
	rItEzM8UGXL07//dNfXNwUk8b0F7t4yjO2XOXurM+w==
X-Google-Smtp-Source: ABdhPJwchKnnxjbAHZc6RltykgOiT9kT+2Oq/vjwVsee32HXXttxbpNK8n6+tJXaL8hgRk8PqRd69W2OF9hgdc/ruxc=
X-Received: by 2002:a05:6402:2381:b0:42d:c8fe:d7fe with SMTP id
 j1-20020a056402238100b0042dc8fed7femr7872055eda.248.1653900542017; Mon, 30
 May 2022 01:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220525155714.1837360-1-nfraprado@collabora.com> <20220525155714.1837360-2-nfraprado@collabora.com>
In-Reply-To: <20220525155714.1837360-2-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 May 2022 16:48:51 +0800
Message-ID: <CAGXv+5FRAvJpn-Nz08NLzqj+X+-yXLx6w-Bz7qa9g8Ct5xTNYg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: mt8192: Add drive-strength-microamp
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_014906_250988_6CBD2EEE 
X-CRM114-Status: GOOD (  11.26  )
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

T24gV2VkLCBNYXkgMjUsIDIwMjIgYXQgMTE6NTggUE0gTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8K
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IENvbW1pdCBlNWZhYmJlNDNmM2Yg
KCJwaW5jdHJsOiBtZWRpYXRlazogcGFyaXM6IFN1cHBvcnQgZ2VuZXJpYwo+IFBJTl9DT05GSUdf
RFJJVkVfU1RSRU5HVEhfVUEiKSBhZGRlZCBzdXBwb3J0IGZvciB1c2luZwo+IGRyaXZlLXN0cmVu
Z3RoLW1pY3JvYW1wIGluc3RlYWQgb2YgbWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2Lgo+Cj4g
U2luY2UgdGhlcmUgYXJlbid0IGFueSB1c2VycyBvZiBtZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1h
ZHYgb24gbXQ4MTkyCj4geWV0LCByZW1vdmUgdGhpcyBwcm9wZXJ0eSBhbmQgYWRkIGRyaXZlLXN0
cmVuZ3RoLW1pY3JvYW1wIGluIGl0cyBwbGFjZSwKPiB3aGljaCBoYXMgYSBjbGVhcmVyIG1lYW5p
bmcuCgpDb29sISBUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIHRoaXN+IEkgd2FzIGxvb2tpbmcg
YXQgdGhpcyBhbmQgdHJpZWQKdG8gbWFrZSBkcml2ZS1zdHJlbmd0aCBhbmQgZHJpdmUtc3RyZW5n
dGgtbWljcm9hbXAgbXV0dWFsbHkgZXhjbHVzaXZlLApidXQgc2luY2UgdGhleSBhcmUgb3B0aW9u
YWwsIGl0IGRpZG4ndCByZWFsbHkgd29yaywgYW5kIEkgcHV0IGl0IG9uIHRoZQpiYWNrIGJ1cm5l
ci4KCgpDaGVuWXUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
