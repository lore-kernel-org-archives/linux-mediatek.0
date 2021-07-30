Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9473BC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:58:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B22860E93
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B22860E93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7taoH4cxWu+P6E9wTht3+tqYNYfKT0NjfKNO4+5dzI0=; b=vy8z40UlKqot68
	ihbTE+HYSjr6y73wNvHOR0JAsyYrT76YtPEiS3fMhrMoGtA+IQsy1mqg6nQppRDLGa1YcH6zZr4yE
	9i0lSlqVpClXG/utHAaGE/u8BW17s3EQAP8YUUij0DcTYKWEv1ilJY7ZQJg/PfmYmUzpWSSoR1xhD
	hS7R74yX7H9/4N5hV24zQmdKzfwtVFcaP9RpJxDrxWn+yFT0+oqkZeF28ijtBCSA8CpVZ8e7Tstl7
	aqGNA1mFRsG3NDM7RArOB9QhEdHRefSPptyreAG9pkpq68aMG4NTqPGHsmAXtwTGyxF9r3mSPJsaD
	SY1I2Tuukt0ZbXfWQvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Uu3-009Ov6-F0; Fri, 30 Jul 2021 15:58:27 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Utm-009Ojv-Pk
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 15:58:13 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id
 z3-20020a4a98430000b029025f4693434bso2576743ooi.3
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xXNqWSr/rOC4EQDcPG5tueBmU/blNavYsUX/3Rklcr8=;
 b=TDxHet75+KJYPXBOyj4Qpsipf04ggYz4gNIiL7z5WeCaNCEbDWbw1ludfUUdIAwnWl
 QELftxDKswIa8A3hXuESnq0jCFZVthL2BR0JI6HaeD3lRv42W+9LVTO//VJ4T1NM853T
 ORYy1yyDaJHLj0a20bBy2HOXSkLPGzewxTAU7JEbvpQzabOxTg7cDCNVVXV6kiXVtewj
 d0m2Aax3ksfa5nt2bjLkkU6+oWaj8MC0vGZMHyB3cVsUbh8mrvU0HV8YRVBkXsOamJ6Q
 sm5hNuAcWgRt99OxxHE6bWTzukgLVRxjqOLPgz+9zzWfR3s3s9V0XZOn9GTY+p4uAM/D
 OhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xXNqWSr/rOC4EQDcPG5tueBmU/blNavYsUX/3Rklcr8=;
 b=l+FTl0TtPkToc3DZBQRORJ9btSJ4GqCv0MISR62H61lLZ2pn1YFXKtRGLdxQWd+svT
 FXthkSo0eDsO3jWog+pWF1u5I3/bE2pillEzVuDM867sWlNDsHRXpjyF4kjGxXySg/w3
 wTa4tkXK8c5MNFstMCelnmDPVtrts3ZUZnxXBohNPA2hp+ZB3fFtODvlhbhO7+rLeMCu
 IIJwYXCWjQBJuz3+A1LQOTsTM13eCgbj2Fc8hiEU+K5gR6MQRxWOM8di7odiGxTvx7If
 8nMiLKGCSKheXvDVnJOBlS2E7uJNHBUPYkBo3XBpSHmKo7uoIuV3IZSOYXTHwgDHmYX3
 OWlg==
X-Gm-Message-State: AOAM530Ug8krK+e5+kxddXR9IjRXkKYasyvo05LPOggfA6bxgWwVP/A4
 2ZkQm3gLMMv8Xc1g5FgKsBWH7Q==
X-Google-Smtp-Source: ABdhPJxNj8jj5sY4NGuc2RO8NVr4KbyZYhV+2uDrbtcKs+ITXyvoyO/r+/cURV1f+got7YHENp8UZg==
X-Received: by 2002:a4a:6042:: with SMTP id t2mr2154509oof.31.1627660688308;
 Fri, 30 Jul 2021 08:58:08 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z22sm282294ooz.20.2021.07.30.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:58:07 -0700 (PDT)
Date: Fri, 30 Jul 2021 10:58:06 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: ohad@wizery.com, mathieu.poirier@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, tzungbi@google.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 4/4] remoteproc: mediatek: Support mt8195 scp
Message-ID: <YQQhjuqAaT1xaIWM@builder.lan>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-5-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-5-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_085810_893118_BC1A1754 
X-CRM114-Status: GOOD (  18.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue 27 Jul 22:58 CDT 2021, Tinghan Shen wrote:

> The SCP clock design is changed on mt8195 that doesn't need to control
> SCP clock on kernel side.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9679cc26895e..250cb946ea37 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -785,7 +785,7 @@ static int scp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto destroy_mutex;
>  
> -	scp->clk = devm_clk_get(dev, "main");
> +	scp->clk = devm_clk_get_optional(dev, "main");

This makes the clock optional for mt8183 and mt8192 as well.

How about using mtk_scp_of_data to denote if the clock should be
acquired?

Regards,
Bjorn

>  	if (IS_ERR(scp->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
>  		ret = PTR_ERR(scp->clk);
> @@ -877,6 +877,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
> +	{ .compatible = "mediatek,mt8195-scp", .data = &mt8192_of_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
