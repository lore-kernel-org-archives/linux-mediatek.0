Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32401C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 00:02:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77016113D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 00:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E77016113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3o6lGxK3lSMUbBMfwqSsjEBexsItcjLIi+1Hx4vkdQ=; b=bJ169WQ5T2v/tR
	g9mtkUiS4uKXnCkumNODpZwRr+5oE8zgDyroOsvuau/96STYIrOX9ChbQfKpewltoxGMNLB4/rhun
	V5jCOlDNN/MIpFC5v1GfskGstxmBCpbEYDzACwLaJL8DP520UuQME9ggGMey8LRnYCXygoRNf09RH
	62ymwcZjVMVBUuRJyJZSHt93Akdk6LAvYTBpQZWgZ8sc4CxpFMehTCr4/b8yKHpLlrbIQXBLZW8eP
	5zNEzPxkdcPvouLYcXtS8N2CWjhjAuioz2U8U6/BzJBrx9K1gA9yGjDmQo5y3US+V4mZkARBYwp3+
	EonghJ5oqTVMtoGBX2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnrM5-0094EP-QA; Fri, 19 Nov 2021 00:02:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnrLs-0094C8-FR; Fri, 19 Nov 2021 00:02:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E7866113D;
 Fri, 19 Nov 2021 00:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637280119;
 bh=AoNZd47gCGaimK9v5NfigphGWhTSDsXfAmbFC4BIlz4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Lmq7eHFQfyyikTZkqVB4YTGA+sw+e7PKhSPSxzUx9AAn0X6/GyE6UcqLyYm4BmD24
 +xCYcoK+WvTm0LWxHMNIPZ4ALkoGI1YTyzsZCONyYdXjiDe+KS6/H0ELH+UMwSMOam
 BGN627Tvg879jCfHGN8vVIQNeBjxpb7TqfiZMVqHvPbF2zeq/NUEmTCQUdSizO7CXc
 1KecLoH2ubW8vlFF3DB+0dPkwjiveEp1kL/Y2zihwpysKNT1dhoXlcDdrytZIDgPz2
 Gh4Peu3R30ixCYiGCfTB5d+bxidTRRWTsgLXKa6R67N0INmd8oUpRng7z1QzvwLmzU
 cOgsFYbpdvifg==
Received: by mail-ed1-f52.google.com with SMTP id e3so34696006edu.4;
 Thu, 18 Nov 2021 16:01:59 -0800 (PST)
X-Gm-Message-State: AOAM532N8xL5yopkgd2HexfKUuXo/pcy/8BqtTSuEEWPha7FfvuKgNcg
 DHTD8mzPkQCFDVmVNmrEPeGzGqJUFDnoO6BDbw==
X-Google-Smtp-Source: ABdhPJzJ+m25jkKAHUC8dqOXn/CxWb6mvvVoe7NwAcoZoKeWFquNa7VfncVxf9FsAbU+dFfNaujeGSmcwQHUHnIoiD0=
X-Received: by 2002:a50:e608:: with SMTP id y8mr16990077edm.39.1637280117833; 
 Thu, 18 Nov 2021 16:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20211117064158.27451-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 19 Nov 2021 08:01:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Ws7BmYr-87rb=MWYyGwSCCvv0AoPV10J7d+7TU+7OCA@mail.gmail.com>
Message-ID: <CAAOTY_-Ws7BmYr-87rb=MWYyGwSCCvv0AoPV10J7d+7TU+7OCA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mailbox: add cmdq_mbox_flush to clear all task before
 suspend
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fei Shao <fshao@chromium.org>, tzungbi@google.com,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_160200_599753_634DDF28 
X-CRM114-Status: GOOD (  22.40  )
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
MjAyMeW5tDEx5pyIMTfml6Ug6YCx5LiJIOS4i+WNiDI6NDLlr6vpgZPvvJoKPgo+IENNRFEgZHJp
dmVyIHdpbGwgb2NjdXB5IEdDRSBjbG9jayB0byBleGVjdXRlIHRoZSB0YXNrIGluIEdDRSB0aHJl
YWQuCj4KPiBTbyBjYWxsIGNtZHFfbWJveF9mbHVzaCB0byBjbGVhciBhbGwgdGFzayBpbiBHQ0Ug
dGhyZWFkIGJlZm9yZQo+IENNRFEgc3VzcGVuZC4KPgo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpo
LmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tYWlsYm94
L210ay1jbWRxLW1haWxib3guYyB8IDkgKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWls
Ym94L210ay1jbWRxLW1haWxib3guYyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94
LmMKPiBpbmRleCAwM2Y5ZWQ0YzUxMzEuLjI4Y2FkZmMwMDkxYiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gKysrIGIvZHJpdmVycy9tYWlsYm94L210
ay1jbWRxLW1haWxib3guYwo+IEBAIC00ODQsMjEgKzQ4NCwxOCBAQCBzdGF0aWMgaW50IGNtZHFf
c3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICAgICAgICBzdHJ1Y3QgY21kcSAqY21kcSA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICAgICAgICAgc3RydWN0IGNtZHFfdGhyZWFkICp0aHJl
YWQ7Cj4gICAgICAgICBpbnQgaTsKPiAtICAgICAgIGJvb2wgdGFza19ydW5uaW5nID0gZmFsc2U7
Cj4KPiAgICAgICAgIGNtZHEtPnN1c3BlbmRlZCA9IHRydWU7Cj4KPiAgICAgICAgIGZvciAoaSA9
IDA7IGkgPCBjbWRxLT50aHJlYWRfbnI7IGkrKykgewo+ICAgICAgICAgICAgICAgICB0aHJlYWQg
PSAmY21kcS0+dGhyZWFkW2ldOwo+ICAgICAgICAgICAgICAgICBpZiAoIWxpc3RfZW1wdHkoJnRo
cmVhZC0+dGFza19idXN5X2xpc3QpKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgdGFza19y
dW5uaW5nID0gdHJ1ZTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAvKiB0cnkgdG8gY2xlYXIgYWxsIHRhc2sgaW4gdGhpcyB0aHJlYWQg
Ki8KPiArICAgICAgICAgICAgICAgICAgICAgICBjbWRxX21ib3hfZmx1c2godGhyZWFkLT5jaGFu
LCAyMDAwKTsKCkkgd291bGQgbGlrZSB0aGUgbm9ybWFsIGNvbnRyb2wgZmxvdyByYXRoZXIgdGhh
biBlcnJvciBoYW5kbGluZy4gU28KdGhlIG5vcm1hbCBjb250cm9sIGZsb3cgaXM6CgoxLiBDbGll
bnQgZHJpdmVyIHN1c3BlbmQ6IEZsdXNoIGNvbW1hbmQuCjIuIENNRFEgZHJpdmVyIHN1c3BlbmQ6
IFRoZXJlIGlzIG5vIGNvbW1hbmQgdG8gZmx1c2guIElmIHRoZXJlIGFyZQpjb21tYW5kLCBzaG93
IGVycm9yIG1lc3NhZ2UgYW5kIGRlYnVnIHRoZSBjbGllbnQgZHJpdmVyLgoKVGhlIGVycm9yIGhh
bmRsaW5nIGZsb3c6CgoxLiBDbGllbnQgZHJpdmVyIHN1c3BlbmQ6IERvZXMgbm90IGZsdXNoIGNv
bW1hbmQuCjIuIENNRFEgZHJpdmVyIHN1c3BlbmQ6IEZsdXNoIGNvbW1hbmQgYW5kIGNhbGxiYWNr
IHRvIGNsaWVudCBkcml2ZXIuCkNsaWVudCBkcml2ZXIgcHJvY2VzcyB0aGVzZSBjYWxsYmFjayBh
cyBlcnJvciBoYW5kbGluZy4KClRoZSBjbGllbnQgZHJpdmVyIG1heSBpbnRlZ3JhdGUgbXVsdGlw
bGUgZHJpdmVyLiBJbiB0aGUgc3VzcGVuZCBmbG93LAppdCBtYXkgbmVlZCB0byBzdG9wIHRoZXNl
IGRyaXZlciBpbiBhIHNlcXVlbmNlIHN1Y2ggYXMuCgoxLiBTdG9wIGRyaXZlciAxCjIuIFN0b3Ag
ZHJpdmVyIDIKMy4gU3RvcCBkcml2ZXIgMyAoY21kcSkKNC4gU3RvcCBkcml2ZXIgNAo1LiBTdG9w
IGRyaXZlciA1LgoKSW4gdGhlIG5vcm1hbCBmbG93LCBjbGllbnQgZHJpdmVyIGNvdWxkIGNvbnRy
b2wgdGhlIHN0b3AgZmxvdy4gSW4gdGhlCmVycm9yIGhhbmRsaW5nIGZsb3csIGl0IGRvZXMgbm90
IG1hdGNoIHRoZSBzdG9wIGZsb3cuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArICAgICAgICAg
ICAgICAgICAgICAgICBkZXZfd2FybihkZXYsICJ0aHJlYWRbJWRdIGV4aXN0IHJ1bm5pbmcgdGFz
ayhzKSBpbiBzdXNwZW5kXG4iLCBpKTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+
Cj4gLSAgICAgICBpZiAodGFza19ydW5uaW5nKQo+IC0gICAgICAgICAgICAgICBkZXZfd2Fybihk
ZXYsICJleGlzdCBydW5uaW5nIHRhc2socykgaW4gc3VzcGVuZFxuIik7Cj4gLQo+ICAgICAgICAg
Y2xrX2J1bGtfdW5wcmVwYXJlKGNtZHEtPmdjZV9udW0sIGNtZHEtPmNsb2Nrcyk7Cj4KPiAgICAg
ICAgIHJldHVybiAwOwo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
