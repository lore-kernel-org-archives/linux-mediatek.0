Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A46BC433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:29:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 263A920663
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vpyn/OPc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqr9f9v9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 263A920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IpMC/ufVQ0n82BnZfbBUQbu28lv0a3283Iu3LrZekCs=; b=vpyn/OPccQ38qAqQjMhl7zQYK
	zFrpgVS3F0zU/K5fXaxmq7TFgQ7hSA/kikXjCNP90U4VnAWby2I7rpLZJkgs3PrbGkAxREhxhJ9Pp
	LFbzoIfDfJg6/8BTzJbwJKGO9QsmaqH2E+ir2L2r2p+I+UPqB53cwIVqrA5uC6f/YdHokyx+Hzu9v
	GUxIz5RWngDMpCepexCU9wxtygsyPG36g7bDZShtn58aNrnuvAe838MbEFxc9LRNC/4vZJ0Lp3qWS
	XkOqCys8GYgAsCPbFKl7OaiU2amx8MehsRlbZEPTZAIXo4/AoG6g8ZcZA4dLR9vpG9EoY4VV4sQXz
	OVzUNazhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k01Jw-00059U-2y; Mon, 27 Jul 2020 11:29:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k01Jt-000581-3d
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 11:29:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id 3so7458814wmi.1
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 04:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EKtNZF82mH4EnUTfOug/S5EqMmxmydLS/o7zuPsZsAg=;
 b=oqr9f9v9ib3ir2dTayTCoS6+B/x4vLofP7/ciW3dY1I6LcRa6FGyYqAoyRJIG76GE1
 oH8PB5k8BDapkVVfjFdS7CRSVr2DK7Of3iLXi+PCpcml3vbAKZPCq+LBrWNh+Jz7Bbcu
 d2yS/viPCeYaH8BH8Lge/c9ZRzatFiidYJsjLR9vyV+r+aytOenZou+60oe3Mrj3CSmO
 oe2ynIo6sqDPh4v09oVYqlM6xv6gxkbOBLbUUiEbRjr5L7QE6hqL9Ynaap5V/UJQsMkm
 66rh7TkFOWTm0S7wEsShM6qqdIV8pxrUBlCm6+8tFPPscrNtZZk6pz6IEHQXDjEB0Zx5
 4Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EKtNZF82mH4EnUTfOug/S5EqMmxmydLS/o7zuPsZsAg=;
 b=hcAVi8foztYv8OGciOPcMFM0u6uOSso2GSdDd8Hk42r31Q+VHSt864UUXt6nUyqjsM
 znyan+USvXmJMJxTjLkt/V94mRMYorWLqH3i2h1qhtnbJJwP5q9MZpIJSOm3Rk6Cb4RY
 gts/hDVRwkXNej+xRsnwzj+YtgQppYoiYNSEGOL10Js41H3CHAgLnM0DZ2tLV78cJCww
 W/kcXg9TvPqgjdVAYtEscAMxNVI8qcEE9dX37fEDiCzku5RHEXbsHnuNe5i1fXNQa+AJ
 OfgGHEfu8aTIQK/OqQkXMfPSzMnCgQKAXbwiEfUnzPKAHeE1tylU88KSzOCP8/jF3Gqx
 jEhg==
X-Gm-Message-State: AOAM530HQbn7i+xeIEwX43kr+W+BI/6wJVcTFFJOFDyZVIamEYfv9ykj
 xJ6tpvqPGI7eEuqTISVW+PbrFA==
X-Google-Smtp-Source: ABdhPJwozf0SUllR1Iqin/QO4pcEiW+aQJPZDJ37xCt8IxZMIGjhFfx+9XxaifgFKqEPWIcyZbOEEA==
X-Received: by 2002:a1c:7204:: with SMTP id n4mr4687818wmc.161.1595849363913; 
 Mon, 27 Jul 2020 04:29:23 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id k131sm19041738wmb.36.2020.07.27.04.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 04:29:23 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:29:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 4/9] mfd: mt6360: Combine mt6360 pmic/ldo resouces
 into mt6360 regulator resources
Message-ID: <20200727112921.GK1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-5-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594983811-25908-5-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_072925_211000_0B6DFD06 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNyBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBDb21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNv
dWNlcyBpbnRvIG10NjM2MCByZWd1bGF0b3IgcmVzb3VyY2VzCj4gdG8gc2ltcGxpZnkgdGhlIHNp
bWlsYXIgcmVzb3VyY2VzIG9iamVjdC4KCkRvIHRoZSBzdWItZGV2aWNlcyBhY3R1YWxseSBzaGFy
ZSB0aGVzZSByZXNvdXJjZXMsIG9yIGFyZSB5b3UgZG9pbmcKdGhpcyBqdXN0IHRvIG1ha2UgdGhl
IGNvZGUgc2ltcGxlcj8KCj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5Acmlj
aHRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgfCAxMSArKystLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQv
bXQ2MzYwLWNvcmUuYwo+IGluZGV4IDdjYzFiNTkuLjY2NWUyNmYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMK
PiBAQCAtMjY1LDcgKzI2NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYw
X2xlZF9yZXNvdXJjZXNbXSA9IHsKPiAgCURFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9GTEVE
MV9TVFJCX1RPX0VWVCwgImZsZWQxX3N0cmJfdG9fZXZ0IiksCj4gIH07Cj4gIAo+IC1zdGF0aWMg
Y29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9wbWljX3Jlc291cmNlc1tdID0gewo+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9yZWd1bGF0b3JfcmVzb3VyY2VzW10gPSB7
Cj4gIAlERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfQlVDSzFfUEdCX0VWVCwgImJ1Y2sxX3Bn
Yl9ldnQiKSwKPiAgCURFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNLMV9PQ19FVlQsICJi
dWNrMV9vY19ldnQiKSwKPiAgCURFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNLMV9PVl9F
VlQsICJidWNrMV9vdl9ldnQiKSwKPiBAQCAtMjc4LDkgKzI3OCw2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX3BtaWNfcmVzb3VyY2VzW10gPSB7Cj4gIAlERUZJTkVfUkVT
X0lSUV9OQU1FRChNVDYzNjBfTERPN19PQ19FVlQsICJsZG83X29jX2V2dCIpLAo+ICAJREVGSU5F
X1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzZfUEdCX0VWVCwgImxkbzZfcGdiX2V2dCIpLAo+ICAJ
REVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzdfUEdCX0VWVCwgImxkbzdfcGdiX2V2dCIp
LAo+IC19Owo+IC0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfbGRvX3Jl
c291cmNlc1tdID0gewo+ICAJREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzFfT0NfRVZU
LCAibGRvMV9vY19ldnQiKSwKPiAgCURFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE8yX09D
X0VWVCwgImxkbzJfb2NfZXZ0IiksCj4gIAlERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERP
M19PQ19FVlQsICJsZG8zX29jX2V2dCIpLAo+IEBAIC0yOTgsMTAgKzI5NSw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbWZkX2NlbGwgbXQ2MzYwX2RldnNbXSA9IHsKPiAgCQkgICAgTlVMTCwgMCwg
MCwgIm1lZGlhdGVrLG10NjM2MC1jaGciKSwKPiAgCU9GX01GRF9DRUxMKCJtdDYzNjAtbGVkIiwg
bXQ2MzYwX2xlZF9yZXNvdXJjZXMsCj4gIAkJICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYz
NjAtbGVkIiksCj4gLQlPRl9NRkRfQ0VMTCgibXQ2MzYwLXBtaWMiLCBtdDYzNjBfcG1pY19yZXNv
dXJjZXMsCj4gLQkJICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcG1pYyIpLAo+IC0J
T0ZfTUZEX0NFTEwoIm10NjM2MC1sZG8iLCBtdDYzNjBfbGRvX3Jlc291cmNlcywKPiAtCQkgICAg
TlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1sZG8iKSwKPiArCU9GX01GRF9DRUxMKCJtdDYz
NjAtcmVndWxhdG9yIiwgbXQ2MzYwX3JlZ3VsYXRvcl9yZXNvdXJjZXMsCj4gKwkJICAgIE5VTEws
IDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcmVndWxhdG9yIiksCj4gIAlPRl9NRkRfQ0VMTCgibXQ2
MzYwLXRjcGMiLCBOVUxMLAo+ICAJCSAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLXRj
cGMiKSwKPiAgfTsKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBM
ZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
