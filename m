Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6145AC55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:26:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE6DB222B9
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j9RTsip9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftWKSjiU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE6DB222B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6p4bTQxSy9UXbbjyniwKxP/JxOZaJHQaXRFe5TTXTGQ=; b=j9RTsip94Z489GLL2fB8W3lrs
	m6xxM+LFfWo+zInkSGw0pRYfS014wHgfd7dszOj8oh6INmpv/axn+nVDMTd3uH5YHckFGR7cuVLUB
	fTz6EbAwZVUiUpPetSmpfb2OW5ZXeLz6XpTDw1dX1BicGiGi+ho9GHmmjSiVXCE1DimWhjXP3w907
	bRj0/sEILMfO46CnNaRRGckxU15u5MAqMcuiAuseZAePSQCdotldL9hXAEtYkCt70dBPS1HJSmKPr
	6V92Uux4fk8tYNzXOYsRQtBChP9nsABpKRMBZ3VMxWdYYBro5ulyxQjuvNXnmB1xKSp9Dq188SABG
	lkRz+L77A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYtk-00037H-Ue; Mon, 16 Nov 2020 07:26:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYtj-00036d-92
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 07:26:00 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86A3D222B9;
 Mon, 16 Nov 2020 07:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605511558;
 bh=rhAoQ3uYeTlKRt+gftj9x9Wy4YxRy6VLph37vW9soUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ftWKSjiUUgmwpc3m3ysTWVkmstsTPq/tqt/T9Oi15PbF/jkqpIZ9O1egztNi9DoJj
 r4Wp/SMD43V1FLmOmdq/c1U75CSQwlyuSmJk6bzY7TFnGmNGkcPvqtjglifVOpTqAY
 YGI9xwmNWNMyDtbwmqMxQauz+qB7ROQAvBos9aHc=
Date: Mon, 16 Nov 2020 12:55:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver into
 drivers/phy/mediatek folder
Message-ID: <20201116072554.GH7499@vkoul-mobl>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-3-chunkuang.hu@kernel.org>
 <1604039049.31607.13.camel@mhfsdcap03>
 <CAAOTY_8Nf=Lh_JDojKY3oHdTigO=i+BHuvVA+9hYXCzgu-2Cfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_8Nf=Lh_JDojKY3oHdTigO=i+BHuvVA+9hYXCzgu-2Cfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_022559_452057_D3EB06E1 
X-CRM114-Status: GOOD (  18.65  )
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
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDItMTEtMjAsIDA3OjA4LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ICsgVmlub2Q6Cj4gCj4g
SGksIENodW5mZW5nOgo+IAo+IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNv
bT4g5pa8IDIwMjDlubQxMOaciDMw5pelIOmAseS6lCDkuIvljYgyOjI05a+r6YGT77yaCj4gPgo+
ID4gT24gVGh1LCAyMDIwLTEwLTI5IGF0IDIzOjI3ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3Rl
Ogo+ID4gPiBtdGtfbWlwaV9kc2lfcGh5IGlzIGN1cnJlbnRseSBwbGFjZWQgaW5zaWRlIG1lZGlh
dGVrIGRybSBkcml2ZXIsIGJ1dCBpdCdzCj4gPiA+IG1vcmUgc3VpdGFibGUgdG8gcGxhY2UgYSBw
aHkgZHJpdmVyIGludG8gcGh5IGRyaXZlciBmb2xkZXIsIHNvIG1vdmUKPiA+ID4gbXRrX21pcGlf
ZHNpX3BoeSBkcml2ZXIgaW50byBwaHkgZHJpdmVyIGZvbGRlci4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiA+IC0t
LQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDcgLS0tLS0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgLS0tLS0tCj4gPiA+ICBkcml2ZXJz
L3BoeS9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyAr
KysrKysrCj4gPiA+ICBkcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNSArKysrKwo+ID4gPiAgLi4uL21lZGlhdGVrL3BoeS1tdGstbWlw
aS1kc2ktbXQ4MTczLmN9ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIC4uLi9tZWRp
YXRlay9waHktbXRrLW1pcGktZHNpLW10ODE4My5jfSAgICAgICAgICAgICAgICAgICAgfCAyICst
Cj4gPiA+ICAuLi4vbXRrX21pcGlfdHguYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRz
aS5jfSAgICAgIHwgMiArLQo+ID4gPiAgLi4uL210a19taXBpX3R4LmggPT4gcGh5L21lZGlhdGVr
L3BoeS1tdGstbWlwaS1kc2kuaH0gICAgICB8IDAKPiA+ID4gIDggZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gPiA+ICByZW5hbWUgZHJpdmVycy97Z3B1
L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX21pcGlfdHguYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10
ay1taXBpLWRzaS1tdDgxNzMuY30gKDk5JSkKPiA+ID4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJt
L21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1p
cGktZHNpLW10ODE4My5jfSAoOTklKQo+ID4gPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX21pcGlfdHguYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRzaS5jfSAo
OTklKQo+ID4gPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHgu
aCA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRzaS5ofSAoMTAwJSkKPiA+Cj4gPiBSZXZp
ZXdlZC1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IAo+IEkg
d291bGQgbGlrZSB0byBhcHBseSB0aGUgd2hvbGUgc2VyaWVzIGludG8gbXkgdHJlZSwgd291bGQg
eW91IHBsZWFzZQo+IGdpdmUgYW4gYWNrZWQtYnkgdGFnIG9uIHRoaXMgcGF0Y2gsIHNvIEkgY291
bGQgYXBwbHkgdGhpcyBwYXRjaCBpbnRvCj4gbXkgdHJlZS4KCkkgd291bGQgcHJlZmVyIHRoaXMg
dG8gZ28gdGhydSBwaHkgdHJlZSwgdW5sZXNzIHRoZXJlIGFyZSBkZXBlbmRlbmNpZXMsCndoaWNo
IEkgYW0gbm90IGNsZWFyIGxvb2tpbmcgYXQgYWJvdmUKCi0tIAp+Vmlub2QKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
