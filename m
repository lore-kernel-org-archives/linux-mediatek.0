Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F488C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:40:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC16D64DD6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC16D64DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qUdsKLY4iwPw8umdrPH+7viRMzVePKg7tNmTyxt9Iq8=; b=s+7V0+lEq4KFmyJNUlLi03iyf
	BU4AscL9A5F69rE7BPg+v3wMHVnRuggH+YNrTFjM3EjCAQwwu2ggbISMuAq6sLT+/rRR/z63/zRfL
	Gn3lK3H5u3JR+iGBizAbfEi61FFda4nG1duGjSHjFIGQrkAoTktT/3WRrFxxCnM5i4LjV56XtZpL1
	HDbL0oX0Iv18g3PqQquhdyQtmJyBe7w25eDvE5thvWkcS/Y8F+wCXbfV6UPRmRj26BI2Ws7TGvZbQ
	bAQM24UlL6BBaFOVeJUPXnpA/COJkwxvq5ep3Onz8LC9RJlFgr0AjkSKR9VLRkHTx524s7mQEPGTT
	uk5IsCQBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51u8-0002FD-AU; Thu, 28 Jan 2021 07:39:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51u6-0002Ei-0M; Thu, 28 Jan 2021 07:39:47 +0000
X-UUID: 234dc2e2c1ed453084c726e68b260683-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5Sfop1PtYGQUduRyL0SKK4UxMHpv4G8/L7ZQ91LlTok=; 
 b=YdrKKkQ4E8A0QUr7Q/gR/rA/wT9E2fYe9jmo8ofz1/64vV0rE3Iomv3EuA1mMJVvBPlIjq1CAK/5p0nPLA/NwG8io2mMC3ropOhcUnjgD1Fv8co5Z+ayjOpmZ2ZE90kE9YDc0GC/P04C/4A7tSyven+eg8c5tVnKGxbZT7hcWu8=;
X-UUID: 234dc2e2c1ed453084c726e68b260683-20210127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1034051389; Wed, 27 Jan 2021 23:39:43 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 23:39:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 15:39:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 15:39:12 +0800
Message-ID: <1611819552.16091.1.camel@mtksdaap41>
Subject: Re: [PATCH v11 4/9] drm/mediatek: add mtk_dither_set_common() function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 15:39:12 +0800
In-Reply-To: <20210128072802.830971-5-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-5-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 079BE8C6A619A54B65635DC05D10741DADDEA17ADE9AC0EA5D43112F5A34835F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_023946_191569_EA4F749B 
X-CRM114-Status: GOOD (  20.36  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-28 at 15:27 +0800, Hsin-Yi Wang wrote:
> Current implementation of mtk_dither_set() cast dev data to
> struct mtk_ddp_comp_dev. But other devices with different dev data
> would also call this function.
> 
> Separate necessary parameters out so other device components (dither,
> gamma) can call this function.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 25 +++++++++++++--------
>  2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 46d199b7b4a29..c50d5fc9fd349 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -17,6 +17,10 @@ void mtk_color_config(struct device *dev, unsigned int w,
>  		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  void mtk_color_start(struct device *dev);
>  
> +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> +			   unsigned int bpc, unsigned int CFG,
> +			   struct cmdq_pkt *cmdq_pkt);
> +
>  void mtk_dpi_start(struct device *dev);
>  void mtk_dpi_stop(struct device *dev);
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 7b5293429426d..53d25823a37cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -151,33 +151,40 @@ static void mtk_ddp_clk_disable(struct device *dev)
>  	clk_disable_unprepare(priv->clk);
>  }
>  
> -static void mtk_dither_set(struct device *dev, unsigned int bpc,
> -		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> -{
> -	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>  
> +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> +			   unsigned int bpc, unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> +{
>  	/* If bpc equal to 0, the dithering function didn't be enabled */
>  	if (bpc == 0)
>  		return;
>  
>  	if (bpc >= MTK_MIN_BPC) {
> -		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
> -		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
> +		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> +		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
>  		mtk_ddp_write(cmdq_pkt,
>  			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
>  			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
>  			      DITHER_NEW_BIT_MODE,
> -			      &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
> +			      cmdq_reg, regs, DISP_DITHER_15);
>  		mtk_ddp_write(cmdq_pkt,
>  			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
>  			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
>  			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
>  			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> -			      &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
> -		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
> +			      cmdq_reg, regs, DISP_DITHER_16);
> +		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, cmdq_reg, regs, CFG);
>  	}
>  }
>  
> +static void mtk_dither_set(struct device *dev, unsigned int bpc,
> +		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, CFG, cmdq_pkt);
> +}
> +
>  static void mtk_od_config(struct device *dev, unsigned int w,
>  			  unsigned int h, unsigned int vrefresh,
>  			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
