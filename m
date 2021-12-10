Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D648C4321E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haxVD68dEts7hzIEH03ggFrTQxi2nmwKQ/rihlklUTE=; b=Gm7cfvH1V8Jv9z
	Q9xg8qM+US98GcJgAnUk/t9Q6ECIq9dmz8fMRSH98RwuJs3hqk8Xl9qem4UUdeKOtjfJRfwvmWoKO
	BTSTyne0lhfxgDjUJ6fC/C2DJc1C2RAOOQDaruXzz6hU/x+KOp3UrypgDnkzJSJ4swnw2tbneQk3o
	cy1WHPx2/VRPeNYqd/nVfGxiA5A+gm6UoMRZl156CJlRRe/xSCVx0M+yZrw0jV6is+2OBlndw/bgw
	41JL+WpP3k2RHXxhCFnPTvdfBnydEDtUQLGsdHkygvgQo2gu/rFgYWgE6hIdtizZf6YvdDo3P9YRP
	axtlnmfRmUgze50JpX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvi4n-002UnR-0h; Fri, 10 Dec 2021 15:44:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvi4I-002UPz-3O; Fri, 10 Dec 2021 15:44:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46783B82899;
 Fri, 10 Dec 2021 15:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE31C341C6;
 Fri, 10 Dec 2021 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639151056;
 bh=U+1FevzHmy0ZqiqdIP2yUZ4w5TY9qcZ0u/4j+FLtE+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GhSaAGP2sxqzy7xVxl/46uNuDQrqLhGwawyIV8ldS0VQsAn6RLmfJjbRmyrpqH4Aq
 i4YVW0sznbgC7VW6WAbpMCk0NyHc3QX/OqwIWmqAbOKJcu2dMsRToY8zXDaDtJgAeb
 /xx6XbVA3TVSJr48y3G2y8Cf4BflDUSWlrP+wEyU7u7Lk/RJQuRDc06pVx5y5hGb4o
 blyexbqvFqrnik9SY7pYbJ+otfQb6MSnhMdzFjjcG4vcy+oNmeajduKlYgtC7+N+Rq
 l6228myrQ4YZqQDBSuxCFu4Ksm9beKJRxvd8QHtSsFlBtZDzPP46BKMGlm37GLqmAn
 idsgwbMepZsUg==
Received: by mail-ed1-f46.google.com with SMTP id e3so31899888edu.4;
 Fri, 10 Dec 2021 07:44:15 -0800 (PST)
X-Gm-Message-State: AOAM5331ciYBdaveJHU0DjSUuq0nLZM98gbHg+p9DzGIKnJLMTb5tMoL
 /uQvGgCkTT1EEDtmeWQhPFsRCQlcRqhtHNfHFw==
X-Google-Smtp-Source: ABdhPJwXCU+Z5NaN2BTHX/zMqkJH+ZZTVToTgcBEJQr6kwb8d7FIu3S+CacUJxCflUZLiBN1DbqE7KciG3vLx8r6e2w=
X-Received: by 2002:a17:906:7955:: with SMTP id
 l21mr25651980ejo.6.1639151054211; 
 Fri, 10 Dec 2021 07:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20211210061138.9943-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20211210061138.9943-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 10 Dec 2021 23:44:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-dO9hXaPCEhJymrCDYU-P-wOvS0YLYQ-gyYX1_morteg@mail.gmail.com>
Message-ID: <CAAOTY_-dO9hXaPCEhJymrCDYU-P-wOvS0YLYQ-gyYX1_morteg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: add control_by_sw for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, tzungbi@google.com, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_074418_324418_1636E1B7 
X-CRM114-Status: GOOD (  17.99  )
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
MjAyMeW5tDEy5pyIMTDml6Ug6YCx5LqUIOS4i+WNiDI6MTHlr6vpgZPvvJoKPgo+IFRvIG1ha2Ug
c3VyZSB0aGUgR0NFIHJlcXVlc3Qgc2lnbmFsIHRvIFNQTSBpcyBub3QgdHJpZ2dlciBieQo+IG90
aGVyIEhXIG1vZHVsZXMgYW5kIGNhdXNlIHN1c3BlbmQgcHJlbWF0dXJlIHdha2UuCj4KPiBTZXQg
MHg3ICh0aGUgYml0IDB+MiBhcyAxKSB0byBHQ0VfR0NUTF9WQUxVRSwgdG8gY29uZmlndXJlIHRo
ZQo+IHJlcXVlc3Qgc2lnbmFsIGNvbnRyb2wgYnkgU1cgYW5kIHJlbGVhc2UgdGhlIHJlcXVlc3Qg
dG8gU1BNLgoKSG93IGRvZXMgbXQ4MTczLCBtdDgxODMsIGFuZCBtdDY3NzkgcHJldmVudCB0aGlz
PyBPciB0aGVzZSBTb0NzIGNvdWxkCm5vdCBwcmV2ZW50IHRoaXM/CgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKPgo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlh
dGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyBiL2RyaXZlcnMv
bWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiBpbmRleCBhODg0NWIxNjJkYmYuLjM0MmI5MWYx
NmU2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4g
KysrIGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYwo+IEBAIC02NjQsNyArNjY0
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBnY2VfcGxhdCBnY2VfcGxhdF92NSA9IHsKPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBnY2VfcGxhdCBnY2VfcGxhdF92NiA9IHsKPiAgICAgICAgIC50aHJl
YWRfbnIgPSAyNCwKPiAgICAgICAgIC5zaGlmdCA9IDMsCj4gLSAgICAgICAuY29udHJvbF9ieV9z
dyA9IGZhbHNlLAo+ICsgICAgICAgLmNvbnRyb2xfYnlfc3cgPSB0cnVlLAo+ICAgICAgICAgLmdj
ZV9udW0gPSAyCj4gIH07Cj4KPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
