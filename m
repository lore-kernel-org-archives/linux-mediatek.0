Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4AEC47DB3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wtvAtiCrXRnVQNeDR1xCYojq9FyDB3BcqW6RXyS2RA=; b=dbfnEQcDkI3WTqnln+hc6Ys5JA
	zpNFFPrVaa59uhqX11jUgho+87aSergTu9YjD3ncIkc4ux9xIKVMDFi9Bd+TUs/qamUqiVIQsVInY
	ZSFSz37t5NBhFj/qPtVIAEEF2feCBbt13/RJGV6NdeBUyMNoE3pdEz345XTIZA9UKeRjCwVD25/2A
	LLslJn+YhHXHp/+2LjKK5gm3paEPncQ5z9pYXr9zt8gj5kNChwnd9XMk/Q8ubgP2dhXPH+HzfUYaM
	y/1Z0Wr3ze8bShf5ctcixc61EvCPhkyTttyCXuh+XGkej0Z+nO0jYaCdNdw4J+fxo8q/Dyp2SS2qF
	UI5sNm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVs2h-0000000BMaA-2cvi;
	Fri, 02 Feb 2024 11:49:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVs2c-0000000BMWT-22CM;
	Fri, 02 Feb 2024 11:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+wtvAtiCrXRnVQNeDR1xCYojq9FyDB3BcqW6RXyS2RA=; b=Kz8RsV3J1ZNrdGoNzEEZkj0pZt
	aUh/UPiOQh2sXYeMDp480rblngXiTDEjCPwG6p7D89Lw8ZhKnAev5241ygabQ3vSVZO3U+3u5wY1T
	X7i+5dCOinMbOWnET3oByxwHpY62sYbkfZ6B8DnVFc4/5GzJLgQ83tnPjdfVOcSBG+No96+zULoBL
	5+xYWQ23mk9U1kAOgWZow/qhpbDauIp2aE/Pjc6sgh1TRRe/GHRjsd8WvG3Zfz0YhmRCLGG9PNBrp
	JcvS+ROKFA5VOXE+VVG7aTGKpLNJkePcsTdxhghJeP5rf6H4RG9HoAWSntOlXW/iBxR9kZkba1pdK
	7YYB0e3A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52690)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rVs2S-0005v7-2X;
	Fri, 02 Feb 2024 11:48:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rVs2Q-0008ID-NC; Fri, 02 Feb 2024 11:48:54 +0000
Date: Fri, 2 Feb 2024 11:48:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/7] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Message-ID: <ZbzWpmZrukknMsYf@shell.armlinux.org.uk>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-4-63d5adae99ca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202-for-netnext-mt7530-improvements-2-v3-4-63d5adae99ca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_034906_553111_35A15DD4 
X-CRM114-Status: GOOD (  12.67  )
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

On Fri, Feb 02, 2024 at 12:19:10PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The crystal frequency concerns the switch core. The frequency should be
> checked when the switch is being set up so the driver can reject the
> unsupported hardware earlier and without requiring port 6 to be used.
> 
> Move it to mt7530_setup(). Drop the unnecessary function printing.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

I would prefer this to be earlier in the series, before patch 2 which
moves mt7530_setup_port6() to be called from mac_config(). mac_config()
is supposed to be configuration error-free - in other words, all state
should have been checked before hand.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

