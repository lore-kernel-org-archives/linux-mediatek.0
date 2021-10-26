Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC14C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:54:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F6F0603E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 15:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F6F0603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8PxDAhF4CUoT/qkr0SGv2chrs0VP4M6KwSvtbD6OcA=; b=hPU7w5pA7yxJni
	OT6uYF/fCjS03ukiEYpdlSaZ5ujE81YUzeDniywS+/xCQqrdRIK41S5v3RiBTsE2OWncrCIC61gbL
	CZDX2Akqfzgk1K/BTqC09BwJnVrEDyMRLhIfK7YOkiKvJoaA7A8CBgM6Y4oSSAEA7Jj6c/asQ9x4E
	jd/YSyuW2+cineIVOhHeFWirbtD9IkEfmk0lLuksD0LenqCEg7UHLQHzXv5IWtRN7canoCRCnrNi4
	8cBHLUC0SZ9sqTHzqVPujg90jrePXK+1q3v/jKkYxD3oQLjMwJNZVRtgW45I41OKwNVUSMoDLCJN7
	ZpY39cxJXVzKHHTJ30Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOlw-002G6X-B8; Tue, 26 Oct 2021 15:53:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfOlj-002G46-DJ; Tue, 26 Oct 2021 15:53:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C53476108B;
 Tue, 26 Oct 2021 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635263622;
 bh=nAKmjX5ewh+7F2mMRFmm/YA3gft13iioUU3Qv6ArlsA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NbmsopBbhkfKKEcVgEQgxxhHJ3BvDtpwjS1Nqz54jsC1wfltlS8XzKfz9GXhxaGt7
 uL6tq8VOLaQGgP3nQ46YnZUJ2H2SdXQ9OY8gyp7IjCeBlm+/84Vpab3EE/rShpZsw5
 8k8B3ZvGoBc8uOHBFrDE2D8qrL+ykWHZ7Xhj61DmmTjDLdZ51nB4vK5bxzuidierWh
 VWXnOVkt5VXKaPoTmfNdoEchkiNC8FDcgWltcsnGfr6CDx3xwHt1VSZRQ84osQpI2v
 sFFwE7cqCvPKv/qL2HuF67H5IgDjKWpo3bASh9KSn6Ow2n5N/dIRo9KKs4qiXbHfKn
 FxOj5/xKAdVOg==
Received: by mail-ed1-f42.google.com with SMTP id g8so14378725edb.2;
 Tue, 26 Oct 2021 08:53:42 -0700 (PDT)
X-Gm-Message-State: AOAM530roDR1GGnAy/Nejq1ddjYF+ExihszBICNV+cLKKIamw8Bysm+0
 FAtEaY59LDVLpk/iidxPN69l0GVYydrjnehKJQ==
X-Google-Smtp-Source: ABdhPJwAzMS+M5QGF4LBx8XUxrq/iAKzw2brrpMhdspRZ8GCoR3k8K+jw/RtWsU34QCh2Sr7vT+F/Tg+vztn5C69A8w=
X-Received: by 2002:aa7:cd14:: with SMTP id b20mr17917455edw.272.1635263411638; 
 Tue, 26 Oct 2021 08:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
 <20211026052916.8222-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026052916.8222-2-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 26 Oct 2021 23:50:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY__RA-dDUhpaBugOXEEX=W2C2MU_yChdzO_a1PF2nO+Mtw@mail.gmail.com>
Message-ID: <CAAOTY__RA-dDUhpaBugOXEEX=W2C2MU_yChdzO_a1PF2nO+Mtw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/mediatek: Use mailbox rx_callback instead of
 cmdq_task_cb
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_085343_505571_92A6726C 
X-CRM114-Status: GOOD (  16.89  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDEw5pyIMjbml6Ug6YCx5LqMIOS4i+WNiDE6Mjnlr6vpgZPvvJoKPgo+IEZyb206IENo
dW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+Cj4gcnhfY2FsbGJhY2sgaXMg
YSBzdGFuZGFyZCBtYWlsYm94IGNhbGxiYWNrIG1lY2hhbmlzbSBhbmQgY291bGQgY292ZXIgdGhl
Cj4gZnVuY3Rpb24gb2YgcHJvcHJpZXRhcnkgY21kcV90YXNrX2NiLCBzbyB1c2UgdGhlIHN0YW5k
YXJkIG9uZSBpbnN0ZWFkIG9mCj4gdGhlIHByb3ByaWV0YXJ5IG9uZS4KClJldmlld2VkLWJ5OiBD
aHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5
OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5
OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDE2ICsrKysrKysrKysrKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gaW5kZXggYTRlODBlNDk5Njc0
Li4zNjlkM2U2OGMwYjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0
Yy5jCj4gQEAgLTQsNiArNCw4IEBACj4gICAqLwo+Cj4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tYWls
Ym94X2NvbnRyb2xsZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oPgo+ICAjaW5jbHVkZSA8bGludXgv
c29jL21lZGlhdGVrL210ay1tbXN5cy5oPgo+IEBAIC0yMjIsOSArMjI0LDExIEBAIHN0cnVjdCBt
dGtfZGRwX2NvbXAgKm10a19kcm1fZGRwX2NvbXBfZm9yX3BsYW5lKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YywKPiAgfQo+Cj4gICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQo+IC1zdGF0
aWMgdm9pZCBkZHBfY21kcV9jYihzdHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGEpCj4gK3N0YXRpYyB2
b2lkIGRkcF9jbWRxX2NiKHN0cnVjdCBtYm94X2NsaWVudCAqY2wsIHZvaWQgKm1zc2cpCj4gIHsK
PiAtICAgICAgIGNtZHFfcGt0X2Rlc3Ryb3koZGF0YS5kYXRhKTsKPiArICAgICAgIHN0cnVjdCBj
bWRxX2NiX2RhdGEgKmRhdGEgPSBtc3NnOwo+ICsKPiArICAgICAgIGNtZHFfcGt0X2Rlc3Ryb3ko
ZGF0YS0+cGt0KTsKPiAgfQo+ICAjZW5kaWYKPgo+IEBAIC00NzUsNyArNDc5LDEyIEBAIHN0YXRp
YyB2b2lkIG10a19kcm1fY3J0Y191cGRhdGVfY29uZmlnKHN0cnVjdCBtdGtfZHJtX2NydGMgKm10
a19jcnRjLAo+ICAgICAgICAgICAgICAgICBjbWRxX3BrdF93ZmUoY21kcV9oYW5kbGUsIG10a19j
cnRjLT5jbWRxX2V2ZW50LCBmYWxzZSk7Cj4gICAgICAgICAgICAgICAgIG10a19jcnRjX2RkcF9j
b25maWcoY3J0YywgY21kcV9oYW5kbGUpOwo+ICAgICAgICAgICAgICAgICBjbWRxX3BrdF9maW5h
bGl6ZShjbWRxX2hhbmRsZSk7Cj4gLSAgICAgICAgICAgICAgIGNtZHFfcGt0X2ZsdXNoX2FzeW5j
KGNtZHFfaGFuZGxlLCBkZHBfY21kcV9jYiwgY21kcV9oYW5kbGUpOwo+ICsgICAgICAgICAgICAg
ICBkbWFfc3luY19zaW5nbGVfZm9yX2RldmljZShtdGtfY3J0Yy0+Y21kcV9jbGllbnQtPmNoYW4t
Pm1ib3gtPmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y21kcV9oYW5kbGUtPnBhX2Jhc2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNtZHFfaGFuZGxlLT5jbWRfYnVmX3NpemUsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9UT19ERVZJQ0UpOwo+ICsgICAgICAgICAgICAg
ICBtYm94X3NlbmRfbWVzc2FnZShtdGtfY3J0Yy0+Y21kcV9jbGllbnQtPmNoYW4sIGNtZHFfaGFu
ZGxlKTsKPiArICAgICAgICAgICAgICAgbWJveF9jbGllbnRfdHhkb25lKG10a19jcnRjLT5jbWRx
X2NsaWVudC0+Y2hhbiwgMCk7Cj4gICAgICAgICB9Cj4gICNlbmRpZgo+ICAgICAgICAgbXRrX2Ny
dGMtPmNvbmZpZ191cGRhdGluZyA9IGZhbHNlOwo+IEBAIC04MzksNiArODQ4LDcgQEAgaW50IG10
a19kcm1fY3J0Y19jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYsCj4gICAgICAgICB9
Cj4KPiAgICAgICAgIGlmIChtdGtfY3J0Yy0+Y21kcV9jbGllbnQpIHsKPiArICAgICAgICAgICAg
ICAgbXRrX2NydGMtPmNtZHFfY2xpZW50LT5jbGllbnQucnhfY2FsbGJhY2sgPSBkZHBfY21kcV9j
YjsKPiAgICAgICAgICAgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgocHJp
di0+bXV0ZXhfbm9kZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIm1lZGlhdGVrLGdjZS1ldmVudHMiLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fY3J0Y19pbmRleCgmbXRrX2NydGMtPmJhc2Up
LAo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
