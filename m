Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324BEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 23:48:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D9461073
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 23:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3D9461073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7F8WZ+h/djbB+Dj2Ab0Kji8eNZfBnAphtxyCdLxlLo=; b=sfu3nB+IOXhXbb
	ghxz0SMNpwBmzaGwjrBxGBufCRM0O0BSLN3tBHWfqi729vq0EnvwVS71yQ7uiyLePJX89dl6TloIB
	+Ozes72UIetsuqEmlzjxmzUquXuGKpuRqRvLbWBIUOR0ABENC0KFmx5rkYAzir49Z37hanqR6UmaR
	/BBbxd5Y/8r6tZl538QSUCJ7skma4sqVadpsM8rfeuahs+Xx2Ql3FvycBlYcIhplDn6iaaPdDErY2
	RYw+0FwVfpDzJo11IFYQ1476NCU2UfDdMag33iEDZRPc17KqpLqLjOuRbhIFwdOz8xerJmQRuFQZK
	q3drmhNVrk6yfgb68r+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfseL-006WmY-8E; Wed, 27 Oct 2021 23:48:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfse9-006Wl3-FF; Wed, 27 Oct 2021 23:47:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19243610C7;
 Wed, 27 Oct 2021 23:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635378473;
 bh=t+PpqypSCKapTKRguvjCBaJPzX1t0c7f7uN58dcUX7k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g35vda8IPAZHnszM/A969Xutm5EPOZJyoiXZ6xXU5xMhupCFrKeb2gAzsFABGAJO9
 JZmzqgM1jCV7X2r00r3JANnowHEwoGcx6YT5cHvQuDiBliY1FnnIewjQ98rtxKvIyP
 8H4po/ArJBCEdqHRTuKXeEitONH/RP+rIqsLx609a3SzptaiBKFwNKtM//ImcIi692
 GNFPf//j06uYa4Z6s0uJH5Yd5j6cNsygjaYvJwMSBbzJxlGYVNoMWjMUllt75wFAjs
 WwWicaSlYeI9CXqZvPpftCo5DS+s6yS0xLl+EP20WZa+sXrwDgWXDGgAko1VPRsUmH
 o+tvCXbwDoHBw==
Received: by mail-ed1-f46.google.com with SMTP id r4so16634758edi.5;
 Wed, 27 Oct 2021 16:47:53 -0700 (PDT)
X-Gm-Message-State: AOAM53062UrdukMPVERoZhNfkxEyi+PqT9N8SWTK1j/GLMkkuWaC4DoB
 zgU0aTXtu8XtxK2ZNXub8lNZvzsbjXpg0Fztfg==
X-Google-Smtp-Source: ABdhPJxg4eUZljI10gC+7+cwqF6vxnwg2Rr90TkBscgjdcWRIhtecmw9FjFNDtU5mtrkdv/lNBHMmDxTzmNvXUH9TzE=
X-Received: by 2002:a05:6402:28f:: with SMTP id
 l15mr1357751edv.272.1635378471564; 
 Wed, 27 Oct 2021 16:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
 <20211027021857.20816-4-jason-jh.lin@mediatek.com>
 <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
In-Reply-To: <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 28 Oct 2021 07:47:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
Message-ID: <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mediatek: Detect CMDQ execution timeout
To: Fei Shao <fshao@chromium.org>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_164753_578099_86711539 
X-CRM114-Status: GOOD (  24.53  )
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

SGksIEZlaToKCkZlaSBTaGFvIDxmc2hhb0BjaHJvbWl1bS5vcmc+IOaWvCAyMDIx5bm0MTDmnIgy
N+aXpSDpgLHkuIkg5LiL5Y2INTozMuWvq+mBk++8mgo+Cj4gSGkgSmFzb24sCj4KPiBPbiBXZWQs
IE9jdCAyNywgMjAyMSBhdCAxMDoxOSBBTSBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPgo+ID4KPiA+IENNRFEgaXMgdXNlZCB0byB1cGRhdGUgZGlzcGxheSByZWdp
c3RlciBpbiB2YmxhbmsgcGVyaW9kLCBzbwo+ID4gaXQgc2hvdWxkIGJlIGV4ZWN1dGUgaW4gbmV4
dCAyIHZibGFuay4gT25lIHZibGFuayBpbnRlcnJ1cHQKPiA+IGJlZm9yZSBzZW5kIG1lc3NhZ2Ug
KG9jY2FzaW9uYWxseSkgYW5kIG9uZSB2YmxhbmsgaW50ZXJydXB0Cj4gPiBhZnRlciBjbWRxIGRv
bmUuIElmIGl0IGZhaWwgdG8gZXhlY3V0ZSBpbiBuZXh0IDMgdmJsYW5rLAo+ID4gdGllbW91dCBo
YXBwZW4uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1
QGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMgfCAyMCArKysrKysrKysrKysrKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+IGluZGV4IGUyM2UzMjI0YWM2Ny4uZGFkMWY4NWVl
MzE1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0
Yy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+
IEBAIC01NCw2ICs1NCw3IEBAIHN0cnVjdCBtdGtfZHJtX2NydGMgewo+ID4gICNpZiBJU19SRUFD
SEFCTEUoQ09ORklHX01US19DTURRKQo+ID4gICAgICAgICBzdHJ1Y3QgY21kcV9jbGllbnQgICAg
ICAgICAgICAgIGNtZHFfY2xpZW50Owo+ID4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNtZHFfZXZlbnQ7Cj4gPiArICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY21kcV92YmxhbmtfY250Owo+ID4gICNlbmRpZgo+ID4KPiA+ICAgICAgICAgc3Ry
dWN0IGRldmljZSAgICAgICAgICAgICAgICAgICAqbW1zeXNfZGV2Owo+ID4gQEAgLTIyNyw3ICsy
MjgsMTAgQEAgc3RydWN0IG10a19kZHBfY29tcCAqbXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUo
c3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gIHN0YXRpYyB2b2lkIGRkcF9jbWRxX2NiKHN0cnVj
dCBtYm94X2NsaWVudCAqY2wsIHZvaWQgKm1zc2cpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3Qg
Y21kcV9jYl9kYXRhICpkYXRhID0gbXNzZzsKPiA+ICsgICAgICAgc3RydWN0IGNtZHFfY2xpZW50
ICpjbWRxX2NsID0gY29udGFpbmVyX29mKGNsLCBzdHJ1Y3QgY21kcV9jbGllbnQsIGNsaWVudCk7
Cj4gPiArICAgICAgIHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjID0gY29udGFpbmVyX29m
KGNtZHFfY2wsIHN0cnVjdCBtdGtfZHJtX2NydGMsIGNtZHFfY2xpZW50KTsKPiA+Cj4gPiArICAg
ICAgIG10a19jcnRjLT5jbWRxX3ZibGFua19jbnQgPSAwOwo+ID4gICAgICAgICBjbWRxX3BrdF9k
ZXN0cm95KGRhdGEtPnBrdCk7Cj4gPiAgfQo+ID4gICNlbmRpZgo+ID4gQEAgLTQ4Myw2ICs0ODcs
MTUgQEAgc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX3VwZGF0ZV9jb25maWcoc3RydWN0IG10a19k
cm1fY3J0YyAqbXRrX2NydGMsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY21kcV9oYW5kbGUtPnBhX2Jhc2UsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY21kcV9oYW5kbGUtPmNtZF9idWZfc2l6ZSwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBETUFfVE9fREVWSUNFKTsKPiA+
ICsgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAqIENNRFEgY29tbWFuZCBz
aG91bGQgZXhlY3V0ZSBpbiBuZXh0IDMgdmJsYW5rLgo+ID4gKyAgICAgICAgICAgICAgICAqIE9u
ZSB2YmxhbmsgaW50ZXJydXB0IGJlZm9yZSBzZW5kIG1lc3NhZ2UgKG9jY2FzaW9uYWxseSkKPiA+
ICsgICAgICAgICAgICAgICAgKiBhbmQgb25lIHZibGFuayBpbnRlcnJ1cHQgYWZ0ZXIgY21kcSBk
b25lLAo+ID4gKyAgICAgICAgICAgICAgICAqIHNvIGl0J3MgdGltZW91dCBhZnRlciAzIHZibGFu
ayBpbnRlcnJ1cHQuCj4gPiArICAgICAgICAgICAgICAgICogSWYgaXQgZmFpbCB0byBleGVjdXRl
IGluIG5leHQgMyB2YmxhbmssIHRpbWVvdXQgaGFwcGVuLgo+ID4gKyAgICAgICAgICAgICAgICAq
Lwo+ID4gKyAgICAgICAgICAgICAgIG10a19jcnRjLT5jbWRxX3ZibGFua19jbnQgPSAzOwo+ID4g
Kwo+ID4gICAgICAgICAgICAgICAgIG1ib3hfc2VuZF9tZXNzYWdlKG10a19jcnRjLT5jbWRxX2Ns
aWVudC5jaGFuLCBjbWRxX2hhbmRsZSk7Cj4gPiAgICAgICAgICAgICAgICAgbWJveF9jbGllbnRf
dHhkb25lKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuLCAwKTsKPiA+ICAgICAgICAgfQo+ID4g
QEAgLTQ5OSwxMSArNTEyLDE0IEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9pcnEodm9pZCAq
ZGF0YSkKPiA+Cj4gPiAgI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gPiAgICAg
ICAgIGlmICghcHJpdi0+ZGF0YS0+c2hhZG93X3JlZ2lzdGVyICYmICFtdGtfY3J0Yy0+Y21kcV9j
bGllbnQuY2hhbikKPiA+ICsgICAgICAgICAgICAgICBtdGtfY3J0Y19kZHBfY29uZmlnKGNydGMs
IE5VTEwpOwo+ID4gKyAgICAgICBlbHNlIGlmIChtdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID4g
MCAmJiAtLW10a19jcnRjLT5jbWRxX3ZibGFua19jbnQgPT0gMCkKPiBJIHRoaW5rIGF0b21pY19k
ZWNfYW5kX3Rlc3QoKSBkb2VzIHdoYXQgeW91IHdhbnQgdG8gZG8gaGVyZS4KCkkgdGhpbmsgdGhp
cyBvcGVyYXRpb24gaXMgbm90IG5lY2Vzc2FyeSB0byBiZSBhdG9taWMgb3BlcmF0aW9uLCBhbmQK
dGhpcyBzdGF0ZW1lbnQgY291bGQgYmUgcmVkdWNlZCB0bwoKZWxzZSBpZiAoLS1tdGtfY3J0Yy0+
Y21kcV92YmxhbmtfY250ID09IDApCgo+Cj4KPgo+Cj4gPiArICAgICAgICAgICAgICAgRFJNX0VS
Uk9SKCJtdGtfY3J0YyAlZCBDTURRIGV4ZWN1dGUgY29tbWFuZCB0aW1lb3V0IVxuIiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2NydGNfaW5kZXgoJm10a19jcnRjLT5iYXNlKSk7
Cj4gPiAgI2Vsc2UKPiA+ICAgICAgICAgaWYgKCFwcml2LT5kYXRhLT5zaGFkb3dfcmVnaXN0ZXIp
Cj4gPiAtI2VuZGlmCj4gPiAgICAgICAgICAgICAgICAgbXRrX2NydGNfZGRwX2NvbmZpZyhjcnRj
LCBOVUxMKTsKPiA+IC0KPiA+ICsjZW5kaWYKPiA+ICAgICAgICAgbXRrX2RybV9maW5pc2hfcGFn
ZV9mbGlwKG10a19jcnRjKTsKPiA+ICB9Cj4gPgo+ID4gLS0KPiA+IDIuMTguMAo+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
