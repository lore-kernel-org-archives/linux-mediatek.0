Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50824C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:10:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD26861153
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 06:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD26861153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TG/4JqjpPLqmoqDn4x7hDguhSNHKr8BU3l8q0+qltZY=; b=VvlkxqrZmAUF8zSEyQD6JFRcb
	JHQATlzmsti+RvAhdMhEVvvgbP5CYIjWjIx+bcmIQCos2V3uGXZTWTolq7vOfvHTe/QtgY/Oh+TgM
	Y3h6U8reEEr/a0wY5OeGfDfpHK+91ro/FoMqJ59iAPviszjgtmBNcSAa9EkrUq1dPZpOQUnxeGR8z
	DfKFV1/RN7F0739drjA5uaQ8ChoSEwxsPAiO0fAJeNHIodUSUkaoo5k+DWgxiHvDOXslZ5Y3jRXpV
	x127PHeQyiUG9SMkd2uGcdwMu3FWw2fkn9V/BWVzoUPDHrllwLb5jSJs5X0s9Co/uBwKzZ9rLUrxz
	Z3I7jhZzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHgK-000yKC-4e; Fri, 16 Apr 2021 06:10:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHXW-000wZB-0a; Fri, 16 Apr 2021 06:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=59UpTKt8YsSM4yGeu5c+Ux0/BszmMe/B0VMIiCo5InM=; b=HU6ZvKRl4TgrZ9Pz9yfHUDjDCI
 +sgvXntGUVcjcjLKYz/NH7qrNvIKlyAEXSKd+E7uqnUTD67Cq1cZZD3Z/I7+plk6oEcnbx03PRKcf
 8HQvqWvYzBjSbwIpnFYEXn/+jELEMVCJAvQSp9gFSE5+43Sxm57qB3ZjZ3Wn9CnoEbFbuzcU01QGO
 hdSKNlgkA1knIvdzvboGib2IRFHqDZN9d1hz9NOsPizvD8OQjqZJHM3GIo3La5m6TJpFJnCzKsczN
 HZZVJkgFfm6/j3peJOYJNYNzd8WSbQRomo08Kgc0ZwnTQ2Uvet+scgAExlmBNAQ6/kM4AliM7RpcX
 Y/KJ/lpg==;
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHXT-0096OT-4N; Fri, 16 Apr 2021 06:01:12 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 101-20020a9d0d6e0000b02902816815ff62so18896250oti.9; 
 Thu, 15 Apr 2021 23:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=59UpTKt8YsSM4yGeu5c+Ux0/BszmMe/B0VMIiCo5InM=;
 b=AlBYRPkf4BcdE5GsKj8NLy9Ztx84clzZk2jWtyx1bRTRPu0aEnpU750JylT5G/IU00
 ineal0qXWAnllcNxV+OXG5SNvmhqs4QG+AKASREA6S96ilhUpRweNRb3c12RNtMp3nKx
 5jvNPfgLfokqgUmTqdQvVd03l57R6DAeHInc3N4dQ/9FTEPXi/35OWo95jgatEpeaLw3
 dTpBxPCcmJ67QJymQWSOxlMvnIa+58URGDAiZ9BIE7bWw+LGFmLr9L9Oj+6Y5L/aMIzi
 STPV0ldYRipsgehpStEo+jOgg2yTieIdl9+a89yVuDTpZWQAOq1BcdwUxmEzgG5J/svQ
 nIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=59UpTKt8YsSM4yGeu5c+Ux0/BszmMe/B0VMIiCo5InM=;
 b=KqhDo2MXPbiUZ+KjjLNMWbQKAW5kfyLjYZdBSR7bSJLcdIBFEO/GfFjBe77LxZrD9v
 zA+i40taqHWEv/H2nBW711Xvb/p/QGgzJ0xUwWIwxsC1x/fNdMiXHRinDS6TRg5fE5+/
 BYk+27pCR1/qDx5cNo1k3trDG9YGfoh3GYkGM3BlCIu741GkXYpJg42iml9njQ1Ruus+
 dgiPclIqCyDwMHmwe7Wsou3N3VNnov6ErGBaCrcVuuosO+CbxgFJv0IdSedw6sO29O8c
 tdfnCQbQKedl+6FeQQ3TAFYWV3RJ/e9Md2miroQQB+fV/fn7tkSrS76xytHyTW5cqYiE
 d/bg==
X-Gm-Message-State: AOAM531J0A+abiAtfVNGnMYsJj3g6XwJ8ca+xCFfIlwMezDIyB9WjjtY
 dZ7fLeo2AStSF+8o7/+u9ScZzxIpY5mj8fKt5W0=
X-Google-Smtp-Source: ABdhPJxBKw4vtrSAg1ORAmYzpKMGQpP+wahz4rortWZlJxR83gLaTM9Dqyb9dP7Xrw17j3oaTXBFoqpEKPE7GgHmHYg=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr2499173otq.281.1618552870163; 
 Thu, 15 Apr 2021 23:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093519.1920877-1-hsinyi@chromium.org>
 <20210415093519.1920877-7-hsinyi@chromium.org>
In-Reply-To: <20210415093519.1920877-7-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 08:01:02 +0200
Message-ID: <CAFqH_50LbYBbJKs_yYQRuW7RPnwVTyJo_n7ZyJ-H_4u955b1NA@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_230111_212218_32995DC1 
X-CRM114-Status: GOOD (  16.78  )
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

SGkgSHNpbi1ZaSwKClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4KCk1pc3NhdGdlIGRlIEhzaW4t
WWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gZGVsIGRpYSBkai4sIDE1IGTigJlhYnIuCjIw
MjEgYSBsZXMgMTE6MzY6Cj4KPiBCdXJuZXQgaXMga25vd24gYXMgSFAgQ2hyb21lYm9vayB4MzYw
IDExTUsgRzMgRUUKPgo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9t
aXVtLm9yZz4KClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxs
ZXRib0Bjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9NYWtlZmlsZSAgICAgICAgIHwgIDEgKwo+ICAuLi4vbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWph
Y3V6emktYnVybmV0LmR0cyAgfCAzMyArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS1idXJuZXQuZHRzCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZSBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUKPiBpbmRleCA1ZjQzYmJjMmVhNzIuLmIzM2Qw
YmM1ODAyMSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2Vm
aWxlCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZQo+IEBAIC0x
Myw2ICsxMyw3IEBAIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBtdDgxNzMtZWxtLWhh
bmEuZHRiCj4gIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBtdDgxNzMtZWxtLWhhbmEt
cmV2Ny5kdGIKPiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUspICs9IG10ODE3My1ldmIuZHRi
Cj4gIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSArPSBtdDgxODMtZXZiLmR0Ygo+ICtkdGIt
JChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ4MTgzLWt1a3VpLWphY3V6emktYnVybmV0LmR0
Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ4MTgzLWt1a3VpLWphY3V6emkt
ZGFtdS5kdGIKPiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVESUFURUspICs9IG10ODE4My1rdWt1aS1q
YWN1enppLWp1bmlwZXItc2t1MTYuZHRiCj4gIGR0Yi0kKENPTkZJR19BUkNIX01FRElBVEVLKSAr
PSBtdDgxODMta3VrdWktamFjdXp6aS1rYXBwYS5kdGIKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS1idXJuZXQuZHRzIGIvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS1idXJuZXQuZHRz
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmI5N2NhMzMxOTcw
ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE4My1rdWt1aS1qYWN1enppLWJ1cm5ldC5kdHMKPiBAQCAtMCwwICsxLDMzIEBACj4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCj4gKy8qCj4gKyAqIENvcHly
aWdodCAyMDIxIEdvb2dsZSBMTEMKPiArICovCj4gKwo+ICsvZHRzLXYxLzsKPiArI2luY2x1ZGUg
Im10ODE4My1rdWt1aS1qYWN1enppLmR0c2kiCj4gKwo+ICsvIHsKPiArICAgICAgIG1vZGVsID0g
Ikdvb2dsZSBidXJuZXQgYm9hcmQiOwo+ICsgICAgICAgY29tcGF0aWJsZSA9ICJnb29nbGUsYnVy
bmV0IiwgIm1lZGlhdGVrLG10ODE4MyI7Cj4gK307Cj4gKwo+ICsmbXQ2MzU4Y29kZWMgewo+ICsg
ICAgICAgbWVkaWF0ZWssZG1pYy1tb2RlID0gPDE+OyAvKiBvbmUtd2lyZSAqLwo+ICt9Owo+ICsK
PiArJmkyYzAgewo+ICsgICAgICAgdG91Y2hzY3JlZW5AMmMgewo+ICsgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImhpZC1vdmVyLWkyYyI7Cj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDJj
PjsKPiArICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArICAgICAg
ICAgICAgICAgcGluY3RybC0wID0gPCZ0b3VjaHNjcmVlbl9waW5zPjsKPiArICAgICAgICAgICAg
ICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmcGlvIDE1NSBJUlFfVFlQRV9MRVZFTF9MT1c+Owo+
ICsKPiArICAgICAgICAgICAgICAgcG9zdC1wb3dlci1vbi1kZWxheS1tcyA9IDwyMDA+Owo+ICsg
ICAgICAgICAgICAgICBoaWQtZGVzY3ItYWRkciA9IDwweDAwMjA+Owo+ICsgICAgICAgfTsKPiAr
fTsKPiArCj4gKyZpMmMyIHsKPiArICAgICAgIGNsb2NrLXN0cmV0Y2gtbnMgPSA8NDEwMD47Cj4g
K307Cj4gLS0KPiAyLjMxLjEuMjk1Lmc5ZWE0NWI2MWI4LWdvb2cKPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
