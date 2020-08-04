Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1C6C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:41:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62B4F2075D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SIH60Lwb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIo20VzQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62B4F2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qELdjT2TgRL+RiF2Mk+wi9oqho31Wa0Qrh7wvzQrSeU=; b=SIH60LwbX3SuEoBNH9a2Obz8O
	z0zitiI9cJrLpKHxtqrsICW/0B+6dRQSUL2jbXEGVXGfn3Mf7y2ODJz8TuFWSaQ/8LXC5VDUwf34G
	cOwRqxnRnep0H8DV/3Hd7PM/iYHaeo1TBLHo9wvAAi+qgI4NLFRcHrHcQOBE6LPDWLVGx8XQVyLri
	+zlZSGB9QZgr+m1Ndu+PWvz7TExAsZc+qx+QZOAQyk5PsH7FxrQpPT88bK6/T6yzC8VQVqRG1wNo0
	5YxXwDBnDVjGhzsffz9IQCjBdGdqp5/QPTznBsb1RmQFGIX+Y+oG/dT44zBANIvioHXp3mwPcG4gY
	K4/yrTt9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2y8E-0008BY-6j; Tue, 04 Aug 2020 14:41:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2y8A-0008AN-9k; Tue, 04 Aug 2020 14:41:31 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73EEE22CBB;
 Tue,  4 Aug 2020 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596552089;
 bh=49+4jaBGejOQEj2mBMoA+n/qjCxSINfX1ZlDTF4RB9g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SIo20VzQD1hcKkTqZ3z6GBe+Nk04OJx3rnyojyF0dO0yfKTibSzFTxzo9XexiAGpL
 7kift6qM8OTaCC660NCKLt6bJH6Yq6r+KkBvLatUZlR7pHxBD1y4RuGzEjCe+xwcIQ
 /sG0jMIKiPHNmA+iSLJKMuPh+iI8pcYgGIjtOg34=
Received: by mail-ej1-f42.google.com with SMTP id o23so15256725ejr.1;
 Tue, 04 Aug 2020 07:41:29 -0700 (PDT)
X-Gm-Message-State: AOAM532Rr328Ljo6TV+wd2h+bVF+Z6QW0jw+3LbVOfreNg+6ElKVs3O0
 OX6MVWLPJqG75GsDX19QIDqi9u1fwR16kuHjbQ==
X-Google-Smtp-Source: ABdhPJxZ0G5jQrTt8tCKNFsHW0hKmhaebXxOjBoQebMkyIg/uoMGnJRW5xIni95vs+vqhJWTPzUYNN6/fLd4aQtB8v8=
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr21013338ejb.187.1596552088025; 
 Tue, 04 Aug 2020 07:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-5-linux@fw-web.de>
In-Reply-To: <20200804105849.70876-5-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 22:41:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Nd9jTiSZPZDUj3YtuqJTWCJTR91y2xjNT6y9f4v1+aQ@mail.gmail.com>
Message-ID: <CAAOTY_-Nd9jTiSZPZDUj3YtuqJTWCJTR91y2xjNT6y9f4v1+aQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_104130_478042_9416EBD0 
X-CRM114-Status: GOOD (  21.85  )
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
 Daniel Vetter <daniel@ffwll.ch>, Frank Wunderlich <frank-w@public-files.de>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDjmnIg05pelIOmAseS6jCDkuIvljYg3OjAw5a+r6YGT77yaCj4KPiBGcm9tOiBKaXRhbyBTaGkg
PGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4KPiBGb3IgY3VycmVudCBtZWRpYXRlayBkc2kgZW5j
b2RlciwgaXRzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0Ywo+IDAsIGFuZCBtZWRpYXRl
ayBkcGkgZW5jb2RlcidzIHBvc3NpYmxlIGNydGMgaXMgZml4ZWQgaW4gY3J0YyAxLiBJbgo+IHNv
bWUgU29DIHRoZSBwb3NzaWJsZSBjcnRjIGlzIG5vdCBmaXhlZCBpbiB0aGlzIGNhc2UsIHNvIGNh
bGwKPiBtdGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19ieV9jb21wKCkgdG8gZmluZCBvdXQgdGhl
IGNvcnJlY3QgcG9zc2libGUKPiBjcnRjLgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNo
dW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxm
cmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYyB8IDMgKystCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMg
fCAzICsrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IGluZGV4IGQ0ZjBmYjdhZDMxMi4u
ZTQzOTc3MDE1ODQzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gQEAgLTYw
OCw3ICs2MDgsOCBAQCBzdGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgIGRybV9lbmNvZGVy
X2hlbHBlcl9hZGQoJmRwaS0+ZW5jb2RlciwgJm10a19kcGlfZW5jb2Rlcl9oZWxwZXJfZnVuY3Mp
Owo+Cj4gICAgICAgICAvKiBDdXJyZW50bHkgRFBJMCBpcyBmaXhlZCB0byBiZSBkcml2ZW4gYnkg
T1ZMMSAqLwo+IC0gICAgICAgZHBpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0gQklUKDEpOwo+
ICsgICAgICAgZHBpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0KPiArICAgICAgICAgICAgICAg
bXRrX2RybV9maW5kX3Bvc3NpYmxlX2NydGNfYnlfY29tcChkcm1fZGV2LCBkcGktPmRkcF9jb21w
KTsKPgo+ICAgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goJmRwaS0+ZW5jb2RlciwgZHBp
LT5icmlkZ2UsIE5VTEwsIDApOwo+ICAgICAgICAgaWYgKHJldCkgewo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYwo+IGluZGV4IDI3MGJmMjJjOThmZS4uYzMxZDljMTJkNGE5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTg5Miw3ICs4OTIsOCBAQCBzdGF0aWMg
aW50IG10a19kc2lfY3JlYXRlX2Nvbm5fZW5jKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVj
dCBtdGtfZHNpICpkc2kpCj4gICAgICAgICAgKiBDdXJyZW50bHkgZGlzcGxheSBkYXRhIHBhdGhz
IGFyZSBzdGF0aWNhbGx5IGFzc2lnbmVkIHRvIGEgY3J0YyBlYWNoLgo+ICAgICAgICAgICogY3J0
YyAwIGlzIE9WTDAgLT4gQ09MT1IwIC0+IEFBTCAtPiBPRCAtPiBSRE1BMCAtPiBVRk9FIC0+IERT
STAKPiAgICAgICAgICAqLwo+IC0gICAgICAgZHNpLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0g
MTsKPiArICAgICAgIGRzaS0+ZW5jb2Rlci5wb3NzaWJsZV9jcnRjcyA9Cj4gKyAgICAgICAgICAg
ICAgIG10a19kcm1fZmluZF9wb3NzaWJsZV9jcnRjX2J5X2NvbXAoZHJtLCBkc2ktPmRkcF9jb21w
KTsKPgo+ICAgICAgICAgLyogSWYgdGhlcmUncyBhIGJyaWRnZSwgYXR0YWNoIHRvIGl0IGFuZCBs
ZXQgaXQgY3JlYXRlIHRoZSBjb25uZWN0b3IgKi8KPiAgICAgICAgIGlmIChkc2ktPmJyaWRnZSkg
ewo+IC0tCj4gMi4yNS4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
