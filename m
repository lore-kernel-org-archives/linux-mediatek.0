Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AA2C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 23:42:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FA561206
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 23:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FA561206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v8kR8wgWV29IPOz2Lz/Pv1H14iLqdpiADD15euN1H8Y=; b=R8SMFXdzu2EUcqNGVfiw+iHQJ
	jZmSaXWjN3STCro131Z7iH+QSN5S1d1C3y9zbShfTgXwJSzMjEp+adP6KOQMkM26eFzgSqVlRmWnx
	bAerbW/X/kSZ9swfM49EdHbeUfMIh23MVoQU06JjtC2/ElT3TEfZ3I7UyzMNgKS/5+uaweVLQOuRU
	a9hfWAjNqELaNXIiuLjyEqPhdM8CvgfCqGDGtEfse6/DrmQGhPtkAOw9NSQgHNC9dPBeR4lrnR5mN
	KY9cmwHIZlRa33jodkOb5v08pacuNdUpj5MxVnKQ3A1oxcNDlFh9qjXlJ9unXjingxZEYdIxXDiHT
	qbl/6kdAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhKyQ-006jJM-9v; Thu, 13 May 2021 23:42:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhKyC-006jGk-5a; Thu, 13 May 2021 23:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=G1cIURbTR6fIXSax09CzYMN1fJHOHjHds8Aoqfx95I4=; b=dRF5e6yll5UdgLsO1a+Q0zPRCm
 mgq0FKgnVIDtgNdmNCb/ud26/RtuagTqQavcvAG7yB9Va2EkHKp7pfMjW29b5+G8A4IWJbvX9bg0A
 3ctCG3Ax5fMaEIL+UrRdVNXefcJLcMG+kCIpBHTYk0CO2f0bG87/MGc0mJ1fcuhsF2h0CgQF6ksas
 MBRPigxVlXS6k8nowxg7k0HccbqLaQRJR5fJziROHHkYIgRLrLdG5U/swrDmNkQDaYidRWhdWjvrs
 1bepIs6fKpa4muge4R1WtP8t86cqu778PFkvYWpdRWqKDYsFdak4s/4+eOQGsMcZNHw3DtSiXDEEm
 rAFnccaQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhKy9-00BcQ1-Bt; Thu, 13 May 2021 23:42:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8EC66143F;
 Thu, 13 May 2021 23:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620949336;
 bh=Q+ZtNVyGmIl0eXIQdcuUrxm022erUcWDgP5SQNOKYQs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iH49wNJ+6khauFhNYkW4TjYuSUoVNxpNAXZwdwX1vzihY0Q/34epUJFzJ1oKStd42
 WZAsWkiNHkMrVshVnZyX9l06691jq9xHRcRuhboOHs0sSxTd743O2L9mnvP6Dy4//5
 at++XhheqRV58LqTyVD2TYMsYsRfkrcCFQ4Y7kjh7wFUezH6ACP8dHk/Gd8gvKFVwv
 GB0WzLc0DZ0amS16V59vFKKOHpJlHASkBkV8HfFarusvPeESM1BwulNWbue2EKaaiJ
 mK6zQyBivpA0SCi03Jdeq707COQjTm9ON/Q/HYni9EDWx85PYqigEDbRFLdfUmfOLB
 KU5Dg6bY8VpgQ==
Received: by mail-ej1-f50.google.com with SMTP id b25so42118101eju.5;
 Thu, 13 May 2021 16:42:16 -0700 (PDT)
X-Gm-Message-State: AOAM532KhMKKr4Bd0p+Z4c2r14UB0afQ2rN9ND4nZPoLI1ea1a0I1e2O
 dor7UQX0Idj9gnMI5P29nzARu9YDl4oyIwI6lg==
X-Google-Smtp-Source: ABdhPJwjsoRig7IOCycfYr7+vBwT5PLJsBVb7geAGrFTpeUYk95619iAQHs5U3NzTbepCRoakv8rIPSUJ04vCjqg1co=
X-Received: by 2002:a17:906:3da9:: with SMTP id
 y9mr46028343ejh.303.1620949335233; 
 Thu, 13 May 2021 16:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210410034841.16567-1-wangli74@huawei.com>
 <CAAOTY_-qNeoZT1CorqhBrQe888tG21TF=LnPkUgymv=rQ8-YAA@mail.gmail.com>
In-Reply-To: <CAAOTY_-qNeoZT1CorqhBrQe888tG21TF=LnPkUgymv=rQ8-YAA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 14 May 2021 07:42:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_95X+z83Ng8EO3zwbAqqE9E1=YQYT+3e-N2KHTOVqfsKg@mail.gmail.com>
Message-ID: <CAAOTY_95X+z83Ng8EO3zwbAqqE9E1=YQYT+3e-N2KHTOVqfsKg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: Fix PM reference leak in
 mtk_crtc_ddp_hw_init()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Wang Li <wangli74@huawei.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_164217_494674_46304C2A 
X-CRM114-Status: GOOD (  15.01  )
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

SGksIFdhbmc6CgpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8IDIw
MjHlubQ05pyIMTLml6Ug6YCx5LiAIOS4i+WNiDExOjMy5a+r6YGT77yaCj4KPiBIaSwgV2FuZzoK
Pgo+IFdhbmcgTGkgPHdhbmdsaTc0QGh1YXdlaS5jb20+IOaWvCAyMDIx5bm0NOaciDEw5pelIOmA
seWFrSDkuIrljYgxMTozMeWvq+mBk++8mgo+ID4KPiA+IHBtX3J1bnRpbWVfZ2V0X3N5bmMgd2ls
bCBpbmNyZW1lbnQgcG0gdXNhZ2UgY291bnRlciBldmVuIGl0IGZhaWxlZC4KPiA+IEZvcmdldHRp
bmcgdG8gcHV0dGluZyBvcGVyYXRpb24gd2lsbCByZXN1bHQgaW4gcmVmZXJlbmNlIGxlYWsgaGVy
ZS4KPiA+IEZpeCBpdCBieSByZXBsYWNpbmcgaXQgd2l0aCBwbV9ydW50aW1lX3Jlc3VtZV9hbmRf
Z2V0IHRvIGtlZXAgdXNhZ2UKPiA+IGNvdW50ZXIgYmFsYW5jZWQuCgpBcHBsaWVkIHRvIG1lZGlh
dGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlh
dGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFJldmlld2VkLWJ5OiBDaHVu
LUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPgo+ID4KPiA+IFJlcG9ydGVkLWJ5
OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcg
TGkgPHdhbmdsaTc0QGh1YXdlaS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYwo+ID4gaW5kZXggNTRhYjNhMzI0NzUyLi5mMTk1NDI0MmQ4ZjYgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ID4gQEAgLTI1OSw3ICsy
NTksNyBAQCBzdGF0aWMgaW50IG10a19jcnRjX2RkcF9od19pbml0KHN0cnVjdCBtdGtfZHJtX2Ny
dGMgKm10a19jcnRjKQo+ID4gICAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfbGlzdF9pdGVy
X2VuZCgmY29ubl9pdGVyKTsKPiA+ICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgcmV0ID0gcG1f
cnVudGltZV9nZXRfc3luYyhjcnRjLT5kZXYtPmRldik7Cj4gPiArICAgICAgIHJldCA9IHBtX3J1
bnRpbWVfcmVzdW1lX2FuZF9nZXQoY3J0Yy0+ZGV2LT5kZXYpOwo+ID4gICAgICAgICBpZiAocmV0
IDwgMCkgewo+ID4gICAgICAgICAgICAgICAgIERSTV9FUlJPUigiRmFpbGVkIHRvIGVuYWJsZSBw
b3dlciBkb21haW46ICVkXG4iLCByZXQpOwo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
