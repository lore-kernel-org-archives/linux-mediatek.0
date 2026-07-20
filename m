Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F34EC44520
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3c5exW3/ZWNcrrRMB2dz5lEAeo0oJMzDXuXV4sscBRQ=; b=LAMDR31T/ZwYctNe0biuEH44Lf
	oZti7vu8EMAq2HIUr7kH/tk4twoN/gPHlq7kHhW65UmMaDIubz6YQf07jVBlUCuf9PTNOGHV4oqyz
	mzZUp6H1pgU6cFd4WDDfWm7Y+jUUCNSN2Y76uChR6XecdnZCad19ZRWZIwtVVbRtWe27WRDJyOtT2
	o9DcFWVbP6K2G3afzgdiSCnNzqbqdPr//5mNJo4nw41veqmOF2F7xTH+0MmcWB0haVLa4nTLZcnjK
	zD48joFHyrl4Q2eIf7WvsbMyfK4f3pdS/urrhxorZbLhXwejeai1aIlorE46Kqj+jHcZbc1wysaEQ
	Gqa3HSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrsT-00000007Y9j-09rW;
	Mon, 20 Jul 2026 17:34:05 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrsP-00000007Y8P-1Xcl
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 17:34:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-848882fdb18so7658202b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 10:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784568840; x=1785173640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3c5exW3/ZWNcrrRMB2dz5lEAeo0oJMzDXuXV4sscBRQ=;
        b=x9WMIOYveotXQKz3XeU84QUVW7EiXaSE65ClKptCaJk6vUZcUYNzl39RDvqfjSm6Jl
         nICf0DkQmRen4CuGfG5ucZAFpC5al3sfZCHNETqnCEVWgWK8EgXWsmgdopPyVdPTCWEv
         Q/o1lVpNSL+ByDHrBfhuekICN6/sHs+F9jx1k084QxqayMSfV6Oa2ltl/6a+CjIahEJ1
         xgd/91eDJVTg9wFKlEolI+yJIw7qhuD6XrC8wgwJ6qjoSeUBUMKy4F594jphozl8cWFI
         S0tPlF3tKfM3BysXJeEOIYbkZn5oPvPmSNuRVwYWrX5JEXU4pGytVelf7mxOrRfkEYtp
         evuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568840; x=1785173640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3c5exW3/ZWNcrrRMB2dz5lEAeo0oJMzDXuXV4sscBRQ=;
        b=Ev/SPtN8GkvjyXK5Knqj72mn2ks3lSyeFjPddSf+R2q+dZFIPseELn9cVE7rcuu1IY
         2KhQhaMINosOMQtZw7zWldEVxvPW8eo8Wk5cwCagL7YztBqtvwfs59pCGPDR1i6T6ynt
         fBpEdxM8jE73yg4p8e3IqM441iJhbPEOScYX4UW9i4MU92qeKuAN53rAE+N+70eEFN+C
         E4G6OuyqrvZryy8A02iX4anJmqJmlfJ2xXsvFjP/xbE0O3UxgRQCM+6yM+7HO+X5gSKF
         zDsDvUHAZ9e6M2H+GsgON7LGNx46L6n2Yvp8zNWITrwEVSEtZPgvW6jq05qt+NAoYdi6
         ypOw==
X-Forwarded-Encrypted: i=1; AHgh+RofQDF2KvIjPPCflx1DwPYmK4/HW3c4wA7KnfITrr+KeyBJb2InAjxSFUO7FZrFPT5uXruqCFz5ZzJ00egB4w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4j67VMymNqojLQmpQVqF3XL8OdgoZIanc//I/67ai8wjxEGH
	5Ph5XQzHnBhbqbF5fHgWrpekEhKJTt22CMHW9etuqovXBwP7JXRqAaU30eL0cts7HAo=
X-Gm-Gg: AfdE7cmqWkfB8S26Yx2FRTNy1Yhr+Goegu9cc8KmPQ78eaSjz0OzO6u+UMfSYnQIYVY
	NI+M8apyIeO/waspoWUn4Tw1NK99O2TEsn+JD7g/xR61tvjfOxEdx7/m2M4fv5uFq96XUQCqg5Q
	CRguwbZmtCusJ5ObOR5KNaMMM5dRRk7sG5INS2qtb3CqhSIhIqBEZux2oHeFHztqjcmMNgnEmuF
	MAy46i0PDlyfr5kefuuiiv1o/cTt0KjNKmEnwKYg8aM2IjVL3wXtLCTaahSuH0tbt+btXjsbUnI
	cKMwEVGt5qcIXkem3pJj/4K+yLf/ECrKUiQXWFYk+M7V2isLELSP3arGshsYCWkHX4Q3c6i/Yok
	5wSrWS/WXRNdpqbrIpaJsdj1BO/Q2KvQ/qUY2rM5lOhabAmpWU8PgF9TdQ7SmBnaerg2QvKlbac
	IxuCNr
X-Received: by 2002:a05:6a00:3391:b0:841:dca1:8b69 with SMTP id d2e1a72fcca58-84c2923d63amr16490697b3a.5.1784568839837;
        Mon, 20 Jul 2026 10:33:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:966a:e23:19e7:951a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9af7esm5713606b3a.52.2026.07.20.10.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:33:59 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:33:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] remoteproc: Remove redundant dev_err()/dev_err_probe()
Message-ID: <al5cBMO91BeFghCz@p14s>
References: <20260717065224.600593-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717065224.600593-1-panchuang@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_103401_449601_6D34E6F6 
X-CRM114-Status: GOOD (  19.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2026 at 02:52:23PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/remoteproc/da8xx_remoteproc.c    |  2 +-
>  drivers/remoteproc/ingenic_rproc.c       |  4 +---
>  drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>  drivers/remoteproc/mtk_scp.c             |  4 +---
>  drivers/remoteproc/qcom_q6v5.c           | 20 +++++---------------
>  drivers/remoteproc/qcom_sysmon.c         |  2 --
>  drivers/remoteproc/qcom_wcnss.c          |  4 +---
>  drivers/remoteproc/stm32_rproc.c         |  3 +--
>  8 files changed, 12 insertions(+), 31 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index 23fca7176539..006fa7b56727 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -298,7 +298,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  					handle_event, 0, "da8xx-remoteproc",
>  					rproc);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "devm_request_threaded_irq error\n");
> +		return ret;
>  
>  	/*
>  	 * rproc_add() can end up enabling the DSP's clk with the DSP
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index 1b78d8ddeacf..252519f48964 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -219,10 +219,8 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  
>  	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, IRQF_NO_AUTOEN,
>  			       "VPU", rproc);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to request IRQ\n");
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret) {
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 83763d640c4e..407d6034f748 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -411,7 +411,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  	ret = devm_request_irq(dev, ksproc->irq_ring, keystone_rproc_vring_interrupt,
>  			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to request vring interrupt\n");
> +		return ret;
>  
>  	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
>  	if (ksproc->irq_fault < 0)
> @@ -419,7 +419,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  	ret = devm_request_irq(dev, ksproc->irq_fault, keystone_rproc_exception_interrupt,
>  			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to enable exception interrupt\n");
> +		return ret;
>  
>  	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
>  	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 436656bdfa8b..9751acc2bf83 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1246,10 +1246,8 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  					scp_irq_handler, IRQF_ONESHOT,
>  					pdev->name, scp);
>  
> -	if (ret) {
> -		dev_err(dev, "failed to request irq\n");
> +	if (ret)
>  		goto remove_subdev;
> -	}
>  
>  	return scp;
>  
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 0206a4a19254..1075ef4027b7 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -302,10 +302,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					NULL, q6v5_wdog_interrupt,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"q6v5 wdog", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire wdog IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->fatal_irq = platform_get_irq_byname(pdev, "fatal");
>  	if (q6v5->fatal_irq < 0)
> @@ -315,10 +313,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					NULL, q6v5_fatal_interrupt,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"q6v5 fatal", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire fatal IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->ready_irq = platform_get_irq_byname(pdev, "ready");
>  	if (q6v5->ready_irq < 0)
> @@ -328,10 +324,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					NULL, q6v5_ready_interrupt,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"q6v5 ready", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire ready IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->handover_irq = platform_get_irq_byname(pdev, "handover");
>  	if (q6v5->handover_irq < 0)
> @@ -342,10 +336,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT |
>  					IRQF_NO_AUTOEN,
>  					"q6v5 handover", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire handover IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->stop_irq = platform_get_irq_byname(pdev, "stop-ack");
>  	if (q6v5->stop_irq < 0)
> @@ -355,10 +347,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					NULL, q6v5_stop_interrupt,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"q6v5 stop", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire stop-ack IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->state = devm_qcom_smem_state_get(&pdev->dev, "stop", &q6v5->stop_bit);
>  	if (IS_ERR(q6v5->state)) {
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index a0830a48b1f4..61e1038328e8 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -662,8 +662,6 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  						IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  						"q6v5 shutdown-ack", sysmon);
>  		if (ret) {
> -			dev_err(sysmon->dev,
> -				"failed to acquire shutdown-ack IRQ\n");
>  			kfree(sysmon);
>  			return ERR_PTR(ret);
>  		}
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 3392c9380202..e9a00efe97f6 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -521,10 +521,8 @@ static int wcnss_request_irq(struct qcom_wcnss *wcnss,
>  					NULL, thread_fn,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"wcnss", wcnss);
> -	if (ret) {
> -		dev_err(&pdev->dev, "request %s IRQ failed\n", name);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	/* Return the IRQ number if the IRQ was successfully acquired */
>  	return irq_number;
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 0e5d64fbe52c..1fe4cdc0a13a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -682,8 +682,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
>  				       dev_name(dev), pdev);
>  		if (err)
> -			return dev_err_probe(dev, err,
> -					     "failed to request wdg irq\n");
> +			return err;
>  
>  		ddata->wdg_irq = irq;
>  
> -- 
> 2.34.1
> 

