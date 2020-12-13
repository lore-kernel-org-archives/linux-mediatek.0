Return-Path: <SRS0=dVWc=FR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F1CC4361B
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Dec 2020 01:15:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC8E7207D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Dec 2020 01:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC8E7207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CjrFXPE0jEyG+gR/N3mPGWVI7wvjyH+khfCNT8A2mJA=; b=gjEpUykwjXkCIUOmZS2iM467i
	88YM7+F2LsDcYStWEzCyAlfUQ2PitBVJ1U8Z3pagpVHsGOsYAkM4CtvHFHZidUQwR9nHr0zz3WAJw
	3ff/xcKnpYWVoBpttjC069N6GV339doT7s3Nr8DKUWKE/C/abO0Ho6oGpqiRfdLFeXgkKi+J7Ki/w
	smu8EBadzM+ThraVXuDsGqVYg3RIFfaKeQpGquvvYSzgG3OK8NmojTuXZKOCqzkTZMHWH8J6sxCOJ
	kQ7/uSXPQ9xKHrutL4S2JlyDIhFYCSjcaDmy4TLYI9DNt1WkxMK4l7mpXfXhMIfj6URhbnY19JIrk
	kkaMxUt+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koFyx-0004sU-P0; Sun, 13 Dec 2020 01:15:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koFys-0004rR-6R; Sun, 13 Dec 2020 01:15:23 +0000
X-Gm-Message-State: AOAM532p1d6eT4pvHNchUdekjbKTWVW62ElDzejABfzVQkNtWcEIrVTe
 vLkeGBKN2uunQo/1hV1nNuQP7X5ZRLfmhlIuLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607822118;
 bh=DuuvSYAgKQaNskB+hKM10xoonyLBpgBKY3lVUg/jzKM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mGfFiGHPZ+0K8oG5EitT1rP0Ln7RvsH4jvAjTD/RVWb71OgL+ZTr8BAXiI21Spjtg
 duuylj1rz9UqQjR3OJ+PXojw0hlVngPLz7cKAwS+YQGKYol99bj1NnYaWyF6bRdPqh
 oMJFtI1YvBDFzij0buLUhDhZQMQPcLu821pavPB//cyYkhoY25h0sYconPs7MadNiv
 TqySZQHNs2nxx3QOzCBpq/G9G2Lp2Dc5z8p2lgEYYge3m/bv6wyc6gkmKtZoa1wNtK
 FEuO4I+UZDyJr/vU9Xk539Ta9f7YLNrRYFVYZwiFCDvZzqFaNMuJa5mxIbETRGhxX3
 y9smBV9qObshA==
X-Google-Smtp-Source: ABdhPJxwatlJb+8VRQZCMPRl8VIOjuxvSaZJuqeloLzJDD7QgR6XPq6bmpgZNV+0chJV9VkJ7Cdgd5MYWpjqub7z4kY=
X-Received: by 2002:a17:907:414c:: with SMTP id
 od20mr16781511ejb.75.1607822116713; 
 Sat, 12 Dec 2020 17:15:16 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-5-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 13 Dec 2020 09:15:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8bsmRtt9Kpd1__iEuPJ3Ox7jbn_yXnUeUoj041AhjSkQ@mail.gmail.com>
Message-ID: <CAAOTY_8bsmRtt9Kpd1__iEuPJ3Ox7jbn_yXnUeUoj041AhjSkQ@mail.gmail.com>
Subject: Re: [PATCH v2, 04/17] drm/mediatek: add component OVL_2L2
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201212_201522_531382_3628109E 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEy5a+r6YGT77yaCj4KPiBU
aGlzIHBhdGNoIGFkZCBjb21wb25lbnQgT1ZMXzJMMgoKQnJlYWsgZHJtIHBhcnQgYW5kIHNvYyBw
YXJ0IGludG8gZGlmZmVyZW50IHBhdGNoZXMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNp
Z25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMSAr
Cj4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oICAgICAgfCAxICsKPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IGluZGV4IDhlYmE0NGIuLjg5Mzg1NTQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBAQCAtNDAz
LDYgKzQwMyw3IEBAIHN0cnVjdCBtdGtfZGRwX2NvbXBfbWF0Y2ggewo+ICAgICAgICAgW0REUF9D
T01QT05FTlRfT1ZMMV0gICAgPSB7IE1US19ESVNQX09WTCwgICAgICAgMSwgTlVMTCB9LAo+ICAg
ICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMF0gPSB7IE1US19ESVNQX09WTF8yTCwgICAgMCwg
TlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMV0gPSB7IE1US19ESVNQX09W
TF8yTCwgICAgMSwgTlVMTCB9LAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMl0gPSB7
IE1US19ESVNQX09WTF8yTCwgICAgMiwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRf
UFdNMF0gICAgPSB7IE1US19ESVNQX1BXTSwgICAgICAgMCwgTlVMTCB9LAo+ICAgICAgICAgW0RE
UF9DT01QT05FTlRfUFdNMV0gICAgPSB7IE1US19ESVNQX1BXTSwgICAgICAgMSwgTlVMTCB9LAo+
ICAgICAgICAgW0REUF9DT01QT05FTlRfUFdNMl0gICAgPSB7IE1US19ESVNQX1BXTSwgICAgICAg
MiwgTlVMTCB9LAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gaW5kZXgg
NGI2YzUxNC4uNDI0NzZjMiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5
cy5oCj4gQEAgLTI5LDYgKzI5LDcgQEAgZW51bSBtdGtfZGRwX2NvbXBfaWQgewo+ICAgICAgICAg
RERQX0NPTVBPTkVOVF9PVkwwLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkxfMkwwLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9PVkxfMkwxLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkxf
MkwyLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkwxLAo+ICAgICAgICAgRERQX0NPTVBPTkVO
VF9QV00wLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00xLAo+IC0tCj4gMS44LjEuMS5kaXJ0
eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
