Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71831C6377A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 00:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 293D26124B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 00:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 293D26124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PyuY2NcstzyA+ntPf1EpiXRpP9MRGFQRjPAeEkbWeY=; b=Ztrtm8sHC/vhGx
	wHsyd0v2uzfdznl6fI6zg6rnBDgmab5yQwqz/i9Ih5UBKRPqByXBHp3TkSZAKq1Dgba8ea2eVaptR
	9R5BvjT4ybzl/Pvw1BM66/SmQ7WcVsRvo1gDmgrJuwt+g+0hUJNMMq0KehYGg39pWb5JQSoGAtHW1
	fDBcTDMAMm8LIhu06CDURBBFpfUTvd7o7RjxAUWh2YD0xsTxY+bmaD6q/r4g6zpC/Tr89RNJd7FhF
	EQwsyH/AOqxGH1c0c1Gj0LQQaOPP3WLhAyWRPJVOlkx7MzpTnl4j9rbXFV1K8G96HyYrNy/+Wv6Me
	rpQW0pV7upl0dUDw+nhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Mnr-00HUCt-4Q; Thu, 22 Jul 2021 00:43:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Mne-00HUBM-6z; Thu, 22 Jul 2021 00:42:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFF0A6124B;
 Thu, 22 Jul 2021 00:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626914572;
 bh=5gUuCHYoyXnxCTWjadK1ob5ANKNp6RQJVZAT7k9rS0o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FYHaJgCwwBDQfKT43ZcZrVpiPXWAlknCbCDxwcwgOkS3OV8dfY5fbxqlE9xftqXFn
 QYFKzhtAgo2xkQSyuN0UtgqJMgtyyb8RX9M4ECyz9a7x0y+Mk7ylts6oCUVc64H6BE
 4Evov4uuMQEhK40iWmj0oPxH0RbnxKdw8h0SZaB2IjvC1nIHjfwc/2XGT/KfZNzfyA
 gc9tcVs/52Qxaw1x5j6MsmoTOvuoXeihwyQNj4A8qkLUCXeIbzL7X7/GWMktU0sc7z
 GyhMvv9zdIKPjJxW71g9Id+XQ8RKvCVL6g3AuuCXgd0e+v+qj/bvtzaiZVZAtNh25o
 r7/+87x19VhNQ==
Received: by mail-ej1-f52.google.com with SMTP id ga14so5908460ejc.6;
 Wed, 21 Jul 2021 17:42:52 -0700 (PDT)
X-Gm-Message-State: AOAM5309bbmSJxohm/4Vy8xuqQWrqzo5j2a1eq9Xv32GxeeXp6SH4ne3
 u5qn0C7Fy59uwU9FnUV8mza9IiSQnXIY0vXDig==
X-Google-Smtp-Source: ABdhPJyKf32KGYOx7/x5mSfSzBsftSabCd3owtHAjkGVEslJ3jlOd7OwePiukXqfZBwKpfVyyVggxJVBTrUCUsVgD+I=
X-Received: by 2002:a17:906:27da:: with SMTP id
 k26mr41548451ejc.267.1626914571435; 
 Wed, 21 Jul 2021 17:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210712080736.116435-1-linux@fw-web.de>
In-Reply-To: <20210712080736.116435-1-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Jul 2021 08:42:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY__rhehy6CG=A-0bEqn1-mCLh-xsz9UQ6dntCC69z4nvgw@mail.gmail.com>
Message-ID: <CAAOTY__rhehy6CG=A-0bEqn1-mCLh-xsz9UQ6dntCC69z4nvgw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dpi: fix NULL dereference in
 mtk_dpi_bridge_atomic_check
To: Frank Wunderlich <linux@fw-web.de>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Frank Wunderlich <frank-w@public-files.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_174254_323417_A0114CD3 
X-CRM114-Status: GOOD (  16.29  )
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

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMeW5
tDfmnIgxMuaXpSDpgLHkuIAg5LiL5Y2INDowOOWvq+mBk++8mgo+Cj4gRnJvbTogRnJhbmsgV3Vu
ZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+Cj4KPiBicmlkZ2UtPmRyaXZlcl9wcml2
YXRlIGlzIG5vdCBzZXQgKE5VTEwpIHNvIHVzZSBicmlkZ2VfdG9fZHBpKGJyaWRnZSkKPiBsaWtl
IGl0J3MgZG9uZSBpbiBicmlkZ2VfYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMKCkFwcGxpZWQg
dG8gbWVkaWF0ZWstZHJtLWZpeGVzIFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9n
Lz9oPW1lZGlhdGVrLWRybS1maXhlcwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBGaXhlczog
ZWM4NzQ3YzUyNDM0ICgiZHJtL21lZGlhdGVrOiBkcGk6IEFkZCBidXMgZm9ybWF0IG5lZ290aWF0
aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1m
aWxlcy5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBpbmRleCBiY2VkNTU1NjQ4YjAuLmEyZWNhMWY2
Njk4NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC02MDUsNyArNjA1
LDcgQEAgc3RhdGljIGludCBtdGtfZHBpX2JyaWRnZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9i
cmlkZ2UgKmJyaWRnZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUp
Cj4gIHsKPiAtICAgICAgIHN0cnVjdCBtdGtfZHBpICpkcGkgPSBicmlkZ2UtPmRyaXZlcl9wcml2
YXRlOwo+ICsgICAgICAgc3RydWN0IG10a19kcGkgKmRwaSA9IGJyaWRnZV90b19kcGkoYnJpZGdl
KTsKPiAgICAgICAgIHVuc2lnbmVkIGludCBvdXRfYnVzX2Zvcm1hdDsKPgo+ICAgICAgICAgb3V0
X2J1c19mb3JtYXQgPSBicmlkZ2Vfc3RhdGUtPm91dHB1dF9idXNfY2ZnLmZvcm1hdDsKPiAtLQo+
IDIuMjUuMQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
