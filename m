Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D182CC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 09:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50D521924
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 09:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RfMbEZga";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MHeeNIj+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50D521924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Znl3HAxK2HSjaX0hPCN4k9ueEZPuL/vNLsDiu88RS4=; b=RfMbEZgaeH50TT
	lJ7c6J8FYBzA5VHnMgjLry8DEIeTF+fU0ubMQ8XgT+FucBhOIG+GDxGoLbhe4HdiYei1GgHwA6RyH
	GpPH1HipjMRtSQ5+SwT3lmHLctd7UuTguPczFM2X7EuDEySHQe89Hn32pGZez+9vQ+vs184HEuCWu
	lJLr+UbrV6/Uv2q5WuX3MOOxiWaJryWR2nAkw4oo2ilFTOk0lbrGM7pO6g27QCMY366v7Sx5U1RaH
	vu3nsOmAEEjtjWrjVUS/J2eeCtR3pkb6OFgBM2ZrlAiKDsxEyLWedWMbUCivpSVh2vLniV5hFBgXV
	i1uoJi8iH2D4tXiqpz8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlqwc-0008WE-8o; Thu, 18 Jun 2020 09:34:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlqwZ-0008Vj-AB; Thu, 18 Jun 2020 09:34:48 +0000
X-UUID: 95fe9acb588d4a9886bc9180f2917bb6-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fazQeAs8inAvGwYcQXqBGXqOlhYwCeTQdth0t/3tLpc=; 
 b=MHeeNIj++emO1PxnCKYQiheDFmpZ4QBACfg0h4/OsDUonE38uDizhI+ibfWfeYHrZWzdKmqjA4pspetmXciZRh0aMpC3nZVDYa6Z/T8lj5eJdfJoht83VIS8lU3VV4mz8emEXDFGXanQq7R5q4LS8CnMUfrDFmNHFsNV7hCie9k=;
X-UUID: 95fe9acb588d4a9886bc9180f2917bb6-20200618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1120295212; Thu, 18 Jun 2020 01:34:39 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 02:34:40 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 18 Jun 2020 17:34:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Jun 2020 17:34:33 +0800
Message-ID: <1592472725.20080.12.camel@mhfsdcap03>
Subject: Re: [PATCH v4 06/17] media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rick Chang
 <rick.chang@mediatek.com>
Date: Thu, 18 Jun 2020 17:32:05 +0800
In-Reply-To: <1590826218-23653-7-git-send-email-yong.wu@mediatek.com>
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
 <1590826218-23653-7-git-send-email-yong.wu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EAA0222707355DB3D9C41720DD63D68CCECEA4A8CC20861737BF3012552CC6C52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_023447_364730_BBD2FC49 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: xia.jiang@mediatek.com, Will Deacon <will.deacon@arm.com>,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Rick Chang <rick.chang@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Evan
 Green <evgreen@chromium.org>, eizan@chromium.org, Matthias
 Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, cui.zhang@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, ming-fan.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+ Rick

On Sat, 2020-05-30 at 16:10 +0800, Yong Wu wrote:
> MediaTek IOMMU has already added device_link between the consumer
> and smi-larb device. If the jpg device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Rick Chang <rick.chang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 22 ----------------------
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h |  2 --
>  2 files changed, 24 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index f82a81a..21fba6f 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -21,7 +21,6 @@
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_jpeg_hw.h"
>  #include "mtk_jpeg_core.h"
> @@ -893,11 +892,6 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
>  
>  static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  {
> -	int ret;
> -
> -	ret = mtk_smi_larb_get(jpeg->larb);
> -	if (ret)
> -		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
>  	clk_prepare_enable(jpeg->clk_jdec_smi);
>  	clk_prepare_enable(jpeg->clk_jdec);
>  }
> @@ -906,7 +900,6 @@ static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>  {
>  	clk_disable_unprepare(jpeg->clk_jdec);
>  	clk_disable_unprepare(jpeg->clk_jdec_smi);
> -	mtk_smi_larb_put(jpeg->larb);
>  }
>  
>  static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
> @@ -1051,21 +1044,6 @@ static int mtk_jpeg_release(struct file *file)
>  
>  static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  {
> -	struct device_node *node;
> -	struct platform_device *pdev;
> -
> -	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
> -	if (!node)
> -		return -EINVAL;
> -	pdev = of_find_device_by_node(node);
> -	if (WARN_ON(!pdev)) {
> -		of_node_put(node);
> -		return -EINVAL;
> -	}
> -	of_node_put(node);
> -
> -	jpeg->larb = &pdev->dev;
> -
>  	jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
>  	if (IS_ERR(jpeg->clk_jdec))
>  		return PTR_ERR(jpeg->clk_jdec);
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 999bd14..8579494 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -47,7 +47,6 @@ enum mtk_jpeg_ctx_state {
>   * @dec_reg_base:	JPEG registers mapping
>   * @clk_jdec:		JPEG hw working clock
>   * @clk_jdec_smi:	JPEG SMI bus clock
> - * @larb:		SMI device
>   */
>  struct mtk_jpeg_dev {
>  	struct mutex		lock;
> @@ -61,7 +60,6 @@ struct mtk_jpeg_dev {
>  	void __iomem		*dec_reg_base;
>  	struct clk		*clk_jdec;
>  	struct clk		*clk_jdec_smi;
> -	struct device		*larb;
>  };
>  
>  /**

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
