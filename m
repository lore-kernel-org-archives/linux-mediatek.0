Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CACC53210
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 22:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40aCXfWhTqUFcCFEIzCnKJwULoW1yAHahg0ZbSH052M=; b=LBUs3gTl1jMzLJfojlEW9AIL5y
	ROOp10pV2LeytEvYVRNVL2TCMHlu7DzRIK4cYVzZPXaB6Pki88QJMLhbVmBFkIAp9D31L0oFL4jFK
	I2lTLVb2CYHY5IoNDG1KsaNtsIegM6IOVy9goa0DsJx/mv4f2PQiedCVyklAF4tNsHJARcs46Vs5e
	fZ2AHP2zsnlYUrqrI+fmNGmxFN0ZeUPOtvq21uphRKgTfGcSN8sSU13evUL1l0J1kg0fyrrSp/n9G
	FJNOCHlWvMTYr+k8PQoD+msqxcwoOfKPnbigWCR5hB+cx5DEYTcBFr7OEIlQnAGk2hvD6NSmfc/CW
	fVZL8Qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDC9U-00CVWZ-Ut; Wed, 04 Jan 2023 22:22:28 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDC9L-00CVQI-7B
	for linux-mediatek@lists.infradead.org; Wed, 04 Jan 2023 22:22:20 +0000
Received: by mail-pf1-x434.google.com with SMTP id z7so18247665pfq.13
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Jan 2023 14:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=40aCXfWhTqUFcCFEIzCnKJwULoW1yAHahg0ZbSH052M=;
        b=PqpRQqIVQqFNj7Q19Abfst0HigNal+4IW1isdwI2TW3/yaJzSsVnI+Xe2O41Sc5OfF
         Tu1+SGVtg0Ct7wVCDoNQKrIEl82X/ixo9XOsG4KBg7eSS/0AtXJfs2eO/gIRhj6W45dh
         hVlxDDgzg//wst937/ps/2SNYqxzPJxJqviJ+umMmn/wFjya0+RoxSSHqMIF8bbiXHtL
         nre0uYRJePf/uvb5PG+H2hCUf7BR2se7AMFW/8vkAZWJ4UWFeg+5167Uo+gyYx9sUcXI
         m9tFe5qpxxnT9YlxtnH5Bp9/XIz8UGPLwl+BknH8NHz4djAE7MbQIAfdglHUCg7ULmEy
         XWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40aCXfWhTqUFcCFEIzCnKJwULoW1yAHahg0ZbSH052M=;
        b=3gtx553Hm4qfTYX9pCeXkRCTItM7+UcWX/hfMruliy7yWB40QmSJFRbbv2jRzqtKQU
         HMWtflm3ue/Qu6EclrBIenqNwaKMLqTIPN+FXj6cdTc9/c7cXZf1SefTqpSBktkFtiXO
         T72dHI6M2RlswuD7H4Deuw0uMFqYR9JBoZJCTko168mk6IjOAXckzEZV7BaL92Ncg1Te
         JghPAIzZ17d/CzF0wnAu/SmbFVIKIL6h+D2oRPS+fFTF/xRNwkJJ4KTVRTF0T5fxues9
         vXk/MHo1iKLiEwH1JBCRPJfY8QNnMnoAhtU77BdAoT6tcSMEyuH+QqSPF2jN43XajTgl
         g4DQ==
X-Gm-Message-State: AFqh2kqMh5zCQV0rllrIIkUba/6X9NCuyQ2Pn7+I2oS62FJB7awAVtKI
	Zgph4/DRz7hDUzhCOIZ44Vlpsg==
X-Google-Smtp-Source: AMrXdXsVIW3Vk9fPr6HAQ5LszLahtDigXGrZxRbdl1FZx199jQzS4XLF4LPyQMfbFxAzkqhdqJa1Hg==
X-Received: by 2002:a05:6a00:26c8:b0:582:b3c9:efe with SMTP id p8-20020a056a0026c800b00582b3c90efemr7751121pfw.19.1672870936297;
        Wed, 04 Jan 2023 14:22:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:1328:ca09:d4c2:fcbc])
        by smtp.gmail.com with ESMTPSA id a6-20020aa794a6000000b005817969c0a2sm15264728pfl.75.2023.01.04.14.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:22:15 -0800 (PST)
Date: Wed, 4 Jan 2023 15:22:13 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] remoteproc/mtk_scp: Move clk ops outside send_lock
Message-ID: <20230104222213.GB2112402@p14s>
References: <20230104083110.736377-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104083110.736377-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_142219_267398_F7518A7D 
X-CRM114-Status: GOOD (  23.84  )
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

On Wed, Jan 04, 2023 at 04:31:10PM +0800, Chen-Yu Tsai wrote:
> Clocks are properly reference counted and do not need to be inside the
> lock range.
> 
> Right now this triggers a false-positive lockdep warning on MT8192 based
> Chromebooks, through a combination of mtk-scp that has a cros-ec-rpmsg
> sub-device, the (actual) cros-ec I2C adapter registration, I2C client
> (not on cros-ec) probe doing i2c transfers and enabling clocks.
> 
> This is a false positive because the cros-ec-rpmsg under mtk-scp does
> not have an I2C adapter, and also each I2C adapter and cros-ec instance
> have their own mutex.
> 
> Move the clk operations outside of the send_lock range.

Thanks for providing such a clear explanation - it makes my job a lot easier.

> 
> Fixes: ("63c13d61eafe remoteproc/mediatek: add SCP support for mt8183")

This is the wrong format for a "Fixes:" tag.  Please see
Documentation/process/submitting-patches.rst for details.

> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I have fixed the above and applied this patch.

Thanks,
Mathieu

> ---
>  drivers/remoteproc/mtk_scp_ipi.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index 00f041ebcde6..4c0d121c2f54 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -164,21 +164,21 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  	    WARN_ON(len > sizeof(send_obj->share_buf)) || WARN_ON(!buf))
>  		return -EINVAL;
>  
> -	mutex_lock(&scp->send_lock);
> -
>  	ret = clk_prepare_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clock\n");
> -		goto unlock_mutex;
> +		return ret;
>  	}
>  
> +	mutex_lock(&scp->send_lock);
> +
>  	 /* Wait until SCP receives the last command */
>  	timeout = jiffies + msecs_to_jiffies(2000);
>  	do {
>  		if (time_after(jiffies, timeout)) {
>  			dev_err(scp->dev, "%s: IPI timeout!\n", __func__);
>  			ret = -ETIMEDOUT;
> -			goto clock_disable;
> +			goto unlock_mutex;
>  		}
>  	} while (readl(scp->reg_base + scp->data->host_to_scp_reg));
>  
> @@ -205,10 +205,9 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  			ret = 0;
>  	}
>  
> -clock_disable:
> -	clk_disable_unprepare(scp->clk);
>  unlock_mutex:
>  	mutex_unlock(&scp->send_lock);
> +	clk_disable_unprepare(scp->clk);
>  
>  	return ret;
>  }
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 

