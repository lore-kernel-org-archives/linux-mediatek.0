Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8001C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0r3RPSlHpkVq6rNR6DaqZXRQvQQCMumynPYlWojVFI=; b=JxetFY868lXEi6Iku7301FWBXr
	zKkF7dX9U1MtV5p875uR7mbRcYkN5hGV9Vs+3PUJkLibRvvCcQUMvyXLuxM+CJGBoKoRunljYBzW0
	kj+9idZW6o56gxrPN1yXGY/EIeR7R0J0W44poxr7quHt/VHWW3j8A6BvZFx3YU8aktMf2LodLdJcn
	x4sYQJldxJ8+1NJ0VESA0hU+SP9BQCULYZhioEe+TK9lq+Qezhbp2pXpantpyOh3TiC08ayAANEyV
	xEkw1a6aWm9k2IKWNK7u1C6blZVRg6HAhG4fgFce/ZkJ2JlWiQsgPVZtQMA/FEWS6qmTkAueHWRER
	bp1/axFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPId5-002MD4-0V;
	Fri, 28 Jul 2023 08:15:19 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPId0-002MAM-0g;
	Fri, 28 Jul 2023 08:15:17 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36S8ElsD130857;
	Fri, 28 Jul 2023 03:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690532087;
	bh=N0r3RPSlHpkVq6rNR6DaqZXRQvQQCMumynPYlWojVFI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BSHinxm9uOn2UhHLeZ5+D7ryjtr1iNxqEqvpVE8SNPAd0VN7P0CV2hZfPhXQi+F04
	 /OTdEChYyASaG0mYemcvTiLXrtKoOt3jToFX4N9cznorAPKBwPGTirRFvzA2S4CDpI
	 epEDIWMOTHbeRPiKkXs9jVpTrZ+FrK5s9mFqAoNo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36S8Elwj012046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jul 2023 03:14:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jul 2023 03:14:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jul 2023 03:14:46 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36S8Ekrv026247;
	Fri, 28 Jul 2023 03:14:46 -0500
Date: Fri, 28 Jul 2023 13:44:45 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
CC: <sre@kernel.org>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH -next v2] power: supply: Remove redundant dev_err_probe()
 for platform_get_irq_byname()
Message-ID: <20230728081445.bmij44pfbckyyrr7@dhruva>
References: <20230727113550.2599335-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727113550.2599335-1-ruanjinjie@huawei.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_011514_331134_94F4EF84 
X-CRM114-Status: GOOD (  19.50  )
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

On Jul 27, 2023 at 19:35:50 +0800, Ruan Jinjie wrote:
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq_byname()
> function as it is going to display an appropriate error message
> in case of a failure.

Ah yes, good catch!

> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v2:
> - clarify the commit title
> ---
>  drivers/power/supply/mt6370-charger.c       | 4 +---
>  drivers/power/supply/qcom_pmi8998_charger.c | 3 +--
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Dhruva Gole <d-gole@ti.com>

> 
> diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
> index f27dae5043f5..571cf00dde07 100644
> --- a/drivers/power/supply/mt6370-charger.c
> +++ b/drivers/power/supply/mt6370-charger.c
> @@ -849,9 +849,7 @@ static int mt6370_chg_init_irq(struct mt6370_priv *priv)
>  		ret = platform_get_irq_byname(to_platform_device(priv->dev),
>  					      mt6370_chg_irqs[i].name);
>  		if (ret < 0)
> -			return dev_err_probe(priv->dev, ret,
> -					     "Failed to get irq %s\n",
> -					     mt6370_chg_irqs[i].name);
> +			return ret;
>  
>  		priv->irq_nums[i] = ret;
>  		ret = devm_request_threaded_irq(priv->dev, ret, NULL,
> diff --git a/drivers/power/supply/qcom_pmi8998_charger.c b/drivers/power/supply/qcom_pmi8998_charger.c
> index d16c5ee17249..ce7392e7d8b8 100644
> --- a/drivers/power/supply/qcom_pmi8998_charger.c
> +++ b/drivers/power/supply/qcom_pmi8998_charger.c
> @@ -922,8 +922,7 @@ static int smb2_init_irq(struct smb2_chip *chip, int *irq, const char *name,
>  
>  	irqnum = platform_get_irq_byname(to_platform_device(chip->dev), name);
>  	if (irqnum < 0)
> -		return dev_err_probe(chip->dev, irqnum,
> -				     "Couldn't get irq %s byname\n", name);
> +		return irqnum;
>  
>  	rc = devm_request_threaded_irq(chip->dev, irqnum, NULL, handler,
>  				       IRQF_ONESHOT, name, chip);
> -- 
> 2.34.1
> 

-- 
Best regards,
Dhruva Gole <d-gole@ti.com>

