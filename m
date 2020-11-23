Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE969C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:30:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8212120758
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:30:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sSHgDzoY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oz5Qll+2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8212120758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d+19f/7uENfhk1a+BjIR7K8s+O/OBWyMPuN/MVVgsIg=; b=sSHgDzoY8tpYNxM8dzfFbodNc
	ynOTxgWcsY3oCQWiw0JPCkkwhS5A9OtHGNhjsNnp/X7PSuySHV6hkXIZKR0AbSkOPcDekj0lu3WLk
	lQ7zYfj8K75swfdHe6nwuCs9IjbRT3RsnMdtLilW4N3/AC7uFp4xwUmfpGYCxsL8YmklO+/dV7o5n
	g09ABf7PfsgT7PdeKgcZ+Q/wyYMLHyZFLebRuRjVEb+Ojsn28RVD3SMZdFtPaou7C2q/sgUWFlWcV
	drZFg6I3Xo/xByqcAqhoBDyo4Kk+gRl+Hs1w1A0R2OqEPHhEdTF/0JV1r76x2CNDD1Gge/g7b44Pc
	uYvo+UmdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khCrf-0006qv-7J; Mon, 23 Nov 2020 14:30:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khCrY-0006nM-CF; Mon, 23 Nov 2020 14:30:41 +0000
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0968C2075A;
 Mon, 23 Nov 2020 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141839;
 bh=KLPAvAxVgBh/EfteBChKMiZqtTEU7DgUM7QQy95Ctjw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oz5Qll+2GGuPXYNZD0KEIT0+NXyIoujW0YGhpVvWA1FWHd+TCwDjW19QSXMQYNCjI
 xgIjgFoOSb92kD33i7Z5Z3JgOTRU+Wwqxdw7Gum4PfO7n0ZyVXRRRyfLoFDAkKiH/8
 XtPTs+pr8Zn0Locs8zgeHHPmJz6DNzDX4P0WucaU=
Received: by mail-ed1-f52.google.com with SMTP id t9so17287396edq.8;
 Mon, 23 Nov 2020 06:30:38 -0800 (PST)
X-Gm-Message-State: AOAM530bc9Z/F9iZS0/Hm8biZIYsGBl8Rq9hYXNB5PKyx2UWHXqzHPQq
 P4wDoOrD8Nez7nxPnvqYtWhr06rOASXfv4Mwgw==
X-Google-Smtp-Source: ABdhPJzQPN09/o15bRrKCutv+RWMNNb2GzylRxTOKOSHwYw5WeYSFcIdLyi0ge0oOxLKG1dWvGEHZCmCSdfuKLitYdk=
X-Received: by 2002:a50:f742:: with SMTP id j2mr39313857edn.72.1606141837508; 
 Mon, 23 Nov 2020 06:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-8-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-8-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:30:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY_90iwNUChw46qeetimRPtA16Ws573sXDo0XaKRgogKVUA@mail.gmail.com>
Message-ID: <CAAOTY_90iwNUChw46qeetimRPtA16Ws573sXDo0XaKRgogKVUA@mail.gmail.com>
Subject: Re: [PATCH 07/40] drm/mediatek/mtk_disp_rdma: Fix formatting and
 supply missing struct member description
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_093040_588290_BE7BF7D3 
X-CRM114-Status: GOOD (  19.02  )
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
nIgxM+aXpSDpgLHkupQg5LiL5Y2IOTo0OeWvq+mBk++8mgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX3JkbWEuYzo2Njogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnZGRwX2NvbXAnIG5vdCBkZXNjcmliZWQgaW4gJ210a19kaXNwX3JkbWEnCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmM6NjY6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2NydGMnIG5vdCBkZXNjcmliZWQgaW4gJ210a19kaXNwX3Jk
bWEnCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmM6NjY6IHdhcm5p
bmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RhdGEnIG5vdCBkZXNjcmliZWQgaW4g
J210a19kaXNwX3JkbWEnCj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFu
a3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMs
CkNodW4tS3VhbmcuCgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIHwgNSAr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gaW5kZXggZTA0MzE5
ZmVkZjQ2My4uZDQ2YjhhZTFkMDgwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX3JkbWEuYwo+IEBAIC01Niw4ICs1Niw5IEBAIHN0cnVjdCBtdGtfZGlzcF9yZG1hX2Rh
dGEgewo+Cj4gIC8qKgo+ICAgKiBzdHJ1Y3QgbXRrX2Rpc3BfcmRtYSAtIERJU1BfUkRNQSBkcml2
ZXIgc3RydWN0dXJlCj4gLSAqIEBkZHBfY29tcCAtIHN0cnVjdHVyZSBjb250YWluaW5nIHR5cGUg
ZW51bSBhbmQgaGFyZHdhcmUgcmVzb3VyY2VzCj4gLSAqIEBjcnRjIC0gYXNzb2NpYXRlZCBjcnRj
IHRvIHJlcG9ydCBpcnEgZXZlbnRzIHRvCj4gKyAqIEBkZHBfY29tcDogc3RydWN0dXJlIGNvbnRh
aW5pbmcgdHlwZSBlbnVtIGFuZCBoYXJkd2FyZSByZXNvdXJjZXMKPiArICogQGNydGM6IGFzc29j
aWF0ZWQgY3J0YyB0byByZXBvcnQgaXJxIGV2ZW50cyB0bwo+ICsgKiBAZGF0YTogbG9jYWwgZHJp
dmVyIGRhdGEKPiAgICovCj4gIHN0cnVjdCBtdGtfZGlzcF9yZG1hIHsKPiAgICAgICAgIHN0cnVj
dCBtdGtfZGRwX2NvbXAgICAgICAgICAgICAgZGRwX2NvbXA7Cj4gLS0KPiAyLjI1LjEKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
