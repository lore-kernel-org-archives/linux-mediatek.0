Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQqA3RHlmqC4wh5/JEeyEKSsMFTNG/ptCy+X6tAb/JY=; b=PqoZZLO+7b3SNJZxL/jjgr5Vbf
	ctaPO/okQzuKFJaMFswjyVg1Im7Eq0c4FGp3aJ8xjUMIMfw1MWNKtp+iNGoaIWpUFQoUlRDmOmLRv
	P9XfXUzTCxxY+dnA8PegLO8fd4qoqJldOCUhCkMajbhPUtLKGqgW9Ej159wtOCkhh4ekmiAptlCmV
	fUpwq7O2L09kLoO69SzMdBmY4llgkFkhC3qzaWmUez9IBIRog9Tvv4Q3uqMsGicwWDKCMqUG4hEc4
	6k1alb04Roi6qW8f8I3aAt7HBDEyilfmAadd5qjNh4IR6OQkpqvt0AG9RobPHXJMSnlvU7PsllIoL
	R9wOmgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3IHE-0013Qr-B1; Mon, 20 Jun 2022 14:21:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3IHC-0013Q7-7X
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 14:21:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 997DD660159D;
	Mon, 20 Jun 2022 15:21:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655734871;
	bh=1IzybNISo/qb6ajNmb/E3/HYWTJnWgW68XVLtKxjpQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R+Zk4qEZVjVF10Y0lFJzWvE1/eed+MdfL/c3tDFkgtrZX38tOIjJd1c0QMXwToIaC
	 uE1XLJ/nHZd95PXP8CzGxccUfszQWWoSnM8RnbHYc+x34QabPELyrevasvliIFGch8
	 GNHwPT+f3LiQQGOe5OnWPyapchfVR2QY+f7gSg4xIJKP6T+cwiMlQP2dy+QOtLKAxO
	 FbN6trgIEWvQtDucS4hATU3oPsPFqd8uNlExwFbgJ7wTmuU66tvFPdPObEu29ocKe1
	 m+ehzep8YZlO3DjSQuuy/eTBih8ycSU30gOfHx2F5a90Ksxc+ML7zRRlIXKsEljAwE
	 NufvhcuMZ4xmA==
Message-ID: <25da54a7-3fc1-39c2-ed93-0ad72ce54e11@collabora.com>
Date: Mon, 20 Jun 2022 16:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] PM / devfreq: mediatek: Fix possible dereference of null
 pointer
Content-Language: en-US
To: matthias.bgg@kernel.org, dan.carpenter@oracle.com,
 johnson.wang@mediatek.com
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220617133330.6510-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220617133330.6510-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_072114_448198_10887753 
X-CRM114-Status: GOOD (  18.38  )
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

Il 17/06/22 15:33, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> We dereference the driver data before checking of it's valid.
> This patch fixes this, by accessing the PLL data struct after cheching
> the pointer
> 

Hello Matthias,

honestly, I don't think that this commit is right: mtk_ccifreq_target() is the
devfreq_dev_profile's .target() callback!

Checking mtk_ccifreq_probe(), we are setting drvdata long before adding the
devfreq device so, actually, it's impossible for dev_get_drvdata(dev) to return
NULL, or whatever invalid pointer.

This means that the right thing to do in mtk_ccifreq_target() is to simply remove
the `drv` NULL check, as this can never happen! :-)

Cheers,
Angelo

> Fixes: 07dc787be231 ("Add linux-next specific files for 20220617")
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
> index 71abb3fbd042..77522f16c878 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -127,7 +127,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
>   			      u32 flags)
>   {
>   	struct mtk_ccifreq_drv *drv = dev_get_drvdata(dev);
> -	struct clk *cci_pll = clk_get_parent(drv->cci_clk);
> +	struct clk *cci_pll;
>   	struct dev_pm_opp *opp;
>   	unsigned long opp_rate;
>   	int voltage, pre_voltage, inter_voltage, target_voltage, ret;
> @@ -138,6 +138,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
>   	if (drv->pre_freq == *freq)
>   		return 0;
>   
> +	cci_pll = clk_get_parent(drv->cci_clk);
>   	inter_voltage = drv->inter_voltage;
>   
>   	opp_rate = *freq;
> 



