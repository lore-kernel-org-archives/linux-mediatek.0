Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2F8ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy8iSu0Y13eIt5WlUoEfC/oqmnaxcyH3OIM6jOevbW8=; b=MTc8Ud8tzaaeKA6RFoMoKOTeOo
	dcJRjm5pMBU5wBD4E4CD3rJ1edt9N+GjeCJHvNqQoN8MCAutsRdih69KRIKum01ruqHyGdOY9JU7O
	YVvgW+6jXtp4zZG502FYsyQZwjhBFEx7Juv+3Azs3Cr+V3TTA4AXn1jWj2yFK9DTBk/mmGq+L4+97
	OrdYNhYRfin5150mgba9qbPLP3oVdEAbvNdybu4JXmNhwBj9iNAYvu3SFtSJhJdG7hnfJxgKQR1Wt
	m+ikME+sGKYprdCQW/+hI2VAVVV5RB/Bb1baiLZ0IbrFPpi24UyKn4XQKgRqg100hnKqvdYaZZbye
	hXh6Tztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbSp-006zUS-Ca; Mon, 29 Aug 2022 09:53:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbS3-006yrw-QO; Mon, 29 Aug 2022 09:53:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96ED166016BE;
	Mon, 29 Aug 2022 10:53:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661766782;
	bh=tyHVP8TVsJx7dsp4RoCLCe9+RAOLMn7P+Kx5RBRj4vk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LGbv0gfi1N/Vte34r6F56RHV1wAfbo207qYXVmTbX0COv5wDShGObyvRyS94XCdqE
	 PjGPoUn/p0qNc+yorYkQm/3xgtr7RIhqpRVnQ+jZz3kwh6lOju6z4JcXqPVj5sKHsb
	 DYXoqtrTnge7+/082g90s3IqH24Q8aAkXlu38qo/2FnlY1+b2t3L7KcnK6Bqr5nSwJ
	 QZTTmT5u79TdvTzgg46MbUalFaSv3pP06uM0nueQcSCaMzrBQKzoX4PfjTHn/P5eI5
	 nh7tNeBRkO28ab7+G/26wFFze5w3UBIDsCnvFsopmmUyGKGOqqQrAenijG9VBxX3Kn
	 tPghf7FU/eSYw==
Message-ID: <8ccf007b-e411-3a56-e5aa-629264cdafee@collabora.com>
Date: Mon, 29 Aug 2022 11:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com, jason-jh.lin@mediatek.com,
 yongqiang.niu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1661743308-29120-1-git-send-email-xinlei.lee@mediatek.com>
 <1661743308-29120-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1661743308-29120-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_025304_061463_D21C530A 
X-CRM114-Status: GOOD (  15.67  )
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

Il 29/08/22 05:21, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c      | 32 +++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  5 ++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
>   3 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index fb0b79704636..c23ef7deef26 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -14,6 +14,7 @@
>   #include <linux/of_graph.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/types.h>
>   
>   #include <video/videomode.h>
> @@ -28,6 +29,7 @@
>   #include "mtk_disp_drv.h"
>   #include "mtk_dpi_regs.h"
>   #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
>   
>   enum mtk_dpi_out_bit_num {
>   	MTK_DPI_OUT_BIT_NUM_8BITS,
> @@ -80,6 +82,7 @@ struct mtk_dpi {
>   	struct pinctrl_state *pins_dpi;
>   	u32 output_fmt;
>   	int refcount;
> +	struct device *mmsys_dev;
>   };
>   
>   static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
> @@ -133,6 +136,8 @@ struct mtk_dpi_yc_limit {
>    * @yuv422_en_bit: Enable bit of yuv422.
>    * @csc_enable_bit: Enable bit of CSC.
>    * @pixels_per_iter: Quantity of transferred pixels per iteration.
> + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be
> + *		       set in MMSYS.

  * @edge_cfg_in_mmsys: Edge configuration for DPI output has to be set in MMSYS.

fits in one line and it's more immediate to read.

After which...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


