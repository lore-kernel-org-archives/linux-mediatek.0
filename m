Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733BEEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 02:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rWU+ZPrm2OiRoZjnOo945fPKQuhUzt9X8yVzh/WTrg=; b=1oqtd7+Dimj6HC+9lsqKzwTZni
	AqNqg5046pH7G9QJbnu677+LqetQDEVfkBb8NT6lVTWW0F72ugMrkRzK2pJhLj4yE+lq92++iSvTH
	QZnjAytw5godjVJqDW86ay1h2xSNS29Q3tJy8VNoY8T/5Mll3TYFqhi6PoEgfs0y272mcoYu/l52Y
	0yo3U/rEIsGzgail1BiGYcsegoSD4LhwkTY4ugeTP6BjKvRMgrwxp/Kum7EUSC/+gHHa30/SS5g1V
	eTrba63i7OhCmFoQkTUS6oHbCoqBAJblRdr+ugnV/7+jeXsNxk57FADYtBSVvXjxOBJkIEHWmgmCf
	g4VpE7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmMg-001lFf-1J;
	Thu, 13 Jul 2023 02:47:34 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmMd-001lEH-2D;
	Thu, 13 Jul 2023 02:47:32 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qJmMS-0005h4-3D;
	Thu, 13 Jul 2023 02:47:22 +0000
Date: Thu, 13 Jul 2023 03:47:08 +0100
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
Subject: Re: [PATCH 2/2] wifi: mt76: add support for providing eeprom in
 nvmem cells
Message-ID: <ZK9lrJMD8mqHdWrH@makrotopia.org>
References: <20230708182936.24469-1-ansuelsmth@gmail.com>
 <20230708182936.24469-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230708182936.24469-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_194731_723680_3DB192F3 
X-CRM114-Status: GOOD (  20.34  )
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

On Sat, Jul 08, 2023 at 08:29:36PM +0200, Christian Marangi wrote:
> Add support for providing eeprom in nvmem cells by adding nvmem cell as
> an alternative source for mt76_get_of_eeprom().
> 
> Nvmem cells will follow standard nvmem cell definition and needs to be
> called 'eeprom' to be correctly identified.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 38 ++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index c3a762074be8..36564930aef1 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_net.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/etherdevice.h>
>  #include "mt76.h"
>  
> @@ -105,6 +106,37 @@ static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offs
>  #endif
>  }
>  
> +static int mt76_get_of_epprom_from_nvmem(struct mt76_dev *dev, void *eep, int len)
> +{
> +	struct device_node *np = dev->dev->of_node;
> +	struct nvmem_cell *cell;
> +	const void *data;
> +	size_t retlen;
> +	int ret = 0;
> +
> +	cell = of_nvmem_cell_get(np, "eeprom");
> +	if (IS_ERR(cell))
> +		return PTR_ERR(cell);
> +
> +	data = nvmem_cell_read(cell, &retlen);
> +	nvmem_cell_put(cell);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	if (retlen < len) {
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	memcpy(eep, data, len);
> +
> +exit:
> +	kfree(data);
> +
> +	return ret;
> +}
> +
>  int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
>  {
>  	struct device_node *np = dev->dev->of_node;
> @@ -117,7 +149,11 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
>  	if (!ret)
>  		return 0;
>  
> -	return mt76_get_of_epprom_from_mtd(dev, eep, offset, len);
> +	ret = mt76_get_of_epprom_from_mtd(dev, eep, offset, len);
> +	if (!ret)
> +		return 0;
> +
> +	return mt76_get_of_epprom_from_nvmem(dev, eep, len);
>  }
>  EXPORT_SYMBOL_GPL(mt76_get_of_eeprom);
>  
> -- 
> 2.40.1
> 
> 

