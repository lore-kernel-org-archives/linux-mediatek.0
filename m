Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632FFC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:32:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E79D120782
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 14:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XTszzGpZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z33v22hd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E79D120782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lvtwn2oVdFBgjzcy4rCAyxwgyZj9VLW0CYr28FZvIl8=; b=XTszzGpZxPKzGuLfpA+wpC+Fc
	5rFvD3XafVtfsG4X4pOf4DdSiqX8P8phcudB/Xc0WWxAg2CwHQ7gttheEIpNYyBuQF/fZ5qmSrpGU
	wzdjezpZrzxYenO8PAldoN+Gk6I5brFofYN+OCEeWA/Dyz5DOeE31dGe82Ia51CpMkYZIVmqWQRDQ
	QIvFI3Gps4yR/Sn7G+OnejoahqInE5gFTf9OmZspyMqLNUTGxcnf5UwDxHgkmuY3HvHdFexNK95bi
	RoK7O4TPWx6jghP8eI3RPHq1pRnyjFq3D1z0k48vLXSjSgbfUwby6aB1JSPbtvlkEPDhWH4lNL48N
	nfV4CRFwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khCtP-0007TJ-50; Mon, 23 Nov 2020 14:32:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khCt1-0007Ir-I7; Mon, 23 Nov 2020 14:32:12 +0000
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F38020B1F;
 Mon, 23 Nov 2020 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141930;
 bh=ftNKqa+bYDhqF4CMFphNHzMCzHAOisKpwk67ZYS6ZgM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=z33v22hdW4YxiwW6UEgw0GvvELco7HO5D74BE8TiqvAF2YrPjUDKYmmLTSTjzEXzQ
 v6Qi2fTyU9w/KjIUEQPP7wzuYXaF7LpZ++7dBhNBNaz6XK+BswUidtVXm9Oslh+sSJ
 xFTJAgH+Rq7jFYAWobff4/qdOjMk7bGHLg9i3vfg=
Received: by mail-ed1-f46.google.com with SMTP id q16so17288622edv.10;
 Mon, 23 Nov 2020 06:32:10 -0800 (PST)
X-Gm-Message-State: AOAM5316TaFbtDdeMlN3A/JKQurPg2Ibw9AxyPc/M+hw0DpHrAOog5XZ
 RZi+7EO/tOpBHOqtnWs1XaA5N6InajJBQJZ7MQ==
X-Google-Smtp-Source: ABdhPJyS2K7No/Iy7mVbNPsYoEYSje2gRGMO/P9wTkTu5AgIlPqa/VzyGgZFr00oj+Lye5y2SIpkBeoCVwE63Mb7TOk=
X-Received: by 2002:a50:f742:: with SMTP id j2mr39321499edn.72.1606141928430; 
 Mon, 23 Nov 2020 06:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-29-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-29-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:31:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Q39YMUGLtrBi0p+kedU5xSHv0dUKz2NA3ajR17Fe-4A@mail.gmail.com>
Message-ID: <CAAOTY__Q39YMUGLtrBi0p+kedU5xSHv0dUKz2NA3ajR17Fe-4A@mail.gmail.com>
Subject: Re: [PATCH 28/30] drm/mediatek/mtk_disp_color: Fix formatting and
 provide missing member description
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_093211_785017_33AEEAD0 
X-CRM114-Status: GOOD (  18.61  )
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
dGVrL210a19kaXNwX2NvbG9yLmM6NDA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2RkcF9jb21wJyBub3QgZGVzY3JpYmVkIGluICdtdGtfZGlzcF9jb2xvcicKPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmM6NDA6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2NydGMnIG5vdCBkZXNjcmliZWQgaW4gJ210a19kaXNw
X2NvbG9yJwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYzo0MDog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGF0YScgbm90IGRlc2NyaWJl
ZCBpbiAnbXRrX2Rpc3BfY29sb3InCj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFd
LCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3Iu
YyB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
Y29sb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jCj4gaW5k
ZXggM2FlOWM4MTA4NDViYi4uYTc4OGZmOTVlZDZlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jCj4gQEAgLTMwLDggKzMwLDkgQEAgc3RydWN0IG10a19k
aXNwX2NvbG9yX2RhdGEgewo+Cj4gIC8qKgo+ICAgKiBzdHJ1Y3QgbXRrX2Rpc3BfY29sb3IgLSBE
SVNQX0NPTE9SIGRyaXZlciBzdHJ1Y3R1cmUKPiAtICogQGRkcF9jb21wIC0gc3RydWN0dXJlIGNv
bnRhaW5pbmcgdHlwZSBlbnVtIGFuZCBoYXJkd2FyZSByZXNvdXJjZXMKPiAtICogQGNydGMgLSBh
c3NvY2lhdGVkIGNydGMgdG8gcmVwb3J0IGlycSBldmVudHMgdG8KPiArICogQGRkcF9jb21wOiBz
dHJ1Y3R1cmUgY29udGFpbmluZyB0eXBlIGVudW0gYW5kIGhhcmR3YXJlIHJlc291cmNlcwo+ICsg
KiBAY3J0YzogYXNzb2NpYXRlZCBjcnRjIHRvIHJlcG9ydCBpcnEgZXZlbnRzIHRvCj4gKyAqIEBk
YXRhOiBwbGF0Zm9ybSBjb2xvdXIgZHJpdmVyIGRhdGEKPiAgICovCj4gIHN0cnVjdCBtdGtfZGlz
cF9jb2xvciB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICAgICAgICAgICAgICAgICAg
ICAgZGRwX2NvbXA7Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
