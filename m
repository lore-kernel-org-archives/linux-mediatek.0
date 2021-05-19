Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B17BC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 10:54:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC1C6135C
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 10:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FC1C6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+lhIf5YmXML/rABayx1VGjAFXW5ItvX5kV0N8mwj/GI=; b=CXyfCR9f4gtvpOMn9rbUmgpSJ
	Z2xPuDQdboeaOfIU5nbtGHq1hqD7Bp6cIE4bzvh8GEO1AMcaIPI80hkxnzwtTx/l1nUnAjkzxC2KT
	ot67QA28iE5A4VE2/8b/PaL3Ke/lT6nQa75hRVpaiw58I2sKSPMS9tEgaIe3eLw6IZtAqRY+rIpGl
	dzEtPK2gqSjVwcWFapFQyr533BJ/LxHVNVh++dmeJfIMM04f87cu/EyLZJTTUVj+ocM5kpJKhiyeD
	Z59jOBBV/fAKd4b7jgyxJqZDX0TqFRFsT0uSYebJDADeLzHa4lqQVgp25EM/ha0nbiitTMj9fzhdX
	+clx1zxyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljJq0-003gHq-2V; Wed, 19 May 2021 10:54:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJpz-003gHH-0s
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 10:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=iyF4znB+NAGNxEUQPDaSTCldhTG9jFD5gCynx1rwurI=; b=NXfHOb8gnt1g4YXR/PGKeLSWwS
 VnWHvnTelHpGrUWCREV4i8TV2bN7hyL8niT6wvv7LMaCINJjzNr4D/ML0Oyi87PZjaaRSep0i1263
 gSbf8+tVQ0g7tKs3WQSWu/Xyvob0k6QyzEJR+CcDL6wDkah/6hIBHlh1fGsBAPaIpgjnI5HDwSuIy
 6TvvILQmyZsVUOM4IrIXTdB5FEfSjrT27dktBReWRRMNJ+oonxDGYfJLOu06lM8zmB37q0cjVuqE+
 DjHpptFPq0NNTpUz8eyvWXTnow8twk6mUEmhWbEES14U3AZsTorJNuqkuPcyfXJYpLFOSbfEG3d8K
 tqbeAqnw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJpw-00FNKZ-7w
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 10:54:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3063319wmh.4
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 03:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iyF4znB+NAGNxEUQPDaSTCldhTG9jFD5gCynx1rwurI=;
 b=JeorSU0JhtvTZKYvz3B2KPhFNwWxY0rcn2Vz/IXn5dYs6RASxj6XkY3e+WhahRcj5/
 ZRYIAj3k3j55FMzuuuWCiTtLiEW25JNtplBBAAsL/A0vZhlzNygIeGM4R1YaCpE/YqPW
 XEozO7+pWGBM/EcWvyanpk/IbBnReLPouQebCzyKe9zdFVQxQvztwbwHMFQzqtJVN2OG
 sZJnaBFVO3GCCNl5wgNNQ2XfryQsA9apX64ftB//ickaOTMq9qSLnv3RpjrVLp4wUmRS
 su/bbrhQk1MtXoQ/d6gGAOvnIHvVvACSMcxaXVxJv0DGDmPCY0HGmvlUzdt63X3xe2mI
 CVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iyF4znB+NAGNxEUQPDaSTCldhTG9jFD5gCynx1rwurI=;
 b=M2Qg3mAcr+sgR9+4ZSWFqVqX7A+JeA9MedAYMLhWDb7Ej4cj5Gh6MkUouMnR3vnCcG
 tQX0vCZ3lRVm3Ptv+kr4tCgZ7O14D3Nhbg1SN9Vxb2EQuuTQKXD9jKV+VgAUGLG/MJ3d
 WM3QY1cIFIbuJzddBmxoni3amZLZB+o/M2YkGOjvE0Uf1Mo9TJ+E1xYxw+zClUXSMPTM
 gv0JQcgL8U+wShOdLWzUmoCRaYH7DzyIj528/OjNoibpampCs7V3czRSp2iFQL4HpMau
 pfzFT8uvLNNftfKnTxY7XDRj0FqcyPEWG/c1csISeh2b1wyC1BUptcsBHkRx2PiO/FE2
 dKdA==
X-Gm-Message-State: AOAM5321FmLR64YFeFbJp6FGz9HNFZBSLuEVqBVbvaOmS7UkgjvMezcY
 0tAFqTwXIO8mO10krpJAO4Qm8w==
X-Google-Smtp-Source: ABdhPJyhFF19KAh1rD2dS+lhyx35F9ujaYw6i7jutv5u+cgqL3po1ZR25U0g++6X2/gwdMAFeEgJSA==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr10611020wme.30.1621421637620; 
 Wed, 19 May 2021 03:53:57 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id u126sm6585249wmb.9.2021.05.19.03.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:53:57 -0700 (PDT)
Date: Wed, 19 May 2021 11:53:55 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mfd: mt6397: add mt6358 register definitions for
 power key
Message-ID: <20210519105355.GA2403908@dell>
References: <20210506094116.638527-1-mkorpershoek@baylibre.com>
 <20210506094116.638527-2-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506094116.638527-2-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_035400_293662_6D01328F 
X-CRM114-Status: UNSURE (   9.83  )
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

T24gVGh1LCAwNiBNYXkgMjAyMSwgTWF0dGlqcyBLb3JwZXJzaG9layB3cm90ZToKCj4gVG8gc3Vw
cG9ydCBwb3dlci9ob21lIGtleSBkZXRlY3Rpb24sIGFkZCBkZWZpbml0aW9ucyBmb3IKPiB0d28g
bW9yZSBNVDYzNTggUE1JQyByZWdpc3RlcnM6Cj4gCj4gLSBUT1BTVEFUVVM6IGhvbWVrZXkgYW5k
IHBvd2Vya2V5IGRlYm91bmNlIHN0YXR1cwo+IC0gVE9QX1JTVF9NSVNDOiBjb250cm9scyBob21l
a2V5LHBvd2Vya2V5IGxvbmcgcHJlc3MgcmVzZXQgdGltZQo+IAo+IFNpZ25lZC1vZmYtYnk6IE1h
dHRpanMgS29ycGVyc2hvZWsgPG1rb3JwZXJzaG9la0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGlu
Y2x1ZGUvbGludXgvbWZkL210NjM1OC9yZWdpc3RlcnMuaCB8IDIgKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O
55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
