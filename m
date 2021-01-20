Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC57C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 18:33:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BF5233FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 18:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95BF5233FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bd5tI1IghaAoRZpOD8RU2gngZ80twyln1F8NNFhuKbE=; b=ikkYP/w6OjyLAnwUBP7LtxbmR
	sXW30C4iGxqm9/lcF/XEDOsKrPWhUZt0i9f9txYheba1yxAYZmglJqvkZg/DTfISm7szGQKxWcx9M
	qi9ZrZSK8ALg8ebfpuj12gzc4JVHMN6RG6Zt9TTr7TtIDlIBmxN70sAqHgfQaMZ2V7BFvV00/PwSc
	xT1n9/QzIGJak4v2C64RyuqoVNk4u3YIDK5e7uflWyI5P9Rh1P8Pk/sZZbZET/9YwEW+9PGKRo2Zv
	07+7vuIyHy8mJoIKF0TbQ2KRH4ZIhnY1iNYBQZfZ0GRKxxzuXAs12VSHANlpxBxHSYap/O4oD50g2
	Ud6jO71SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2II0-00025o-75; Wed, 20 Jan 2021 18:33:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2IHw-000253-NG; Wed, 20 Jan 2021 18:33:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 748E1233ED;
 Wed, 20 Jan 2021 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611167583;
 bh=gS5YCcmo42SQE5E2c/zKvc5ZsGlT6rIPmyPqhGBK0GE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZiQj3doEVDhjfKTGbmTOw+RLHT109BtBRb762soUVj2EoVQmEn0B/YTdnkEoyDim4
 j2jWI2JFuTsgBvXDKswlL8p+9YfsQvKhIgLHhf1nZnELh7x4WVgXzDtnCkG4Eq8kjV
 zAdc0jiLeJRnDoPFRX7DSF3gpKF31Zhm3IZ1YmBvreOhIZHBV/lMqECcN8PNh/+Q1w
 p+KYJxgD7aLod0exFQWFQSmQgDhEc8NcQnO39uawNK55dxp0+Nd+g8kAGNxLBSTqTK
 z79lKNdo8ggz8ymWVCwG9YX0dGNDE4wfmNMptV3CJaQP+WZg+1hlkgdiVah2sxLWDE
 a9gtoWPx2Z+Ig==
Date: Wed, 20 Jan 2021 19:32:58 +0100
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 5/5] soc / drm: mediatek: Move mtk mutex driver to soc
 folder
Message-ID: <YAh3WrRDwtGJIHok@ziggy.stardust>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
 <20210106231729.17173-6-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106231729.17173-6-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_133304_918745_9279842A 
X-CRM114-Status: GOOD (  23.54  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 07, 2021 at 07:17:29AM +0800, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> mtk mutex is used by DRM and MDP driver, and its function is SoC-specific,
> so move it to soc folder.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Please take the patch through your tree. Thanks!

> ---
>  drivers/gpu/drm/mediatek/Makefile                 |  3 +--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c           |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c            |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h            |  1 -
>  drivers/soc/mediatek/Makefile                     |  1 +
>  .../mtk_mutex.c => soc/mediatek/mtk-mutex.c}      | 15 +++++++++++++--
>  .../linux/soc/mediatek/mtk-mutex.h                |  0
>  7 files changed, 16 insertions(+), 7 deletions(-)
>  rename drivers/{gpu/drm/mediatek/mtk_mutex.c => soc/mediatek/mtk-mutex.c} (96%)
>  rename drivers/gpu/drm/mediatek/mtk_mutex.h => include/linux/soc/mediatek/mtk-mutex.h (100%)
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 09979c4c340a..01d06332f767 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -9,8 +9,7 @@ mediatek-drm-y := mtk_disp_color.o \
>  		  mtk_drm_gem.o \
>  		  mtk_drm_plane.o \
>  		  mtk_dsi.o \
> -		  mtk_dpi.o \
> -		  mtk_mutex.o
> +		  mtk_dpi.o
>  
>  obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 1e3a9450680b..e9b6788d52cd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -7,6 +7,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-mutex.h>
>  
>  #include <asm/barrier.h>
>  #include <soc/mediatek/smi.h>
> @@ -22,7 +23,6 @@
>  #include "mtk_drm_ddp_comp.h"
>  #include "mtk_drm_gem.h"
>  #include "mtk_drm_plane.h"
> -#include "mtk_mutex.h"
>  
>  /*
>   * struct mtk_drm_crtc - MediaTek specific crtc structure.
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b99a06e6834e..5d39dd54255d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -588,7 +588,6 @@ static struct platform_driver mtk_drm_platform_driver = {
>  };
>  
>  static struct platform_driver * const mtk_drm_drivers[] = {
> -	&mtk_mutex_driver,
>  	&mtk_disp_color_driver,
>  	&mtk_disp_ovl_driver,
>  	&mtk_disp_rdma_driver,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index ae366868d01a..e8238fa4aa2a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -46,7 +46,6 @@ struct mtk_drm_private {
>  	struct drm_atomic_state *suspend_state;
>  };
>  
> -extern struct platform_driver mtk_mutex_driver;
>  extern struct platform_driver mtk_disp_color_driver;
>  extern struct platform_driver mtk_disp_ovl_driver;
>  extern struct platform_driver mtk_disp_rdma_driver;
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index b6908db534c2..90270f8114ed 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>  obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
>  obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> +obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> similarity index 96%
> rename from drivers/gpu/drm/mediatek/mtk_mutex.c
> rename to drivers/soc/mediatek/mtk-mutex.c
> index 66344759e622..f531b119da7a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -10,8 +10,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
> -
> -#include "mtk_mutex.h"
> +#include <linux/soc/mediatek/mtk-mutex.h>
>  
>  #define MT2701_MUTEX0_MOD0			0x2c
>  #define MT2701_MUTEX0_SOF0			0x30
> @@ -241,6 +240,7 @@ struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  
>  	return ERR_PTR(-EBUSY);
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_get);
>  
>  void mtk_mutex_put(struct mtk_mutex *mutex)
>  {
> @@ -251,6 +251,7 @@ void mtk_mutex_put(struct mtk_mutex *mutex)
>  
>  	mutex->claimed = false;
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_put);
>  
>  int mtk_mutex_prepare(struct mtk_mutex *mutex)
>  {
> @@ -258,6 +259,7 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex)
>  						 mutex[mutex->id]);
>  	return clk_prepare_enable(mtx->clk);
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_prepare);
>  
>  void mtk_mutex_unprepare(struct mtk_mutex *mutex)
>  {
> @@ -265,6 +267,7 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
>  						 mutex[mutex->id]);
>  	clk_disable_unprepare(mtx->clk);
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
>  
>  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  			enum mtk_ddp_comp_id id)
> @@ -316,6 +319,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>  		       mtx->regs +
>  		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
>  
>  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>  			   enum mtk_ddp_comp_id id)
> @@ -355,6 +359,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>  		break;
>  	}
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
>  
>  void mtk_mutex_enable(struct mtk_mutex *mutex)
>  {
> @@ -365,6 +370,7 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
>  
>  	writel(1, mtx->regs + DISP_REG_MUTEX_EN(mutex->id));
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_enable);
>  
>  void mtk_mutex_disable(struct mtk_mutex *mutex)
>  {
> @@ -375,6 +381,7 @@ void mtk_mutex_disable(struct mtk_mutex *mutex)
>  
>  	writel(0, mtx->regs + DISP_REG_MUTEX_EN(mutex->id));
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_disable);
>  
>  void mtk_mutex_acquire(struct mtk_mutex *mutex)
>  {
> @@ -388,6 +395,7 @@ void mtk_mutex_acquire(struct mtk_mutex *mutex)
>  				      tmp, tmp & INT_MUTEX, 1, 10000))
>  		pr_err("could not acquire mutex %d\n", mutex->id);
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_acquire);
>  
>  void mtk_mutex_release(struct mtk_mutex *mutex)
>  {
> @@ -396,6 +404,7 @@ void mtk_mutex_release(struct mtk_mutex *mutex)
>  
>  	writel(0, mtx->regs + DISP_REG_MUTEX(mutex->id));
>  }
> +EXPORT_SYMBOL_GPL(mtk_mutex_release);
>  
>  static int mtk_mutex_probe(struct platform_device *pdev)
>  {
> @@ -461,3 +470,5 @@ struct platform_driver mtk_mutex_driver = {
>  		.of_match_table = mutex_driver_dt_match,
>  	},
>  };
> +
> +builtin_platform_driver(mtk_mutex_driver);
> diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
> similarity index 100%
> rename from drivers/gpu/drm/mediatek/mtk_mutex.h
> rename to include/linux/soc/mediatek/mtk-mutex.h
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
