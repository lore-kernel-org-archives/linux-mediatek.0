Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BF0C5519F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 16:17:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C6622265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 16:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LQSiBcJS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dj5aAyQ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C6622265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JpZY8h9lC6rtLVvKQRlk87gLbtKwwnV4y7eJzPz/OLk=; b=LQSiBcJSQ+ZpwgU/R7FNTyZqs
	S1lvHCe5tX7qKWehxe3PnP5Ziz4fSe3gf6K5z0P0bqtkrFjnsTMtVkzwu6XaIqwB9O/4uk2/mnBG7
	mE5mm5lfJACmEmP6x8M3MLbsiAQiVOULUpvGP7So5ylNyMjKj/I1ezqExUZlSrgkLKbG7z2IbTQRQ
	9jQWZqBOX5iLULmQQsKhQMD7anY+u+KbXFZK+fNe2LiyhAVgxoD2+cpMd3TsiIntECeSYxXyUc5wi
	4rPOZoq1FQ0LS10bIoAozKC6XifZLFvSo4Vc5mkyxYkMd/NeGiyvpxgzrn0e7fNY1yVYD2yLV9L1D
	qM+Aqczpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kehBu-0006CC-19; Mon, 16 Nov 2020 16:17:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehBr-0006Bh-Av
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 16:17:16 +0000
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CADC1223FB
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 16:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605543434;
 bh=q1HNWQlgqyDV4J+94bAX1fiF1L9E46ZR4cKIv+z263Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dj5aAyQ1f5t4ajIRx09p+pzqAm9V9n/zJv9vYOtdh3E4cupE5WneWybBM8nlkxjrc
 c08AIbC+ARdj5MO4GlOZ+dL7VvRZbBHsVZEU8oGdhSqVvdDXripbzytHPt9RM9OZXI
 BaaD21da+IYcNePJxoOZRNpEG3pf/cX8onFrGfo8=
Received: by mail-ed1-f41.google.com with SMTP id y4so13484668edy.5
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 08:17:13 -0800 (PST)
X-Gm-Message-State: AOAM530kEpQwzvv2D3YP5gFzKkAHvl3gEd9tQ/cEBmHPsI0sDyxC7Xri
 UEqiqD9xVB8FaUOf+YQAPfr0L9IQplLc0IT0Sw==
X-Google-Smtp-Source: ABdhPJyPsbGQNAIpJqwexuf+/mGJEj4xArjOBxDL5Q/Sy+XEJHFSX6d1dq3TrtTA8UHG1sae7pvgH7U8o4j6Ylx5HZ4=
X-Received: by 2002:aa7:d408:: with SMTP id z8mr16316296edq.166.1605543432331; 
 Mon, 16 Nov 2020 08:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-3-chunkuang.hu@kernel.org>
 <1604039049.31607.13.camel@mhfsdcap03>
 <CAAOTY_8Nf=Lh_JDojKY3oHdTigO=i+BHuvVA+9hYXCzgu-2Cfg@mail.gmail.com>
 <20201116072554.GH7499@vkoul-mobl>
In-Reply-To: <20201116072554.GH7499@vkoul-mobl>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Nov 2020 00:17:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8SyT87bSAmdrhwnEzRO_Yt0BQtDWnPrPahg4qTrUq1zQ@mail.gmail.com>
Message-ID: <CAAOTY_8SyT87bSAmdrhwnEzRO_Yt0BQtDWnPrPahg4qTrUq1zQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver into
 drivers/phy/mediatek folder
To: Vinod Koul <vkoul@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_111715_554369_A8D1CB7A 
X-CRM114-Status: GOOD (  20.39  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
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

SGksIFZpbm9kOgoKVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMeac
iDE25pelIOmAseS4gCDkuIvljYgzOjI15a+r6YGT77yaCj4KPiBPbiAwMi0xMS0yMCwgMDc6MDgs
IENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiArIFZpbm9kOgo+ID4KPiA+IEhpLCBDaHVuZmVuZzoK
PiA+Cj4gPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+IOaWvCAyMDIw
5bm0MTDmnIgzMOaXpSDpgLHkupQg5LiL5Y2IMjoyNOWvq+mBk++8mgo+ID4gPgo+ID4gPiBPbiBU
aHUsIDIwMjAtMTAtMjkgYXQgMjM6MjcgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiA+
ID4gbXRrX21pcGlfZHNpX3BoeSBpcyBjdXJyZW50bHkgcGxhY2VkIGluc2lkZSBtZWRpYXRlayBk
cm0gZHJpdmVyLCBidXQgaXQncwo+ID4gPiA+IG1vcmUgc3VpdGFibGUgdG8gcGxhY2UgYSBwaHkg
ZHJpdmVyIGludG8gcGh5IGRyaXZlciBmb2xkZXIsIHNvIG1vdmUKPiA+ID4gPiBtdGtfbWlwaV9k
c2lfcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLgo+ID4gPiA+Cj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA3IC0tLS0tLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgLS0tLS0tCj4gPiA+
ID4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCA3ICsrKysrKysKPiA+ID4gPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrKysKPiA+ID4gPiAgLi4uL21lZGlh
dGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTczLmN9ICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
PiA+ID4gPiAgLi4uL21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTgzLmN9ICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiAgLi4uL210a19taXBpX3R4LmMgPT4gcGh5L21lZGlh
dGVrL3BoeS1tdGstbWlwaS1kc2kuY30gICAgICB8IDIgKy0KPiA+ID4gPiAgLi4uL210a19taXBp
X3R4LmggPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2kuaH0gICAgICB8IDAKPiA+ID4g
PiAgOCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+
ID4gPiAgcmVuYW1lIGRyaXZlcnMve2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19taXBpX3R4
LmMgPT4gcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ktbXQ4MTczLmN9ICg5OSUpCj4gPiA+
ID4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19tdDgxODNfbWlwaV90eC5j
ID0+IHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLW10ODE4My5jfSAoOTklKQo+ID4gPiA+
ICByZW5hbWUgZHJpdmVycy97Z3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5jID0+IHBoeS9t
ZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmN9ICg5OSUpCj4gPiA+ID4gIHJlbmFtZSBkcml2ZXJz
L3tncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmggPT4gcGh5L21lZGlhdGVrL3BoeS1tdGst
bWlwaS1kc2kuaH0gKDEwMCUpCj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBDaHVuZmVuZyBZdW4g
PGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+Cj4gPgo+ID4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5
IHRoZSB3aG9sZSBzZXJpZXMgaW50byBteSB0cmVlLCB3b3VsZCB5b3UgcGxlYXNlCj4gPiBnaXZl
IGFuIGFja2VkLWJ5IHRhZyBvbiB0aGlzIHBhdGNoLCBzbyBJIGNvdWxkIGFwcGx5IHRoaXMgcGF0
Y2ggaW50bwo+ID4gbXkgdHJlZS4KPgo+IEkgd291bGQgcHJlZmVyIHRoaXMgdG8gZ28gdGhydSBw
aHkgdHJlZSwgdW5sZXNzIHRoZXJlIGFyZSBkZXBlbmRlbmNpZXMsCj4gd2hpY2ggSSBhbSBub3Qg
Y2xlYXIgbG9va2luZyBhdCBhYm92ZQo+CgpQbGVhc2UgYXBwbHkgdGhpcyBzZXJpZXMgdG8gcGh5
IHRyZWUsIGFuZCBJIHdvdWxkIGRyb3AgdGhpcyBzZXJpZXMKZnJvbSBteSB0cmVlLCB0aGFua3Mu
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiAtLQo+IH5WaW5vZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
