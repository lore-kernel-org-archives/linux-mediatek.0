Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699A6C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 05:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23AAC613D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 05:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23AAC613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iLtd4dJA5k4AmqTRamKxT6BBjttVpyujHwviSA+wv4=; b=3V+jyJY+deldCQLlG7jACmn918
	atMvovYwTrSyTRT0OB2nvgS4J4Al8XevjH379H5sF3WgY1DajXxQqseHaJ9GrmL2ux/fZ3YSZ5+n9
	NFUY8lnvYtqFG4rw39n03SLKQmMq6lcW+KVNCV9SiN77pmSfJ72zhtYwBAb3Md5M05d3iE7oyXJXH
	jxQdKG5JwdzEx0boSNz/Y94kWwH1j+2h+Gie0oqTWv0dcuc0bLxi7+aqsIy7B3K239ZTC4cIc83oY
	hXqqU3UWmul+axmJm7Wj1zETLH3n25prlrNkaZwJeH5ieLaJplKdD5IL4dXmAf3/DikR+bseYRdK2
	ia2Dqjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llmIs-00BGTI-BK; Wed, 26 May 2021 05:42:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llmIe-00BGNi-7a; Wed, 26 May 2021 05:41:50 +0000
Received: from [IPv6:2a00:a040:193:3500:f557:1b29:6904:4855] (unknown
 [IPv6:2a00:a040:193:3500:f557:1b29:6904:4855])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CA57E1F427EB;
 Wed, 26 May 2021 06:41:36 +0100 (BST)
Subject: Re: [PATCH v5 11/16] drm/mediatek: Get rid of mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 eizan@chromium.org, acourbot@chromium.org, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-12-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6f3bfbeb-e7d4-249e-b4f0-da1825fec461@collabora.com>
Date: Wed, 26 May 2021 08:41:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210410091128.31823-12-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_224148_578785_28911171 
X-CRM114-Status: GOOD (  27.63  )
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

Hi

On 10.04.21 12:11, Yong Wu wrote:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the drm device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: CK Hu <ck.hu@mediatek.com>
> CC: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  9 ------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 35 ---------------------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  5 +--
>   4 files changed, 1 insertion(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 971ef58ac1dc..d59353af4019 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -10,7 +10,6 @@
>   #include <linux/soc/mediatek/mtk-mutex.h>
>   
>   #include <asm/barrier.h>
> -#include <soc/mediatek/smi.h>
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> @@ -544,12 +543,6 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>   
>   	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
>   
> -	ret = mtk_smi_larb_get(comp->larb_dev);
> -	if (ret) {
> -		DRM_ERROR("Failed to get larb: %d\n", ret);
> -		return;
> -	}
> -
>   	ret = pm_runtime_resume_and_get(comp->dev);
>   	if (ret < 0)
>   		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n",
> @@ -557,7 +550,6 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>   
>   	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
>   	if (ret) {
> -		mtk_smi_larb_put(comp->larb_dev);
>   		pm_runtime_put(comp->dev);
>   		return;
>   	}
> @@ -594,7 +586,6 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>   
>   	drm_crtc_vblank_off(crtc);
>   	mtk_crtc_ddp_hw_fini(mtk_crtc);
> -	mtk_smi_larb_put(comp->larb_dev);
>   	ret = pm_runtime_put(comp->dev);
>   	if (ret < 0)
>   		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n",
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e17fc4..6c01492ba4df 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -449,37 +449,12 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>   	return ret;
>   }
>   
> -static int mtk_ddp_get_larb_dev(struct device_node *node, struct mtk_ddp_comp *comp,
> -				struct device *dev)
> -{
> -	struct device_node *larb_node;
> -	struct platform_device *larb_pdev;
> -
> -	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> -	if (!larb_node) {
> -		dev_err(dev, "Missing mediadek,larb phandle in %pOF node\n", node);
> -		return -EINVAL;
> -	}
> -
> -	larb_pdev = of_find_device_by_node(larb_node);
> -	if (!larb_pdev) {
> -		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
> -		of_node_put(larb_node);
> -		return -EPROBE_DEFER;
> -	}
> -	of_node_put(larb_node);
> -	comp->larb_dev = &larb_pdev->dev;
> -
> -	return 0;
> -}
> -
>   int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
>   		      enum mtk_ddp_comp_id comp_id)
>   {
>   	struct platform_device *comp_pdev;
>   	enum mtk_ddp_comp_type type;
>   	struct mtk_ddp_comp_dev *priv;
> -	int ret;
Hi,

This 'ret' is also used inside `if IS_REACHABLE(CONFIG_MTK_CMDQ)`
so it  should not be removed.

Thanks,
Dafna

>   
>   	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
>   		return -EINVAL;
> @@ -495,16 +470,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
>   	}
>   	comp->dev = &comp_pdev->dev;
>   
> -	/* Only DMA capable components need the LARB property */
> -	if (type == MTK_DISP_OVL ||
> -	    type == MTK_DISP_OVL_2L ||
> -	    type == MTK_DISP_RDMA ||
> -	    type == MTK_DISP_WDMA) {
> -		ret = mtk_ddp_get_larb_dev(node, comp, comp->dev);
> -		if (ret)
> -			return ret;
> -	}
> -
>   	if (type == MTK_DISP_BLS ||
>   	    type == MTK_DISP_CCORR ||
>   	    type == MTK_DISP_COLOR ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5..1b582262b682 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -70,7 +70,6 @@ struct mtk_ddp_comp_funcs {
>   struct mtk_ddp_comp {
>   	struct device *dev;
>   	int irq;
> -	struct device *larb_dev;
>   	enum mtk_ddp_comp_id id;
>   	const struct mtk_ddp_comp_funcs *funcs;
>   };
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b013d56d2777..622de47239eb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -576,11 +576,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
>   	pm_runtime_disable(dev);
>   err_node:
>   	of_node_put(private->mutex_node);
> -	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++) {
> +	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
>   		of_node_put(private->comp_node[i]);
> -		if (private->ddp_comp[i].larb_dev)
> -			put_device(private->ddp_comp[i].larb_dev);
> -	}
>   	return ret;
>   }
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
