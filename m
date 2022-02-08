Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A451DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 04:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUowUj+MooMZwnMTW6n1zJ7l6EzjqYSVQH0+XaSA2g0=; b=Z5p6XoQmTwxItx
	Qi0AjdRmZQfrDW1SokxCsezo6Hd31QRANt+AueVZBaEJ//4QzexJuRmW3CfFPksCyg0o1nmBEmxHQ
	JTaZZ/MO9JNaZLY32oBmzUmeNdAq8wDR2wkZsszurKoFT4omznhWPQZuB23f+oZ9sVvcP5yNa881s
	yBckey6kLEzQSJIHT085KAetCYe+Rkl3rOeKs8TKUOPNSk6vCzLdFWJvBLY9/ulOxfk2RpIm5olG9
	yk0hXPkq9J3WAFnFHn9Fvxjbm1JzHnYBlpZqF7jtVX4RlzyeBX7gcslrJH2eVvmjTWHHdZaDuKaSw
	5Qs5Moq91J/oocbcZLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHIH5-00CU5B-G1; Tue, 08 Feb 2022 04:38:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHIGs-00CU40-0L; Tue, 08 Feb 2022 04:38:33 +0000
X-UUID: 0f4023fdc9c34a27bed190f491a2302d-20220207
X-UUID: 0f4023fdc9c34a27bed190f491a2302d-20220207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 817916644; Mon, 07 Feb 2022 21:38:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Feb 2022 20:28:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 8 Feb 2022 12:28:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Feb 2022 12:28:23 +0800
Message-ID: <f6633fc82c4fa899c7f4ca27d9751d9e61fb90ac.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pwm: mtk-disp: add compatible string for
 MT8183 SoC
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pwm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 8 Feb 2022 12:28:23 +0800
In-Reply-To: <20220207125158.t5362u2dddccdmsq@pengutronix.de>
References: <20220207112657.18246-1-allen-kh.cheng@mediatek.com>
 <20220207125158.t5362u2dddccdmsq@pengutronix.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_203830_098662_2E1217F5 
X-CRM114-Status: GOOD (  22.64  )
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

SGkgVXdlIEtsZWluZS1Lw7ZuaWcsCgpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbnMuCldl
IHdpbGwgc2VuZCBhbm90aGVyIHBhdGNoIGZvciAueWFtbCBmb3JtYXQuCgpBYm91dCB0aGUgbGFz
dCByZW1pbmRlciwgc29ycnksIEkgZG9u4oCZdCBnZXQgdGhhdC4gCkRvIHlvdSBtZWFuIHVwcGVy
L2xvd2VyIGNhc2UgbGV0dGVycyBpbiBhbiBlbWFpbCBhZGRyZXNzPwoKQmVzdCByZWdhcmRzCkFs
bGVuCgpPbiBNb24sIDIwMjItMDItMDcgYXQgMTM6NTEgKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmln
IHdyb3RlOgo+IEhlbGxvLAo+IAo+IE9uIE1vbiwgRmViIDA3LCAyMDIyIGF0IDA3OjI2OjU3UE0g
KzA4MDAsIEFsbGVuLUtIIENoZW5nIHdyb3RlOgo+ID4gRnJvbTogQWxsZW4tS0ggQ2hlbmcgPEFs
bGVuLUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KPiA+IAo+ID4gQWRkIGNvbXBhdGlibGUgc3RyaW5n
IGZvciBNVDgxODMgU29DIGluIGRldmljZSB0cmVlIGJpbmRpbmcuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxBbGxlbi1LSC5DaGVuZ0BtZWRpYXRlay5jb20+Cj4gPiAt
LS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1tdGstZGlz
cC50eHQgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLW10
ay1kaXNwLnR4dCAKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9w
d20tbXRrLWRpc3AudHh0Cj4gPiBpbmRleCA5MDJiMjcxODkxYWUuLjY5MWU1OGI2YzIyMyAxMDA2
NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLW10
ay1kaXNwLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3
bS9wd20tbXRrLWRpc3AudHh0Cj4gPiBAQCAtNiw2ICs2LDcgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoKPiA+ICAgICAtICJtZWRpYXRlayxtdDY1OTUtZGlzcC1wd20iOiBmb3VuZCBvbiBtdDY1OTUg
U29DLgo+ID4gICAgIC0gIm1lZGlhdGVrLG10ODE2Ny1kaXNwLXB3bSIsICJtZWRpYXRlayxtdDgx
NzMtZGlzcC1wd20iOiBmb3VuZAo+ID4gb24gbXQ4MTY3IFNvQy4KPiA+ICAgICAtICJtZWRpYXRl
ayxtdDgxNzMtZGlzcC1wd20iOiBmb3VuZCBvbiBtdDgxNzMgU29DLgo+ID4gKyAgIC0gIm1lZGlh
dGVrLG10ODE4My1kaXNwLXB3bSI6IGZvdW5kIG9uIG10ODE4MyBTb0MuJAo+IAo+IFRoZSBwYXRj
aCBsb29rcyBnb29kIGluIHByaW5jaXBsZS4gSSdkIGxpa2UgdG8gc2VlIHRoZSAudHh0IGZpbGUK
PiBjb252ZXJ0ZWQgdG8gLnlhbWwgdGhvdWdoLiBXb3VsZCB5b3UgY2FyZSBmb3IgdGhhdCBwbGVh
c2U/Cj4gCj4gQWxzbyBpdCB3b3VsZCBiZSBnb29kIGlmIHlvdSdkIGNhcmUgdGhhdCBzZW5kZXIg
ZW1haWwgYWRkcmVzcyBhbmQKPiBhdXRob3IKPiBhZGRyZXNzIG1hdGNoLgo+IAo+IEJlc3QgcmVn
YXJkcwo+IFV3ZQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
