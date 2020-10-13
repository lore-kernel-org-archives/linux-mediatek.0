Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F604C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 23:55:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BB522202
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 23:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QmqP3dJj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0aPqPmc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99BB522202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7jlAi458Eyt7xDgU7FMAKnHk3HkPmGpF6fLl16fU5do=; b=QmqP3dJjQk7yZKh2d5HpcHOoT
	uyWWXlWatw42LCokSdN6sR5SNkU2Wpv0L+G4vc6tEX+rHszMhebLxNIoJ8Dq3Er2A76+z4JVvuFIS
	f7ahu5+hvpsDrRsFnropyCogsll6oSVAGHjEA0qB4YK+kEAzuSFfD+Wrzr9ugVxyEBI5hXr0CMB5H
	SXUgRX9rPMOFYbSACf2OooSSrz/q+0IfIlnz5Uvn+zx8CM15vNz79PaatCXVckBkScC1avrtlK0EC
	7EMMycLnTlboQG7/+VwknnmRAFVTpzuAYDqZyw57/cqNh2G3VgJM14mtxI/0t+nZwj5xeAVp4klmj
	ldtKDr/1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSU8T-00017O-T7; Tue, 13 Oct 2020 23:55:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSU8P-00015G-Be; Tue, 13 Oct 2020 23:55:14 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71D6B2223F;
 Tue, 13 Oct 2020 23:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602633311;
 bh=LREKoBv+gheN6HVpWIeSemw6UsiAfvw9QHnU3ZJXZMs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r0aPqPmc7HzMYRpSbW12KeZyIdZ4eoA4hUiiWz7vcHokRlXuhzadfSPBBx1O3nu42
 mw8Ks67P9K/VuuaROaFkz3teX9eHajoeoamtyeUWQ/AEKG7IgNw/n4wz5Q4iYiSaib
 qVTChIS/LMQDs/ZJvISYm4rktzzWndYD+72H21qg=
Received: by mail-ej1-f50.google.com with SMTP id a3so2179822ejy.11;
 Tue, 13 Oct 2020 16:55:11 -0700 (PDT)
X-Gm-Message-State: AOAM5331fO+AGLH2v1ASpvjgkKGUqw4TcKC8v106hhHfxAqyHyBTcSbT
 WS27/CGs85s9lSI3q2MVmHCQu/XnDCioGVwd6w==
X-Google-Smtp-Source: ABdhPJxtoNb8WOKlqzAwPLMajMBUyciAnXbyX/2Wf03lku7cnGSBfpNcKLmz0BCKWdpF+PR4tklDu8iG02n+F4XiUKM=
X-Received: by 2002:a17:906:3716:: with SMTP id
 d22mr2396754ejc.267.1602633309879; 
 Tue, 13 Oct 2020 16:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201013181924.4143303-1-fparent@baylibre.com>
 <20201013181924.4143303-2-fparent@baylibre.com>
In-Reply-To: <20201013181924.4143303-2-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 14 Oct 2020 07:54:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__UWaOz+uQRn9i0C8k=hQT=Nzv-CkbZZKiinFL=Op6j3Q@mail.gmail.com>
Message-ID: <CAAOTY__UWaOz+uQRn9i0C8k=hQT=Nzv-CkbZZKiinFL=Op6j3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_195513_518902_74FABC68 
X-CRM114-Status: GOOD (  18.89  )
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMTTml6Ug6YCx5LiJIOS4iuWNiDI6MTnlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0
IGZvciBIRE1JIG9uIE1UODE2Ny4gSERNSSBvbiBNVDgxNjcgaXMgc2ltaWxhciB0bwo+IE1UODE3
My9NVDI3MDEgZXhlY3B0IGZvciB0aGUgdHdvIHJlZ2lzdGVyczogU1lTX0NGRzFDIGFuZCBTWVNf
Q0ZHMjAKPgo+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUu
Y29tPgo+IC0tLQo+Cj4gQ2hhbmdlbG9nOgo+IHYyOiBmaXggbmFtZSBvZiBwZGF0YSBzdHJ1Y3R1
cmUKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgIHwgNyArKysr
KysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmggfCAyICsrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuYwo+IGluZGV4IDU3MzcwYzAzNjQ5Ny4uNDg0ZWE5Y2Q2NTRhIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiBAQCAtMTgzNSw5ICsxODM1LDE2IEBAIHN0YXRp
YyBzdHJ1Y3QgbXRrX2hkbWlfZGF0YSBtdDgxNzNfaGRtaV9kcml2ZXJfZGF0YSA9IHsKPiAgICAg
ICAgIC5zeXNfY2ZnMjAgPSBIRE1JX1NZU19DRkcyMCwKPiAgfTsKPgo+ICtzdGF0aWMgc3RydWN0
IG10a19oZG1pX2RhdGEgbXQ4MTY3X2hkbWlfZHJpdmVyX2RhdGEgPSB7Cj4gKyAgICAgICAuc3lz
X2NmZzFjID0gTVQ4MTY3X0hETUlfU1lTX0NGRzFDLAo+ICsgICAgICAgLnN5c19jZmcyMCA9IE1U
ODE2N19IRE1JX1NZU19DRkcyMCwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG10a19kcm1faGRtaV9vZl9pZHNbXSA9IHsKPiAgICAgICAgIHsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTczLWhkbWkiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgxNzNf
aGRtaV9kcml2ZXJfZGF0YSB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxNjctaGRtaSIsCgpJIHRoaW5rIHdlIHNob3VsZCBhZGQgdGhpcyBjb21wYXRpYmxlIHN0cmlu
ZyBpbiBNZWRpYXRlayBIRE1JIGJpbmRpbmcKZG9jdW1lbnQgWzFdLgoKWzFdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90
cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGhkbWkudHh0P2g9djUuOQoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAg
IC5kYXRhID0gJm10ODE2N19oZG1pX2RyaXZlcl9kYXRhIH0sCj4gICAgICAgICB7fQo+ICB9Owo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcmVncy5oCj4gaW5kZXggMjA1MGJh
NDViMjNhLi5hMGY5YzM2N2Q3YWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pX3JlZ3MuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaV9yZWdzLmgKPiBAQCAtMTk1LDYgKzE5NSw3IEBACj4gICNkZWZpbmUgR0VOX1JHQiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKDAgPDwgNykKPgo+ICAjZGVmaW5lIEhETUlfU1lT
X0NGRzFDICAgICAgICAgMHgwMDAKPiArI2RlZmluZSBNVDgxNjdfSERNSV9TWVNfQ0ZHMUMgIDB4
ODAwCj4gICNkZWZpbmUgSERNSV9PTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklU
KDApCj4gICNkZWZpbmUgSERNSV9SU1QgICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQo+ICAj
ZGVmaW5lIEFOTEdfT04gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgyKQo+IEBA
IC0yMTEsNiArMjEyLDcgQEAKPiAgI2RlZmluZSBIVFBMR19QSU5fU0VMX09GRiAgICAgICAgICAg
ICAgQklUKDMwKQo+ICAjZGVmaW5lIEFFU19FRlVTRV9FTkFCTEUgICAgICAgICAgICAgICBCSVQo
MzEpCj4gICNkZWZpbmUgSERNSV9TWVNfQ0ZHMjAgICAgICAgICAweDAwNAo+ICsjZGVmaW5lIE1U
ODE2N19IRE1JX1NZU19DRkcyMCAgMHg4MDQKPiAgI2RlZmluZSBERUVQX0NPTE9SX01PREVfTUFT
SyAgICAgICAgICAgKDMgPDwgMSkKPiAgI2RlZmluZSBDT0xPUl84QklUX01PREUgICAgICAgICAg
ICAgICAgICAgICAgICAoMCA8PCAxKQo+ICAjZGVmaW5lIENPTE9SXzEwQklUX01PREUgICAgICAg
ICAgICAgICAoMSA8PCAxKQo+IC0tCj4gMi4yOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
