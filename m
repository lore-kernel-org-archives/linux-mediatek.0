Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61303C4727F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 09:21:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA29E2087D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 09:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kSXrYYOb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o7qGrzbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA29E2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AOvtWZkIBcbC+4yrGE58Lgw6z5V1wDAMFksfdmoBtIw=; b=kSXrYYOblPf6PRLuiGUtzbpUe
	oaTeGK57zTZhPrXvV4lA0hw11WYAIHBnrD6VkOA96FTiIabNSmx+TuQKeyBRgR0lHiR0ZCyDeJSBh
	7vxdQ8Phfaf5KSOU10BNfx6dBA4MhWEeo9pKg4xnH/W2xtbBHEoChtQN412LxwmfiN4TSKn/PuX6U
	ZmBcekPq3cQ4hTG73mML7dBES5YmKBV3V4E5Y0/AUMzlfSRnuI8jbAFtcD6heBmTjCPWIFChdbUTk
	hkDAdqLG/wu7whpcO3X7wPNLEYh1tcroE5yXJRkNO9Abl5MUWZuL7DqZS8WpqcEeC6I1l/Ww3ON6O
	tls/9MpCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNumN-00021h-2G; Thu, 01 Oct 2020 09:21:35 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNucC-0003d1-Pd
 for linux-mediatek@lists.infradead.org; Thu, 01 Oct 2020 09:11:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id l15so1778133wmh.1
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2020 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qVG1crGosGe6WteagSyVUP1/8VNDfCfQGhNS/WTV3K0=;
 b=o7qGrzbmYA7WsOVk5tsMhOn/ogjO7Rwy+3E+DJwzfKTeT4Se1KdQ2tzqeV/arHZtMj
 XQW+iTpC5qgeHDfcC+DQUhGrmXhSnWebuKi4ZRXIagt3VpJbjDvx3De0hxhthF0Z41W4
 3JUPmNWofiKFdchJkQ1l251ycv7ugqqwNi8eIauBj2SBBtXOhCwtGFjmCGB531qliNS+
 2rv6LBCbDd//R4dePNyM2d3/XsugRfa/X76mDyU4Bmmw9pJJGlrwXaYyLNn8Ws6xseWq
 X1yeqC5yrEnvKeVXbRZTU0Pdp/8mJmPmk6AhArAfRy+tKwiz0Wk1cbY7Ivo/R4aMlbL3
 HqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qVG1crGosGe6WteagSyVUP1/8VNDfCfQGhNS/WTV3K0=;
 b=oqg0AIZboHK2lVTp7TXqmdhAIhOBFkCVztjIjZdPIoaG1ljQfGXNxHdcQTwza2DBEG
 BJCHxxys5VKTaJILoLOfEksLnBCXnRTKo6VNuAgBi/XsXSvaGAFtkAuP5D7xgQecR6JP
 lV0iSULxrukeD4Szowr7LxxzmToRK1Mfrg9BdufTRblx4/BJoUlLb1X9pfHOyx2MA+lb
 0t165VO2lAYPpk9L5jac0dYNDnd21J9+lEXLU2BaiXVdnkzy8dC6C2d6UvxR78f2q8vU
 FJFA3ZzqzGYvzfG0hkt6jd6g1hIJ7KK8+MRc9xsxudW5pUevoX7r2Yh6I3AoOTW2SK1y
 OA/A==
X-Gm-Message-State: AOAM531yqYX8bV5F+L8nKZDPYQMrbAKnJ7+jvgY2rAEBtr3YeE/hUUQE
 SplmmN5rYkgXhRs5FEVS7zLr4w==
X-Google-Smtp-Source: ABdhPJzBPRGBtX689t52KEw8E7IfKXkFOKlUu++drz3PRbwvKtDPB6HUzhAnulJ8OK270nOmXIqozw==
X-Received: by 2002:a1c:5988:: with SMTP id n130mr7691297wmb.95.1601543463453; 
 Thu, 01 Oct 2020 02:11:03 -0700 (PDT)
Received: from dell ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id k22sm8326949wrd.29.2020.10.01.02.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 02:11:02 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:11:01 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v5 09/10] mfd: mt6360: Merge header file into driver and
 remove unuse register define
Message-ID: <20201001091101.GO6148@dell>
References: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600770019-11585-10-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600770019-11585-10-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_051104_882711_32D6D64C 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMiBTZXAgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBNZXJnZSBoZWFkZXIgZmlsZSBpbnRvIGRyaXZl
ciBhbmQgcmVtb3ZlIHVudXNlIHJlZ2lzdGVyIGRlZmluZQo+IAo+IFNpZ25lZC1vZmYtYnk6IEdl
bmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYz
NjAtY29yZS5jICB8ICA0OCArKysrKysrKy0KPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmgg
fCAyNDAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMjQxIGRlbGV0aW9ucygtKQo+ICBkZWxl
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmgKCkZvciBteSBvd24gcmVm
ZXJlbmNlIChhcHBseSB0aGlzIGFzLWlzIHRvIHlvdXIgc2lnbi1vZmYgYmxvY2spOgoKICBBY2tl
ZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2Vydmlj
ZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxv
dyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
