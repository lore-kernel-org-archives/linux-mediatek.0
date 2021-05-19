Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCD0C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 10:55:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04B62600D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 10:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04B62600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TWc0lXOLdsHTuZVKLsccHhGdgwLfydxd48QoXua+ljc=; b=ZInZ4svJ8ekpwlgMtoELQZYKX
	awp4iBwWihugiYqoc09gAKvzZKc93zu7XNxVJNin+SNLGaJfSEJDzbhNfnjPnwn76XY+rdvwll0Zx
	R3+J/SE8drx5jmFFMKmqZAlkiRtJO6WvSfCTAxf2EUrpLI6BQu+X/0nRqE0sX01bFLqf4KpkOZLEp
	LaxfvBl9NBgZ7CoqDG+KfpJfFuCSfvlH0eHv5cS8uGFINx5QaUzszAeXMs/2hwnwVxn0jHvSWddcA
	sa97kYG9e22/R7ySEJPXVrYuvtOmidkKd5N2tZCI8K4CzN5+SUrq+nq3/OifCInDgmG5SSQBiHswq
	Zccnl2SJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljJrJ-003gbj-UX; Wed, 19 May 2021 10:55:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJr8-003gZF-F4
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 10:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=VWNn8s6uxdHuGLdf6JViqfWGURn+ws2bD0QpSQyNXtA=; b=ZNfvGJSXrH348R5d7rFgfd7dnt
 6xVBsj8maiLyZA0gWxz8xxrahHUIe4v42HmaFu/C8SqkpWWOPVppZyHdqfaI01V15r7DMuKfH3y+2
 xK8VQjX9sw92NbG6iXYwESVOJ4rpLgBKJwkG00q6zazcsCRdgth7bMLjKycLudp+knyrPG1GokFxX
 HqU7kwFLu8LcXMB5os1qcesITG6grflCddePObo7t2AMcH3Jy9Vp8p2JyOsPeNb8wh5o2uWD00mWj
 Sea7hLkChWvDNyf25N1Bq41QjmNL3RDmds+TSxhSRmyAx+KUN/9QMtoPLSGwLsg552wUvUwufqZcm
 Sp6+pyDQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJr6-00FNNR-1K
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 10:55:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3065154wmh.4
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VWNn8s6uxdHuGLdf6JViqfWGURn+ws2bD0QpSQyNXtA=;
 b=jhQqXDTarQGD0aVvg49RzkHNeDpUc3l4ZBoOLERlayx2F0YWzBQtEfalRDdsri1NGS
 JT7jNemYcq4vNJgJ92e14y+frxutWc74ciybLGe6CMTCZMmyf4jksDo+d5IbGQUhVD59
 ayqsBqeS2wrt4P6ONmJumXQOZnLGGeVzVZRt6OespfiDCP/SarW3prBPo9OmsNQVG63x
 O3s4TYSHTbFoKStHWonTysh2csMfC5zHUzTWVAK0zayLngamrlErIO5HsOonSutQuRD2
 2rlxbOlQjy7HzUTctbsYzsU8VX1XcSd1YtVDMvxU6SXitpoaukCf0Fy4YAP40zncV2bY
 AQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VWNn8s6uxdHuGLdf6JViqfWGURn+ws2bD0QpSQyNXtA=;
 b=gfKuAesVRsb2lFLne62xflsEDJdQt9G2KloTna3L8ZB5o8H3tAGI2m20uS5M7z4Qkq
 E8qBiMRLPDvIYZZm/FRniR1m8+DDHNQkPV1mrmx9//Dr7RZsvAILMqenLshPifb/t12p
 cILVgp5zmYCIFygiuJIhgUF9Y9kmmr6JMFcV0KXRhfezzo7ykSSsejD1QXabSdPbWUrf
 dgHt/Tjfz8liEeXlILEIeSQ8Q0blrYzH2nDAk1evAW3rVv/y0DLwjVtyK6jfqlAtknJ3
 MFGMXhV2DdZU/6BlaCNf/CrrqDuGkrACg5OhAkUiL9vrE0+8gW71y1WxU6Sl9tr+IElA
 I3gA==
X-Gm-Message-State: AOAM53244NshIn1kmoFlKbNlnnyAU2z+mZ8FSCJ9Kq3hLKfw4l03yi2x
 4Lr19WOFmi72WAqh2O0J0LjWQA==
X-Google-Smtp-Source: ABdhPJyD186uI/OTMxMaOaSteeEZiIXUIemv+KZ0cy0nRD5LukptML6Mqe+WbVHyuceCrTalwt1iqQ==
X-Received: by 2002:a1c:3cd4:: with SMTP id j203mr9633589wma.25.1621421709628; 
 Wed, 19 May 2021 03:55:09 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j7sm20660467wmi.21.2021.05.19.03.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:55:09 -0700 (PDT)
Date: Wed, 19 May 2021 11:55:07 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mfd: mt6397: keys: use named IRQs instead of index
Message-ID: <20210519105507.GB2403908@dell>
References: <20210506094116.638527-1-mkorpershoek@baylibre.com>
 <20210506094116.638527-3-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506094116.638527-3-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_035512_086809_897DCEE3 
X-CRM114-Status: GOOD (  13.34  )
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

T24gVGh1LCAwNiBNYXkgMjAyMSwgTWF0dGlqcyBLb3JwZXJzaG9layB3cm90ZToKCj4gU29tZSBw
bWljcyBvZiB0aGUgbXQ2Mzk3IGZhbWlseSAoc3VjaCBhcyBNVDYzNTgpLCBoYXZlIHR3byBJUlFz
IHBlcgo+IHBoeXNpY2FsIGtleTogb25lIGZvciBwcmVzcyBldmVudCwgYW5vdGhlciBmb3IgcmVs
ZWFzZSBldmVudC4KPiAKPiBUaGUgbXRrLXBtaWMta2V5cyBkcml2ZXIgYXNzdW1lcyB0aGF0IGVh
Y2gga2V5IG9ubHkgaGFzIG9uZQo+IElSUS4gVGhlIGtleSBpbmRleCBhbmQgdGhlIFJFU19JUlEg
cmVzb3VyY2UgaW5kZXggaGF2ZSBhIDEvMSBtYXBwaW5nLgo+IAo+IFRoaXMgd29uJ3Qgd29yayBm
b3IgTVQ2MzU4LCBhcyB3ZSBoYXZlIG11bHRpcGxlIHJlc291cmNlcyAoMikgZm9yIG9uZSBrZXku
Cj4gCj4gVG8gcHJlcGFyZSBtdGstcG1pYy1rZXlzIHRvIHN1cHBvcnQgTVQ2MzU4LCByZXRyaWV2
ZSBJUlFzIGJ5IG5hbWUKPiBpbnN0ZWFkIG9mIGJ5IGluZGV4Lgo+IAo+IE5vdGU6IFRoZSBrZXlz
X3Jlc291cmNlcyBhcmUgbm90IHBhcnQgb2YgdGhlIGRldmljZS10cmVlIGJpbmRpbmdzIHNvCj4g
dGhpcyB3b24ndCBicmVhayBhbnkgRFQgc2NoZW1hcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0
aWpzIEtvcnBlcnNob2VrIDxta29ycGVyc2hvZWtAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL21mZC9tdDYzOTctY29yZS5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2Vydmlj
ZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxv
dyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
