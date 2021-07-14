Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC87AC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:29:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DFA60551
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DFA60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zu6LBU6ubglknYZ3D+HSBnCcp5AijAhycr5SlngOZu4=; b=yJ/qwIe8A6D2zSKQqnDaxy+duY
	aWwfCingz193E7umqhQLjYdjOh9x0V8dCSxogAuErDSW3vR+TIeGo+4CY9B2cxnYzVtYUKlhdQpYD
	ZU+Zo2WuuVzcA8kmvInXSbBlSC1tmw67JPRVhpb3Vsuf6ryfRsWvKV5/MpjetQUMf/6z8XjULMfTU
	RgvfuwDpgSLsNIfGt+jIZv3Ks+U9uTlRu91gPDPRnJ4zM5Xo3sGDjxBU/OdSXL4UiHayPAeJvC++Y
	x/iL8TnFlbN6rxpU31EhsN5BG1gB6CyAK7VnAD/JGbZhQ4WnudNy5lNIpsAsVFbuTsPWYnjeZ1sfH
	ycgtpXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3aGs-00Ceqn-Th; Wed, 14 Jul 2021 08:29:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3aGY-00Ceeo-Ih; Wed, 14 Jul 2021 08:29:16 +0000
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown
 [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3997C1F42822;
 Wed, 14 Jul 2021 09:29:12 +0100 (BST)
Subject: Re: [PATCH v6 05/11] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com, acourbot@chromium.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-6-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <f8d2ecfa-d0e0-87ed-429a-cb2dfd4e0745@collabora.com>
Date: Wed, 14 Jul 2021 10:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-6-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_012914_938479_D9C93366 
X-CRM114-Status: GOOD (  28.63  )
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



On 14.07.21 04:56, Yong Wu wrote:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the mdp device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> CC: Houlong Wei <houlong.wei@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>   drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>   3 files changed, 1 insertion(+), 48 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index de2d425efdd1..5e0ea83a9f7f 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -13,7 +13,6 @@
>   #include <linux/of.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
> -#include <soc/mediatek/smi.h>
>   #include <linux/pm_runtime.h>
>   
>   #include "mtk_mdp_comp.h"
> @@ -57,13 +56,6 @@ int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
>   {
>   	int status, err;
>   
> -	if (comp->larb_dev) {
> -		err = mtk_smi_larb_get(comp->larb_dev);
> -		if (err)
> -			dev_err(comp->dev,
> -				"failed to get larb, err %d.\n", err);
> -	}
> -
>   	err = pm_runtime_get_sync(comp->dev);
>   	if (err < 0) {
>   		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
> @@ -146,9 +138,6 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>   			continue;
>   		clk_disable_unprepare(comp->clk[i]);
>   	}
> -
> -	if (comp->larb_dev)
> -		mtk_smi_larb_put(comp->larb_dev);
>   }
>   
>   /*
> @@ -236,9 +225,6 @@ static const struct component_ops mtk_mdp_component_ops = {
>   
>   int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>   {
> -	struct device_node *larb_node;
> -	struct platform_device *larb_pdev;
> -	int ret;
>   	int i;
>   	struct device_node *node = dev->of_node;
>   	enum mtk_mdp_comp_type comp_type =
> @@ -252,8 +238,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>   		if (IS_ERR(comp->clk[i])) {
>   			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
>   				dev_err(dev, "Failed to get clock\n");
> -			ret = PTR_ERR(comp->clk[i]);
> -			goto err;
> +			return PTR_ERR(comp->clk[i]);
>   		}
>   
>   		/* Only RDMA needs two clocks */
> @@ -261,36 +246,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>   			break;
>   	}
>   
> -	/* Only DMA capable components need the LARB property */
> -	comp->larb_dev = NULL;
> -	if (comp_type != MTK_MDP_RDMA &&
> -	    comp_type != MTK_MDP_WDMA &&
> -	    comp_type != MTK_MDP_WROT)
> -		return 0;
> -
> -	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> -	if (!larb_node) {
> -		dev_err(dev,
> -			"Missing mediadek,larb phandle in %pOF node\n", node);
> -		ret = -EINVAL;
> -		goto err;
> -	}
> -
> -	larb_pdev = of_find_device_by_node(larb_node);
> -	if (!larb_pdev) {
> -		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
> -		of_node_put(larb_node);
> -		ret = -EPROBE_DEFER;
> -		goto err;
> -	}
> -	of_node_put(larb_node);
> -
> -	comp->larb_dev = &larb_pdev->dev;
> -
>   	return 0;
> -
> -err:
> -	return ret;
>   }
>   
>   static int mtk_mdp_comp_probe(struct platform_device *pdev)
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 5201c47f7baa..2bd229cc7eae 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -11,13 +11,11 @@
>    * struct mtk_mdp_comp - the MDP's function component data
>    * @node:	list node to track sibing MDP components
>    * @clk:	clocks required for component
> - * @larb_dev:	SMI device required for component
>    * @dev:	component's device
>    */
>   struct mtk_mdp_comp {
>   	struct list_head	node;
>   	struct clk		*clk[2];
> -	struct device           *larb_dev;
>   	struct device		*dev;
>   };
>   
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index e1fb39231248..be7d35b3e3ff 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -18,7 +18,6 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/workqueue.h>
> -#include <soc/mediatek/smi.h>
>   
>   #include "mtk_mdp_comp.h"
>   #include "mtk_mdp_core.h"
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
