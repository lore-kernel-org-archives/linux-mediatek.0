Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 23:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4AA60F0F
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 23:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA4AA60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YK+Mh5nL1B3TY0uTNf7v0+WHbcaarVW7mJhEen9/93Y=; b=Dl7wQ4iDY7g7Li
	EvqTedZIEXt0MjLkrzb+yMMrJ465o0ItFtm029rYvA4BaghZaHp9F8x7Y7xWmyi75tFgpORTzDWjX
	dc8tCcwt3JDOWAPtcKvjmamteQGvK0BSA6Ug8Dma6918MFgYsZL1G4A1NqFUbgXbG8nJduvn1HOPK
	CmMMJjYTDg5WYNQbPhxgPruEu541MLT+Tf8HhIsx7tjvJLX0lzylH9u0RvdnLg5pCU4JUQCr7rN3z
	E0P3OyHCFq2qfDWXMz7C8TvuBoeVF4NrlVVDS4qKdPT3QdGaGi7v86jVW+pPtEiGTBvRnBPQg9u0o
	V+fAoWRXKGJPyC275Sgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfsNq-006UO9-BX; Wed, 27 Oct 2021 23:31:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfsNe-006UM4-3Z; Wed, 27 Oct 2021 23:30:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A94E2610EA;
 Wed, 27 Oct 2021 23:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635377448;
 bh=Tn75VzarQbc5QgLHek0RK4HW2XH2u4J1JDqisUkgpqY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UJekR0JZaL9yDHPomHOW1TXTbkxwC8wWAMo9qu2ELak/JzDOgggi4ow3k2KFciFjS
 JaXYwfLmT1zMZEAZ8uHScJtnHoTRG5ZxgKCwitOQpHftd6KDjD0tR9OrNWTZ0YS+yI
 OG3ZGmBj5YAjVYL3acF9GyXkwXsbTOmVi1dEDh5OsaqEKv5zXYLA3xyPjuCsuZ82s1
 0kD4uioaNCUNSZGhz5VllceNEBMKM3dlaLFJYygYoBYjhliGgCvpliwAkJ3QIDs2R7
 V/EeuwdSHMa2zIe89HRo+Zbc0UCLcN9MSpcPXevZXFrBoGdVGFSMGx9zD1PbSTqEmz
 5/cyuhbW2Xvuw==
Received: by mail-ed1-f52.google.com with SMTP id 5so16484995edw.7;
 Wed, 27 Oct 2021 16:30:48 -0700 (PDT)
X-Gm-Message-State: AOAM530shRSLYHsLyrBGFDm4/BgAO2qE6ETbxgEZAABNu1ZrF7rP7Psv
 g1qzS5HXJ3vzgdbNKNz6u4bvFHlD/LuAW2J5wA==
X-Google-Smtp-Source: ABdhPJzUHykGHts37AdltmTcOjjKPYdJdGgU/ReeYi6xz9u0NbxyDwQULshIj1Ado65mhw4sC4r/wUEqBnoJ9X7sBhw=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr1131395edu.357.1635377447059; 
 Wed, 27 Oct 2021 16:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
 <20211027021857.20816-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20211027021857.20816-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 28 Oct 2021 07:30:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_85V6HHaK4LT+jUyJ9-0dh4KgtLfS-ZBconLja0_S2wbg@mail.gmail.com>
Message-ID: <CAAOTY_85V6HHaK4LT+jUyJ9-0dh4KgtLfS-ZBconLja0_S2wbg@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] drm/mediatek: Add mbox_free_channel in
 mtk_drm_crtc_destroy
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_163050_212015_34EEAD0C 
X-CRM114-Status: GOOD (  12.49  )
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
MjAyMeW5tDEw5pyIMjfml6Ug6YCx5LiJIOS4iuWNiDEwOjE55a+r6YGT77yaCj4KPiBBZGQgbWJv
eF9mcmVlX2NoYW5uZWwgaW4gbXRrX2RybV9jcnRjX2Rlc3Ryb3kuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jCj4gaW5kZXggZmZhNTRiNDE2Y2E3Li4zMWYwNWVmYzFiYzAgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gQEAgLTE1Niw2ICsxNTYsMTAgQEAgc3Rh
dGljIHZvaWQgbXRrX2RybV9jcnRjX2Rlc3Ryb3koc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICAg
ICAgICAgbXRrX211dGV4X3B1dChtdGtfY3J0Yy0+bXV0ZXgpOwo+ICAjaWYgSVNfUkVBQ0hBQkxF
KENPTkZJR19NVEtfQ01EUSkKPiAgICAgICAgIG10a19kcm1fY21kcV9wa3RfZGVzdHJveSgmbXRr
X2NydGMtPmNtZHFfaGFuZGxlKTsKPiArCj4gKyAgICAgICBpZiAobXRrX2NydGMtPmNtZHFfY2xp
ZW50LmNoYW4pCj4gKyAgICAgICAgICAgICAgIG1ib3hfZnJlZV9jaGFubmVsKG10a19jcnRjLT5j
bWRxX2NsaWVudC5jaGFuKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRr
X2NydGMtPmNtZHFfY2xpZW50LmNoYW4gPSBOVUxMOwoKRXhjZXB0IHRoZSBpbmRlbnQsCgpSZXZp
ZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+ICAjZW5k
aWYKPiAgICAgICAgIGRybV9jcnRjX2NsZWFudXAoY3J0Yyk7Cj4gIH0KPiAtLQo+IDIuMTguMAo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
