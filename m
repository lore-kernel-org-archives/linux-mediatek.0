Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD46EC5519F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 16:18:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D3322265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 16:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUCfQWPI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oe7/tt18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D3322265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JVLQE3lnzjC082dExhvz8am9lg2SVii8v73KGUovSI4=; b=hUCfQWPIWh8NrD7KdbGhZU6qR
	2Ebpfu7wEK9BL6F9oXE4AxvaVUx2z3/AUuoU6KF71qG3norQnGONvyvJdf1vnAc33c38w9IzwiO6l
	GWRjFW6Zi4Nfr7ONtrVIeUiaAbqD2Hy1TqgAiZ3lADSqJYbZNv2UXeDOO1VaqL4MRkdz4Gw9MbQxL
	R4rZueM1AxKmv4N83G4nSxVqYb3gzUxn/I6o7IjYLdk5XUiRF6wUZ24k8ROBDjM4XQkLnEGVD8EJY
	3GD44Zle+cEAJtyxNemm6j8jHRvs4XKW/eRPyktnjgnfhR9rsU+uEUqCzPK95v3JmLtxuEex3KHFl
	opsA0nyDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kehDC-0006Kp-25; Mon, 16 Nov 2020 16:18:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehD9-0006Jc-Nt
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 16:18:36 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84AAA223BD
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605543514;
 bh=FsCTuWY5dgbEYPYoLX82oXYdTcQy1FIVElAFfZct3k8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oe7/tt18Twv01APSGnqs8SWS1fDCBKIyWzn/U+44CK8947Civ2f4SrphT6VetEj5t
 kWjqEP48VMSNpsDrmPODrOa9csiO8j5dFT8YHh/rSsWAQZG/2hHORMS7O7uYD7I5X3
 gKq7a/V3Gs/4tndGlHB2qoY3O+C7aBH6vPHH2h1c=
Received: by mail-ed1-f53.google.com with SMTP id t11so19267283edj.13
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 08:18:34 -0800 (PST)
X-Gm-Message-State: AOAM531hBMCPMKjtalHoS/6ScpNZqGLofuJRLrKh1PdPevJDtiz5RBdS
 zaAXQDdOMUV7DjM5mMPTcrQZ6Ws5Y3lPPIdPCw==
X-Google-Smtp-Source: ABdhPJy5UEMa514VORYkzr40o5c6+5CuGbj0ZX3gVbzHQCZd656Uw9TY6XR+KuAhCyCycCnwR0Dvv0cwt3EvXFa5jUM=
X-Received: by 2002:aa7:dbca:: with SMTP id v10mr16591877edt.219.1605543513111; 
 Mon, 16 Nov 2020 08:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
 <CAAOTY_9px2KEoEF4YrYapP0kDPct+9SwpUEF591zRRU10+BSHg@mail.gmail.com>
In-Reply-To: <CAAOTY_9px2KEoEF4YrYapP0kDPct+9SwpUEF591zRRU10+BSHg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Nov 2020 00:18:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY__XjQZYnaO4_xioZnQZmUWrt5SDxJPkiLdXW1Q6DjBJnw@mail.gmail.com>
Message-ID: <CAAOTY__XjQZYnaO4_xioZnQZmUWrt5SDxJPkiLdXW1Q6DjBJnw@mail.gmail.com>
Subject: Re: [PATCH 00/11] Decouple Mediatek DRM sub driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_111835_929214_4C4B931D 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTHmnIgx
NuaXpSDpgLHkuIAg5LiK5Y2INzozM+Wvq+mBk++8mgo+Cj4gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTHmnIgz5pelIOmAseS6jCDkuIrljYg4OjM0
5a+r6YGT77yaCj4gPgo+ID4gbXRrIGNjb3JyIGlzIGNvbnRyb2xsZWQgYnkgRFJNIGFuZCBNRFAg
WzFdLiBJbiBvcmRlciB0byBzaGFyZQo+ID4gbXRrX2Njb3JyIGRyaXZlciBmb3IgRFJNIGFuZCBN
RFAsIGRlY291cGxlIE1lZGlhdGVrIERSTSBzdWIgZHJpdmVyCj4gPiB3aGljaCBpbmNsdWRlIG10
a19jY29yciwgc28gTURQIGNvdWxkIHVzZSB0aGlzIGRlY291cGxlZCBtdGtfY2NvcnIuCj4KPiBB
cHBsaWVkIHRoZSB3aG9sZSBzZXJpZXMgaW50byBtZWRpYXRlay1kcm0tbmV4dCBbMV0uCj4KPiBb
MV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1
YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKPgoKU29ycnksIGJlY2F1
c2Ugb2YgaW9tbXUgbGFyYiBwcm9ibGVtLCBJIGRyb3AgdGhpcyBzZXJpZXMgZnJvbSBtZWRpYXRl
ay1kcm0tbmV4dC4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFu
Zy4KPgo+ID4KPiA+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTQw
NzUxLwo+ID4KPiA+IENLIEh1ICg5KToKPiA+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIGNsayBpbmZv
IGZyb20gc3RydWN0IG10a19kZHBfY29tcCB0byBzdWIgZHJpdmVyCj4gPiAgICAgcHJpdmF0ZSBk
YXRhCj4gPiAgIGRybS9tZWRpYXRlazogTW92ZSByZWdzIGluZm8gZnJvbSBzdHJ1Y3QgbXRrX2Rk
cF9jb21wIHRvIHN1YiBkcml2ZXIKPiA+ICAgICBwcml2YXRlIGRhdGEKPiA+ICAgZHJtL21lZGlh
dGVrOiBSZW1vdmUgaXJxIGluIHN0cnVjdCBtdGtfZGRwX2NvbXAKPiA+ICAgZHJtL21lZGlhdGVr
OiBVc2Ugc3RydWN0IGNtZHFfY2xpZW50X3JlZyB0byBnYXRoZXIgY21kcSB2YXJpYWJsZQo+ID4g
ICBkcm0vbWVkaWF0ZWs6IE1vdmUgY21kcV9yZWcgaW5mbyBmcm9tIHN0cnVjdCBtdGtfZGRwX2Nv
bXAgdG8gc3ViCj4gPiAgICAgZHJpdmVyIHByaXZhdGUgZGF0YQo+ID4gICBkcm0vbWVkaWF0ZWs6
IENoYW5nZSBzdWIgZHJpdmVyIGludGVyZmFjZSBmcm9tIG10a19kZHBfY29tcCB0byBkZXZpY2UK
PiA+ICAgZHJtL21lZGlhdGVrOiBSZWdpc3RlciB2YmxhbmsgY2FsbGJhY2sgZnVuY3Rpb24KPiA+
ICAgZHJtL21lZGlhdGVrOiBEUk0gZHJpdmVyIGRpcmVjdGx5IHJlZmVyIHRvIHN1YiBkcml2ZXIn
cyBmdW5jdGlvbgo+ID4gICBkcm0vbWVkaWF0ZWs6IE1vdmUgbXRrX2RkcF9jb21wX2luaXQoKSBm
cm9tIHN1YiBkcml2ZXIgdG8gRFJNIGRyaXZlcgo+ID4KPiA+IENodW4tS3VhbmcgSHUgKDIpOgo+
ID4gICBkcm0vbWVkaWF0ZWs6IEdldCBDTURRIGNsaWVudCByZWdpc3RlciBmb3IgYWxsIGRkcCBj
b21wb25lbnQKPiA+ICAgZHJtL21lZGlhdGVrOiBVc2UgY29ycmVjdCBkZXZpY2UgcG9pbnRlciB0
byBnZXQgQ01EUSBjbGllbnQgcmVnaXN0ZXIKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX2NvbG9yLmMgICB8ICA4NiArKy0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9kcnYuaCAgICAgfCAgNjkgKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyAgICAgfCAyMTUgKysrKysrLS0tLS0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jICAgIHwgMTY5ICsrKysrLS0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgICAgICAgICAgfCAgNDQgKy0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICB8ICA3NSAr
Ky0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICB8ICAg
MSAtCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDM4
OSArKysrKysrKysrKystLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmggfCAxMDAgKystLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYyAgICAgIHwgIDMwICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmggICAgICB8ICAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMgICAgICAgICAgfCAgNDcgKy0tCj4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgNjU4
IGluc2VydGlvbnMoKyksIDU2OSBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oCj4gPgo+ID4gLS0KPiA+IDIu
MTcuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
