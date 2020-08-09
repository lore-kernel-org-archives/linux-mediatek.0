Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E387C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:17:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D122067D
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E00IF0P/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vv9wm6DI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16D122067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U95MO3p2skp4LohT/wt11v1Otv+MLIq22km1S4PXD3I=; b=E00IF0P/q3muC+/dZgtLHYq+S
	Gv8UaFKfA1qOCcBeSLGnjbsyHJhox9IVl9sPF9qy3Q1bBCg65dRz/zbxswu2dTRZk6YmQBz2eupmb
	/kEX7bwqCTAlpd3/k41YzRdcJ6kfn69LBiR0FjwwuRFj9Z5gXLMazunjg2OhzbibJSgC3fCSgdwet
	Zpro9B+01U60grgOMVvag1qXh1mL9F3Gnkk1jKOOWJwhmygpNhEl2TzxwVS9AkFya+otSMsbgYCLt
	hQcmzhDSyWYcrokD2fYyBSQaeX+wQmT7V1F7RZJEDqHDocNUyj0dRduktFQztsm5ZXVvk2j96PxYC
	7Jvw+boxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4Z1h-0004tm-Lb; Sun, 09 Aug 2020 00:17:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4Z1c-0004sW-Hl; Sun, 09 Aug 2020 00:17:21 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 424E22068F;
 Sun,  9 Aug 2020 00:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596932232;
 bh=uzR2Q9T845pna8XP3B5MtZKhh2vQixFYmQxSnDQle0Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Vv9wm6DIxUbHozRvA1AyxMizji9rUv8gSn3bnmKzgNyQUT59XCuSpVianl1FP2xDO
 NSa6d3yKuHd8zLwIotp5zI0vf34jeLzSopbflNOV58GA3NKWOO1xrTfdkvhQG92GG4
 0YgAHkE74fzWggP0wdmyN1FmG2fZVztME3deAnKA=
Received: by mail-ej1-f42.google.com with SMTP id t10so1487041ejs.8;
 Sat, 08 Aug 2020 17:17:12 -0700 (PDT)
X-Gm-Message-State: AOAM530V6E6NRRQD53Dh9FmgqgDNJclnLudv4s5+BH/lRvSqmGP0m6g5
 O2ZXNlc3YXrOShDCTyBBb0CzL3jM28vwjrIn0Q==
X-Google-Smtp-Source: ABdhPJxtuqSyNCglh1lnoj77PKcLmVpUqyOklSdTDUwAHMVSJ1wm9tl/cLlSapqD2wcderKhmNy5ajxAxrVAyBhhL3s=
X-Received: by 2002:a17:906:60d5:: with SMTP id
 f21mr15560600ejk.94.1596932230832; 
 Sat, 08 Aug 2020 17:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
In-Reply-To: <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 08:16:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
Message-ID: <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to
 mt7623n.dtsi
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_201720_716612_E524F1EA 
X-CRM114-Status: GOOD (  20.25  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 chunkuang Hu <chunkuang.hu@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0OOaciDjml6Ug6YCx5YWtIOS4i+WNiDg6Mjflr6vpgZPvvJoKPgo+IEhpLAo+Cj4g
YXMgaSBtYWRlIGEgbWlzdGFrZSBpbiBjb3Zlci1sZXR0ZXIsIGl0IGlzIG5vdCBhc3NpZ25lZCB0
byB0aGUgc2VyaWVzLgo+Cj4gdG8gc2hvdyBpdHMgY29udGVudCwgaSBzZW5kIGl0IGhlcmUgYXMg
Y29tbWVudCAoaW5zdGVhZCBvZiByZXNlbmRpbmcgdGhlIHdob2xlIHNlcmllcyk6Cj4KPiBiYXNl
ZCBvbiBzZXJpZXMgZnJvbSBEYXZpZCBXb29kaG91c2UgWzFdCj4gaSBtb3ZlZCBtb3JlIGRpc3Bs
YXktbm9kZXMgb3V0IG9mIG10NzYyMy5kdHNpIHRvIG5ldyBtdDc2MjNuLmR0c2kKPiBhbmQgY2hh
bmdlZCBsYXN0IHBhcnQgZnJvbSBteSBzZXJpZXMgWzJdIHRvIGFkZCB0aGVzZSBub2RlcyB0byB0
aGlzIG5ldyBkdHNpCj4KPiB0aGUgZGVwZW5jeSBvZiBkdHNpLWR0c2ktZHRzIGlzIGFscmVhZHkg
ZG9uZSBmb3IgbXQ3NjIzYSwgc28gaSBndWVzcyBpdCdzIGEgZ29vZAo+IHdheSB0byB1c2UgaXQg
Zm9yIG10NzYyM24gdG9vLgo+Cj4gdGhpcyBmaXJzdCBzZXQgaXMgYW4gUkZDIGlmIGFsbCBub2Rl
cyBhcmUgaW4gcmlnaHQgb3JkZXIgYW5kIGlmIGl0IGlzIHdhbnRlZCB0byBtb3ZlCj4gdGhlbSBv
dXQgYXMgaSBoYXZlIG5vIHRlY2huaWNhbCBkb2N1bWVudCBhYm91dCBtdDc2MjNhL24gd2hpY2gg
ZGVzY3JpYmVzIHdoaWNoIHBhcnRzCj4gYXJlIGF2YWlsYWJsZSBvbiBib3RoIG9yIG9ubHkgb24g
b25lIG9mIHRoZW0KPgo+IGFkZGVkIE1USyBEUk0gTWFpbnRhaW5lciBDSyBIdSwgUnlkZXIgTGVl
IGFuZCBTZWFuIFdhbmcsIG1heWJlIHRoZXkgY2FuIGdpdmUgbWUgc29tZSBhZHZpY2UKPiBob3cg
dG8gcHJvY2VlZCBmdXJ0aGVyIGhlcmUKPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTMyOTIwOQo+IFsyXSBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNzAwNjk5LwoKSSB3b3VsZCBsaWtlIHRv
IHB1dCBhbGwgZGV2aWNlIGluIG10NzYyMy5kdHNpIHdpdGggc29tZSBkZXZpY2UncwpzdGF0dXMg
aXMgImRpc2FibGVkIiBhbmQgY2hhbmdlIGl0cyBzdGF0dXMgaW4gcGxhdGZvcm0gZHRzaS4KSSB3
b3VsZCBsaWtlIHRvIHNlZSBhbGwgZGV2aWNlIGluIG10NzYyMy5kdHNpIGJlY2F1c2Ugb2YgaXRz
IG5hbWUuIElmCnlvdSBtb3ZlIHNvbWUgZGV2aWNlIHRvIHBsYXRmb3JtIGR0c2ksIHdlIHdvdWxk
IHRyYWNlIGFsbCBwbGF0Zm9ybQpkdHNpIHRvIGZpbmQgb3V0IGhvdyBtYW55IGRldmljZSBpbiBt
dDc2MjMuIE9uZSBkYXkgYSBuZXcgcGxhdGZvcm0KZW5hYmxlIGRpZmZlcmVudCBkZXZpY2VzLCB5
b3Ugd291bGQgcmVvcmdhbml6ZSBhbGwgdGhlc2UgcGxhdGZvcm0KZHRzaT8KClJlZ2FyZHMsCkNo
dW4tS3VhbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
