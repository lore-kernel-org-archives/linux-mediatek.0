Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8615AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jan 2022 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6V5441IcJrbvXQau/Q0+vjFiiD55VdVpt2xD+HntfA=; b=ADcdWvnBLsslLG
	kQk9v82z+wGr0A6cEmnRC1Whfn58Ax4Lb3Ojz3AwvKl4UpucE4ivDMUlh9RejJuYDHWASuVU2qkRh
	xZYuGTUPi77HZZu0kNDk0hw9hi72LR9AsLqY8SxNOMj0jeChPVmWGVVlAofJYgchbLDBEngaWzAVr
	JrEUbc2bFqSOw6FCYGMOCXcxafqwHKNIAZITzFsCqe19PcvCzEa0JgGAK0951QP2Obh+UXwQu5ocG
	pD9vG9X90mcPYr3AS0R7oXpA0qlpcyT0q/TcEHG8D7ZPfGeA2iH+PQHQasxigM1Cpook6YJ0Gwb9w
	cpJX9z/G8nctF2uV7Jsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n43xM-007xmG-8G; Sun, 02 Jan 2022 16:43:40 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n43xK-007xlv-6k; Sun, 02 Jan 2022 16:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=p6z6R4Zq+iBUkifmKKYAC9qMQJ+15+ZEEM8C6DzOWp8=; b=j7
 Yd+uaaPiOFOfX2kH4cp/I+XeYgzct+wydzajip0fLO0Yk37F78L5G6gguHWqTriOxFYKkv33fa0K0
 12j066oLGvT7SlKZzZGl3LX5L0dA37ypyJYGDWEo6e06fGXdaNIV/CwLQQEc7fg5zzOc2vnaPjBKs
 OYbs7McL3NMmMy8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n43xE-000JsH-6L; Sun, 02 Jan 2022 17:43:32 +0100
Date: Sun, 2 Jan 2022 17:43:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Michael Lee <igvtee@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v10 1/3] net: ethernet: mtk_eth_soc: fix return value and
 refactor MDIO ops
Message-ID: <YdHWNIcr9AzFG7oN@lunn.ch>
References: <YdCNZh5PsBwbfMtp@lunn.ch>
 <YdHJQhG3vmEJ4ia6@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdHJQhG3vmEJ4ia6@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_084338_289194_77B474F5 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +static int _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr, u32 phy_reg,
> +			   u32 write_data)
>  {
>  	if (mtk_mdio_busy_wait(eth))
> -		return -1;
> -
> -	write_data &= 0xffff;
> +		return -EBUSY;

-ETIMEDOUT would be more normal.

I would probably also change mtk_mdio_busy_wait() so that it either
returned 0, or -ETIMEDOUT. That is the general pattern in Linux,
return 0 on success, or a negative error code. Returning -1 is an
invitation for trouble.

The code would then become

    ret = mtk_mdio_busy_wait(eth);
    if (ret < 0)
       return ret;

which is a very common pattern in Linux.

      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
