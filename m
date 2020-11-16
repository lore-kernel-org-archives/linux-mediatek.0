Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0BEC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 20:32:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F23620782
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 20:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYd+FYWO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lRKK7EsM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F23620782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=txfpdeV4xqTo0kae4YykH7QLQQCYoiqpmFw43mU39bw=; b=GYd+FYWOJKZV/kubmO5nQfNOs
	3QkUZ25gQQLZOaZsF/1yRIW4nOolxmtfo93nlHh/EvG5Tfa4dea0fjzGiZShpgih5ais4vA/XJgm6
	YrUoRR4lCT+08T4pIghpIFVUZKB2V0qldb9rQp0N6GZwyRUeFkUJdshk1OMPy5s5TnOhFpl5sM9lp
	RNr0qUfkmgheS8ojF/H+I9UxmY5c88xglPfIBJVb2xP65JzCuBPK9c2anaUxEmXm2DnGIgkljO57Z
	V782y2GM+CvKWpoP7FRCG6j2b18P1qQfikcswO/cUcFZhAJ663fjLfEjLx5SBharP7PVvxp0bCeMi
	JFVyhC+Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kelBH-0006t3-4x; Mon, 16 Nov 2020 20:32:55 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kelBD-0006s8-MP
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 20:32:52 +0000
Received: by mail-pg1-x542.google.com with SMTP id v21so1518318pgi.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 12:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZpdPZ+0TUHnu7fJ+T8SUFrv2OoPCXOYjcPmZe955kpo=;
 b=lRKK7EsMxuM4sBoqAFrmkkSVVrO4pbm/VeXuc2GRChWOxGic9EagiZl1qvbSjIsdAY
 5F4wWcOchmmU5vS9MfdxxMDy5Ha50/hpX5ol153m49u2M2xRVMdi61mgQsCNcxHoSB97
 1J6UpLvIjd9cyQlWKEzymXop/zzHBFo2LM9B2eUsGglwja4DPy5x8xcNnSpYgwlh/RWv
 xkZHiPrw09jarQ3y+UkYA5B4Bxy+9WsMxvo/yhreNCkiJoMhtCk7WLck6zV3zp6JULNX
 gmrflYY7k+rKpqAljuOkiuDtZBIZ7NX44dy+HxvOL4XXfRaZyZ/Ra78BhtEcNAXcMBrY
 jEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZpdPZ+0TUHnu7fJ+T8SUFrv2OoPCXOYjcPmZe955kpo=;
 b=HvZaDUq9aPwT+ySUv5GPpgi78xBLwa3W8fGi49eCGV9caFhaDoCzy4KPoOA9BBsEWk
 f+YjpcHnur9caL67R1jwe8+AAuMS8NQ6XwIVW2GoOL/rloHU5GJHUTSOI2x/WxePDx97
 ETc/w4sTZnLsqMOE5zKMOaatS+hiiMRFpaop+4npP1w65jpgaQsoUGsf7z8okNlbptIn
 fZ55k2QEpz32MOL6DMdTo3hAjtdNwXf2kbRoVaRRKs/ydLbHrS/VMmuQPqOmNMUWdgfj
 BD5PbCbdUAj9a9QgAd2QUxsKwp5y317FxD03QYzRH84S4CGEHLz1wpa3A/NG6rNm7IsQ
 RdOg==
X-Gm-Message-State: AOAM530GXWT3LFin0sDxr3Li624KHVvQHxRoA9QLfRpL79fyrBkJ5Gvd
 Q+CT6WN661LH3XX7gPe2vqw5Jw==
X-Google-Smtp-Source: ABdhPJxobQPtWPJb6lGCS3Y6qZ6XPjmDFCoOPDtYjpvZji1TwBgQY6V5DxDYWnp+FOtk89e05lfUtQ==
X-Received: by 2002:a17:90a:f0c7:: with SMTP id fa7mr718184pjb.3.1605558769059; 
 Mon, 16 Nov 2020 12:32:49 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id h3sm18146122pfo.170.2020.11.16.12.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 12:32:48 -0800 (PST)
Date: Mon, 16 Nov 2020 13:32:46 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2 2/2] remoteproc/mediatek: fix sparse errors on
 dma_alloc and dma_free
Message-ID: <20201116203246.GB3892875@xps15>
References: <20201116082537.3287009-1-tzungbi@google.com>
 <20201116082537.3287009-3-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116082537.3287009-3-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_153251_796120_F574A2EC 
X-CRM114-Status: GOOD (  19.47  )
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
Cc: ohad@wizery.com, drinkcat@chromium.org, kernel test robot <lkp@intel.com>,
 linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
 groeck@chromium.org, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 04:25:37PM +0800, Tzung-Bi Shih wrote:
> Fixes the following sparse errors on dma_alloc_coherent() and
> dma_free_coherent().
> 
> On drivers/remoteproc/mtk_scp.c:559:23:
> warning: incorrect type in assignment (different address spaces)
>    expected void [noderef] __iomem *cpu_addr
>    got void *
> 
> On drivers/remoteproc/mtk_scp.c:572:56:
> warning: incorrect type in argument 3 (different address spaces)
>    expected void *cpu_addr
>    got void [noderef] __iomem *cpu_addr
> 
> The cpu_addr is not a __iomem address.  Removes the marker.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 2 +-
>  drivers/remoteproc/mtk_scp.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 47b4561443a9..b3397d327786 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -99,7 +99,7 @@ struct mtk_scp {
>  	bool ipi_id_ack[SCP_IPI_MAX];
>  	wait_queue_head_t ack_wq;
>  
> -	void __iomem *cpu_addr;
> +	void *cpu_addr;
>  	dma_addr_t dma_addr;
>  	size_t dram_size;
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8ed89ea1eb78..a1e23b5f19b9 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -413,7 +413,7 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  	} else if (scp->dram_size) {
>  		offset = da - scp->dma_addr;
>  		if (offset >= 0 && (offset + len) < scp->dram_size)
> -			return (void __force *)scp->cpu_addr + offset;
> +			return scp->cpu_addr + offset;

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	}
>  
>  	return NULL;
> -- 
> 2.29.2.299.gdc1121823c-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
