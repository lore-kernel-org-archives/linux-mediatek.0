Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F31EC07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088BD61369
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 088BD61369
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnZpHEfiTwJhWp/TOrZ8N4vAuajEpKw3/jbMTxxf7+4=; b=w7GxmPnVAbCQ35
	y0Xc0CMBHZOrCkmRGup7ltGd0u7QZ5RdjS/pVIVRobnZy2zPHxm7+uQNh5HZwE3xNTN8wz4WLQtg3
	KdBBmJNjQawVhIyyXQqpZjS0hA2lzYV0OWstHwxxyW3FLFZnVT+v5wz+YZ/qaydLF3bykievm1LSM
	EJdv1bkDrUQ7HMWZJVA+YszAKAqSc4VwRMGXUpMOz19HmuTQAc4z4AqaiRDtFBjCw60GEp/DDHJHX
	EA88e7Tyy4McAagLmELoHAZOc0i19POaHOCd78HIhqWkkv6nnN674fP+b8s7Hc+eKUrP87uF/peAu
	bxQYgR0ZR45ZW8seAZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ipy-00B9Xe-Ve; Tue, 06 Jul 2021 11:01:59 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ip6-00B98f-F0
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:01:06 +0000
Received: by mail-io1-xd2d.google.com with SMTP id b1so2998261ioz.8
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+HHpMaVaRdcfE11Iv9zB2/7DEGNbwGm556b5Rknsy4U=;
 b=sZaUCdrrS3e1iP5DPMjU61A5DEXd+QmYzjBzm1GL2Me4/JyUDJN0ev3edXVJGIGmkm
 8l7fy5hX3An2cIInjdvXVT9Tn+5aQnD3MzSPn8V2wnLhPFsbWWHF577BOAPtkRnqGHtf
 W2LlWCGJz3xMgpRK8DgdIFHn15khciULuguy/j56gDktDWMlJ45x71MEV7Qo728tSvmb
 AJrZ3DqI254Ds24HVNPXhN9HDro7EUgxHUZNbPHejS1s2amJgmlCsT8dMQ2zVO3TGrYN
 Vj6kB29JnaR2v1rPV6e9t1AVzsVUzHxteeYGlSl2cQR7UcDuyR6XSPdYxdt1FvspOGNE
 lnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+HHpMaVaRdcfE11Iv9zB2/7DEGNbwGm556b5Rknsy4U=;
 b=b6yw3ARboKzbklvnJwNqWTjk2Cph5rhHKznn7D43UTTclpaZKzWtumL7xWBEQWyddv
 z492oLnQYMrdauH5Kjdmz47T3yNg+FjKjbXdX8Djn6Fdqh+l73xQ8gMr6nqpUX4Ojc6L
 w0iZO+ojsMGhoM+caNIKnuauRQZhiGHe/XJxWlmQcqVIZ53m8EHs1ioi+Yc9+rn6ao7J
 46EIYnpGplGx9xkxEL5hAhMO0G28oxEU8iDTSFYCTrf8IXTPNr1IE6t8DZfW5/71EQXv
 26SdGg5L6NzL7YWXw+rOErGVLGu4YAHruEksAXrGQdQGRbYhXI3iO1D5UYs7W57Xwm/d
 RgrQ==
X-Gm-Message-State: AOAM530aKZCDAYd9zVjwf2GzDE2UCsEErwWipjOJtbJqcnI94nk1bFzK
 Hns881EMmAOsGst7LpU25rMHpWlnQDOy3bCU/k6q9Q==
X-Google-Smtp-Source: ABdhPJyd/zvHxz1L15JJizqajXWHQOOj/R3I+VJVejLEkbQuqbmJ5EorzShywsBzz0vI7SHNU/hc0pqJ92aAQ3OEINM=
X-Received: by 2002:a02:c73b:: with SMTP id h27mr9187900jao.126.1625569263462; 
 Tue, 06 Jul 2021 04:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-8-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-8-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:00:52 +0800
Message-ID: <CA+Px+wXt0QFi+AsMmFvwhPZe8ef3sfAJFrVkdgaofUMMHeQ3Vg@mail.gmail.com>
Subject: Re: [PATCH v2,7/9] media: mtk-jpegenc: Use component framework to
 manage each hardware information
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_040104_558566_1B9A9659 
X-CRM114-Status: GOOD (  25.22  )
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

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> +static  const struct of_device_id mtk_jpegenc_drv_ids[] = {
Remove the extra space between "static" and "const".

> +       {
> +               .compatible = "mediatek,mt8195-jpgenc0",
> +               .data = (void *)MTK_JPEGENC_HW0,
> +       },
> +       {
> +               .compatible = "mediatek,mt8195-jpgenc1",
> +               .data = (void *)MTK_JPEGENC_HW1,
> +       },
> +       {},
> +};
Should be guarded by CONFIG_OF.

> +static struct component_match *mtk_jpegenc_match_add(struct mtk_jpeg_dev *jpeg)
> +{
> +       struct device *dev = jpeg->dev;
> +       struct component_match *match = NULL;
> +       int i;
> +       char compatible[128] = {0};
It doesn't need to be initialized.

> +
> +       for (i = 0; i < ARRAY_SIZE(mtk_jpegenc_drv_ids); i++) {
> +               struct device_node *comp_node;
> +               enum mtk_jpegenc_hw_id comp_idx;
> +               const struct of_device_id *of_id;
> +
> +               memcpy(compatible, mtk_jpegenc_drv_ids[i].compatible,
> +                      sizeof(mtk_jpegenc_drv_ids[i].compatible));
Shouldn't rely on the source length.  Also needs to use strcpy-family
for better handling the NULL terminator.

> +               if (!of_device_is_available(comp_node)) {
> +                       of_node_put(comp_node);
> +                       v4l2_err(&jpeg->v4l2_dev, "Fail to get jpeg enc HW node\n");
To be consistent, use "Failed".

> +               of_id = of_match_node(mtk_jpegenc_drv_ids, comp_node);
> +               if (!of_id) {
> +                       v4l2_err(&jpeg->v4l2_dev, "Failed to get match node\n");
> +                       return ERR_PTR(-EINVAL);
Shouldn't it call of_node_put() before returning?

> +               comp_idx = (enum mtk_jpegenc_hw_id)of_id->data;
> +               v4l2_info(&jpeg->v4l2_dev, "Get component:hw_id(%d),jpeg_dev(0x%p),comp_node(0x%p)\n",
> +                         comp_idx, jpeg, comp_node);
> +
> +               jpeg->component_node[comp_idx] = comp_node;
> +
> +               component_match_add_release(dev, &match, mtk_vdec_release_of,
> +                                           mtk_vdec_compare_of, comp_node);
Shouldn't it need to break if it already found?

> +       if (!jpeg->variant->is_encoder) {
> +               res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +               jpeg->reg_base[MTK_JPEGENC_HW0] =
> +                       devm_ioremap_resource(&pdev->dev, res);
If !is_encoder, why is it still using MTK_JPEGENC_HW0?

> +               if (IS_ERR(jpeg->reg_base[MTK_JPEGENC_HW0])) {
> +                       ret = PTR_ERR(jpeg->reg_base[MTK_JPEGENC_HW0]);
> +                       return ret;
Just return the PTR_ERR if it doesn't need to goto.

> -       pm_runtime_enable(&pdev->dev);
> +       if (jpeg->variant->is_encoder) {
> +               match = mtk_jpegenc_match_add(jpeg);
> +               if (IS_ERR_OR_NULL(match))
> +                       goto err_vfd_jpeg_register;
> +
> +               video_set_drvdata(jpeg->vdev, jpeg);
> +               platform_set_drvdata(pdev, jpeg);
> +               ret = component_master_add_with_match(&pdev->dev,
> +                                                     &mtk_jpegenc_ops, match);
> +               if (ret < 0)
> +                       goto err_vfd_jpeg_register;
Shouldn't it call of_node_put() for un-doing mtk_jpegenc_match_add()?

> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -125,6 +125,8 @@ struct mtk_jpegenc_pm {
>   * @larb:              SMI device
>   * @job_timeout_work:  IRQ timeout structure
>   * @variant:           driver variant to be used
> + * @irqlock:           spinlock protecting for irq
> + * @dev_mutex:         the mutex protecting for device
The patch adds more than 2 fields in the struct.  They also need short
descriptions here.

>   */
>  struct mtk_jpeg_dev {
>         struct mutex            lock;
> @@ -136,12 +138,18 @@ struct mtk_jpeg_dev {
>         void                    *alloc_ctx;
>         struct video_device     *vdev;
>         struct device           *larb;
> -       struct delayed_work job_timeout_work;
>         const struct mtk_jpeg_variant *variant;
>
> +       struct clk              *clk_jpeg;
It is not used.

>  /**
>   * struct mtk_jpeg_fmt - driver's internal color format data
>   * @fourcc:    the fourcc code, 0 if not applicable
> @@ -194,6 +204,7 @@ struct mtk_jpeg_q_data {
>   * @enc_quality:       jpeg encoder quality
>   * @restart_interval:  jpeg encoder restart interval
>   * @ctrl_hdl:          controls handler
> + * @done_queue_lock:   spinlock protecting for buffer done queue
Probably put in the wrong patch?

> +int mtk_jpegenc_init_pm(struct mtk_jpeg_dev *mtkdev)
> +{
> +       struct platform_device *pdev;
> +       struct mtk_jpegenc_pm *pm;
> +       struct mtk_jpegenc_clk *jpegenc_clk;
> +       struct mtk_jpegenc_clk_info *clk_info;
> +       int i, ret;
> +
> +       pdev = mtkdev->plat_dev;
> +       pm->dev = &pdev->dev;
> +       pm = &mtkdev->pm;
> +       pm->mtkdev = mtkdev;
> +       jpegenc_clk = &pm->venc_clk;
Could they be inlined to above where the variables are declared.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
