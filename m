Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B22C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 06:06:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F292960E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 06:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F292960E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87HZUNNo4K0i12cvyQ+Io4RcNRkuZHyFJcdzlWnFZIo=; b=Ig3IJTJA2w4USOqHgEP4csOwH1
	8eJaf0B0g+6zaGtiF9nvxz4dqLZ9kCAYkvElKeyqHVF6qhdH2Clm43FcBGmkEw+zsAZgHYX4oJCo5
	DPL6EeFTNsb/BGQUwmHJ3FN3B+Y8zzD4gBoBLRW6GKKylZ+BF6t0oFxrFtTm8zxbLz4XZK8lhYgtm
	GZnxuV5bJKhgZoBvIcroUB8c0AaMayc/LJ3DfsnFU4SccAMiQcBsF/h/uBoheQ39f2dsKwbdDahyH
	7dSHHGtAqNMFmkEkRWmAmsG0JtcA0nvLgSTYyD35fbIHEVdTgpTIieeUrmpcB2ttotgYU2S0ir9FQ
	vXVCOWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBWWT-008C8e-6u; Thu, 05 Aug 2021 06:06:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBWWE-008C6u-V1; Thu, 05 Aug 2021 06:06:17 +0000
Received: from [IPv6:2a02:810a:880:f54:e5eb:348e:79df:e71f] (unknown
 [IPv6:2a02:810a:880:f54:e5eb:348e:79df:e71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 532A91F40F00;
 Thu,  5 Aug 2021 07:06:11 +0100 (BST)
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
To: Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, houlong.wei@mediatek.com, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, devicetree@vger.kernel.org,
 chunkuang.hu@kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8fe5ac46-a9db-710e-a6d1-856805ab2773@collabora.com>
Date: Thu, 5 Aug 2021 08:06:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_230615_293480_D3FB5045 
X-CRM114-Status: GOOD (  25.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 02.08.21 14:12, Eizan Miyamoto wrote:
> Up until this change, many errors were logged but ignored when powering
> on clocks inside mtk_mdp_core. This change tries to do a better job at
> propagating errors back to the power management framework.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> (no changes since v1)
> 
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 25 ++++++++++++-----
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 +-
>   drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 27 ++++++++++++++-----
>   3 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index b3426a551bea..76e295c8d9bc 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -13,10 +13,9 @@
>   
>   #include "mtk_mdp_comp.h"
>   
> -
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> +int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>   {
> -	int i, err;
> +	int i, err, status;
>   
>   	if (comp->larb_dev) {
>   		err = mtk_smi_larb_get(comp->larb_dev);
> @@ -30,11 +29,23 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>   		if (IS_ERR(comp->clk[i]))
>   			continue;
>   		err = clk_prepare_enable(comp->clk[i]);
> -		if (err)
> -			dev_err(dev,
> -			"failed to enable clock, err %d. type:%d i:%d\n",
> -				err, comp->type, i);
> +		if (err) {
> +			status = err;
> +			dev_err(dev, "failed to enable clock, err %d. i:%d\n", err, i);
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
>   	}
> +
> +	return status;

There is an API function clk_bulk_prepare_enable to prepare and enable an array of clks
so you can just use it.

>   }
>   
>   void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 7897766c96bb..92ab5249bcad 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -41,7 +41,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>   		      struct mtk_mdp_comp *comp,
>   		      enum mtk_mdp_comp_type comp_type);
>   void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
> +int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
>   void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
>   
>   
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 976aa1f4829b..412bbec0f735 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -52,13 +52,28 @@ static const struct of_device_id mtk_mdp_of_ids[] = {
>   };
>   MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>   
> -static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> +static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>   {
> -	struct device *dev = &mdp->pdev->dev;
>   	struct mtk_mdp_comp *comp_node;
> +	int status;
> +	struct device *dev = &mdp->pdev->dev;
> +	int err;
>   
> -	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_clock_on(dev, comp_node);
> +	list_for_each_entry(comp_node, &mdp->comp_list, node) {
> +		err = mtk_mdp_comp_clock_on(dev, comp_node);
> +		if (err) {
> +			status = err;

You can get rid of the new var 'status' and just return ret in case of error

> +			goto err_mtk_mdp_comp_clock_on;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_mtk_mdp_comp_clock_on:
> +	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node)
> +		mtk_mdp_comp_clock_off(dev, comp_node);
> +
> +	return status;
>   }
>   
>   static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
> @@ -274,9 +289,7 @@ static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
>   {
>   	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
>   
> -	mtk_mdp_clock_on(mdp);
> -
> -	return 0;
> +	return mtk_mdp_clock_on(mdp);
>   }
>   
>   static int __maybe_unused mtk_mdp_suspend(struct device *dev)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
