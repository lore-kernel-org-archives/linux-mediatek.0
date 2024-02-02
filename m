Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CE5C47DB3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 11:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdMRNfuOlYWXCZSbX3qtLpZ6mLae9pQYUL0x6nsWQvA=; b=wJDx5LejMc9XSv5cnXtrQFv1s6
	8xV2I+Fs01Uvcd57jpo7fGDDnhMslbqiXLK/XUCvxKRM+tWbHIdHjTTImTbWS+7IDmEXTaTCfwXqX
	TNoE/DmVXlfXb1IVjCAGIjhazr0ifqNvYbDL0VqE3sR6YMK81Wurra5fpHlmqnyv6p338+cASGFnE
	5B9viT/51CuTlf6s0fJaiNPAG1iFSRkyxUFmUigD63DNiveTbBudHTfFQ3a1UYnRZOpN8ysqdiDpU
	BtCOzr4WeHrcIhvmKW+Im/7rpWIjNoKM1ttS51tZWyvPAWH9HsOAoCx3dN99lFGJJxRnxcHwWys9Y
	BNsJClxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVs5q-0000000BNKI-22X1;
	Fri, 02 Feb 2024 11:52:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVs5m-0000000BNIQ-3KRB;
	Fri, 02 Feb 2024 11:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bdMRNfuOlYWXCZSbX3qtLpZ6mLae9pQYUL0x6nsWQvA=; b=aj0xf2f5Jf2gkGwMowWngx4HiC
	veb5AYlQO/gjHSyzr2p8XpEQgkWsB0lsh3TM5rAP/Mpdht38o6EWIGmXnsUz/PqYitIR5wzPJAEbC
	toUWEczWTq0ZuJqe2A7aqJ3i16YHPbXjue1LuKpi5i+F4ob58eYNaoO1QzEsmJuFHu46xx3BVAHv6
	DmF9DdS6Pa26OxbI131SJYNL0nCcWks/SWrdJv4J5wFc3jtLYlk6bdwiR3LtHvG0gc8MiNaorp+n7
	/ehLDkav139ssUKFj79VIyRJwYmGjvVrVHM5mdAPsc4R7e6t9dMKIJU4m5Y2LKkJMHzL1E8GfQYET
	JG72R3CQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34052)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rVs5d-0005vu-2u;
	Fri, 02 Feb 2024 11:52:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rVs5b-0008IR-Tm; Fri, 02 Feb 2024 11:52:11 +0000
Date: Fri, 2 Feb 2024 11:52:11 +0000
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
Subject: Re: [PATCH net-next v3 7/7] net: dsa: mt7530: do not clear
 config->supported_interfaces
Message-ID: <ZbzXayWoRv37zFvp@shell.armlinux.org.uk>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-7-63d5adae99ca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202-for-netnext-mt7530-improvements-2-v3-7-63d5adae99ca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_035222_851379_846C6F06 
X-CRM114-Status: GOOD (  11.31  )
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

On Fri, Feb 02, 2024 at 12:19:13PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There's no need to clear the config->supported_interfaces bitmap before
> reporting the supported interfaces as all bits in the bitmap will already
> be initialized to zero when the phylink_config structure is allocated. The
> "config" pointer points to &dp->phylink_config, and "dp" is allocated by
> dsa_port_touch() with kzalloc(), so all its fields are filled with zeroes.
> 
> There's no code that would change the bitmap beforehand. Remove it.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

