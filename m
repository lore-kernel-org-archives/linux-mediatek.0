Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A139CC83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 16:38:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D43206D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 16:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hT5+c68Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPd+xC9f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74D43206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kdr1TV+LQJWXOcxEj101Z+crQUPH66u8h++/2cp228=; b=hT5+c68Y6B9ebV
	pL8dnJD1ShToK3Sfg/7+AarSFhvI/xw9gLFQMdJeGArr9DI0qykc9sbgfvNXwJUFo7prcyAKipx+H
	Buv236KozqplIWoEBNsfMrvIV5LlsUkOCitsAwxKfiAa3Ag+L1Mb+c4jgjCv1fzhCKa7oNLf64DRE
	s6jg/dXJY1HYO7jSBnTd8Nm+MvLEl7h4FWDUFjTG7j8xZNLNuoJG0uxHPUF53PGtyXm3/AM6nL6hV
	k54n+3zZ6Rh+Wktq6CkC+cetzMbcJhF+G61dVmZXIUn8iSrMjI+mwcHxNQHP2GPAO98/7ADmrcsI0
	2KQTaA9pgnE1bflbPspw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTTFC-00007u-Ve; Tue, 28 Apr 2020 16:38:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTTF2-0008Qi-Gs; Tue, 28 Apr 2020 16:37:53 +0000
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A330220B1F;
 Tue, 28 Apr 2020 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588091871;
 bh=Uoj0BjFq988E2mLhmcNcRR/H4Wi47KHjYkGY/1y8N1k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rPd+xC9fjkBMimGCmyES96/SSKnGhQt9LI0DwdlzEPnKu5+Rlskf57JyKAuOOXnpx
 5FsUAe5BAtykiTvEIcBRv3rBQJhd66yhN57zAp0f+R6nm67lyZ64f3ZZQoh4Es+7bE
 kajz13CkD7WmQTXJ67ZSmIID9M0W4BqqXRZWkp+M=
Received: by mail-ej1-f41.google.com with SMTP id pg17so17759638ejb.9;
 Tue, 28 Apr 2020 09:37:51 -0700 (PDT)
X-Gm-Message-State: AGi0PuaLM/KimbZ8YPx3Wp/x7S1rf5DcBMWk0F5DvaOvk9rLwwvXFS/j
 hCJZFI9dxbu7NaG2aCBnavvs9mUQaUiJjoGiow==
X-Google-Smtp-Source: APiQypJjv9YpvCUB7C9FT396wARQtk3fMbL/djWYavK0MUAWkXioud021aPhjbo3X2S0bPMMCv25azvwtbxKAXhAqrs=
X-Received: by 2002:a17:907:2168:: with SMTP id
 rl8mr24379159ejb.360.1588091870050; 
 Tue, 28 Apr 2020 09:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
 <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
In-Reply-To: <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Apr 2020 00:37:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
Message-ID: <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: "Anand K. Mistry" <amistry@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_093752_597373_431BC763 
X-CRM114-Status: GOOD (  20.39  )
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
 DRI Development <dri-devel@lists.freedesktop.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEFuYW5kLAoKQW5hbmQgSy4gTWlzdHJ5IDxhbWlzdHJ5QGNocm9taXVtLm9yZz4g5pa8IDIw
MjDlubQ05pyIMjjml6Ug6YCx5LqMIOS4iuWNiDk6NTTlr6vpgZPvvJoKPgo+IE9uIFN1biwgMjYg
QXByIDIwMjAgYXQgMTg6MDQsIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Cj4gPiBIaSwgQW5hbmQ6Cj4gPgo+ID4gQW5hbmQgSyBNaXN0cnkgPGFtaXN0
cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMOW5tDTmnIgyMOaXpSDpgLHkuIAg5LiL5Y2IMjowOeWv
q+mBk++8mgo+ID4gPgo+ID4gPiBJZiBkbWFfbWFwX3NnKCkgbWVyZ2VzIHBhZ2VzIHdoZW4gY3Jl
YXRpbmcgdGhlIG1hcHBpbmcsIG9ubHkgdGhlIGZpcnN0Cj4gPiA+IGVudHJpZXMgd2lsbCBoYXZl
IGEgdmFsaWQgc2dfZG1hX2FkZHJlc3MoKSBhbmQgc2dfZG1hX2xlbigpLCBmb2xsb3dlZCBieQo+
ID4gPiBlbnRyaWVzIHdpdGggc2dfZG1hX2xlbigpID09IDAuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5jb20+Cj4gPiA+IC0tLQo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgfCAzICsrKwo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gPiBpbmRleCBiMDRhM2MyYjExMWUwOS4uZjhmZDhi
OThjMzBlM2QgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2dlbS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dl
bS5jCj4gPiA+IEBAIC0yMjQsNiArMjI0LDkgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICptdGtf
Z2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gPgo+
ID4gPiAgICAgICAgIGV4cGVjdGVkID0gc2dfZG1hX2FkZHJlc3Moc2ctPnNnbCk7Cj4gPiA+ICAg
ICAgICAgZm9yX2VhY2hfc2coc2ctPnNnbCwgcywgc2ctPm5lbnRzLCBpKSB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICBpZiAoIXNnX2RtYV9sZW4ocykpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ID4KPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgJ2NvbnRpbnVlJwo+Cj4g
c2NhdHRlcmxpc3QuaCBoYXMgdGhlIGNvbW1lbnQ6Cj4gLyoKPiAgKiBUaGVzZSBtYWNyb3Mgc2hv
dWxkIGJlIHVzZWQgYWZ0ZXIgYSBkbWFfbWFwX3NnIGNhbGwgaGFzIGJlZW4gZG9uZQo+ICAqIHRv
IGdldCBidXMgYWRkcmVzc2VzIG9mIGVhY2ggb2YgdGhlIFNHIGVudHJpZXMgYW5kIHRoZWlyIGxl
bmd0aHMuCj4gICogWW91IHNob3VsZCBvbmx5IHdvcmsgd2l0aCB0aGUgbnVtYmVyIG9mIHNnIGVu
dHJpZXMgZG1hX21hcF9zZwo+ICAqIHJldHVybnMsIG9yIGFsdGVybmF0aXZlbHkgc3RvcCBvbiB0
aGUgZmlyc3Qgc2dfZG1hX2xlbihzZykgd2hpY2gKPiAgKiBpcyAwLgo+ICAqLwo+Cj4gU28gYnJl
YWtpbmcgb24gdGhlIGZpcnN0IHNnX2RtYV9sZW4oc2cpID09IDAgYXBwZWFycyB0byBiZSAob25l
IG9mKQo+IHRoZSBkb2N1bWVudGVkIGFwcHJvYWNoLgo+CgpPa2F5LCB5b3UncmUgcmlnaHQuIFNv
CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+
ID4KPiA+IFJlZ2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+ID4KPiA+ID4gKwo+ID4gPiAgICAgICAg
ICAgICAgICAgaWYgKHNnX2RtYV9hZGRyZXNzKHMpICE9IGV4cGVjdGVkKSB7Cj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigic2dfdGFibGUgaXMgbm90IGNvbnRpZ3VvdXMi
KTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ID4gLS0K
PiA+ID4gMi4yNi4xLjMwMS5nNTViYzNlYjdjYjktZ29vZwo+ID4gPgo+ID4gPgo+ID4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
