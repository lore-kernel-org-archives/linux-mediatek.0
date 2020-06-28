Return-Path: <SRS0=D54E=AJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F828C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jun 2020 14:20:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E411220772
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jun 2020 14:20:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4/u4ohf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ferf/tRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E411220772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ntN8uaYazZD2GDSQNi58a+z2ktJrHEuDrguSPN9Wsms=; b=n4/u4ohfJ/Yjfb1xEA6CfXAhb
	P4fcvSV4i9IMm582N3wf8RFlQKtfj7AdyPQQhImRubsl/nffWl3om9lg6yRw26U8KN9Gp3gZcvK53
	FMERYQ1eoYmO7aaCAqZ8oAx33zguwh+x1/ekct2ZH+kPzzz+tOEWtmZOvWY0Bdme4J12ZlygrTAVE
	w7ecJdrB/6j4Idb6uWsZ4Ib1i7dF9sJEjnCnl9vfA2FEPUYJDSRSXm7cnWLVYRiO8fbP/kK0AVtH8
	g36bgggklyOTfwQQtlAf/OX8cvi4jfC93D3qV2W0zy7i7TYO/ByLDx8IvRiwnKvqj6yOV5zCNLrO6
	IVJo9ZyWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpY9y-0000BZ-CH; Sun, 28 Jun 2020 14:19:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpY9r-0000B5-6f; Sun, 28 Jun 2020 14:19:48 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C12AF20B80;
 Sun, 28 Jun 2020 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593353984;
 bh=FM4B6O890rOp11oQrSU4ptT/qfDOHTlolMOEiV7c7eg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ferf/tRhh+Cyjnbgp3+HUzWJL7BG8wJdiusxjhIetWjKuYQLl1NXBXPjmBnr3vCvh
 dWv/o8RrX2s86NOIEDgsogfylbi+64Vl0yWbnZnSa9GCWp6fP+GaPtakZlExoeSwaZ
 Bbc5g+ADqv3U4MT/VcWtmh/WHRGkU0jlflrDU7+E=
Received: by mail-ej1-f52.google.com with SMTP id i14so14021353ejr.9;
 Sun, 28 Jun 2020 07:19:43 -0700 (PDT)
X-Gm-Message-State: AOAM533tJbFRA9cTezfPSdCk2LdIxWosV2oPHT6SxKN8y6R6iJU7ClDu
 tIRyS1Sym3qOvUzuCZeqndZGbLJViISihy3Z7g==
X-Google-Smtp-Source: ABdhPJyBxW8NlX1UpfAJTQrr9ECyVfuVuXvUNgqMd8hviZLwctZBgwiwnmX4TCg6/5R7MfpzaqzdROaukyvUmvcYUqY=
X-Received: by 2002:a17:906:5fc4:: with SMTP id
 k4mr10157244ejv.94.1593353982337; 
 Sun, 28 Jun 2020 07:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200616065102.15756-1-bernard@vivo.com>
In-Reply-To: <20200616065102.15756-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 28 Jun 2020 22:19:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-yTjG7xW6MZ6NFYUDaeKCkASPP4JQPD1WTLUmOCG3muA@mail.gmail.com>
Message-ID: <CAAOTY_-yTjG7xW6MZ6NFYUDaeKCkASPP4JQPD1WTLUmOCG3muA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: remove unnecessary conversion to bool
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIw5bm0
NuaciDE25pelIOmAseS6jCDkuIvljYgyOjUx5a+r6YGT77yaCj4KPiBJbiBmdW5jdGlvbiBtdGtf
ZHNpX2Nsa19oc19zdGF0ZSwgcmVtb3ZlIHVubmVjZXNzYXJ5IGNvbnZlcnNpb24KPiB0byBib29s
IHJldHVybiwgdGhpcyBjaGFuZ2UgaXMgdG8gbWFrZSB0aGUgY29kZSBhIGJpdCByZWFkYWJsZS4K
CkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLWZpeGVzIFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51
eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1maXhlcwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+Cj4gLS0tCj4g
Q2hhbmdlcyBzaW5jZSBWMToKPiAqb3B0aW1pemUgdG8gbWFrZSB0aGUgY29kZSBhIGJpdCBtb3Jl
IGNsZWFyLgo+Cj4gTGluayBmb3IgVjE6Cj4gKmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNo
d29yay9wYXRjaC8xMjU1MzI3Lwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIHwgNSArLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA0NDkxZTY0
YjNmMDYuLjg0MGNjOWI5ZWZjOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+
IEBAIC0zMTYsMTAgKzMxNiw3IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfbGFuZTBfdWxwX21vZGVf
bGVhdmUoc3RydWN0IG10a19kc2kgKmRzaSkKPgo+ICBzdGF0aWMgYm9vbCBtdGtfZHNpX2Nsa19o
c19zdGF0ZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICB7Cj4gLSAgICAgICB1MzIgdG1wX3JlZzE7
Cj4gLQo+IC0gICAgICAgdG1wX3JlZzEgPSByZWFkbChkc2ktPnJlZ3MgKyBEU0lfUEhZX0xDQ09O
KTsKPiAtICAgICAgIHJldHVybiAoKHRtcF9yZWcxICYgTENfSFNfVFhfRU4pID09IDEpOwo+ICsg
ICAgICAgcmV0dXJuIChyZWFkbChkc2ktPnJlZ3MgKyBEU0lfUEhZX0xDQ09OKSAmIExDX0hTX1RY
X0VOKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19kc2lfY2xrX2hzX21vZGUoc3RydWN0IG10
a19kc2kgKmRzaSwgYm9vbCBlbnRlcikKPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
