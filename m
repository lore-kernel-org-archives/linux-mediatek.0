Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0270FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:43:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6960C6146D
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 07:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6960C6146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/0rveb/KHo6ZpOhjDyDDgZlTaOMxRYx9w0k77KZuX5o=; b=3ZKNpLNjjA99qkokf8LmhSR3N
	68vEIzRoir/mr/fn/yaRubq0q4PAqF+5ruvoDT9wuQp5XXR3puiiyCBqMwtISdthDwu5t5YK44iWl
	xd+5C56NfKtAbKSe6Pb0uh8+AqdvOMcULJUJP8CjmNcokmjQiOTiUIuBq4lvXsmLQcdWqTrDxatYT
	E4MvcosfiIny0J29ZiGTy7CpO9kRPqIRoJHHTjk9LWC/WZ+GQ80w/mp8GGzWxaXbyiD6OpzM+D/Tr
	fp3SqlTVg83P5E+rzuop1eqms1zuuYLib49DTAYUKlpBdEN3TRc/T/7pR1TEFc40+FgIXQLZ2vZ3W
	StJCbiVcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51xF-0002it-Ho; Thu, 28 Jan 2021 07:43:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51xD-0002hs-9Y; Thu, 28 Jan 2021 07:43:00 +0000
X-UUID: f6c843451470496c855ea140a10febb0-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5vHOnzu1Slh2QZItzOh3bY2TFXG15jjC2a9A0egvloA=; 
 b=KNoxHWZV+416mP3el6eosNWasj2VwUlFuxfHhHQXv+TQXaeS89oxzN8D5lxmGIBzsAHy8Lu1zWn1gofzW3zFpY+20MqMwbBK61OLHq7HAYCwsnTbnybQ9EAtl4JQ4rPaq4K52U2+54ZnEmO8w9PbF+egE3VYJlfSh1d/w5iNzq4=;
X-UUID: f6c843451470496c855ea140a10febb0-20210127
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 320193749; Wed, 27 Jan 2021 23:42:54 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 23:42:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 15:42:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 15:42:46 +0800
Message-ID: <1611819766.16091.4.camel@mtksdaap41>
Subject: Re: [PATCH v11 7/9] drm/mediatek: enable dither function
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 15:42:46 +0800
In-Reply-To: <20210128072802.830971-8-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-8-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8A70314F22D8F0A6B6BFCADD8C97819AA697AC672BFA54AF2FF1F0D0FF62D6932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_024259_492434_A23D1D0F 
X-CRM114-Status: GOOD (  22.75  )
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

Hi, Hsin-Yi:

On Thu, 2021-01-28 at 15:28 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> for 5 or 6 bpc panel, we need enable dither function
> to improve the display quality
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 8173f709272be..e85625704d611 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -53,7 +53,9 @@
>  #define DITHER_EN				BIT(0)
>  #define DISP_DITHER_CFG				0x0020
>  #define DITHER_RELAY_MODE			BIT(0)
> +#define DITHER_ENGINE_EN			BIT(1)
>  #define DISP_DITHER_SIZE			0x0030
> +#define DITHER_REG(idx)				(0x100 + (idx) * 4)
>  
>  #define LUT_10BIT_MASK				0x03ff
>  
> @@ -313,8 +315,48 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
>  {
>  	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>  
> +	bool enable = false;
> +
> +	/* default value for dither reg 5 to 14 */
> +	const u32 dither_setting[] = {
> +		0x00000000, /* 5 */
> +		0x00003002, /* 6 */
> +		0x00000000, /* 7 */
> +		0x00000000, /* 8 */
> +		0x00000000, /* 9 */
> +		0x00000000, /* 10 */
> +		0x00000000, /* 11 */
> +		0x00000011, /* 12 */
> +		0x00000000, /* 13 */
> +		0x00000000, /* 14 */

Could you explain what is this?

> +	};
> +
> +	if (bpc == 5 || bpc == 6) {
> +		enable = true;
> +		mtk_ddp_write(cmdq_pkt,
> +			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> +			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> +			      DITHER_NEW_BIT_MODE,
> +			      &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> +		mtk_ddp_write(cmdq_pkt,
> +			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> +			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> +			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> +			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),

This result in 0x50505050, but previous version is 0x50504040, so this
version is correct and previous version is incorrect?

Regards,
CK

> +			      &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> +	}
> +
> +
> +	if (enable) {
> +		u32 idx;
> +
> +		for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
> +			mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
> +				      DITHER_REG(idx + 5));
> +	}
> +
>  	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> -	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> +        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
>  }
>  
>  static void mtk_dither_start(struct device *dev)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
