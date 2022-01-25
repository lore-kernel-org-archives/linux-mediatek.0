Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5B3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oj2YVKQ/rjb0yNxngd9aG+tXlW84QZbPY6CBE6tIhKA=; b=CM1qoaszKGQxgb
	AwqWHUyYXKo+k4mDmORkWflQtI30f+h+xnA7qCrS842czThZmYBmkSm6uljXAznSK64vEZOz5073Z
	ok9krOe8wEpyHmqwMU2JwENQPzTTVEh4ORXjURcRdaQFgzV1J7lMdSjgXF4tCFJt922W5vDt8yibn
	4w68cfDcw607poYJWShtJbkCdShyyO8/Laje+nRStBQoy2myk/XF/s8opSCVl6lLWdY+AmCmTdMLM
	BUtumWUwGor/myY4Y3PyFC9ZLqPLa4dlcEMVWv/qknRL15YmPHipYbyvQvoRCmja0+60J39XxVz+Q
	iyMr2LLLQhj4XnqvvISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCOok-008hvY-Ns; Tue, 25 Jan 2022 16:37:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCOoX-008hs5-RK; Tue, 25 Jan 2022 16:37:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD50B61794;
 Tue, 25 Jan 2022 16:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96EBC340EF;
 Tue, 25 Jan 2022 16:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643128619;
 bh=MqT1/YM8yz57ScwjXyZoESAPskHYwhQ6QYACyXMLxHo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tgrOM9piNf3ZVnkvjP5cFinYTObeoiV1lbt7pCsy1mWxkyDqeERwF59pXSwyVVQSe
 e5qV9p/30gwx2BHMNN13NKsqrxExrX/y3yS21Wsm0ibLGAUvat6GtgTqQCiJ6JlXfJ
 mcKZAvrs/D8gJdYgEWejq5Jc2wEAN1MQpVwFgScrcLb+Lmidq2TcThnpbtKVEFR+Iz
 6+9LtoiuX69clqJLeoc3K3zqWm57veyHmosBxp+IRfYWYlUdeWsMjZo0zWuuGzWKmx
 kOtcM+7f1F3kwDFJyZU+yzPJvzTo8bkZv/zdE8q4yS+C3O20cKBZsFXam9V++XhqBj
 SZ2YEfXZTB1vA==
Received: by mail-ed1-f42.google.com with SMTP id z22so64156111edd.12;
 Tue, 25 Jan 2022 08:36:59 -0800 (PST)
X-Gm-Message-State: AOAM530Y207uHHvfm5NVNxOpjR2VHgFXYralIvIOjrL7zlLFDo+UC6Gq
 B5DDZK04j6jFxw2w+IbGc5jqhPrY+pNJQPZncg==
X-Google-Smtp-Source: ABdhPJxGM+g3Uu2HDqaNpJm+NgUad4fQE8NjbMLaTbNsb2LzJkuECmijFPehPNLukaqDLw10PRHtgG/M/Xr+zx1eZCg=
X-Received: by 2002:a05:6402:1003:: with SMTP id
 c3mr21574647edu.405.1643128618189; 
 Tue, 25 Jan 2022 08:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 Jan 2022 00:36:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY__59-tYZNAQqFytdZgAYs+hmFxHUrF1FAj4zphiguv12g@mail.gmail.com>
Message-ID: <CAAOTY__59-tYZNAQqFytdZgAYs+hmFxHUrF1FAj4zphiguv12g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: mediatek: mtk_drm_plane: Use kmalloc in
 mtk_plane_duplicate_state
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_083701_965924_9A11CE3E 
X-CRM114-Status: GOOD (  17.57  )
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

SGksIEFuZ2Vsb0dpb2FjY2hpbm86CgpBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxv
Z2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiDmlrwKMjAyMuW5tDHmnIgxOOaXpSDp
gLHkuowg5LiL5Y2IOTozOOWvq+mBk++8mgo+Cj4gVGhlcmUgaXMgbm8gbmVlZCB0byB6ZXJvIG91
dCB0aGUgbmV3bHkgYWxsb2NhdGVkIG1lbW9yeSBiZWNhdXNlIHdlIGFyZQo+IGR1cGxpY2F0aW5n
IGFsbCBtZW1iZXJzIG9mIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGU6IHN3aXRjaCB0byBrbWFsbG9j
Cj4gdG8gc2F2ZSBzb21lIG92ZXJoZWFkLgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNo
dW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jCj4gaW5kZXggYzc0Y2I5NGU0NDVlLi4z
OWNiOWE4MGQ5NzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5l
LmMKPiBAQCAtNTcsNyArNTcsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbXRr
X3BsYW5lX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQo+ICAgICAgICAg
c3RydWN0IG10a19wbGFuZV9zdGF0ZSAqb2xkX3N0YXRlID0gdG9fbXRrX3BsYW5lX3N0YXRlKHBs
YW5lLT5zdGF0ZSk7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpzdGF0ZTsKPgo+
IC0gICAgICAgc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsKPiAr
ICAgICAgIHN0YXRlID0ga21hbGxvYyhzaXplb2YoKnN0YXRlKSwgR0ZQX0tFUk5FTCk7Cj4gICAg
ICAgICBpZiAoIXN0YXRlKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPgo+IC0tCj4g
Mi4zMy4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
