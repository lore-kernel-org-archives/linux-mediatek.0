Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6070CC32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Csetf8GBWdhympWgZuh0qHKgZLf7dGnALVLDtNUHvHc=; b=md8LZ0vHX0o6clsIsbrexCmhDg
	D4ekPvusm5RGTYa+N3KbvYXyQWfZXCwKwaQK/cOwdlZP7sfO0ZOBRCbWJ7Io7TZgvVPKfXM/Irm4x
	ARiYeEi8QUhKNUsZ9qf4fmb1+1XypVOH3uP2ytKQ/ZszD01GXiKvmjPWo395REp9sbKuFjnaPpLGk
	Qmwf1jtKDILRcVj6gAKwOv9clurHyATRdfcPxAJ7vgDYznGFKQHaOn39oXJBsLG7ZfGx2Df57qlFb
	aVJ4IPIDiOIGFtFQ94QcOavwnQxdb6/QhqFhVafVD5onQxR3g8eJLK7N21SFfIOp4gAfh+GTJMqCL
	BDYNq8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP44A-009ypY-D5; Fri, 19 Aug 2022 15:37:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP43y-009yjx-F4; Fri, 19 Aug 2022 15:37:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 369C4615F5;
	Fri, 19 Aug 2022 15:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F96AC433D6;
	Fri, 19 Aug 2022 15:37:28 +0000 (UTC)
Message-ID: <46436973-0de0-f810-5851-6f26bdf460aa@xs4all.nl>
Date: Fri, 19 Aug 2022 17:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v26 4/4] media: platform: mtk-mdp3: add MediaTek MDP3
 driver
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Courbot
 <acourbot@chromium.org>, tfiga@chromium.org, drinkcat@chromium.org,
 pihsun@chromium.org, hsinyi@google.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, cellopoint.kai@gmail.com,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>
References: <20220819085423.17023-1-moudy.ho@mediatek.com>
 <20220819085423.17023-5-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220819085423.17023-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_083734_614623_A0F3432F 
X-CRM114-Status: GOOD (  26.95  )
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

Hi Moudy,

On 19/08/2022 10:54, Moudy Ho wrote:
> This patch adds driver for MediaTek's Media Data Path ver.3 (MDP3).
> It provides the following functions:
>   color transform, format conversion, resize, crop, rotate, flip
>   and additional image quality enhancement.
> 
> The MDP3 driver is mainly used for Google Chromebook products to
> import the new architecture to set the HW settings as shown below:
>   User -> V4L2 framework
>     -> MDP3 driver -> SCP (setting calculations)
>       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> 
> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_" prefix
> GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> Probe, power, suspend/resume, system level functions are defined in
> mtk-mdp3-core.c
> 
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    1 +
>  drivers/media/platform/mediatek/mdp3/Kconfig  |   20 +
>  drivers/media/platform/mediatek/mdp3/Makefile |    6 +
>  .../platform/mediatek/mdp3/mdp_reg_ccorr.h    |   19 +
>  .../platform/mediatek/mdp3/mdp_reg_rdma.h     |   65 ++
>  .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   39 +
>  .../platform/mediatek/mdp3/mdp_reg_wdma.h     |   47 +
>  .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   55 +
>  .../platform/mediatek/mdp3/mtk-img-ipi.h      |  290 +++++
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  466 ++++++++
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   43 +
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 1031 +++++++++++++++++
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  186 +++
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  357 ++++++
>  .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   94 ++
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  724 ++++++++++++
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.h     |   48 +
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  733 ++++++++++++
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |  373 ++++++
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |  313 +++++
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.h     |   78 ++
>  22 files changed, 4989 insertions(+)
>  create mode 100644 drivers/media/platform/mediatek/mdp3/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/mdp3/Makefile
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.h
> 
> diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
> index af47d9888552..84104e2cd024 100644
> --- a/drivers/media/platform/mediatek/Kconfig
> +++ b/drivers/media/platform/mediatek/Kconfig
> @@ -6,3 +6,4 @@ source "drivers/media/platform/mediatek/jpeg/Kconfig"
>  source "drivers/media/platform/mediatek/mdp/Kconfig"
>  source "drivers/media/platform/mediatek/vcodec/Kconfig"
>  source "drivers/media/platform/mediatek/vpu/Kconfig"
> +source "drivers/media/platform/mediatek/mdp3/Kconfig"
> diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
> index d3850a13f128..38e6ba917fe5 100644
> --- a/drivers/media/platform/mediatek/Makefile
> +++ b/drivers/media/platform/mediatek/Makefile
> @@ -3,3 +3,4 @@ obj-y += jpeg/
>  obj-y += mdp/
>  obj-y += vcodec/
>  obj-y += vpu/
> +obj-y += mdp3/
> diff --git a/drivers/media/platform/mediatek/mdp3/Kconfig b/drivers/media/platform/mediatek/mdp3/Kconfig
> new file mode 100644
> index 000000000000..8c8e59687417
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/mdp3/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_MEDIATEK_MDP3
> +	tristate "MediaTek MDP v3 driver"
> +	depends on MTK_IOMMU || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on MTK_MMSYS || COMPILE_TEST

It turned out that this will cause link errors if MTK_MMSYS is not set:

ERROR: modpost: "mtk_mutex_write_sof" [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!
ERROR: modpost: "mtk_mutex_enable_by_cmdq" [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!
ERROR: modpost: "mtk_mutex_put" [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!
ERROR: modpost: "mtk_mutex_write_mod" [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!
ERROR: modpost: "mtk_mutex_unprepare" [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!
ERROR: modpost: "mtk_mutex_get" [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!
ERROR: modpost: "mtk_mutex_prepare" [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!

I wonder if it isn't better to do 'select MTK_MMSYS': that seems to work fine.

What do you think?

Regards,

	Hans

> +	depends on HAS_DMA
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEO_MEDIATEK_VPU
> +	select MTK_CMDQ
> +	select MTK_SCP
> +	default n
> +	help
> +	    It is a v4l2 driver and present in MediaTek MT8183 SoC.
> +	    The driver supports scaling and color space conversion.
> +
> +	    To compile this driver as a module, choose M here: the
> +	    module will be called mtk-mdp3.

