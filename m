Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F10EC10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/5d9mrey0z6E77J+ABi9iiwn9elsW+Czw3OW2qo5J0=; b=VGx85Xj2plBdvZEnO6PykdMNni
	OUWsKEi5oh+J0oLMynY8+GMTpZP4cpVxcCcODMQhLVOH8awLSi6OwxAocsGdlECwmhRto53l7tRo2
	CIXsPPd0VHhQ/ttsgH/c1x9LDPvDVBgPtqa/V2w95KYqHEZPBwtMujDyd9KBtCt0AwYeJlfYLEcA+
	JdUOD8LMYej2X4S5HsABUVIrIlCOnzE0ur1RakhBXJ4IaKuAfaxgLM7ot53LE0kaOsqf5B3+OLchP
	FpMhw0raoNBomOgsCvF9dBkyMczDD45Gr3GFtaOTmjj3FOJ9MJ69S4XQtJRu/U7qngfm21b0Hnec7
	f2tyoxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3wSV-000000076Mc-0Wkj;
	Mon, 06 May 2024 11:24:39 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3wSR-000000076LZ-0IK6;
	Mon, 06 May 2024 11:24:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s3wSD-000000005mU-15Wb;
	Mon, 06 May 2024 11:24:21 +0000
Date: Mon, 6 May 2024 12:24:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc.unal@arinc9.com
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: detect PHY muxing when PHY
 is defined on switch MDIO bus
Message-ID: <Zji94d4yfEBaHlzt@makrotopia.org>
References: <20240430-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v2-1-9104d886d0db@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v2-1-9104d886d0db@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_042435_135625_BB0EF36A 
X-CRM114-Status: GOOD (  25.27  )
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

On Tue, Apr 30, 2024 at 08:01:33AM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Currently, the MT7530 DSA subdriver configures the MT7530 switch to provide
> direct access to switch PHYs, meaning, the switch PHYs listen on the MDIO
> bus the switch listens on. The PHY muxing feature makes use of this.
> 
> This is problematic as the PHY may be attached before the switch is
> initialised, in which case, the PHY will fail to be attached.
> 
> Since commit 91374ba537bd ("net: dsa: mt7530: support OF-based registration
> of switch MDIO bus"), we can describe the switch PHYs on the MDIO bus of
> the switch on the device tree. Extend the check to detect PHY muxing when
> the PHY is defined on the MDIO bus of the switch on the device tree.
> 
> When the PHY is described this way, the switch will be initialised first,
> then the switch MDIO bus will be registered. Only after these steps, the
> PHY will be attached.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
> Changes in v2:
> - Address the terminology on the patch log.
> - Link to v1: https://lore.kernel.org/r/20240429-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v1-1-1f775983e155@arinc9.com
> ---
>  drivers/net/dsa/mt7530.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 2b9f904a98f0..6cf21c9d523b 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2483,7 +2483,8 @@ mt7530_setup(struct dsa_switch *ds)
>  			if (!phy_node)
>  				continue;
>  
> -			if (phy_node->parent == priv->dev->of_node->parent) {
> +			if (phy_node->parent == priv->dev->of_node->parent ||
> +			    phy_node->parent->parent == priv->dev->of_node) {

I had some concerns about missing check for phy_node->parent != NULL,
but it's impossible in practise. If phy_node exists, it will have a parent
node as well.

To be super extra safe, maybe doing
phy_node->parent && phy_node->parent->parent == priv->dev->of_node
would be better.

>  				ret = of_get_phy_mode(mac_np, &interface);
>  				if (ret && ret != -ENODEV) {
>  					of_node_put(mac_np);
> 
> ---
> base-commit: 5c4c0edca68a5841a8d53ccd49596fe199c8334c
> change-id: 20240429-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-586269371c55
> 
> Best regards,
> -- 
> Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> 
> 

