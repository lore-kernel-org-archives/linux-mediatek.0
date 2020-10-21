Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C88DC4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 23:42:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC2524170
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 23:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uy6Jy7Tl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1unrDcja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC2524170
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=baFv8ranY/joeqJW1Ib9ZfaLtsQqNJxtPk0FZqpbzpc=; b=Uy6Jy7TlY/U3v7S8Qme4DCiXl
	91dRXfuMgCajmjNCxGvoYz/fWUMd/R6loz29zeug7YI1twqNR/F4brxtVV1WbT+I1iT18z7SNxuSr
	d/Piq2owQkTEQoJs4Yb153ekZKfzPwtMK8DcbfFV0k9D8qiEcYAJRqdetdCn+VWfE1fGIotu+ZizT
	5BR6ysW0mssxHURi0IAI+ZGfjexwcDr2eFcZbCCPSEy3OL8XDxR+OE0gPTMCB1jaSZF5xSJEVkH07
	HGj04cjRfKjfAWHI0pNQ1tRkTtTllLkBerElwvel9Jr2gHPvXPC7pjGmPaCogDDHZ03hzCSD9/4Dp
	eiOayUOPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVNka-0002eF-I9; Wed, 21 Oct 2020 23:42:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVNkS-0002bA-VB; Wed, 21 Oct 2020 23:42:29 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB6612417F;
 Wed, 21 Oct 2020 23:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603323748;
 bh=BESI+542e7zfS3UEqo6HAOXoKEmppsFmRI/GraPxDPQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1unrDcjabHeLDDqS/apsiljcFHGIO18AqDTOVKbU+vvALlFaGbNzUssIB6t1VFqK7
 EGSjXx5bDIFwmnNpkGTQxnF1O7La4nHIbZXzKKHB6W+idmBfQytHpuwMZmrYXuRjy+
 Z2GVPU9PeH5FzPjjkFzFe6tAI9Y2170ZsxaPz7zk=
Received: by mail-ej1-f52.google.com with SMTP id o26so5681203ejc.8;
 Wed, 21 Oct 2020 16:42:27 -0700 (PDT)
X-Gm-Message-State: AOAM533Vvl3wyVdn/5GxA35/tQCF7RttlM/rruAJbCx+EExXYoh1DXcJ
 dOwpKHRfnYVD+iMegqTVekWeVWjyrokScox/AA==
X-Google-Smtp-Source: ABdhPJwgMVbl3VYJeXaSvXiI9nwXO3E9FGk9CZ7wEou8onpN28BE+CNBywsvzb2a+LmZGUfNobLk6I2nGy6MQrV80nI=
X-Received: by 2002:a17:906:3b8e:: with SMTP id
 u14mr5725503ejf.127.1603323746144; 
 Wed, 21 Oct 2020 16:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-4-fparent@baylibre.com>
In-Reply-To: <20201020174253.3757771-4-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 07:42:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8vDopCaJ+=kZwhTPgM0ioTL=PdCdQLjgWMdyJHkyD=Pw@mail.gmail.com>
Message-ID: <CAAOTY_8vDopCaJ+=kZwhTPgM0ioTL=PdCdQLjgWMdyJHkyD=Pw@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/mediatek: add disp-color MT8167 support
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_194229_150496_BF90F283 
X-CRM114-Status: GOOD (  17.68  )
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
Cc: DTML <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0
IGZvciBkaXNwLWNvbG9yIG9uIE1UODE2NyBTb0MuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFiaWVuIFBh
cmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9jb2xvci5jIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfY29sb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5j
Cj4gaW5kZXggM2FlOWM4MTA4NDViLi5hMTIyN2NlZmJmMzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYwo+IEBAIC0xNiw2ICsxNiw3IEBACj4KPiAgI2Rl
ZmluZSBESVNQX0NPTE9SX0NGR19NQUlOICAgICAgICAgICAgICAgICAgICAweDA0MDAKPiAgI2Rl
ZmluZSBESVNQX0NPTE9SX1NUQVJUX01UMjcwMSAgICAgICAgICAgICAgICAgICAgICAgIDB4MGYw
MAo+ICsjZGVmaW5lIERJU1BfQ09MT1JfU1RBUlRfTVQ4MTY3ICAgICAgICAgICAgICAgICAgICAg
ICAgMHgwNDAwCj4gICNkZWZpbmUgRElTUF9DT0xPUl9TVEFSVF9NVDgxNzMgICAgICAgICAgICAg
ICAgICAgICAgICAweDBjMDAKPiAgI2RlZmluZSBESVNQX0NPTE9SX1NUQVJUKGNvbXApICAgICAg
ICAgICAgICAgICAoKGNvbXApLT5kYXRhLT5jb2xvcl9vZmZzZXQpCj4gICNkZWZpbmUgRElTUF9D
T0xPUl9XSURUSChjb21wKSAgICAgICAgICAgICAgICAgKERJU1BfQ09MT1JfU1RBUlQoY29tcCkg
KyAweDUwKQo+IEBAIC0xNDgsNiArMTQ5LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rp
c3BfY29sb3JfZGF0YSBtdDI3MDFfY29sb3JfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuY29s
b3Jfb2Zmc2V0ID0gRElTUF9DT0xPUl9TVEFSVF9NVDI3MDEsCj4gIH07Cj4KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZGlzcF9jb2xvcl9kYXRhIG10ODE2N19jb2xvcl9kcml2ZXJfZGF0YSA9
IHsKPiArICAgICAgIC5jb2xvcl9vZmZzZXQgPSBESVNQX0NPTE9SX1NUQVJUX01UODE2NywKPiAr
fTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3BfY29sb3JfZGF0YSBtdDgxNzNf
Y29sb3JfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAuY29sb3Jfb2Zmc2V0ID0gRElTUF9DT0xP
Ul9TVEFSVF9NVDgxNzMsCj4gIH07Cj4gQEAgLTE1NSw2ICsxNjAsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG10a19kaXNwX2NvbG9yX2RhdGEgbXQ4MTczX2NvbG9yX2RyaXZlcl9kYXRhID0gewo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGlzcF9jb2xvcl9kcml2ZXJf
ZHRfbWF0Y2hbXSA9IHsKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAx
LWRpc3AtY29sb3IiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDI3MDFfY29sb3JfZHJpdmVyX2Rh
dGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZGlzcC1jb2xv
ciIsCj4gKyAgICAgICAgIC5kYXRhID0gJm10ODE2N19jb2xvcl9kcml2ZXJfZGF0YX0sCj4gICAg
ICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kaXNwLWNvbG9yIiwKPiAgICAg
ICAgICAgLmRhdGEgPSAmbXQ4MTczX2NvbG9yX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHt9LAo+
IC0tCj4gMi4yOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
