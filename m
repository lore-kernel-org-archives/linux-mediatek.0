Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 01:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hz4jLws2HWQRQ6+3sbQPp/XzB7EEvZjHGLSxy19RElk=; b=3AiTXwgXfmBnUV
	fGpwSvxrHe9K2Yu49xFafQadTKhHxr95Qr6KDwovdMOOX66F6A1bNrJf5RN0rzj/Fj+hTsySKLLmB
	vHj9R3QXWw475/vMBT3CydzmW3o9kE/NEssrGYmUMI17dy6CMYXa/OFrZtMu8R61FHM6lo3EYaK+F
	YAhevGfx2kps7h8Q8H4qp2kZVBpu8ia/v68LlPzMv7h9OogYAA9fdtzfIgAm2W/MMFB6WajCpOLzL
	EXS/H5A5pb/iKlOorA5YQiEvNu7QpBCyBjphMpSAeAtpwTEMmNbUHA5jWCpQUpPEGZtA5TGKpgV/p
	wcK474PxkLW4kevHbyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLxgU-002poC-2O; Mon, 21 Feb 2022 01:40:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLxgF-002pmY-Dq; Mon, 21 Feb 2022 01:40:02 +0000
X-UUID: cca423f0aaf942e397beaf4d3198dc75-20220220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=A46SpeMQOqPM30B3nDmxoetHBV4RQYs0M8Pj1+/W8go=; 
 b=PqToCkz4q6VKVZl0w03cQDQkDKIzL7/mha7PrSQfKqlnhFic6diQ4SeaMnnu/E2jFN0zj3NbfWm5Lo9XBMWrb42kC/ZAg2jJjDL3mphQOGhq/OCXblP3eQtcJz1Ab9nyN5KVAiFIX1F009SzEAAWtXL2XWRSAu72E6dBtouY1OI=;
X-UUID: cca423f0aaf942e397beaf4d3198dc75-20220220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 340067729; Sun, 20 Feb 2022 18:39:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 17:31:06 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Feb 2022 09:31:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 09:31:02 +0800
Message-ID: <78cc8569f675e45a62cb5046b01575308e8435bd.camel@mediatek.com>
Subject: Re: [PATCH V6, 3/5] media: mtk-jpegenc: add jpegenc timeout func
 interface
From: kyrie.wu <kyrie.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <irui.wang@mediatek.com>
Date: Mon, 21 Feb 2022 09:31:02 +0800
In-Reply-To: <d91f056c-227f-7a01-9e9c-9b4d53ec04f4@collabora.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-4-git-send-email-kyrie.wu@mediatek.com>
 <d91f056c-227f-7a01-9e9c-9b4d53ec04f4@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_174000_957361_7D6B1CF9 
X-CRM114-Status: GOOD (  23.06  )
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

On Mon, 2022-02-07 at 15:50 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/12/21 04:13, kyrie.wu ha scritto:
> > Generalizes jpegenc timeout func interfaces to handle HW timeout.
> > 
> > Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> > ---
> > V6: no change
> > ---
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++++++++
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 23
> > +++++++++++++++++++++++
> >   2 files changed, 31 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > index 7d013de..baab305 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > @@ -75,6 +75,12 @@ struct mtk_jpeg_variant {
> >   	u32 cap_q_default_fourcc;
> >   };
> >   
> > +struct mtk_jpeg_hw_param {
> > +	struct vb2_v4l2_buffer *src_buffer;
> > +	struct vb2_v4l2_buffer *dst_buffer;
> > +	struct mtk_jpeg_ctx *curr_ctx;
> > +};
> > +
> >   enum mtk_jpegenc_hw_id {
> >   	MTK_JPEGENC_HW0,
> >   	MTK_JPEGENC_HW1,
> > @@ -122,6 +128,8 @@ struct mtk_jpegenc_comp_dev {
> >   	struct mtk_jpeg_dev *master_dev;
> >   	struct mtk_jpegenc_pm pm;
> >   	int jpegenc_irq;
> > +	struct delayed_work job_timeout_work;
> > +	struct mtk_jpeg_hw_param hw_param;
> >   };
> >   
> >   /**
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > index 4ccda1d..e62b875 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > @@ -183,6 +183,24 @@ void mtk_jpeg_set_enc_params(struct
> > mtk_jpeg_ctx *ctx,  void __iomem *base)
> >   	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
> >   }
> >   
> > +static void mtk_jpegenc_timeout_work(struct work_struct *work)
> > +{
> > +	struct delayed_work *Pwork =
> > +		container_of(work, struct delayed_work, work);
> > +	struct mtk_jpegenc_comp_dev *cjpeg =
> > +		container_of(Pwork, struct mtk_jpegenc_comp_dev,
> > +		job_timeout_work);
> > +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > +	struct vb2_v4l2_buffer *src_buf;
> > +
> > +	src_buf = cjpeg->hw_param.src_buffer;
> > +
> > +	mtk_jpeg_enc_reset(cjpeg->reg_base);
> > +	clk_disable_unprepare(cjpeg->pm.venc_clk.clk_info-
> > >jpegenc_clk);
> 
> You disable and unprepare the clock, but you never turn it back on?
> 
> This will lead to unbalanced disable on module removal but, more
> importantly,
> will lead to unclocked access after a timeout, for which the platform
> may or
> may not crash, but the jpgenc hardware will be unrecoverable until
> performing
> a full system reboot.
> 
> Please fix this.
Dear AngeloGioacchino,
The colck enabled in the function of mtk_jpegenc_worker in [V6,4/5]
media: mtk-jpegenc: add jpeg encode worker interface. And it disabled
in mtk_jpegenc_timeout_work if encode error, or in
mtk_jpegenc_hw_irq_handler if encode success.
> 
> > +	pm_runtime_put(cjpeg->pm.dev);
> > +	v4l2_m2m_buf_done(src_buf, buf_state);
> > +}
> > +
> >   static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void
> > *priv)
> >   {
> >   	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > @@ -194,6 +212,8 @@ static irqreturn_t
> > mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> >   	struct mtk_jpegenc_comp_dev *jpeg = priv;
> >   	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
> >   
> > +	cancel_delayed_work(&jpeg->job_timeout_work);
> > +
> >   	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
> >   		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> >   	if (irq_status)
> > @@ -322,6 +342,9 @@ static int mtk_jpegenc_hw_probe(struct
> > platform_device *pdev)
> >   
> >   	dev->plat_dev = pdev;
> >   
> > +	INIT_DELAYED_WORK(&dev->job_timeout_work,
> > +		mtk_jpegenc_timeout_work);
> > +
> >   	ret = mtk_jpegenc_init_pm(dev);
> >   	if (ret) {
> >   		dev_err(&pdev->dev, "Failed to get jpeg enc clock
> > source");
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
