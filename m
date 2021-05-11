Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2452C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 16:39:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF326190A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 16:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFF326190A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y9AEjdwHDg3TeSqTAgfWW9l0qcp956HHWs6ToocPV8Y=; b=abHkw8IyNmTbDlsFKCUm00pgO
	DNbhLdwFkZki315+xiPBCRNWHsj2xw5jMlDTw/LiCIgxqgX3WXUlcmeQICoJVHbodM5u6Nv6RRggS
	DyseNfKNHdlUBWZajEi8Pb6TMSzyqj2qI2tjKSvgX7CXDbJWkOC5+baw3Yc6jmxcXDQK5F+YI6GCh
	iwC6JqcwmPc5Pcvybu5M215wPwrsZWjlsx0g9+zjciUWYcqNgSoEyCVssFPOUPG8Ss+RWdD+m78YR
	Hn7SRCgCpwyn8yQDDKysCGszLq95X/Q7kK8b6dt7smdGM9TvOSzQJ4VupPtah5M5ZJT4ZcP8DOVkm
	Ns5SOaJvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVQ2-000mHW-LZ; Tue, 11 May 2021 16:39:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgV8K-000iU4-PB; Tue, 11 May 2021 16:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=EQIxeTnXqhUJ1K2hXLimihRdkr3jL5bGhrts5ZHo7Xg=; b=cCWjYwel0ORxbYnC6OVsiEPdq1
 gRVL1mxuFigJSIlT/+rmRHrZ7EO/bC/npjtsZ+KKl5p9nhQNaT0LvgGcPcZE5bui0267AiamTb+zm
 csoWl3Gm/vCM5yava6RT/WPAat0x9ZGRJbLgjN1eZM+DAgBWeYBawCtwAepfzm7PBP1SF0SUldwQx
 OZuTsMw8EwU/qTv9vDRcCM6eFJTzWlb/yEULDajUINDvUcaqMhLbAD27Sw9MkV1f0WWF2VPrnU5A6
 P70aFeMn7ym5haJ4Fi4jT8JB7wK1bzee4pf8v8eiq5zSBPYfOtQQLMsOAa4K4FzZpr1JoM37vIIy6
 5EZlUQnw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgV8I-009kzy-1X; Tue, 11 May 2021 16:21:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 848046191D;
 Tue, 11 May 2021 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620750076;
 bh=Cn3ACvm/0DEZQWq3vsRFDc7XaLRknxn7nJqnZw2JE8Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Hpat+hR/a0DpakGNA4KJY/x15t4/P5bUzqXxo3ukJHN7NBk+grTUAV3zpxaBdp5MF
 3ugmQ/jSD0dnJV31fsPpC3GsicpCM8K7mba88i3iR/8GG+sdk4+KVng97Iab4gkwtu
 MFidujA+Tg7w77xQ/9k4Urt6DNsFGUYnCqXhgXkxkW/wmWajOqcgGGU8sMGm5ASJvm
 4Dw22nueg/NRmgCKnDsAoi4C+eyFGL1pPnpOdSY9lX2EuElg5M8NvwLz36ozFJL5en
 v/u6rzmqRIzxhKf06PGwKDYukjxHEdFHppYwQ4Xsqm14Q/+nj78ccq//8qtbnPLPH9
 iqy5I1bjIe/0Q==
Received: by mail-ej1-f53.google.com with SMTP id s20so25121293ejr.9;
 Tue, 11 May 2021 09:21:16 -0700 (PDT)
X-Gm-Message-State: AOAM532xq+hsT+mR1xUDqCSmwDtdomoms7kUi6udT/ziNvLTS7R4M6CH
 FKdjFHbSYVXR6qI3jFlZARIKpeRgeYaCyIgZIw==
X-Google-Smtp-Source: ABdhPJxnKH+9sRFG4bOGXa5OAw5Qi4cQmVDFCJeva0RME9sa0QQOwDhf1+v79OaUZ7s+OQyBtYYcJy4eSNT2dOS+TdY=
X-Received: by 2002:a17:906:a48:: with SMTP id
 x8mr32395056ejf.127.1620750074915; 
 Tue, 11 May 2021 09:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210429042834.1127456-1-hsinyi@chromium.org>
 <20210429042834.1127456-2-hsinyi@chromium.org>
In-Reply-To: <20210429042834.1127456-2-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 12 May 2021 00:21:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qM6e_yuokOxgct_sUs_e=jknX3k+WpGQfs0RjnOPi1A@mail.gmail.com>
Message-ID: <CAAOTY_-qM6e_yuokOxgct_sUs_e=jknX3k+WpGQfs0RjnOPi1A@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/mediatek: init panel orientation property
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
X-CRM114-CacheID: sfid-20210511_092118_137228_7D87B468 
X-CRM114-Status: GOOD (  14.14  )
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
5bm0NOaciDI55pelIOmAseWbmyDkuIvljYgxMjoyOOWvq+mBk++8mgo+Cj4gSW5pdCBwYW5lbCBv
cmllbnRhdGlvbiBwcm9wZXJ0eSBhZnRlciBjb25uZWN0b3IgaXMgaW5pdGlhbGl6ZWQuIExldCB0
aGUKPiBwYW5lbCBkcml2ZXIgZGVjaWRlcyB0aGUgb3JpZW50YXRpb24gdmFsdWUgbGF0ZXIuCgpB
Y2tlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2ln
bmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNyArKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+
IGluZGV4IGFlNDAzYzY3Y2JkOS4uOWRhMWZkNjQ5MTMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gQEAgLTk2NCw2ICs5NjQsMTMgQEAgc3RhdGljIGludCBtdGtfZHNpX2Vu
Y29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+
ICAgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGRzaS0+Y29ubmVjdG9yKTsKPiAgICAgICAg
ICAgICAgICAgZ290byBlcnJfY2xlYW51cF9lbmNvZGVyOwo+ICAgICAgICAgfQo+ICsKPiArICAg
ICAgIHJldCA9IGRybV9jb25uZWN0b3JfaW5pdF9wYW5lbF9vcmllbnRhdGlvbl9wcm9wZXJ0eShk
c2ktPmNvbm5lY3Rvcik7Cj4gKyAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAgIERS
TV9FUlJPUigiVW5hYmxlIHRvIGluaXQgcGFuZWwgb3JpZW50YXRpb25cbiIpOwo+ICsgICAgICAg
ICAgICAgICBnb3RvIGVycl9jbGVhbnVwX2VuY29kZXI7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihkc2ktPmNvbm5lY3RvciwgJmRzaS0+ZW5j
b2Rlcik7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IC0tCj4gMi4zMS4xLjQ5OC5nNmMxZWJhOGVl
M2QtZ29vZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
