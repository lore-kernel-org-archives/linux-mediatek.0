Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05DEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVsIMWIhpzsjV/vV4dyBiV5lQ2zw93osAqcvNb2NmNU=; b=vP0Cd1rZA3JfRG
	WMYlGcvHm+pL4e2Gkd4lOPI6NIfQajK5blQysvRexnYH7rrHayyYAM85xG+SnuD4wB4XLH46KzXFY
	SOCP+moIUw4ck4Uxw0OAXhspWxTUwOvlgL9ovpFxRHnysZPEottW1duXblN1A0EEAKKBjS71hZvdw
	4MjRFc1JskH3uuAhIQJkDWr51RTSXn4naj4fRGtN4OhXLZnIFA0ziXunQ/da65UOqBiT9ZuY+ug2b
	AgiSn0ENv4JXQnckiLC1dKtNfrlDY/Q8W08jf512z2GNMOi8+91LgywNlafieIkfQLLOo33lyyQgJ
	nDUurlo+34mk7GFuxDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNYDz-004Y9F-AF; Fri, 25 Feb 2022 10:53:23 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNYDT-004Xt2-7Z
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 10:52:54 +0000
Received: by mail-oi1-x233.google.com with SMTP id j2so6911701oie.7
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Feb 2022 02:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=lCjS17RFbyRJS2Db4IElIeJl8aSxBOeolv8L7WEpzG0=;
 b=ZxA07RL3mMl2OYCEdKyZ7YMkP6PPrkqbudpFP/Xwrvm3gMcx3tUnhRYv8Yk3mK4v3d
 sc3DR0IdZD37Ua+cviUedxfolPE/qnsdmnqgBHPEpZC1+PgWDASxreISF1P1Ly2Uc/pI
 wggbKGlXSnIWxZJSha4EF2De/dnO0fCLvkz6P5M18Y1PdanigCXjdE+5vkwPuaUO+0B5
 i8GwmlHQgP4H8uSsxRwGBexOwkl/yUqMpcrbIrwN/4uQIhUr84KMQgf0PZk1BG66U7Jy
 YRXGtmHxLmxy1pPqCe3Dtw8ydk2F6cu08Bbhkq7CFcvZxkCQ/X+xb7KWbb1WGerxvfvP
 FsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=lCjS17RFbyRJS2Db4IElIeJl8aSxBOeolv8L7WEpzG0=;
 b=FK8i/mXVpqOwtyjwKlxDWMtLMpeFbxS2NlfSwLxIQ3myZi8x8bJpBDx7DodZaZotgm
 4/GlM39d8S8OpJREyPXR4Ff3DtSiv5LN3DjhWS/Tg6wBeAeF0ystggT3xF2rA9/tHa3+
 R82ngpGmcslSDkY/hOjB0kSyUEIlstCEyJcnrsz7N4wZsgl2enDkRpdBXRcWIT1LbvUC
 3HWmpWWC6xzmmx/VNDY54UZuzdcaFz30zQ15+Ol8N/VSVigZBrWZimYXYMHrlcHkR7+8
 ZjCc+ZG2AGfhU347vU9gTqXeKOz3dGESZJDrLueJWTj3FBU/JP0QlU/1VZAEfNUECsNZ
 YovQ==
X-Gm-Message-State: AOAM533ficdk97I+ZNXk71ZATqAagRoc86y9ooZF/agl7Z7kyL2u9Wnj
 P6vd/8t4AYYoUlaEJKEZTtoElaTbD3moa0zx2wfOGw==
X-Google-Smtp-Source: ABdhPJyteHJVXwqtREl4MhJz0dVR/k/rAMxVv+BnqtMnsqQSFUKqWOGlNhrZlPQ9P1vmHV6UVPKJuCBvnsGagSVbgHg=
X-Received: by 2002:aca:1b13:0:b0:2d4:b033:450 with SMTP id
 b19-20020aca1b13000000b002d4b0330450mr1231170oib.214.1645786370409; Fri, 25
 Feb 2022 02:52:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 02:52:49 -0800
MIME-Version: 1.0
In-Reply-To: <CAAOTY__AgD_Rc_5TS4v+sBDeN-nd0DbwuERhW=OsvsbMWSsxsA@mail.gmail.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-7-granquet@baylibre.com>
 <CAAOTY__AgD_Rc_5TS4v+sBDeN-nd0DbwuERhW=OsvsbMWSsxsA@mail.gmail.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 02:52:49 -0800
Message-ID: <CABnWg9uUDH7Vo-=HTSjS7HRfdo=SQPk43ujT=jh5Q+VhAA2Hag@mail.gmail.com>
Subject: Re: [PATCH v8 06/19] drm/mediatek: dpi: implement a CK/DE pol toggle
 in board config
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 deller@gmx.de, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_025251_306380_BF5280E7 
X-CRM114-Status: GOOD (  18.57  )
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

UXVvdGluZyBDaHVuLUt1YW5nIEh1ICgyMDIyLTAyLTIxIDAzOjE0OjAyKQo+IEhJLCBHdWlsbGF1
bWU6Cj4KPiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MuW5tDLmnIgxOOaXpSDpgLHkupQg5LiL5Y2IMTA6NTblr6vpgZPvvJoKPiA+Cj4gPiBBZGRzIGEg
Yml0IG9mIGZsZXhpYmlsaXR5IHRvIHN1cHBvcnQgYm9hcmRzIHdpdGhvdXQgQ0svREUgcG9sIHN1
cHBvcnQKPgo+IEknbSBub3Qgc3VyZSB3aGF0IHRoZSB0ZXJtICdib2FyZCcgbWVhbi4gRG8geW91
IG1lYW4gZGlmZmVyZW50IGJvYXJkCj4gd2l0aCBkaWZmZXJlbnQgcGFuZWwgYnV0IGFsbCB3aXRo
IG10ODE5NS1kcGludGY/IElmIHNvLCB5b3Ugc2hvdWxkIGdldAo+IENLL0RFIHN1cHBvcnQgZnJv
bSBwYW5lbCBkcml2ZXIgbm90IGZpeCB0aGlzIGluZm9ybWF0aW9uIGluIGRwaQo+IGRyaXZlci4K
Pgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgoKSGkgQ2h1bi1LdWFuZywKClRoZSBjb3JyZWN0
IHRlcm0gKGFzIHBvaW50ZWQgYnkgQW5nZWxvKSB3b3VsZCBiZSAnU29DJyBpbnN0ZWFkIG9mCidi
b2FyZCcgSSBndWVzcy4KTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGV2ZXJ5IFNvQyBtaWdodCBo
YXZlIG9yIG1pZ2h0IG5vdCBoYXZlIENLL0RFIHN1cHBvcnQuCgoKSSdsbCB0cnkgdG8gZGlnIGlu
dG8gdGhlIGRvY3VtZW50YXRpb24gSSBoYXZlIHRvIHVuZGVyc3RhbmQgZXhhY3RseQp3aGVyZSB0
aGlzIHN1cHBvcnQKaXMgY29taW5nIGZyb20uCgpUaHgsCkd1aWxsYXVtZS4KCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogR3VpbGxhdW1lIFJhbnF1ZXQgPGdyYW5xdWV0QGJheWxpYnJlLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAyMiArKysrKysr
KysrKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiBpbmRl
eCA0NzQ2ZWIzNDI1Njc0Li41NDVhMTMzN2NjODk5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYwo+ID4gQEAgLTEyNSw2ICsxMjUsNyBAQCBzdHJ1Y3QgbXRrX2RwaV9jb25m
IHsKPiA+ICAgICAgICAgYm9vbCBlZGdlX3NlbF9lbjsKPiA+ICAgICAgICAgY29uc3QgdTMyICpv
dXRwdXRfZm10czsKPiA+ICAgICAgICAgdTMyIG51bV9vdXRwdXRfZm10czsKPiA+ICsgICAgICAg
Ym9vbCBpc19ja19kZV9wb2w7Cj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZHBpX3ljX2xp
bWl0ICpsaW1pdDsKPiA+ICB9Owo+ID4KPiA+IEBAIC0yMTEsMTMgKzIxMiwyMCBAQCBzdGF0aWMg
dm9pZCBtdGtfZHBpX2NvbmZpZ19wb2woc3RydWN0IG10a19kcGkgKmRwaSwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RwaV9wb2xhcml0aWVzICpkcGlfcG9s
KQo+ID4gIHsKPiA+ICAgICAgICAgdW5zaWduZWQgaW50IHBvbDsKPiA+ICsgICAgICAgdW5zaWdu
ZWQgaW50IG1hc2s7Cj4gPgo+ID4gLSAgICAgICBwb2wgPSAoZHBpX3BvbC0+Y2tfcG9sID09IE1U
S19EUElfUE9MQVJJVFlfUklTSU5HID8gMCA6IENLX1BPTCkgfAo+ID4gLSAgICAgICAgICAgICAo
ZHBpX3BvbC0+ZGVfcG9sID09IE1US19EUElfUE9MQVJJVFlfUklTSU5HID8gMCA6IERFX1BPTCkg
fAo+ID4gLSAgICAgICAgICAgICAoZHBpX3BvbC0+aHN5bmNfcG9sID09IE1US19EUElfUE9MQVJJ
VFlfUklTSU5HID8gMCA6IEhTWU5DX1BPTCkgfAo+ID4gKyAgICAgICBtYXNrID0gSFNZTkNfUE9M
IHwgVlNZTkNfUE9MOwo+ID4gKyAgICAgICBwb2wgPSAoZHBpX3BvbC0+aHN5bmNfcG9sID09IE1U
S19EUElfUE9MQVJJVFlfUklTSU5HID8gMCA6IEhTWU5DX1BPTCkgfAo+ID4gICAgICAgICAgICAg
ICAoZHBpX3BvbC0+dnN5bmNfcG9sID09IE1US19EUElfUE9MQVJJVFlfUklTSU5HID8gMCA6IFZT
WU5DX1BPTCk7Cj4gPiAtICAgICAgIG10a19kcGlfbWFzayhkcGksIERQSV9PVVRQVVRfU0VUVElO
RywgcG9sLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgQ0tfUE9MIHwgREVfUE9MIHwgSFNZTkNf
UE9MIHwgVlNZTkNfUE9MKTsKPiA+ICsgICAgICAgaWYgKGRwaS0+Y29uZi0+aXNfY2tfZGVfcG9s
KSB7Cj4gPiArICAgICAgICAgICAgICAgbWFzayB8PSBDS19QT0wgfCBERV9QT0w7Cj4gPiArICAg
ICAgICAgICAgICAgcG9sIHw9IChkcGlfcG9sLT5ja19wb2wgPT0gTVRLX0RQSV9QT0xBUklUWV9S
SVNJTkcgPwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgMCA6IENLX1BPTCkgfAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAoZHBpX3BvbC0+ZGVfcG9sID09IE1US19EUElfUE9MQVJJVFlf
UklTSU5HID8KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDAgOiBERV9QT0wpOwo+ID4gKyAg
ICAgICB9Cj4gPiArCj4gPiArICAgICAgIG10a19kcGlfbWFzayhkcGksIERQSV9PVVRQVVRfU0VU
VElORywgcG9sLCBtYXNrKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIG10a19kcGlfY29u
ZmlnXzNkKHN0cnVjdCBtdGtfZHBpICpkcGksIGJvb2wgZW5fM2QpCj4gPiBAQCAtNzk5LDYgKzgw
Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE3M19jb25mID0gewo+
ID4gICAgICAgICAubWF4X2Nsb2NrX2toeiA9IDMwMDAwMCwKPiA+ICAgICAgICAgLm91dHB1dF9m
bXRzID0gbXQ4MTczX291dHB1dF9mbXRzLAo+ID4gICAgICAgICAubnVtX291dHB1dF9mbXRzID0g
QVJSQVlfU0laRShtdDgxNzNfb3V0cHV0X2ZtdHMpLAo+ID4gKyAgICAgICAuaXNfY2tfZGVfcG9s
ID0gdHJ1ZSwKPiA+ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gPiAgfTsKPiA+
Cj4gPiBAQCAtODA5LDYgKzgxOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25m
IG10MjcwMV9jb25mID0gewo+ID4gICAgICAgICAubWF4X2Nsb2NrX2toeiA9IDE1MDAwMCwKPiA+
ICAgICAgICAgLm91dHB1dF9mbXRzID0gbXQ4MTczX291dHB1dF9mbXRzLAo+ID4gICAgICAgICAu
bnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxNzNfb3V0cHV0X2ZtdHMpLAo+ID4gKyAg
ICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1ZSwKPiA+ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlf
bGltaXQsCj4gPiAgfTsKPiA+Cj4gPiBAQCAtODE4LDYgKzgyOCw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19jb25mID0gewo+ID4gICAgICAgICAubWF4X2Nsb2Nr
X2toeiA9IDEwMDAwMCwKPiA+ICAgICAgICAgLm91dHB1dF9mbXRzID0gbXQ4MTgzX291dHB1dF9m
bXRzLAo+ID4gICAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxODNfb3V0
cHV0X2ZtdHMpLAo+ID4gKyAgICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1ZSwKPiA+ICAgICAgICAg
LmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gPiAgfTsKPiA+Cj4gPiBAQCAtODI3LDYgKzgzOCw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE5Ml9jb25mID0gewo+ID4g
ICAgICAgICAubWF4X2Nsb2NrX2toeiA9IDE1MDAwMCwKPiA+ICAgICAgICAgLm91dHB1dF9mbXRz
ID0gbXQ4MTczX291dHB1dF9mbXRzLAo+ID4gICAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJS
QVlfU0laRShtdDgxNzNfb3V0cHV0X2ZtdHMpLAo+ID4gKyAgICAgICAuaXNfY2tfZGVfcG9sID0g
dHJ1ZSwKPiA+ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gPiAgfTsKPiA+Cj4g
PiAtLQo+ID4gMi4zNC4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
