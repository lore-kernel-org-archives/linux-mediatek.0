Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6416C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvhRUGtNGpFjLmWDuk1RNo4k10Wg5s75qmj36GoLP+A=; b=bmOWpotjSlc6f0v8Jk3XKic0sl
	JHnKlq/B2f8/3l65loqW0H8KFrbQFG8mqp20afccydX4ZUCQq6BLT85KZHA+yf3XZC9xbajlPh3Tt
	YQskrbNe3JSUlko5IruhjdlSOo80e0lfXpfo5U6VkARgIHPRZ0xaDES/FyoHJvk+K8GrY/3+yOzk7
	lueZ4vvaf04fqqF+ZI6FpgJTSIRgcORHPZt3pyO8k6UNUjuYAbgunJ1PTAzX/pnUNmLXno4ZHx9fr
	6He06nAK+NaWMPjBTIa/RSh48qM5pUfO8o03542pfXp7HvSKJnhLnLeC6i5d1cyBqmG2r/YgcZizN
	ZcovQmNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAr2-004PvL-2y;
	Wed, 03 May 2023 11:41:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAqy-004Ptd-21;
	Wed, 03 May 2023 11:41:02 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FA9B6603137;
	Wed,  3 May 2023 12:40:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683114059;
	bh=n9OmOmneeX6wqBjDmlr0Zvo9uXocS0m84dAmWMG3fxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VTOSfAHSQ938Nxqe8G8CggzhRoBUh97H4KzW+xbvFP8uvmlpFcAcVv7FRm5/wT7WK
	 l1sn/IvkaCsIOD0gC52q6jcKbUTcmjeJZsfY47YcxacT+w2xTStsjR/SUsZlHEVCZ7
	 JM+bGimVVcxw1ENIIgXxZIMqPLMhvYVSo98q35Vnm2/kIKI8OR8nPLfVCaWEGrwZN/
	 LPg89L2F4Xc1ovybZnSD4v/G9JplLgMrulrSrIfkmkEqb/iUdDU1rDk+nXbkAKKV0j
	 fv0D2Hkb0oxanx2C3ioa6IsMKIJXrWE0iw66O9aU8ki7sI1IHewmJuUjlYamSjloUm
	 whcG+q2QVpU3w==
Message-ID: <6439bf4e-979e-889e-c97d-e7b1dd94b4f1@collabora.com>
Date: Wed, 3 May 2023 13:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] PM / devfreq: mtk-cci: refactor error handling of probe
 and remove
Content-Language: en-US
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com
References: <20230503092742.19404-1-jia-wei.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230503092742.19404-1-jia-wei.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_044100_821452_D5C5B84D 
X-CRM114-Status: GOOD (  20.32  )
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

Il 03/05/23 11:27, jia-wei.chang ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> To refactor the regulator/clk handlers so it can follow the way of "Free
> the Last Thing Style".
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Fixes: 86d231b1db1b ("PM / devfreq: mediatek: Introduce MediaTek CCI devfreq driver")
> ---
>   drivers/devfreq/mtk-cci-devfreq.c | 47 ++++++++++++++++++-------------
>   1 file changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
> index e5458ada5197..d2f743774147 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -294,14 +294,14 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
>   	if (IS_ERR(drv->sram_reg)) {
>   		ret = PTR_ERR(drv->sram_reg);
>   		if (ret == -EPROBE_DEFER)
> -			goto out_free_resources;
> +			goto out_disable_proc_reg;
>   
>   		drv->sram_reg = NULL;
>   	} else {
>   		ret = regulator_enable(drv->sram_reg);
>   		if (ret) {
>   			dev_err(dev, "failed to enable sram regulator\n");
> -			goto out_free_resources;
> +			goto out_disable_proc_reg;
>   		}
>   	}
>   
> @@ -316,12 +316,16 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
>   
>   	ret = clk_prepare_enable(drv->cci_clk);
>   	if (ret)
> -		goto out_free_resources;
> +		goto out_disable_sram_reg;
> +
> +	ret = clk_prepare_enable(drv->inter_clk);

Adding a clk_prepare_enable() call for a clock must be done in a separate commit.
Besides, there shouldn't be any need to do that, as when you call clk_set_parent()
(done in mtk_ccifreq_target()) on a clock that has flag CLK_OPS_PARENT_ENABLE, the
clk core will automatically call clk_core_prepare_enable() on the new parent.

If you're facing a bug for which the parent is not getting enabled, the solution
is to add CLK_OPS_PARENT_ENABLE to the interested clock.

Regards,
Angelo


