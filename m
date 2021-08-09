Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A643CC4320A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 14:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E4FF60F6F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 14:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E4FF60F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yw1EBapwRZI6XUIkpSdsmBTHsg6vI6Qi4PZDmLcNz38=; b=C/HpoUARPf0AdP
	aEJ/K5mVzUbG/ANpuVhGPLKCqQ27OvwsUSjRjzIUBPojRtHCxfqeHXozjIWfKTuKA1LuFzjq8sIiC
	uH9WVwUFxk7lYxxgUStnBOvTc2M1EhsQLX92auOOxnuRyGKXzy6cHH74gv8UEVqO4JvI/Vo/12r1Y
	D41U6LSVS3Kuph4PL1yu0SFLOSaRZQfPSXEjRnttfMQ8ilpwusS6bmlD8jlKkvAXOVaF5ZCFK2KnD
	U3293RTgyqvPtB4n6A943Cl8Sse6ibRUTqq35qVA+G7oR3MwzrCybq9b51onlSNmElIn3TZc1/4gP
	aqg7HWS01xJZy9hr1X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD68t-000u8v-HI; Mon, 09 Aug 2021 14:20:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD68q-000u8A-Si
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 14:20:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6565E60F93
 for <linux-mediatek@lists.infradead.org>; Mon,  9 Aug 2021 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628518836;
 bh=9LRxU88+82ajaf5N6re5+zCpHlo2zfOM8jRPwlMyA2s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ep1D8MWdd6qsC45+D94384qcGF3wKXMIn7Os6ajx0NHL0Ep01DPyMIFC71U5rYshE
 u/j4I5uCgr+Sug9+s5OeI3hwcumOW4ixjMblUxLUleLh4udWT2k6nFj07zB0zVCAmE
 NacXoSks7Xri5KXRtpHNxKGQ7cS8znosje7vuiBgEkk6sU7TolvfWlwM+D0vrkQyzu
 gnkLB4muB40f3mngZtJtHPhjYRuS5uxbaFDJ9eSg/+a/2GzaXgap4J+yVS2CzL0Mx+
 +Nk2lFIfI6PF1BCGDtAJBh8oH9RoejiTDR6gK0qmbMKUaBpAXrX4nrsntChRrqzS6K
 vDRL9pAwqh5+g==
Received: by mail-ej1-f44.google.com with SMTP id go31so29283661ejc.6
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Aug 2021 07:20:36 -0700 (PDT)
X-Gm-Message-State: AOAM5315mQNy6EEs+S3dWb3dWvrGX57jUrhK6klzxw3CNk+b0ifDIJQC
 35Qg8EDcq3HICK2NaOk9Vvhe2vekP7kExY/e3g==
X-Google-Smtp-Source: ABdhPJzx0TkKSySgoxITRUizZYSlaMcXitMA6PjSwWV3of8/FHgQGibBSMEC+8T7JOaUryygvDhhlA38CwdbCmy0Cis=
X-Received: by 2002:a17:906:fcd7:: with SMTP id
 qx23mr9314897ejb.267.1628518834966; 
 Mon, 09 Aug 2021 07:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210712181209.27023-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210712181209.27023-1-dafna.hirschfeld@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 22:20:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY__vy0n_Sw+8a_4h7Er_qdt72x964Dc_uunLg88qx8wPGg@mail.gmail.com>
Message-ID: <CAAOTY__vy0n_Sw+8a_4h7Er_qdt72x964Dc_uunLg88qx8wPGg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Test component initialization earlier in
 the function mtk_drm_crtc_create
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
X-CRM114-CacheID: sfid-20210809_072037_001372_2F7589E1 
X-CRM114-Status: GOOD (  18.74  )
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
Y29tPiDmlrwgMjAyMeW5tDfmnIgxM+aXpSDpgLHkuowg5LiK5Y2IMjoxMuWvq+mBk++8mgo+Cj4g
VGhlIGluaXRpYWxpemF0aW9uIGlzIGN1cnJlbnRseSB0ZXN0ZWQgaW4gYSBsYXRlciBzdGFnZSBp
bgo+IHRoZSBmdW5jdGlvbiBmb3Igbm8gcmVhc29uLgo+IEluIGFkZGl0aW9uLCB0aGUgdGVzdCAn
IWNvbXAnIHdpbGwgbmV2ZXIgZmFpbCBzaW5jZSBjb21wIGlzCj4gc2V0IHdpdGggdGhlICcmJyBv
cGVyYXRvci4gSW5zdGVhZCwgdGVzdCBpZiBhIGNvbXAgd2FzIG5vdAo+IGluaXRpYWxpemVkIGJ5
IHRlc3RpbmcgIiFjb21wLT5kZXYiLgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0s
IHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYWZuYSBIaXJzY2hmZWxkIDxk
YWZuYS5oaXJzY2hmZWxkQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCA0NzRlZmI4NDQyNDkuLjA2ZjQwZTU4OTky
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAtNzU1
LDE0ICs3NTUsMjIgQEAgaW50IG10a19kcm1fY3J0Y19jcmVhdGUoc3RydWN0IGRybV9kZXZpY2Ug
KmRybV9kZXYsCj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgcGF0aF9sZW47IGkrKykgewo+ICAg
ICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBjb21wX2lkID0gcGF0aFtpXTsKPiAg
ICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlOwo+ICsgICAgICAgICAgICAg
ICBzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wOwo+Cj4gICAgICAgICAgICAgICAgIG5vZGUgPSBw
cml2LT5jb21wX25vZGVbY29tcF9pZF07Cj4gKyAgICAgICAgICAgICAgIGNvbXAgPSAmcHJpdi0+
ZGRwX2NvbXBbY29tcF9pZF07Cj4gKwo+ICAgICAgICAgICAgICAgICBpZiAoIW5vZGUpIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXZfaW5mbyhkZXYsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIk5vdCBjcmVhdGluZyBjcnRjICVkIGJlY2F1c2UgY29tcG9uZW50ICVk
IGlzIGRpc2FibGVkIG9yIG1pc3NpbmdcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGlwZSwgY29tcF9pZCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gICAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGlmICghY29tcC0+ZGV2
KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJDb21wb25lbnQgJXBP
RiBub3QgaW5pdGlhbGl6ZWRcbiIsIG5vZGUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PREVWOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiAgICAgICAg
IG10a19jcnRjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCptdGtfY3J0YyksIEdGUF9LRVJO
RUwpOwo+IEBAIC03ODcsMTYgKzc5NSw4IEBAIGludCBtdGtfZHJtX2NydGNfY3JlYXRlKHN0cnVj
dCBkcm1fZGV2aWNlICpkcm1fZGV2LAo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG10a19jcnRj
LT5kZHBfY29tcF9ucjsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21w
X2lkIGNvbXBfaWQgPSBwYXRoW2ldOwo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9j
b21wICpjb21wOwo+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7Cj4K
PiAtICAgICAgICAgICAgICAgbm9kZSA9IHByaXYtPmNvbXBfbm9kZVtjb21wX2lkXTsKPiAgICAg
ICAgICAgICAgICAgY29tcCA9ICZwcml2LT5kZHBfY29tcFtjb21wX2lkXTsKPiAtICAgICAgICAg
ICAgICAgaWYgKCFjb21wKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYs
ICJDb21wb25lbnQgJXBPRiBub3QgaW5pdGlhbGl6ZWRcbiIsIG5vZGUpOwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIHJldCA9IC1FTk9ERVY7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiAtICAgICAgICAgICAgICAgfQo+IC0KPiAgICAgICAgICAgICAgICAgbXRrX2Ny
dGMtPmRkcF9jb21wW2ldID0gY29tcDsKPgo+ICAgICAgICAgICAgICAgICBpZiAoY29tcC0+ZnVu
Y3MpIHsKPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
