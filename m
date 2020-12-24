Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01522C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 00:24:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880AB22512
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 00:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880AB22512
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NQp/uJHyHyoJQUFlFyopHwhrMSyx6CQKL8z9+J+EUOo=; b=TKNLUVNaFOr8PdaSheIGOVTZO
	XT6O182tr79ePnNIy+72SFv0qRnbCkRRO9wJInS2yhXBVpCmPREhPlcKMwiCgazwkWfNRjTrFzyyf
	WPN/q/9JRAerjhiXEY6YacrUysF5rOQQMkfpvBTJsF62Dgxoklg2M5uhv+wes1xab33y5/oKbR+ch
	f7lPBhWhua20ujtxmqxTkrvp8RhZKkVUoOTdp/rNM/LVgcPJ+j/OuF6iuDNmK66J4CG+6jo+SzAEs
	w+5CpzU6kp2Y252JFXD3ykTcheIjyZwwkFKVnrVZ2BDMOmWGiceyIWDGLVF1/X3SydJHXE0eUC820
	Z9jhCGh3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksEQl-00072m-Rt; Thu, 24 Dec 2020 00:24:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksEQh-00071u-Hi; Thu, 24 Dec 2020 00:24:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 174C622512;
 Thu, 24 Dec 2020 00:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608769469;
 bh=MAsDchMb2B74mJi8EaNjq+4grUjgglbCI5Og/aOCfHw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=glfM9ALiy6As29lszRSEsIdXFhLF7NWzsdtNFpezi+PC60dONOBMBjdJa6/PFUXts
 pqpu1bONYwC1XbfrIOHua4+/Asw/2hyGn5/u4Z/oy4nk/uusZluQFj1oV7xdhQAUGN
 GGEDHcJJj2HXZKTGiia/nNx/Zrr07Oc8gS7IzOlsfveNIzPr3vyEF+ifD/7nsSwKSJ
 7O16oq0NUY55BAejL5otoc9pohkczbIz4gZGKCNwf5GyBWpZoXIusdpcj1EfuRgYe4
 wj5Rnn9wjhqy3TGi3bkvksEBRdMZqYHCHq8fhpm/SdnN3nLz9IJftTDBYbesCzRr0d
 2bOMpJzEF6Qng==
Received: by mail-ed1-f44.google.com with SMTP id g24so784849edw.9;
 Wed, 23 Dec 2020 16:24:29 -0800 (PST)
X-Gm-Message-State: AOAM531rmhFuvFz9SOnyQ6MxQgvZf4jQupv4Wof3zC/y4W7qEX6OKArd
 LXrn+/NAD8vkW/PRU0u0LLgTMx/PQwVk8MPgbA==
X-Google-Smtp-Source: ABdhPJxwMzB1b8GV696GPbWzwCEc7NZBMdplOpz9ygAuC+GiK+meDOeYsKDV8XtMfGzxeZ2UDAmh3mivvs2WSMlbbgk=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr26815360edf.166.1608769467652; 
 Wed, 23 Dec 2020 16:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201216093012.24406-6-chunfeng.yun@mediatek.com>
In-Reply-To: <20201216093012.24406-6-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 24 Dec 2020 08:24:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PHEsTa7Vf9ZyQ-JwFYnSi3pBrpOcKE7hBxN=8KWQkeQ@mail.gmail.com>
Message-ID: <CAAOTY_9PHEsTa7Vf9ZyQ-JwFYnSi3pBrpOcKE7hBxN=8KWQkeQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] dt-bindings: phy: convert HDMI PHY binding to
 YAML schema
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_192431_832499_8073E4F0 
X-CRM114-Status: GOOD (  18.96  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMOW5tDEy5pyIMTbml6Ug6YCx5LiJIOS4i+WNiDU6MzDlr6vpgZPvvJoKPgo+IENvbnZl
cnQgSERNSSBQSFkgYmluZGluZyB0byBZQU1MIHNjaGVtYSBtZWRpYXRlayxoZG1pLXBoeS55YW1s
Cj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
Cj4gQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IENjOiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IENodW5m
ZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiB2NDogYWRkIG1haW50YWluZXIgUGhpbGlw
cAo+IHYzOiBhZGQgUmV2aWV3ZWQtYnkgUm9iCj4gdjI6IGZpeCBiaW5kaW5nIGNoZWNrIHdhcm5p
bmcgb2YgcmVnIGluIGV4YW1wbGUKPiAtLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssaGRtaS50eHQgICAgICAgIHwgMTggKy0tLQo+ICAuLi4vYmluZGluZ3MvcGh5L21lZGlhdGVr
LGhkbWktcGh5LnlhbWwgICAgICAgfCA5MiArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGhk
bWktcGh5LnlhbWwKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxoZG1pLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGhkbWkudHh0Cj4g
aW5kZXggNmIxYzU4NjQwM2U0Li5iMjg0Y2E1MWI5MTMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssaGRtaS50
eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxoZG1pLnR4dAo+IEBAIC01MywyMyArNTMsNyBAQCBSZXF1aXJlZCBwcm9w
ZXJ0aWVzOgo+Cj4gIEhETUkgUEhZCj4gID09PT09PT09Cj4gLQo+IC1UaGUgSERNSSBQSFkgc2Vy
aWFsaXplcyB0aGUgSERNSSBlbmNvZGVyJ3MgdGhyZWUgY2hhbm5lbCAxMC1iaXQgcGFyYWxsZWwK
PiAtb3V0cHV0IGFuZCBkcml2ZXMgdGhlIEhETUkgcGFkcy4KPiAtCj4gLVJlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4gLS0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1oZG1pLXBoeSIKPiAtLSB0
aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10NzYyMyBhbmQgbXQ4MTczCj4gLS0gcmVn
OiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgbW9kdWxlJ3MgcmVnaXN0
ZXJzCj4gLS0gY2xvY2tzOiBQTEwgcmVmZXJlbmNlIGNsb2NrCj4gLS0gY2xvY2stbmFtZXM6IG11
c3QgY29udGFpbiAicGxsX3JlZiIKPiAtLSBjbG9jay1vdXRwdXQtbmFtZXM6IG11c3QgYmUgImhk
bWl0eF9kaWdfY3RzIiBvbiBtdDgxNzMKPiAtLSAjcGh5LWNlbGxzOiBtdXN0IGJlIDwwPgo+IC0t
ICNjbG9jay1jZWxsczogbXVzdCBiZSA8MD4KPiAtCj4gLU9wdGlvbmFsIHByb3BlcnRpZXM6Cj4g
LS0gbWVkaWF0ZWssaWJpYXM6IFRYIERSViBiaWFzIGN1cnJlbnQgZm9yIDwxLjY1R2JwcywgZGVm
YXVsdHMgdG8gMHhhCj4gLS0gbWVkaWF0ZWssaWJpYXNfdXA6IFRYIERSViBiaWFzIGN1cnJlbnQg
Zm9yID4xLjY1R2JwcywgZGVmYXVsdHMgdG8gMHgxYwo+ICtTZWUgcGh5L21lZGlhdGVrLGhkbWkt
cGh5LnlhbWwKPgo+ICBFeGFtcGxlOgo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssaGRtaS1waHkueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssaGRtaS1waHkueWFtbAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi40NzUyNTE3YTE0NDYKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9t
ZWRpYXRlayxoZG1pLXBoeS55YW1sCj4gQEAgLTAsMCArMSw5MiBAQAo+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArIyBDb3B5cmln
aHQgKGMpIDIwMjAgTWVkaWFUZWsKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BoeS9tZWRpYXRlayxoZG1pLXBoeS55YW1sIwo+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4g
K3RpdGxlOiBNZWRpYVRlayBIaWdoIERlZmluaXRpb24gTXVsdGltZWRpYSBJbnRlcmZhY2UgKEhE
TUkpIFBIWSBiaW5kaW5nCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIENodW4tS3VhbmcgSHUg
PGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ICsgIC0gUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT4KPiArICAtIENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVr
LmNvbT4KPiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4gKyAgVGhlIEhETUkgUEhZIHNlcmlhbGl6ZXMg
dGhlIEhETUkgZW5jb2RlcidzIHRocmVlIGNoYW5uZWwgMTAtYml0IHBhcmFsbGVsCj4gKyAgb3V0
cHV0IGFuZCBkcml2ZXMgdGhlIEhETUkgcGFkcy4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgJG5v
ZGVuYW1lOgo+ICsgICAgcGF0dGVybjogIl5oZG1pLXBoeUBbMC05YS1mXSskIgo+ICsKPiArICBj
b21wYXRpYmxlOgo+ICsgICAgZW51bToKPiArICAgICAgLSBtZWRpYXRlayxtdDI3MDEtaGRtaS1w
aHkKPiArICAgICAgLSBtZWRpYXRlayxtdDc2MjMtaGRtaS1waHkKPiArICAgICAgLSBtZWRpYXRl
ayxtdDgxNzMtaGRtaS1waHkKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4g
KyAgY2xvY2tzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFBMTCByZWZl
cmVuY2UgY2xvY2sKPiArCj4gKyAgY2xvY2stbmFtZXM6Cj4gKyAgICBpdGVtczoKPiArICAgICAg
LSBjb25zdDogcGxsX3JlZgo+ICsKPiArICBjbG9jay1vdXRwdXQtbmFtZXM6Cj4gKyAgICBpdGVt
czoKPiArICAgICAgLSBjb25zdDogaGRtaXR4X2RpZ19jdHMKPiArCj4gKyAgIiNwaHktY2VsbHMi
Ogo+ICsgICAgY29uc3Q6IDAKPiArCj4gKyAgIiNjbG9jay1jZWxscyI6Cj4gKyAgICBjb25zdDog
MAo+ICsKPiArICBtZWRpYXRlayxpYmlhczoKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBU
WCBEUlYgYmlhcyBjdXJyZW50IGZvciA8IDEuNjVHYnBzCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiArICAgIG1pbmltdW06IDAKPiArICAgIG1h
eGltdW06IDYzCj4gKyAgICBkZWZhdWx0OiAweGEKPiArCj4gKyAgbWVkaWF0ZWssaWJpYXNfdXA6
Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVFggRFJWIGJpYXMgY3VycmVudCBmb3IgPj0g
MS42NUdicHMKPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMgo+ICsgICAgbWluaW11bTogMAo+ICsgICAgbWF4aW11bTogNjMKPiArICAgIGRlZmF1bHQ6
IDB4MWMKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4gKyAg
LSBjbG9ja3MKPiArICAtIGNsb2NrLW5hbWVzCj4gKyAgLSBjbG9jay1vdXRwdXQtbmFtZXMKPiAr
ICAtICIjcGh5LWNlbGxzIgo+ICsgIC0gIiNjbG9jay1jZWxscyIKPiArCj4gK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTczLWNsay5oPgo+ICsgICAgaGRtaV9waHk6IGhkbWkt
cGh5QDEwMjA5MTAwIHsKPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1o
ZG1pLXBoeSI7Cj4gKyAgICAgICAgcmVnID0gPDB4MTAyMDkxMDAgMHgyND47Cj4gKyAgICAgICAg
Y2xvY2tzID0gPCZhcG1peGVkc3lzIENMS19BUE1JWEVEX0hETUlfUkVGPjsKPiArICAgICAgICBj
bG9jay1uYW1lcyA9ICJwbGxfcmVmIjsKPiArICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAi
aGRtaXR4X2RpZ19jdHMiOwo+ICsgICAgICAgIG1lZGlhdGVrLGliaWFzID0gPDB4YT47Cj4gKyAg
ICAgICAgbWVkaWF0ZWssaWJpYXNfdXAgPSA8MHgxYz47Cj4gKyAgICAgICAgI2Nsb2NrLWNlbGxz
ID0gPDA+Owo+ICsgICAgICAgICNwaHktY2VsbHMgPSA8MD47Cj4gKyAgICB9Owo+ICsKPiArLi4u
Cj4gLS0KPiAyLjE4LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
