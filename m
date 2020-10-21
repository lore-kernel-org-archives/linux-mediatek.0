Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB31C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 18:57:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6237221FB
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 18:56:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xvNcXomu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GrBOpz3B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6237221FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eAISIkRQ4G2Wc6z8fNFBhcyXr9i8ZA7W2R0spdJDY8k=; b=xvNcXomu5xa68ebY0e5mONmFx
	Y9nNXeNiagXk6/RukUmUdmoskr86wXzJrzT6ib/GPX337uz/rgtRwYtXRRcx2rWDQKaGI4zoXiNpC
	J7rnvx7NH20N/iuoBjdxZfrYuSqlshNWBbiWFGzamea4JDrQaGrSfjY9vfpy5rZzjVowt6CqCLb9M
	AYcI4in2JN7uaiEQQMECBxySqja8CY587+9x1IKAUb2BwFUL3aplHq9tDGFmzDVs5kAg/r4S1WUpp
	Slh4AwkDub/lklHVAv8SzXozk2m19asqiwJlOJLbHyB5QbtiLK7kWhRYfwNkEStyb3M22N9+wottv
	zvGSta+qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVJI2-0005EJ-9V; Wed, 21 Oct 2020 18:56:50 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVJHz-0005DE-2F
 for linux-mediatek@lists.infradead.org; Wed, 21 Oct 2020 18:56:48 +0000
Received: by mail-io1-xd43.google.com with SMTP id y20so4311043iod.5
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2020 11:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cc/K/PIuG41/PR7b04TzfA68X44vY0DhA0nNvxK+odE=;
 b=GrBOpz3B04eglI4Ou/H+aoMQQg7CO3n/sx11CnC2KFyl751f5YKbxaSJfAieTMWw+3
 kUWQ215pQELE9Py74xWRSY0RUbNNU8vjRkpRQdw7F2GGU/dlVP7gC2Eu6WVVw+Hv6gmq
 fT3Ik/FKSDcRA8IdinKj2EfiCJZ8PsY1Wpev4G37iKVKPC3gKiVcL75dRi5pCmlhLOnb
 xw6VL88vbHWo41Wgo35mqxEQH5kQUEKl7XojseMCtNHeMNA9jtXbEr72jh9Sdcuc9GaW
 bW/GP+M9fsP2tI1TpMf5ZvWbfEtZl4I+lpZjbzIxPbFgx9c8joumjuG2a2iPHZxVfnnB
 pD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cc/K/PIuG41/PR7b04TzfA68X44vY0DhA0nNvxK+odE=;
 b=NJ+W9AEA2uWD0kyFS+KQbdADMCzQtiRVd5+0FCyo33P+Y67YP7USj9RPOMvm3F5heU
 vQJjbRG7F8vAXKlzV3cnCWX6RMR+ZVPTnGBO6JajJLS/uQ0tQELZ7U5O5eUmtI6WIuBy
 e5TR9BMgFnAq71gWQBPePkDqvyNzDN7nskeHjxYMztcfZpiloExQAK8Km6+3NtPsrtM+
 HUlmzbk/rRBZMH9jyYca8uTr50lFENzi2i7zBj3Dq+4ec3SRONHizHw0m+dOh7m6Qsns
 snvNci3cikYw1dGUQX8lPfrGe/6epeElwmt2Ygaygr0N59m+Qevc57H9G5HMAyIGalRK
 77Bw==
X-Gm-Message-State: AOAM5311AN1v0RNaKREurq2X1IlLngX8YB2e+8PyIq0XnL+6h4hY0TzS
 Ov8fjovJzlMWZsrEsN+A+mEENHjGuNnDkKuh/jd/6A==
X-Google-Smtp-Source: ABdhPJyLG0RAlvFN8Zp7U5m+RnWUUNGK8TOymUgePPUKY/An2N5DmxSuoTuNWfKoZwAH4W8THjAuI9EyHl7jMFAlVZ4=
X-Received: by 2002:a05:6638:1243:: with SMTP id
 o3mr3993558jas.82.1603306603222; 
 Wed, 21 Oct 2020 11:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-3-fparent@baylibre.com>
 <CAAOTY_9m-nqCe1HanPv5xa3mVLpyG6mC1pF1FRAFJdU1jqza_A@mail.gmail.com>
In-Reply-To: <CAAOTY_9m-nqCe1HanPv5xa3mVLpyG6mC1pF1FRAFJdU1jqza_A@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 21 Oct 2020 20:56:32 +0200
Message-ID: <CAOwMV_wvf6v1acXjtuB3Sm83YNyf=A7ULJkEDz7RY7T7mijqHg@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: mediatek: dsi: add
 documentation for MT8167 SoC
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_145647_132536_D9673926 
X-CRM114-Status: GOOD (  21.73  )
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
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKCk9uIFdlZCwgT2N0IDIxLCAyMDIwIGF0IDc6MDEgUE0gQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEZhYmllbjoKPgo+
IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAyMOW5tDEw5pyIMjHm
l6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPiA+Cj4gPiBBZGQgYmluZGluZyBkb2N1bWVu
dGF0aW9uIGZvciB0aGUgTVQ4MTY3IFNvQy4gVGhlIFNvQyBuZWVkcwo+ID4gYW4gYWRkaXRpb25h
bCBjbG9jayBjb21wYXJlZCB0byB0aGUgYWxyZWFkeSBzdXBwb3J0ZWQgU29DOiBtaXBpMjZtLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29t
Pgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkc2kudHh0ICB8IDcgKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkc2kudHh0Cj4gPiBpbmRleCBmMDZmMjRkNDA1YTUuLjEwYWU2YmU3MjI1ZSAxMDA2NDQK
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRzaS50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiA+IEBAIC03LDEyICs3
LDEzIEBAIGNoYW5uZWwgb3V0cHV0Lgo+ID4KPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4g
IC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kc2kiCj4gPiAtLSB0aGUgc3VwcG9ydGVk
IGNoaXBzIGFyZSBtdDI3MDEsIG10NzYyMywgbXQ4MTczIGFuZCBtdDgxODMuCj4gPiArLSB0aGUg
c3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10NzYyMywgbXQ4MTY3LCBtdDgxNzMgYW5kIG10
ODE4My4KPiA+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhl
IGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiA+ICAtIGludGVycnVwdHM6IFRoZSBpbnRlcnJ1cHQg
c2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrLgo+ID4gIC0gY2xvY2tzOiBkZXZpY2UgY2xv
Y2tzCj4gPiAgICBTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Ns
b2NrLWJpbmRpbmdzLnR4dCBmb3IgZGV0YWlscy4KPiA+IC0tIGNsb2NrLW5hbWVzOiBtdXN0IGNv
bnRhaW4gImVuZ2luZSIsICJkaWdpdGFsIiwgYW5kICJocyIKPiA+ICstIGNsb2NrLW5hbWVzOiBt
dXN0IGNvbnRhaW4gImVuZ2luZSIsICJkaWdpdGFsIiwgImhzIgo+ID4gKyAgQ2FuIG9wdGlvbm5h
bGx5IGFsc28gY29udGFpbiAibWlwaTI2bSIKPgo+IEl0IHNlZW1zIHRoYXQgbWlwaTI2bSBpcyB0
aGUgY2xvY2sgb2YgbWlwaS10eC4gSW4gbXQ4MTczLmR0c2kgWzFdLAo+IG1pcGktdHgncyBjbG9j
ayBpcyAyNm0uCj4KPiBtaXBpX3R4MDogbWlwaS1kcGh5QDEwMjE1MDAwIHsKPiBjb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE3My1taXBpLXR4IjsKPiByZWcgPSA8MCAweDEwMjE1MDAwIDAgMHgx
MDAwPjsKPiBjbG9ja3MgPSA8JmNsazI2bT47Cj4gY2xvY2stb3V0cHV0LW5hbWVzID0gIm1pcGlf
dHgwX3BsbCI7Cj4gI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICNwaHktY2VsbHMgPSA8MD47Cj4gc3Rh
dHVzID0gImRpc2FibGVkIjsKPiB9Owo+Cj4gSWYgdGhpcyBpcyB0aGUgY2xvY2sgb2YgbWlwaS10
eCwgaXQgc2hvdWxkIGJlIGNvbnRyb2xsZWQgYnkgbWlwaS10eCBkcml2ZXIuCgpUaGFua3MsIEkg
d2lsbCBmaXggdGhhdCBpbiB2Mi4KCj4KPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaT9oPXY1LjkKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1L
dWFuZy4KPgo+ID4gIC0gcGh5czogcGhhbmRsZSBsaW5rIHRvIHRoZSBNSVBJIEQtUEhZIGNvbnRy
b2xsZXIuCj4gPiAgLSBwaHktbmFtZXM6IG11c3QgY29udGFpbiAiZHBoeSIKPiA+ICAtIHBvcnQ6
IE91dHB1dCBwb3J0IG5vZGUgd2l0aCBlbmRwb2ludCBkZWZpbml0aW9ucyBhcyBkZXNjcmliZWQg
aW4KPiA+IEBAIC0yNiw3ICsyNyw3IEBAIFRoZSBNSVBJIFRYIGNvbmZpZ3VyYXRpb24gbW9kdWxl
IGNvbnRyb2xzIHRoZSBNSVBJIEQtUEhZLgo+ID4KPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+
ID4gIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1taXBpLXR4Igo+ID4gLS0gdGhlIHN1
cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCA3NjIzLCBtdDgxNzMgYW5kIG10ODE4My4KPiA+ICst
IHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgNzYyMywgbXQ4MTY3LCBtdDgxNzMgYW5k
IG10ODE4My4KPiA+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2Yg
dGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiA+ICAtIGNsb2NrczogUExMIHJlZmVyZW5jZSBj
bG9jawo+ID4gIC0gY2xvY2stb3V0cHV0LW5hbWVzOiBuYW1lIG9mIHRoZSBvdXRwdXQgY2xvY2sg
bGluZSB0byB0aGUgRFNJIGVuY29kZXIKPiA+IC0tCj4gPiAyLjI4LjAKPiA+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
