Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F58C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:16:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 891C660FDA
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 891C660FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qvKNr3Jakn8ebXuZlcIadSs18uZv/KMqCye0nODpkYY=; b=C+9mgjkUYAFVXqo6UjfNUnLTBV
	vwZh34tzKABx3r90Gdwh741sV4J3AZNlPS2cUs5fUr8PVoRw4X04mBW99SlY5Ioeh+bmHer3EPLYm
	BswWiinhBa050idG/eWSVbPA/wa2DQYwe5axowd0UPWvm/tHC4P64LB8Kml2Zx/BsuunCJU9QdSb8
	mn+4Kgtc4qa4/xeogCXC+GaWI6iy2CJiAEOUV3RzmS+aPWimigAcsA7NbiQCSspmmmsM+hwgGsiJP
	W81bCXDpJ3srpEfbw6zr1mk1I/CJkfaY+jogwZiVRfwfzd6rjnMFXX9zRsN7T3Vzab1S+AQLO2VWL
	xFIcNtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2syl-006uVp-NP; Mon, 12 Jul 2021 10:15:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2svl-006swt-Sz; Mon, 12 Jul 2021 10:12:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id B78851F4210C
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v5 6/8] media: mtk-mdp: propagate errors better in
 pm_suspend/resume
To: Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
 houlong.wei@mediatek.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20210709022324.1607884-1-eizan@chromium.org>
 <20210709122040.v5.6.If7d6a147afd8880940c42d7998e47ed3869e8805@changeid>
Message-ID: <fb0cef50-be3b-3657-fff1-65a957eba35d@collabora.com>
Date: Mon, 12 Jul 2021 12:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709122040.v5.6.If7d6a147afd8880940c42d7998e47ed3869e8805@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_031254_262720_A388A576 
X-CRM114-Status: GOOD (  29.54  )
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

Hi Eizan,

Thank you for your patch.

On 9/7/21 4:23, Eizan Miyamoto wrote:
> Up until this change, many errors were logged but ignored when powering
> on clocks and calling pm_runtime_get/put() inside mtk_mdp_core. This
> change tries to do a better job at propagating errors back to the power
> management framework.
> 

Yeah, that's nice. I commented that i dislike the error handling and seems that
you're fixing part of it here. It was a bit difficult to review the patches
because this back and forth, some problems introduced by previous patches where
fixed later. If possible I'd reorganize a bit the patches, even squash some of
the pm changes. Basically move this patch before, and do it together with the
other pm patches (even try to squash if possible).


> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 62 ++++++++++++++++---
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 57 +++++++++++++----
>  3 files changed, 99 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 8a9267d0da1e..87e3f72ff02b 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -53,9 +53,9 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
>  
> -void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
> +int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
>  {
> -	int err;
> +	int status, err;
>  
>  	if (comp->larb_dev) {
>  		err = mtk_smi_larb_get(comp->larb_dev);
> @@ -65,34 +65,76 @@ void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
>  	}
>  
>  	err = pm_runtime_get_sync(comp->dev);
> -	if (err < 0)
> +	if (err < 0) {
>  		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
> +		return err;
> +	}
> +
> +	err = mtk_mdp_comp_clock_on(comp);
> +	if (err) {
> +		dev_err(comp->dev, "failed to turn on clock. err=%d", err);
> +		status = err;
> +		goto err_mtk_mdp_comp_clock_on;
> +	}
> +
> +	return err;
> +
> +err_mtk_mdp_comp_clock_on:
> +	err = pm_runtime_put_sync(comp->dev);
> +	if (err)
> +		dev_err(comp->dev, "failed to runtime put in cleanup. err=%d", err);
>  
> -	mtk_mdp_comp_clock_on(comp);
> +	return status;
>  }
>  
> -void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
> +int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
>  {
> -	int err;
> +	int status, err;
>  
>  	mtk_mdp_comp_clock_off(comp);
>  
>  	err = pm_runtime_put_sync(comp->dev);
> -	if (err < 0)
> +	if (err < 0) {
>  		dev_err(comp->dev, "failed to runtime put, err %d.\n", err);
> +		status = err;
> +		goto err_pm_runtime_put_sync;
> +	}
> +
> +	return 0;
> +
> +err_pm_runtime_put_sync:
> +	err = mtk_mdp_comp_clock_on(comp);
> +	if (err)
> +		dev_err(comp->dev, "failed to turn on clock in cleanup. err=%d", err);
> +
> +	return status;
>  }
>  
> -void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
> +int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
>  {
> -	int i, err;
> +	int i, err, status;
>  
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		if (IS_ERR(comp->clk[i]))
>  			continue;
>  		err = clk_prepare_enable(comp->clk[i]);
> -		if (err)
> +		if (err) {
> +			status = err;
>  			dev_err(comp->dev, "failed to enable clock, err %d. i:%d\n", err, i);
> +			goto err_clk_prepare_enable;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_clk_prepare_enable:
> +	for (--i; i >= 0; i--) {
> +		if (IS_ERR(comp->clk[i]))
> +			continue;
> +		clk_disable_unprepare(comp->clk[i]);
>  	}
> +
> +	return status;
>  }
>  
>  void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 15ef9539a5a7..5201c47f7baa 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -23,10 +23,10 @@ struct mtk_mdp_comp {
>  
>  int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
>  
> -void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
> -void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
> +int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
> +int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
>  
> -void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
> +int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
>  void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
>  
>  extern struct platform_driver mtk_mdp_component_driver;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 74ef37eb50bd..b45d588d2659 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -50,8 +50,9 @@ static const struct of_device_id mtk_mdp_of_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>  
> -static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> +static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  {
> +	int err, status;
>  	struct mtk_mdp_comp *comp_node;
>  
>  	/*
> @@ -59,18 +60,41 @@ static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  	 * on it through mtk_mdp_m2m_start_streaming, making it unnecessary to
>  	 * have mtk_mdp_comp_power_on called on it.
>  	 */
> -	mtk_mdp_comp_clock_on(&mdp->comp_self);
> +	err = mtk_mdp_comp_clock_on(&mdp->comp_self);
> +	if (err)
> +		return err;
> +
> +	list_for_each_entry(comp_node, &mdp->comp_list, node) {
> +		err = mtk_mdp_comp_power_on(comp_node);
> +		if (err) {
> +			status = err;
> +			goto err_mtk_mdp_comp_power_on;
> +		}
> +	}
>  
> -	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_power_on(comp_node);
> +	return 0;
> +
> +err_mtk_mdp_comp_power_on:
> +	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node) {
> +		err = mtk_mdp_comp_power_off(comp_node);
> +		if (err)
> +			dev_err(&mdp->pdev->dev, "failed to power off after error. err=%d", err);
> +	}
> +	return status;
>  }
>  
> -static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
> +static int mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  {
> +	int status, err;
>  	struct mtk_mdp_comp *comp_node;
>  
> -	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_power_off(comp_node);
> +	list_for_each_entry(comp_node, &mdp->comp_list, node) {
> +		err = mtk_mdp_comp_power_off(comp_node);
> +		if (err) {
> +			status = err;
> +			goto err_mtk_mdp_comp_power_off;
> +		}
> +	}
>  
>  	/*
>  	 * The master / rdma0 component will have pm_runtime_put called
> @@ -78,6 +102,17 @@ static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  	 * have mtk_mdp_comp_power_off called on it.
>  	 */
>  	mtk_mdp_comp_clock_off(&mdp->comp_self);
> +
> +	return 0;
> +
> +err_mtk_mdp_comp_power_off:
> +	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node) {
> +		err = mtk_mdp_comp_power_on(comp_node);
> +		if (err)
> +			dev_err(&mdp->pdev->dev, "failed to power on after error. err=%d", err);
> +	}
> +
> +	return status;
>  }
>  
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> @@ -318,18 +353,14 @@ static int __maybe_unused mtk_mdp_pm_suspend(struct device *dev)
>  {
>  	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
>  
> -	mtk_mdp_clock_off(mdp);
> -
> -	return 0;
> +	return mtk_mdp_clock_off(mdp);
>  }
>  
>  static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
>  {
>  	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
>  
> -	mtk_mdp_clock_on(mdp);
> -
> -	return 0;
> +	return mtk_mdp_clock_on(mdp);
>  }
>  
>  static int __maybe_unused mtk_mdp_suspend(struct device *dev)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
