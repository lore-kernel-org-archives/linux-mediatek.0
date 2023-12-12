Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A55C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjj8H82wdIWX8iuGwWZ52IpH6iVTqwTn08QKods/alY=; b=0M+R5HhKHyLb7HwLbSJFsdQnWB
	ytASL7dYiduo4oZ2wh4x5v6jTHC2aWyt3yHMv5bOaMmDrJgNIBMrxIl0bj3Y5F36kdA370zEe0TNq
	w3dytb3osxLz3OLSpnGJqHktpOLM2QpthboLo0pMaveaC7fEKel8z7zzak84mGE1K3imhLjnJjmV8
	0oYLvN7cuvGZSurWYMVz3GjBj5y+yVvtNJdq+o0IPfXsBXdGv0ZuZoQAkLb9DKcF353xWUjTSkB3O
	6H9CiJqgy58MbUtcbBBmqrf7n3xCh4YPWA1uPfqSGcxkMwCFfhb3YARwSH3LQ0zxr81eS9DtlgRaz
	aowMn7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz5S-00BCVZ-1B;
	Tue, 12 Dec 2023 09:29:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz5O-00BCUV-1V;
	Tue, 12 Dec 2023 09:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6E032B812AC;
	Tue, 12 Dec 2023 09:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4285AC433CD;
	Tue, 12 Dec 2023 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702373391;
	bh=Ps5ITAFrTNffoKTbdr5QWix/U8BhTCkdC1mM+gT+YJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTwITWbTYw+hFrcKSU3lB/55PJAIeDlBwfdMAWXVb/y6soQ69TLBM42ivf9bSP61/
	 R/2niqeeprQVU6NLmXITbpY9eS/JpgW1zsPoS4SG1fSmsC/0Fx9LMXlymYxJlMXz9y
	 6OhCKlYRORSWgUC4hCAh/aw78kN2m5MKCnsf54M/4lBwDZ8TXb8FVT3CLwkqUiMphP
	 mL5etSzSNlD441R1skIQaiyo6poo9e+C8YEX4NvK2ySPADWZ/cfvMtDvoxKHBoQlwo
	 72FKMoZ4nh8sdbgr7/FsUIsE/i4Pw/mCfwcFlrn9pi5S6ZS9EQAzA62QbShepCunV+
	 WsDZ8mMuVzHaw==
Date: Tue, 12 Dec 2023 09:29:43 +0000
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH net-next v3 5/8] net: pcs: add driver for MediaTek
 USXGMII PCS
Message-ID: <20231212092943.GS5817@kernel.org>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <07845ec900ba41ff992875dce12c622277592c32.1702352117.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07845ec900ba41ff992875dce12c622277592c32.1702352117.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_012954_815812_9F4D14D2 
X-CRM114-Status: GOOD (  20.18  )
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

On Tue, Dec 12, 2023 at 03:47:47AM +0000, Daniel Golle wrote:
> Add driver for USXGMII PCS found in the MediaTek MT7988 SoC and supporting
> USXGMII, 10GBase-R and 5GBase-R interface modes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Hi Daniel,

some minor feedback from my side.

...

> diff --git a/drivers/net/pcs/pcs-mtk-usxgmii.c b/drivers/net/pcs/pcs-mtk-usxgmii.c

...

> +static int mtk_usxgmii_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
> +				  phy_interface_t interface,
> +				  const unsigned long *advertising,
> +				  bool permit_pause_to_mac)
> +{
> +	struct mtk_usxgmii_pcs *mpcs = pcs_to_mtk_usxgmii_pcs(pcs);
> +	unsigned int an_ctrl = 0, link_timer = 0, xfi_mode = 0, adapt_mode = 0;
> +	bool mode_changed = false;

nit: please consider arranging local variables in networking code
     in reverse xmas tree order - longest line to shortest.

     This may be useful:
     https://github.com/ecree-solarflare/xmastree

...
> diff --git a/include/linux/pcs/pcs-mtk-usxgmii.h b/include/linux/pcs/pcs-mtk-usxgmii.h
> new file mode 100644
> index 0000000000000..ef936d9c5f116
> --- /dev/null
> +++ b/include/linux/pcs/pcs-mtk-usxgmii.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_PCS_MTK_USXGMII_H
> +#define __LINUX_PCS_MTK_USXGMII_H
> +
> +#include <linux/phylink.h>
> +
> +/**
> + * mtk_usxgmii_select_pcs() - Get MediaTek PCS instance
> + * @np:		Pointer to device node indentifying a MediaTek USXGMII PCS

nit: identifying

     ./scripts/checkpatch.py --codespell is your friend here.

> + * @mode:	Ethernet PHY interface mode
> + *
> + * Return PCS identified by a device node and the PHY interface mode in use
> + *
> + * Return:	Pointer to phylink PCS instance of NULL
> + */
> +#if IS_ENABLED(CONFIG_PCS_MTK_USXGMII)
> +struct phylink_pcs *mtk_usxgmii_pcs_get(struct device *dev, struct device_node *np);

nit: The kernel doc above does not match the signature
     of mtk_usxgmii_pcs_get().

     ./scripts/kernel-doc -none is helpful here.

> +void mtk_usxgmii_pcs_put(struct phylink_pcs *pcs);
> +#else
> +static inline struct phylink_pcs *mtk_usxgmii_pcs_get(struct device *dev, struct device_node *np)
> +{
> +	return NULL;
> +}
> +static inline void mtk_usxgmii_pcs_put(struct phylink_pcs *pcs) { }
> +#endif /* IS_ENABLED(CONFIG_PCS_MTK_USXGMII) */
> +
> +#endif /* __LINUX_PCS_MTK_USXGMII_H */
> -- 
> 2.43.0

