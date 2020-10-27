Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5516CC56201
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:20:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE23D22263
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tRn7V/sC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/n8t7qi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE23D22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KCcjv2KHDg6uKL+VzY9VmW+7XAJk4g8hQ2ZJhQxv/lE=; b=tRn7V/sCFEX0Qdo205UDTqPV6
	T2dsqCpEoXc5unmxrR+TAKlmBt6vODb22tZr2681UGw27k6Bru6g1El/V8lJbI3WSYgtF++1RpbWY
	dJkR5gzj20a09NDAlrRThpQOLWRU17BdQwwgDG3MR8j7kGY6ic7mRL9ieNzL8I7AFyhe5ZpYQipdp
	KdldXj3RkdCeJp2+cNYdD4xN0TaEJmVK81m/JR8EZl92r4qo8j5MxQRQKhH55lKP+Rwb9/c2bfGue
	R2brm0sG1Y9XcAjp7oRbwx+fO5RoDomHVsPTCfEO1APt7hqiaFlhdZX1mxgnlSGL072kGnVTfdWk7
	hPy2Fid0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXM53-00047W-0S; Tue, 27 Oct 2020 10:19:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXM50-00046C-FJ
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 10:19:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id v5so813962wmh.1
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pZ4tF9Q35IB/PKnNsjsCcJxf1aDEpdznaVzDYuv50v0=;
 b=C/n8t7qiHHIkKH6qBlW/WOBQPU58wfsvqwRg3TcTxZVnfjMweZXACSUeQ2Yr0SJona
 bdgxQpS37set3XzGvi8D9HYTSw1RmWWModldxM0e+cGehXYXRU3K1mTjOK4kL6y6nXo5
 /axUIi8EVPPR1jt57T2cmyeoVG/atnjZdaO6/010kCwExM5C4qTg8Gv2OwtoRDRI/Wxn
 BmXfJXcLVV6OgliOWyqFM9J+HmGm+kg7QrCtLylTtWhX7bp2PpYVCEtkQbYr2pOTj/vX
 hOgbmlhiz1rrdO/0zg6f1qwltCzISSTi3Q6IV68wglD4tuMZOCdDa7vWfcS9uy2c4oGG
 wz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pZ4tF9Q35IB/PKnNsjsCcJxf1aDEpdznaVzDYuv50v0=;
 b=HP5045jEkCrdIt3ai9ZrCcSQsacQU4V/g/LGX1Zsxdgvx2I8ggBrUII0yln4/IOwvV
 wlRQa8jIf5RV7dki/QZslYUIlQssydvg+jqbwYMzIQr5xE0JwRcd5C8sN6xAx1Nh2f1J
 Dzu1/BN0oyDjYdthQimaklQbmCC/5cMgknuFKxWVr2TPXtZ/VmoaEZZwn9ISCh5EsqjJ
 P6jNsBxKX0od9Ww9Iuf7aSZUI+kE8DneCIcyED+hyfCNRto1y517W+u1t6v3hsKt4JRx
 1sVbU3JSVE8Ef3d9RWMvvgz/KbS8bLq6NpTsvhNZWJSDFwl+lt2utLSE4WTeMIBqOG7F
 qhCw==
X-Gm-Message-State: AOAM531xVZ32JzDQQPIMn8ZEDQ5FmyyXXwnV2omUr2tH8L0MTt2GxQmj
 VTAzW7mDj5zopLe9CqqON23PAw==
X-Google-Smtp-Source: ABdhPJzce/1cq7vO5et/wMCpGxoUY58Gq/wHtjsAUhmiTgM1W35aRGvgZYGxLwfJWRUAVClAG3qCoA==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr1911316wml.178.1603793987905; 
 Tue, 27 Oct 2020 03:19:47 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:6cbc:1a3:aabd:d451?
 ([2a01:e34:ed2f:f020:6cbc:1a3:aabd:d451])
 by smtp.googlemail.com with ESMTPSA id l16sm1472264wrx.5.2020.10.27.03.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:19:47 -0700 (PDT)
Subject: Re: [PATCH 1/3] dt-bindings: thermal: mediatek: make resets property
 optional
To: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20201021164231.3029956-1-fparent@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <d8a5ce64-04da-7a4a-bcb9-1cc25cea42db@linaro.org>
Date: Tue, 27 Oct 2020 11:19:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021164231.3029956-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_061950_529008_CEC9C2CC 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: matthias.bgg@gmail.com, rui.zhang@intel.com, robh+dt@kernel.org,
 amitk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjEvMTAvMjAyMCAxODo0MiwgRmFiaWVuIFBhcmVudCB3cm90ZToKPiBNVDg1MTYgVGhlcm1h
bCBJUCBkb2VzIG5vdCBzdXBwb3J0IHJlc2V0LiBNYWtlIHRoZSByZXNldHMgcHJvcGVydHkKPiBv
cHRpb25hbCBpbiBvcmRlciB0byBiZSBhYmxlIHRvIHN1cHBvcnQgTVQ4NTE2IFNvQy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0K
CkFwcGxpZWQsIHRoYW5rcwoKCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86
ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRw
Oi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJv
Lm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
