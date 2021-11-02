Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47096C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 22:54:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08AA06044F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 22:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08AA06044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAAvx+Ll4yVPMNt0PRwBgm5q4M6fgqzqgu2RkWIUizo=; b=ZV8QBXnB5QLEsm
	m8g9SxBc3uhLwpEI5eoq5fmd/PP5cnPctSPSRiVQOFkxqssZnAXULXGTLV/FVEFkLus+AJnuyUhuw
	oPXgwVKncFB06VeOJBd2H08ciN/s/ktPnRh+wLRmlajnPaBaGwqd4F/hgl9fyeN2u9f0pHZjj8PRQ
	muQhT+48DxBnE4fR3OnC04xPDWdG2L6v+YaX0742h/YAAjAIrsVnEiKzRJ2gfQIHgUZAO0oh6vVPz
	JMhUgT8zJILFaQZO9E/ttkoQU27z66JYIF65Pd663Uq+iDXj2hf+CXEU30xBx2oUg8wowPOnFFwrY
	yrLiNwpfkyJKYxdMHpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2fx-003ECU-Pi; Tue, 02 Nov 2021 22:54:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2fk-003E9A-86; Tue, 02 Nov 2021 22:54:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67338610C8;
 Tue,  2 Nov 2021 22:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635893667;
 bh=vZAm7ovxBi6d/ZH+uziWTG6NBTualBYKsCvLvL3Gx7g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=opY/abwJOWe66VHhwlVSS287YA1M9yULIi5wQIYoJ96jO4hPky0vB6vi6tafilMD7
 rFkhmoLtQ0JjoO8LGuoGLus6tF2fIduGVRZrrxl51/4nWYnKX6dKCQmBd2uSI9wlMD
 UO1XahuUVS5GKl3M0Aq9gJC4BEv6fCqD0q/CztW5e7meAcaEELHE3R2JXtckUw0jPy
 z9VAQruKylB+jiZA16OORnFfBMF6rFzu7wr/0EvG1Cg0KZUTyId6/tOrFKoGJf1Uai
 AP8H78hxGwQ6Ru8B4/CqaU93n8Gf4J+XTNIO9nFkSdgPnmTW9hS6RjiTF0OsrhHByR
 HNvU7DC6mlsLg==
Received: by mail-ed1-f41.google.com with SMTP id w1so2660464edd.10;
 Tue, 02 Nov 2021 15:54:27 -0700 (PDT)
X-Gm-Message-State: AOAM532K1THRgCK84q2Q5kRlarwWJURu/gtMfR4W6CVHX5mImK3Hd3O1
 cX7cZcAO6Uptud3Me8fzl0qnJrtdWUpAMAoAuA==
X-Google-Smtp-Source: ABdhPJwvOPkHrOahXa3xj/c9OSX7wBr+wcK0xwNgYPaLagkYmgf2JQOlOc1GXKmuNsno2PWPju9ZZUGHXtyfOv39J7g=
X-Received: by 2002:a17:907:2ce1:: with SMTP id
 hz1mr49090047ejc.241.1635893665770; 
 Tue, 02 Nov 2021 15:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
 <20211026155911.17651-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026155911.17651-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 3 Nov 2021 06:54:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY__cyFB6VyKFUZsy+-9+Nz7QTR4QiGUXQApOdiFXQESi4g@mail.gmail.com>
Message-ID: <CAAOTY__cyFB6VyKFUZsy+-9+Nz7QTR4QiGUXQApOdiFXQESi4g@mail.gmail.com>
Subject: Re: [PATCH v12 05/16] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fei Shao <fshao@chromium.org>, Moudy Ho <moudy.ho@mediatek.com>,
 roy-cw.yeh@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155428_389668_872964B6 
X-CRM114-Status: GOOD (  17.96  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDEw5pyIMjbml6Ug6YCx5LqMIOS4i+WNiDExOjU55a+r6YGT77yaCj4KPiBhZGQgTUVS
R0UgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIGRlc2NyaXB0aW9uIGZvciBtdDgxOTU6Cj4gMS4gYXN5
bmMgY2xvY2sKPiAyLiBmaWZvIHNldHRpbmcgZW5hYmxlCj4gMy4gcmVzZXQgY29udHJvbGxlcgoK
UmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+
IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbCAgICAgIHwg
MzggKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sCj4gaW5kZXgg
NzViZWViMjA3Y2ViLi42MTQ3MjFiZGJmNzMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLG1lcmdlLnlhbWwKPiBAQCAtMzYsOCArMzYsMjggQEAgcHJvcGVydGllczoKPiAg
ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyLWRvbWFp
bi55YW1sIGZvciBkZXRhaWxzLgo+Cj4gICAgY2xvY2tzOgo+ICsgICAgbWF4SXRlbXM6IDIKPiAg
ICAgIGl0ZW1zOgo+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBNRVJHRSBDbG9jawo+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBNRVJHRSBBc3luYyBDbG9jawo+ICsgICAgICAgICAgQ29udHJvbGxpbmcg
dGhlIHN5bmNocm9ub3VzIHByb2Nlc3MgYmV0d2VlbiBNRVJHRSBhbmQgb3RoZXIgZGlzcGxheQo+
ICsgICAgICAgICAgZnVuY3Rpb24gYmxvY2tzIGNyb3NzIGNsb2NrIGRvbWFpbi4KPiArCj4gKyAg
Y2xvY2stbmFtZXM6Cj4gKyAgICBtYXhJdGVtczogMgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0g
Y29uc3Q6IG1lcmdlCj4gKyAgICAgIC0gY29uc3Q6IG1lcmdlX2FzeW5jCj4gKwo+ICsgIG1lZGlh
dGVrLG1lcmdlLWZpZm8tZW46Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhlIHNldHRp
bmcgb2YgbWVyZ2UgZmlmbyBpcyBtYWlubHkgcHJvdmlkZWQgZm9yIHRoZSBkaXNwbGF5IGxhdGVu
Y3kKPiArICAgICAgYnVmZmVyIHRvIGVuc3VyZSB0aGF0IHRoZSBiYWNrLWVuZCBwYW5lbCBkaXNw
bGF5IGRhdGEgd2lsbCBub3QgYmUKPiArICAgICAgdW5kZXJydW4sIGEgbGl0dGxlIG1vcmUgZGF0
YSBpcyBuZWVkZWQgaW4gdGhlIGZpZm8uCj4gKyAgICAgIEFjY29yZGluZyB0byB0aGUgbWVyZ2Ug
ZmlmbyBzZXR0aW5ncywgd2hlbiB0aGUgd2F0ZXIgbGV2ZWwgaXMgZGV0ZWN0ZWQKPiArICAgICAg
dG8gYmUgaW5zdWZmaWNpZW50LCBpdCB3aWxsIHRyaWdnZXIgUkRNQSBzZW5kaW5nIHVsdHJhIGFu
ZCBwcmV1bHJhCj4gKyAgICAgIGNvbW1hbmQgdG8gU01JIHRvIHNwZWVkIHVwIHRoZSBkYXRhIHJh
dGUuCj4gKyAgICB0eXBlOiBib29sZWFuCj4KPiAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZzoK
PiAgICAgIGRlc2NyaXB0aW9uOgo+IEBAIC01MCw2ICs3MCwxMSBAQCBwcm9wZXJ0aWVzOgo+ICAg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+
ICAgICAgbWF4SXRlbXM6IDEKPgo+ICsgIHJlc2V0czoKPiArICAgIGRlc2NyaXB0aW9uOiByZXNl
dCBjb250cm9sbGVyCj4gKyAgICAgIFNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmVzZXQvcmVzZXQudHh0IGZvciBkZXRhaWxzLgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4g
IHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gcmVnCj4gQEAgLTY3LDMgKzkyLDE2
IEBAIGV4YW1wbGVzOgo+ICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxNzNfUE9X
RVJfRE9NQUlOX01NPjsKPiAgICAgICAgICBjbG9ja3MgPSA8Jm1tc3lzIENMS19NTV9ESVNQX01F
UkdFPjsKPiAgICAgIH07Cj4gKwo+ICsgICAgbWVyZ2U1OiBkaXNwX3ZwcF9tZXJnZTVAMWMxMTAw
MDAgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtbWVyZ2Ui
Owo+ICsgICAgICAgIHJlZyA9IDwwIDB4MWMxMTAwMDAgMCAweDEwMDA+Owo+ICsgICAgICAgIGlu
dGVycnVwdHMgPSA8R0lDX1NQSSA1MDcgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKPiArICAgICAg
ICBjbG9ja3MgPSA8JnZkb3N5czEgQ0xLX1ZETzFfVlBQX01FUkdFND4sCj4gKyAgICAgICAgICAg
ICAgICAgPCZ2ZG9zeXMxIENMS19WRE8xX01FUkdFNF9ETF9BU1lOQz47Cj4gKyAgICAgICAgY2xv
Y2stbmFtZXMgPSAibWVyZ2UiLCJtZXJnZV9hc3luYyI7Cj4gKyAgICAgICAgcG93ZXItZG9tYWlu
cyA9IDwmc3BtIE1UODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMT47Cj4gKyAgICAgICAgbWVkaWF0
ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTEgU1VCU1lTXzFjMTFYWFhYIDB4MDAwMCAweDEwMDA+
Owo+ICsgICAgICAgIG1lZGlhdGVrLG1lcmdlLWZpZm8tZW4gPSA8MT47Cj4gKyAgICAgICAgcmVz
ZXRzID0gPCZ2ZG9zeXMxIE1UODE5NV9WRE9TWVMxX1NXMF9SU1RfQl9NRVJHRTRfRExfQVNZTkM+
Owo+ICsgICAgfTsKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
