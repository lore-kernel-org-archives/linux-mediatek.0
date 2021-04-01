Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6F9C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 14:16:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684EE61356
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 14:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 684EE61356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bms0xEB/vrqj669xZJL41eb0ipecbL85ODG557ErfVE=; b=NdGFt4K1UvcZDt6BKqUmKRn6Z
	v6tBr49WG9IXxV+PNi5ISBoeIdPVFs4hNaSjifOAKgecg99j61Iw4M1sunK0vjKWwwQN4cf5BDZTI
	vaxGUB1hN7abCAgphINHVDQ4kif3e/6CC9+XFlXhGbo7Q02RE/2jIsAj98RWu1hsbPrfcF56Cjb6i
	D42dOHJq34irhEhwcCk7TRmXy1Pzs4p1//osHUPNiPx8zwLBucFbrIhBqa+LOcSaFT9jmDuJUWW1D
	KrDJjAmjppZxns9xcLy219bnXJWxqM8WANlsnriXECxBLIYuHSk8N28k/58wJ7rImu5bXvwHGQMfA
	97lOvs58w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRy76-009oKk-Ol; Thu, 01 Apr 2021 14:16:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRy72-009oJX-6b
 for linux-mediatek@lists.infradead.org; Thu, 01 Apr 2021 14:15:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E00E261357
 for <linux-mediatek@lists.infradead.org>; Thu,  1 Apr 2021 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617286553;
 bh=pmDesK41LONSTi91JrhFXtlnAIl5KT6c5rqTOesiqVQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VGrY4kmH8EHHTWyxrg3HcsoR66tE4YXh6S9mePCOdTaFF339+KqpEgYXhf0wXOpps
 B4QzWM3g3xkRxjzJDVEe96uUqAjIBLZ5tTCEC2Q48OBh0o6zIDveZmFHWJp5aL6AdY
 tUQHpe7f1aO216OG5hDM+3xRg28LePKijAGaX/xD+0Nb3ARQigDVOIpmIvQMcJfcLE
 53HIvikF41lx2C0zoGUeeACL2ZFDEUcAWjOAyVXJ9IAr33ErCZzD4lubqfuXVbpblN
 ZirOsM4TCo0f35jW90aTokhU1P4OvSL6BUdYzpmKbM/MzzfZCpqirryqP2nVSEYJTz
 YLcjoQtXBg0Sw==
Received: by mail-ed1-f50.google.com with SMTP id h13so2145395eds.5
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Apr 2021 07:15:52 -0700 (PDT)
X-Gm-Message-State: AOAM530EfXB8vgE8XVw903X1923Fx7HWFeZDIBrAKQEvC4v9t3KWCqwm
 2ZxnQ6DexApll6MCvIGjAZzdR/VKO5jaPm7KCw==
X-Google-Smtp-Source: ABdhPJx/x1Pvir9uz6tNOKEPJelZRcuER41Ie69i0uJGB6GBrIi38rDSfnM6IWWeLRt5oSU65aB9EXkOeJfnHtfghlI=
X-Received: by 2002:a05:6402:b48:: with SMTP id
 bx8mr10450006edb.162.1617286551463; 
 Thu, 01 Apr 2021 07:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 1 Apr 2021 22:15:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9n-VVPPEfLag7uVuPG+iM_NWccWgbyC3Eo9+DGYyz=Gw@mail.gmail.com>
Message-ID: <CAAOTY_9n-VVPPEfLag7uVuPG+iM_NWccWgbyC3Eo9+DGYyz=Gw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] drm/mediatek: Don't support hdmi connector creation
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_151556_449397_7C07D793 
X-CRM114-Status: GOOD (  13.64  )
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

SGksIERhZm5hOgoKRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEu
Y29tPiDmlrwgMjAyMeW5tDPmnIgzMOaXpSDpgLHkuowg5LiL5Y2INzowOeWvq+mBk++8mgo+Cj4g
Y29tbWl0IGYwMTE5NTE0ODk2NyAoImRybS9tZWRpYXRlazogbXRrX2RwaTogQ3JlYXRlIGNvbm5l
Y3RvciBmb3IgYnJpZGdlcyIpCj4gYnJva2UgdGhlIGRpc3BsYXkgc3VwcG9ydCBmb3IgZWxtIGRl
dmljZSBzaW5jZSBtdGtfZHBpIGNhbGxzCj4gZHJtX2JyaWRnZV9hdHRhY2ggd2l0aCB0aGUgZmxh
ZyBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IKPiB3aGlsZSBtdGtfaGRtaSBkb2VzIG5v
dCB5ZXQgc3VwcG9ydCB0aGlzIGZsYWcuCgpGb3IgdGhpcyBzZXJpZXMsIGFwcGxpZWQgdG8gbWVk
aWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVk
aWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gVGhlc2UgdGhyZWUgcGF0
Y2hlcyBmaXggdGhhdCBieSBhZGRpbmcgc3VwcG9ydCBmb3IgRFJNX0JSSURHRV9BVFRBQ0hfTk9f
Q09OTkVDVE9SCj4gaW4gbXRrX2hkbWkgYnJpZGdlIGF0dGFjaG1lbnQuCj4KPiBjaGFuZ2VzIHNp
bmNlIHYyOgo+IDEuIHNxdWFzaCBwYXRjaCAzIHdpdGggcGF0Y2ggMiB0byBub3QgYnJlYWsgYmlz
ZWN0aW9uCj4gMi4gcmVtb3ZlIHRoZSBmdW50aW9uIG10a19oZG1pX2dldF9lZGlkIGFuZCBpbmxp
bmUgaXRzIGNvZGUgaW4gbXRrX2hkbWlfYnJpZGdlX2dldF9lZGlkCj4gMy4gc21hbGwgYWxpZ21l
bnQKPgo+IGNoYW5nZXMgc2luY2UgdjE6Cj4gMS4gc3BsaXQgdGhlIGZpcnN0IHBhdGNoIC0gbm93
IHRoZSBmaXJzdCBwYXRjaCBvbmx5IG1vdmVzIHRoZSBicmlkZ2Ugb3BzIHRvIHRoZSBhdG9taWMg
QVBJCj4gd2hpbGUgdGhlIHJlcGxhY2VtZW50IG9mIHRoZSBmaWVsZCAnY29ubicgd2l0aCB0aGUg
ZmllbGQgJypjdXJyX2Nvbm4nIGlzIGRvbmUgaW4gYSBuZXcgdGhpcmQgcGF0Y2guCj4gMi4gaW4g
dGhlIGZ1bmN0aW9uICdnZXRfZWxkJyB1c2UgdGhlIGN1cnJlbnQgY29ubiBvbmx5IGlmICdlbmFi
bGVkID0gdHJ1ZScuCj4KPiBEYWZuYSBIaXJzY2hmZWxkICgyKToKPiAgIGRybS9tZWRpYXRlazog
U3dpdGNoIHRoZSBoZG1pIGJyaWRnZSBvcHMgdG8gdGhlIGF0b21pYyB2ZXJzaW9ucwo+ICAgZHJt
L21lZGlhdGVrOiBEb24ndCBzdXBwb3J0IGhkbWkgY29ubmVjdG9yIGNyZWF0aW9uCj4KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCAxNzQgKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgMTAzIGRlbGV0
aW9ucygtKQo+Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
