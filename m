Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BFBC388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 23:39:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0ADF208FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 23:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nc0v5xQz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1w6tnffG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0ADF208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BWitCHh1p7neGgN3SOnivQ8O2pAmzA2gX8bmem2xGQ0=; b=nc0v5xQz20wp03UNOMAlWZjTH
	qBt95buHDN5vKUIu/uHjoljZucTrEwcD9+oL+EsiHqP2TTqdjdXvcmDsp4Ptu1YnTmQJLfgRxsrBM
	2/3zZzTis7SbOyEYROx7G0yrDDmzHDtZL0IdWTfEHfeuaVIaYKyZ6OXeY7CVMkzVtXamnuSQBwC8y
	R9mjDCpLOzXGCYAvFAKFsarMd3l96ygbHuXRStKP+3P73WLIgAGETEx8g7Bg+xMh50b+l+BjMvscg
	y2bM7a+uj2slZXuWcZZOykuwgXLT0CEb7o/6RyTt+9keHav0oRooLCkhTNo8rArllDpzzdug3HnVO
	ck0TKuEaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kftVy-000777-0S; Thu, 19 Nov 2020 23:38:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kftVu-00076X-3E; Thu, 19 Nov 2020 23:38:55 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8AA82224D;
 Thu, 19 Nov 2020 23:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605829133;
 bh=XJSKtvpgEybgfJcO0SJsTybzoZJuV4CZibv1f3Vm9Q4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1w6tnffGLWdZheAqgLLRjoFP66HuyXPIcYm238SHq4vJaaDHD5I/G2qoN9AynmR/r
 Zfb0giKkohOvZdwTIHwba6fSf5YO0MvGzc1EQg2mdbXbtn35bBh1NIBbwZLTpYF30i
 dWzoExbrSn5VYaFfD9LEkGHVXdH8mjuOVKAiD6EI=
Received: by mail-ej1-f52.google.com with SMTP id o21so10369451ejb.3;
 Thu, 19 Nov 2020 15:38:52 -0800 (PST)
X-Gm-Message-State: AOAM531IXUWt4nBpwAYJTW8WXwtgg2+xIzYUob+5aK84mEVG19OCyBks
 tbssNpJQ+lyDLpE2V8ILirpmHfjNJxD8nV5rVQ==
X-Google-Smtp-Source: ABdhPJyCTosQ1GLHfnPlHYYUBtA/b5PCwSHB1U+bWLkPDbn0q/TbtAXAoCGE19frEgpV/RtrhRZkovX5D61bPOn2L44=
X-Received: by 2002:a17:906:6a4e:: with SMTP id
 n14mr13380254ejs.194.1605829131052; 
 Thu, 19 Nov 2020 15:38:51 -0800 (PST)
MIME-Version: 1.0
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-7-chunfeng.yun@mediatek.com>
In-Reply-To: <20201118082126.42701-7-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 20 Nov 2020 07:38:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_81uZ7MY1ZyfsyYL_62wkNvG2VCT3+G4Zr1bZBG9_Yg1w@mail.gmail.com>
Message-ID: <CAAOTY_81uZ7MY1ZyfsyYL_62wkNvG2VCT3+G4Zr1bZBG9_Yg1w@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: phy: convert MIP DSI PHY binding to
 YAML schema
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_183854_407474_6A33B9CA 
X-CRM114-Status: GOOD (  23.22  )
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
lrwgMjAyMOW5tDEx5pyIMTjml6Ug6YCx5LiJIOS4i+WNiDQ6MjHlr6vpgZPvvJoKPgo+IENvbnZl
cnQgTUlQSSBEU0kgUEhZIGJpbmRpbmcgdG8gWUFNTCBzY2hlbWEgbWVkaWF0ZWssZHNpLXBoeS55
YW1sCj4KPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IC0t
LQo+IHYzOiBuZXcgcGF0Y2gKPiAtLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHNpLnR4dCAgICAgICAgIHwgMTggKy0tLQo+ICAuLi4vYmluZGluZ3MvcGh5L21lZGlhdGVrLGRz
aS1waHkueWFtbCAgICAgICAgfCA4MyArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgODQgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1w
aHkueWFtbAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0Cj4gaW5kZXgg
ZjA2ZjI0ZDQwNWE1Li44MjM4YTg2Njg2YmUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGRzaS50eHQKPiBAQCAtMjIsMjMgKzIyLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoK
PiAgTUlQSSBUWCBDb25maWd1cmF0aW9uIE1vZHVsZQo+ICA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4KPiAtVGhlIE1JUEkgVFggY29uZmlndXJhdGlvbiBtb2R1bGUgY29udHJvbHMgdGhl
IE1JUEkgRC1QSFkuCj4gLQo+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOgo+IC0tIGNvbXBhdGlibGU6
ICJtZWRpYXRlayw8Y2hpcD4tbWlwaS10eCIKPiAtLSB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBt
dDI3MDEsIDc2MjMsIG10ODE3MyBhbmQgbXQ4MTgzLgo+IC0tIHJlZzogUGh5c2ljYWwgYmFzZSBh
ZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiAtLSBjbG9j
a3M6IFBMTCByZWZlcmVuY2UgY2xvY2sKPiAtLSBjbG9jay1vdXRwdXQtbmFtZXM6IG5hbWUgb2Yg
dGhlIG91dHB1dCBjbG9jayBsaW5lIHRvIHRoZSBEU0kgZW5jb2Rlcgo+IC0tICNjbG9jay1jZWxs
czogbXVzdCBiZSA8MD47Cj4gLS0gI3BoeS1jZWxsczogbXVzdCBiZSA8MD4uCj4gLQo+IC1PcHRp
b25hbCBwcm9wZXJ0aWVzOgo+IC0tIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wOiBhZGp1c3QgZHJp
dmluZyBjdXJyZW50LCBzaG91bGQgYmUgMzAwMCB+IDYwMDAuIEFuZAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRoZSBzdGVwIGlzIDIwMC4KPiAt
LSBudm1lbS1jZWxsczogQSBwaGFuZGxlIHRvIHRoZSBjYWxpYnJhdGlvbiBkYXRhIHByb3ZpZGVk
IGJ5IGEgbnZtZW0gZGV2aWNlLiBJZgo+IC0gICAgICAgICAgICAgICB1bnNwZWNpZmllZCBkZWZh
dWx0IHZhbHVlcyBzaGFsbCBiZSB1c2VkLgo+IC0tIG52bWVtLWNlbGwtbmFtZXM6IFNob3VsZCBi
ZSAiY2FsaWJyYXRpb24tZGF0YSIKPiArU2VlIHBoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwKPgo+
ICBFeGFtcGxlOgo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uODdmOGRmMjUxYWIwCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBo
eS55YW1sCj4gQEAgLTAsMCArMSw4MyBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArIyBDb3B5cmlnaHQgKGMpIDIwMjAgTWVk
aWFUZWsKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IE1lZGlhVGVr
IE1JUEkgRGlzcGxheSBTZXJpYWwgSW50ZXJmYWNlIChEU0kpIFBIWSBiaW5kaW5nCj4gKwo+ICtt
YWludGFpbmVyczoKPiArICAtIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
Pgo+ICsgIC0gQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgoKUGxlYXNl
IGFkZCBQaGlsaXBwIFphYmVsIGJlY2F1c2UgaGUgaXMgTWVkaWF0ZWsgRFJNIGRyaXZlciBtYWlu
dGFpbmVyLgoKRFJNIERSSVZFUlMgRk9SIE1FRElBVEVLCk06IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPgpNOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPgpMOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClM6IFN1cHBvcnRlZApGOiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay8KCj4gKwo+
ICtkZXNjcmlwdGlvbjogVGhlIE1JUEkgRFNJIFBIWSBzdXBwb3J0cyB1cCB0byA0LWxhbmUgb3V0
cHV0Lgo+ICsKPiArcHJvcGVydGllczoKPiArICAkbm9kZW5hbWU6Cj4gKyAgICBwYXR0ZXJuOiAi
XmRzaS1waHlAWzAtOWEtZl0rJCIKPiArCj4gKyAgY29tcGF0aWJsZToKPiArICAgIGVudW06Cj4g
KyAgICAgIC0gbWVkaWF0ZWssbXQyNzAxLW1pcGktdHgKPiArICAgICAgLSBtZWRpYXRlayxtdDc2
MjMtbWlwaS10eAo+ICsgICAgICAtIG1lZGlhdGVrLG10ODE3My1taXBpLXR4CgpBZGQgbWVkaWF0
ZWssbXQ4MTgzLW1pcGktdHgKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsKPiArICByZWc6Cj4g
KyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9ja3M6Cj4gKyAgICBpdGVtczoKPiArICAgICAg
LSBkZXNjcmlwdGlvbjogUExMIHJlZmVyZW5jZSBjbG9jawo+ICsKPiArICBjbG9jay1vdXRwdXQt
bmFtZXM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICAiI3BoeS1jZWxscyI6Cj4gKyAgICBj
b25zdDogMAo+ICsKPiArICAiI2Nsb2NrLWNlbGxzIjoKPiArICAgIGNvbnN0OiAwCj4gKwo+ICsg
IG52bWVtLWNlbGxzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArICAgIGRlc2NyaXB0aW9uOiBBIHBo
YW5kbGUgdG8gdGhlIGNhbGlicmF0aW9uIGRhdGEgcHJvdmlkZWQgYnkgYSBudm1lbSBkZXZpY2Us
Cj4gKyAgICAgIGlmIHVuc3BlY2lmaWVkLCBkZWZhdWx0IHZhbHVlcyBzaGFsbCBiZSB1c2VkLgo+
ICsKPiArICBudm1lbS1jZWxsLW5hbWVzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6
IGNhbGlicmF0aW9uLWRhdGEKPiArCj4gKyAgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXA6Cj4gKyAg
ICBkZXNjcmlwdGlvbjogYWRqdXN0IGRyaXZpbmcgY3VycmVudCwgdGhlIHN0ZXAgaXMgMjAwLgo+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyAg
ICBtaW5pbXVtOiAyMDAwCj4gKyAgICBtYXhpbXVtOiA2MDAwCj4gKyAgICBkZWZhdWx0OiA0NjAw
Cj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gY2xv
Y2tzCj4gKyAgLSBjbG9jay1vdXRwdXQtbmFtZXMKPiArICAtICIjcGh5LWNlbGxzIgo+ICsgIC0g
IiNjbG9jay1jZWxscyIKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiAr
ZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4
MTczLWNsay5oPgo+ICsgICAgZHNpLXBoeUAxMDIxNTAwMCB7Cj4gKyAgICAgICAgY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxNzMtbWlwaS10eCI7Cj4gKyAgICAgICAgcmVnID0gPDB4MTAyMTUw
MDAgMHgxMDAwPjsKPiArICAgICAgICBjbG9ja3MgPSA8JmNsazI2bT47Cj4gKyAgICAgICAgY2xv
Y2stb3V0cHV0LW5hbWVzID0gIm1pcGlfdHgwX3BsbCI7Cj4gKyAgICAgICAgZHJpdmUtc3RyZW5n
dGgtbWljcm9hbXAgPSA8NDAwMD47Cj4gKyAgICAgICAgbnZtZW0tY2VsbHM9IDwmbWlwaV90eF9j
YWxpYnJhdGlvbj47Cj4gKyAgICAgICAgbnZtZW0tY2VsbC1uYW1lcyA9ICJjYWxpYnJhdGlvbi1k
YXRhIjsKPiArICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47Cj4gKyAgICAgICAgI3BoeS1jZWxs
cyA9IDwwPjsKPiArICAgIH07Cj4gKwo+ICsuLi4KPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
