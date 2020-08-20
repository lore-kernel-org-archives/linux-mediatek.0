Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72686C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:44:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C3BA2072D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0D6Cls4B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh7RPShu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C3BA2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IkhrxnEh5hC7wEvEyjI7C3XtSH9zqYANYRFZh+J7DO0=; b=0D6Cls4BFyREIIxWVomr8n7wf
	q2OXwOQUL8/GU2gKlgAlUr9P91/b4lQeGBeck8FSxQ/f2DUs5eho1buHwuuAbLpqhX2QRn9sYzYLj
	MGERQsNYrlS+IQwEKnwLpACCA2fsiBADMZR3PVQg+Bm4DBNCDpk6HnmjrhXWqAjVN+ASSIPvXvEfN
	BeDupcCbEAFV36mDPC2A5vPv00bLvCMpdbDz2n17F0cuaoKb7aDoQCfxfZJecNj1UcJ1NafiPBDSc
	HTxSZH/uXWxRpDN6faQIUWz0XDBbML0chRuo7ZilWfnJgfCM3uk5QjK1pZZ2+1y0UHiyIOR8Ys8zr
	5KyNH5zAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8uDt-0004VZ-Gv; Thu, 20 Aug 2020 23:43:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8uDn-0004T0-Ie; Thu, 20 Aug 2020 23:43:53 +0000
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 680FB2184D;
 Thu, 20 Aug 2020 23:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597967030;
 bh=12Z/1F9ynfQG7TePTBeyr3mih++Uy7SZRp4TeFeFs00=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Zh7RPShu8RDbXHSq/oO4RIrP7wWBy3WN/odPT+2RPzaYmOP++iCWgSxuDuz7TTrd3
 u/rZq9S0bOYAjczwn4IXAUllxtXntn5divU1ss+SS2VPiDDLGc4BJDg+kWq9wRyLDd
 upGN6rew7AYY0LKvqeSxDvRU14iudWvSn7Kglwvw=
Received: by mail-ej1-f48.google.com with SMTP id a26so259179ejc.2;
 Thu, 20 Aug 2020 16:43:50 -0700 (PDT)
X-Gm-Message-State: AOAM530/3A1Ad3iGX+aRQrxat8qribVZtctCxBJ/ftq4kHTaYUwOs/s0
 KV3x4PjOiEqT0yZxN0W2MOajMvui+gppLGqVOQ==
X-Google-Smtp-Source: ABdhPJwvENKIDffOUlwzID4Z1RX/ZzTkvvhpMC6nA358MClEWoZg7KM+bFIxElWhuhPq+Q71kLgNBHiZNim6++NVVE4=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr178889ejl.375.1597967028984; 
 Thu, 20 Aug 2020 16:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-8-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:43:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8LnY3Tbzhmeia5DS7o1WAxd0kz9oVCeKLvwNCn48j_Dg@mail.gmail.com>
Message-ID: <CAAOTY_8LnY3Tbzhmeia5DS7o1WAxd0kz9oVCeKLvwNCn48j_Dg@mail.gmail.com>
Subject: Re: [PATCH v1 07/21] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_194351_790731_3B8E4301 
X-CRM114-Status: GOOD (  19.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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

SEksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjowNuWvq+mBk++8mgo+Cj4gZW5h
YmxlIE9WTF9MQVlFUl9TTUlfSURfRU4gZm9yIG11bHRpLWxheWVyIHVzZWNhc2UKPgo+IFNpZ25l
ZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCAzICsrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bC5jCj4gaW5kZXggOGNmOWYzYi4uNDI3ZmU3ZiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBAQCAtMjMsNiArMjMsNyBAQAo+ICAjZGVm
aW5lIERJU1BfUkVHX09WTF9SU1QgICAgICAgICAgICAgICAgICAgICAgIDB4MDAxNAo+ICAjZGVm
aW5lIERJU1BfUkVHX09WTF9ST0lfU0laRSAgICAgICAgICAgICAgICAgIDB4MDAyMAo+ICAjZGVm
aW5lIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04gICAgICAgICAgICAgIDB4MDAyNAo+ICsjZGVm
aW5lIE9WTF9MQVlFUl9TTUlfSURfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDAp
Cj4gICNkZWZpbmUgT1ZMX0JHQ0xSX1NFTF9JTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoMikKPiAgI2RlZmluZSBESVNQX1JFR19PVkxfUk9JX0JHQ0xSICAgICAgICAgICAgICAg
ICAweDAwMjgKPiAgI2RlZmluZSBESVNQX1JFR19PVkxfU1JDX0NPTiAgICAgICAgICAgICAgICAg
ICAweDAwMmMKPiBAQCAtMTE2LDYgKzExNyw4IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfZGlzYWJs
ZV92Ymxhbmsoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiAgc3RhdGljIHZvaWQgbXRrX292
bF9zdGFydChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+ICB7Cj4gICAgICAgICB3cml0ZWxf
cmVsYXhlZCgweDEsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfRU4pOwo+ICsgICAgICAgbXRr
X2RkcF93cml0ZV9tYXNrKE5VTEwsIE9WTF9MQVlFUl9TTUlfSURfRU4sIGNvbXAsCgp3cml0ZWxf
cmVsYXhlZCBpbnN0ZWFkIG9mIG10a19kZHBfd3JpdGVfbWFzay4KCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTiwgT1ZMX0xBWUVSX1NNSV9JRF9F
Tik7CgpJZiB0aGlzIG9ubHkgc2hvdWxkIHNldCBpbiBtdDgxOTIsIGFkZCBhIHByaXZhdGUgZGF0
YSB0byBkaXN0aW5ndWlzaCB0aGlzLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gIH0KPgo+ICBz
dGF0aWMgdm9pZCBtdGtfb3ZsX3N0b3Aoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiAtLQo+
IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
