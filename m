Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71C4C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlK/SfB/siMAvDaEzqtpBw/3QQPsmr+tgODlJINWTF0=; b=tMJpzur7VEOY4M
	LBGJezM/f3ZXsoTfOHooU0F17kd/UJMg5f5lVHqJN87pQIkC4iL1a34YMCaXkW9XR1zX9HZDdn+Fs
	6WoUsN4yrbOBiZiERi3+U85IacWpyjhiZbELIe0QPBtsWDlJq2x9GPWVuOh+YWmTjHCS3N51vRgsF
	LKJZvGhoeXIjofA8ghuaMn0+vVlgVUgebsmaucz1Tcxbe/wEu05OlvfFgcKlbv5E4ld14hkfOB2tC
	wDzj5j5PQxhzE/9pPkz4SrRyhCYEEM59iWhTMyymU9fQg4m8XABIvK38I/3CyY4q1vpygD1zzVE47
	MQ32yd3J4lK1S8rU+bJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwlNN-003VCH-VL; Thu, 02 Jun 2022 14:00:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwlNC-003V7d-Lt; Thu, 02 Jun 2022 14:00:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id rs12so10111174ejb.13;
        Thu, 02 Jun 2022 07:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AYxq+mMduPBX5NXqRBF2+5IJjnwegK5vDcEeTyInUPU=;
        b=auP1KW3KeSmMw7VIZ62/gbLMAnB923JIROgeNcNM60iNfs70SRXGH9Oh+PqNAIdl95
         sF3KgLrJAdhJvNL5E/yTCatacqFZTuJwNSgnwpd8r3nWCcjRXQOJQGh/LEv8L8WGwDHn
         GRMckxbpngc/1zSMfnGGQOEbWW1vqQbIAf/Fr7XQHihGGmhAIL+CXKz/Sx20mLoDFvK2
         Mrq/lvN37tLRQTJChv3fW11X7HfKADxJn3lW1n7mcgkdAUHAPKZhMEZRqOIIvJS+CQJo
         E9+wli3/tU0/Qxnp7IRGppAp11D6KG1QpREaRpW+RGISetT3kVGuRq7qeRk42Hciw7Be
         LYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AYxq+mMduPBX5NXqRBF2+5IJjnwegK5vDcEeTyInUPU=;
        b=Cq8bhatIG7Bus588ppyrj/blopKXahfaMk7ETi+ogXTgbuDS3XmckSMYQKQURIZWl+
         DdSLX2fOaZVKvCfaIbQMCHtG9zkAAM/UmINB6Obg66Ys/uCOxpAtFnf0uNu9Qy8mdvrJ
         VnLEjZ97nXXMIY71Vi0rd0WmslYTIARwkaYClYhTP/n37V5Lseoo94JRPePZL4Nic01F
         LXLQ64k6bJqqoyvym+OXYjMxNeCkc3RWX47a4HHn+Snpoqc3jY/+8gVPwI5hD4ntXkAI
         YIFVUBoUTGyYDmDtl52E2zAP6wHzwXZBAlQPU9x0LC/Da9SB4Ck388fuRj1XLygu/tHd
         vQdw==
X-Gm-Message-State: AOAM5323FciJ38fA43UzcfzuG6mnYDuo9FpiTARityV9Y95ZrJHI0ni5
	PnFz0gBIRYeH5fH3ITVC5hS3UjUFqCSfycRPLqA=
X-Google-Smtp-Source: ABdhPJxtpuBCKEOrj7yi3ocCsJZ0ETA3Lw0fV9RaebX5CwbyumoNpdxxmykaJXm5oH5aPRnpODJs/24H5iu7FWYfbjE=
X-Received: by 2002:a17:907:8a27:b0:707:cc50:e790 with SMTP id
 sc39-20020a1709078a2700b00707cc50e790mr4462180ejc.77.1654178424506; Thu, 02
 Jun 2022 07:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com> <20220531102809.11976-8-peterwu.pub@gmail.com>
 <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
 <CA+hk2fasiriGHepNjsnPCqTMJOgAEbVHACmWrDRZY7cHPcOQqA@mail.gmail.com> <CAHp75Vf=ATRfaaaGFuuPHuQj6wTjnRPBw4W5WYfgYuUP-A-L=g@mail.gmail.com>
In-Reply-To: <CAHp75Vf=ATRfaaaGFuuPHuQj6wTjnRPBw4W5WYfgYuUP-A-L=g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Jun 2022 15:59:48 +0200
Message-ID: <CAHp75VdDLnisODLCpTEHdGcxCFATdJHfJWf+=GdGtYV2U_o9+g@mail.gmail.com>
Subject: Re: [PATCH 07/14] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
To: szuni chen <szunichen@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, cy_huang@richtek.com, 
	alice_chen@richtek.com, chiaen_wu@richtek.com, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_070026_772053_63C5247D 
X-CRM114-Status: GOOD (  20.88  )
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

T24gVGh1LCBKdW4gMiwgMjAyMiBhdCAzOjU3IFBNIEFuZHkgU2hldmNoZW5rbwo8YW5keS5zaGV2
Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBKdW4gMiwgMjAyMiBhdCAyOjA3IFBN
IHN6dW5pIGNoZW4gPHN6dW5pY2hlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gQW5keSBTaGV2Y2hl
bmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiDmlrwgMjAyMuW5tDbmnIgx5pelIOmAseS4
iSDkuIvljYg1OjU35a+r6YGT77yaCj4gPiA+IE9uIFR1ZSwgTWF5IDMxLCAyMDIyIGF0IDE6MzIg
UE0gQ2hpYUVuIFd1IDxwZXRlcnd1LnB1YkBnbWFpbC5jb20+IHdyb3RlOgouLi4KCj4gPiA+ID4g
KyAgICAgICBjb25zdCBjaGFyICogY29uc3Qgc3RhdGVzW10gPSB7ICJvZmYiLCAia2VlcCIsICJv
biIgfTsKPiA+ID4gPiArICAgICAgIGNvbnN0IGNoYXIgKnN0cjsKPiA+ID4gPiArICAgICAgIGlu
dCByZXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgaWYgKCFmd25vZGVfcHJvcGVydHlfcmVh
ZF9zdHJpbmcoaW5pdF9kYXRhLT5md25vZGUsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiZGVmYXVsdC1zdGF0ZSIsICZzdHIpKSB7Cj4gPiA+ID4gKyAg
ICAgICAgICAgICAgIHJldCA9IG1hdGNoX3N0cmluZyhzdGF0ZXMsIEFSUkFZX1NJWkUoc3RhdGVz
KSwgc3RyKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKHJldCA8IDApCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gU1RBVEVfT0ZGOwo+ID4gPiA+ICsKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgbGVkLT5kZWZhdWx0X3N0YXRlID0gcmV0Owo+ID4gPiA+ICsgICAgICAg
fQo+ID4gPgo+ID4gPiBmd25vZGVfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKCk/Cj4gPiBTb3JyeSwg
YnV0IEkgdGhpbmsgdGhlIHVzZSBvZiB0aGlzIGZ1bmN0aW9uIGlzIGRpZmZlcmVudCBmcm9tIG15
IHRhcmdldC4KPiA+IEkgd2FudCB0byByZWFkIHRoZSBzdHJpbmcgb2YgdGhlICJkZWZhdWx0LXN0
YXRlIiBwcm9wZXJ0eSBhbmQgZmlndXJlCj4gPiBvdXQgaWYgdGhlIHN0cmluZyBpcyBpbiB0aGUg
c3RhdGVzIGFycmF5Lgo+ID4gQnV0IHRoZSBmd25vZGVfcHJvcGVydHlfbWF0Y2hfc3RyaW5nIGFp
bWVkIHRvIGZpZ3VyZSBvdXQgaWYgdGhlIHN0YXRlCj4gPiBpbiB0aGUgcHJvcGVydHkgYXJyYXku
Cj4gPiBPbmUgaXMgYSBwcm9wZXJ0eSBhcnJheSBhbmQgYW5vdGhlciBvbmUgaXMgYSBzdGF0ZSBh
cnJheS4KPgo+IEFoLCBpbmRlZWQuIE5ldmVydGhlbGVzcyB5b3UgbWF5IHJlZHVjZSB0aGUgY29k
ZSBiYXNlIGJ5IGRvaW5nIGxpa2UKPiB0aGUgZm9sbG93aW5nIChJIHdvbmRlciB3aGF0IHlvdXIg
Y29kZSBkbyBpZiB0aGVyZSBpcyBubyBkZWZhdWx0LXN0YXRlCj4gcHJvcGVydHkpOgo+Cj4gICBs
ZWQtPmRlZmF1bHRfc3RhdGUgPSBTVEFURV9PRkY7IC8vIGl0J3MgYnkgZGVmYXVsdCBvZmYgc2lu
Y2UKPiBremFsbG9jKCksIHNvIEkgZG9uJ3Qgc2VlIHdoeSB3ZSBuZWVkIHRoaXMgbGluZSBhdCBh
bGwuCj4KPiAgIGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3N0cmluZyhpbml0X2RhdGEtPmZ3bm9kZSwg
ImRlZmF1bHQtc3RhdGUiLCAmc3RyKTsKPiAgIHJldCA9IG1hdGNoX3N0cmluZyhzdGF0ZXMsIEFS
UkFZX1NJWkUoc3RhdGVzKSwgc3RyKTsKPiAgIGlmIChyZXQgPj0gMCkKPiAgICAgbGVkLT5kZWZh
dWx0X3N0YXRlID0gcmV0OwoKTWlzc2VkIGNoYW5nZQoKICBjb25zdCBjaGFyICpzdHIgPSBzdGF0
ZXNbU1RBVEVfT0ZGXTsKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
