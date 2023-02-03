Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CE0C05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 14:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIdkNxO2PeXN7NX9iwQvrkcNhH067wYy3ILLQ43S/uM=; b=VGVdUc1ByYjVHmm6NdS6XntPXR
	fUxsF7qzSkzslfLUYGqwVrWivc5NxLEP6m/Snq+FopXwOBqstHttyf4IPKo9Y5V5IrlfaLO/zhtYx
	vfoQDuxwT9Yvw4Dw1z1o4j2jAI1smPmG+84x2Ag+E/PeODLe2uIJAyqyiN3V5/Kz0PYyqqP2khwbX
	Rpc0RLnB9jDwheSkHB10uOnH8MSW0WIvz3UUbsdOQyVOnQamXjwhGUBBYKbzQTLErbY7AVBNSl7Ec
	2O3KbCUpL7gmYEmMMfJIfGUMCK+c7ZW2NZe3wpe+t54+z6kdXG+lkYiKTzfFp/lv7fWZ5dZ4rH9Fl
	OZx9UMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx1k-002PrD-Ma; Fri, 03 Feb 2023 14:26:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwpk-002JnC-JQ; Fri, 03 Feb 2023 14:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mIdkNxO2PeXN7NX9iwQvrkcNhH067wYy3ILLQ43S/uM=; b=QZobhosZ4yaMophkOzFpD7hj7p
	OqAIkeCRiLM7CaRAuQlph4lwXS0Vv7DPUNg9O3LMXeQd+AkYkF8vooNbv5inpAEpBOH7a71W+TSvp
	R79YAm9vlFdHaQfINpolWtu7r+aB0Ozq0sgJmqGVe8nMfmvf8fPzzrqJPM/NhL7+fGew=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pNwph-0040Y3-40; Fri, 03 Feb 2023 15:14:29 +0100
Date: Fri, 3 Feb 2023 15:14:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 7/9] net: pcs: add driver for MediaTek SGMII PCS
Message-ID: <Y90Wxb8iuCRo06yr@lunn.ch>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <30f3ff512a2082ba4cf58bf6098f2ed776051976.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30f3ff512a2082ba4cf58bf6098f2ed776051976.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_061432_720364_4CE8B070 
X-CRM114-Status: GOOD (  11.09  )
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

> index 6e7e6c346a3e..cf65646656e9 100644
> --- a/drivers/net/pcs/Kconfig
> +++ b/drivers/net/pcs/Kconfig
> @@ -18,6 +18,12 @@ config PCS_LYNX
>  	  This module provides helpers to phylink for managing the Lynx PCS
>  	  which is part of the Layerscape and QorIQ Ethernet SERDES.
>  
> +config PCS_MTK
> +	tristate
> +	help
> +	  This module provides helpers to phylink for managing the LynxI PCS
> +	  which is part of MediaTek's SoC and Ethernet switch ICs.

You should probably have a more specific name, for when MTK produces a
new PCS which is completely different.

Also, how similar is this LynxI PCS to the Lynx PCS?

      Andrew

