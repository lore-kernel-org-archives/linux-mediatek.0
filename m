Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F398C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 04:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7ZY02wnB++PrtjjVebywq2P+KdwsUUnvCgPrCN1viE=; b=jkW255kpTmSMuTQcAc8cklj8yq
	yA3Up+8LFUYR2OG7vl8jLaHaY/OVt0PDkyi/NAHe0AuWYrIWTA4+BeM8YV8Rg28SsAkX4XvysYlkl
	72kNCHUbGbNc5KTa0APpOZyPQajbiaGrb/lGfpf3GJCsuLtqKtpn+/XNZ073/OUiuwCdoCzfdHzgw
	pBTaG8U8bflmq8fcrzM4xv1xWXzynzZjQ5hM5DbqhJ9nuBuWahwjjlTwWjvnrGSaUi8EKfEsEnAJa
	rdQONm6dpM9pkNKjbhAsXJnpSp7Gh4IgwLVLy8NvwAEwgm4l5sJ4/nGU7FLZIQesw8PGZpljGw/uA
	quQlUvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLGAp-00DEeo-C3; Fri, 27 Jan 2023 04:17:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLGAm-00DEdR-2Z
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 04:17:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id jl3so3814969plb.8
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 20:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7ZY02wnB++PrtjjVebywq2P+KdwsUUnvCgPrCN1viE=;
        b=O1dz04cJ9kZB389iORyVGSppE1KZyeImi1gkXdGZe+K6gTCkXMDsrzWFY/B1rG4uZY
         WsPe9B61kEKUrWaOtn/KkG6VGyorkeI4CgGpvzq6csEgwlPPcRRrjzHlnFBjGsjXGswi
         oT6I1R0Xe+hMpv8JH4B+88d1P/RDoM0LUxCyqEqup+80+okrXb4RLJEhfuYDlZOVDdk8
         F1yifj+oHz0wluaxO0aItc5lHE2nkkpE4zSGTePtL3m2rC97jKI7OdX6HI5d1++8Bo4R
         yFi8Lt5dD/yR+jk2yiQnLMmMnhDFfRBuyQ5mwGOyZNHEfWzjpnQukJwrjtnx+5aFNESG
         qMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7ZY02wnB++PrtjjVebywq2P+KdwsUUnvCgPrCN1viE=;
        b=VCW794bfF9vINTKo8UmWs2wtJp1kVYh5ItZo5un5Vqn8TVxHbDFBnATUdRssPWDILO
         UJrbxhs8kvELOkJO4bCipuJgw4DTHMBvHwLi0IvvNCMhmQlkUr8HweCPiaLIBy0lo2pP
         +iOc73e3eA4jviVi/RjenlEzR06JBICSwnMfi83Gysr5/uROGrMsi2I7I1F5+yCaIAU4
         erhOkOWvIcLooRiuk0UsiK1lcbsde189QNaS8UPPUKIMewxSKILvCFOf6xHUsja/XFF3
         In2YVe+4O7cQPNr2AuOZkdxeEnyNi+2oIMhvXJRvELUmwoWSXZKyulvZct9bsUi/viuj
         /IcQ==
X-Gm-Message-State: AFqh2kqT8H47vl4nD2RvHXQnJ7/CQGN77d/g9YCfHCPQrYep765z7B4i
	rNygX1ADTr86QO9+qf1Omyi2eQ==
X-Google-Smtp-Source: AMrXdXviEje4NBqjKMkEyy4TLr/lPqx6nBeGPG8VZTMVcSSpAEjb5nSV2Wrb7k5N2Pep7SUuznqsXg==
X-Received: by 2002:a17:902:6bc6:b0:194:9c69:290c with SMTP id m6-20020a1709026bc600b001949c69290cmr34716033plt.67.1674793026085;
        Thu, 26 Jan 2023 20:17:06 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id x7-20020a1709029a4700b001949b915188sm1786613plv.12.2023.01.26.20.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 20:17:05 -0800 (PST)
Date: Fri, 27 Jan 2023 09:47:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: mediatek-hw: Register to module device table
Message-ID: <20230127041703.325luwaf47topv4b@vireshk-i7>
References: <20230126154856.1322193-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126154856.1322193-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_201708_189011_CFC147B9 
X-CRM114-Status: GOOD (  17.33  )
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

On 26-01-23, 10:48, Nícolas F. R. A. Prado wrote:
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  drivers/cpufreq/mediatek-cpufreq-hw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index f80339779084..115b0eda38c1 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -324,6 +324,7 @@ static const struct of_device_id mtk_cpufreq_hw_match[] = {
>  	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_offsets },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, mtk_cpufreq_hw_match);
>  
>  static struct platform_driver mtk_cpufreq_hw_driver = {
>  	.probe = mtk_cpufreq_hw_driver_probe,

Applied. Thanks.

-- 
viresh

