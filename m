Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2399C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 03:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hH2HMIcn18fP6Si+6lkDLWo6oWm55MR4YZg5AQaYJZI=; b=p1sIHMK5rb7HX0
	YpReq8YEC5kSUPgeDuj0dEi53GQhGvMvC+n+hQk4gn9yn6UYpCGhgLMDkgg9lwFpDDUq1o+hmGB75
	HerJxV+tjLbQb0A0VDBagZ9D7Mpu4UE2/sjwKzhINB6EO98dbjrn9LHmzv20/Yfb9wxIYAxWq8BLS
	DwWI0IrNdefYt0pzGZG+SmKkWcsZFQoJyg4DJ9FR44xxHfdzKTRaVheelJRgyI+zMA5bnQ37jppi3
	NgD3W3SzFb71OfiCvquQaeAbi+dNCGqAV86EjTnCyaozh4ENHN4JBuKhcRLbiaiqdKyCtrBFM6pIn
	ld5XaeqQari7BrEXY5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN5BG-00GiEy-06; Thu, 24 Feb 2022 03:52:38 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN5Af-00Gi7N-SH
 for linux-mediatek@lists.infradead.org; Thu, 24 Feb 2022 03:52:03 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id j12so1368917ybh.8
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Feb 2022 19:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C3V/dtxV15Mn7k63x16wvKI7YuLTRLAtDoW+UZHVNSQ=;
 b=JpTyQ9fwmnCkQTdb4pTZ4OG7pAZVm7gwL2969nPUypAx3k22so+gM3I0W2ci/jvCA5
 BDPZMmcHgO3YLsB+3wl8ORdfR8CU0QCz0p728ige4gFTPcamGc/2PpHz7ciUiyqBI3Tu
 X9cjP50jWu0UKjTUkHmEzjal1OhvJNpAH3BzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C3V/dtxV15Mn7k63x16wvKI7YuLTRLAtDoW+UZHVNSQ=;
 b=tE3AVZOVBEdky3AEo8ACo4mGfy5cEZWLgxXfy9ub7LBu23aPFVjkvAxEoHr7v/puMw
 6s7y2hxl/AfyMQ4VJxGXikTJkBNtDv/IzGsdV+0z+e3reu+uOa3JQep4cRdsulv6LHb6
 4jSL+gNW9hdEY+ZXtauzUh5jucdejdV+bWNMap7IXKiVZmtahFXGwWCWrDaLYp/At9VY
 DUhrQgNk/3hLpEGQXO7o16m47ced55euAGYCohSW7ew6xgCf+BZ8gjIUFL87oPIfUPkP
 ttITkaOc0xKIb5oXanzsHQ/tuV6Lo6RjBR9zz+YYgZ2QRsvNyWuqYoyZJWqmO0JJQSGA
 8PFg==
X-Gm-Message-State: AOAM533rx0QfWFJO0SQ697wvbif0MhlO+SnaGO/e7LkDQ9r+aKtVv/Qc
 7BJjibbHmiOQhCtjGY4e6t078nNCvn1TVDF6tH8VoA==
X-Google-Smtp-Source: ABdhPJyiaPY/OEbo9lDvhKxowTvqVlkhYSSAXktn3qviviBrH2qstZAw3K9LBrLE61G6q3rwWoSQxKBMDVgyXk0nark=
X-Received: by 2002:a25:a486:0:b0:61d:a523:acd0 with SMTP id
 g6-20020a25a486000000b0061da523acd0mr753461ybi.203.1645674719716; Wed, 23 Feb
 2022 19:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201174643.843102-1-nfraprado@collabora.com>
In-Reply-To: <20220201174643.843102-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Feb 2022 11:51:48 +0800
Message-ID: <CAGXv+5HbBroWkR4gLA2EXOcki4wgZ6XahO1J-VOctgKX5K9k7w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8183: jacuzzi: Fix bus properties in
 anx's DSI endpoint
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Robert Foss <robert.foss@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_195201_980895_3BD5464F 
X-CRM114-Status: GOOD (  24.21  )
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

SGksCgooQ0MtZWQgRFJNIGJyaWRnZSBtYWludGFpbmVycyBhbmQgdGhlIGRyaS1kZXZlbCBNTCkK
Ck9uIFdlZCwgRmViIDIsIDIwMjIgYXQgMTo0NyBBTSBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbwo8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gbXQ4MTgzLWt1a3VpLWphY3V6emkg
aGFzIGFuIGFueDc2MjUgYnJpZGdlIGNvbm5lY3RlZCB0byB0aGUgb3V0cHV0IG9mCj4gaXRzIERT
SSBob3N0LiBIb3dldmVyLCBhZnRlciBjb21taXQgZmQwMzEwYjZmZTdkICgiZHJtL2JyaWRnZTog
YW54NzYyNToKPiBhZGQgTUlQSSBEUEkgaW5wdXQgZmVhdHVyZSIpLCBhIGJ1cy10eXBlIHByb3Bl
cnR5IHN0YXJ0ZWQgYmVpbmcgcmVxdWlyZWQKPiBpbiB0aGUgZW5kcG9pbnQgbm9kZSBieSB0aGUg
ZHJpdmVyIHRvIGluZGljYXRlIHdoZXRoZXIgaXQgaXMgRFNJIG9yIERQSS4KPgo+IEFkZCB0aGUg
bWlzc2luZyBidXMtdHlwZSBwcm9wZXJ0eSBhbmQgc2V0IGl0IHRvIDUKPiAoVjRMMl9GV05PREVf
QlVTX1RZUEVfUEFSQUxMRUwpIHNvIHRoYXQgdGhlIGRyaXZlciBoYXMgaXRzIGlucHV0Cj4gY29u
ZmlndXJlZCB0byBEU0kgYW5kIHRoZSBkaXNwbGF5IHBpcGVsaW5lIGNhbiBwcm9iZSBjb3JyZWN0
bHkuCgpEb24ndCBwZW9wbGUgZmluZCBpdCBvZGQgdGhhdCB0aGlzIGlzIHNldHRpbmcgdGhlIGJ1
cy10eXBlIHRvICJwYXJhbGxlbCIKKDUpIGZvciB0aGUgZGV2aWNlIHRvIHVzZSBEU0k/IEluc3Rl
YWQgb2YgIk1JUEkgQ1NJLTIgRC1QSFkiICg0KSBvciBldmVuCiJNSVBJIENTSS0yIEMtUEhZIiAo
MSkgd2hpY2ggaXMgc3BlY2lmaWVkIGluIHRoZSBiaW5kaW5nPyBJdCdzIGNvbXBsZXRlbHkKYmFj
a3dhcmRzLgoKV291bGQgaXQgYmUgcG9zc2libGUgdG8gZml4IHRoZSBiaW5kaW5nIGFuZCBkcml2
ZXIgYXQgdGhpcyBwb2ludD8KCgpUaGFua3MKQ2hlbll1Cgo+IFdoaWxlIGF0IGl0LCBhbHNvIHNl
dCB0aGUgZGF0YS1sYW5lcyBwcm9wZXJ0eSB0aGF0IHdhcyBhbHNvIGludHJvZHVjZWQKPiBpbiB0
aGF0IHNhbWUgY29tbWl0LCBzbyB0aGF0IHdlIGRvbid0IHJlbHkgb24gdGhlIGRlZmF1bHQgdmFs
dWUuCj4KPiBGaXhlczogZmQwMzEwYjZmZTdkICgiZHJtL2JyaWRnZTogYW54NzYyNTogYWRkIE1J
UEkgRFBJIGlucHV0IGZlYXR1cmUiKQo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEu
IFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPgo+IC0tLQo+IHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMjAxMjAyMjQyMDQuNzczMTE3LTEtbmZyYXByYWRvQGNvbGxh
Ym9yYS5jb20KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSAodGhhbmtzIFJvYikgVXNlIHByb3BlciBm
b3JtYXQgd2hlbiByZWZlcmluZyB0byBjb21taXQgaW4gY29tbWl0Cj4gICBtZXNzYWdlIGFzIHBv
aW50ZWQgb3V0IGJ5IGNoZWNrcGF0Y2gKPgo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE4My1rdWt1aS1qYWN1enppLmR0c2kgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE4My1rdWt1aS1qYWN1enppLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE4My1rdWt1aS1qYWN1enppLmR0c2kKPiBpbmRleCA4ZjdiZjMzZjYwN2QuLmU4ZjEzM2Rj
OTZiOSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1r
dWt1aS1qYWN1enppLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE4My1rdWt1aS1qYWN1enppLmR0c2kKPiBAQCAtMTcxLDYgKzE3MSw4IEBAIHBvcnRAMCB7Cj4K
PiAgICAgICAgICAgICAgICAgICAgICAgICBhbng3NjI1X2luOiBlbmRwb2ludCB7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9vdXQ+Owo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVzLXR5cGUgPSA8NT47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLWxhbmVzID0gPDAgMSAyIDM+Owo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIH07Cj4gICAgICAgICAgICAgICAgIH07Cj4KPiAtLQo+IDIuMzUu
MQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
