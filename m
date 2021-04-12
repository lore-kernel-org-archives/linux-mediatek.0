Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15A5C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:33:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC8261287
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC8261287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZV3iG7kyothKJOuZBuMH2qE7AGaCKuvprkwE5ItROOY=; b=pshtsP386L6EdUnKUSPR41Kd5
	XurzPUir81B3/Teh6PAO/RfjwJvWcE/1blPLF3ytsPjJv2PqYCxmqWHcVEiqy8sri7PYTPs5EllWD
	B/rps2NZ8NM3gxQWTGnVxmZ5HpO/7t2K74NmzbS++3MXiSqbT9Y6kOmNbGZaTE6ZQY6xzX+5PaZpm
	Mjq5EBmrCJ9ESbFgW91b453AgR9wPeMq97/uBRA86Ko3DZ4gfaIz1kLeiKRjjMjLfzuCFdT/mgerB
	NAz/QFXOqNgu1Qadg3YPdHiI11TZd3C0aIn5fQaqRKhbkSFBsMY/NYVAHwSoFJqE7H5E/zZ94rLhz
	u3Pj/lbyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVyZ8-0076Ou-6X; Mon, 12 Apr 2021 15:33:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyY3-00760y-7R; Mon, 12 Apr 2021 15:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=MR+AU5b3rAkyOBHPnnxuUacyH3k4QUtVDpdSWi/sfXU=; b=Skieg+FkmzkKSlTuIss32iePSz
 1ILNfl1xZp7f6IsATGNQ1NkG+4/BTeNrGbD2bz6N56jaw3fcfAqy+CUQYVsKiOHVDO3ffatcTHaZW
 teTz1LbdJAYvcKh47V1x4Xgi1Vxh/e/esxagy5tU5zrmQ4RDX2150y9/Y/PI4jWVViPpKoKzcAH9e
 zAio02VdIA6jvYZ8Z4CzV99oHDmdjjRCOhcCfPW0fbuNrni0h4d1/FPYB3Pu7VTTsvyis9Z6f1Y1K
 e4eq+Uk/jH3+eWI51e8JXtYf0l+s6jb6GQ9uQOg/iATsI8ulQidViwkKJAPP0HvDAyY2Z8oiQFQi7
 FLAZv5kA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyY0-006LVi-Po; Mon, 12 Apr 2021 15:32:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 838F76135B;
 Mon, 12 Apr 2021 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618241539;
 bh=PfUYz7ehOP36ze9zottzqYLT6YofP1E/5QKb3NCGfRY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qo6XIw/903qdy+wsJUt0dbetUSiB8NAUHBi44/AgP/z3CwwzWhjQ3AoUvjMfZAZTw
 wl73pB3333TrKJY9sRfsirNKwk9kx5pYQec6YUTiIuxufuW5dIVNi1TK59Rbd420cT
 32KJjvzHLzKfOoAqS+spaOxLmlEuZ5lXv8vMMZoOXY3Kn2kNK7Zi0r1LvtIu3N9eVP
 Od4cU0zfkt0NeLyF83bVTqmPD4toeE4K0qjUaNli6+SVDc1Zy0PZmkrNY9S1bPz3ga
 BSKPU9rRItSSq3kE59IyWzgn6s3E8rOGe9X5iW3LbXy7Q1MBAyjtNlZQN3o3aUhYct
 CXLvKN1pHOqZQ==
Received: by mail-ej1-f43.google.com with SMTP id r12so20994612ejr.5;
 Mon, 12 Apr 2021 08:32:19 -0700 (PDT)
X-Gm-Message-State: AOAM530xek2Whl/LXZ5Rd7mRAy1U3vhocx71Vk4jUaMozB3xxwp7RLDj
 Aos/kdrYzTDpk8Umktvd5PGzwdK14CmkUpiiCg==
X-Google-Smtp-Source: ABdhPJxUH+6kFAMsFOGXnWZU4y+lM9pGKAyUVJwsXhiMUyF3mf1ypBpE74YoOYyllLOSa7Tkz/VEl3gfdNDYBpx1tEY=
X-Received: by 2002:a17:906:c348:: with SMTP id
 ci8mr8745246ejb.303.1618241538032; 
 Mon, 12 Apr 2021 08:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210410034841.16567-1-wangli74@huawei.com>
In-Reply-To: <20210410034841.16567-1-wangli74@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Apr 2021 23:32:06 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qNeoZT1CorqhBrQe888tG21TF=LnPkUgymv=rQ8-YAA@mail.gmail.com>
Message-ID: <CAAOTY_-qNeoZT1CorqhBrQe888tG21TF=LnPkUgymv=rQ8-YAA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: Fix PM reference leak in
 mtk_crtc_ddp_hw_init()
To: Wang Li <wangli74@huawei.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_083220_875993_15475A1E 
X-CRM114-Status: GOOD (  14.37  )
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

SGksIFdhbmc6CgpXYW5nIExpIDx3YW5nbGk3NEBodWF3ZWkuY29tPiDmlrwgMjAyMeW5tDTmnIgx
MOaXpSDpgLHlha0g5LiK5Y2IMTE6MzHlr6vpgZPvvJoKPgo+IHBtX3J1bnRpbWVfZ2V0X3N5bmMg
d2lsbCBpbmNyZW1lbnQgcG0gdXNhZ2UgY291bnRlciBldmVuIGl0IGZhaWxlZC4KPiBGb3JnZXR0
aW5nIHRvIHB1dHRpbmcgb3BlcmF0aW9uIHdpbGwgcmVzdWx0IGluIHJlZmVyZW5jZSBsZWFrIGhl
cmUuCj4gRml4IGl0IGJ5IHJlcGxhY2luZyBpdCB3aXRoIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9n
ZXQgdG8ga2VlcCB1c2FnZQo+IGNvdW50ZXIgYmFsYW5jZWQuCgpSZXZpZXdlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTGkgPHdhbmds
aTc0QGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gaW5kZXgg
NTRhYjNhMzI0NzUyLi5mMTk1NDI0MmQ4ZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jCj4gQEAgLTI1OSw3ICsyNTksNyBAQCBzdGF0aWMgaW50IG10a19jcnRj
X2RkcF9od19pbml0KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+ICAgICAgICAgICAg
ICAgICBkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRlcik7Cj4gICAgICAgICB9
Cj4KPiAtICAgICAgIHJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoY3J0Yy0+ZGV2LT5kZXYpOwo+
ICsgICAgICAgcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChjcnRjLT5kZXYtPmRldik7
Cj4gICAgICAgICBpZiAocmV0IDwgMCkgewo+ICAgICAgICAgICAgICAgICBEUk1fRVJST1IoIkZh
aWxlZCB0byBlbmFibGUgcG93ZXIgZG9tYWluOiAlZFxuIiwgcmV0KTsKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
