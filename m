Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BDFC5519F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 23:32:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C9122240B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 23:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZv2cdID";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5IKkXy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C9122240B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4mWysXdRxXZv8dmwBDLQatT5xItomqhnhu5/wUivtDU=; b=cZv2cdIDcUtnkGHXKzVyhXKwJ
	QOvr57UHUvT+sDGGhNm9YLThYTIBYc0nHxUBX36sA+o6dLgSg6af+G/KY9uwTzc9DDFW1EJLol0f8
	kH+6NBCFi5x0jPEhijeCkOiQhr8HbVAV1OB14ZJVXChl/w747EBjAgpY1OBudWQsrAwqVgKLZmQhN
	rzqrYzCjxKp2d1hwkhRLtEn9Osps7/SXV/3EE6vOfyENSmzy903uUY8Gi0Dsl90cxXyaAodPsaca1
	mw1RAj5/hT5bgjcJnMwOBzcMqGHr2Gwe4FqcEQXh659X0YWwLtXX5dSboggmcRF6A5ayPh5ey//xo
	gi2sIQ5HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgFso-000733-40; Fri, 20 Nov 2020 23:32:02 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgFsi-00070w-Oa
 for linux-mediatek@lists.infradead.org; Fri, 20 Nov 2020 23:31:58 +0000
Received: by mail-pg1-x542.google.com with SMTP id m9so8646611pgb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2020 15:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xEIO6/wEzyK0kZrzGy927QBd/xK3YcJG0eoEjfm1d8c=;
 b=k5IKkXy7hLPF4UkKuPBEklGT1V91wEnWAciAbHkrStWRj5v4gWESyPuiDEiAA/L8xd
 vhgu9cQc+KiegUUiuKe/N6/5XvAPYfLbKqgSp1T8tHM4tIqJWP35ljCXC7McHVed4IiA
 u3GhuFTX41MrbW660ye83JMnrWanbvuKc4jbgHy9d1wckivK+DVK5eCdb9hrSZ4kpd/u
 pxSyt4eXQQrz1BtIk+htAIQXsHymf6aDDgxpJFBo6nTeNsU0+ENaNZHGsdz2v5+pFL8L
 keicqStW710rcOB7s2Hd4Fw0uJDDUfYVTv1BdP+NxXvniyh/jUKoUGnBvdkwLEu4rlzx
 Rfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xEIO6/wEzyK0kZrzGy927QBd/xK3YcJG0eoEjfm1d8c=;
 b=CWhXeICeIlfzISxLsKuWG/S5ASTu2n0KR1o//gMbrY57XVO+dPj1c4Hebz53NgyGEX
 Xk4KusgvI0xqQUPh1JCetUEOcg7vuHj+l6mRoY6SO2vwzttBgK6wUezOxy8zGItDH5iS
 JCJfpu6nYlcSvNieoJvAfRUl6xWDGSUJFPSmzAK5o08uxad8iBDzkQNYHsPT2J509MCH
 Es/aZy4X4qa3pV6T/zwMEiajQ3A4c3d9V/kRkmaQWpjWpCAkHMB0zdSgsQmE/zBh4feA
 Xf6h3LlXrRs4YJ9gk/hEcWZ4291rTjkmYgxpYcy9u1wnVoY4sP+jmKOqb8MT2nW85N5V
 3toQ==
X-Gm-Message-State: AOAM532W7e8xnETmIZlLN2KD5uqgTHXaRuF7W+b5V2ntTtVQDEz4jl2F
 2v9JJWpZmeQv8yfiGmWkuYtbLw==
X-Google-Smtp-Source: ABdhPJxSxX7IYQtKm4ZeIuwINPJZEhC+oMtEbu+YSlsWQhi0fEHQV88uZ8/XWi1dG0f7OwdyQHAWog==
X-Received: by 2002:a17:90b:ec6:: with SMTP id
 gz6mr10965174pjb.142.1605915112733; 
 Fri, 20 Nov 2020 15:31:52 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id y14sm4823503pfr.73.2020.11.20.15.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 15:31:52 -0800 (PST)
Date: Fri, 20 Nov 2020 16:31:50 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2 1/3] remoteproc/mediatek: fix boundary check
Message-ID: <20201120233150.GG4137289@xps15>
References: <20201116084413.3312631-1-tzungbi@google.com>
 <20201116084413.3312631-2-tzungbi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116084413.3312631-2-tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_183157_153909_E03923F0 
X-CRM114-Status: GOOD (  20.42  )
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
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mediatek@lists.infradead.org,
 pihsun@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 04:44:11PM +0800, Tzung-Bi Shih wrote:
> It is valid if offset+length == sram_size.
> 
> For example, sram_size=100, offset=99, length=1.  Accessing offset 99
> with length 1 is valid.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index a1e23b5f19b9..0abbeb62cf43 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -408,11 +408,11 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  
>  	if (da < scp->sram_size) {
>  		offset = da;
> -		if (offset >= 0 && (offset + len) < scp->sram_size)
> +		if (offset >= 0 && (offset + len) <= scp->sram_size)
>  			return (void __force *)scp->sram_base + offset;
>  	} else if (scp->dram_size) {
>  		offset = da - scp->dma_addr;
> -		if (offset >= 0 && (offset + len) < scp->dram_size)
> +		if (offset >= 0 && (offset + len) <= scp->dram_size)

Right, I had the same kind of conversation with the TI folks.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  			return scp->cpu_addr + offset;
>  	}
>  
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
