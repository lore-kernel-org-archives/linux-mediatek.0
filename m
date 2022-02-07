Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42953C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FidbtT16rPB8hgyWnfKUf/hNmuRQpbhQc3xmkyC3Fg=; b=RFbKSWcLYEoMKd
	BqdED1PUXjpyl5wxYnKtbMwEtNsiWiVCzKq8noCqqvsjXxlKLy4RrzZmkSeOz/bAoG2BE0I7jqyN9
	a501lDQIqv6A6kxxVYY8ERrmDSyLTGtVQf+MfxeXyBF+o74ToOaKD9T5ePTS1fR6jmgR6sYXh/8x5
	ONd68RWfpqElA30FRjiNH7FgEITentm/JVboJleqpi/LhCpqLN2zlml1nAuB5RdRXJZ1zvfwow7Sn
	CE09+FtJQClIPyK1clh8U8pzY4HCmSPpqU0TKG1xRvZTzPagKhIraiOazqWAq/J0SzGNHnd66370K
	QXMyoHUC/4HuGSzY4uGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH5O3-00AYNJ-VD; Mon, 07 Feb 2022 14:53:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH5Lk-00AXre-7f; Mon, 07 Feb 2022 14:50:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 398861F444B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644245439;
 bh=Ju2Q5YwjY/LdNga4EoB41t6xw3DyFhmTZT8pPKyD1xI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oaFTUYvRYY60eNHWhaNtRSsVies+YMnhzdtJ+Bbe5HKv/sU+giIdxU7YGk5i6vX9C
 JFxLcTAtzSPpheVOyDCYr6OoyKAqDEq9EFgOyvsbd20C0LtSwrBFT6fzFKlEJtbmk0
 0CsH33VM8IVpNuNcLk+hDjxj/o47W0VGlYzyThdkzJsjHiCJLj16R43gfo1luP1rW4
 Am8CvuA2Yp3Bh0MgOqxTJc9OOgXzgtZyNLZETmTq1ZfOhP2r3saOYg6yhIAmtfFmTy
 v1thQMWM5I2nSfeq0YyPlz0m0Dhd0jFizEWGwe/iMLrxc4/tH1dh35MguKPph+JVOp
 Kx+ZQl1rF+4RQ==
Message-ID: <d91f056c-227f-7a01-9e9c-9b4d53ec04f4@collabora.com>
Date: Mon, 7 Feb 2022 15:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V6, 3/5] media: mtk-jpegenc: add jpegenc timeout func
 interface
Content-Language: en-US
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
 irui.wang@mediatek.com
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-4-git-send-email-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1638501230-13417-4-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_065040_464608_B7A9364F 
X-CRM114-Status: GOOD (  20.28  )
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

Il 03/12/21 04:13, kyrie.wu ha scritto:
> Generalizes jpegenc timeout func interfaces to handle HW timeout.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
> V6: no change
> ---
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++++++++
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 23 +++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 7d013de..baab305 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -75,6 +75,12 @@ struct mtk_jpeg_variant {
>   	u32 cap_q_default_fourcc;
>   };
>   
> +struct mtk_jpeg_hw_param {
> +	struct vb2_v4l2_buffer *src_buffer;
> +	struct vb2_v4l2_buffer *dst_buffer;
> +	struct mtk_jpeg_ctx *curr_ctx;
> +};
> +
>   enum mtk_jpegenc_hw_id {
>   	MTK_JPEGENC_HW0,
>   	MTK_JPEGENC_HW1,
> @@ -122,6 +128,8 @@ struct mtk_jpegenc_comp_dev {
>   	struct mtk_jpeg_dev *master_dev;
>   	struct mtk_jpegenc_pm pm;
>   	int jpegenc_irq;
> +	struct delayed_work job_timeout_work;
> +	struct mtk_jpeg_hw_param hw_param;
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> index 4ccda1d..e62b875 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> @@ -183,6 +183,24 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
>   	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
>   }
>   
> +static void mtk_jpegenc_timeout_work(struct work_struct *work)
> +{
> +	struct delayed_work *Pwork =
> +		container_of(work, struct delayed_work, work);
> +	struct mtk_jpegenc_comp_dev *cjpeg =
> +		container_of(Pwork, struct mtk_jpegenc_comp_dev,
> +		job_timeout_work);
> +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> +	struct vb2_v4l2_buffer *src_buf;
> +
> +	src_buf = cjpeg->hw_param.src_buffer;
> +
> +	mtk_jpeg_enc_reset(cjpeg->reg_base);
> +	clk_disable_unprepare(cjpeg->pm.venc_clk.clk_info->jpegenc_clk);

You disable and unprepare the clock, but you never turn it back on?

This will lead to unbalanced disable on module removal but, more importantly,
will lead to unclocked access after a timeout, for which the platform may or
may not crash, but the jpgenc hardware will be unrecoverable until performing
a full system reboot.

Please fix this.

> +	pm_runtime_put(cjpeg->pm.dev);
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +}
> +
>   static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>   {
>   	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> @@ -194,6 +212,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>   	struct mtk_jpegenc_comp_dev *jpeg = priv;
>   	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
>   
> +	cancel_delayed_work(&jpeg->job_timeout_work);
> +
>   	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
>   		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
>   	if (irq_status)
> @@ -322,6 +342,9 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>   
>   	dev->plat_dev = pdev;
>   
> +	INIT_DELAYED_WORK(&dev->job_timeout_work,
> +		mtk_jpegenc_timeout_work);
> +
>   	ret = mtk_jpegenc_init_pm(dev);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
