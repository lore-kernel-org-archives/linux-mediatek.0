Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6529C433E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 05:35:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8591064DD6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 05:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8591064DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yISUxtiBTUc4L9VVJUtfDjmGizEtkP2QngBm2t7r4cQ=; b=GX6ZhMsT8dxCgLpEMn6BwpI16
	AvKhdQGGqBy9xW+HBroWsQC6WNfKzxOBddZ3W5fujdNYszAluSDtqqJtNt3qIayZfahhSRn7IHW/b
	+yFDEiu0kvHpj5/VhI35xGm3yurcrCz/5g8HBCOYTyY3tVJWY6CnzIZbuszSPfHdktn9cIVeUM5l5
	J/PSgj28NnSohZkznuo9MA+Pygzrt5CTyVhdjMbeq026dKmGZafJxULMWoxM8/T7gBdCI5l8297oC
	qepcxuy8kZ4VOSxa7+JzzFlUCh6gz2eEMmlhtohK8zhkL1rRDauRDS+fnUhzKHzalNacgCH8IKLuK
	TS2nvJQqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4zxZ-0007BO-5y; Thu, 28 Jan 2021 05:35:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4zxW-00079r-Lq; Thu, 28 Jan 2021 05:35:11 +0000
X-UUID: aa78cea1de55449781a92e61485dc92b-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XxO6FR8xvA123ZiF/PL7oeET5mcxrQ+uDd5Kof3HnYk=; 
 b=Ie1P9uZwXh8+lYMLj0x7CUUyWRunYZy+TESyg342tpr2RhB/dwlAomiEuKz81hr9qyXJKN+866q9ZjDkJSgFWK8YX1p2MFPPKbAhTxSdr1Er5ZTJGtVSlbYk8ioPt0ConaJ5MaO0G36Oa+32ABtdpYRFuzvpigauxZzpzyoCcYQ=;
X-UUID: aa78cea1de55449781a92e61485dc92b-20210127
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1971233285; Wed, 27 Jan 2021 21:35:06 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 21:35:04 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 13:34:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 13:34:53 +0800
Message-ID: <1611812093.28312.1.camel@mtksdaap41>
Subject: Re: [PATCH v10 6/9] drm/mediatek: add has_dither private data for
 gamma
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 13:34:53 +0800
In-Reply-To: <20210127045422.2418917-7-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 47C7AAB9C7C5D61CCA99EDA13880D171FB27A2778886A43D53DF0D0E9A7BDD962000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_003510_871661_0CD24CB8 
X-CRM114-Status: GOOD (  19.07  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hsin-Yi:

On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Not all SoC has dither function in gamma module.
> Add private data to control this function setting.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index b5a499d7e472c..c98fe284265d0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -25,7 +25,7 @@
>  #define LUT_10BIT_MASK				0x03ff
>  
>  struct mtk_disp_gamma_data {
> -	u32 reserved;
> +	bool has_dither;
>  };
>  
>  /**
> @@ -91,7 +91,8 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
>  
>  	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
>  		      DISP_GAMMA_SIZE);
> -	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG, cmdq_pkt);
> +	if (gamma->data && gamma->data->has_dither)
> +		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG, cmdq_pkt);
>  }
>  
>  void mtk_gamma_start(struct device *dev)
> @@ -171,8 +172,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
> +	.has_dither = true,
> +};
> +
>  static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
> -	{ .compatible = "mediatek,mt8173-disp-gamma"},
> +	{ .compatible = "mediatek,mt8173-disp-gamma",
> +	  .data = &mt8173_gamma_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
