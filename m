Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70956C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 14:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AT6eJ8FbJZluUkWHSqnmRN5cAns9tdGhp7LuFi8TsNQ=; b=YK/62e4xFMEYgcv3xuGL0mumP8
	Ex2gHc0C/0lEy2ACvOHF+iN8GxdsVnbN/SXkdtXqvLkoSBGDBcYb1b3LyU55yEIdg/Ucw05VskkEj
	rOJM3FRTRyKfswHCdKlLmsxn9egIEFhBjmW5jlZRswDe+ldA/L8nyObXpYduWejO3r66RstI7CfG2
	GfRb0wHI0O0k11Imy31oEC4Mbo+kCyzop/+/0ky8UvZKgt+EZYZs8DhQw9bp3b9rHv0MqTcGJxMr1
	tQwUXNRhXlloN62f0jdfspmRWF+GA8K8DeSGLYDqvSiV/531lb4JEciFaNco+8qAZMUPfp8JReZEP
	xXoN3vLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4GA-00000000nTp-0Yd1;
	Fri, 01 Mar 2024 14:53:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4G6-00000000nSz-1Nvc;
	Fri, 01 Mar 2024 14:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AT6eJ8FbJZluUkWHSqnmRN5cAns9tdGhp7LuFi8TsNQ=; b=Tx+ZUBH7Yrwr3nkLWDaTULDEJ3
	ICj4TMORGivcz/D+6rFRv5mH5+pZsJVWjKSi5ZPeIcRFRHmYaLc+JzlCMZrOrlB3fjOJjUkhB8B/t
	4Ia2B54fKKGPXCUbg+S+KtQfXYxCVeqlX/u+C/XSSrbCyLCS8F5OVkEqqT8zK/qZPBLgAOQLg87ow
	Z+S536rHtuUMoKK/WlknGstZu/xZlOfdpLWHVhfVDFD3jBPasQ8BmYHdUadVSP1B/TivhV+g6F3bC
	QNpfCRso7XT9B6QB5nFN4fLMsNWefbIsWTMmgBgso9/EMjj+MJErx+ngaTpu/MLwKlKYrWUhLiDHk
	nGA4riYg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51756)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rg4Fv-0001jG-2K;
	Fri, 01 Mar 2024 14:52:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rg4Fu-0001pG-Ac; Fri, 01 Mar 2024 14:52:58 +0000
Date: Fri, 1 Mar 2024 14:52:58 +0000
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
Subject: Re: [PATCH net-next v3 4/9] net: dsa: mt7530: get rid of useless
 error returns on phylink code path
Message-ID: <ZeHrykYQd1SWJIN/@shell.armlinux.org.uk>
References: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
 <20240301-for-netnext-mt7530-improvements-3-v3-4-449f4f166454@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301-for-netnext-mt7530-improvements-3-v3-4-449f4f166454@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_065310_392981_9D7650FE 
X-CRM114-Status: GOOD (  13.62  )
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

On Fri, Mar 01, 2024 at 12:43:00PM +0200, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Remove error returns on the cases where they are already handled with the
> function the mac_port_get_caps member in mt753x_table points to.
> 
> mt7531_mac_config() is also called from mt7531_cpu_port_config() outside of
> phylink but the port and interface modes are already handled there.
> 
> Change the functions and the mac_port_config function pointer to void now
> that there're no error returns anymore.
> 
> Remove mt753x_is_mac_port() that used to help the said error returns.
> 
> On mt7531_mac_config(), switch to if statements to simplify the code.
> 
> Remove internal phy cases from mt753x_phylink_mac_config(), there is no
> need to check the interface mode as that's already handled with the
> function the mac_port_get_caps member in mt753x_table points to.
> 
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

