Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C2CC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 03:08:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6405C2067D
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 03:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGpAVlN1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+ksXFY7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6405C2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aDPQqwjDrR5T/v+zdvGy0XkuZ55FTp75kV27tnf6cuY=; b=jGpAVlN1hVHfTHm3V1e5mkQvc
	I2Z/brXJViR2mC1rVNa7vDl/H7jUIP/LAqFg0Ko0tW52u2R3yLFBCiNEIy/hg2mQJ+kNq4rkCC2Z2
	NfYNwF6ltlicy5ijKAz3lfTPjIqqvgZBCbkxhPZbOgU4xGYduemsi6r8UpR3Xcx5UuVCOtxwZG2v4
	avTSy1rojFza6HT7gdPSrsl417IrXcf51hlXV3y2+o2ZGHQw2WRJuPwXk9WHp7wRL7wCgEmazQz03
	V6Lr3L7GodZZkXk6GRR5WeddUiwbH80KqZBaApVY1YFWHmFrdAIkYHwZqG9HNXnA48T3UMBv+KKN2
	/ty/PBSrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k24M0-0004b7-Cg; Sun, 02 Aug 2020 03:08:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k24Lt-0004a1-6X; Sun, 02 Aug 2020 03:07:58 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3283B2245C;
 Sun,  2 Aug 2020 03:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596337675;
 bh=BDe3yrs2v8VZq1a11x+flngPwziIhT6reSqN/ADz+Do=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K+ksXFY7u11n48uVBOuFNHQQ9C51A4Cx58+FxIOWeKiJEnIL5aj1+hUZK1aggDn1z
 myxPzZKhwAtNJMXb4+HnJmr6aMIR00n7EUNU0o1eHBY3QdqzCwEtTAvlh4i3oNpMo0
 jhBDyaCR35CyK0BXxAATuMXx20uru00c1cnKX3RE=
Received: by mail-ed1-f51.google.com with SMTP id v22so14141607edy.0;
 Sat, 01 Aug 2020 20:07:55 -0700 (PDT)
X-Gm-Message-State: AOAM532hoCViBLkR/69V5iGH9O6iQ0vKmtFaDgYcIV8K+Z0zt5W5raW7
 w3F3WdYQT3F9f7sLDX+rMbbzG6IUi3F0rKmuYw==
X-Google-Smtp-Source: ABdhPJyuI+jxJ9FjQ8z4X4OB88xraUiJO81XEDCBTWmaeVREdXxTr4LuiheHcUQRI8EXwQMSWtSMj+P+/FhYw6yGYmE=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr10069970edb.48.1596337673694; 
 Sat, 01 Aug 2020 20:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-5-frank-w@public-files.de>
In-Reply-To: <20200728111800.77641-5-frank-w@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Aug 2020 11:07:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99VEs2aNAoWBJhcCMsem5ewmV18B=GMLc_n-Wico_+Hg@mail.gmail.com>
Message-ID: <CAAOTY_99VEs2aNAoWBJhcCMsem5ewmV18B=GMLc_n-Wico_+Hg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_230757_482780_6E40153D 
X-CRM114-Status: GOOD (  20.87  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0N+aciDI45pelIOmAseS6jCDkuIvljYg3OjE45a+r6YGT77yaCgo+Cj4gRnJvbTog
Sml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+Cj4gW0RldGFpbF0KPiBkcGkvZHNp
IGdldCB0aGUgcG9zc2libGVfY3J0YyBieQo+IG10a19kcm1fZmluZF9wb3NzaWJsZV9jcnRjX2J5
X2NvbXAoKmRybV9kZXYsIGRkcF9jb21wKQo+CgpJIHdvdWxkIGxpa2UgbW9yZSBpbmZvcm1hdGlv
biBvZiB3aHkgZG8gdGhpcyBwYXRjaC4gRm9yIGV4YW1wbGU6CgpGb3IgY3VycmVudCBtZWRpYXRl
ayBkc2kgZW5jb2RlciwgaXRzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0YwowLCBhbmQg
bWVkaWF0ZWsgZHBpIGVuY29kZXIncyBwb3NzaWJsZSBjcnRjIGlzIGZpeGVkIGluIGNydGMgMS4g
SW4Kc29tZSBTb0MgdGhlIHBvc3NpYmxlIGNydGMgaXMgbm90IGZpeGVkIGluIHRoaXMgY2FzZSwg
c28gY2FsbAptdGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKCkgdG8gZmluZCBvdXQg
dGhlIGNvcnJlY3QgcG9zc2libGUKY3J0Yy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IFRlc3Q6
IGJ1aWxkIHBhc3MgYW5kIGJvb3QgdG8gbG9nbwo+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hp
IDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwaS5jIHwgMyArKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
YyB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gaW5kZXggZDRmMGZiN2FkMzEy
Li5lNDM5NzcwMTU4NDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAt
NjA4LDcgKzYwOCw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ICAgICAgICAgZHJtX2VuY29k
ZXJfaGVscGVyX2FkZCgmZHBpLT5lbmNvZGVyLCAmbXRrX2RwaV9lbmNvZGVyX2hlbHBlcl9mdW5j
cyk7Cj4KPiAgICAgICAgIC8qIEN1cnJlbnRseSBEUEkwIGlzIGZpeGVkIHRvIGJlIGRyaXZlbiBi
eSBPVkwxICovCj4gLSAgICAgICBkcGktPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQoMSk7
Cj4gKyAgICAgICBkcGktPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPQo+ICsgICAgICAgICAgICAg
ICBtdGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKGRybV9kZXYsIGRwaS0+ZGRwX2Nv
bXApOwo+Cj4gICAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHBpLT5lbmNvZGVyLCBk
cGktPmJyaWRnZSwgTlVMTCwgMCk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggMjcwYmYyMmM5OGZlLi5jMzFkOWMxMmQ0YTkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtODkyLDcgKzg5Miw4IEBAIHN0YXRp
YyBpbnQgbXRrX2RzaV9jcmVhdGVfY29ubl9lbmMoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3Ry
dWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgICAqIEN1cnJlbnRseSBkaXNwbGF5IGRhdGEgcGF0
aHMgYXJlIHN0YXRpY2FsbHkgYXNzaWduZWQgdG8gYSBjcnRjIGVhY2guCj4gICAgICAgICAgKiBj
cnRjIDAgaXMgT1ZMMCAtPiBDT0xPUjAgLT4gQUFMIC0+IE9EIC0+IFJETUEwIC0+IFVGT0UgLT4g
RFNJMAo+ICAgICAgICAgICovCj4gLSAgICAgICBkc2ktPmVuY29kZXIucG9zc2libGVfY3J0Y3Mg
PSAxOwo+ICsgICAgICAgZHNpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0KPiArICAgICAgICAg
ICAgICAgbXRrX2RybV9maW5kX3Bvc3NpYmxlX2NydGNfYnlfY29tcChkcm0sIGRzaS0+ZGRwX2Nv
bXApOwo+Cj4gICAgICAgICAvKiBJZiB0aGVyZSdzIGEgYnJpZGdlLCBhdHRhY2ggdG8gaXQgYW5k
IGxldCBpdCBjcmVhdGUgdGhlIGNvbm5lY3RvciAqLwo+ICAgICAgICAgaWYgKGRzaS0+YnJpZGdl
KSB7Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
