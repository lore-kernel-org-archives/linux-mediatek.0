Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC33C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 15:49:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF412074F
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 15:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SEnjuOcE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cj1m6D1+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF412074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xff9QXa5iVxDnvHuihOLEsq/pjPk9uyjfvFwzZTQA+Y=; b=SEnjuOcEOAwr8NbGhDvUO6qp1
	fuWiuaOzSd6nrrVMAsDisvywMBfSP2oe8sdpyrst1oyN4NZOoYjKVTVjOAeyc399Yb5Z4hz4psVLX
	6I17Q8ASacOSyIO9C7uup0Eu7382P8mKJEw2vpsk4oxA5qc3WWZN1bHUSoIocJNIKelylFiJcKKeB
	obT9GOo1W/Yge6wcq0WdlAfP5itI19mqSs0ejX5y/QLgUwB4baOcl2FFz/RV1ZVgSnmb5DHE0BG7i
	ZYZXuiZwhAORNEfolrpmO9LP6kC7dUdXdxGjxqojLCf01DVm8fOsDVRTIIY7tb9G80xwISwLWpjy7
	M4wx5yNSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k05Ms-00010t-LS; Mon, 27 Jul 2020 15:48:46 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k05Mq-0000zN-2Z
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 15:48:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id f1so14843509wro.2
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ftDaS4GB93pqR50K0HNKbC88ac2C5NLman44G8+/LyE=;
 b=cj1m6D1+swe4DvbRaDEeTwdxgGLAdA0culkB6Ks72KZ3YF/BmYDotHHfe2/+AUJG5l
 l1rQsTXvM7RO+oJdHgpMCmmCSP6Fc3/xaC4bD+7HQfE3/PEwvhaUCjNrHXJAXdqkxtRk
 RodYtqA8PhxVLQ1zWBEuQgu65kRlrj18zaVdbAQ4SEMeB6eRqwzIK62XZeogD9dcq/ac
 D3ZLysh+S5EnyQtnrvczHZ7SmdSUv1gjIBClYk+jZ0N+1AgHT8+e+KuhRH0UXsRnzq9s
 I0958lQD71PhvsJrMc5owFCmX3UvrPO/7PAEcHu/2AlLiAxvO8jnEBv2CHpTCKWXOUJL
 WQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ftDaS4GB93pqR50K0HNKbC88ac2C5NLman44G8+/LyE=;
 b=AOtVEMve+7CZj4cp1DmdmPqIc0FBGVlm1FAmNuIVPa6rgGQ9rcWHULSvCIjwNz+VXl
 84Y6kVHmy8ycL7HzvoqdrasyKeOVLIoOm/47JHRcq9nBW+5EmD88FSUZFEjyG3cKNWUr
 D8Q8vRFUDe27thNJ86O4sNMIOWD7GX/HuPI81+WBFd0cGQ3Lm2jHajHRqKgJvWohVxTL
 Hp5GYTqd8GlnRJARg8goSFCyc5ukMPFB029wwCrL8HvOO2Qi/WbawLg+nD06c51mxR9k
 pH0oo+PU6OjzVOQXDJUx5GKCVprDnXGwELguVwJw9SA8qCArHsHLNsi30lZ2y1F98Vmd
 B07Q==
X-Gm-Message-State: AOAM532E67tkYZIG+qGaRQrW6napYWcIt7/1/tKDdKhhPHq7UNJoriPu
 GkcQVVFbAu6zVuidrQqNb0jbIg==
X-Google-Smtp-Source: ABdhPJwGZmIBqv2Morq7xO0TtkIaGYFP6yK8oChVVtxF7/hPI4hIcO8UKMwe98O/xQHW7Hh7Ry8XpQ==
X-Received: by 2002:a5d:544f:: with SMTP id w15mr21015839wrv.208.1595864922765; 
 Mon, 27 Jul 2020 08:48:42 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id r206sm34232wma.6.2020.07.27.08.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 08:48:42 -0700 (PDT)
Date: Mon, 27 Jul 2020 16:48:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 1/8] mfd: mt6358: refine interrupt code
Message-ID: <20200727154840.GY1850026@dell>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595509133-5358-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_114844_138909_1E99EFD5 
X-CRM114-Status: GOOD (  16.83  )
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMyBKdWwgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gVGhpcyBwYXRj
aCByZWZpbmVzIHRoZSBpbnRlcnJ1cHQgcmVsYXRlZCBjb2RlIHRvIHN1cHBvcnQgbmV3IGNoaXBz
LgoKUmVmaW5lcyBpbiB3aGF0IHdheT8KCldoYXQgbWFrZXMgdGhpcyBiZXR0ZXI/Cgo+IFNpZ25l
ZC1vZmYtYnk6IEhzaW4tSHNpdW5nIFdhbmcgPGhzaW4taHNpdW5nLndhbmdAbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYzNTgtaXJxLmMgICAgICAgIHwgNjUgKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2
MzU4L2NvcmUuaCB8ICA4ICsrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygr
KSwgMzIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL210NjM1OC1p
cnEuYyBiL2RyaXZlcnMvbWZkL210NjM1OC1pcnEuYwo+IGluZGV4IGRiNzM0ZjIuLjRiMDk0ZTUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZmQvbXQ2MzU4LWlycS5jCj4gKysrIGIvZHJpdmVycy9t
ZmQvbXQ2MzU4LWlycS5jCj4gQEAgLTEzLDcgKzEzLDkgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gIAo+IC1zdGF0
aWMgc3RydWN0IGlycV90b3BfdCBtdDYzNThfaW50c1tdID0gewo+ICsjZGVmaW5lIE1US19QTUlD
X1JFR19XSURUSCAxNgo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBpcnFfdG9wX3QgbXQ2MzU4
X2ludHNbXSA9IHsKPiAgCU1UNjM1OF9UT1BfR0VOKEJVQ0spLAo+ICAJTVQ2MzU4X1RPUF9HRU4o
TERPKSwKPiAgCU1UNjM1OF9UT1BfR0VOKFBTQyksCj4gQEAgLTI0LDYgKzI2LDEzIEBAIHN0YXRp
YyBzdHJ1Y3QgaXJxX3RvcF90IG10NjM1OF9pbnRzW10gPSB7Cj4gIAlNVDYzNThfVE9QX0dFTihN
SVNDKSwKPiAgfTsKPiAgCj4gK3N0YXRpYyBzdHJ1Y3QgcG1pY19pcnFfZGF0YSBtdDYzNThfaXJx
ZCA9IHsKPiArCS5udW1fdG9wID0gQVJSQVlfU0laRShtdDYzNThfaW50cyksCj4gKwkubnVtX3Bt
aWNfaXJxcyA9IE1UNjM1OF9JUlFfTlIsCj4gKwkudG9wX2ludF9zdGF0dXNfcmVnID0gTVQ2MzU4
X1RPUF9JTlRfU1RBVFVTMCwKPiArCS5wbWljX2ludHMgPSBtdDYzNThfaW50cywKPiArfTsKCkR5
bmFtaWNhbGx5IGFzc2lnbmVkIGRyaXZlciBkYXRhIGlzIHVzdWFsbHkgcHJlZmVycmVkLgoKV2h5
IGhhdmUgeW91IGdvbmUgc3RhdGljPwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3Ig
VGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdp
dHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
