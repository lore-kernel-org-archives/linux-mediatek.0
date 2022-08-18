Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F29DC32772
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=al5GHWwhCTpOiprZMy9QpziXfUbyTxU9Hp/ahf5SI2E=; b=N6Ppn3fl2NfHEN8JH0wTDqzzi8
	vCNP0HkJ0UKoTn9hUZjnytRFjorZpFNQU5rTxrFHSRpUbhLO4OcyD8Ta1IzhwoeU3U+KVlEBSMqB3
	iKp50dpp/b9EVwQ6uv1wAeFd2EYHjhog7MzNCfC2FPEMdY+e0O4vgndLAHr7nVf4IV9Lb0pYuEc3N
	NeYYJD4v93fd1JoKa8UYj2BjCN1q6bFa5WUavwn6YmY+dQeTdGAdNj1iZ1/Ts+evboSwi3jVBqbUt
	PzNg+pTm6SlgOjJHlrxmlVmLFiXZ9kN7X9j81VvlB01kr25gVsPgOoalTM7w0+me9uk4Xg+6gWkko
	XxPFAxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOdBi-002zn5-Bc; Thu, 18 Aug 2022 10:55:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOdBR-002zDo-FH; Thu, 18 Aug 2022 10:55:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B488A61485;
	Thu, 18 Aug 2022 10:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CC0C433C1;
	Thu, 18 Aug 2022 10:55:17 +0000 (UTC)
Message-ID: <e716f649-dec7-ec71-8054-05f05167a042@xs4all.nl>
Date: Thu, 18 Aug 2022 12:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v25 4/4] media: platform: mtk-mdp3: add MediaTek MDP3
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
References: <20220817095629.29911-1-moudy.ho@mediatek.com>
 <20220817095629.29911-5-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220817095629.29911-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_035529_641463_D4A2A150 
X-CRM114-Status: GOOD (  29.06  )
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

Just two nitpicks:

On 17/08/2022 11:56, Moudy Ho wrote:
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

<snip>

> diff --git a/drivers/media/platform/mediatek/mdp3/Kconfig b/drivers/media/platform/mediatek/mdp3/Kconfig
> new file mode 100644
> index 000000000000..e8c593c1eb69
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/mdp3/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_MEDIATEK_MDP3
> +	tristate "MediaTek MDP v3 driver"
> +	depends on MTK_IOMMU || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on MTK_MMSYS

This needs to be MTK_MMSYS || COMPILE_TEST.

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

<snip>

> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> new file mode 100644
> index 000000000000..0c1675c6dce2
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> @@ -0,0 +1,724 @@

<snip>

> +static int mdp_m2m_s_selection(struct file *file, void *fh,
> +			       struct v4l2_selection *s)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +	struct mdp_frame *frame = ctx_get_frame(ctx, s->type);
> +	struct mdp_frame *capture;
> +	struct v4l2_rect r;
> +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> +	bool valid = false;
> +	int ret;
> +
> +	if (s->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		valid = (s->target == V4L2_SEL_TGT_CROP);
> +	else if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		valid = (s->target == V4L2_SEL_TGT_COMPOSE);
> +
> +	if (!valid) {
> +		dev_err(dev, "[%s:%d] invalid type:%u target:%u", __func__,
> +			ctx->id, s->type, s->target);

This needs to be dev_dbg: you don't want to spam the kernel log for
userspace errors.

> +		return -EINVAL;
> +	}
> +
> +	ret = mdp_try_crop(ctx, &r, s, frame);
> +	if (ret)
> +		return ret;
> +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +	if (mdp_target_is_crop(s->target))
> +		capture->crop.c = r;
> +	else
> +		capture->compose = r;
> +
> +	s->r = r;
> +
> +	return 0;
> +}

I can modify these two changes myself if you are OK with that. Just let me know.

If you prefer to post a v26 that's OK too.

Regards,

	Hans

