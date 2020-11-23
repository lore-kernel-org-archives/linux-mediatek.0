Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9D1C56202
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:31:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 669A520781
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TGMHIu3m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="D01SUDy+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 669A520781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1kPV7/tyQSGZb4ZfO5jgZKA0vZF7nxdP/IMUVrPCk1c=; b=TGMHIu3maKq4Ph2vKf5DmNj0y
	9XQ+P1uj5ghunWSjBpxnhjABD4iS9O9tRmPMhhtu0pc2geoc7PpMzWZGdjmie56jLrkNvVQhogdDm
	+nLTeOjI6vYWA+Ya1EUna2QNwgQY6Z9PTFheUsDBxof+ZEd9+iX1ttMfMuuoZtlwA0eWY/5zQa5go
	SD1rpajlJGFyic3EAo0MvU7Cc8ZLZROuaH+RAJCHwGb9f7THij8hqPjs1W4wnS5xn68rR4NUiVDwE
	kL3ltwjnWYBYSHScUWw9/8aAClbFZ6X4C/SryYGKX44N56JWkRtVdMO2w9cIeHuDOz8ic6NtaXhGh
	pkjJGulmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khCsN-00073e-Bu; Mon, 23 Nov 2020 14:31:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khCs5-0006x3-3y; Mon, 23 Nov 2020 14:31:15 +0000
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B48A620781;
 Mon, 23 Nov 2020 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141872;
 bh=vuZ+rah2hE0LNJaScoerOKwY3fCT0EUtYP8hbvGF1o8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D01SUDy+AOXdGks3r6EavahhLVcEAH4UbH/COnWtfnARQswwUTjGU0Da4LEgSMvZH
 5oEB+rRWqD+Zcj/oNJBNUMdgBA6MjM9JHYG/XC35GJLcUaxFbJmRHe11UtVWoZS7F0
 NUCXLLEtcUvv8IS5a0O0Huvy08wnb3nk5Oy66jr4=
Received: by mail-ed1-f41.google.com with SMTP id cf17so13735599edb.2;
 Mon, 23 Nov 2020 06:31:11 -0800 (PST)
X-Gm-Message-State: AOAM533nj6LvYRKB8SpSQ05kpoQ4WXLT2I27qXCnVXdQbePOwA33J+fU
 gfWn+t7AOQhRVdJUFWYRZE4x1YYmGVCtPSa0NQ==
X-Google-Smtp-Source: ABdhPJwOmjtyvLkvrDJkqOOjZKJiyogKz1KZcoxRJRbT0kCAwbM+Un1KY6jBLjQqvchQiCiAbumdEjhrGCQBqzMb6+E=
X-Received: by 2002:a50:f1d2:: with SMTP id y18mr13457355edl.166.1606141870269; 
 Mon, 23 Nov 2020 06:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-11-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-11-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:30:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__N5E6TApkVomnvWpcsLAq4tpxZffpq+wxH6_q_0uNZ7g@mail.gmail.com>
Message-ID: <CAAOTY__N5E6TApkVomnvWpcsLAq4tpxZffpq+wxH6_q_0uNZ7g@mail.gmail.com>
Subject: Re: [PATCH 10/40] drm/mediatek/mtk_drm_drv: Staticise local function
 invoked by reference
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_093113_369501_6F1ADEF0 
X-CRM114-Status: GOOD (  19.73  )
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIExlZToKCkxlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0MTHm
nIgxM+aXpSDpgLHkupQg5LiL5Y2IOTo0OeWvq+mBk++8mgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmM6MzE2OjI0OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yIOKAmG10a19kcm1fZ2VtX3ByaW1lX2ltcG9ydOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xp
bnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBDYzogUGhpbGlw
cCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6
IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gQ2M6IFN1bWl0IFNl
bXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBZVCBTSEVOIDx5dC5zaGVuQG1lZGlhdGVr
LmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGlu
YXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4g
aW5kZXggMmU4MDY1YjFlMmJiYy4uNDAxMzExNDUzZTdkMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTMxMyw4ICszMTMsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGZpbGVfb3BlcmF0aW9ucyBtdGtfZHJtX2ZvcHMgPSB7Cj4gICAqIFdlIG5lZWQgdG8g
b3ZlcnJpZGUgdGhpcyBiZWNhdXNlIHRoZSBkZXZpY2UgdXNlZCB0byBpbXBvcnQgdGhlIG1lbW9y
eSBpcwo+ICAgKiBub3QgZGV2LT5kZXYsIGFzIGRybV9nZW1fcHJpbWVfaW1wb3J0KCkgZXhwZWN0
cy4KPiAgICovCj4gLXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqbXRrX2RybV9nZW1fcHJpbWVfaW1w
b3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRtYV9idWYgKmRtYV9idWYpCj4gK3N0YXRpYyBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm10a19kcm1fZ2VtX3ByaW1lX2ltcG9ydChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikKPiAgewo+ICAgICAgICAgc3Ry
dWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IGRldi0+ZGV2X3ByaXZhdGU7Cj4KPiAtLQo+
IDIuMjUuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
