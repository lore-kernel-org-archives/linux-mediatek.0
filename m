Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6511C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 04:45:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85D0761139
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 04:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85D0761139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3L7tOIS4HM/TZPEac87iNK0NDsopeyU3ewU/Fwshkz8=; b=k3K/egJmpZRiyU2gk2ehWVnwKc
	6rRpkz4dyYsTsylbv4O+iNFLnC069Y6LfaO8n32LX5YxqujNc8gn1lC11DG0rfMAhk6H7cZKwLEjd
	1ClUNRRpwYxbX0Qh0HimKfViFPYh8rEoAdF+qs+KX3Bomz98h8KKIr331JYhpH6z8q/V5K7J6GLD3
	0KsM0FMLaEu4k9v+rlJzmb8l0aCb1zNzX7UvyTpVUDqES1XhVSKrUORq0Jkzm43jYxgVjAoHikQRp
	dyibo1gPESMYA02NbcCOFnJkmZdH6f8z0dR+t6ckyWKbhcz7kjz6RDUR6HR3eW8eTrQWYmOXuMnRE
	+8IO519g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV4zu-005YLq-MP; Tue, 28 Sep 2021 04:45:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV4zg-005YKP-A2; Tue, 28 Sep 2021 04:45:30 +0000
Received: from [IPv6:2003:cb:8708:6596:1837:e564:ef50:8d67]
 (p200300cb870865961837e564ef508d67.dip0.t-ipconnect.de
 [IPv6:2003:cb:8708:6596:1837:e564:ef50:8d67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EA17F1F41CB0;
 Tue, 28 Sep 2021 05:45:23 +0100 (BST)
Subject: Re: [PATCH v3 2/2] spi: modify set_cs_timing parameter
To: Mason Zhang <Mason.Zhang@mediatek.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
References: <20210804133746.6742-1-Mason.Zhang@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e5691349-60df-935f-1a1a-02eef0568c05@collabora.com>
Date: Tue, 28 Sep 2021 06:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210804133746.6742-1-Mason.Zhang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_214528_677873_4B51E2BB 
X-CRM114-Status: GOOD (  30.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 04.08.21 15:37, Mason Zhang wrote:
> This patch modified set_cs_timing parameter, no need pass in spi_delay
> to set_cs_timing callback.
> By the way, we modified the mediatek and tegra114 spi driver to fix build err.
> In mediatek spi driver, We have support set absolute time not clk_count,
> and call this function in prepare_message not user's API.
> 


Hi,
that patch cause a regression on mt8173 elm device, it produces the errors:

cros-ec-i2c-tunnel 1100a000.spi:ec@0:i2c-tunnel0: Error transferring EC i2c message -71
cros-ec-spi spi0.0: EC failed to respond in time.

Could you please write on which mediatek platform it was tested and why is it needed?


> Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> ---
>   drivers/spi/spi-mt65xx.c   | 107 +++++++++++++++++++++----------------
>   drivers/spi/spi-tegra114.c |   8 +--
>   include/linux/spi/spi.h    |   3 +-
>   3 files changed, 66 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 6f2925118b98..bb09592bc009 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -208,6 +208,65 @@ static void mtk_spi_reset(struct mtk_spi *mdata)
>   	writel(reg_val, mdata->base + SPI_CMD_REG);
>   }
>   
> +static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
> +{
> +	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
> +	struct spi_delay *cs_setup = &spi->cs_setup;
> +	struct spi_delay *cs_hold = &spi->cs_hold;
> +	struct spi_delay *cs_inactive = &spi->cs_inactive;

I don't see where those 3 values are ever set


Thanks,
Dafna

> +	u16 setup, hold, inactive;
> +	u32 reg_val;
> +	int delay;
> +
> +	delay = spi_delay_to_ns(cs_setup, NULL);
> +	if (delay < 0)
> +		return delay;
> +	setup = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
> +
> +	delay = spi_delay_to_ns(cs_hold, NULL);
> +	if (delay < 0)
> +		return delay;
> +	hold = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
> +
> +	delay = spi_delay_to_ns(cs_inactive, NULL);
> +	if (delay < 0)
> +		return delay;
> +	inactive = (delay * DIV_ROUND_UP(mdata->spi_clk_hz, 1000000)) / 1000;
> +
> +	setup    = setup ? setup : 1;
> +	hold     = hold ? hold : 1;
> +	inactive = inactive ? inactive : 1;
> +
> +	reg_val = readl(mdata->base + SPI_CFG0_REG);
> +	if (mdata->dev_comp->enhance_timing) {
> +		hold = min(hold, 0xffff);
> +		setup = min(setup, 0xffff);
> +		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
> +		reg_val |= (((hold - 1) & 0xffff)
> +			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
> +		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
> +		reg_val |= (((setup - 1) & 0xffff)
> +			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
> +	} else {
> +		hold = min(hold, 0xff);
> +		setup = min(setup, 0xff);
> +		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
> +		reg_val |= (((hold - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
> +		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
> +		reg_val |= (((setup - 1) & 0xff)
> +			    << SPI_CFG0_CS_SETUP_OFFSET);
> +	}
> +	writel(reg_val, mdata->base + SPI_CFG0_REG);
> +
> +	inactive = min(inactive, 0xff);
> +	reg_val = readl(mdata->base + SPI_CFG1_REG);
> +	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
> +	reg_val |= (((inactive - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
> +	writel(reg_val, mdata->base + SPI_CFG1_REG);
> +
> +	return 0;
> +}
> +
>   static int mtk_spi_prepare_message(struct spi_master *master,
>   				   struct spi_message *msg)
>   {
> @@ -284,6 +343,8 @@ static int mtk_spi_prepare_message(struct spi_master *master,
>   		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
>   	writel(reg_val, mdata->base + SPI_CFG1_REG);
>   
> +	/* set hw cs timing */
> +	mtk_spi_set_hw_cs_timing(spi);
>   	return 0;
>   }
>   
> @@ -528,52 +589,6 @@ static bool mtk_spi_can_dma(struct spi_master *master,
>   		(unsigned long)xfer->rx_buf % 4 == 0);
>   }
>   
> -static int mtk_spi_set_hw_cs_timing(struct spi_device *spi,
> -				    struct spi_delay *setup,
> -				    struct spi_delay *hold,
> -				    struct spi_delay *inactive)
> -{
> -	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
> -	u16 setup_dly, hold_dly, inactive_dly;
> -	u32 reg_val;
> -
> -	if ((setup && setup->unit != SPI_DELAY_UNIT_SCK) ||
> -	    (hold && hold->unit != SPI_DELAY_UNIT_SCK) ||
> -	    (inactive && inactive->unit != SPI_DELAY_UNIT_SCK)) {
> -		dev_err(&spi->dev,
> -			"Invalid delay unit, should be SPI_DELAY_UNIT_SCK\n");
> -		return -EINVAL;
> -	}
> -
> -	setup_dly = setup ? setup->value : 1;
> -	hold_dly = hold ? hold->value : 1;
> -	inactive_dly = inactive ? inactive->value : 1;
> -
> -	reg_val = readl(mdata->base + SPI_CFG0_REG);
> -	if (mdata->dev_comp->enhance_timing) {
> -		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
> -		reg_val |= (((hold_dly - 1) & 0xffff)
> -			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
> -		reg_val &= ~(0xffff << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
> -		reg_val |= (((setup_dly - 1) & 0xffff)
> -			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
> -	} else {
> -		reg_val &= ~(0xff << SPI_CFG0_CS_HOLD_OFFSET);
> -		reg_val |= (((hold_dly - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
> -		reg_val &= ~(0xff << SPI_CFG0_CS_SETUP_OFFSET);
> -		reg_val |= (((setup_dly - 1) & 0xff)
> -			    << SPI_CFG0_CS_SETUP_OFFSET);
> -	}
> -	writel(reg_val, mdata->base + SPI_CFG0_REG);
> -
> -	reg_val = readl(mdata->base + SPI_CFG1_REG);
> -	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
> -	reg_val |= (((inactive_dly - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
> -	writel(reg_val, mdata->base + SPI_CFG1_REG);
> -
> -	return 0;
> -}
> -
>   static int mtk_spi_setup(struct spi_device *spi)
>   {
>   	struct mtk_spi *mdata = spi_master_get_devdata(spi->master);
> diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
> index 5131141bbf0d..e9de1d958bbd 100644
> --- a/drivers/spi/spi-tegra114.c
> +++ b/drivers/spi/spi-tegra114.c
> @@ -717,12 +717,12 @@ static void tegra_spi_deinit_dma_param(struct tegra_spi_data *tspi,
>   	dma_release_channel(dma_chan);
>   }
>   
> -static int tegra_spi_set_hw_cs_timing(struct spi_device *spi,
> -				      struct spi_delay *setup,
> -				      struct spi_delay *hold,
> -				      struct spi_delay *inactive)
> +static int tegra_spi_set_hw_cs_timing(struct spi_device *spi)
>   {
>   	struct tegra_spi_data *tspi = spi_master_get_devdata(spi->master);
> +	struct spi_delay *setup = &spi->cs_setup;
> +	struct spi_delay *hold = &spi->cs_hold;
> +	struct spi_delay *inactive = &spi->cs_inactive;
>   	u8 setup_dly, hold_dly, inactive_dly;
>   	u32 setup_hold;
>   	u32 spi_cs_timing;
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 651e19ba3415..fe027efb85c2 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -553,8 +553,7 @@ struct spi_controller {
>   	 * to configure specific CS timing through spi_set_cs_timing() after
>   	 * spi_setup().
>   	 */
> -	int (*set_cs_timing)(struct spi_device *spi, struct spi_delay *setup,
> -			     struct spi_delay *hold, struct spi_delay *inactive);
> +	int (*set_cs_timing)(struct spi_device *spi);
>   
>   	/* bidirectional bulk transfers
>   	 *
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
