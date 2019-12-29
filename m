Return-Path: <SRS0=5MtA=2T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CD2C2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 01:59:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6904F20838
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 01:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fxvBEuHq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUBvHzkD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6904F20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBA5KRivSLl++7eBlfeJRqoJkBQTeE6ZfmjlQFeMitE=; b=fxvBEuHqt/w3ro
	mKIo9Rim+Nyt8JBhbbr2Rz2RygohRpEPmHqLMwNkCCXFWrZMIPbK8FHBAw7aKSulJpNpW33kMWDOW
	taXyayVhUsD0ElP+75kcRegPpEVZ8pUdZWuIh3+Xn+kgCxiVwzVA+JqOqHELBxPIOruR2/bR3llq5
	rK1qwTUVI6pQ63bXWqA8CURuaoIGpIRoMCtSCc3eA6nCEOK4eKtdM+wVX3VOL1H+e3SkCiAUAsfrv
	44Var9JhFSYYT+rb2r7MOFmwkMv+VQm1G2zHcxfwAtPqdYqfVB1N2qkszscFPJcOkzi7AB3G5hKrU
	V6BMvA6jbAnnlFn7c+Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilNrP-00016D-HL; Sun, 29 Dec 2019 01:59:15 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilNrL-00014H-Iq
 for linux-mediatek@lists.infradead.org; Sun, 29 Dec 2019 01:59:13 +0000
Received: by mail-pl1-x643.google.com with SMTP id p9so13303283plk.9
 for <linux-mediatek@lists.infradead.org>; Sat, 28 Dec 2019 17:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=B0YqCZdtASo8W3+DNsZKxEkKUnEoAfpsuE3h6bg+BKA=;
 b=SUBvHzkDy3ObczV/2Tibqb/J+Bch+J+BkQLTRD7VEq1pgSLY5siprwnL8ItHD8F9X0
 CLYNPAl6cuX+YtWyUz4Jv6O3q5S6xdwYdxId7gchqdvDjxrpI174YpeyGAVnq5OCLnYu
 mjnk8FJDiqHP2OyS9LeyMpUTtRHfWnHiSWEIuaxjubiE/JKwwlviZBeCb1t/7K0h+fYh
 0vjWt+KfOtPAEGUy76eHmG3OAfy6XCIgbDlBxBVQINB4iZl4afyF3PioZAzKOKODRE1X
 oQLqq8b0HCjpBZ3AJYpqPIprChvuIUnjenWvUp0O9V64bXJNy2P1yqNwOkoX6pEoUsOG
 rZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B0YqCZdtASo8W3+DNsZKxEkKUnEoAfpsuE3h6bg+BKA=;
 b=ltTZiMeAO5mg5UupLT7bv0trfyvAP5IBW/JHrHkGyIkL/+vXd0B6N2kWPoV2sQkswk
 MtumYdW1T/zd+60qIlxZd5PVrz2hj5Ej0KfWi8OCQcExbx3uZ7TUu+8qRWO8NCN1Nj9b
 qj+DYvVd1OY7AxU0bgN6sRF/JEz6BnKKpSVAfialf7rdPQEwoLHWHKKZ6YSBuhZ/qU0n
 S9qaBOX8CcN9Y4ywd+EsPotEjCtbmpnWp6pGnd/Gt187mJC3V49Rj84IJHOjCvnnte9B
 jR2dJYM5H0xeAPjf0GUQv9mB7c+Gb9AXhTlFIr0L98Xemm4GRGeU0tky3SLU+Hl0whuK
 82CQ==
X-Gm-Message-State: APjAAAVUwlKJ7xVHUOxwbNsxq7FDrAAeKlUfNBaRPl8CbibdJXMRkOpE
 GjByVLxEV4idV0pEdesNtISXGg==
X-Google-Smtp-Source: APXvYqwFD0Z6M2ULKf78TvessQAN+owraVNT/WM/LcoBIbydcpRlk+A9rbJjuwmOeeAvLemOFIwgmw==
X-Received: by 2002:a17:90b:d94:: with SMTP id
 bg20mr34993201pjb.99.1577584748559; 
 Sat, 28 Dec 2019 17:59:08 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id p185sm46804599pfg.61.2019.12.28.17.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 17:59:07 -0800 (PST)
Date: Sat, 28 Dec 2019 17:59:04 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 03/13] mailbox: qcom-apcs: convert to
 devm_platform_ioremap_resource
Message-ID: <20191229015904.GG3755841@builder>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-3-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191228183538.26189-3-tiny.windzz@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191228_175911_751038_DDF287DC 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: thierry.reding@gmail.com, f.fainelli@gmail.com, alexandre.torgue@st.com,
 sbranden@broadcom.com, rjui@broadcom.com, linux-arm-msm@vger.kernel.org,
 jassisinghbrar@gmail.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, nios2-dev@lists.rocketboards.org,
 matthias.bgg@gmail.com, lftan@altera.com,
 linux-stm32@st-md-mailman.stormreply.com, nsaenzjulienne@suse.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat 28 Dec 10:35 PST 2019, Yangtao Li wrote:

> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index eeebafd546e5..0faf69137780 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -49,7 +49,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  {
>  	struct qcom_apcs_ipc *apcs;
>  	struct regmap *regmap;
> -	struct resource *res;
>  	unsigned long offset;
>  	void __iomem *base;
>  	unsigned long i;
> @@ -64,8 +63,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	if (!apcs)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
