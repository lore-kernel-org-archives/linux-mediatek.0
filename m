Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45674C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtmwTWqIt5qsIi1d2zU4dmuyEv383io1S3YEPE/OdXs=; b=30JN+IORq7gf4k
	GNDYg+OuPNgdQAcJd7/abOEMXUPb8vTwjH3TS0mILqd+RYUTcBNwlIeO2N5QtfRad/DpfePUm5k8q
	gJyhWyZYIzKRY96ZqrHHSL+T5WD99f21zshtKiOlGo3sVk19Gq5flIRa+oFsdirSiIuAIAqzj8PA6
	laIUD57Q/P4vP3RAj6ouHIvJXqNKDlUeejZUH5NnGXO2ukV5if4/MojLmMcs6UlcLlCMM2gdhR5Ls
	aZBegxvN7nwdJKrJdozZLwZByBjqqiE5DsVmRQ39a49XpOSUK2G4pNTTOatl19EoJMoWrL40lFCZM
	3J6zTXLe4ONE1yHfx8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5NeK-00GvLv-RL; Thu, 06 Jan 2022 07:57:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Ne8-00GvKF-4Y; Thu, 06 Jan 2022 07:57:18 +0000
X-UUID: 040df32b18574dd995afeb088f740fd0-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=k8SPDYXU9CnH50SecjTWI6hK7t/0bW2oSwhnVMaF10c=; 
 b=krQKAC8kQZeUqJe7Riv0EHpMnvSmQ9tG1s65g0IDyYuSnGiK7mXXpu6kpxhSiTNlsdSjAA2oycoxpo9iBY46v1DwQ7s3gerV0nDkM2HeUfNVGMwLCljm/mFr1i/QDT7mfR4K9Psxy6IxG/VQGfdb9T8WkwMy5c+IMHh7qD6Y19k=;
X-UUID: 040df32b18574dd995afeb088f740fd0-20220106
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 986001702; Thu, 06 Jan 2022 00:57:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 23:57:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 6 Jan 2022 15:57:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 15:57:08 +0800
Message-ID: <6d4444930aba035e2653d45d606c2e0878ab95ea.camel@mediatek.com>
Subject: Re: [PATCH V6, 3/5] media: mtk-jpegenc: add jpegenc timeout func
 interface
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Ricardo Ribalda <ribalda@chromium.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <irui.wang@mediatek.com>
Date: Thu, 6 Jan 2022 15:57:08 +0800
In-Reply-To: <YaoyuAFD8IaSij6S@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-4-git-send-email-kyrie.wu@mediatek.com>
 <YaoyuAFD8IaSij6S@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_235716_237533_D7F30F70 
X-CRM114-Status: GOOD (  24.62  )
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

On Fri, 2021-12-03 at 16:07 +0100, Ricardo Ribalda wrote:
> kyrie.wu wrote:
> 
> > Generalizes jpegenc timeout func interfaces to handle HW timeout.
> 
> Where do you call schedule_delayed_work() and init hw_param?
the work of call schedule_delayed_work() and init hw_param would
execute in the function of mtk_jpegenc_worker in [PATCH V6, 4/5]
> > 
> > Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> > ---
> > V6: no change
> > ---
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++++++++
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 23
> > +++++++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > index 7d013de..baab305 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> > @@ -75,6 +75,12 @@ struct mtk_jpeg_variant {
> >  	u32 cap_q_default_fourcc;
> >  };
> >  
> > +struct mtk_jpeg_hw_param {
> > +	struct vb2_v4l2_buffer *src_buffer;
> > +	struct vb2_v4l2_buffer *dst_buffer;
> > +	struct mtk_jpeg_ctx *curr_ctx;
> > +};
> > +
> >  enum mtk_jpegenc_hw_id {
> >  	MTK_JPEGENC_HW0,
> >  	MTK_JPEGENC_HW1,
> > @@ -122,6 +128,8 @@ struct mtk_jpegenc_comp_dev {
> >  	struct mtk_jpeg_dev *master_dev;
> >  	struct mtk_jpegenc_pm pm;
> >  	int jpegenc_irq;
> > +	struct delayed_work job_timeout_work;
> > +	struct mtk_jpeg_hw_param hw_param;
> >  };
> >  
> >  /**
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > index 4ccda1d..e62b875 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > @@ -183,6 +183,24 @@ void mtk_jpeg_set_enc_params(struct
> > mtk_jpeg_ctx *ctx,  void __iomem *base)
> >  	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
> >  }
> >  
> > +static void mtk_jpegenc_timeout_work(struct work_struct *work)
> > +{
> > +	struct delayed_work *Pwork =
> > +		container_of(work, struct delayed_work, work);
> 
> Please use to_delayed_work()
It would be fixed in the next code version.
Thanks.
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
> > +	pm_runtime_put(cjpeg->pm.dev);
> > +	v4l2_m2m_buf_done(src_buf, buf_state);
> > +}
> > +
> >  static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> >  {
> >  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > @@ -194,6 +212,8 @@ static irqreturn_t
> > mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> >  	struct mtk_jpegenc_comp_dev *jpeg = priv;
> >  	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
> >  
> > +	cancel_delayed_work(&jpeg->job_timeout_work);
> 
> Isn't here a race condition is the delayed work is being exectuted?
If hw worked beyond 1 second, the delayed work is called. This setting 
is shown in the function of mtk_jpegenc_worker in [PATCH V6, 4/5].
> > +
> >  	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
> >  		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> >  	if (irq_status)
> > @@ -322,6 +342,9 @@ static int mtk_jpegenc_hw_probe(struct
> > platform_device *pdev)
> >  
> >  	dev->plat_dev = pdev;
> >  
> > +	INIT_DELAYED_WORK(&dev->job_timeout_work,
> > +		mtk_jpegenc_timeout_work);
> > +
> >  	ret = mtk_jpegenc_init_pm(dev);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "Failed to get jpeg enc clock
> > source");
> > -- 
> > 2.6.4
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
