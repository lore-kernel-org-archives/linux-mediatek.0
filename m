Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6E0C35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16IxcBEYZK9twQ1G/yQmRxe1As8IXBcEe8yradY/0k8=; b=jUk309DGD4WjAYy17wRVuYLfA3
	2sBUorK+prj4VlYFLS4Bp8hIvB3EohpEHp5u6oSnk13GZ3Yl5RRBNvNodzGV8u2GJlP9t6ZdLoqtZ
	b/SPRNU37gjd5622UQmJtBP2CEHC1iLzjgFcU71wvEEqlY11j2rZWW2atIwOgJ+I8j9wc/8Ks6anw
	GCxS5T0YozY9dE4plyWWetVSgf/RiBPTAz8JgchXXauhCyG7QQGAKdlwe/pHD/jX7gkwvztOS2WXK
	a0Q5cgigfEXKpVkMiKQPzzmpliiiIg+LHBtsCiM9HkkzU6zJrdkjeOXxpJqpaLMPJuXWtF+y/ss3A
	pYX8/HFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGErZ-0026uN-1l;
	Thu, 21 Dec 2023 08:57:05 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGErV-0026tU-2B;
	Thu, 21 Dec 2023 08:57:03 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BL8uVRa014634;
	Thu, 21 Dec 2023 02:56:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703148991;
	bh=16IxcBEYZK9twQ1G/yQmRxe1As8IXBcEe8yradY/0k8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EOiQtYjbdl2KdH+EqJDqJOwxPYmI0wE86tJ4Tnkq8/vVJSZUFOmfo4lpTPaWuPq5n
	 3QijJeWBLHvfBjtlGFYHgFyDfYNTVn0nbchvNpw0A2PKGb5wZjMGQuEF7tc/fDfRd8
	 qh5RE1qqwq39c49MQzZM0+Nmrlzj95WReElkv5OE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BL8uVCH063030
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Dec 2023 02:56:31 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Dec 2023 02:56:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Dec 2023 02:56:31 -0600
Received: from [172.24.227.247] (uda0500640.dhcp.ti.com [172.24.227.247])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BL8uORk081324;
	Thu, 21 Dec 2023 02:56:25 -0600
Message-ID: <d78949f0-bb03-82ea-b40f-1bb92b41e200@ti.com>
Date: Thu, 21 Dec 2023 14:26:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next] net: dsa: mt7530: register OF node for internal
 MDIO bus
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Daniel Golle
	<daniel@makrotopia.org>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG
 Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
        Andrew Lunn
	<andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean
	<olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: David Bauer <mail@david-bauer.net>, <mithat.guner@xeront.com>,
        <erkin.bozoglu@xeront.com>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>
References: <20231220173539.59071-1-arinc.unal@arinc9.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20231220173539.59071-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_005701_863317_67800C31 
X-CRM114-Status: GOOD (  21.13  )
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



On 12/20/23 11:05 PM, Arınç ÜNAL wrote:
> From: David Bauer <mail@david-bauer.net>
> 
> The MT753x switches provide a switch-internal MDIO bus for the embedded
> PHYs.
> 
> Register a OF sub-node on the switch OF-node for this internal MDIO bus.
> This allows to configure the embedded PHYs using device-tree.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 391c4dbdff42..f8ecc354630b 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2155,10 +2155,13 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  {
>  	struct dsa_switch *ds = priv->ds;
>  	struct device *dev = priv->dev;
> +	struct device_node *np, *mnp;
>  	struct mii_bus *bus;
>  	static int idx;
>  	int ret;
>  
> +	np = priv->dev->of_node;
> +
>  	bus = devm_mdiobus_alloc(dev);
>  	if (!bus)
>  		return -ENOMEM;
> @@ -2177,7 +2180,9 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	if (priv->irq)
>  		mt7530_setup_mdio_irq(priv);
>  
> -	ret = devm_mdiobus_register(dev, bus);
> +	mnp = of_get_child_by_name(np, "mdio");

If the node is not found, then the return value would be NULL.
Though devm_of_mdiobus_register() and of_node_put() take care of NULL references,
other drivers that use devm_of_mdiobus_register() mostly perform a early exit if the node is NULL.


> +	ret = devm_of_mdiobus_register(dev, bus, mnp);
> +	of_node_put(mnp);
>  	if (ret) {
>  		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
>  		if (priv->irq)

-- 
Regards,
Ravi

