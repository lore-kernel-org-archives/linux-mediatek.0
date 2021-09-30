Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A0BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 13:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6DF61507
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 13:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF6DF61507
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYyFrbNXcVuH24q2vw6sCL6rNOCqC4ZxzgkSqfrhGXo=; b=e1nTqXzW7cab7y
	GiDXlhrLeN73rBjaSXrx1ouONNXPSFEtz2I0RjXJMx4PXlrmgaubi8be6uIVwd44oZJeGrMv31Vdb
	JYyM0q7sfDHzGAZLMGxKi25EvlRLD6oUorjsYpgrJVa1L54uh7ibrTH8bUcP0Cxq3m8oX/BRRASGQ
	U5WljGC0R0nxoR4KI084CVUpwgDZ1PoXKdUX8JqsBT45wKgwsM0eW1VZu/Wgqysv/N4JMEVgaZ/Bk
	PBiDthkb4M3aBhMRH/2HbCHw774B+rRb7j2imAsSOC6Xw528czue2239ztkT6mOrt64u5133B6mIl
	xd1UAb97B+YIE/K8hNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVvwm-00EPig-7P; Thu, 30 Sep 2021 13:18:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVvrD-00ENyB-DZ; Thu, 30 Sep 2021 13:12:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F27A961528;
 Thu, 30 Sep 2021 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633007535;
 bh=tmn4BbXKbxNZ0EBee9Cj9y0DfwstE28MZfJScaAzQBA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DOz6l0JPvlnGCx7pxlN5fyg2rBnOza4mMZ7wnNOLToA8VBDrSQGV98gty+VnvyCpP
 fWz/Ak8Tti/m/DnySmUqobkj2xAtFPmelwvfIEy0MSwe85lNuG73RpImLZop8PRBse
 BgbetPqy4D6EU33reOBSbKGccsuXe/p6RfTLQPjj0jfyNC3O94N0B7WK+dOLW7VOuX
 Db1PkWtVPYdRjFQHSXhrPJ4+LRW3TUmFHODgXj6VqJmCW8yuNye+4a3CpOx4Q44rww
 Td9Gs1X61Deia5H2PPPYg0hz+3dC4f1EKg7bF/4dTw/0czSpZGbxp/INOco0vT8E5I
 w28LKAifcoyuA==
Received: by mail-ed1-f50.google.com with SMTP id l8so22271894edw.2;
 Thu, 30 Sep 2021 06:12:14 -0700 (PDT)
X-Gm-Message-State: AOAM532eM9rKeQd3KAyd3XbqgYXmILLEQpmUNLfVkgb7wYUiN6BAy5Yv
 61CwQeBlikPvifILdnvx7Bg0zhNpvkdCGuS8UA==
X-Google-Smtp-Source: ABdhPJzTgzKXplVDdgs4A4kIx4YRhy9CpZE0oMSC8hlIlknZBKVudawCQ4nfm82XLN5T4dpicwf+1KmANU1PzkR7hB8=
X-Received: by 2002:a17:906:3181:: with SMTP id
 1mr6983672ejy.388.1633007533447; 
 Thu, 30 Sep 2021 06:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
 <20210930024704.6966-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210930024704.6966-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 30 Sep 2021 21:12:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__51QPovSD2_DyBFPPMED1H0hGqxHQSdFWkL7nCngkX8g@mail.gmail.com>
Message-ID: <CAAOTY__51QPovSD2_DyBFPPMED1H0hGqxHQSdFWkL7nCngkX8g@mail.gmail.com>
Subject: Re: [v2 PATCH 3/3] drm/mediatek: Fix cursor plane is not config when
 primary is updating
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_061215_514507_3AB14C1C 
X-CRM114-Status: GOOD (  15.92  )
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
MjAyMeW5tDnmnIgzMOaXpSDpgLHlm5sg5LiK5Y2IMTA6NDflr6vpgZPvvJoKPgo+IElmIGN1cnNv
ciBwbGFuZSBoYXMgdXBkYXRlZCBidXQgcHJpbWFyeSBwbGFuZSBjb25maWcgdGFzayBpcyBub3QK
PiBmaW5pc2hlZCwgbXRrX2RybV9jcnRjX3VwZGF0ZV9jb25maWcgd2lsbCBjYWxsIG1ib3hfZmx1
c2goKSB0byBjbGVhcgo+IGFsbCB0YXNrIGluIGN1cnJlbnQgR0NFIHRocmVhZCBhbmQgbGV0IGN1
cnNvciBwbGFuZSByZS1zZW5kIGEgbmV3Cj4gR0NFIHRhc2sgd2l0aCBjdXJzb3IgKyBwcmltYXJ5
IHBsYW5lIGNvbmZpZyB0byByZXBsYWNlIHRoZSB1bmZpbmlzaGVkCj4gR0NFIHRhc2suCj4KPiBT
byB0aGUgcGxhbmUgY29uZmlnIGZsYWcgc2hvdWxkIG5vdCBiZSBjbGVhcmVkIHdoZW4gbWFpbGJv
eCBjYWxsYmFjawo+IHdpdGggYSBlcnJvciBzdGF0dXMuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gRml4ZXM6IDllZmIxNmMyZmRkNiAo
ImRybS9tZWRpYXRlazogQ2xlYXIgcGVuZGluZyBmbGFnIHdoZW4gY21kcSBwYWNrZXQgaXMgZG9u
ZSIpCj4gU2lnbmVkLW9mZi1ieTogamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAz
ICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gaW5kZXggMjc0ZTVjNjc1MDdkLi5iOTZkYmM4Njc4
OTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gQEAgLTI4
MSw2ICsyODEsOSBAQCBzdGF0aWMgdm9pZCBkZHBfY21kcV9jYihzdHJ1Y3QgbWJveF9jbGllbnQg
KmNsLCB2b2lkICptc3NnKQo+ICAgICAgICAgc3RydWN0IG10a19jcnRjX3N0YXRlICpzdGF0ZTsK
PiAgICAgICAgIHVuc2lnbmVkIGludCBpOwo+Cj4gKyAgICAgICBpZiAoZGF0YS0+c3RhIDwgMCkK
PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAgICAgIHN0YXRlID0gdG9fbXRrX2Ny
dGNfc3RhdGUobXRrX2NydGMtPmJhc2Uuc3RhdGUpOwo+Cj4gICAgICAgICBzdGF0ZS0+cGVuZGlu
Z19jb25maWcgPSBmYWxzZTsKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
