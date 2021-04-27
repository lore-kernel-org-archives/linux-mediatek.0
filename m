Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5018BC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 15:34:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D0660BBB
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 15:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D0660BBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OQZX5+wN5dWffI5nTItNNchIXaagJ+rg3NyEtnSk0ew=; b=C/NuRLOOHP2kdqDawp3waFan3
	sK2bIRO18Q6Kc2TdlaSsMU4av60+UMAhJEr9qncNHvlTPdRPdRckHwhbn9YfFLITTxJOiObWU69of
	mNYR7zq/wI3PXej69uoST7ByzOCwCiB62/pDRMoC5orGpZ/ppkOs8NiKMu2YSNLnba84TpQu9xYPY
	EUwJ+VIqTC9vvNhz9DHS3GOC0P89ya1Nyj/oQ9HoIYl1EN2LRTv6Ks2OWTdQA9TBXHnusc8XAVakA
	/cZ2n1takikAXOf78/L7BvSHFIoUY+ZDIFoflLprrgU8gHW+uSxDjk/gRVBy38MKYbeIjEQ6w4IhJ
	4WWDvLtow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbPjI-001q04-GF; Tue, 27 Apr 2021 15:34:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbPj6-001pzR-Sb; Tue, 27 Apr 2021 15:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=PLL6y35m7wlIM+hkwyA4x+e1SdGOh3UNOB+fy2kCe94=; b=STuLKUMN1ptkKOMiXRuAOwSOSu
 AlUC+mndD3sm9HW7hdbXVh4fXlDc0BggOt3+7JGu1d7Pex4JIYqXg6HZmC85wrPM93k2haE/n0cWL
 CKJkXWTXoSPO8J8rZIwvarPMFISL8ks3qCYrJUjAKmGL1XzZAnHn/BkhGLUAIlvwddoB7QIJyHKID
 nyab8dlB9sPJ54egwZIrcESVzg88wTPb+sjv0G2QhMig65NSybU7fzsodr3RMAMUP5X3l9WEXzdC9
 xOXmBUxvdCoqdoIjHjrcouBPk7Lo5KHvarnwdS/K3Z52+xMbsQSQe6Bfe5LiPxQCNX6Ku6WrKaNmZ
 WqL2fDxg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbPj4-00Gp9A-GZ; Tue, 27 Apr 2021 15:34:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2788613DD;
 Tue, 27 Apr 2021 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619537653;
 bh=nRjupLfRtOC1jx4QARvFWp92/DopAWZE+CYvOd1QYs4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xf7xrFh15+85qDBGqvjtGZcA6XAk5idTyN4iVWB48cXzrK1wlXyVc9fouKZpB7AjH
 Jju0aYIUHCE1wy6WooMwCPVUeU0XUTFgWWc2B6rxq66IPYL0EjamfS70sXohNoCjQu
 NnnZvlExEMa0rr0Gn+7tchsamcn0byq8AZWrmucpVvK6eA+nRoQriSQi2F5cDM7ZSD
 WRrLRplQZVpE/CgPnxzjtuGINBoM4Kj4DmyYSlEj2Fphte4bBeR/TcFlnXQ17+WxLD
 LZYSucpWRR0mxfQQWuN/FQm/zphGSBo/NYdKMb7+S+x6RRgGZwtIsbY9qUJpjY3tTI
 1eeJ5KyxyiIFg==
Received: by mail-ej1-f44.google.com with SMTP id ja3so14227305ejc.9;
 Tue, 27 Apr 2021 08:34:13 -0700 (PDT)
X-Gm-Message-State: AOAM5316aY+FmiTcYmnzfZDbKpzHPx4ThDpz9Uxtt2QUZZUsaqqtY47Q
 3Jr2h7wo7PkbF2hn+ZSjGJu0PRocWzSifWbQLQ==
X-Google-Smtp-Source: ABdhPJwN/fh94a1wvQ0KAftdjjUovYxqjRpSBzYoykWjVdlI+hza7uurmQ86UUDbKXyp07MoytDPBVCc0xoBWlV1ncY=
X-Received: by 2002:a17:906:b0cb:: with SMTP id
 bk11mr2818134ejb.310.1619537652286; 
 Tue, 27 Apr 2021 08:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210427044948.12596-1-hsinyi@chromium.org>
 <20210427044948.12596-2-hsinyi@chromium.org>
In-Reply-To: <20210427044948.12596-2-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 27 Apr 2021 23:34:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__6agGjApVEkAyhPdV46qTjWdHODBGD_VQcYf5PRhF-hA@mail.gmail.com>
Message-ID: <CAAOTY__6agGjApVEkAyhPdV46qTjWdHODBGD_VQcYf5PRhF-hA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/mediatek: init panel orientation property
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_083414_591326_E70B1B2F 
X-CRM114-Status: GOOD (  13.26  )
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

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0NOaciDI35pelIOmAseS6jCDkuIvljYgxMjo0OeWvq+mBk++8mgo+Cj4gSW5pdCBwYW5lbCBv
cmllbnRhdGlvbiBwcm9wZXJ0eSBhZnRlciBjb25uZWN0b3IgaXMgaW5pdGlhbGl6ZWQuIExldCB0
aGUKPiBwYW5lbCBkcml2ZXIgZGVjaWRlcyB0aGUgb3JpZW50YXRpb24gdmFsdWUgbGF0ZXIuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBp
bmRleCBhZTQwM2M2N2NiZDkuLjBiZDI3ODcyZjJhNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYwo+IEBAIC05NjQsNiArOTY0LDcgQEAgc3RhdGljIGludCBtdGtfZHNpX2VuY29k
ZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAg
ICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRzaS0+Y29ubmVjdG9yKTsKPiAgICAgICAgICAg
ICAgICAgZ290byBlcnJfY2xlYW51cF9lbmNvZGVyOwo+ICAgICAgICAgfQo+ICsgICAgICAgZHJt
X2Nvbm5lY3Rvcl9pbml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5KGRzaS0+Y29ubmVjdG9y
KTsKClByb2Nlc3MgdGhlIHJldHVybiB2YWx1ZS4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICAg
ICAgICAgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihkc2ktPmNvbm5lY3RvciwgJmRzaS0+
ZW5jb2Rlcik7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IC0tCj4gMi4zMS4xLjQ5OC5nNmMxZWJh
OGVlM2QtZ29vZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
