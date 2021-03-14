Return-Path: <SRS0=n982=IM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD049C433E6
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 01:43:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5716964ED0
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 01:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5716964ED0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Eezm8risdPojZZy1pDZmboXuxF+fdeTy3CJ39P3ZpTo=; b=DBseRpOJX3Wecveu1491JJjqr
	SlCqja3O3N4zGEbHDRtpkaRu6W+tokhQBpV8UJ+t18eTTufPWc9gE9Q+KM6r5RgYKmhos119HooOF
	qdGHTfwsgnkxyexDbOsqbnCz3R126+m0rcJ03kqbvjz69d7KcW3vHdn41+Np80fIyLJseSHvfTsaC
	VAaVmRZerYSrzL1ad45Wh6IhkocneEAc5PAt6Y+icuKOEwR+SzbH8ZHJX4pofj4WlUkofcc6XQarK
	6ZpLUB2aZ/HgaJ4vCdZBzdFc4oRchSZ59foBBnadr2TZEVQ8bWDI+jfcqXzWL9yNZmtdBa6LG6uov
	jmbIWVOlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLFmY-00DnMS-1q; Sun, 14 Mar 2021 01:43:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLFmL-00DnKt-QL; Sun, 14 Mar 2021 01:42:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56FBF64E58;
 Sun, 14 Mar 2021 01:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615686167;
 bh=d8r78DmHZoQq/Xpde3tw/rQjLBC2qxYXAEfmbWF2bP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fakOty/OHbvQxSv2CtMch+TMWS3l3uxOlWFWgIOsf5/SWb4lrzStEhsizPP5RLg6V
 Q+pvjsfXPOJPtRs1KgdewqNbHbyKeO2zjqT4o58dbM0DuaxkibyaU2wvOchRXcgF/H
 y9yxakpcigDKbdLQcPyKJWjSNHmS8ooxB3BFyCXRq07lXU4S+/4EKgtQgcVzo7HfR8
 1wIF9lLesMSM5zYdUo1NRs2sGDtH8V1qbVUDk7OM1k0tA+n+5XLKwE0ZX8K/dIZYni
 /hWCSNVE/Madwf4ON7yaoghCRkgdXGRVz4l+N1jmibwnPiyLdkwcwvj+xQHGhCju2j
 GuE1gKc+EAjuA==
Received: by mail-ej1-f51.google.com with SMTP id r17so60503773ejy.13;
 Sat, 13 Mar 2021 17:42:47 -0800 (PST)
X-Gm-Message-State: AOAM533hsal7Ug4ZsByATnjJTx4ieKkeZycDqGmKfx/jeVrQZj3BBI0n
 HimvaJcqX7hO5sVTnuAwCAjre8+7BFaNAzcrLQ==
X-Google-Smtp-Source: ABdhPJwt7yggnfbLt0nEaJTQ57OcD/f1c2ihvZExUaKqy5DsREVzfjShGFYpeA+UzbmIb8LIcItruBFVhr25lUHDo/U=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr16649455ejy.63.1615686165972; 
 Sat, 13 Mar 2021 17:42:45 -0800 (PST)
MIME-Version: 1.0
References: <1615621683-2122-1-git-send-email-wangqing@vivo.com>
In-Reply-To: <1615621683-2122-1-git-send-email-wangqing@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 14 Mar 2021 09:42:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY__77A5ckALr=dxXK4zV3sbm_84_m9Bo0nBKBxPMMv2sxQ@mail.gmail.com>
Message-ID: <CAAOTY__77A5ckALr=dxXK4zV3sbm_84_m9Bo0nBKBxPMMv2sxQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: mediatek: delete redundant printing of return
 value
To: Wang Qing <wangqing@vivo.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_014250_105275_77EF834C 
X-CRM114-Status: GOOD (  14.45  )
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

SGksIFdhbmc6CgpXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29tPiDmlrwgMjAyMeW5tDPmnIgx
M+aXpSDpgLHlha0g5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gcGxhdGZvcm1fZ2V0X2lycSgpIGhh
cyBhbHJlYWR5IGNoZWNrZWQgYW5kIHByaW50ZWQgdGhlIHJldHVybiB2YWx1ZSwKPiB0aGUgcHJp
bnRpbmcgaGVyZSBpcyBub3RoaW5nIHNwZWNpYWwsIGl0IGlzIG5vdCBuZWNlc3NhcnkgYXQgYWxs
LgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8uY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYwo+IGluZGV4IGIwNWY5MDAuLjBhYzQ5NjIKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwo+IEBAIC03NTEsMTAgKzc1MSw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgfQo+Cj4gICAgICAgICBkcGkt
PmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gLSAgICAgICBpZiAoZHBpLT5pcnEg
PD0gMCkgewo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgaXJx
OiAlZFxuIiwgZHBpLT5pcnEpOwo+ICsgICAgICAgaWYgKGRwaS0+aXJxIDw9IDApCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IC0gICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBk
cm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoZGV2LT5vZl9ub2RlLCAwLCAwLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsICZkcGktPm5leHRfYnJpZGdl
KTsKPiAtLQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
