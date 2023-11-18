Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792A8C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WepOBgGYhP2iPHXfLSJdrtcP/KdijGX4DDw5TtExb38=; b=1q2ErUUxZnZCqOkH9SwWVZjUnF
	HSnjtzo8hVGvDZ7lSAU2WIypUQD4fdzZ6yXVFisc/rAVFd7AF3dQiH2/GXlB7AtTjxxWN72frmyaf
	xcOqaFZcoruG+qMs9MirxlsDQzG+IjEwrbcpMVYaGU41c7S5V6FYgdsiDZzrwwEejmVrOUfZWpg3i
	Z8S8VSpCsadYXB859NN1xqGY4OMEW4l+r6143R6n6pFiUWnPvyOLZ8I5rgm1MVgchy9wt29HJM1tO
	1Fpq1J5X/Ssy5wBn/V6Eq5hsfA5fmFGkzG0oFdQk6e2KXJ4Ir9yswzG+O3bv8QO/e+41k39kebyoG
	Mht9yjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4MRq-008eyu-0f;
	Sat, 18 Nov 2023 14:37:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4MRl-008epb-0e;
	Sat, 18 Nov 2023 14:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WepOBgGYhP2iPHXfLSJdrtcP/KdijGX4DDw5TtExb38=; b=ICT7ys2yuuz5dBBplm5lRh/5RH
	8DQ/wBrdoRzImt37gHrrXGZbxFIq4nQUYdnoFZ7ub45vgsKXdsFQ3WpPYIwtzRGEaFUSWs9Jl8Cft
	zV68Vv2CJet2uScBr/EMtq2w1ZSkE0yvexguq2PIPGaq2XB0x9Tap/3aCxuXzAYeukSpt01ru2o4w
	7MdD2AzqMSjlu0CLptTCpQ3QDLr6gxqWc9v8RdDACx1Rd5uF0R/esxAjX0DldxAaJylPxhg6B5Zrm
	sIoACMMyxvIad3j1tCTqoAiOBFKVS9XUS8iLiGQBCNMlSfF/nFqmtOvD+TiCYUoVZk0LZZVL0CFUB
	y0pbCdCQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53404)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r4MPR-0003mC-32;
	Sat, 18 Nov 2023 14:34:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r4MPP-0001Cx-B2; Sat, 18 Nov 2023 14:34:55 +0000
Date: Sat, 18 Nov 2023 14:34:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 01/15] net: dsa: mt7530: always trap frames to
 active CPU port on MT7530
Message-ID: <ZVjLj6/iCL/muzmH@shell.armlinux.org.uk>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231118123205.266819-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_063721_264620_4E107EA0 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 18, 2023 at 03:31:51PM +0300, Arınç ÜNAL wrote:
> +	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
> +	 * forwarded to the numerically smallest CPU port which the DSA conduit
> +	 * interface its affine to is up.
> +	 */
> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
> +		return;
> +
> +	if (operational)
> +		priv->active_cpu_ports |= BIT(cpu_dp->index);
> +	else
> +		priv->active_cpu_ports &= ~BIT(cpu_dp->index);
> +
> +	if (priv->active_cpu_ports)
> +		mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, CPU_EN |
> +			   CPU_PORT(__ffs(priv->active_cpu_ports)));

I would be tempted to write this as:

	mask = BIT(cpu_dp->index);

	if (operational)
		priv->active_cpu_ports |= mask;
	else
		priv->active_cpu_ports &= ~mask;

Now, what happens when active_cpu_ports is zero? Doesn't that mean there
is no active CPU port? In which case, wouldn't disabling the CPU port
direction be appropriate, such as:

	if (priv->active_cpu_ports)
		val = CPU_EN | CPU_PORT(__ffs(priv->active_cpu_ports));
	else
		val = 0;

	mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, val);	

?

>  struct mt7530_priv {
>  	struct device		*dev;
> @@ -786,6 +787,7 @@ struct mt7530_priv {
>  	struct irq_domain *irq_domain;
>  	u32 irq_enable;
>  	int (*create_sgmii)(struct mt7530_priv *priv, bool dual_sgmii);
> +	unsigned long active_cpu_ports;

So this will be 32 or 64 bit in size. Presumably you know how many CPU
ports there can be, which looking at this code must be less than 8 as
CPU_PORT_MASK is only 3 bits in size. So, maybe use a u8, and check
that cpu_dp->index <= 7 ?

I would also suggest moving irq_enable after create_sgmii, to avoid
holes in the struct.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

