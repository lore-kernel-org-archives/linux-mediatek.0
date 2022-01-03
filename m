Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD36C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sbKBoyHNjObyWKDYbwLveC3sKcyzKJjjoHaFsxbWnE=; b=vqUCZTzi4LiRms
	KCd7l68pTVMPMdR0uSJK0RVq7ln7E8ZjYcaFrCM5I7Q1s6QI2j+s1KNL1XsLNYojRKKU+TRXp0INC
	hsUeVhipLH9UTIZt48HvWtIhq6gG2sF4wE3V4/w7r7Jzit4YMclQXINSXsfhPEZ9PVN6eactFMvUf
	E97//c3VE30op++nZ0qL3W72oCUjIxNKLxn0rP2Xb7sfpvHWEsZ8+IJ1svHDN5qcRVUt9T6yWUqKV
	dix40TIbQbNYP26eErOaH09xmJAuAdG8KPY/4YIKf2jD6GKuERKGLm1cG/vp5ccmFMf8X/da3XkZZ
	JZmE27KhYuoZvS61rbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Mct-009393-Es; Mon, 03 Jan 2022 12:39:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Mch-00937C-DP; Mon, 03 Jan 2022 12:39:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72A18B80EA9;
 Mon,  3 Jan 2022 12:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DA9C36AED;
 Mon,  3 Jan 2022 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641213572;
 bh=HA5+7zlAQulQBX2cVKSU6TdiKadRflwBDFVjRsvDYVs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y0ULpnBT0g0UDp17/4EORGndRjm7el0EeYgKUeSEw83DwfhCNt1nMc1+vddEL5Ou7
 bPzt+l5Ubr4AcXtgbzR2BlVthJjHVIbjjiKVBipgSb/0/FHfUCBDf82E7v8kyjDZBE
 ZcAgfMZU7Rl9uu+KJt47Ia2y7TwZlhVvinjZFcNyEOGEzbHhuRs5I/GYS0bkHd2qGD
 QYC9v0gfS4sRqkaSPTb3u7JMcgYCecaocxSiV/Zz8/8hWZvtbp3CHPfXljS2yppNS9
 36MXQ0CNl6QApNUwd2jlQ/nf0pUHXluqKjC4asuvc/RdqAEofQgt5AEGU7t8AJdD6A
 D4KMOLZIpkoyw==
Received: by mail-ed1-f52.google.com with SMTP id n30so23328384eda.13;
 Mon, 03 Jan 2022 04:39:32 -0800 (PST)
X-Gm-Message-State: AOAM5330KNb9Fb6oxJoSkf6KKAIcftEGT6pVyumBLBs8h/0C0hVVBO/J
 eu+vNgIuq0NWMxRwKIvCbX4tvf6tU4IQnp5Scw==
X-Google-Smtp-Source: ABdhPJwwZ/3BPywQvW5Rrs1+664TaJh3FdH4vjHV6vG9LTySPj2+KPJh8eExMszOptrw3vU1ySFcU2qa6PxV5c3PjyU=
X-Received: by 2002:a17:907:629a:: with SMTP id
 nd26mr37424097ejc.680.1641213570556; 
 Mon, 03 Jan 2022 04:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211229184420.793234-1-markyacoub@chromium.org>
In-Reply-To: <20211229184420.793234-1-markyacoub@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Jan 2022 20:39:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9E71AfKy_poZMA7s++TvzM4=VH0H1o8ZBmDphcz9iXDw@mail.gmail.com>
Message-ID: <CAAOTY_9E71AfKy_poZMA7s++TvzM4=VH0H1o8ZBmDphcz9iXDw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Set default value for Panel Orientation
 connector prop.
To: Mark Yacoub <markyacoub@chromium.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Sean Paul <seanpaul@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, tzungbi@google.com, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_043935_776243_A9959D56 
X-CRM114-Status: GOOD (  19.78  )
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

SGksIE1hcms6CgpNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MTLmnIgzMOaXpSDpgLHlm5sg5LiK5Y2IMjo0NOWvq+mBk++8mgo+Cj4gW1doeV0KPiBDcmVh
dGluZyB0aGUgcHJvcCB1c2VzIFVOS05PV04gYXMgdGhlIGluaXRpYWwgdmFsdWUsIHdoaWNoIGlz
IG5vdCBhCj4gc3VwcG9ydGVkIHZhbHVlIGlmIHRoZSBwcm9wIGlzIHRvIGJlIHN1cHBvcnRlZC4K
Pgo+IFtIb3ddCj4gU2V0IHRoZSBwYW5lbCBvcmllbnRhdGlvbiBkZWZhdWx0IHZhbHVlIHRvIE5P
Uk1BTCByaWdodCBhZnRlciBjcmVhdGluZwo+IHRoZSBwcm9wIGlmIG5vIERTSSBwYW5lbCBleGlz
dHMuCj4gUGFuZWxzIGhhdmUgdGhlaXIgb3duIG9yaWVudGF0aW9ucywgYW5kIHBhbmVsIG9yaWVu
dGF0aW9uIGNhbid0IGJlCj4gb3ZlcnJpZGVuIG9uY2UgaW5pdGlhbGl6ZWQgdG8gYSB2YWx1ZS4K
Pgo+IHYxOgo+IFNldCBwYW5lbCBvcmllbnRhdGlvbiBvbmx5IGlmIERTSSBwYW5lbCBkb2VzIG5v
dCBleGlzdC4KPgo+IFRlc3RlZCBvbiBKYWN1enppKE1USykKPiBGaXhlcyBJR1RAa21zX3Byb3Bl
cnRpZXNAZ2V0X3Byb3BlcnRpZXMtc2FuaXR5LXthdG9taWMsbm9uLWF0b21pY30KPgo+IFNpZ25l
ZC1vZmYtYnk6IE1hcmsgWWFjb3ViIDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMK
PiBpbmRleCAwYWQ3MTU3NjYwYWZhLi45ZDMzZGQ5MzExOGUwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTEwNDAsNiArMTA0MCwxMyBAQCBzdGF0aWMgaW50IG10a19k
c2lfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtfZHNpICpk
c2kpCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXBfZW5jb2RlcjsKPiAgICAgICAg
IH0KPgo+ICsgICAgICAgLyogQSBkcm1fcGFuZWwgY2FuIGhhdmUgaXRzIG93biBvcmllbnRhdGlv
bi4gSWYgdGhlcmUgaXMgbm8gcGFuZWwsIHNldCB0aGUKPiArICAgICAgICAqIG9yaWVudGF0aW9u
IHRvIE5PUk1BTC4gKi8KPiArICAgICAgIGlmICghZHNpLT5wYW5lbCkgewoKUGxlYXNlIHNlbmQg
cGF0Y2ggYmFzZWQgb24gbGF0ZXN0IGtlcm5lbCB2ZXJzaW9uLiBJbiBsYXRlc3Qga2VybmVsCnZl
cnNpb24sIHN0cnVjdCBtdGtfZHNpe30gaGFzIG5vIG1lbWJlciAncGFuZWwnLgoKUmVnYXJkcywK
Q2h1bi1LdWFuZy4KCj4gKyAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3Jfc2V0X3BhbmVsX29y
aWVudGF0aW9uKAo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRzaS0+Y29ubmVjdG9yLCBEUk1f
TU9ERV9QQU5FTF9PUklFTlRBVElPTl9OT1JNQUwpOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAg
IGRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoZHNpLT5jb25uZWN0b3IsICZkc2ktPmVuY29k
ZXIpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDIuMzQuMS40NDguZ2EyYjJiZmRmMzEt
Z29vZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
