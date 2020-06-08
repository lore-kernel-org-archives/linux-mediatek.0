Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC1CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 10:50:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E13FD206C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 10:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWQBye3j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DWGPIwN8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E13FD206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckFUW/H6zC04GmddIhVI+QEWwObtX5J/lRv3o2+FcyA=; b=gWQBye3j/MRIeM
	A8oDVJWSjaSpH4BuxY28eBW8eY/duP0Ed8iCLDOx1kIskahcL3rH+1VrlAP2izXYAU0roVvo2bwWk
	IqPnoJWZC7OKxOiE+70psin8xJh+3fBZ0CjWCv05Ux+Ee3Mb5YF2wHbK3TGRCZYDqH/1fgN9bB+QB
	fvgkJ7ihY+XglyNg/dim61B8CyOuO8JRU3hG/Lyiwvm04+m6D+vWwuo8lLLMOiyqSCJpHsa89Xt1r
	Vnq743sNK0/EV7Td11ZGhwJLNvq8ayNHaWxcP8ZNKgL1mMpXlPewR6TOlF4YfzrZH09mTxBkiATDd
	AJmti5P0ofTTxH7CHXhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiFLk-0002KP-Gv; Mon, 08 Jun 2020 10:49:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiFLg-0002Jb-TX
 for linux-mediatek@lists.infradead.org; Mon, 08 Jun 2020 10:49:50 +0000
X-UUID: 64ae1fd3e5064356b58ce1598623ec19-20200608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4U5wOyS9euUxaAz1UlU89Xtc0yNK/D1HajDxurFdoY0=; 
 b=DWGPIwN82FJCAt9fuuOj4oDFpYuNx1pA6XIEiyvrxiJaTsvd3LJBiUJpfI1NUEvEMsmvtqZciQlkhzOzYR7dXvjEoc/E5RSlkSWFqpxhtaiukvpD5VojrARQP0S8k1209t9jst11RBtS9ZCSE9Plp9YkYL4EjJYpamTdd5WEyBQ=;
X-UUID: 64ae1fd3e5064356b58ce1598623ec19-20200608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1359846883; Mon, 08 Jun 2020 02:49:38 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Jun 2020 03:47:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Jun 2020 18:47:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Jun 2020 18:47:12 +0800
Message-ID: <1591613234.18435.8.camel@mtksdaap41>
Subject: Re: [PATCH 02/10] media: mtk-vcodec: add SCP firmware ops
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 8 Jun 2020 18:47:14 +0800
In-Reply-To: <20200520082723.96136-3-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-3-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_034948_964718_89C5535F 
X-CRM114-Status: GOOD (  16.92  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Pi-Hsun
 Shih <pihsun@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Add support for communicating with the SCP firmware, which will be used
> by MT8183.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/Kconfig                |  2 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  3 +
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  3 +
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 56 +++++++++++++++++++
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  2 +
>  5 files changed, 66 insertions(+)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index c57ee78fa99d..9b11dd6b1ef3 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -256,6 +256,8 @@ config VIDEO_MEDIATEK_VCODEC
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
>  	select VIDEO_MEDIATEK_VPU
> +	select MTK_SCP
> +	default n
>  	help
>  	    Mediatek video codec driver provides HW capability to
>  	    encode and decode in a range of video formats
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 4f07a5fcce7f..5b5765b98e57 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -225,6 +225,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
>  				  &rproc_phandle)) {
>  		fw_type = VPU;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> +					 &rproc_phandle)) {
> +		fw_type = SCP;
>  	} else {
>  		mtk_v4l2_err("Could not get vdec IPI device");
>  		return -ENODEV;
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 4340ea10afd0..42530cd01a30 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -233,6 +233,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
>  				  &rproc_phandle)) {
>  		fw_type = VPU;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> +					 &rproc_phandle)) {
> +		fw_type = SCP;
>  	} else {
>  		mtk_v4l2_err("Could not get venc IPI device");
>  		return -ENODEV;
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> index 967bb100a990..f2a62ea62fc6 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> @@ -19,6 +19,7 @@ struct mtk_vcodec_fw {
>  	enum mtk_vcodec_fw_type type;
>  	const struct mtk_vcodec_fw_ops *ops;
>  	struct platform_device *pdev;
> +	struct mtk_scp *scp;
>  };
>  
>  static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
> @@ -71,6 +72,48 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
>  	.ipi_send = mtk_vcodec_vpu_ipi_send,
>  };
>  
> +static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
> +{
> +	return rproc_boot(scp_get_rproc(fw->scp));


Does rproc_boot and scp_get_rproc depend on the other kernel module?
where are they defineded?

> +}
> +
> +static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
> +{
> +	return scp_get_vdec_hw_capa(fw->scp);
> +}
> +
> +static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
> +{
> +	return scp_get_venc_hw_capa(fw->scp);
> +}
> +
> +static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
> +					u32 dtcm_dmem_addr)
> +{
> +	return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
> +}
> +
> +static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
> +		mtk_vcodec_ipi_handler handler, const char *name, void *priv)
> +{
> +	return scp_ipi_register(fw->scp, id, handler, priv);
> +}
> +
> +static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
> +		unsigned int len, unsigned int wait)
> +{
> +	return scp_ipi_send(fw->scp, id, buf, len, wait);
> +}
> +
> +static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
> +	.load_firmware = mtk_vcodec_scp_load_firmware,
> +	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
> +	.get_venc_capa = mtk_vcodec_scp_get_venc_capa,
> +	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
> +	.ipi_register = mtk_vcodec_scp_set_ipi_register,
> +	.ipi_send = mtk_vcodec_scp_ipi_send,
> +};
> +
>  static void mtk_vcodec_reset_handler(void *priv)
>  {
>  	struct mtk_vcodec_dev *dev = priv;
> @@ -94,6 +137,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>  	const struct mtk_vcodec_fw_ops *ops;
>  	struct mtk_vcodec_fw *fw;
>  	struct platform_device *fw_pdev = NULL;
> +	struct mtk_scp *scp = NULL;
>  
>  	switch (type) {
>  	case VPU:
> @@ -106,6 +150,14 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>  		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
>  				    dev, rst_id);
>  		break;
> +	case SCP:
> +		ops = &mtk_vcodec_rproc_msg;
> +		scp = scp_get(dev->plat_dev);
> +		if (!scp) {
> +			mtk_v4l2_err("could not get vdec scp handle");
> +			return ERR_PTR(-EPROBE_DEFER);
> +		}
> +		break;
>  	default:
>  		mtk_v4l2_err("invalid vcodec fw type");
>  		return ERR_PTR(-EINVAL);
> @@ -118,6 +170,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
>  	fw->type = type;
>  	fw->ops = ops;
>  	fw->pdev = fw_pdev;
> +	fw->scp = scp;
>  
>  	return fw;
>  }
> @@ -129,6 +182,9 @@ void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
>  	case VPU:
>  		put_device(&fw->pdev->dev);
>  		break;
> +	case SCP:
> +		scp_put(fw->scp);
> +		break;
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> index ff25b0c19f74..ced1b6a10e07 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> @@ -4,6 +4,7 @@
>  #define _MTK_VCODEC_FW_H_
>  
>  #include <linux/remoteproc.h>
> +#include <linux/remoteproc/mtk_scp.h>
>  
>  #include "../mtk-vpu/mtk_vpu.h"
>  
> @@ -11,6 +12,7 @@ struct mtk_vcodec_dev;
>  
>  enum mtk_vcodec_fw_type {
>  	VPU,
> +	SCP,
>  };
>  
>  struct mtk_vcodec_fw;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
