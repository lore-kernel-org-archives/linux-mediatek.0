Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA26C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:02:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4D92078E
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fM9Fb1SG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUa0YacA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4D92078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MHtU3eFT9yy3tkkj5TkTTVH2YlB9LZdBykXVksMvkB0=; b=fM9Fb1SG4dQ9sKQX5GVjIPeFN
	uIRW7hiCSgnEXGd1v2TfTjrvn7Cx22MvbYDVFJtRBS51H1eKpWHHyx0rkij3Va5LU1tCKMYNx3Umb
	iHrdL8iMnAZUXmwHSIP/FEM9T4kdMSyG0NBzpeYVLXmXSt6cDqBrM8mgb5xaxWWI09Cvww6gT8VPT
	E/Uy7B43EkFR50ZbGsfpt0DG8L4U/8dQ/mGO9SjouuO3C9KUZ9OJXHFd8n9y48rnbXlxPcDVoN343
	UtGDScsNNrvgRt4jiu4D17cd/QJH7nB8TqVF8m14AZ7a9sUrHW89IjhYxNM+0FPBlijC/m53YX30Q
	rOXf3MT6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kehtM-0004Oo-G9; Mon, 16 Nov 2020 17:02:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehtK-0004N7-8V
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 17:02:11 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A00D20773;
 Mon, 16 Nov 2020 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605546129;
 bh=sjsgvMvmWPSA42bGQv2E5V5KDnWxlKmweJPO9rn0BZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tUa0YacAvfU0kutshUvy9FewSasPp6e2WQohFGcTY9mdgAnplDHwyEuGxl2k6btHK
 eHUX57VzyTaL1l/fRJBh1KmDXpbKtr7b/l8RFOq0GNV2ZJ/WqQfDmXBMvdiDP2+k6a
 N5GdV9zFBHROLPcs/fVuNby5Pe/m6CV4rEy0ttAc=
Date: Mon, 16 Nov 2020 22:32:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver into
 drivers/phy/mediatek folder
Message-ID: <20201116170205.GV7499@vkoul-mobl>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-3-chunkuang.hu@kernel.org>
 <1604039049.31607.13.camel@mhfsdcap03>
 <CAAOTY_8Nf=Lh_JDojKY3oHdTigO=i+BHuvVA+9hYXCzgu-2Cfg@mail.gmail.com>
 <20201116072554.GH7499@vkoul-mobl>
 <CAAOTY_8SyT87bSAmdrhwnEzRO_Yt0BQtDWnPrPahg4qTrUq1zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_8SyT87bSAmdrhwnEzRO_Yt0BQtDWnPrPahg4qTrUq1zQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_120210_553801_BEAE7F3F 
X-CRM114-Status: GOOD (  21.97  )
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

T24gMTctMTEtMjAsIDAwOjE3LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBWaW5vZDoKPiAK
PiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDEx5pyIMTbml6Ug6YCx
5LiAIOS4i+WNiDM6MjXlr6vpgZPvvJoKPiA+Cj4gPiBPbiAwMi0xMS0yMCwgMDc6MDgsIENodW4t
S3VhbmcgSHUgd3JvdGU6Cj4gPiA+ICsgVmlub2Q6Cj4gPiA+Cj4gPiA+IEhpLCBDaHVuZmVuZzoK
PiA+ID4KPiA+ID4gQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMOW5tDEw5pyIMzDml6Ug6YCx5LqUIOS4i+WNiDI6MjTlr6vpgZPvvJoKPiA+ID4gPgo+ID4g
PiA+IE9uIFRodSwgMjAyMC0xMC0yOSBhdCAyMzoyNyArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90
ZToKPiA+ID4gPiA+IG10a19taXBpX2RzaV9waHkgaXMgY3VycmVudGx5IHBsYWNlZCBpbnNpZGUg
bWVkaWF0ZWsgZHJtIGRyaXZlciwgYnV0IGl0J3MKPiA+ID4gPiA+IG1vcmUgc3VpdGFibGUgdG8g
cGxhY2UgYSBwaHkgZHJpdmVyIGludG8gcGh5IGRyaXZlciBmb2xkZXIsIHNvIG1vdmUKPiA+ID4g
PiA+IG10a19taXBpX2RzaV9waHkgZHJpdmVyIGludG8gcGh5IGRyaXZlciBmb2xkZXIuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1
QGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyAtLS0tLS0tCj4gPiA+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDYgLS0tLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDcgKysrKysrKwo+ID4gPiA+ID4gIGRy
aXZlcnMvcGh5L21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA1ICsrKysrCj4gPiA+ID4gPiAgLi4uL21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTcz
LmN9ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiA+ICAuLi4vbWVkaWF0ZWsvcGh5
LW10ay1taXBpLWRzaS1tdDgxODMuY30gICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gPiA+
ID4gIC4uLi9tdGtfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmN9
ICAgICAgfCAyICstCj4gPiA+ID4gPiAgLi4uL210a19taXBpX3R4LmggPT4gcGh5L21lZGlhdGVr
L3BoeS1tdGstbWlwaS1kc2kuaH0gICAgICB8IDAKPiA+ID4gPiA+ICA4IGZpbGVzIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gIHJlbmFtZSBkcml2
ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19tdDgxNzNfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRl
ay9waHktbXRrLW1pcGktZHNpLW10ODE3My5jfSAoOTklKQo+ID4gPiA+ID4gIHJlbmFtZSBkcml2
ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5jID0+IHBoeS9tZWRpYXRl
ay9waHktbXRrLW1pcGktZHNpLW10ODE4My5jfSAoOTklKQo+ID4gPiA+ID4gIHJlbmFtZSBkcml2
ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1t
dGstbWlwaS1kc2kuY30gKDk5JSkKPiA+ID4gPiA+ICByZW5hbWUgZHJpdmVycy97Z3B1L2RybS9t
ZWRpYXRlay9tdGtfbWlwaV90eC5oID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmh9
ICgxMDAlKQo+ID4gPiA+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZl
bmcueXVuQG1lZGlhdGVrLmNvbT4KPiA+ID4KPiA+ID4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5IHRo
ZSB3aG9sZSBzZXJpZXMgaW50byBteSB0cmVlLCB3b3VsZCB5b3UgcGxlYXNlCj4gPiA+IGdpdmUg
YW4gYWNrZWQtYnkgdGFnIG9uIHRoaXMgcGF0Y2gsIHNvIEkgY291bGQgYXBwbHkgdGhpcyBwYXRj
aCBpbnRvCj4gPiA+IG15IHRyZWUuCj4gPgo+ID4gSSB3b3VsZCBwcmVmZXIgdGhpcyB0byBnbyB0
aHJ1IHBoeSB0cmVlLCB1bmxlc3MgdGhlcmUgYXJlIGRlcGVuZGVuY2llcywKPiA+IHdoaWNoIEkg
YW0gbm90IGNsZWFyIGxvb2tpbmcgYXQgYWJvdmUKPiA+Cj4gCj4gUGxlYXNlIGFwcGx5IHRoaXMg
c2VyaWVzIHRvIHBoeSB0cmVlLCBhbmQgSSB3b3VsZCBkcm9wIHRoaXMgc2VyaWVzCj4gZnJvbSBt
eSB0cmVlLCB0aGFua3MuCgpPa2F5IHN1cmUsIGp1c3QgcmVhbGl6ZWQgSSBkb250IGhhdmUgdGhp
cyBpbiBteSBpbmJveCwgY2FuIHlvdSBwbGVhc2UKcmVwb3N0CgotLSAKflZpbm9kCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
