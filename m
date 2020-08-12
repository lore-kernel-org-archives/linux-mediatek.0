Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D650C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 12:08:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 096CA207F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 12:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYUa5Vlh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 096CA207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tvVTZC/z67+GiUAzf4i8Utp+AFW997Q3UkixAB4eoZQ=; b=qYUa5VlhicWIxYiK1Ym/vOcEz
	Fq3xeSrDsJwBsgVlc0WAcI3ekIkb5h160DVah2yFv2aMbdcW76imoLgYsho+Tjbe+nOlRiy0Q/oMY
	cKCiT4yineUV1BNC/pT3+yp4KXT4oANGOVMmRYuvzLvdgp9KnIJYD4zMfKj66cGj1tfrEEVyZ8d70
	bDiDqckDKaUzFNr91NXF5eTj+ZgcnRt7JO5e2xg9u2GOL2jHsl02ucdYcdaBmHeyzdLOyMom9DTEu
	epRa7jq2nbizxfU4z2Ckxa0dPYFN5oFnG7RHaIPTkp/BsifdOFzHeErKR9Kfjiw7SdalI8jN4mk9w
	i8XTAyLVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5pYQ-0007On-1O; Wed, 12 Aug 2020 12:08:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5pYN-0007Nr-C9
 for linux-mediatek@lists.infradead.org; Wed, 12 Aug 2020 12:08:24 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k5pYK-0007Gt-NL; Wed, 12 Aug 2020 14:08:20 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k5pYJ-00087Y-7J; Wed, 12 Aug 2020 14:08:19 +0200
Message-ID: <f65aeebb6c372a7138e496a30ce39f879d4e24ed.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] mmc: mediatek: add optional module reset property
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Rob Herring <robh+dt@kernel.org>
Date: Wed, 12 Aug 2020 14:08:19 +0200
In-Reply-To: <20200812093726.10123-4-wenbin.mei@mediatek.com>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
 <20200812093726.10123-4-wenbin.mei@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_080823_435519_FFDE5158 
X-CRM114-Status: GOOD (  18.96  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-12 at 17:37 +0800, Wenbin Mei wrote:
> This patch adds a optional reset management for msdc.
> Sometimes the bootloader does not bring msdc register
> to default state, so need reset the msdc controller.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 39e7fc54c438..2b243c03c9b2 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
> +#include <linux/reset.h>
>  
>  #include <linux/mmc/card.h>
>  #include <linux/mmc/core.h>
> @@ -434,6 +435,7 @@ struct msdc_host {
>  	struct msdc_save_para save_para; /* used when gate HCLK */
>  	struct msdc_tune_para def_tune_para; /* default tune setting */
>  	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
> +	struct reset_control *reset;
>  };
>  
>  static const struct mtk_mmc_compatible mt8135_compat = {
> @@ -1516,6 +1518,12 @@ static void msdc_init_hw(struct msdc_host *host)
>  	u32 val;
>  	u32 tune_reg = host->dev_comp->pad_tune_reg;
>  
> +	if (!IS_ERR(host->reset)) {
> +		reset_control_assert(host->reset);
> +		usleep_range(10, 50);
> +		reset_control_deassert(host->reset);
> +	}
> +

This should be:

	if (host->reset) {
		reset_control_assert(host->reset);
		usleep_range(10, 50);
		reset_control_deassert(host->reset);
	}

>  	/* Configure to MMC/SD mode, clock free running */
>  	sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_MODE | MSDC_CFG_CKPDN);
>  
> @@ -2273,6 +2281,11 @@ static int msdc_drv_probe(struct platform_device *pdev)
>  	if (IS_ERR(host->src_clk_cg))
>  		host->src_clk_cg = NULL;
>  
> +	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> +								"hrst");
> +	if (PTR_ERR(host->reset) == -EPROBE_DEFER)
> +		return PTR_ERR(host->reset);
> +

This should be:

	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
								"hrst");
	if (IS_ERR(host->reset))
		return PTR_ERR(host->reset);

If the reset is configured in DT then it should be used, even if the
reset driver is loaded later.

If the DT does not contain the reset-names = "hrst" property at all,
devm_reset_control_get_optional_*() will return NULL.

With these two changes,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
