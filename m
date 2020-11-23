Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D722C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:30:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC9420758
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDz1+v/q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbbz43XK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC9420758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8+pYWYqCaEL02uUMKn/FFDtSitG8ZfWvrKNLCWZ9kjI=; b=KDz1+v/qfvdOOyvbt+IqZxSxk
	jb98qFKoi2QDku2speCg3h+Q8n5PS7sEs+5yFhe1zzrFgsdsR7X2ehwwyLmoIEHRX13ScvSaBzyF0
	B6ddL/dzV+VkuyHHSULHeWd60FYUmyd6lBmLFbyo0DO0cbhMP3lsEtAHA8ehii7ezzESB9ff9Ua4A
	ABJosl+leCl2fHL08mrKC51exL3ra92uzVb6i9ZgVxJGmLp53CIViErbnLar53c1LHs9HCctFh+3f
	FCaOjLUuvAXAro3GiLMr525EYDLA2e+OjaXIyYHBgSLFyI23+LfI+cLNukDous6HAG1aQBXEww2sf
	Lg59pEs5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khCqz-0006fe-6Y; Mon, 23 Nov 2020 14:30:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khCqu-0006db-6v; Mon, 23 Nov 2020 14:30:01 +0000
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C872120758;
 Mon, 23 Nov 2020 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141799;
 bh=0PG9sY/7kjLC2BEUJJD7uXQqxRjzgGOvNgsyi7FCsBU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hbbz43XKlcQvVplsZFIcT5hsKkYI9fWwgORdTxxV+osw6Lxxzw5u+ktlCJ8wjrK2/
 Z5zSxlmHaMmWfbqFe+HZSIXBuGT6FUYg6EYpEmx2ut11nzTVKI1ETPw6z/uCleGzLo
 zyZk80qz1TpskOwQ8hsOulxq6GA8K//3cFqNdlWw=
Received: by mail-ed1-f41.google.com with SMTP id k1so4357614eds.13;
 Mon, 23 Nov 2020 06:29:58 -0800 (PST)
X-Gm-Message-State: AOAM531ZBesM6W1YsYI6qTtyeOXuyud8Xw8/9LTr7MZ7pVps2X065Dvp
 jVf/5A+jrOCDPECCaCewHZPjZfEveqrz74kJHQ==
X-Google-Smtp-Source: ABdhPJwHSc8rFuh9ehjBm9YKuZooHOGW+0h0xXZqHkKhXMPDEqgmgVdpEM6Eg0UZfQjSb1pTx0AQWx+IJMvN12Wrf+Q=
X-Received: by 2002:a50:f1d2:: with SMTP id y18mr13451389edl.166.1606141797356; 
 Mon, 23 Nov 2020 06:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-31-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-31-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:29:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-hTb_yur9QVynKggdY69-E2vJ2-qj3i7+LPzsBJkdy1g@mail.gmail.com>
Message-ID: <CAAOTY_-hTb_yur9QVynKggdY69-E2vJ2-qj3i7+LPzsBJkdy1g@mail.gmail.com>
Subject: Re: [PATCH 30/30] drm/mediatek/mtk_disp_ovl: Fix formatting and
 provide missing member description
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_093000_455653_79783E3F 
X-CRM114-Status: GOOD (  18.56  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIExlZToKCkxlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0MTHm
nIgxM+aXpSDpgLHkupQg5LiK5Y2IMzowMeWvq+mBk++8mgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jOjc1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdkZHBfY29tcCcgbm90IGRlc2NyaWJlZCBpbiAnbXRrX2Rpc3Bfb3ZsJwo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmM6NzU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2NydGMnIG5vdCBkZXNjcmliZWQgaW4gJ210a19kaXNwX292bCcK
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jOjc1OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkYXRhJyBub3QgZGVzY3JpYmVkIGluICdtdGtf
ZGlzcF9vdmwnCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFu
Zy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKPgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBD
YzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA1ICsrKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gaW5kZXggMjg2NTFiYzU3OWJjOS4u
NzRlZjZmYzA1MjhiNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMKPiBAQCAtNjUsOCArNjUsOSBAQCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgewo+Cj4gIC8q
Kgo+ICAgKiBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsIC0gRElTUF9PVkwgZHJpdmVyIHN0cnVjdHVyZQo+
IC0gKiBAZGRwX2NvbXAgLSBzdHJ1Y3R1cmUgY29udGFpbmluZyB0eXBlIGVudW0gYW5kIGhhcmR3
YXJlIHJlc291cmNlcwo+IC0gKiBAY3J0YyAtIGFzc29jaWF0ZWQgY3J0YyB0byByZXBvcnQgdmJs
YW5rIGV2ZW50cyB0bwo+ICsgKiBAZGRwX2NvbXA6IHN0cnVjdHVyZSBjb250YWluaW5nIHR5cGUg
ZW51bSBhbmQgaGFyZHdhcmUgcmVzb3VyY2VzCj4gKyAqIEBjcnRjOiBhc3NvY2lhdGVkIGNydGMg
dG8gcmVwb3J0IHZibGFuayBldmVudHMgdG8KPiArICogQGRhdGE6IHBsYXRmb3JtIGRhdGEKPiAg
ICovCj4gIHN0cnVjdCBtdGtfZGlzcF9vdmwgewo+ICAgICAgICAgc3RydWN0IG10a19kZHBfY29t
cCAgICAgICAgICAgICBkZHBfY29tcDsKPiAtLQo+IDIuMjUuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
