Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C929EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akC502RQvaU6TEnXcX47OeDUpZp3H+/CA9TM8Kz77aI=; b=skvHiUr3Yu3MQsGr2O5Arl58K0
	ocz9gLtb+8J4dxWYteleHyYMdttkwtq4wEImdDLqWyyTBoHUnRm9p9kbAB34EmiqlTOZ2qjY5hNxL
	drWgGHJ+BV2Vsi/kLxhu/l1KMVzH+H+lHcRlUMqa8OD3s8p3BnNj+AVbGMQB8pYrmLKX+8Cq1deN7
	1Cp+jrdy0VfhVXekr9x75i6Xcjy4m6H568R7Ts3kubwrKp2uHqC3qQsyO5K2f+U3xuptDdIJ1Q6P3
	Zm2VaTvG7EruS6+uJLmbkOx3EO/9Wn2Bm/VM6Ij+jmZ9rwjUxKZx1gx8M4SP9YwU+m6/i5Q6018sL
	rWuYEoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmM4-001l9a-1U;
	Thu, 13 Jul 2023 02:46:56 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmM1-001l8Q-2H;
	Thu, 13 Jul 2023 02:46:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qJmLp-0005gV-2Y;
	Thu, 13 Jul 2023 02:46:42 +0000
Date: Thu, 13 Jul 2023 03:46:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] wifi: mt76: split get_of_eeprom in subfunction
Message-ID: <ZK9lhgH_sNmX3hWb@makrotopia.org>
References: <20230708182936.24469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230708182936.24469-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_194653_756533_B6F0A4AF 
X-CRM114-Status: GOOD (  20.05  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 08, 2023 at 08:29:35PM +0200, Christian Marangi wrote:
> In preparation for NVMEM support, split get_of_eeprom() in subfunction
> to tidy the code and facilitate the addition of alternative method to
> get eeprom data. No behaviour change intended.
> 
> While at it also drop OF ifdef checks as OF have stubs and calling
> of_get_property would result in the same error returned.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 51 ++++++++++++++-------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index dce851d42e08..c3a762074be8 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -9,31 +9,35 @@
>  #include <linux/etherdevice.h>
>  #include "mt76.h"
>  
> -int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
> +static int mt76_get_of_eeprom_data(struct mt76_dev *dev, void *eep, int len)
>  {
> -#if defined(CONFIG_OF) && defined(CONFIG_MTD)
>  	struct device_node *np = dev->dev->of_node;
> -	struct mtd_info *mtd;
> -	const __be32 *list;
>  	const void *data;
> -	const char *part;
> -	phandle phandle;
>  	int size;
> -	size_t retlen;
> -	int ret;
>  
> -	if (!np)
> +	data = of_get_property(np, "mediatek,eeprom-data", &size);
> +	if (!data)
>  		return -ENOENT;
>  
> -	data = of_get_property(np, "mediatek,eeprom-data", &size);
> -	if (data) {
> -		if (size > len)
> -			return -EINVAL;
> +	if (size > len)
> +		return -EINVAL;
>  
> -		memcpy(eep, data, size);
> +	memcpy(eep, data, size);
>  
> -		return 0;
> -	}
> +	return 0;
> +}
> +
> +static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len)
> +{
> +#ifdef CONFIG_MTD
> +	struct device_node *np = dev->dev->of_node;
> +	struct mtd_info *mtd;
> +	const __be32 *list;
> +	const char *part;
> +	phandle phandle;
> +	size_t retlen;
> +	int size;
> +	int ret;
>  
>  	list = of_get_property(np, "mediatek,mtd-eeprom", &size);
>  	if (!list)
> @@ -100,6 +104,21 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
>  	return -ENOENT;
>  #endif
>  }
> +
> +int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
> +{
> +	struct device_node *np = dev->dev->of_node;
> +	int ret;
> +
> +	if (!np)
> +		return -ENOENT;
> +
> +	ret = mt76_get_of_eeprom_data(dev, eep, len);
> +	if (!ret)
> +		return 0;
> +
> +	return mt76_get_of_epprom_from_mtd(dev, eep, offset, len);
> +}
>  EXPORT_SYMBOL_GPL(mt76_get_of_eeprom);
>  
>  void
> -- 
> 2.40.1
> 
> 

