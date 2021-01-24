Return-Path: <SRS0=sFt1=G3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173BDC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Jan 2021 04:57:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF4E22581
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Jan 2021 04:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF4E22581
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FxnRkyp4udGsHY9gpYRxmh/Mh36NnfWVWh4h1pIrmI8=; b=AlvOwNFu5Zz6HwlLgmtB3ajGj
	Xyn2YzxctQu77MaBvGj77PFWCQtg8td8AcmSdL6mx0RrPrRhnre6I/xewJVovg8OHsL0jMyQRR/sM
	G9N9Eb8VXD1k3NYpSPSluykwSt/SFb4Nk3pFaOdljF6w7GvQHJQjUIEw8LFCgaCKlkUKDD8s9ZP3i
	Xx51Sy1gFVHQOBSYtKy+0kKJkAjKxspPxeN2y2pt8e50iHRRHXtzf2CS0kOGjhwFAFdo2b95y0pfM
	CoSYluo8vYagmJX8iXy4pJ5D1sBmokh3Gv5cQHoKSABVKvlU0d9++h632Ay4dok5l1G0PyWwd+ReZ
	BX9GEtz2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3XSX-0003Gq-DV; Sun, 24 Jan 2021 04:57:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3XSS-0003GB-Ti; Sun, 24 Jan 2021 04:57:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89B26227BF;
 Sun, 24 Jan 2021 04:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611464223;
 bh=+Dv2W7xUrIowE8lzvyg7LMXioDkpmKs4Tk/Bc5dD3ac=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=prxBeikQt0KHNBec0XCwiIrxyhDRs5m11VZV4O+vUx9PV25en2+tYSzhelYr2OUdB
 1h3PXl5DgRhk7QeQCqoO4/4k4N90VQErSruYiXtZVnp7ltNt8qn9Un+bi9BzNr/G93
 mlM/GrTlw39LKBbsza6Akhjt8kCE20GnK+9rzIWRFR4X7blMBdfmgOdJCNGxhVvfEP
 NbbwJnLPXKa/v+Vb2XcgwdiOs05z9QduAFWc+tvgjY0XApV3g//X2Hwf1rhGgBFEBF
 7v1QOOlghhLaT7xhldqbmG0/3SdTABCx1Jtm9XoAS/l0Wnr1TcXHRyQiLuc3yrjSnv
 6x2UKyZAuaWVA==
Received: by mail-ed1-f53.google.com with SMTP id d22so11340032edy.1;
 Sat, 23 Jan 2021 20:57:03 -0800 (PST)
X-Gm-Message-State: AOAM530j3/t0Cwpbh1L8qcLS7hmJPk+itRK20HrmqjkdG70p861aRak7
 hGX1nCiPVt6H3FygaUiBNF1Pk89sDzbIc30w0Q==
X-Google-Smtp-Source: ABdhPJwSMImeoz+A6pH+O3PAla2mGiOTiQQ5C2GVf4VJbqxKYrHrXCj9enw3rYIbJLnELNxQr2L4gK4y4v3aX1He228=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr67225edf.166.1611464222173;
 Sat, 23 Jan 2021 20:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
 <20210122120323.4337-3-chunfeng.yun@mediatek.com>
 <CAAOTY__O=z-AOo1RCRGfJYuSsXs1cUZgWFaTQz_3W_Tj=CeFBQ@mail.gmail.com>
In-Reply-To: <CAAOTY__O=z-AOo1RCRGfJYuSsXs1cUZgWFaTQz_3W_Tj=CeFBQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 24 Jan 2021 12:56:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8X35EpvLiSOuNdj4dVu7KBocw9mhaKG4TJy24LizvHNg@mail.gmail.com>
Message-ID: <CAAOTY_8X35EpvLiSOuNdj4dVu7KBocw9mhaKG4TJy24LizvHNg@mail.gmail.com>
Subject: Re: [PATCH next v2 03/17] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_235705_079962_A794414B 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: DTML <devicetree@vger.kernel.org>, Min Guo <min.guo@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIx5bm0MeaciDI05pelIOmAseaXpSDkuIvljYgxMjo0N+Wvq+mBk++8mgo+Cj4gSGksIENo
dW5mZW5nOgo+Cj4gQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDHmnIgyMuaXpSDpgLHkupQg5LiL5Y2IODowNOWvq+mBk++8mgo+ID4KPiA+IFRoZSBj
b21wYXRpbGJlICJtZWRpYXRlayxtdDc2MjMtbWlwaS10eCIgaXMgbm90IHN1cHBvcnRlZCBpbiBk
cml2ZXIsCj4gPiBhbmQgaW4gZmFjdCB1c2VzICJtZWRpYXRlayxtdDI3MDEtbWlwaS10eCIgaW5z
dGVhZCBvbiBNVDc2MjMsIHNvIGNoYW5nZXMKPiA+IHRoZSBjb21wYXRpYmxlIGl0ZW1zIHRvIG1h
a2UgZGVwZW5kZW5jZSBjbGVhci4KPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVu
a3VhbmcuaHVAa2VybmVsLm9yZz4KClNvcnJ5LCBwbGVhc2UgcmVtb3ZlIG15IHJldmlld2VkLWJ5
IHRhZy4gV2Ugc2hvdWxkIG5vdCBkZWZpbmUgdGhlCmJpbmRpbmcgZG9jdW1lbnQgYWNjb3JkaW5n
IHRvIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBkcml2ZXIuIFdlIGRlZmluZQp0aGUgYmluZGluZyBk
b2N1bWVudCBhY2NvcmRpbmcgdG8gdGhlIGhhcmR3YXJlLiBTbyB0aGUgZGVzY3JpcHRpb24Kc2hv
dWxkIGJlIGxpa2UgIm10NzYyMy1taXBpLXR4IGlzIGNvbXBhdGlibGUgdG8gbXQyNzAxLW1pcGkt
dHgiLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiA+Cj4gPiBDYzogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT4KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcu
eXVuQG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+ID4gdjI6IHNlcGFyYXRlIHR3byBwYXRjaGVzIHN1
Z2dlc3RlZCBieSBDSwo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21l
ZGlhdGVrLGRzaS1waHkueWFtbCAgIHwgMTMgKysrKysrKystLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2kt
cGh5LnlhbWwKPiA+IGluZGV4IDcxZDRhY2VhMWY2Ni4uNmU0ZDc5NWY5YjAyIDEwMDY0NAo+ID4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2kt
cGh5LnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
bWVkaWF0ZWssZHNpLXBoeS55YW1sCj4gPiBAQCAtMTksMTEgKzE5LDE0IEBAIHByb3BlcnRpZXM6
Cj4gPiAgICAgIHBhdHRlcm46ICJeZHNpLXBoeUBbMC05YS1mXSskIgo+ID4KPiA+ICAgIGNvbXBh
dGlibGU6Cj4gPiAtICAgIGVudW06Cj4gPiAtICAgICAgLSBtZWRpYXRlayxtdDI3MDEtbWlwaS10
eAo+ID4gLSAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLW1pcGktdHgKPiA+IC0gICAgICAtIG1lZGlh
dGVrLG10ODE3My1taXBpLXR4Cj4gPiAtICAgICAgLSBtZWRpYXRlayxtdDgxODMtbWlwaS10eAo+
ID4gKyAgICBvbmVPZjoKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAtIGVudW06
Cj4gPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10NzYyMy1taXBpLXR4Cj4gPiArICAgICAg
ICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10MjcwMS1taXBpLXR4Cj4gPiArICAgICAgLSBjb25zdDog
bWVkaWF0ZWssbXQyNzAxLW1pcGktdHgKPiA+ICsgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgx
NzMtbWlwaS10eAo+ID4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4My1taXBpLXR4Cj4g
Pgo+ID4gICAgcmVnOgo+ID4gICAgICBtYXhJdGVtczogMQo+ID4gLS0KPiA+IDIuMTguMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
