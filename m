Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8654EC388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 16:49:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B482222267
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 16:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2K7n6rWQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="K5mKBqv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B482222267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bKwNfVmUOEtyHEjlEuz4E9ehbVHI1sWb1XtvDHMHh9Q=; b=2K7n6rWQ+AMtaVNe6dlYuLCL0
	bQTteFzLJ4OtEtu0ooIJ0LQvjnJqTfKKjotOE++c3+XWMz5ZAPJDV1tq7QzLYAth9PcxwE5L70UTT
	dwvfpLqnGgxr8s30xewWO5118rH66S/pnLwkszsH3oQPhMephnR6UYn3VPXwvaSAtZhFwzs0zi034
	lLuemHGI8tneKr31yMihi2HDSPMwOSMRSS08fOfTdVE48nSZZo9ijlE2ggJUo/MyMNCmgEkAIOr27
	g1Rl2IkgjUNEU0w7igTOKPtLkiA7o+crhGMHr4v+ZipYz4mFns03n5LaO23sp1yElqul08EayEpsZ
	TuGHJV6FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVdm2-0003UM-Dm; Thu, 22 Oct 2020 16:49:10 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVdlz-0003Qm-LB
 for linux-mediatek@lists.infradead.org; Thu, 22 Oct 2020 16:49:09 +0000
Received: by mail-io1-xd42.google.com with SMTP id r9so2346671ioo.7
 for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2020 09:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kojjrYIgLi9atE3HNeKW+cJYZwBv9lJxNp3JGQTWaRE=;
 b=K5mKBqv7cFoRmE22R/SIBPXgp7gvRB4sBDus74dJx6EmpRVudHOEVDoogQnspJqgXK
 H1+0glvjt/unvvGqucop/d2nz3n2nfx33WbtnVA4BnPNI3dcL6JkqJ0qQt6UpV8EKYPJ
 rWS6KSPUHGtGC3xjgm5Cw4sKACUyGO902TBx2Y/N6g9Y56VbPw0jbMXl344rCGF9OZig
 Hv/Dp4/6U4Cdajs5wMQNivLMVRiVubZij2UhC7tylU1qo6fpuSee2/6nhkK7heeaHm59
 7Xp9pYjYEPMby7cdkhG6LVymKnqxEu/fvw0AQke7RKF7pfK1vx8NMgnB0ynKi+oPPaE3
 wI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kojjrYIgLi9atE3HNeKW+cJYZwBv9lJxNp3JGQTWaRE=;
 b=bzpR07PnA9E432MAi5Fud7t/2Q0M6M0ehWoaEe9h4lZenL9i/M4vjnuLM1sEkz5Xjh
 rMYRX8JHc5fMrrncIj9FUuPePbPOSsi+TIC6dCcz1X2mgTCpcA9f72E0mLfZ0Q35etB/
 CoRAVS+9HkawUspzwX4mM+GEocg8RRlO+Av/OyF9Q/qkVUrgHrBV09whZJeD8uh8RnnO
 aVuQkK6FrWaYW4hTDEmQVbPCj9IBVpcV28B4xVU0kEavFUeIx/eA/YGy53d1w9LCSLLl
 41961ToEyWHKrG8tbUI6MO8njgiRnEQ1doXsPO+qfWNwrV+VddMxxNPi8XJJjmonJUXP
 KD2A==
X-Gm-Message-State: AOAM531My45cXH3WmFZF/CqX8U62j9PlHlCrNINB02TiqaUNtbQa1vqF
 JKXeXx4sjM5tKdO38+pZuqvEnn2s3KzJ3TOxRpXPpA==
X-Google-Smtp-Source: ABdhPJzzXab4wojjo0aZU7//8U9GW/iQAWpNHIt2AGa+iJXMyyAIuiUtYo/vxW5cBuLPfvukrTY8jeMKX0DFbYpGYeg=
X-Received: by 2002:a5e:c112:: with SMTP id v18mr2520610iol.195.1603385345691; 
 Thu, 22 Oct 2020 09:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-5-fparent@baylibre.com>
 <CAAOTY_9Y98yHq7GcypUMryG4jMEdrDJeCeRXEKX3mb5g39y+sg@mail.gmail.com>
In-Reply-To: <CAAOTY_9Y98yHq7GcypUMryG4jMEdrDJeCeRXEKX3mb5g39y+sg@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Thu, 22 Oct 2020 18:48:54 +0200
Message-ID: <CAOwMV_yybF9j6GZpHfz3WjAHSQhQo=Ot+2frSkN6dpODe3nwCQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/mediatek: dsi: add pdata variable to start clk in
 HS mode
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_124907_828590_3FDFF756 
X-CRM114-Status: GOOD (  24.30  )
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

SGkgQ2h1bi1LdWFuZywKCk9uIFdlZCwgT2N0IDIxLCAyMDIwIGF0IDc6MDcgUE0gQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEZhYmllbjoKPgo+
IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAyMOW5tDEw5pyIMjHm
l6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPiA+Cj4gPiBPbiBNVDgxNjcsIERTSSBzZWVt
cyB0byB3b3JrIGZpbmUgb25seSBpZiB3ZSBzdGFydCB0aGUgY2xrIGluIEhTIG1vZGUuCj4gPiBJ
ZiB3ZSBkb24ndCBzdGFydCB0aGUgY2xrIGluIEhTIGJ1dCB0cnkgdG8gc3dpdGNoIGxhdGVyIHRv
IEhTLCB0aGUKPiA+IGRpc3BsYXkgZG9lcyBub3Qgd29yay4KPiA+Cj4gPiBUaGlzIGNvbW1pdCBh
ZGRzIGEgcGxhdGZvcm0gZGF0YSB2YXJpYWJsZSB0byBiZSB1c2VkIHRvIHN0YXJ0IHRoZQo+ID4g
RFNJIGNsayBpbiBIUyBtb2RlIGF0IHBvd2VyIG9uLgo+Cj4gVGhpcyBwYXRjaCBsb29rcyBsaWtl
IGEgaGFjayBwYXRjaC4gSWYgeW91IGNvd29yayB3aXRoIE1lZGlhdGVrLAo+IHBsZWFzZSBmaW5k
IG91dCB0aGUgY29ycmVjdCBzb2x1dGlvbiBvciBnaXZlIGEgcmVhc29uYWJsZSBleHBsYW5hdGlv
bi4KPiBJZiB5b3UgY291bGQgbm90IGdldCBoZWxwIGZyb20gTWVkaWF0ZWssIEkgd291bGQgd2Fp
dCBmb3IgY29tbWVudCBvbgo+IHRoaXMgcGF0Y2guCgpJdCBzZWVtcyB0aGF0IHRoaXMgd29ya2Fy
b3VuZCBpcyBiZWNhdXNlIG9mIGEgc3BlY2lmaWMgZGlzcGxheSBhbmQgbm90CmJlY2F1c2Ugb2Yg
YSBzcGVjaWZpYyBpc3N1ZSBvZiB0aGUgTVQ4MTY3IERTSSBJUC4gSSB3aWxsIGRyb3AgdGhpcwpw
YXRjaCBpbiB2Mi4KCj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMyArKy0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jCj4gPiBpbmRleCA0YTE4OGE5NDJjMzguLjQ2MTY0M2MwNTY4OSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+IEBAIC0xNzUsNiArMTc1LDcg
QEAgc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgewo+ID4gICAgICAgICBjb25zdCB1MzIgcmVn
X2NtZHFfb2ZmOwo+ID4gICAgICAgICBib29sIGhhc19zaGFkb3dfY3RsOwo+ID4gICAgICAgICBi
b29sIGhhc19zaXplX2N0bDsKPiA+ICsgICAgICAgYm9vbCB1c2VfaHNfb25fcG93ZXJfb247Cj4g
PiAgfTsKPiA+Cj4gPiAgc3RydWN0IG10a19kc2kgewo+ID4gQEAgLTY3MSw3ICs2NzIsNyBAQCBz
dGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ID4KPiA+ICAg
ICAgICAgbXRrX2RzaV9jbGtfdWxwX21vZGVfbGVhdmUoZHNpKTsKPiA+ICAgICAgICAgbXRrX2Rz
aV9sYW5lMF91bHBfbW9kZV9sZWF2ZShkc2kpOwo+ID4gLSAgICAgICBtdGtfZHNpX2Nsa19oc19t
b2RlKGRzaSwgMCk7Cj4gPiArICAgICAgIG10a19kc2lfY2xrX2hzX21vZGUoZHNpLCAhIWRzaS0+
ZHJpdmVyX2RhdGEtPnVzZV9oc19vbl9wb3dlcl9vbik7Cj4gPgo+ID4gICAgICAgICByZXR1cm4g
MDsKPiA+ICBlcnJfZGlzYWJsZV9lbmdpbmVfY2xrOgo+ID4gLS0KPiA+IDIuMjguMAo+ID4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
