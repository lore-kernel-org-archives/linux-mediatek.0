Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8DCC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdLVr07CCRQjYmjn9qlC5iuJyvLZltrQKV9HJpLHusY=; b=Ad2UrpBa4Ublcn/X/84QwznuYi
	ZV4nO99+ZVyES1XhdCE+sUxp7DlYGP7UWXyWUJqhvakOmAA5vKtZwCWKsGuLo60LYzuj8FL0DjOLM
	+MWcciwpm4ZJJuLtAbQo7O/0w9zjjSvH1NudXFWTkTlQldM2fd5aXhZBUE8TxlyWZinDl3x0G8fKF
	AZegN9BamD8XAns2TKdSJK6QiwVqV//dGW03gCLKjxnhIo/FUAeM/gRs+o0wM/IhfAvDOnj4PRaxg
	lD3qdOLWxoNSU0CdngnthdJm2kMJV3CNHrk0XkF5WTfGBDyZ7OBIdeVtYW9kKndBkJ5zFzJdqA043
	gxFU8/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeva-009Jkk-Tw; Tue, 04 Oct 2022 10:13:30 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofevQ-009Jgz-Ek; Tue, 04 Oct 2022 10:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664878400; x=1696414400;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=unSBrfZWWQiaWR5VmWYGXL4IstFzYLo18uQjnoBzJyQ=;
  b=E5vH6S0dto6gmAZ3x1yLA+FT/iMv9zhGCnsS5tP6A2NDyKH2jBxl/yIB
   c4U1XQVBeViI3NP2GKusjaoWXAAfuE3FjN2NCVFxWVq54Tj5xqWRmJhOf
   ybVupr4O2yykmos9lrVJc2DGflcfUv6QSKqeWeiEew4boOyM+v3936/Zh
   i9ZsAk+gtbrYPz5XEbr+hujnmoAllvNXyz4pmTQo5Ky3Zz7EbqZVFbuNG
   87a2xdKI2Mh7WhMBSjse8XQ1kaayTh7AoC91UaSdAMK57kEVK2ZfXeD2R
   fU2zXnRcTzkH3sxvvAiAZ6sjo0w333EaFbocHofxa4uxcAtSpahXBGLHJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="282586489"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="282586489"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 03:13:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="619053782"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="619053782"
Received: from kmreisi-mobl.ger.corp.intel.com ([10.252.39.196])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 03:13:13 -0700
Date: Tue, 4 Oct 2022 13:13:10 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Irui Wang <irui.wang@mediatek.com>
cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, 
    Rob Herring <robh+dt@kernel.org>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Tzung-Bi Shih <tzungbi@chromium.org>, 
    angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com, 
    Tiffany Lin <tiffany.lin@mediatek.com>, 
    Yunfei Dong <yunfei.dong@mediatek.com>, 
    Maoguang Meng <maoguang.meng@mediatek.com>, 
    Longfei Wang <longfei.wang@mediatek.com>, 
    Project_Global_Chrome_Upstream_Group@mediatek.com, 
    linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
    linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6, 5/8] media: mediatek: vcodec: Add venc power on/off
 function
In-Reply-To: <20221001031737.18266-6-irui.wang@mediatek.com>
Message-ID: <8a19febc-8662-b9f7-8250-44c23af06f91@linux.intel.com>
References: <20221001031737.18266-1-irui.wang@mediatek.com> <20221001031737.18266-6-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_031320_562333_13C8775C 
X-CRM114-Status: GOOD (  15.56  )
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

On Sat, 1 Oct 2022, Irui Wang wrote:

> when enable multi-core encoding, all available encoder cores' power need
> to be on/off, add new functions for encoder cores' power management.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---

> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
> index 75de5031d292..213c3f50e9eb 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
> @@ -9,6 +9,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  
> +#include "mtk_vcodec_enc_hw.h"
>  #include "mtk_vcodec_enc_pm.h"
>  #include "mtk_vcodec_util.h"
>  
> @@ -56,6 +57,88 @@ int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_vcodec_init_enc_clk);
>  
> +static int mtk_enc_core_power_on(struct mtk_vcodec_ctx *ctx)
> +{
> +	struct mtk_venc_hw_dev *sub_core;
> +	int ret, i;
> +
> +	/* multi-core encoding need power on all available cores */
> +	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
> +		sub_core = (struct mtk_venc_hw_dev *)ctx->dev->enc_hw_dev[i];
> +		if (!sub_core)
> +			continue;
> +
> +		ret = pm_runtime_resume_and_get(&sub_core->plat_dev->dev);
> +		if (ret) {
> +			mtk_v4l2_err("power on sub_core[%d] fail %d", i, ret);
> +			goto pm_on_fail;
> +		}
> +	}
> +	return ret;
> +
> +pm_on_fail:
> +	for (i -= 1; i >= 0; i--) {

while (i--) {

achieves the same.

> +		sub_core = (struct mtk_venc_hw_dev *)ctx->dev->enc_hw_dev[i];
> +		pm_runtime_put_sync(&sub_core->plat_dev->dev);
> +	}
> +	return ret;
> +}


-- 
 i.


