Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB7C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xhs85aQkTRgCJRjbjY7O4iRGRT2kG1Og2r2mzLD7Ic=; b=OBopmrf01SXmLh5x6A4/powJQV
	PQOLYpd83thyXWcCT7zc2zOutAc+CsVcYslhKwHVcZI//k7WDHdUx9sCkTA2XiCYy1uIVrJ1PFc1r
	7I9rFoPglXOBD0JJnuMXQ/fg/q0qfhe/+f5xiqmbiPN6pfma7Jg3fYzfbZOyDeqDnSeJ0pvsckWm5
	QYsRv20JsT1iYICn6UhZ/kSoxcdYoej+17k8LsSTUa9Z1JGwWwpJuFXhDgxU4JNRzmOAPkd7M0wRZ
	pcATASEgnBeMV2mnaAbGFiI5Ylqnl4q+YjhN0KT9SgitS1ZpZgw4hN2NghZtxu9qjpnMxEe2XNcWI
	PowsQQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvZw-00BdUV-1b;
	Fri, 21 Apr 2023 18:33:52 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvZq-00BdSo-0Y;
	Fri, 21 Apr 2023 18:33:50 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppvZB-0002bf-2a;
	Fri, 21 Apr 2023 20:33:06 +0200
Date: Fri, 21 Apr 2023 19:32:58 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH net-next 19/22] net: dsa: mt7530: set interrupt
 register only for MT7530
Message-ID: <ZELW2plBzam0r8EF@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-20-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421143648.87889-20-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_113346_209450_9FF9384E 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 21, 2023 at 05:36:45PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Setting this register related to interrupts is only needed for the MT7530
> switch. Make an exclusive check to ensure this.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
(on MT7988 which is the relevant hardware regarding this change,
interrupts still work fine)


> ---
>  drivers/net/dsa/mt7530.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index a66a762cb5db..ac1e3c58aaac 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2034,7 +2034,7 @@ mt7530_setup_irq(struct mt7530_priv *priv)
>  	}
>  
>  	/* This register must be set for MT7530 to properly fire interrupts */
> -	if (priv->id != ID_MT7531)
> +	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
>  		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
>  
>  	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,
> -- 
> 2.37.2
> 

