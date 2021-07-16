Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEF6C636CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:04:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EFC7613E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EFC7613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RocjgwMNg3WNEYXnSL2HhFoCxmrogVIFRBJahwJQk3s=; b=AkdZrxyA8lM6IL
	MwAfu+jM/re9KbE9NTzlFwxR+msPwU0ZgeFuHgC98xKciBZYgVtj8A8BekbJpR9vh6+8G7uSR/RsL
	c3jJBv2+y0Q+Uu5NIANqJ+BBMg/mhjYiy2jpytSe0mApJXWAOSikg6LUb6y7DKyfWHyoCxdU5nXIs
	I/638mUJX8hFVj07QIUC8CQK83f9bXXt0ohIzwkBXEsUihVwkjAFslAyZQfD/KZ7OiSvGPo+fo800
	tUX4HC+bEUGpyP2e2RLXPSnDOb9T1oSCXUUr/yZTX65zzdOACOsJ2Y2wWz8jYZLoV0nzEsNAWRhs5
	8Y4VdJSoVN0J6r+DvA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IpK-003dAk-NU; Fri, 16 Jul 2021 08:04:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Ip7-003d89-UE
 for linux-mediatek@lists.infradead.org; Fri, 16 Jul 2021 08:03:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id t5so11002536wrw.12
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Jul 2021 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OsKyayjHxG1P8h05xSAZTvVABsTx53Uj1VpdHiIKIWA=;
 b=aPYf87ob3aaxxoeLXgm3OKY1JZs+/cErQ/oHDfHA7eRlpryENUjlLT3K3+YSUPSSxQ
 Gvw9O9ZmHbz3QVBLxnJ+Nh6esDyWswk4cOPBrf5KJMBubs81kgEBfecPTs+8tMtPNfrw
 7n23VIS7/ODj0kgrzIaHtiy7zScN2T2DdbiAksQzDgs7Gr9LmlTkand3EFoaMmH59MW1
 EML+/H/vq4bonqY4ctCgJch72JuY6NXBFoeZbD+waSntVmNRK+kPEd2ZHvcO45Q3dpIG
 oYPXd33ulnElx4BsU2IZ0Zpt9xYSSRfkn9M160q2SJGARwqlvi+6ldEI2GlqcVUmjDLE
 OEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OsKyayjHxG1P8h05xSAZTvVABsTx53Uj1VpdHiIKIWA=;
 b=dIf/LwmNiA3FUrq3BBh0SQJirUMXHR29F5eq2yYTUn9mzLfgbjnUxY6LcrOpd3iWWA
 jetH6qf0CqCSMTxky3tae9zHe9y38DTUEJbTXUThE4+/edWHXZ59jRZNIj9o2QyvY77X
 IOxnVAEiCuAA46X8Rwe8zAsI1eSEGchnwoWpilek90MfhEs1NRB9NsA2JW3rRvniAClY
 mKEvSOMg7sBfMhqPIqIkrH6EHPWCWRvdBAHD+8aHIj9uk/bmhCH03TPK6t8MVQ/ulRBV
 bb26cL55NdAeDtxSYMVjFPJfTvqmyC80asPcTHvh6MO013igR+v1WeOqLoZlK8jJMZKO
 0nXQ==
X-Gm-Message-State: AOAM530AxeRO6/85uKeFaUy7ga53MVVb5UFtgswefZloXnvfKaNLCbys
 25BeOttL0YD1NlpfsQ3KLRbY+w==
X-Google-Smtp-Source: ABdhPJxavCDniqd1CDp7lkvshfaRVqhNT4fnfIgxPt1S6pPllJlKNx7hLLM0l1ZuI1tXuSt7TImimA==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr11185960wrk.198.1626422632225; 
 Fri, 16 Jul 2021 01:03:52 -0700 (PDT)
Received: from google.com ([31.124.24.141])
 by smtp.gmail.com with ESMTPSA id y6sm7137528wma.48.2021.07.16.01.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:03:51 -0700 (PDT)
Date: Fri, 16 Jul 2021 09:03:49 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fei Shao <fshao@chromium.org>
Cc: Gene Chen <gene_chen@richtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] mfd: mt6360: Restore error message to regmap_read
 failure
Message-ID: <YPE9ZSu1lYtRb1DA@google.com>
References: <20210629094339.874120-1-fshao@chromium.org>
 <20210629094339.874120-2-fshao@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629094339.874120-2-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_010354_025282_ECF20343 
X-CRM114-Status: GOOD (  18.83  )
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

T24gVHVlLCAyOSBKdW4gMjAyMSwgRmVpIFNoYW8gd3JvdGU6Cgo+IFRoaXMgYWRkcyBiYWNrIGEg
bWlzc2luZyBlcnJvciBtZXNzYWdlIGZvciBiZXR0ZXIgbG9nIHJlYWRhYmlsaXR5Lgo+IAo+IEZp
eGVzOiBlODQ3MDI5NDA2MTMgKCJtZmQ6IG10NjM2MDogRml4IGZsb3cgd2hpY2ggaXMgdXNlZCB0
byBjaGVjayBpYwo+IGV4aXN0IikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGZWkgU2hhbyA8ZnNoYW9A
Y2hyb21pdW0ub3JnPgo+IC0tLQo+IAo+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIHwgNCAr
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyBiL2RyaXZlcnMvbWZkL210
NjM2MC1jb3JlLmMKPiBpbmRleCA2ZWFhNjc3NWI4ODguLjBmZjhkYWU0NTM2YyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gKysrIGIvZHJpdmVycy9tZmQvbXQ2MzYw
LWNvcmUuYwo+IEBAIC0zNTEsOCArMzUxLDEwIEBAIHN0YXRpYyBpbnQgbXQ2MzYwX2NoZWNrX3Zl
bmRvcl9pbmZvKHN0cnVjdCBtdDYzNjBfZGRhdGEgKmRkYXRhKQo+ICAJaW50IHJldDsKPiAgCj4g
IAlyZXQgPSByZWdtYXBfcmVhZChkZGF0YS0+cmVnbWFwLCBNVDYzNjBfUE1VX0RFVl9JTkZPLCAm
aW5mbyk7Cj4gLQlpZiAocmV0IDwgMCkKPiArCWlmIChyZXQgPCAwKSB7Cj4gKwkJZGV2X2Vycihk
ZGF0YS0+ZGV2LCAiRmFpbGVkIHRvIHJlYWQgZGV2aWNlIGluZm8gZnJvbSByZWdtYXBcbiIpOwoK
SSdtIG5vdCBmdXNzZWQgYWJvdXQgdGhpcyBjaGFuZ2UgZWl0aGVyLCBidXQgaWYgeW91IGluc2lz
dCwgcGxlYXNlCmNoYW5nZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gYmUgYSBsaXR0bGUgbW9yZSBn
ZW5lcmljLiAgVXNlcnMgZG9uJ3QKY2FyZSBhYm91dCBSZWdtYXBzIGFuZCBkZXZlbG9wZXJzIGNh
biBncmVwIGl0IGluIHRoZSBzb3VyY2UuCgpTdWdnZXN0OiAiRmFpbGVkIHRvIGZldGNoIGRldmlj
ZSBpbmZvcm1hdGlvbiBmcm9tIEgvVyIKCj4gIAkJcmV0dXJuIHJldDsKPiArCX0KPiAgCj4gIAlp
ZiAoKGluZm8gJiBDSElQX1ZFTl9NQVNLKSAhPSBDSElQX1ZFTl9NVDYzNjApIHsKPiAgCQlkZXZf
ZXJyKGRkYXRhLT5kZXYsICJEZXZpY2Ugbm90IHN1cHBvcnRlZFxuIik7CgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
