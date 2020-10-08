Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015F8C43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 00:01:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B8A20739
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 00:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Te2q1ftE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2pt31eEE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76B8A20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GUwHTCKFv3PccjdZsnNC66RNvYeQIQn5fdjcrgaVnKI=; b=Te2q1ftE0g06KXninf7PhM4sF
	0uRkrv41T8KmRFQb4a6YUlgcJdzX12LMqeurwuQ5ht0caxo3R5QrndNmwN4yQOosldNZYUa4r0MK9
	TW8N2+6znnWU5lmQrCIWCoC5MRryprWODFNjQ39zP0YxCLl1b0zkmaKajLxltCoJCq8Y6w+bXx1r0
	eG98l8czOQCGlGonSk7F+qkOq7tUskXD7ACIzlMAYgbWALGpmoyC4vh3nCejGQTiPZpM+OgdeGK7o
	SamQ9KfMLsh8sG9wj3rCExKLPvfL1hjH4eLTgZsI+OYGWNVv8H9DuoWZBr+0gHySXY39782wnddBn
	iFKFIeayQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQJNE-00012u-SU; Thu, 08 Oct 2020 00:01:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQJNA-00011n-DG; Thu, 08 Oct 2020 00:01:29 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85B72212CC;
 Thu,  8 Oct 2020 00:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602115285;
 bh=DQSQgnf7iZN9oYiYCpxCoUi+P0CeJf5tjxkIeK1NTSU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2pt31eEE2afgzpWpq2IhHZO3N1ID2FEFu00XbkVtKKFAOjq1Tfwn/lcd6Z8VHVFyE
 TUBxWztRZpZSGsBDEGV9x+96DtTas0+0jP7c8c/t7y8hbW++rpWpWQKOkDYM2cSTu6
 47DKS+qi/se9zuQpb23EtolCoT6TkxDCZTRFbwno=
Received: by mail-ed1-f48.google.com with SMTP id b12so3976595edz.11;
 Wed, 07 Oct 2020 17:01:25 -0700 (PDT)
X-Gm-Message-State: AOAM531YAv7eLIvPhCnM6o+Y8Ic3JBhQSor6h6OnD429JnkVKwiEsQ5D
 MvEg6EXbAtrUvLa20Qj78qhErcgaEjQ2o75/YQ==
X-Google-Smtp-Source: ABdhPJwAznF2oZv2XNaUDfOTBX5/13+HntqtKHAHMCYO1QVKA8/FxWkmX5F2efLji9U+4yq9OgRkvGIS89wIpEMwPKE=
X-Received: by 2002:aa7:c3ca:: with SMTP id l10mr6393321edr.72.1602115284045; 
 Wed, 07 Oct 2020 17:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-5-enric.balletbo@collabora.com>
In-Reply-To: <20201006193320.405529-5-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 8 Oct 2020 08:01:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY__X8L2sK0s3rkq2LDaMNoQrZKfzn=aJ791fK=UwnJMAyQ@mail.gmail.com>
Message-ID: <CAAOTY__X8L2sK0s3rkq2LDaMNoQrZKfzn=aJ791fK=UwnJMAyQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] soc: mediatek: mmsys: Use an array for setting the
 routing registers
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_200128_728392_A5BEF474 
X-CRM114-Status: GOOD (  15.41  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQxMOaciDfml6Ug6YCx5LiJIOS4iuWNiDM6MzPlr6vpgZPvvJoK
Pgo+IEZyb206IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4KPiBBY3R1YWxseSwgc2V0dGlu
ZyB0aGUgcmVnaXN0ZXJzIGZvciByb3V0aW5nLCB1c2UgbXVsdGlwbGUgJ2lmLWVsc2UnIGZvciBk
aWZmZXJlbnQKPiByb3V0ZXMsIGJ1dCB0aGlzIGNvZGUgd291bGQgYmUgbW9yZSBhbmQgbW9yZSBj
b21wbGljYXRlZCB3aGlsZSB3ZQo+IHN1cHBvcnQgbW9yZSBhbmQgbW9yZSBTb0NzLiBDaGFuZ2Ug
dGhhdCBhbmQgdXNlIGEgdGFibGUgcGVyIFNvQyBzbyB0aGUKPiBjb2RlIHdpbGwgYmUgbW9yZSBw
b3J0YWJsZSBhbmQgY2xlYXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0
ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJh
bGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmMgfCAzOTMgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjEwIGluc2VydGlvbnMoKyksIDE4MyBkZWxldGlvbnMoLSkKPgoKW3NuaXBdCgo+
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10MjcwMV9tbXN5
c19kcml2ZXJfZGF0YSA9IHsKPiBAQCAtOTMsMTAgKzExNSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10Njc5N19tbXN5c19kcml2ZXJfZGF0YSA9IHsKPiAg
ICAgICAgIC5jbGtfZHJpdmVyID0gImNsay1tdDY3OTctbW0iLAo+ICB9Owo+Cj4gLXN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE3M19tbXN5c19kcml2ZXJfZGF0
YSA9IHsKPiAtICAgICAgIC5jbGtfZHJpdmVyID0gImNsay1tdDgxNzMtbW0iLAo+IC19Owo+IC0K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEgbXQ4MTgzX21tc3lz
X2RyaXZlcl9kYXRhID0gewo+ICAgICAgICAgLmNsa19kcml2ZXIgPSAiY2xrLW10ODE4My1tbSIs
Cj4gIH07Cj4gQEAgLTEwNiwxODAgKzEyNCwxOTIgQEAgc3RydWN0IG10a19tbXN5cyB7Cj4gICAg
ICAgICBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhICpkYXRhOwo+ICB9Owo+Cgpb
c25pcF0KCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE3
M19tbXN5c19kcml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5jbGtfZHJpdmVyID0gImNsay1tdDgx
NzMtbW0iLAo+ICsgICAgICAgLnJvdXRlcyA9IG10ODE3M19tbXN5c19yb3V0aW5nX3RhYmxlLAo+
ICsgICAgICAgLm51bV9yb3V0ZXMgPSBBUlJBWV9TSVpFKG10ODE3M19tbXN5c19yb3V0aW5nX3Rh
YmxlKSwKPiArfTsKPgoKSSByZW1vdmUgbXkgUmV2aWV3ZWQtYnkgdGFnLiBZb3UgZG9lcyBub3Qg
c2V0IHJvdXRlcyBmb3IgbXQyNzAxIGFuZAptdDI3MTIsIGJ1dCB0aGVzZSB0d28gU29DIG5lZWQg
dGhhdC4gTWF5YmUgbm93IHRoZXkgdXNlIHRoZSBzYW1lIHRhYmxlCmFzIG10ODE3My4KClJlZ2Fy
ZHMsCkNodW4tS3VhbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
