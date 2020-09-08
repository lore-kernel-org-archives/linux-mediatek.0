Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2156C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 23:00:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E06D205F4
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 23:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tApbR1SS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVBq29fR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E06D205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A3gOK4eIAF/7Ow8xcYTS3ilDEms+44T2vmvRdEll2S8=; b=tApbR1SSm1xoBa4jpEBmDKbbz
	RhfzS/EQGOVpOa8m6ceHQqEYSvnbP3Fk1U/iywrSYwfE55RBr+rgrDTSyalokpjgHC3pHaNDr6LQ3
	IEOmV5PaCH3VFLOjEjxkCNylfSfgWROJSSsJbXBAi9H1gKv6MyirJmGXOVrV32Y1hJeyhUgNAbeLp
	D9v15AR7BT+Ci91DOfeu+xsSAvecPYsiWKrxMhAY4ZIWGFqlrYj23aqPxJ9OxFtoUIPMFPfFhPtak
	FB44PZuX42HmgtkOdtk2XD16pq27gYpLxhxkr1WcMGCgfG0w0zgJuKcRBnsg82b9Gw1cjkFB4GBlC
	rfPx32Z4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFmbS-000665-NQ; Tue, 08 Sep 2020 23:00:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFmbP-000659-NX
 for linux-mediatek@lists.infradead.org; Tue, 08 Sep 2020 23:00:40 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C930C21741
 for <linux-mediatek@lists.infradead.org>; Tue,  8 Sep 2020 23:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599606038;
 bh=kitxeKqTb1SkttblH1PFR/F1RSZAOgchGlw4pmXLPR4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tVBq29fRvmgkUXqxtVlm1rv0uHT4MUPp1xMvHuV1D1PBfL8JsX2z9h9MaOwikARcG
 TMy632/+ui+jSUSg2LS8DlwAfVWVl2KI4fIdyXZZVaXr9dCE1TzkXbDxRvfm8ARw5b
 TjUN3NvzpAV3wyNEiXREwDiQR0y8E8RA0WI7cxSQ=
Received: by mail-ed1-f42.google.com with SMTP id i1so751407edv.2
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2020 16:00:37 -0700 (PDT)
X-Gm-Message-State: AOAM531uzBvDVoLwKbFjJeGirWnULNClGVvwIdwmIDIQOOs3b0bTa5U9
 cv2mPGVOfg2wLISOdGB8lA7pA+CIGahbcKZ3lg==
X-Google-Smtp-Source: ABdhPJyPiIdQrdq1PbYXe0iA9zr48itBPN3RHIQwoJr3R0CaiWDz9cHj2oGQBCui9qdbPA6GuRLYiCuHQpDGngRMWok=
X-Received: by 2002:aa7:c158:: with SMTP id r24mr1265632edp.61.1599606036304; 
 Tue, 08 Sep 2020 16:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200902220542.60-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200902220542.60-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 9 Sep 2020 07:00:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__aLb+mm1v5bCRVTaOGM7Q=pyc0t995kmMY23ktqs3OkA@mail.gmail.com>
Message-ID: <CAAOTY__aLb+mm1v5bCRVTaOGM7Q=pyc0t995kmMY23ktqs3OkA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Use CPU when fail to get cmdq event
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_190039_884958_30002A86 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0OeaciDPm
l6Ug6YCx5ZubIOS4iuWNiDY6MDblr6vpgZPvvJoKPgo+IEV2ZW4gdGhvdWdoIGNtZHEgY2xpZW50
IGlzIGNyZWF0ZWQgc3VjY2Vzc2Z1bGx5LCB3aXRob3V0IHRoZSBjbWRxIGV2ZW50LAo+IGNtZHEg
Y291bGQgbm90IHdvcmsgY29ycmVjdGx5LCBzbyB1c2UgQ1BVIHdoZW4gZmFpbCB0byBnZXQgY21k
cSBldmVudC4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLWZpeGVzIFsxXS4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGlu
dXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tZml4ZXMKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gRml4ZXM6IDYwZmE4YzEzYWIxYSAoImRybS9tZWRpYXRlazogTW92ZSBnY2UgZXZlbnQgcHJv
cGVydHkgdG8gbXV0ZXggZGV2aWNlIG5vZGUiKQo+IFNpZ25lZC1vZmYtYnk6IENodW4tS3Vhbmcg
SHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAyMCArKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCAzZmM1NTExMzMwYjkuLjRkMjk1Njhi
ZTNmNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAt
ODMxLDEzICs4MzEsMTkgQEAgaW50IG10a19kcm1fY3J0Y19jcmVhdGUoc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2NydGNfaW5kZXgoJm10
a19jcnRjLT5iYXNlKSk7Cj4gICAgICAgICAgICAgICAgIG10a19jcnRjLT5jbWRxX2NsaWVudCA9
IE5VTEw7Cj4gICAgICAgICB9Cj4gLSAgICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9p
bmRleChwcml2LT5tdXRleF9ub2RlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIm1lZGlhdGVrLGdjZS1ldmVudHMiLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtdGtfY3J0Yy0+Y21kcV9ldmVu
dCk7Cj4gLSAgICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICBkZXZfZGJnKGRldiwgIm10
a19jcnRjICVkIGZhaWxlZCB0byBnZXQgbWVkaWF0ZWssZ2NlLWV2ZW50cyBwcm9wZXJ0eVxuIiwK
PiAtICAgICAgICAgICAgICAgICAgICAgICBkcm1fY3J0Y19pbmRleCgmbXRrX2NydGMtPmJhc2Up
KTsKPiArCj4gKyAgICAgICBpZiAobXRrX2NydGMtPmNtZHFfY2xpZW50KSB7Cj4gKyAgICAgICAg
ICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KHByaXYtPm11dGV4X25vZGUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtZWRp
YXRlayxnY2UtZXZlbnRzIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm10a19jcnRjLT5jbWRxX2V2
ZW50KTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRldl9kYmcoZGV2LCAibXRrX2NydGMgJWQgZmFpbGVkIHRvIGdldCBtZWRpYXRlayxnY2Ut
ZXZlbnRzIHByb3BlcnR5XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJt
X2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y21kcV9tYm94X2Rlc3Ryb3kobXRrX2NydGMtPmNtZHFfY2xpZW50KTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBtdGtfY3J0Yy0+Y21kcV9jbGllbnQgPSBOVUxMOwo+ICsgICAgICAgICAgICAg
ICB9Cj4gKyAgICAgICB9Cj4gICNlbmRpZgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAtLQo+
IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
