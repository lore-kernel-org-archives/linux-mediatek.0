Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DFAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBAk5T/rpgRnK8v/uNcnHxF2e06+vQ6ySSMj5qwrFzo=; b=kp/QHDRNRENuN0m/sYn8PhEkt8
	avZ2jEZFczDKQCJ58/0r4K98DlDHfI1B9o5CyYJShHmVL9oqDBASpJF23qnvHlhlOC75s0/fPAf/6
	6SnhbTwr5Zh4aW8JF4H197v4kpAOdOQ4G1OwS4WZVNxiuyIixttRm2KG/UK38fDov5LIUsPO9Ztde
	5Q7TvBqodvvKPDVCZ8B2JF66ieEr+eoS8t56cGnFne9lE1ERmGowN08Kgo4j/MriBMRXtzB97HEhx
	2Kq6LOUWzVToSUhtq7eZdO7eMcppuQd0L88dxk3/47Ml3sUyAnqlBzX5Pk4S9qD6ZyEnKUz2j5Wq8
	haxWZU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4gz9-00B7eR-GQ; Tue, 04 Jan 2022 10:24:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4gyx-00B7ac-5O; Tue, 04 Jan 2022 10:23:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E76831F4187E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641291833;
 bh=SaZEt38O25zeTTGlpimhN0QCyLQv6zCIHKxNVv3vt5w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fgyrQp1j8PEjCWV9ysz/CWKd3qIB3QGILpaIni5ejfh51ikLtvKvkA+1Cx8cHbzG6
 N2j5vVX+z3JpyOPtuUh6dqmqo6VI2l3xrCAeF01yCjARyzC3FQzuPzrtTy6xX2zHZt
 rX/2BX1GnzuL47LQmNsgspmwwiouYkLCcW9lBfaJW9y5N/IAKyxVHUQYAlrWbzuMkB
 GMeu1PG3ee6YsCGxa2Y8Kre4TfzZiuieDMqkoZAFeVYKH7H/lie68RLp6WYcalVLrs
 cZ2jdwxn6npHjIY7sC+VaqD4WKxQeEiIwJ43S4/r75wj/jMwgxqWuMror3qNiWuO63
 DH0FbIHvYsopg==
Subject: Re: [PATCH v1 2/3] mmc: core: Add support for SDIO async interrupt
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211227083641.12538-1-axe.yang@mediatek.com>
 <20211227083641.12538-3-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <a0eec26b-0148-a208-be67-888766b88137@collabora.com>
Date: Tue, 4 Jan 2022 11:23:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211227083641.12538-3-axe.yang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_022355_514940_FFA43578 
X-CRM114-Status: GOOD (  26.17  )
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

Il 27/12/21 09:36, Axe Yang ha scritto:
> If cap-sdio-async-int flag is set in host dts node, parse EAI
> information from SDIO CCCR interrupt externsion segment. If async
> interrupt is supported by SDIO card then send command to card to
> enable it and set enable_async_int flag in sdio_cccr structure to 1.
> The parse flow is implemented in sdio_read_cccr().
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/mmc/core/host.c  |  2 ++
>   drivers/mmc/core/sdio.c  | 17 +++++++++++++++++
>   include/linux/mmc/card.h |  3 ++-
>   include/linux/mmc/host.h |  1 +
>   include/linux/mmc/sdio.h |  5 +++++
>   5 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index d4683b1d263f..7ad60fab099a 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -401,6 +401,8 @@ int mmc_of_parse(struct mmc_host *host)
>   	if (device_property_read_bool(dev, "no-mmc-hs400"))
>   		host->caps2 &= ~(MMC_CAP2_HS400_1_8V | MMC_CAP2_HS400_1_2V |
>   				 MMC_CAP2_HS400_ES);
> +	if (device_property_read_bool(dev, "cap-sdio-async-int"))
> +		host->caps2 |= MMC_CAP2_SDIO_ASYNC_INT;
>   
>   	/* Must be after "non-removable" check */
>   	if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
> diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> index 68edf7a615be..335e4ada733a 100644
> --- a/drivers/mmc/core/sdio.c
> +++ b/drivers/mmc/core/sdio.c
> @@ -225,6 +225,23 @@ static int sdio_read_cccr(struct mmc_card *card, u32 ocr)
>   				card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_C;
>   			if (data & SDIO_DRIVE_SDTD)
>   				card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_D;
> +
> +			if (card->host->caps2 & MMC_CAP2_SDIO_ASYNC_INT) {
> +				ret = mmc_io_rw_direct(card, 0, 0, SDIO_CCCR_INTERRUPT_EXT, 0,
> +						       &data);
> +				if (ret)
> +					goto out;
> +
> +				if (data & SDIO_INTERRUPT_EXT_SAI) {
> +					data |= SDIO_INTERRUPT_EXT_EAI;
> +					ret = mmc_io_rw_direct(card, 1, 0, SDIO_CCCR_INTERRUPT_EXT,
> +							       data, NULL);
> +					if (ret)
> +						goto out;
> +
> +					card->cccr.enable_async_int = 1;
> +				}
> +			}
>   		}
>   
>   		/* if no uhs mode ensure we check for high speed */
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index 37f975875102..b0deb8ca8eeb 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -219,7 +219,8 @@ struct sdio_cccr {
>   				wide_bus:1,
>   				high_power:1,
>   				high_speed:1,
> -				disable_cd:1;
> +				disable_cd:1,
> +				enable_async_int:1;
>   };
>   
>   struct sdio_cis {
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 0c0c9a0fdf57..60c8ebe1a5e8 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -399,6 +399,7 @@ struct mmc_host {
>   #define MMC_CAP2_CRYPTO		0
>   #endif
>   #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
> +#define MMC_CAP2_SDIO_ASYNC_INT	(1 << 29)	/* SDIO host supports asynchronous interrupt */
>   
>   	int			fixed_drv_type;	/* fixed driver type for non-removable media */
>   
> diff --git a/include/linux/mmc/sdio.h b/include/linux/mmc/sdio.h
> index 2a05d1ac4f0e..1ef400f28642 100644
> --- a/include/linux/mmc/sdio.h
> +++ b/include/linux/mmc/sdio.h
> @@ -159,6 +159,11 @@
>   #define  SDIO_DTSx_SET_TYPE_A	(1 << SDIO_DRIVE_DTSx_SHIFT)
>   #define  SDIO_DTSx_SET_TYPE_C	(2 << SDIO_DRIVE_DTSx_SHIFT)
>   #define  SDIO_DTSx_SET_TYPE_D	(3 << SDIO_DRIVE_DTSx_SHIFT)
> +
> +#define SDIO_CCCR_INTERRUPT_EXT	0x16
> +#define SDIO_INTERRUPT_EXT_SAI	(1 << 0)
> +#define SDIO_INTERRUPT_EXT_EAI	(1 << 1)
> +
>   /*
>    * Function Basic Registers (FBR)
>    */
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
