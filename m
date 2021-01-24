Return-Path: <SRS0=sFt1=G3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE63CC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Jan 2021 04:47:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B5622581
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Jan 2021 04:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B5622581
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Jw9CnffK2zZzI74YRJeqPaeoIGOqRtXZLx7fWQCC80=; b=bMR3DWVqYg91avB/EOYFhfJze
	++rVZnHVaIeY1EqpkmM8SX26GyYIheWl+k3sLKVi04bXxxeQCjCjLVMJWJ606TpUH2EhbtDrNigCB
	s4PPSslUSmqcxV6tuu6yiYHBSE6OZ+MU1I6+VAM1DfZKI2z3IDNVv71OxJI4LLqFZnr0I5hZf6OxB
	aBYssndJikB8cKxK2ZZeqtmLnNM0yqJuO9e6BjtZynkMOk9fBY3OW2nu0WICcZpl01rURLrYZx3t6
	a5wfRn9VOg+b/H5QWUVxJlyOWirdTHpm1I+Q3xsP7YkgN1ol4o+tyrhDih69H2/OwSxmlV9Eq/hF8
	K+y/u3jSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3XJA-0002rc-7R; Sun, 24 Jan 2021 04:47:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3XJ6-0002qz-1W; Sun, 24 Jan 2021 04:47:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AAFA22CB9;
 Sun, 24 Jan 2021 04:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611463641;
 bh=Urovf5esIrjfn93td/lp5lIed9NHT13uUhH0F2Cn2AE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KSpsFkG0QosDis5ZntAq3BALLTDdfLllUQ1vHIW43/I/qUcKF7JUHZywUSPKryVWg
 87e45AMYjjznsUfW/MXHxZuk8PyHEYB0MwfVb2WvqTdwrpG535Kh7UpnDKTnz7E6GT
 9iNBt1FjV8x8P7uigDDq42UfjX5JEL2e+pFqlvk9yKpkC3K0bCSQWxqbepZC0A7VMB
 ph+vVJjY00UAZ/Jk7yISk7auoP5UH0rX8Ll/jjoZwJu43TDwqX2SpR1YY2vjaRXPyb
 E3d0ui4JhzzECxOTVEqKCIWsnKmtsmzx84DVRm9bJikQ+SgN1ygIDxKoN6Pqq+xg6n
 21Myq0+TOCK9g==
Received: by mail-ej1-f41.google.com with SMTP id r12so13240643ejb.9;
 Sat, 23 Jan 2021 20:47:21 -0800 (PST)
X-Gm-Message-State: AOAM5317ZXSwg8WDNDITftJu9t6JwIR8evO09gyoGZIHNElbXhkIzgA6
 tOWfQJnSw6vSkPRU3bCG1KOn7xHRtr8N/RmAIg==
X-Google-Smtp-Source: ABdhPJxoF6afPRUA0RYz8hTCdtGJdRPYVGO/FrQKiI+n8xlgMCnfU61vIVV6/1/0EI61xcYweAxdF9ZVs2LYKOZJMlA=
X-Received: by 2002:a17:906:a106:: with SMTP id t6mr691006ejy.63.1611463639987; 
 Sat, 23 Jan 2021 20:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
 <20210122120323.4337-3-chunfeng.yun@mediatek.com>
In-Reply-To: <20210122120323.4337-3-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 24 Jan 2021 12:47:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY__O=z-AOo1RCRGfJYuSsXs1cUZgWFaTQz_3W_Tj=CeFBQ@mail.gmail.com>
Message-ID: <CAAOTY__O=z-AOo1RCRGfJYuSsXs1cUZgWFaTQz_3W_Tj=CeFBQ@mail.gmail.com>
Subject: Re: [PATCH next v2 03/17] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_234724_205397_801BFAEE 
X-CRM114-Status: GOOD (  13.97  )
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
 DTML <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDHmnIgyMuaXpSDpgLHkupQg5LiL5Y2IODowNOWvq+mBk++8mgo+Cj4gVGhlIGNv
bXBhdGlsYmUgIm1lZGlhdGVrLG10NzYyMy1taXBpLXR4IiBpcyBub3Qgc3VwcG9ydGVkIGluIGRy
aXZlciwKPiBhbmQgaW4gZmFjdCB1c2VzICJtZWRpYXRlayxtdDI3MDEtbWlwaS10eCIgaW5zdGVh
ZCBvbiBNVDc2MjMsIHNvIGNoYW5nZXMKPiB0aGUgY29tcGF0aWJsZSBpdGVtcyB0byBtYWtlIGRl
cGVuZGVuY2UgY2xlYXIuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1
QGtlcm5lbC5vcmc+Cgo+Cj4gQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwu
b3JnPgo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IFNpZ25l
ZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4KPiAtLS0K
PiB2Mjogc2VwYXJhdGUgdHdvIHBhdGNoZXMgc3VnZ2VzdGVkIGJ5IENLCj4gLS0tCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwgICB8IDEzICsrKysr
KysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5
L21lZGlhdGVrLGRzaS1waHkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sCj4gaW5kZXggNzFkNGFjZWExZjY2Li42ZTRkNzk1
ZjliMDIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bo
eS9tZWRpYXRlayxkc2ktcGh5LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbAo+IEBAIC0xOSwxMSArMTksMTQgQEAg
cHJvcGVydGllczoKPiAgICAgIHBhdHRlcm46ICJeZHNpLXBoeUBbMC05YS1mXSskIgo+Cj4gICAg
Y29tcGF0aWJsZToKPiAtICAgIGVudW06Cj4gLSAgICAgIC0gbWVkaWF0ZWssbXQyNzAxLW1pcGkt
dHgKPiAtICAgICAgLSBtZWRpYXRlayxtdDc2MjMtbWlwaS10eAo+IC0gICAgICAtIG1lZGlhdGVr
LG10ODE3My1taXBpLXR4Cj4gLSAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLW1pcGktdHgKPiArICAg
IG9uZU9mOgo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBlbnVtOgo+ICsgICAgICAg
ICAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLW1pcGktdHgKPiArICAgICAgICAgIC0gY29uc3Q6IG1l
ZGlhdGVrLG10MjcwMS1taXBpLXR4Cj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10MjcwMS1t
aXBpLXR4Cj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE3My1taXBpLXR4Cj4gKyAgICAg
IC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4My1taXBpLXR4Cj4KPiAgICByZWc6Cj4gICAgICBtYXhJ
dGVtczogMQo+IC0tCj4gMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
