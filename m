Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536C3CD0416
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 22:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnUVUqPqeZj3uBC9OMfEyvC2v1C7JsZ9WatRVB2qxEc=; b=K70JN4hIkc+tRzopJA/HpQEKlj
	UosyBkdbkyh3GAkOOXETIUAtsjen0+PSWb9oJGYHsD24eU1b9vqq4wW4ntaBUP9YMwXJzTOyEOLQk
	72tmtuX7gRq13EQ2F23bOjx8P0Uja//BxhvujiiZ6ygE318ZGXClm95/kz7wcCf05gUSFU7cJiaVU
	9rgMAYTrWEUUQ3ooIebkL7vqCNYnMm85TUoCg56FbVbPOSOZwag43jzftOXz+Kn3YRc/w5ITXlM6h
	phM7kLJrTceUHjDEJWgtRL8tgOfbmiJR01lHoyjSanEn3+f9m0CItY52P4BKpH2IlvejdvoBuA8O4
	uoDU4KeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcssR-0000000C9T0-3FlC;
	Mon, 05 Jan 2026 22:16:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcssP-0000000C9Sf-21DO
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 22:16:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0bb2f093aso3594055ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jan 2026 14:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767651397; x=1768256197; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CnUVUqPqeZj3uBC9OMfEyvC2v1C7JsZ9WatRVB2qxEc=;
        b=gQVg8iLMq0gHVhLr0uvaiqBJwuLJraVfE+U+g+mBUdwS6wuysZGWiWnn3OWhpm1cdr
         lbWYGiSngcjQDwMsUXP61p0wdPqNflvdyIGH9OMGaTr65pxfoLjNqHxNx1qyUnJ4xkLa
         O0bFZAEJm8c7xpJc8jA8vJqkMMFE1Ufz4iyk3tZa5zn9lBmgyT6f73hu2rGuX4l6H9YK
         NXNvKybDXV4EnogtgXZFhdqmU/FtQf8dAkUkdAtF/5b7x1j1TmJrCL6yJb8oXdWXdWcy
         gq5WuldQkmMFLXxql3lVUZ/5UsyKI2lM0XXlFVYm41slFSWbfqG9zXvKfd9R4Cjy+wiI
         hyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767651397; x=1768256197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnUVUqPqeZj3uBC9OMfEyvC2v1C7JsZ9WatRVB2qxEc=;
        b=tZEb8pRo4QTtMOBsu83hWa1XfH8L+W6dWuuSKKbknp18bHO2Sul1aFXJNkgM9clpoE
         KwPTy2dygc93D1FMwyDM0Krso1/yAbD3o5zMC3gxqnmHceyRt8iwcTP4H2fv9eYFMgDr
         e2bF3HRmUNgRgnqYxbl+82v4S6sjv6jU5ChechTdMiP33Z8vvY9kyjxAAfCgpTKW54Ho
         PaspHwIFXoQDpTxXrmnpWsPxKGk7ePuO4rgKQT0XDZImUHgNqLCGg2uxGaIKUYmC3CPl
         +7fvWS68uKFYWFtlHcCq7gDaV//6mJFv776ZiUaAhtXJ0tpfFBRY+Nj0bRdIRhIWXu2o
         tb9w==
X-Forwarded-Encrypted: i=1; AJvYcCWK7ALxF8LEMaBADBQHHwn9w1HdmYEpKDu562PszzkzD96R4sUst0hp1adfJJFDu7xwWzzum7sYtEFht2X5Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz2UEVHIJpq6u4m8gyqzOrISUMjIXPCG8lXU9eTGFj0g34Vblh
	Ci1AKeU4/MI3EU4Jb2m5Xl+PT2OwNSZ94dSors390K2PpKvbeOUE3n51CEDO4FHR9l0=
X-Gm-Gg: AY/fxX5q5MSv6nou129vQFwSC1TAeDSIMmETFvsGORKElYCeDXi3QquGoo9xPnJ0zAo
	gbyjg0rmGBD4YxzBb28DDwXbJV2d0gMltCxATCwcWCyA2HRlu192uhZbwkTq/kElq3pATt3kRgq
	f6Oa1OmUjXzUHVkJiNynuF2kajryhkB1r3NSw8JqIjxsNQlvhqcUNCb5H3kWnX1uqzbDHMzMVGx
	FYVPM2g4p+pPKF6bC8Q+JEcVV41YLzwWDfsQ9KW4xFD4JxpDHa4quzViFkgkfZ/2GseYDtDPAwm
	4nbNLWs7Pr6c4ErfUWuUmqLnmqt1ddzUUQk9Q+PQd4lcf9nGW5mAXT1vWGrN1bNx54Fq+6fBi5H
	SalaHt0enf7KFw1YkK+yKfZ20eDTphztKwCfBkIxjcyZKPuMS2HFef/yu7URzWNRExVbaxg/xuN
	tUyqaJ21NYI5hghnpTOhqf67uq
X-Google-Smtp-Source: AGHT+IFbsf18BdWtCP1OIiQqEHJAmtLTt1hAikD6D8lF6RRDdyMObb7WGPdWGrrGijJ79i/5gVbYuA==
X-Received: by 2002:a17:903:2c8:b0:2a0:a92c:2cb6 with SMTP id d9443c01a7336-2a3e2cfd028mr8149165ad.36.1767651396518;
        Mon, 05 Jan 2026 14:16:36 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4893dsm2212295ad.28.2026.01.05.14.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 14:16:36 -0800 (PST)
Date: Mon, 5 Jan 2026 15:16:33 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aVw4QUp6j4vBOrOF@p14s>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229043146.4102967-1-tzungbi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_141637_561169_7528156B 
X-CRM114-Status: GOOD (  22.01  )
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

On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> reverse dependency exists where `clk_prepare` can trigger operations
> that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).

What operation would that be?  Please be specific so that I can trace the code.

> 
> Move clock prepare / unprepare operations to remoteproc prepare() /
> unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> to `prepare_lock`.

With the information presented to me, I don't see how doing that changes
anything.  @prepare_lock is simply held for a longer period of time.  

Thanks,
Mathieu

> 
> This breaks the dependency chain in the lockdep report:
> > WARNING: possible circular locking dependency detected
> > ...
> > the existing dependency chain (in reverse order) is:
> > ...
> > -> #0 (prepare_lock){+.+.}-{3:3}:
> >        __lock_acquire
> >        lock_acquire
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        clk_prepare
> >        scp_ipi_send [mtk_scp_ipi]
> >        scp_send_ipi [mtk_scp]
> >        mtk_rpmsg_send [mtk_rpmsg]
> >        rpmsg_send [rpmsg_core]
> >        cros_ec_pkt_xfer_rpmsg [cros_ec_rpmsg]
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
>  drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index db8fd045468d..98d00bd5200c 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  	struct mtk_scp *scp = priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return IRQ_NONE;
> @@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  
>  	scp->data->scp_irq_handler(scp);
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp_elf_load_segments(rproc, fw);
>  leave:
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> @@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
>  	}
>  
>  	ret = scp_ipi_init(scp, fw);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
>  	struct scp_run *run = &scp->run;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
>  		goto stop;
>  	}
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
>  
>  	return 0;
>  
>  stop:
>  	scp->data->scp_reset_assert(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
>  	struct mtk_scp *scp = rproc->priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return ret;
> @@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
>  
>  	scp->data->scp_reset_assert(scp);
>  	scp->data->scp_stop(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return 0;
>  }
>  
> +static int scp_prepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	return clk_prepare(scp->clk);
> +}
> +
> +static int scp_unprepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	clk_unprepare(scp->clk);
> +	return 0;
> +}
> +
>  static const struct rproc_ops scp_ops = {
> +	.prepare	= scp_prepare,
> +	.unprepare	= scp_unprepare,
>  	.start		= scp_start,
>  	.stop		= scp_stop,
>  	.load		= scp_load,
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index c068227e251e..7a37e273b3af 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  	    WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
>  		return -EINVAL;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clock\n");
>  		return ret;
> @@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  
>  unlock_mutex:
>  	mutex_unlock(&scp->send_lock);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

