Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8793EC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 13:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D2720FC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 13:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h0ppAWLC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FiMajHQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54D2720FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSFa/HmMsib4UcjghgQRwcMJuGYkLbv0ZeTMfBFqz/4=; b=h0ppAWLCuKPGuM
	dmLCp2a+Ql63a6UnXv8De+4lypykMW5eh1XOFfgT2MN9i845XklesPmT826Zd1ZfFtvRVDv3dlokg
	LbbnPd2oyVBmhP3V19+kNWb8T4iVeoj+qvJds4wNx5m28AQaA6lLqRTwXkNvV9hvcYZPVcbT3BC35
	oGgeKDxRNRwJ5SS5y7ztDt3KZ2vEVeA1icIyrwA1HXNxnVglY6nJqaYd0Qo0v5XDMq7h3HVM5ehnE
	5bypgfb6aOfMdT0FAOtTHKYFlACg1Z7xCJEenfegva+iBhejoCy4B7Gx7+i/Ef+BCR2Dpc/1vj4JF
	L+/tvhCBC0O4Oc2oFXhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlBSu-0003Pq-Pr; Tue, 16 Jun 2020 13:17:24 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlBSr-0003PK-0O
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 13:17:22 +0000
Received: by mail-ot1-x342.google.com with SMTP id 97so15896453otg.3
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2020 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rzMbHCBVqOXYNcr+qlbWYXnu4pNfFFS2FAbZ34pmgSc=;
 b=FiMajHQm7L6DE7XhIjtgClVw9dM6cFiUMth6qMwoC0Emy3gOzr89rNweEqq8RXT2rm
 pOgmOB4uLk0vlKKD5iVRMmwYIBZGPwAHQZI+Dviz/nlvIE+3qu6k6FVURyqCv9s7P6aS
 Zzk9wgbThOGRYsnJ0OSaaZL0J6mVMCZGcrofs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rzMbHCBVqOXYNcr+qlbWYXnu4pNfFFS2FAbZ34pmgSc=;
 b=S2rhrowEn/9sn50KytVPGkUftKvuZjRjQWvp0bd5WePC+ljZ2wgBcX3ecIt2gbaWl+
 vbx6PqEbwiEA2XfEtCP6O/I3MIC2N6eiXvWHV4RQD3p2GEfGuBN5yHul+B4ijtLsTNuK
 bPgugjip0FSRP+qSGs92L5pNdxeoEnCXHt76n7lt9d5+PBD3kGwJl9/A5rPdPwUVA0Q/
 DJtujVVcj9lwotUy6qBMuvMDHgvwzXsrVqPzsfYtqZLZJDTcOrU5P4Z6CiDaykL/vjU2
 XrN6e+yO0u0xSvDq8leP1CklsC8PPZBX+BJMEM59R2mhOc8Johc88TaRhrlldffycWHY
 S20Q==
X-Gm-Message-State: AOAM5324PbtnKEcVf9reNGYvGaFCXxDfIxgRf+vRvNZNk0HaXAWE6OsC
 F/PKKPM8jDMA1BRYGpJNPWkjuxXVti4=
X-Google-Smtp-Source: ABdhPJxANlrpbyYFy+FthpB0pkQ1Z7hVvfaQJx/imX8fp1CwQk3yR6MnUJnI5XexWOfWWHejsNNMlQ==
X-Received: by 2002:a9d:456:: with SMTP id 80mr2257187otc.2.1592313438253;
 Tue, 16 Jun 2020 06:17:18 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com.
 [209.85.161.46])
 by smtp.gmail.com with ESMTPSA id f5sm4016665oou.47.2020.06.16.06.17.16
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 06:17:17 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id e12so4080319oou.2
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2020 06:17:16 -0700 (PDT)
X-Received: by 2002:a4a:6156:: with SMTP id u22mr2286731ooe.50.1592313436257; 
 Tue, 16 Jun 2020 06:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-3-acourbot@chromium.org>
 <1591613234.18435.8.camel@mtksdaap41>
In-Reply-To: <1591613234.18435.8.camel@mtksdaap41>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 16 Jun 2020 22:17:03 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVFyvoGjNE4xVPTBQzZibQSOuiEgBynror3CAo1W2dkxw@mail.gmail.com>
Message-ID: <CAPBb6MVFyvoGjNE4xVPTBQzZibQSOuiEgBynror3CAo1W2dkxw@mail.gmail.com>
Subject: Re: [PATCH 02/10] media: mtk-vcodec: add SCP firmware ops
To: Tiffany Lin <tiffany.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_061721_065199_BCD3CDC2 
X-CRM114-Status: GOOD (  19.63  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 8, 2020 at 7:47 PM Tiffany Lin <tiffany.lin@mediatek.com> wrote:
>
> On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > Add support for communicating with the SCP firmware, which will be used
> > by MT8183.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [acourbot: refactor, cleanup and split]
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/media/platform/Kconfig                |  2 +
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 +
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 +
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 56 +++++++++++++++++++
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  2 +
> >  5 files changed, 66 insertions(+)
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index c57ee78fa99d..9b11dd6b1ef3 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -256,6 +256,8 @@ config VIDEO_MEDIATEK_VCODEC
> >       select VIDEOBUF2_DMA_CONTIG
> >       select V4L2_MEM2MEM_DEV
> >       select VIDEO_MEDIATEK_VPU
> > +     select MTK_SCP
> > +     default n
> >       help
> >           Mediatek video codec driver provides HW capability to
> >           encode and decode in a range of video formats
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 4f07a5fcce7f..5b5765b98e57 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -225,6 +225,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >       if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> >                                 &rproc_phandle)) {
> >               fw_type = VPU;
> > +     } else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> > +                                      &rproc_phandle)) {
> > +             fw_type = SCP;
> >       } else {
> >               mtk_v4l2_err("Could not get vdec IPI device");
> >               return -ENODEV;
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index 4340ea10afd0..42530cd01a30 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -233,6 +233,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >       if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> >                                 &rproc_phandle)) {
> >               fw_type = VPU;
> > +     } else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> > +                                      &rproc_phandle)) {
> > +             fw_type = SCP;
> >       } else {
> >               mtk_v4l2_err("Could not get venc IPI device");
> >               return -ENODEV;
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > index 967bb100a990..f2a62ea62fc6 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> > @@ -19,6 +19,7 @@ struct mtk_vcodec_fw {
> >       enum mtk_vcodec_fw_type type;
> >       const struct mtk_vcodec_fw_ops *ops;
> >       struct platform_device *pdev;
> > +     struct mtk_scp *scp;
> >  };
> >
> >  static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
> > @@ -71,6 +72,48 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
> >       .ipi_send = mtk_vcodec_vpu_ipi_send,
> >  };
> >
> > +static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
> > +{
> > +     return rproc_boot(scp_get_rproc(fw->scp));
>
>
> Does rproc_boot and scp_get_rproc depend on the other kernel module?
> where are they defineded?

rproc_boot() is part of the remoteproc subsystem. scp_get_rproc() is
part of the mtk_scp driver, which is present upstream. This patch also
adds a dependency on MTK_SCP in Kconfig, which ensures both functions
are available.

>
> > +}
> > +
> > +static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
> > +{
> > +     return scp_get_vdec_hw_capa(fw->scp);
> > +}
> > +
> > +static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
> > +{
> > +     return scp_get_venc_hw_capa(fw->scp);
> > +}
> > +
> > +static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
> > +                                     u32 dtcm_dmem_addr)
> > +{
> > +     return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
> > +}
> > +
> > +static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
> > +             mtk_vcodec_ipi_handler handler, const char *name, void *priv)
> > +{
> > +     return scp_ipi_register(fw->scp, id, handler, priv);
> > +}
> > +
> > +static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
> > +             unsigned int len, unsigned int wait)
> > +{
> > +     return scp_ipi_send(fw->scp, id, buf, len, wait);
> > +}
> > +
> > +static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
> > +     .load_firmware = mtk_vcodec_scp_load_firmware,
> > +     .get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
> > +     .get_venc_capa = mtk_vcodec_scp_get_venc_capa,
> > +     .map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
> > +     .ipi_register = mtk_vcodec_scp_set_ipi_register,
> > +     .ipi_send = mtk_vcodec_scp_ipi_send,
> > +};
> > +
> >  static void mtk_vcodec_reset_handler(void *priv)
> >  {
> >       struct mtk_vcodec_dev *dev = priv;
> > @@ -94,6 +137,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> >       const struct mtk_vcodec_fw_ops *ops;
> >       struct mtk_vcodec_fw *fw;
> >       struct platform_device *fw_pdev = NULL;
> > +     struct mtk_scp *scp = NULL;
> >
> >       switch (type) {
> >       case VPU:
> > @@ -106,6 +150,14 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> >               vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
> >                                   dev, rst_id);
> >               break;
> > +     case SCP:
> > +             ops = &mtk_vcodec_rproc_msg;
> > +             scp = scp_get(dev->plat_dev);
> > +             if (!scp) {
> > +                     mtk_v4l2_err("could not get vdec scp handle");
> > +                     return ERR_PTR(-EPROBE_DEFER);
> > +             }
> > +             break;
> >       default:
> >               mtk_v4l2_err("invalid vcodec fw type");
> >               return ERR_PTR(-EINVAL);
> > @@ -118,6 +170,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
> >       fw->type = type;
> >       fw->ops = ops;
> >       fw->pdev = fw_pdev;
> > +     fw->scp = scp;
> >
> >       return fw;
> >  }
> > @@ -129,6 +182,9 @@ void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
> >       case VPU:
> >               put_device(&fw->pdev->dev);
> >               break;
> > +     case SCP:
> > +             scp_put(fw->scp);
> > +             break;
> >       }
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> > index ff25b0c19f74..ced1b6a10e07 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> > @@ -4,6 +4,7 @@
> >  #define _MTK_VCODEC_FW_H_
> >
> >  #include <linux/remoteproc.h>
> > +#include <linux/remoteproc/mtk_scp.h>
> >
> >  #include "../mtk-vpu/mtk_vpu.h"
> >
> > @@ -11,6 +12,7 @@ struct mtk_vcodec_dev;
> >
> >  enum mtk_vcodec_fw_type {
> >       VPU,
> > +     SCP,
> >  };
> >
> >  struct mtk_vcodec_fw;
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
