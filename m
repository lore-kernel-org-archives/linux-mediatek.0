Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE494C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 16:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFF92222A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 16:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G2A1f4//";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UUDfcWPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFF92222A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uy2ZHniAB9+qwdxBhFOeyQLpVFHm7PGAT+C9Of3QrRM=; b=G2A1f4//UL0UzKwKHMbN5O35n
	mpNxiBtFQ89pFQHbPRd3n8ZGsQe1AWhlUjLNG0ewFFvX17lKuFObsCp1QZTF+tqAX85oSkuzlYPF1
	tyc61G2b6HrnBkGma8W43iQMI0HH+ny7+5+5w89PSE7r2zWUsuDwSw64NsyTA2d18LZeZST77kQ51
	zFssX0/4rBpy/tivBgRdouf1w8hW4gRmbcGz59rd1zQ6nOEASMTAvpFqj+Ablryu6dBrSAGJHyddM
	2yDqzP51m81/9iFt8hsvWrewObh+ydLiCNNTbbwmE0qOFvX9HYOuU2CR/dBc1MtD2Q1juGL0g3IMr
	8igP6mlcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSjb2-0007mx-Si; Wed, 14 Oct 2020 16:25:48 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSjb0-0007lX-8q
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 16:25:47 +0000
Received: by mail-il1-x143.google.com with SMTP id k1so2699218ilc.10
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2020 09:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OpuOO6D91mmbQ9GlyYetQ2VYN7QKr3fAvLutvyHptN8=;
 b=UUDfcWPeTFYlJ87g3Xdwe6UiHA7mT7G/O8FYr4Mc9M6lMK/a5ajiX/ceXjuaRFaeWW
 oKAZbcoRnTj9E967DtOFDjRHFKqXvj9PN2Gya73tJmCVpsH2115gYwyVMjGTstL4I7ge
 N863IIblMkRjkOmw+nhxXc04O7CIYjb6qc0JbAz09chwqE8RPXkfGplwwVpX5FPSHfw6
 FBn7MxrJynSIGa/qflQt/wO3fC8eJ0Fi2BuRiwbfj6JCu+5cPGFzgU7BjhwDx6A5XAMH
 5rjhbv8bVFp/leQXrVxjvTVrUC2FeEfmoKSvrXr+XevHWb9amteIaJ7Tydi9fv9v2q1D
 75tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OpuOO6D91mmbQ9GlyYetQ2VYN7QKr3fAvLutvyHptN8=;
 b=H/Ads5zRl8ZATDJrfRbLuHiQxw/L56z1mGXcCoWB9+bqc3PLiVdL4y6JWOHBosD1pZ
 bh/oWOgm57aGqxKhpNScz4lXbmvg454lcTFLmW/mtzKIysEw7VjLX4/WvCFe+vBkG+k2
 1qLczC74h/O0Qbgk/W5nWbaMsJJgafp+FzoOMJfF8AG16Dvf55sQorNWC/9xSVyYhgnl
 k79YBLPFwmsym2s4/ighAll6wFjRjcc6s0VIgU/aHXRcGIcuMofgBgrxU8MjJ211P7G9
 XaGPLFgUInzFpHDm4gXFmNI/i39+PJoIsyCB1Ffp77JM+51EPTOGV/Q37+CZpQZYT/37
 Et+A==
X-Gm-Message-State: AOAM532/Ua9CB+mDW28vUjPayatwfKhfnl9pv6d08cp3/6iN5YdPHGUI
 45HLy4vD99T4vV/yGclHrG+4gPDkrySC9irDv+nosw==
X-Google-Smtp-Source: ABdhPJy6XKdNrS2/9EHHkdStb2c3MKpSkize9amrN9N/B/qwi8cb5F2DQO0H/tJN+2k3hZ85+ZkqCjit7PQ7KBcZ4qE=
X-Received: by 2002:a92:8404:: with SMTP id l4mr4828056ild.134.1602692744338; 
 Wed, 14 Oct 2020 09:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201013181924.4143303-1-fparent@baylibre.com>
 <20201013181924.4143303-2-fparent@baylibre.com>
 <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
In-Reply-To: <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 14 Oct 2020 18:25:33 +0200
Message-ID: <CAOwMV_wskn9RiWsX44xL8CFTX-3coS9+bXaJxK8y4eBBOr0z_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_122546_334684_84FAA228 
X-CRM114-Status: GOOD (  20.33  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKCk9uIFdlZCwgT2N0IDE0LCAyMDIwIGF0IDM6MDAgUE0gQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEZhYmllbjoKPgo+
IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAyMOW5tDEw5pyIMTTm
l6Ug6YCx5LiJIOS4iuWNiDI6MTnlr6vpgZPvvJoKPiA+Cj4gPiBBZGQgc3VwcG9ydCBmb3IgSERN
SSBvbiBNVDgxNjcuIEhETUkgb24gTVQ4MTY3IGlzIHNpbWlsYXIgdG8KPiA+IE1UODE3My9NVDI3
MDEgZXhlY3B0IGZvciB0aGUgdHdvIHJlZ2lzdGVyczogU1lTX0NGRzFDIGFuZCBTWVNfQ0ZHMjAK
Pgo+IEkgdGhpbmsgeW91IHNob3VsZCBkcm9wIHRoaXMgc2VyaWVzLiBBY2NvcmRpbmcgdG8gTWVk
aWF0ZWsgSERNSQo+IGJpbmRpbmcgZG9jdW1lbnQgWzFdLCB0aGUgc2Vjb25kIHBhcmFtZXRlciBv
ZiBtZWRpYXRlayxzeXNjb24taGRtaSBpcwo+IHRoZSByZWdpc3RlciBvZmZzZXQuIEkgdGhpbmsg
eW91IGNvdWxkIHNldCByZWdpc3RlciBvZmZzZXQgdG8gMHg4MDAKPiBmb3IgbXQ4MTY3LgpPaywg
dGhhbmsgeW91LiBJIHdpbGwgdHJ5IGl0LgoKPgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxoZG1p
LnR4dD9oPXY1LjkKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPgo+ID4gLS0tCj4gPgo+
ID4gQ2hhbmdlbG9nOgo+ID4gdjI6IGZpeCBuYW1lIG9mIHBkYXRhIHN0cnVjdHVyZQo+ID4KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgIHwgNyArKysrKysrCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaCB8IDIgKysKPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaS5jCj4gPiBpbmRleCA1NzM3MGMwMzY0OTcuLjQ4NGVhOWNkNjU0YSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gQEAgLTE4MzUsOSArMTgzNSwx
NiBAQCBzdGF0aWMgc3RydWN0IG10a19oZG1pX2RhdGEgbXQ4MTczX2hkbWlfZHJpdmVyX2RhdGEg
PSB7Cj4gPiAgICAgICAgIC5zeXNfY2ZnMjAgPSBIRE1JX1NZU19DRkcyMCwKPiA+ICB9Owo+ID4K
PiA+ICtzdGF0aWMgc3RydWN0IG10a19oZG1pX2RhdGEgbXQ4MTY3X2hkbWlfZHJpdmVyX2RhdGEg
PSB7Cj4gPiArICAgICAgIC5zeXNfY2ZnMWMgPSBNVDgxNjdfSERNSV9TWVNfQ0ZHMUMsCj4gPiAr
ICAgICAgIC5zeXNfY2ZnMjAgPSBNVDgxNjdfSERNSV9TWVNfQ0ZHMjAsCj4gPiArfTsKPiA+ICsK
PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX2hkbWlfb2ZfaWRz
W10gPSB7Cj4gPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWhkbWki
LAo+ID4gICAgICAgICAgIC5kYXRhID0gJm10ODE3M19oZG1pX2RyaXZlcl9kYXRhIH0sCj4gPiAr
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWhkbWkiLAo+ID4gKyAgICAg
ICAgIC5kYXRhID0gJm10ODE2N19oZG1pX2RyaXZlcl9kYXRhIH0sCj4gPiAgICAgICAgIHt9Cj4g
PiAgfTsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmgKPiA+
IGluZGV4IDIwNTBiYTQ1YjIzYS4uYTBmOWMzNjdkN2FhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaAo+ID4gQEAgLTE5NSw2ICsxOTUsNyBAQAo+ID4g
ICNkZWZpbmUgR0VOX1JHQiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDAgPDwgNykK
PiA+Cj4gPiAgI2RlZmluZSBIRE1JX1NZU19DRkcxQyAgICAgICAgIDB4MDAwCj4gPiArI2RlZmlu
ZSBNVDgxNjdfSERNSV9TWVNfQ0ZHMUMgIDB4ODAwCj4gPiAgI2RlZmluZSBIRE1JX09OICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkKPiA+ICAjZGVmaW5lIEhETUlfUlNUICAg
ICAgICAgICAgICAgICAgICAgICBCSVQoMSkKPiA+ICAjZGVmaW5lIEFOTEdfT04gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJJVCgyKQo+ID4gQEAgLTIxMSw2ICsyMTIsNyBAQAo+ID4g
ICNkZWZpbmUgSFRQTEdfUElOX1NFTF9PRkYgICAgICAgICAgICAgIEJJVCgzMCkKPiA+ICAjZGVm
aW5lIEFFU19FRlVTRV9FTkFCTEUgICAgICAgICAgICAgICBCSVQoMzEpCj4gPiAgI2RlZmluZSBI
RE1JX1NZU19DRkcyMCAgICAgICAgIDB4MDA0Cj4gPiArI2RlZmluZSBNVDgxNjdfSERNSV9TWVNf
Q0ZHMjAgIDB4ODA0Cj4gPiAgI2RlZmluZSBERUVQX0NPTE9SX01PREVfTUFTSyAgICAgICAgICAg
KDMgPDwgMSkKPiA+ICAjZGVmaW5lIENPTE9SXzhCSVRfTU9ERSAgICAgICAgICAgICAgICAgICAg
ICAgICgwIDw8IDEpCj4gPiAgI2RlZmluZSBDT0xPUl8xMEJJVF9NT0RFICAgICAgICAgICAgICAg
KDEgPDwgMSkKPiA+IC0tCj4gPiAyLjI4LjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
