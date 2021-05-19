Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB93C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:56:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FAB861042
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FAB861042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f0Aj3wuT8MCjinOYd7iqd/zD+3YkOFolALC62nrni5k=; b=VJhGY92Gg0bdWtDvIr0IoLqnf
	l/YpIpefO+PH/nyE+U5N30/77KucM4u73JiHZr8iqPF5L7fHugpP3iUfaw7RwXhDoYHwrhQqMRG0Y
	ngwLZKHXEv4U0ixQ7UAUSOLE1ADx1goq4+u+kCduJ2d1rFU2b2QP2d6XXAak0xVoJjFE3IifBx2q+
	72JgVKszyomaRQA5myLtlYnFKbFNDVZBmCQQyMrVEYw4hjY3d+01zdG1wm1zG7JK1FobeibkxxQUA
	Qhl1cVOUDUj/XcSUS/1zenT5AFyL0phS/zuIIoFicbAeih7qDF3DTThxRUJP6L9iJKCbUAEKrtroo
	ShSib4WBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNcj-004K6Z-FK; Wed, 19 May 2021 14:56:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNcg-004K5u-D5
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=TcnLMgk3EMo9jkH9TpEZzuKiB04bPbCebMcwHrbD+qg=; b=XD0h6bWNeoP0eN2lw250T72hFb
 bWFbVZAzahBY+vTfCJXQVEYo1cZy3r9O0LecEzB7WHIjbhyAGPxN8iUIZof8+ERZdtrM/Sb668AyR
 JQBbABbmtlXgZy3nhswABN+G4NCA2TRJwLShj2o5ovdUOoHpS4f4V0r06K3xBMLCJlfQgvxfH18i1
 7RbkF0h1QvCIlkuLi92EM2rbk0bmC1ud6nkZgsM8+Ss2I6F+SyQ+5cy5pJzkzcKW58DzsMdQsRcxs
 P7pLo9C0hdWBwm7HvjQaEap2Fqp3iuLadej4q87oZY4T12YH/vx4UDxRT7d400B6PcP2fa4aA9gD2
 LWLOOrTQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNcc-00FZS1-Nd
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:56:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id b7so6867453wmh.5
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TcnLMgk3EMo9jkH9TpEZzuKiB04bPbCebMcwHrbD+qg=;
 b=V+SdtypE4xlpNcukUIz7+rnbigJFfOWbTMO57yxPG7ZwijggmeShDYnwqZmmn56KxZ
 idYhyY742I/LYbfmVgqBm2hKUEzhVOhzAru6YtQ0DRnO2hWkI992SviytwV7DTSHB8Pp
 l5to2stUz2kFIVynuNcTQusV72v/brYjINEeRPg7HpyQB5GqJl72iyzyvRafD2ECViZf
 eyVJbGs/73jq4OTjuphwh7F4IPFLEnN3nOaoKeT+HnXRMfvhl8heKON+dMVgavWM6NX5
 AQp3zxzo8o9SJAI8tmlm4zzDfuUrCv8Dy006PFxiyjBD9tff3T8TYYdaWFlaja2/kwFs
 jooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TcnLMgk3EMo9jkH9TpEZzuKiB04bPbCebMcwHrbD+qg=;
 b=AV9jh0/piaBwBEtggrJWR1AC8B/tVWVxRZdpP13NuWjXnXOEYU40VdyizcVHkcxhFB
 DpwXs5II5mQ8z23zOm0yX2xBlGgUwQjCgxwutGSc0IXny81r1ZjXPjPJvgJ8+8wzHTwe
 a7eqY/NBG6tkYZb6wtsaIpH7se60ij+m4gTsH0FSJq6aijIr5c3DsXN/pFkWkhl9NN2x
 GxYYjleF0kQMbMhkLQZIk5RdisLYrmNICzW8+6K50hHbqzuhGPgohFKTktB6wk9nMR4u
 usXjquknTq3K9Pkou0J24yzhIC3wjX7riNya6167O9f6W56eky7IiDCqqDACZzaR4Ljo
 aPtQ==
X-Gm-Message-State: AOAM531UwZ88/u0EpdhUi+AAct060StR8Qc+t+20/DWK4CKYad1Cr7fm
 /yEjQIa4uAAyqj1kx5k1S7RdMA==
X-Google-Smtp-Source: ABdhPJwWi8UfWY+BRIFIIJjxTyVXDEB86reqO42x2vcnTAmYtjeygpZmvCXKoTSMEvPTxFwYAC0MJw==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr12017892wml.81.1621436188766; 
 Wed, 19 May 2021 07:56:28 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id i1sm19318338wmb.46.2021.05.19.07.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:56:28 -0700 (PDT)
Date: Wed, 19 May 2021 15:56:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: Re: [PATCH v8 0/10] mfd: mt6360: Merge different sub-devices I2C
 read/write
Message-ID: <20210519145626.GH2549456@dell>
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_075630_800246_B5CB8C2C 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxOCBNYXkgMjAyMSwgR2VuZSBDaGVuIHdyb3RlOgoKPiBUaGlzIHBhdGNoIHNlcmll
cyBtZXJnZSBkaWZmZXJlbnQgc3ViLWRldmljZSBJMkMgcmVhZC93cml0ZSBpbnRvIG9uZSBSZWdt
YXAgYW5kCj4gZml4IGNvZGluZyBzdHlsZSBmb3Igd2VsbC1vcmdhbml6ZWQuCj4gCj4gR2VuZSBD
aGVuICgxMCkKPiAgIG1mZDogbXQ2MzYwOiBSZWFycmFuZ2UgaW5jbHVkZSBmaWxlCj4gICBtZmQ6
IG10NjM2MDogUmVtb3ZlIHJlZHVuZGFudCBicmFja2V0cyBhcm91bmQgcmF3IG51bWJlcnMKPiAg
IG1mZDogbXQ2MzYwOiBJbmRpY2F0ZSBzdWItZGV2IGNvbXBhdGlibGUgbmFtZSBieSB1c2luZwo+
ICAgbWZkOiBtdDYzNjA6IENvbWJpbmUgbXQ2MzYwIHBtaWMvbGRvIHJlc291cmNlcyBpbnRvIG10
NjM2MAo+ICAgbWZkOiBtdDYzNjA6IFJlbmFtZSBtdDYzNjBfcG11X2RhdGEgYnkgbXQ2MzYwX2Rk
YXRhCj4gICBtZmQ6IG10NjM2MDogUmVuYW1lIG10NjM2MF9wbXUgYnkgbXQ2MzYwCj4gICBtZmQ6
IG10NjM2MDogUmVtb3ZlIGhhbmRsZV9wb3N0X2lycSBjYWxsYmFjayBmdW5jdGlvbgo+ICAgbWZk
OiBtdDYzNjA6IEZpeCBmbG93IHdoaWNoIGlzIHVzZWQgdG8gY2hlY2sgaWMgZXhpc3QKPiAgIG1m
ZDogbXQ2MzYwOiBNZXJnZSBoZWFkZXIgZmlsZSBpbnRvIGRyaXZlciBhbmQgcmVtb3ZlIHVudXNl
IHJlZ2lzdGVyIGRlZmluZQo+ICAgbWZkOiBtdDYzNjA6IE1lcmdlIGRpZmZlcmVudCBzdWItZGV2
aWNlcyBJMkMgcmVhZC93cml0ZQoKQWxsIGFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxp
bmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGlu
YXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
