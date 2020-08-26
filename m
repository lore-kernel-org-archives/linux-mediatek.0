Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B191C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 23:04:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDD220678
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 23:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCK/BTw9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUn7URfh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDD220678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=akkIpeXVnJIAJFG0Jp8daMWd8hSzVg+zw21FjTcnkCA=; b=qCK/BTw9zLgXPy+fgpKyiS3RF
	fAaDnXTqrU+EIIbKJVim53OPnPYDBukjUQhyuTPfGMCvEeJHBZrWbGTz3E7HOvhdKqjVBBHooOux1
	rBqKdtkJT9iZ7gTelehaBoKafAbVr/O+igZnnRO8zVr1pUi2OyaWyHlPn7ONlg1QrB6qHW5wNXcmN
	hwyIW0MdVJC7WGNgLfZERJ5DOGinrdeUgVC4I7IB2tEmHUy1KkC1Tbj+fiQEwik3MRRxWekVHnXh3
	eWdobKsmTdxX+WeqDS1A13pooLBd2eLYdNEGMyCpQDA3jV/KGczNS4o3R+KIXuDdKv+RQE1QdqlSB
	lNu+EnkXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB4Sa-00019j-ON; Wed, 26 Aug 2020 23:04:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB4SW-00018G-8z; Wed, 26 Aug 2020 23:04:01 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E88120B1F;
 Wed, 26 Aug 2020 23:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598483039;
 bh=XwRld9s4bWwSDqk7OpTV0iyuBoFpuxzcSD+6/QSrZvM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MUn7URfhQyTV1VF8JhUC/cDazTURdvZBO9Rga7T98BYIbyOtKnJgA5z4kQss/r4TM
 lzyTXT+Y2Y6WObbuB3pcozz7BXDy7XYQuSpF4AkYuPD3IlBXTOya5ID869/CuP62yP
 Wl3TyDBUf2i9y5GOsPyy3m+B+WIsIrbIZcBxOZaE=
Received: by mail-ej1-f43.google.com with SMTP id d11so5042576ejt.13;
 Wed, 26 Aug 2020 16:03:59 -0700 (PDT)
X-Gm-Message-State: AOAM532K1zPfSQ6gP8wbTe90r3IxLgY+kt1+tNhz601CD7NCcF065Mc/
 Yg3K5A2UQHFAoXgirbpCprlebHDt/L00IiwOIw==
X-Google-Smtp-Source: ABdhPJyg/7oRktjfShagR7wzytYd2W8ziwXzaMzApSrhbBtU/OM2q8Cna8GCDosKqDdIi9fWnzLjClLR0M24ndzIs6Q=
X-Received: by 2002:a17:906:3a41:: with SMTP id
 a1mr17890476ejf.260.1598483037963; 
 Wed, 26 Aug 2020 16:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200819025829.57545-1-wanghai38@huawei.com>
 <CAAOTY_8-iB9sg4+-AyFpGACc2pW+ZzsJqUbvgReNcfu5kSX6Qw@mail.gmail.com>
In-Reply-To: <CAAOTY_8-iB9sg4+-AyFpGACc2pW+ZzsJqUbvgReNcfu5kSX6Qw@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Aug 2020 07:03:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9DUUZuZO3Nu+bq-t0SyabRRqwW3B+V=--K_nHJ9sAxMg@mail.gmail.com>
Message-ID: <CAAOTY_9DUUZuZO3Nu+bq-t0SyabRRqwW3B+V=--K_nHJ9sAxMg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: remove duplicate include
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_190400_478298_D88883E0 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: Wang Hai <wanghai38@huawei.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFdhbmcgSGFpOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIw5bm0OOaciDIx5pelIOmAseS6lCDkuIrljYg3OjIz5a+r6YGT77yaCj4KPiBIaSwgV2Fu
ZyBIYWk6Cj4KPiBXYW5nIEhhaSA8d2FuZ2hhaTM4QGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0OOac
iDE55pelIOmAseS4iSDkuIrljYgxMTowMOWvq+mBk++8mgo+ID4KPiA+IFJlbW92ZSBtdGtfZHJt
X2RkcC5oIHdoaWNoIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBvbmNlCj4gPgo+Cj4gUmV2aWV3ZWQt
Ynk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+CgpBcHBsaWVkIHRv
IG1lZGlhdGVrLWRybS1maXhlcyBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/
aD1tZWRpYXRlay1kcm0tZml4ZXMKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ID4gUmVwb3J0ZWQt
Ynk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogV2Fu
ZyBIYWkgPHdhbmdoYWkzOEBodWF3ZWkuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxIC0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiBp
bmRleCAwNDBhOGYzOTNmZTIuLmEzNGZkODA1Y2U2ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ID4gQEAgLTI3LDcgKzI3LDYgQEAKPiA+Cj4gPiAgI2lu
Y2x1ZGUgIm10a19kcm1fY3J0Yy5oIgo+ID4gICNpbmNsdWRlICJtdGtfZHJtX2RkcC5oIgo+ID4g
LSNpbmNsdWRlICJtdGtfZHJtX2RkcC5oIgo+ID4gICNpbmNsdWRlICJtdGtfZHJtX2RkcF9jb21w
LmgiCj4gPiAgI2luY2x1ZGUgIm10a19kcm1fZHJ2LmgiCj4gPiAgI2luY2x1ZGUgIm10a19kcm1f
Z2VtLmgiCj4gPiAtLQo+ID4gMi4xNy4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
