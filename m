Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0F1C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBv65ePymP8BrvBqJEccHdic2EPa2EXBPtUssXzhwOg=; b=lazXeBM/K1DK6e5sm1bpmE4EL+
	34/zxOzOym7LICr8JJ0PqBQr1RwtCN18RzyGNqAR8tWZk1YA8E9IqbmmlFlSp/6c8tWkqLFGAQb2N
	ebDI3FjwuF8Q3fh/Id2li8t/NAOhJ5MQ/TtfBKl7vfFFoJFuvvWgQgDQtFwvuqDZ+Y57Rj6nrUtI2
	YJjh+9NJPeQ1fG/aNJqKctp7X10pKwBlRPactZ4IX3/MKMJ/BxCsLdlRAyZFrfdPWe00JSboRczJG
	LrddUX3AkJWT+Jdc+buJ02d4sqDWxeFbxZj57+yLwcV9jBMfMmgIq7Zv64gQnFe1AWsRb0Wri48Dz
	SnTny1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaUE-003698-LX; Wed, 13 Jul 2022 11:24:58 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaT8-0035V4-En
	for linux-mediatek@lists.infradead.org; Wed, 13 Jul 2022 11:23:53 +0000
Received: by mail-pj1-x1029.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso3141102pjc.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Jul 2022 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mBv65ePymP8BrvBqJEccHdic2EPa2EXBPtUssXzhwOg=;
        b=WJAHzNZPHYaBkOnHpUQsHsNvlMG0D7+q0blC0hb3ey7VLNCE6BhnhWgLR5TKOl4CVy
         KlBzLf6ICrSJyRZiQ3Jfb13yrTfH4mY8+LQhzMKRdp9948RtdB8bjg0dYdKTNlridZpL
         x1XKBhSYeYAFLvts3J4JXpPcQeGtNvuJu3ZocsMTzZklY/vRr6OEBwF0luD3QTpjxDI1
         0gd2HF+OXqxmKU0e5YvHukDOUKKZl1Dslaut8KNfBnWoyLRGEtci8Oe6f7nMFXSL+xhH
         Gx78N5kAO/ESczBNpyuKdpcUP2QQ+fCpS/ntuX+IWdzTHPCFi1FJlBufX8AEVTn4LR5L
         gqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mBv65ePymP8BrvBqJEccHdic2EPa2EXBPtUssXzhwOg=;
        b=qSXUvPAeOpoQmF3qXKYm8AXgc2psU4Wr9NGReS15wSDKCUPQRLESpHcUheZYj2ya94
         mb6fI65I2YT8bKzErDjWgtlGamvI8M71A677rAOQ+2vGm9UBrgyVVtM91bc3mkpApx+I
         lW37OCph/geLC6+HdxWznt0vd2XhrDrFF8mqXrW2IAMi1r8e5eI0yc3dGpEIQELsnE+e
         7MYthS4dC9xBomMrLyw7sPpMPDNLfrnJGcqVurmJxhNaHKXQfY0VVJamAXIrOMXskxxC
         SPlxNKouPtuMsT/3aEncC99t3cFCdrSWg654A9dKiVRQwFNgCngJYCiSayuGvRiPRM9I
         k0VQ==
X-Gm-Message-State: AJIora8jmfQUI1zEqiexCyOhfItQEhLLmco1VQpNfRI2DVAhbCRWIo+E
	SMeeSdoZkoVVLUGFJhPg5/UJFQ==
X-Google-Smtp-Source: AGRyM1vma2fRTzKqlFqr8JzUoIhx2aJdRjOGe9vLEj93pDZb3OCTdhl1QJ6TIZS+hluNNhT9C8eGSA==
X-Received: by 2002:a17:90b:4a08:b0:1ef:f36b:18e1 with SMTP id kk8-20020a17090b4a0800b001eff36b18e1mr9731642pjb.246.1657711426680;
        Wed, 13 Jul 2022 04:23:46 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id 200-20020a6219d1000000b00528d7d27211sm8754024pfz.178.2022.07.13.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 04:23:46 -0700 (PDT)
Date: Wed, 13 Jul 2022 16:53:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	jia-wei.chang@mediatek.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Handle sram regulator probe deferral
Message-ID: <20220713112344.ye4xgjlqbhyvb46h@vireshk-i7>
References: <20220713111536.115097-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713111536.115097-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_042350_554446_193E1AC3 
X-CRM114-Status: GOOD (  17.24  )
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

On 13-07-22, 13:15, AngeloGioacchino Del Regno wrote:
> If the regulator_get_optional() call for the SRAM regulator returns
> a probe deferral, we must bail out and retry probing later: failing
> to do this will produce unstabilities on platforms requiring the
> handling for this regulator.
> 
> Fixes: ffa7bdf7f344 ("cpufreq: mediatek: Make sram regulator optional")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 3a2be4552020..7f2680bc9a0f 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -439,9 +439,13 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  
>  	/* Both presence and absence of sram regulator are valid cases. */
>  	info->sram_reg = regulator_get_optional(cpu_dev, "sram");
> -	if (IS_ERR(info->sram_reg))
> +	if (IS_ERR(info->sram_reg)) {
> +		ret = PTR_ERR(info->sram_reg);
> +		if (ret == -EPROBE_DEFER)
> +			goto out_free_resources;
> +
>  		info->sram_reg = NULL;
> -	else {
> +	} else {
>  		ret = regulator_enable(info->sram_reg);
>  		if (ret) {
>  			dev_warn(cpu_dev, "cpu%d: failed to enable vsram\n", cpu);

Applied. Thanks.

-- 
viresh

