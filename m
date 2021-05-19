Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8605C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 11:04:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2454660FE8
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 11:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2454660FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6v4ZAR7OLc41F9TD5KBSlcR7LA3UiaBaCAJyxKThsxc=; b=gXPjAqD/0yGP1NVvjf3jr5bW1
	4HFAwnsUJUKMVYY8+sht2vNKwtk9VU/RN2naWq1HRMvWQT2y4JWd3dLVsqgWClzoNv787YceWSE/c
	R6jwkMI2h42D3naOZquHihXNknWMo1UNOSr2tzHA1bsbVlMk6gV6NySiCPcnDMB+J6+ksJz2rGgKA
	E5YFe2qwEz+ToD6m5MZsimxFjqJDbD5T4ZjB5pGZqZ4WClvHEJvXci2g4Km2O7x6EeWBX320amdIg
	gz/+3lUkjw4Hriz5gAvJn1DDJ3R06wgvzRijTG+r1c/YkM24BEETzELWsri/zc/XEIRlCnvInuGqt
	5wRs+P/tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljJzp-003i1S-Kf; Wed, 19 May 2021 11:04:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJzn-003i0r-T3
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 11:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=axx61CsVmIC6EJaaQTkzv579XEKU5x1f7Bb8b1HhaGM=; b=YcAIexymMErSVIPkFDH3KYxLzb
 +5OVAUa5JL2YGISFGkeeZ9v57Irk8xwUKWGR/zu6VjBrM32EsrP6CWe6eoqixTPqz4Os1KGJJCQlf
 ZXb7Jn+KZWLbX9BB1B3blWQAM7QbOkbuWnkzKLQtN/Za81oUb4R6q+sBZqzanxhPEADPDo/iCEbyQ
 oAIIhJMyA8dX6VQEKY/aO9HdA/gIyJQz7/UekW6ahNtVQa/GYk3PDtARxqe8OltX06anbZzWEkFVW
 fd5HE9WkRy0plB9id5oQg4sfYSqdsn11ukdlTmKwOhB27uOo82evNeIiJkz7fxxOvCZgtA3hlWJV2
 THC3fUsw==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJzl-00FNxi-AG
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 11:04:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id b7so6447207wmh.5
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=axx61CsVmIC6EJaaQTkzv579XEKU5x1f7Bb8b1HhaGM=;
 b=nZwPQTaPj58JJxzQ//b0HQl8VLLVDSfVWUobnUNTXtEqF9vZFoAnO0v//Mp9mNjzOU
 Q4Fmhv8SEOc2a8evXrSh2e1SYzFnVH21poIi1ZuWO10j71fZZE9bcUkFf5ugm9+1fuIb
 IB4QoJqd+gU7nsRRIPyAx/sFP7WZpSpn+d6tjydy9QDrKigqnE5AWOTfqpRSAb8D0t+0
 t89ptUm+TNHEFmJM1qowCNTGo/lD5HDaCMnTnEXh88HgADORQw6wvcm9/XNFv6vBuNfI
 RpzX0EQ9c57noVMiv+QTMKYEEQqrNZ58GWPlNJQYe0avxmMpKd8R6Qo94RtvTkgXfwCf
 M0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=axx61CsVmIC6EJaaQTkzv579XEKU5x1f7Bb8b1HhaGM=;
 b=qPPYHvVBDyj+etvOA3GDna+bEhXdbWZWngcGU6X6RkLYDTil1QlX6RGiqRcTIJLavt
 ohd+nKoRx96C4O1cbj4+khgoQCyN8kG0kuuWmjVhzgQC4KXqGLqNwQObrMtHpKFiUuJ7
 UFiOKRq/XWdmaQSEDZkmxadeEmubKO3JPOcyyWl0VPml+FIHZOw27x9SAQEUBu1p5mxd
 prEsVkZr0H2kFbzuiYOwo3rX8pQmH9r1oAqi/Dy41/mwd6bguf07c7zNOhRucR8pH0By
 AM2Y6pha3gdhhQhxqkQ22TfGhRPg5COxJV4p1gPKXH5O8pq4eikAaEvbW7I0PGzbNC0v
 Uajg==
X-Gm-Message-State: AOAM530FMqRohW8tTE/grm8Kc2WEkYFQsYA8iknk1Xxxa4qvu7fTLzQG
 XVNoT1zSGAQgAlyg2wHyUw4lBQ==
X-Google-Smtp-Source: ABdhPJxsFqWC646GEWfefCF03WphLTde0lovkd+9AitRmiQnugfQHHOO8OLMuPlfkt5Lemgixyb/Pw==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr8208294wmj.146.1621422247488; 
 Wed, 19 May 2021 04:04:07 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id a18sm5492863wmb.13.2021.05.19.04.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 04:04:06 -0700 (PDT)
Date: Wed, 19 May 2021 12:03:57 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mfd: mt6397: add PMIC keys for MT6358
Message-ID: <20210519110357.GC2403908@dell>
References: <20210506094116.638527-1-mkorpershoek@baylibre.com>
 <20210506094116.638527-4-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506094116.638527-4-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_040409_381125_D2143A71 
X-CRM114-Status: GOOD (  10.50  )
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

T24gVGh1LCAwNiBNYXkgMjAyMSwgTWF0dGlqcyBLb3JwZXJzaG9layB3cm90ZToKCj4gQWRkIGNv
bXBhdGlibGUgc3RyaW5ncyBhbmQgaW50ZXJydXB0cyBmb3IgcG1pYyBrZXlzCj4gd2hpY2ggc2Vy
dmVzIGFzIGNoaWxkIGRldmljZSBvZiBNRkQuCj4gCj4gTVQ2MzU4IGhhcyB0d28gaW50ZXJydXB0
cyBwZXIga2V5OiBvbmUgZm9yIHByZXNzLCBhbm90aGVyIG9uZSBmb3IKPiByZWxlYXNlIChfUikK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aWpzIEtvcnBlcnNob2VrIDxta29ycGVyc2hvZWtAYmF5
bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYzOTctY29yZS5jIHwgMTIgKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpBcHBsaWVkLCB0aGFu
a3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERl
dmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
