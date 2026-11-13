Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F7A606A33A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e+h/9KC8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UVgpn0Wz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cjhG7Bzi1tsnaOBL0/3qmbPStuw8rhrR+V7LVA+Ywdw=; b=e+h/9KC8mQXIa41Mu2pDs4FZdY
	17mXK/kgvmTIT45aAKwLasuLuxhbn7go7sNTb+LSLoPS+Qk0U0XxNwdQi/I/XTnRrrAV6iC9bM4qz
	GHni1ME+h0axQIquQ+SkG/T1RnieWNQf0PT2y/On9F+5vCanbWVaZA7qVwsFXhhRympg4GmNapUpt
	MNjMaHh5tL2GICIbHghwRbmXDYwRKXaT4sqSbF2VgsxxkJBTnZ0F9Gn8F1Mh9pAYh6PTdG82L25V2
	BeUc2TAtx4zKZ1XojFBPRn3A/rkaNNLNeVD2Vkc+/uIuwMoD1QqlRi/j1ccCPPLJkvesYsXm3Q6Ch
	04/f7FRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwMS-0000000E0Ei-3P1F;
	Fri, 13 Nov 2026 18:50:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwMR-0000000E0Dx-25dw;
	Fri, 13 Nov 2026 18:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A08DE60D25;
	Fri, 13 Nov 2026 18:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342F01F000C4;
	Fri, 13 Nov 2026 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794595854;
	bh=cjhG7Bzi1tsnaOBL0/3qmbPStuw8rhrR+V7LVA+Ywdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UVgpn0WzoFhIdaDcho/bQqb7ril090RQfOnX/VijF+DvoHH0Y72fNWgWhmJ4EvAR8
	 4zB5sg31cdpBewBdyn8bfzlTgTH/KOEF1QRjM1XOD9FCg6KNRBbJtdE6+Cqo1mWjbX
	 38lAMLpT3Yt7J5idBo0tzpGbZ1p+khrdFloyuFRdEzDKcG/Zp0OOqgVzxtsX0tLy1/
	 zG7WTraWKezTiSqkqkGEI2tiSXS3SH7bYP67wneO48jTvX5X9m8nmo5z4EmSXyuf/b
	 ko6fK5PwhpOf2QGvdms7NSFTthaukAKDvXokMjw8kmpKkedd0qmWApWV0S+Xrm97UK
	 afrnnnALFIbvQ==
Date: Fri, 13 Nov 2026 18:50:47 +0000
From: Lee Jones <lee@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-pm@vger.kernel.org, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
Message-ID: <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026, Ryan Brue wrote:

> The RTC's 32 kHz output is gated by RTC_CON.F32KOB, which the vendor
> kernel clears before it powers the Wi-Fi/Bluetooth combo chip. Mainline
> never touches it, so on a board whose bootloader leaves it set, such a
> chip has no sleep clock and does not come up.
> 
> Register the output as a clock when the RTC node has #clock-cells, so
> the chip's power sequence can enable it.
> 
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
>  drivers/rtc/rtc-mt6397.c       | 85 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/rtc.h |  6 +++
>  2 files changed, 91 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index d6e156516aa6..5130fecffa7b 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/array_size.h>
>  #include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/mt6397/core.h>
> @@ -317,6 +318,84 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
>  	return ret;
>  }
>  
> +#ifdef CONFIG_COMMON_CLK
> +static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
> +{
> +	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
> +	int ret;
> +
> +	mutex_lock(&rtc->lock);
> +	ret = regmap_update_bits(rtc->regmap, rtc->addr_base + rtc->data->con,
> +				 RTC_CON_F32KOB, on ? 0 : RTC_CON_F32KOB);
> +	if (!ret)
> +		ret = mtk_rtc_write_trigger(rtc);
> +	mutex_unlock(&rtc->lock);
> +
> +	return ret;
> +}
> +
> +static int mtk_rtc_clkout_prepare(struct clk_hw *hw)
> +{
> +	return mtk_rtc_clkout_set(hw, true);
> +}
> +
> +static void mtk_rtc_clkout_unprepare(struct clk_hw *hw)
> +{
> +	mtk_rtc_clkout_set(hw, false);
> +}
> +
> +static int mtk_rtc_clkout_is_prepared(struct clk_hw *hw)
> +{
> +	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
> +	u32 con;
> +
> +	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->con, &con))
> +		return 0;
> +
> +	return !(con & RTC_CON_F32KOB);
> +}
> +
> +static unsigned long mtk_rtc_clkout_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	return 32768;
> +}
> +
> +static const struct clk_ops mtk_rtc_clkout_ops = {
> +	.prepare = mtk_rtc_clkout_prepare,
> +	.unprepare = mtk_rtc_clkout_unprepare,
> +	.is_prepared = mtk_rtc_clkout_is_prepared,
> +	.recalc_rate = mtk_rtc_clkout_recalc_rate,
> +};
> +
> +/* The 32 kHz output the PMIC drives to other chips, such as a combo chip */
> +static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
> +{
> +	struct clk_init_data init = {
> +		.name = "mt6397-rtc-32k",
> +		.ops = &mtk_rtc_clkout_ops,
> +	};
> +	int ret;
> +
> +	if (!rtc->data->con || !of_property_present(dev->of_node, "#clock-cells"))
> +		return 0;
> +
> +	rtc->clkout.init = &init;
> +
> +	ret = devm_clk_hw_register(dev, &rtc->clkout);
> +	if (ret)
> +		return ret;
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
> +					   &rtc->clkout);
> +}
> +#else
> +static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
> +{
> +	return 0;
> +}
> +#endif
> +
>  static int mtk_rtc_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -380,6 +459,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to register the 32k clock\n");
> +
>  	nvmem_cfg.priv = rtc;
>  
>  	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
> @@ -416,6 +500,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
>  
>  static const struct mtk_rtc_data mt6397_rtc_data = {
>  	.wrtgr = RTC_WRTGR_MT6397,
> +	.con = RTC_CON_MT6397,
>  };
>  
>  static const struct of_device_id mt6397_rtc_of_match[] = {
> diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
> index f4da579ec638..a8130d726c59 100644
> --- a/include/linux/mfd/mt6397/rtc.h
> +++ b/include/linux/mfd/mt6397/rtc.h
> @@ -9,6 +9,7 @@
>  #ifndef _LINUX_MFD_MT6397_RTC_H_
>  #define _LINUX_MFD_MT6397_RTC_H_
>  
> +#include <linux/clk-provider.h>
>  #include <linux/jiffies.h>
>  #include <linux/mutex.h>
>  #include <linux/regmap.h>
> @@ -22,6 +23,9 @@
>  #define RTC_WRTGR_MT6397       0x003c
>  #define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
>  
> +#define RTC_CON_MT6397         0x003e
> +#define RTC_CON_F32KOB         BIT(5)
> +
>  #define RTC_IRQ_STA            0x0002
>  #define RTC_IRQ_STA_AL         BIT(0)
>  #define RTC_IRQ_STA_LP         BIT(3)
> @@ -72,6 +76,7 @@
>  
>  struct mtk_rtc_data {
>  	u32                     wrtgr;
> +	u32                     con;

These are terrible variable names.

The nomenclature should be self-describing.

>  };
>  
>  struct mt6397_rtc {
> @@ -83,6 +88,7 @@ struct mt6397_rtc {
>  	int                     irq;
>  	u32                     addr_base;
>  	const struct mtk_rtc_data *data;
> +	struct clk_hw           clkout;
>  };
>  
>  #endif /* _LINUX_MFD_MT6397_RTC_H_ */
> 
> -- 
> 2.55.0
> 

-- 
Lee Jones

