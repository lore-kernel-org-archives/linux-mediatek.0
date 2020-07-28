Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21BEC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:56:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D96D207F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:56:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qbti0MHE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AN/2BJ8f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D96D207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tyjcDZIMKEHy1SijpmdpLwhZhRGswAgvYVdtAXpXyEI=; b=qbti0MHEU/dIBOmVXJ8r2g/oA
	adZfak6nqxMvbLiLcX4uJqRHDQ/skFXwHwvkWn/kQOOQhgo/iZx4rmdu+rBBDt1DfKfSZXWaKcF03
	zXTr8UpcKQ6gb2ftSNC/rRwgFIkbJ7c0lNxZwsChda/GlkPY/TpsDimHrpUMNkPe5ysk71f0C+661
	cK0gHJCv4tUBZBYFgz9RZRsMNgshXTih8+M10AXZ6HtjtkpCNl1bnjrrQ4W+u5LORuRS/IiRIxN1d
	jaRa37to+iSf/g4PRAHD/hfeTeaTcJhz6JJbpV5Q16Cc2ZPPzTo+2/7DcYQbM/N3dmm7Cwcg6DDC2
	EJx3RZMSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0JXK-0005eU-TY; Tue, 28 Jul 2020 06:56:30 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0JXF-0005c4-3D
 for linux-mediatek@lists.infradead.org; Tue, 28 Jul 2020 06:56:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id g10so14874698wmc.1
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 23:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EzvrXWpHQNdpSbezzz5RHbcrWIdGyn8mBuYW7/LNbzE=;
 b=AN/2BJ8ftihaC5U7VYaGUe51vSbgZBy0qgZKto5kdNZYHnMMU0klhv9/thZCz2DkDt
 dDxR2di/EgMBX5g/fOZXZcBeU6DbcT57YbEGbJG/kTWUuSOzJzV8O4RMU0+EmduM9cMg
 2YrS+SqmfKDxhdBRo9CudmQrzMu35wRH3I1IJhs5caPwQ/jktBAkwH5iELcp/UkXRYWm
 S+Nr7PQ10VU16ICkcXkIjg2pYuJo9zNlFLGGib/eOzI2BX80dftzNtJBkpsj+WGeqrUR
 KHX2zV1SA8I2AjT0Eh4rPiWPbMSSyEu8lfLb+CgqlqnkZpfy93Xsa3lnz7qGBm64apHu
 76sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EzvrXWpHQNdpSbezzz5RHbcrWIdGyn8mBuYW7/LNbzE=;
 b=j3OG2P2SQG1rPjaLI8PqDAA599zIYP9gVlht09gP2GuIlfk8IW3vmCbjWmBF5vibwc
 xZDD+0beaoHZu0d4E5PamM7pIl6+qz0lCSWR4QP5BrB3/zYzzIW1rybUAfU6VkWz43xi
 PO4ZiA3ZF/rVnZvoVYfBYbkQKXAbREi7r14i06WDhphyTwGRsWaifyU5DXT7vgMT/32W
 eIcfxr68z/gt3xDzvIchvXLlc5JgdzOokvCfj1Xt6J2epieVsefYoS7hOhmlSLqQSq9Y
 S4Ooq75hUwPbiKMWM+/BUm+PvURd8z40EqOqPigQ1+t5Pxc6Sjgf1ZQX6SiXMnNnGcyl
 Ld9w==
X-Gm-Message-State: AOAM5331CEvdOckiK+APA1Wc3pLjKVFuqrC6SWoIDB6Kx+21KN08R8nr
 hpxbET66foPtH0ISTIkHlRc1Jw==
X-Google-Smtp-Source: ABdhPJz2E995BnQURgOq+VOSHacfZHoxet9ax0lW2Q3YzkefTZM18rSXI9SMEvORfr9BIIubRt2bgA==
X-Received: by 2002:a1c:2d89:: with SMTP id t131mr2655127wmt.151.1595919383931; 
 Mon, 27 Jul 2020 23:56:23 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id 78sm2777722wma.31.2020.07.27.23.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 23:56:23 -0700 (PDT)
Date: Tue, 28 Jul 2020 07:56:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 1/9] mfd: mt6360: Rearrange include file
Message-ID: <20200728065621.GC1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200727110821.GH1850026@dell>
 <CAE+NS34FexE-LwbzkOLepKytKCbKm3RowPQKqROR_a6wCrVLLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS34FexE-LwbzkOLepKytKCbKm3RowPQKqROR_a6wCrVLLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_025625_462694_BA2D58C8 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyOCBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDfmnIgyN+aXpSDpgLHkuIAg5LiL5Y2INzowOOWv
q+mBk++8mgo+ID4KPiA+IE9uIEZyaSwgMTcgSnVsIDIwMjAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+
Cj4gPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPgo+ID4g
PiBSZWFycmFuZ2UgaW5jbHVkZSBmaWxlIHdpdGhvdXQgc29ydGluZyBieSBhbHBoYWJldC4KPiA+
Cj4gPiBXaHkgYXJlIHlvdSBtYWtpbmcgdGhpcyBjaGFuZ2U/Cj4gPgo+IAo+IFBlcnNvbmFsIGNv
ZGluZyBzdHlsZSByZWZlcmVuY2VzIGZyb20gdXBzdHJlYW0gY29kZS4KPiBJIGNhbiBkaXNjYXJk
IHRoaXMgY2hhbmdlIGlmIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZS4KClRoYXQgaXMgcmVhbGx5IHdy
b25nLgoKVGhpcyBpcyB1cHN0cmVhbSBjb2RlLiAgWW91IHNob3VsZCBhYmlkZSBieSB0aGUgY29k
aW5nIHN0eWxlLgoKSW5jbHVkZSBmaWxlcyBzaG91bGQgYmUgYXJyYW5nZWQgYWxwaGFiZXRpY2Fs
bHksIG5vdCBhcmJpdHJhcmlseS4KCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2Vu
ZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbWZkL210NjM2MC1j
b3JlLmMgfCAxMSArKysrKy0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZk
L210NjM2MC1jb3JlLmMgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+IGluZGV4IGU5
Y2FjYzIuLmRmNDUwNmYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3Jl
LmMKPiA+ID4gKysrIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiBAQCAtNSwxNSAr
NSwxNCBAQAo+ID4gPiAgICogQXV0aG9yOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNv
bT4KPiA+ID4gICAqLwo+ID4gPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4g
PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2kyYy5o
Pgo+ID4gPiAtI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9j
cmM4Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L3JlZ21hcC5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ID4gPiAt
I2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L21mZC9jb3Jl
Lmg+Cj4gPiA+IC0jaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPiA+IC0jaW5jbHVkZSA8bGlu
dXgvb2ZfaXJxLmg+Cj4gPiA+IC0jaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KPiA+ID4g
LSNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+Cj4gPiA+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgv
bWZkL210NjM2MC5oPgo+ID4gPgo+ID4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9y
IFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
