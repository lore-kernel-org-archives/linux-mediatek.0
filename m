Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D796C35257
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 03:33:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB1C207F7
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 03:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mn+t2ghf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gf6+m4YW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB1C207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TYSyUoAy/mKQY8+khkm683256bz1JEiEWY75749WN/0=; b=Mn+t2ghfw6zizU+Pwe7pHNQOu
	i1LTOnXkyZidTAg5wguIelLUK1jYum6aHJyEYD2n8TqfnvYShudvN3+DEApMQJU5hUy1qpx2fXGB2
	g3NKiykgfG8C/u/ODDf1VOnbU4jaMZWw9Q5e9uh/7Ln91VvR7uqOi2LwMbCTVQsY1Qq4AVow7JXtx
	2cyav3WcQqGjdPtxrDQGefDcxYx5kAwyh6FFEaEt1EA5gHLM6gW+YOkFo7U86oWpO75nXlMnXbbJC
	gYgldy3mABFl9AUFpoP45QXo9+Pd5getQ+QXrwF7qYNHGEexq/gZAkWESsR3W0umGWtaoBTdAHh/N
	uGwVfsZeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPHF7-00054c-IU; Mon, 05 Oct 2020 03:32:53 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPHF2-00052n-ST
 for linux-mediatek@lists.infradead.org; Mon, 05 Oct 2020 03:32:51 +0000
Received: by mail-oi1-x244.google.com with SMTP id x69so7457651oia.8
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2020 20:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sf78nyT0NmBrjFhF/2XhwPPL+2uXLT33f/t1fNeaDec=;
 b=gf6+m4YWcBDxmSk0HBWtr60eVrFKnlCIg1M+DUXpz8nlr/ohLVLU/207vqgDr+49g0
 iS1TpFNq2LRcBUUHcHVmIv4gb0HxIG605sOJ9gyZ39vPIDLFdftlWCFnDj2iRVNrtbur
 JpgPQEKniFedzMmyz3pNnLPa5hYrOoJ+mqvYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sf78nyT0NmBrjFhF/2XhwPPL+2uXLT33f/t1fNeaDec=;
 b=bXQcw6GTDA0GGIB4SylxDny3l/EzyJzYPnc2vQ9tn14KeZy4hLSRW5EivsdX27nJ2j
 ywbRKptDJnZ5swEdIFuheRyl/E2TS/eIjEfThb9nFdUUqDEzDliGKU7NZkPM1XHmsEBR
 63TBwTmaa5BVZ8gqaJlZdkNm7SIV+RJVMAlxx+1Jhh9tP5E5eRCWU3dIT0pGEN7eD7s9
 9DCPvi8sJX+5be5NWXhk5+QbiSmLyKFUb8c9An41kd0hBwyjDc8QzR9l2YMHSHUUjsBW
 Xuf+aMYLY4d55/ptsLxSjm31sCD4gtBprxJwnoYYJYcJFiT9LfZOpsYZxHR56LkYRm/d
 NZuQ==
X-Gm-Message-State: AOAM532lNSuVFu9tn+h8TPGmFuebvYWVByN8m1CgVdt31v9tAZ9MvX+m
 Da3c8zRDCmoX6rdHP6dKrwqwSSK//7Q6eUHe
X-Google-Smtp-Source: ABdhPJzIKgv5EfEKw7s2fjk+IJ0kfLUpAUA09S8Pr0dKH092I5nuNUIII6SrEHqQhtH+KiyU6qHfOg==
X-Received: by 2002:aca:4e05:: with SMTP id c5mr13462oib.99.1601868764001;
 Sun, 04 Oct 2020 20:32:44 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51])
 by smtp.gmail.com with ESMTPSA id k73sm2690226otk.63.2020.10.04.20.32.43
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2020 20:32:43 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id s66so7324174otb.2
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2020 20:32:43 -0700 (PDT)
X-Received: by 2002:a9d:6445:: with SMTP id m5mr9828746otl.36.1601868762506;
 Sun, 04 Oct 2020 20:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org>
In-Reply-To: <20201004122234.802044-1-acourbot@chromium.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 5 Oct 2020 12:32:30 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXbTRBBsqcKi-hUtw+pYTVrM2WXBBrEzeTyqqO=B3vuYw@mail.gmail.com>
Message-ID: <CAPBb6MXbTRBBsqcKi-hUtw+pYTVrM2WXBBrEzeTyqqO=B3vuYw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Tomasz Figa <tfiga@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_233248_943642_5054D278 
X-CRM114-Status: GOOD (  33.77  )
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Randy Dunlap <rdunlap@infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 4, 2020 at 9:22 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> The addition of MT8183 support added a dependency on the SCP remoteproc
> module. However the initial patch used the "select" Kconfig directive,
> which may result in the SCP module to not be compiled if remoteproc was
> disabled. In such a case, mtk-vcodec would try to link against
> non-existent SCP symbols. "select" was clearly misused here as explained
> in kconfig-language.txt.
>
> Replace this by a "depends" directive on at least one of the VPU and
> SCP modules, to allow the driver to be compiled as long as one of these
> is enabled, and adapt the code to support this new scenario.
>
> Also adapt the Kconfig text to explain the extra requirements for MT8173
> and MT8183.
>
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Forgot to send the changelog, so here it is:

Changes since v1:
* Added Acked-by from Randy.
* Fixed typo in Kconfig description.

> ---
>  drivers/media/platform/Kconfig                | 10 +--
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
>  2 files changed, 54 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a3cb104956d5..98eb62e49ec2 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
>         depends on MTK_IOMMU || COMPILE_TEST
>         depends on VIDEO_DEV && VIDEO_V4L2
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> +       depends on VIDEO_MEDIATEK_VPU || MTK_SCP
>         select VIDEOBUF2_DMA_CONTIG
>         select V4L2_MEM2MEM_DEV
> -       select VIDEO_MEDIATEK_VPU
> -       select MTK_SCP
>         help
>             Mediatek video codec driver provides HW capability to
> -           encode and decode in a range of video formats
> -           This driver rely on VPU driver to communicate with VPU.
> +           encode and decode in a range of video formats on MT8173
> +           and MT8183.
> +
> +           Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
> +           also be selected. Support for MT8183 depends on MTK_SCP.
>
>             To compile this driver as modules, choose M here: the
>             modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> index 6c2a2568d844..23a80027a8fb 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> @@ -13,6 +13,7 @@ struct mtk_vcodec_fw_ops {
>                             mtk_vcodec_ipi_handler handler, const char *name, void *priv);
>         int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
>                         unsigned int len, unsigned int wait);
> +       void (*release)(struct mtk_vcodec_fw *fw);
>  };
>
>  struct mtk_vcodec_fw {
> @@ -22,6 +23,8 @@ struct mtk_vcodec_fw {
>         struct mtk_scp *scp;
>  };
>
> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU)
> +
>  static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
>  {
>         return vpu_load_firmware(fw->pdev);
> @@ -64,6 +67,27 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
>         return vpu_ipi_send(fw->pdev, id, buf, len);
>  }
>
> +static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
> +{
> +       put_device(&fw->pdev->dev);
> +}
> +
> +static void mtk_vcodec_vpu_reset_handler(void *priv)
> +{
> +       struct mtk_vcodec_dev *dev = priv;
> +       struct mtk_vcodec_ctx *ctx;
> +
> +       mtk_v4l2_err("Watchdog timeout!!");
> +
> +       mutex_lock(&dev->dev_mutex);
> +       list_for_each_entry(ctx, &dev->ctx_list, list) {
> +               ctx->state = MTK_STATE_ABORT;
> +               mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
> +                              ctx->id);
> +       }
> +       mutex_unlock(&dev->dev_mutex);
> +}
> +
>  static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
>         .load_firmware = mtk_vcodec_vpu_load_firmware,
>         .get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
> @@ -71,8 +95,13 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
>         .map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
>         .ipi_register = mtk_vcodec_vpu_set_ipi_register,
>         .ipi_send = mtk_vcodec_vpu_ipi_send,
> +       .release = mtk_vcodec_vpu_release,
>  };
>
> +#endif  /* IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU) */
> +
> +#if IS_ENABLED(CONFIG_MTK_SCP)
> +
>  static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
>  {
>         return rproc_boot(scp_get_rproc(fw->scp));
> @@ -107,6 +136,11 @@ static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
>         return scp_ipi_send(fw->scp, id, buf, len, wait);
>  }
>
> +static void mtk_vcodec_scp_release(struct mtk_vcodec_fw *fw)
> +{
> +       scp_put(fw->scp);
> +}
> +
>  static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
>         .load_firmware = mtk_vcodec_scp_load_firmware,
>         .get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
> @@ -114,23 +148,10 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
>         .map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
>         .ipi_register = mtk_vcodec_scp_set_ipi_register,
>         .ipi_send = mtk_vcodec_scp_ipi_send,
> +       .release = mtk_vcodec_scp_release,
>  };
>
> -static void mtk_vcodec_reset_handler(void *priv)
> -{
> -       struct mtk_vcodec_dev *dev = priv;
> -       struct mtk_vcodec_ctx *ctx;
> -
> -       mtk_v4l2_err("Watchdog timeout!!");
> -
> -       mutex_lock(&dev->dev_mutex);
> -       list_for_each_entry(ctx, &dev->ctx_list, list) {
> -               ctx->state = MTK_STATE_ABORT;
> -               mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
> -                              ctx->id);
> -       }
> -       mutex_unlock(&dev->dev_mutex);
> -}
> +#endif  /* IS_ENABLED(CONFIG_MTK_SCP) */
>
>  struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>                                            enum mtk_vcodec_fw_type type,
> @@ -143,16 +164,22 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>
>         switch (type) {
>         case VPU:
> +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VPU)
>                 ops = &mtk_vcodec_vpu_msg;
>                 fw_pdev = vpu_get_plat_device(dev->plat_dev);
>                 if (!fw_pdev) {
>                         mtk_v4l2_err("firmware device is not ready");
>                         return ERR_PTR(-EINVAL);
>                 }
> -               vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
> +               vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler,
>                                     dev, rst_id);
>                 break;
> +#else
> +               mtk_v4l2_err("no VPU support in this kernel");
> +               return ERR_PTR(-ENODEV);
> +#endif
>         case SCP:
> +#if IS_ENABLED(CONFIG_MTK_SCP)
>                 ops = &mtk_vcodec_rproc_msg;
>                 scp = scp_get(dev->plat_dev);
>                 if (!scp) {
> @@ -160,6 +187,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>                         return ERR_PTR(-EPROBE_DEFER);
>                 }
>                 break;
> +#else
> +               mtk_v4l2_err("no SCP support in this kernel");
> +               return ERR_PTR(-ENODEV);
> +#endif
>         default:
>                 mtk_v4l2_err("invalid vcodec fw type");
>                 return ERR_PTR(-EINVAL);
> @@ -180,14 +211,7 @@ EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
>
>  void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
>  {
> -       switch (fw->type) {
> -       case VPU:
> -               put_device(&fw->pdev->dev);
> -               break;
> -       case SCP:
> -               scp_put(fw->scp);
> -               break;
> -       }
> +       fw->ops->release(fw);
>  }
>  EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
>
> --
> 2.28.0.806.g8561365e88-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
