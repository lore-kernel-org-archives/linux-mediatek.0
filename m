Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D67C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 08:28:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB82A61454
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 08:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB82A61454
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1BlqbzvNPM6J96Z5cm1x3QjhkUH4yZD4oZv6hW0R/Is=; b=U/Mt1TgXYZKX7W7GrljZ2HWxc
	2x1qjrovn0QopwZjZ8oSQSiNPrPoG1sfuiHIOb2b5kSJnpitV8D33uITQwXaO4tl0QMWXRvspUKmP
	vrUgucgnbjU7XeZLBPAgzfCvYYPLY0942W3Nq2BTHud9JbbC/iY34yNAQkltDntF4T4tSBCgCJBVl
	xv7L4OKXQTJ7U6szTLEIZvdeI0IwcCbnYY6618JDFxH6i4vzQE7m7ALgaHnf8I/biHk7OlUCvVsDy
	PRh/JALVjeFuKEKRm3uSMGe+i7nM/6zAc15FAJ/UtYbGmfo1vyyIv2aglsTW3MzUGdFp59T0QcH17
	ysFX7ASEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhTAm-007V1k-SS; Fri, 14 May 2021 08:27:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTAW-007UyY-Eo; Fri, 14 May 2021 08:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=uvc2ilW42m+ZxvdYqfGjANIayvHLgLmEsBfjXu8UWAY=; b=qR0O1SNaOn55xyj9Dh/d6AQvgI
 HrGXi5a+B5vzgqzzShItLKU0vz4ngr5jAoUc6lkeNelgDHNPGVTayIgJRkph0fAjDD7x3QaL7F+L/
 D/cTPSzCMkKQjFHJ3cSzlrk21Gii2AN2Wi4kKrgpj38Z7LY4X/hBV8a54zQMEoEQLxrxMKJ8oIEn9
 J27AHSM+IEqtgdGcw78whSvIKi4/bLuHvWkq7gFM6+t3t+GW94RSR78+WQHFQdUTYuPMGXSSvdQTH
 cwXciAJmrdPbj6brlCElPML6DyauTOHSO2hbYaYPQaB3bJruRSq3i4RZfwV7CPjoqvkNJT0dZuuw3
 QCZHft4w==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTAS-00BogD-LK; Fri, 14 May 2021 08:27:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 73A9E1F430CC
Subject: Re: [PATCH v1 2/4] mtk-mdp: use pm_runtime in MDP component driver
To: Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, yong.wu@mediatek.com,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20210423055842.2490679-1-eizan@chromium.org>
 <20210423155824.v1.2.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <47dcbf45-be84-79ec-896b-a2aa1caba236@collabora.com>
Date: Fri, 14 May 2021 10:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423155824.v1.2.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_012732_994275_BA3746ED 
X-CRM114-Status: GOOD (  32.05  )
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

On 23/4/21 7:58, Eizan Miyamoto wrote:
> Without this change, the MDP components are not fully integrated into
> the runtime power management subsystem, and the MDP driver does not
> work.
> 
> For each of the component device drivers to be able to call
> pm_runtime_get/put_sync() a pointer to the component's device struct
> had to be added to struct mtk_mdp_comp, set by mtk_mdp_comp_init().
> 
> Note that the dev argument to mtk_mdp_comp_clock_on/off() has been
> removed. Those functions used to be called from the "master" mdp driver
> in mtk_mdp_core.c, but the component's device pointer no longer
> corresponds to the mdp master device pointer, which is not the right
> device to pass to pm_runtime_put/get_sync() which we had to add to get
> the driver to work properly.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 19 ++++++++++++++++---
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 ++++--
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++----
>  3 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 3fbbcf05440a..84f9c529d74a 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -13,6 +13,8 @@
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> +#include <soc/mediatek/smi.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "mtk_mdp_comp.h"
>  #include "mtk_mdp_core.h"
> @@ -51,22 +53,28 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
>  
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> +void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
>  {
>  	int i, err;
>  
> +	err = pm_runtime_get_sync(comp->dev);
> +	if (err < 0)
> +		dev_err(comp->dev,
> +			"failed to runtime get, err %d.\n",
> +			err);
> +

Personally, in the subsystem I take care I don't allow printing errors that are
ignored. Shouldn't you propagate the error?

>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		if (IS_ERR(comp->clk[i]))
>  			continue;
>  		err = clk_prepare_enable(comp->clk[i]);
>  		if (err)
> -			dev_err(dev,
> +			dev_err(comp->dev,
>  				"failed to enable clock, err %d. i:%d\n",
>  				err, i);
>  	}
>  }
>  
> -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
> +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  {
>  	int i;
>  
> @@ -75,6 +83,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
>  			continue;
>  		clk_disable_unprepare(comp->clk[i]);
>  	}
> +
> +	pm_runtime_put_sync(comp->dev);
>  }
>  
>  static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> @@ -84,6 +94,7 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  	struct mtk_mdp_dev *mdp = data;
>  
>  	mtk_mdp_register_component(mdp, comp);
> +	pm_runtime_enable(dev);
>  
>  	return 0;
>  }
> @@ -94,6 +105,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
>  	struct mtk_mdp_dev *mdp = data;
>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>  
> +	pm_runtime_disable(dev);
>  	mtk_mdp_unregister_component(mdp, comp);
>  }
>  
> @@ -111,6 +123,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>  		 (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
>  
>  	INIT_LIST_HEAD(&comp->node);
> +	comp->dev = dev;
>  
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		comp->clk[i] = of_clk_get(node, i);
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 956d20c01e34..355e226d74fe 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -11,16 +11,18 @@
>   * struct mtk_mdp_comp - the MDP's function component data
>   * @node:	list node to track sibing MDP components
>   * @clk:	clocks required for component
> + * @dev:	component's device
>   */
>  struct mtk_mdp_comp {
>  	struct list_head	node;
>  	struct clk		*clk[2];
> +	struct device		*dev;
>  };
>  
>  int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
>  
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
> -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
> +void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
> +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
>  
>  extern struct platform_driver mtk_mdp_component_driver;
>  
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index d79bf7f0031a..c55bcfe4cbb7 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -51,20 +51,18 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>  
>  static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  {
> -	struct device *dev = &mdp->pdev->dev;
>  	struct mtk_mdp_comp *comp_node;
>  
>  	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_clock_on(dev, comp_node);
> +		mtk_mdp_comp_clock_on(comp_node);
>  }
>  
>  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  {
> -	struct device *dev = &mdp->pdev->dev;
>  	struct mtk_mdp_comp *comp_node;
>  
>  	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_clock_off(dev, comp_node);
> +		mtk_mdp_comp_clock_off(comp_node);
>  }
>  
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
