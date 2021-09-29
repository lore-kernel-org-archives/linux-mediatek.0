Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D58C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 14:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F42613A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 14:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7F42613A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIu8aGSwjG2NEvSLNTtVN4BLPPbcrkWUXpZdfvQiSBM=; b=KneO8rxEO+AAOp
	zSIr85KH4hr8au1vYUEtNKFQndVFui1aU48rWO2N0EQ72lQkgY0/y/sp3KfaJDVPhokTRBXToteQC
	J4Xg+2IL5mycIIAqOr1SOvNOocsj3wG6wjcA4Con3U+YzaGzkO8nO6UxwMF0DjYQjGwTV+hHG3Kn8
	eEoaVg5wgk7hgzyyCZfIHdMtH46xL+y3LOvgGhtdNgZzvyjzyhKEVF2b6lC9XbrLVht/k6j2ilzGT
	yezVblyXmFr4Kbygz2G6VbzrP0wEK0GlbF+Hqx2o4/Zpk9lxeRLmRuYy2xJpldW+fJSYbNoenNO0x
	zozwVAleUCE2OxB01hfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb1R-00BQb2-Ln; Wed, 29 Sep 2021 14:57:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb1C-00BQWD-HO; Wed, 29 Sep 2021 14:57:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A5D261406;
 Wed, 29 Sep 2021 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927430;
 bh=m2Q3ldX4i8hJz/lYMTrW/Tc7jkjEgA48T0avsrMIFb0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gWFQ3OxM+zlx5cOWwCsZPh5DG7BsFXnu98NTkCs+mOcp7Ey8FcXCBJo0g8+riLu0X
 wU6z55q6PhafzSiSGpIlMa5m2o8GLG1p3SG223uY8PKm8DrsBkP/yeywoTU7zaO7V7
 Lpn8OfKULxV/0BhHBYJoP7RccfPv5Tm3OeHMWTVYqsFWBURZUvgkEgjUvR4q9aGxH1
 6dbO2DosvrEzi91Pzfe0MUUfFjuCbUUMjIumlfR2Swo+KuOwRWdkBp8GYBNZhTDfxU
 ULn6r6Az0vpyLmxmViOQXgJauMS5JdQ4VBEn/fhwIX54iRZJDZrPP82DSCPsi7E7n2
 Fn4uqb6LKT67A==
Received: by mail-ed1-f54.google.com with SMTP id dn26so9684996edb.13;
 Wed, 29 Sep 2021 07:57:09 -0700 (PDT)
X-Gm-Message-State: AOAM532/iBLuTgjYuOpsnredfUUVYYcKZsBLd9WcKr5Cg/Dx4es5wvQK
 RTU/iORYnZIk/HOJUHpL/hzhUjqC6qzPgbFrMQ==
X-Google-Smtp-Source: ABdhPJy2oIyAhlML1lKHkEI+GYb7Xf5WZ4jL2sSq+xZsFvjhx2y5gie/l/Dq825/3UzuJiV9rAUHrF0xKV//SQBZD0k=
X-Received: by 2002:a17:906:7ac4:: with SMTP id
 k4mr178848ejo.430.1632927358007; 
 Wed, 29 Sep 2021 07:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210929070235.4290-1-jason-jh.lin@mediatek.com>
 <20210929070235.4290-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210929070235.4290-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:55:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY__XmEYNbQJh0o-V-DS7F-_s1a9m54+FuOMwHGBCwx55Wg@mail.gmail.com>
Message-ID: <CAAOTY__XmEYNbQJh0o-V-DS7F-_s1a9m54+FuOMwHGBCwx55Wg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mediatek: Fix cursor plane is not config when
 primary is updating
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075710_644088_167DBA59 
X-CRM114-Status: GOOD (  17.48  )
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
MjAyMeW5tDnmnIgyOeaXpSDpgLHkuIkg5LiL5Y2IMzowMuWvq+mBk++8mgo+Cj4gSWYgY3Vyc29y
IHBsYW5lIGhhcyB1cGRhdGVkIGJ1dCBwcmltYXJ5IHBsYW5lIGNvbmZpZyB0YXNrIGlzIG5vdAo+
IGZpbmlzaGVkLCBtdGtfZHJtX2NydGNfdXBkYXRlX2NvbmZpZyB3aWxsIGNhbGwgbWJveF9mbHVz
aCgpIHRvIGNsZWFyCj4gYWxsIHRhc2sgaW4gY3VycmVudCBHQ0UgdGhyZWFkIGFuZCBsZXQgY3Vy
c29yIHBsYW5lIHJlLXNlbmQgYSBuZXcKPiBHQ0UgdGFzayB3aXRoIGN1cnNvciArIHByaW1hcnkg
cGxhbmUgY29uZmlnIHRvIHJlcGxhY2UgdGhlIHVuZmluaXNoZWQKPiBHQ0UgdGFzay4KPgo+IFNv
IHRoZSBwbGFuZSBjb25maWcgZmxhZyBzaG91bGQgbm90IGJlIGNsZWFyZWQgd2hlbiBtYWlsYm94
IGNhbGxiYWNrCj4gd2l0aCBhIGVycm9yIHN0YXR1cy4KPgo+IEZpeGVzOiA5ZWZiMTZjMmZkZDYg
KCJkcm0vbWVkaWF0ZWs6IENsZWFyIHBlbmRpbmcgZmxhZyB3aGVuIGNtZHEgcGFja2V0IGlzIGRv
bmUiKQo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVr
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwg
MyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IGluZGV4IDA2MzQyZGYyYTBiZS4uZmIwZDk0MjRh
Y2VjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IEBAIC0y
ODEsNiArMjgxLDkgQEAgc3RhdGljIHZvaWQgZGRwX2NtZHFfY2Ioc3RydWN0IG1ib3hfY2xpZW50
ICpjbCwgdm9pZCAqbXNzZykKPiAgICAgICAgIHN0cnVjdCBtdGtfY3J0Y19zdGF0ZSAqc3RhdGU7
Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgaTsKPgo+ICsgICAgICAgaWYgKGRhdGEtPnN0YSAhPSAw
KQoKZGF0YS0+c3RhIGlzIG5vdyB0aGUgc3RhbmRhcmQgZXJyb3IgY29kZSwgc28gZGF0YS0+c3Rh
IDwgMCBpcyBhbiBlcnJvci4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAgICAgICAg
ICByZXR1cm47Cj4gKwo+ICAgICAgICAgc3RhdGUgPSB0b19tdGtfY3J0Y19zdGF0ZShtdGtfY3J0
Yy0+YmFzZS5zdGF0ZSk7Cj4KPiAgICAgICAgIHN0YXRlLT5wZW5kaW5nX2NvbmZpZyA9IGZhbHNl
Owo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
