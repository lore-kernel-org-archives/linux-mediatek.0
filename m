Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69243C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:50:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201D7613AA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 201D7613AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W8P6n9rIiBYj4KfGAy20dLXSVQgcIOFcMdT2yiPlPFw=; b=XRrwhe9nSMpuMQLcVoaQVMXzt
	KG9XQOh8n2Ko/9hw7Ln/BlLx+isS79uigyqlWEZWoi5pQyj82T2M2xUngZthPkp2peZDIXTn3Zd8M
	HjA0H4JbsBNaUwUQnOHvgvvIHWrTbjVK2snF7T4vpJp64He8QX/yAr8AAZeVxLx69RLH+moS3/zhg
	xAkSA0m3QXKveUlpPzfQKqE6owjpUM2jq6iizpvufblVcT7OMxFdVDhIUzzubk+5Wu+R2ca5P5Xdf
	xbjm23ek56USlQtRNqVzRHfzqoy6FywHmQYbe75pD1E02uyebBmNovw81SIJTQMCHVgI5kjrUc2Nd
	/2q88YvNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhXH0-0084UZ-Ht; Fri, 14 May 2021 12:50:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhXGx-0084UG-Mu; Fri, 14 May 2021 12:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=SESIfhMqYFc3E1CEVb69AU3q2QVBKoIo933+rDpEkME=; b=ieDeNpf/UurJAlrP5wbf4m/qDg
 4XjWumK9V/FZnK3e3XyfVqFDjxgSsG2H+OL+xXOAS0dePS9m+Kn65Mpy+9mXoDdPSjOrIKjqgQJ4Q
 tsMNi1NOVE9Y06aEQjZfLl6USySJq6mOgglQCCXwgcA/hup8mwqJp/txRaMBpuAs+uRAhiotyErRh
 2hQ7ESGkU8PoGJh/ZHgmGqhXz8GKicp30Aw1Ko3X9Z9xCR/ls4MxFVupVUXnsqYCsroqz0wgd3axl
 uOeTVHk5VGMSSAUQY4B0+GdybW9CaABmAbdVCx9I8kWMLpl2ED79MO1IBhi62f2fWVHyxWhktoRzZ
 pfrQxpZg==;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhXGu-00Bz2Z-Md; Fri, 14 May 2021 12:50:29 +0000
Received: by mail-wm1-f44.google.com with SMTP id s82so16136098wmf.3;
 Fri, 14 May 2021 05:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SESIfhMqYFc3E1CEVb69AU3q2QVBKoIo933+rDpEkME=;
 b=qXdWalWOnQ2JwCl7IynPsFxJLwgVHpqwU0OnVp2cjQd3CFVc253xHJ+L61w3GZBBt5
 P1Zpon7/ORX8LI8u+cEdyWJ7yGfztox458XKH2vxkevo+aQdUouTC7XGvds1wbR79+NX
 fyrWHDbOWJYFUAe5d9UDbdc79GuyXsHyHyN2oXYGvFqBe0V3DeuEEwhsPdIL+NKMD0vn
 5XPw12vw4pSvLKol9N9UqTNrdJmmcG6ueFzlVwS7KN3TJKDtPzudl0Sdiy0byDwO9Ubs
 f1CmN/y7VYmy4M5cXKZFOJ7B+YCoxypCuCg69HHfMatUiJ7LHFwjbbiiVhpur509U8AM
 TT1w==
X-Gm-Message-State: AOAM530N4YUJ4eSoOER+Pm5oujGXDhUe11pySw+QkFWalFXnxF2b9d+h
 WanzIQ+GM8/LL9ymDfZDMjM=
X-Google-Smtp-Source: ABdhPJwdJTGrh3otjExL57AmLpHA4p+9NsFBw+qkNWdaFfHvXjKX1tujGbSTlex5jlm1KFu/lzH3xw==
X-Received: by 2002:a05:600c:230f:: with SMTP id
 15mr47572214wmo.19.1620996625621; 
 Fri, 14 May 2021 05:50:25 -0700 (PDT)
Received: from rocinante.localdomain ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id s5sm5442644wmh.37.2021.05.14.05.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:50:25 -0700 (PDT)
Date: Fri, 14 May 2021 14:50:23 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] PCI: mediatek: Remove redundant error printing in
 mtk_pcie_subsys_powerup()
Message-ID: <20210514125023.GA9537@rocinante.localdomain>
References: <20210511122453.6052-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511122453.6052-1-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_055028_758802_8CD7FE5B 
X-CRM114-Status: UNSURE (   9.59  )
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

SGkgWmhlbiwKCj4gV2hlbiBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKSBmYWlscywgYSBjbGVhciBl
bm91Z2ggZXJyb3IgbWVzc2FnZSB3aWxsIGJlCj4gcHJpbnRlZCBieSBpdHMgc3ViZnVuY3Rpb24g
X19kZXZtX2lvcmVtYXBfcmVzb3VyY2UoKS4gVGhlIGVycm9yCj4gaW5mb3JtYXRpb24gY29udGFp
bnMgdGhlIGRldmljZSBuYW1lLCBmYWlsdXJlIGNhdXNlLCBhbmQgcG9zc2libHkgcmVzb3VyY2UK
PiBpbmZvcm1hdGlvbi4KPiAKPiBUaGVyZWZvcmUsIHJlbW92ZSB0aGUgZXJyb3IgcHJpbnRpbmcg
aGVyZSB0byBzaW1wbGlmeSBjb2RlIGFuZCByZWR1Y2UgdGhlCj4gYmluYXJ5IHNpemUuClsuLi5d
CgpUaGFuayB5b3UhCgpSZXZpZXdlZC1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51
eC5jb20+CgpLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
