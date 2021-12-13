Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBAFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 23:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3b4uy2ryrNKG+9r9vwnxuMrC7Fo6gkQO1/Ha9eGSxc=; b=R1DmKr7tDhQIoC
	h/J+55uKnTyrAZWZn2HqP/4StIazGnn/bPifz/GQUH+SM4RLM83VZxvA6Skgaq7fK1cuQC2MzIUcd
	rmCb9LV0ZsjmcghwVB8lmCUJa27bLnwQbHlOO/ZXa7x2iiM4rApWn7CQUaHSj/Gc3x0HFPgu2s2fa
	3a7Gb+VkwjH6TJhROcCtW+hn+Px42w4oiavzmeVVOfJOHIJPGOvi1h2qFmwOkKcK6JMzVTJpcBPbw
	aXowglCc3sfPvUnzhzSj3BLoOM2XTC+eL21kDvKcJjRYa57fOnr8zdG6ZhJkpODkrqoP7cqAXuKig
	MwwNTl9InsrkYQ2mjL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwukg-00ByaN-36; Mon, 13 Dec 2021 23:29:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwujS-00ByIe-1H; Mon, 13 Dec 2021 23:27:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BCC2B81710;
 Mon, 13 Dec 2021 23:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DECBC34610;
 Mon, 13 Dec 2021 23:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639438062;
 bh=5C4sKIJkDWnzqKi1DVmCPmhnZw+GJklmGaruVVfz/Us=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DBDel3/b09B8MAqmRBftelzSWrRT0Fao0eN26+VIkmotRWYIz9khngk3zMQAFpFsV
 UYPQ34xdcNQ9gN+St3ISrhi1cqpiX3jmEdbr/bKqhB2WUv75keiYb6Bahe+8refa+b
 ok9Zb07gfwxi6+7FyO6MPnNttYlk2r+fAj/VE7nq5Z0M9uv/49R6Hg5iOhzHHJU9g4
 t1AORzAOdrDkXo1HjPiQiRaim0tBjxnTYBNvBZzVyX+eRiVLAuj4z8KQvaX26Tniec
 hmN53tFmQb/Wos2aIwoNYwbtPiLIBUCo6YbKWBXO2lpv7JSzNsU8QMfh7db7ykd81r
 OyJpLvOHBnyLg==
Received: by mail-ed1-f50.google.com with SMTP id z5so57949224edd.3;
 Mon, 13 Dec 2021 15:27:41 -0800 (PST)
X-Gm-Message-State: AOAM5308DmMxKxjjzxbFYV6AbMnHwflHPvniupebywPe/gjsZ2pCwR/A
 ahMt4Fie51Eb5D18CzN7uCcxCR16Dsl3/k+p8Q==
X-Google-Smtp-Source: ABdhPJwLnov5UNyZv+LEB38x0lFU1vvX2PYYVOPjAuD4tUbrtVO8ogqV6SxarYFeSUJAf2ZA8cFBGfsyhuXRPtjbOVk=
X-Received: by 2002:a17:906:9b82:: with SMTP id
 dd2mr1644254ejc.406.1639438060292; 
 Mon, 13 Dec 2021 15:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
 <20211213160742.744333-1-markyacoub@chromium.org>
In-Reply-To: <20211213160742.744333-1-markyacoub@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 14 Dec 2021 07:27:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
Message-ID: <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
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
X-CRM114-CacheID: sfid-20211213_152746_399738_7BEA7A8C 
X-CRM114-Status: GOOD (  17.01  )
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
5bm0MTLmnIgxNOaXpSDpgLHkuowg5LiK5Y2IMTI6MDjlr6vpgZPvvJoKPgo+IEF0IHRoZSByZXNl
dCBob29rLCBjYWxsIF9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQgd2hpY2ggaXMKPiBj
YWxsZWQgYXQgdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSBwbGFuZSBhbmQgc2V0cyB0aGUgZGVm
YXVsdCB2YWx1ZSBvZgo+IHJvdGF0aW9uIG9uIGFsbCBwbGFuZXMgdG8gRFJNX01PREVfUk9UQVRF
XzAgd2hpY2ggaXMgZXF1YWwgdG8gMS4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFd
LCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gVGVzdGVkIG9uIEphY3V6emkgKE1USykuCj4gUmVzb2x2
ZXMgSUdUQGttc19wcm9wZXJ0aWVzQHBsYW5lLXByb3BlcnRpZXMte2xlZ2FjeSxhdG9taWN9Cj4K
PiBTaWduZWQtb2ZmLWJ5OiBNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgfCAzICsrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMKPiBpbmRleCBlNmRjYjM0ZDMwNTIy
Li5hY2NkMjY0ODFiOWZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX3BsYW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9w
bGFuZS5jCj4gQEAgLTQ0LDkgKzQ0LDEwIEBAIHN0YXRpYyB2b2lkIG10a19wbGFuZV9yZXNldChz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKPiAgICAgICAgICAgICAgICAgc3RhdGUgPSBremFsbG9j
KHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsKPiAgICAgICAgICAgICAgICAgaWYgKCFzdGF0
ZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gLSAgICAgICAgICAgICAgIHBs
YW5lLT5zdGF0ZSA9ICZzdGF0ZS0+YmFzZTsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgX19kcm1f
YXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJnN0YXRlLT5iYXNlKTsKPiArCj4gICAg
ICAgICBzdGF0ZS0+YmFzZS5wbGFuZSA9IHBsYW5lOwo+ICAgICAgICAgc3RhdGUtPnBlbmRpbmcu
Zm9ybWF0ID0gRFJNX0ZPUk1BVF9SR0I1NjU7Cj4gIH0KPiAtLQo+IDIuMzQuMS4xNzMuZzc2YWE4
YmMyZDAtZ29vZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
