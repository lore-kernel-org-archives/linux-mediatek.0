Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD81C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 09:14:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B585920679
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 09:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVW4cozc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZeQ6t7PA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B585920679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lpto8/KNYI6boAZOZO3BGqr1mM7lV27WdPOwaiUst/o=; b=mVW4cozcYjwzbG
	BICWpLpJgziSEgbH+2b+EEiRopbtPAU4zgKVEeMfieXrcAJPEPAeNUWZNTyNTAP0QIKipoxi+3oGR
	16SaQoIabcgTRaUZbzqSqhhgp0kshOeSIGnyrkzpmowZR9WEqaoHwV3rCJIQds98h/TAPoWo5I5gx
	i1G6XrA0z97yW9EFnXWTYhOamsOlWOq1r+XrjNOhk5SCXeW2ENmvd/A4otrjC/obkbF4GyqX1IoIx
	GuTM33G/DUrLPCC6omLcqi3qi3zTd2iUjkRKGTObZTLI5cCz8kyQ1ONrpBoTBGvjjXAH0yDvobOBn
	glHyk27Jf/OXj7IDyTQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl7fx-0001nf-Uy; Tue, 16 Jun 2020 09:14:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl7fv-0001mQ-5m
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 09:14:36 +0000
X-UUID: ee9ed3241bb54967b3fe71ba747882c3-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Iom0Ooo0ld9eO1CCp1yVYs+J5BlfrqPZC6D1eK2m31s=; 
 b=ZeQ6t7PANxnwNglBoXj75fCoHVMKCmJpHauasOWs97vV+lrVwnEdWHty1+qrzKkp2cmz8mwOqi4H6yOKGA0KKNJbJbCfZRAxfKk4twVwhSJa3nwJvU4WAGqwENMYcygoZQNB+u6QMFgjtQ1sM94LnC21PCEyjLsM1a0FUNN4PWA=;
X-UUID: ee9ed3241bb54967b3fe71ba747882c3-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1719535930; Tue, 16 Jun 2020 01:14:33 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 02:04:30 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 17:04:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Jun 2020 17:04:29 +0800
Message-ID: <1592298269.25202.0.camel@mtksdaap41>
Subject: Re: [PATCH 04/10] media: mtk-vcodec: venc: handle firmware version
 field
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 16 Jun 2020 17:04:29 +0800
In-Reply-To: <20200520082723.96136-5-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-5-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_021435_222427_92E0119B 
X-CRM114-Status: GOOD (  21.18  )
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
> Firmwares for encoders newer than MT8173 will include an ABI version
> number in their initialization ack message. Add the capacity to manage
> it and make initialization fail if the firmware ABI is of a version that
> we don't support.
> 
> For MT8173, this ABI version field is reserved and thus undefined ; thus
> ignore it on this chip. There should only be one firmware version available
> for it anyway.
> 

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  8 ++++++
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  1 +
>  .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  9 ++++---
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 27 ++++++++++++++++---
>  4 files changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 45c8adfc6a0c..e7b155e7432e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -300,13 +300,21 @@ struct mtk_vcodec_ctx {
>  
>  };
>  
> +enum mtk_chip {
> +	MTK_MT8173,
> +};
> +
>  /**
>   * struct mtk_vcodec_enc_pdata - compatible data for each IC
>   *
> + * @chip: chip this encoder is compatible with
> + *
>   * @uses_ext: whether the encoder uses the extended firmware messaging format
>   * @has_lt_irq: whether the encoder uses the LT irq
>   */
>  struct mtk_vcodec_enc_pdata {
> +	enum mtk_chip chip;
> +
>  	bool uses_ext;
>  	bool has_lt_irq;
>  };
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 922bc8883811..c1365209263e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -378,6 +378,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  }
>  
>  static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
> +	.chip = MTK_MT8173,
>  	.has_lt_irq = true,
>  };
>  
> diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> index 4cafbf92d9cd..31a3c76f7d0d 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
> @@ -131,16 +131,17 @@ struct venc_vpu_ipi_msg_common {
>   * @venc_inst:	AP encoder instance (struct venc_vp8_inst/venc_h264_inst *)
>   * @vpu_inst_addr:	VPU encoder instance addr
>   *			(struct venc_vp8_vsi/venc_h264_vsi *)
> - * @reserved:	reserved for future use. vpu is running in 32bit. Without
> - *		this reserved field, if kernel run in 64bit. this struct size
> - *		will be different between kernel and vpu
> + * @venc_abi_version:	ABI version of the firmware. Kernel can use it to
> + *			ensure that it is compatible with the firmware.
> + *			For MT8173 the value of this field is undefined and
> + *			should not be used.
>   */
>  struct venc_vpu_ipi_msg_init {
>  	uint32_t msg_id;
>  	uint32_t status;
>  	uint64_t venc_inst;
>  	uint32_t vpu_inst_addr;
> -	uint32_t reserved;
> +	uint32_t venc_abi_version;
>  };
>  
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> index 6c77bf025172..472503701003 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
> @@ -4,6 +4,7 @@
>   * Author: PoChun Lin <pochun.lin@mediatek.com>
>   */
>  
> +#include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_fw.h"
>  #include "venc_ipi_msg.h"
>  #include "venc_vpu_if.h"
> @@ -15,6 +16,23 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
>  	vpu->inst_addr = msg->vpu_inst_addr;
>  	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
>  					     msg->vpu_inst_addr);
> +
> +	/* Firmware version field value is unspecified on MT8173. */
> +	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
> +		return;
> +
> +	/* Check firmware version. */
> +	mtk_vcodec_debug(vpu, "firmware version: 0x%x\n",
> +			 msg->venc_abi_version);
> +	switch (msg->venc_abi_version) {
> +	case 1:
> +		break;
> +	default:
> +		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
> +			       msg->venc_abi_version);
> +		vpu->failure = 1;
> +		break;
> +	}
>  }
>  
>  static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
> @@ -35,6 +53,11 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
>  	mtk_vcodec_debug(vpu, "msg_id %x inst %p status %d",
>  			 msg->msg_id, vpu, msg->status);
>  
> +	vpu->signaled = 1;
> +	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
> +	if (vpu->failure)
> +		goto failure;
> +
>  	switch (msg->msg_id) {
>  	case VPU_IPIMSG_ENC_INIT_DONE:
>  		handle_enc_init_msg(vpu, data);
> @@ -51,9 +74,7 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
>  		break;
>  	}
>  
> -	vpu->signaled = 1;
> -	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
> -
> +failure:
>  	mtk_vcodec_debug_leave(vpu);
>  }
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
