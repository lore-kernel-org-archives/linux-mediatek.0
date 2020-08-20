Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121F4C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:48:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B5D207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qw5CrvBM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+Qu4TRQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1B5D207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QdjZEHLrhV8B4jxznsofGvgoogDgCiNqf8ZsvclZYF0=; b=qw5CrvBM/gVED8o+CLgOSo97O
	MjKdfh2g1yfFWIy8B+Cp3Egm5l/c/pyiEu602yPcvap+M71r0lHLl1I8g87QKpVinvYyfumYMkG81
	90CGPbfpkRyTcTZRO2xUip5Ors6d3FcV5OuWppbloIVXogEVxY4eriWkm84DVFXvNRddXoZa21H8U
	CBV1yTv/D/bDfSRVuD4C3v3wrl+r2BVMiZWZbt/c01629oBbKY6rTVPm3CrhuAu7IW/puQYCqQ61A
	FUCcwmjSWRIPEG6D/QT/NOLSpbvpM3PvkBuj8mJjg/SlCTLg9nmSEsMdwW9le5j0pnX4tZ9NRav6I
	xArA371ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8uIa-0005dP-DZ; Thu, 20 Aug 2020 23:48:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8uIV-0005bI-B9; Thu, 20 Aug 2020 23:48:44 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 24CBC20FC3;
 Thu, 20 Aug 2020 23:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597967322;
 bh=0+j/6QA0LygchhDILln1yfm2HCDRr0a88PJAPwRl+xo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N+Qu4TRQ6I7L3UpaNQexsvv1BxlVF9FL/w9CTaKc1TkL+sYA14R3lE5YU2/F2TOXW
 o63nm/yHlj80bBCLzUTPL3kFiAYQzbIWHBu9QKWQHoHazVpN1wNYJuhu+V3kE5qI4i
 0mkvVoGLDRYSC88tpmH6zvH7FChQIVsjQ5lG8WIE=
Received: by mail-ej1-f42.google.com with SMTP id a26so269470ejc.2;
 Thu, 20 Aug 2020 16:48:42 -0700 (PDT)
X-Gm-Message-State: AOAM533134ZNIDMTP8WpYh3Gp0nvE1NEnCQBCkoJGn5QleU/rQH7AWCt
 ZFWJ0M4ACBgU0+1G8Kd49dfxDdBpdzXTTy0FvA==
X-Google-Smtp-Source: ABdhPJxWafAaj3k7lPbaruLTEUXILZXHlJiOWiA943fk40qr+NDtlxb9h2KyFzZEAanAf5GUY6rk5v906+J7wgBQIpo=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr193241ejl.375.1597967320752; 
 Thu, 20 Aug 2020 16:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-15-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-15-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:48:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9xdn3VnU3nSBc4dvxcVOG34VSaDwxHga8=29GPW3zFsw@mail.gmail.com>
Message-ID: <CAAOTY_9xdn3VnU3nSBc4dvxcVOG34VSaDwxHga8=29GPW3zFsw@mail.gmail.com>
Subject: Re: [PATCH v1 14/21] drm/mediatek: add bypass shadow register
 function call for ddp component
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_194843_511388_D715D424 
X-CRM114-Status: GOOD (  23.39  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjoxOOWvq+mBk++8mgo+Cj4gdGhl
IHNoYWRvdyByZWdpc3RlciBmb3IgbXQ4MTkyIGRkcCBjb21wb25lbnQgaXMgZW5hYmxlLAo+IHdl
IG5lZWQgZGlzYWJsZSBpdCBiZWZvcmUgZW5hYmxlIGRkcCBjb21wb25lbnQKCk1UMjcwMSBoYXMg
c2hhZG93IHJlZ2lzdGVyIGFuZCB1c2UgaXQuIFdoeSBNVDgxOTIgaGF2ZSBzaGFkb3cgcmVnaXN0
ZXIKYnV0IGRpc2FibGUgaXQ/IEkgd291bGQgbGlrZSB0byB1c2Ugc2hhZG93IHJlZ2lzdGVyIGxp
a2UgTVQyNzAxLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25n
cWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICB8IDMgKysrCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCA3ICsrKysrKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fY3J0Yy5jCj4gaW5kZXggZmU0NmM0Yi4uMTZlOWI4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAtMjk5LDYgKzI5OSw5IEBAIHN0YXRpYyBpbnQg
bXRrX2NydGNfZGRwX2h3X2luaXQoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAg
ICAgICAgICAgICAgIGdvdG8gZXJyX211dGV4X3VucHJlcGFyZTsKPiAgICAgICAgIH0KPgo+ICsg
ICAgICAgZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9ucjsgaSsrKQo+ICsgICAg
ICAgICAgICAgICBtdGtfZGRwX2NvbXBfYnlwYXNzX3NoYWRvdyhtdGtfY3J0Yy0+ZGRwX2NvbXBb
aV0pOwo+ICsKPiAgICAgICAgIERSTV9ERUJVR19EUklWRVIoIm1lZGlhdGVrX2RkcF9kZHBfcGF0
aF9zZXR1cFxuIik7Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbXRrX2NydGMtPmRkcF9jb21w
X25yIC0gMTsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIG10a19tbXN5c19kZHBfY29ubmVjdCht
dGtfY3J0Yy0+bW1zeXNfZGV2LAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuaAo+IGluZGV4IGFlMTFiNDYuLjFmMjU3MDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiBAQCAtNDUsNiArNDUsNyBAQCBzdHJ1
Y3QgbXRrX2RkcF9jb21wX2Z1bmNzIHsKPiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBicGMsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpOwo+ICAgICAgICAgdm9pZCAoKnN0
YXJ0KShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKTsKPiAgICAgICAgIHZvaWQgKCpzdG9wKShz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKTsKPiArICAgICAgIHZvaWQgKCpieXBhc3Nfc2hhZG93
KShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKTsKPiAgICAgICAgIHZvaWQgKCplbmFibGVfdmJs
YW5rKShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOwo+
ICAgICAgICAgdm9pZCAoKmRpc2FibGVfdmJsYW5rKShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21w
KTsKPiAgICAgICAgIHVuc2lnbmVkIGludCAoKnN1cHBvcnRlZF9yb3RhdGlvbnMpKHN0cnVjdCBt
dGtfZGRwX2NvbXAgKmNvbXApOwo+IEBAIC0xNjksNiArMTcwLDEyIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBtdGtfZGRwX2N0bV9zZXQoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwKPiAgICAgICAg
ICAgICAgICAgY29tcC0+ZnVuY3MtPmN0bV9zZXQoY29tcCwgc3RhdGUpOwo+ICB9Cj4KPiArc3Rh
dGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9ieXBhc3Nfc2hhZG93KHN0cnVjdCBtdGtfZGRw
X2NvbXAgKmNvbXApCj4gK3sKPiArICAgICAgIGlmIChjb21wLT5mdW5jcyAmJiBjb21wLT5mdW5j
cy0+YnlwYXNzX3NoYWRvdykKPiArICAgICAgICAgICAgICAgY29tcC0+ZnVuY3MtPmJ5cGFzc19z
aGFkb3coY29tcCk7Cj4gK30KPiArCj4gIGludCBtdGtfZGRwX2NvbXBfZ2V0X2lkKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBf
Y29tcF90eXBlIGNvbXBfdHlwZSk7Cj4gIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY29tcF9ub2RlLAo+IC0tCj4gMS44LjEuMS5k
aXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
