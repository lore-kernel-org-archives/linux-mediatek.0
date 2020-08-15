Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C287EC433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 02:02:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84A922078D
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 02:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0P/bkhld";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EWYHY1QK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84A922078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=65PjjfbTppknFMw3tltBr5ZRxH53ODhYGPlp2DZtnhI=; b=0P/bkhld/3/P9xdzILxN7cZdO
	Io+9EvE4mK/mKIS0po4b7Pal6lTMvmJQjN19J2UcgmkrPtYe3KevWZ2obTwpMJhS8JOUKZoKnqQr/
	oaWceCXLRvIey7VTcULgAvM4kBNCSUy+7YnsOTkbWj8bJFe06CjpNC7Ok4+worGqnljdEHTxY7N7Z
	FaG4sxgFgHovuCd+xkha6BxhpvrgxnqRsX41i+x/Zd92gj0OW/omrCLAbhFOxzDV08dgey1L7A+Kz
	1KzpkvuuVNk+ALbxrSmJK6UG1AYM8K4a1zFpLzr5F5IWpg6SZ1SV8iBqrCw5PrI2bG3Ka6KUZ2LQ2
	VUvFjsVAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6lWM-00076v-RB; Sat, 15 Aug 2020 02:02:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6lWH-00076G-GY; Sat, 15 Aug 2020 02:02:07 +0000
X-UUID: 58868aadedb946d59ffe6c3e2fb4d028-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ykDgwxnR/PcKB6j19sc+bfbOwoShTU5+DhSGs7LWbhk=; 
 b=EWYHY1QKOSJ4IOAO2TerUiJsEevUVnnuUmsQPy/q32NeyDLX/9Lqpl0VKR1rI4Og2n1o0PbFmpTi7zpxiBfmsNbvl/Xduf5X8+x20SWHL9g9xf1SugeFVe5KTAiGHnIMZPHz5Z/y84hCQiYFQ7YdQpSp2CuxfgUMuUU2BdG073E=;
X-UUID: 58868aadedb946d59ffe6c3e2fb4d028-20200814
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 141668771; Fri, 14 Aug 2020 18:01:55 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 18:51:54 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 15 Aug 2020 09:51:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 15 Aug 2020 09:51:51 +0800
Message-ID: <1597456250.5805.2.camel@mhfsdcap03>
Subject: Re: [v5,3/3] mmc: mediatek: add optional module reset property
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Date: Sat, 15 Aug 2020 09:50:50 +0800
In-Reply-To: <20200814014346.6496-4-wenbin.mei@mediatek.com>
References: <20200814014346.6496-1-wenbin.mei@mediatek.com>
 <20200814014346.6496-4-wenbin.mei@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1C21012FEC7DBE0FE0750794591C6D1800C45FEE42C58FBFB5433EE322B72CDE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_220206_283023_46CEE9AF 
X-CRM114-Status: GOOD (  20.84  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-14 at 09:43 +0800, Wenbin Mei wrote:
> This patch fixs eMMC-Access on mt7622/Bpi-64.
> Before we got these Errors on mounting eMMC ion R64:
> [   48.664925] blk_update_request: I/O error, dev mmcblk0, sector 204800 op 0x1:(WRITE)
> flags 0x800 phys_seg 1 prio class 0
> [   48.676019] Buffer I/O error on dev mmcblk0p1, logical block 0, lost sync page write
> 
> This patch adds a optional reset management for msdc.
> Sometimes the bootloader does not bring msdc register
> to default state, so need reset the msdc controller.
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
 Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 39e7fc54c438..fc97d5bf3a20 100644
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
> +	if (host->reset) {
> +		reset_control_assert(host->reset);
> +		usleep_range(10, 50);
> +		reset_control_deassert(host->reset);
> +	}
> +
>  	/* Configure to MMC/SD mode, clock free running */
>  	sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_MODE | MSDC_CFG_CKPDN);
>  
> @@ -2273,6 +2281,11 @@ static int msdc_drv_probe(struct platform_device *pdev)
>  	if (IS_ERR(host->src_clk_cg))
>  		host->src_clk_cg = NULL;
>  
> +	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> +								"hrst");
> +	if (IS_ERR(host->reset))
> +		return PTR_ERR(host->reset);
> +
>  	host->irq = platform_get_irq(pdev, 0);
>  	if (host->irq < 0) {
>  		ret = -EINVAL;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
