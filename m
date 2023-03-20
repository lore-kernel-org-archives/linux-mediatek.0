Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC8BC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 11:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJlpzoab4V3efnlveAXiGT/zYLEMCWClUmJ6USJrBks=; b=WDzjMnR3va+yUE4xllAVkS6zse
	DmC9LW2fecthGoDT1S/GAl8wRwuJZlObj8pj5480VQmGlSAlHvKfjlsoeFnIotgVSwNTroHcEsCR2
	LCKdcxu77pglgL6nibH9ukeShCRnHI+QwsCv1Hl9iN/9xe5Z35JZRtgLKSAhhCrJyTWmcxtXVHs3y
	MUA8BeJHcs0fZIV/O06wBw3LU6yyG9WSIZL1jeMjqlvv0Csg79akGmvFoOOye7DLivhMt3NbLYHzj
	oO+91LnmkzIEziTpJQ1NWjdu9Bb31xpjY62TIt0RfVtEtELmwM8rs0v6vTfJpzMRNV3fC6JP9VBSK
	jJxNsDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peE2q-008t4K-1r;
	Mon, 20 Mar 2023 11:51:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peE2n-008t32-1C;
	Mon, 20 Mar 2023 11:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FJlpzoab4V3efnlveAXiGT/zYLEMCWClUmJ6USJrBks=; b=AiKk+CCZoeqXtUVeGGfPur16pS
	VSw4ZbhBH36KlOgOzt6yxe8vkKyKrb3JRVRYM3K7W7jUcpG6jUrZAD6XjU1s5cXWf8qdmmweIOrEX
	4zsvoFNsfWS7Kn7bHT+tgPQGfs62L986/dysqTbFUqLp1tiQ0BMDT0me6PSnH2X6f0PGd5LlRWL1x
	8W65vRPnUBVM4AkrdssyepeWUTPibNim5IsJ28PhPhCbu335wIwVz+uI+vXt0Yoae113Ako6kLOsN
	D2zo+yywBl0lcaARXFeZVbxt1tVonUx04QtkvulXiIm5FCje0hio2RtpZMDSUHqaQkAXKQ6IK5BAX
	VdrVTltw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42226)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1peE2j-0007J6-6o; Mon, 20 Mar 2023 11:51:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1peE2f-0006UV-0m; Mon, 20 Mar 2023 11:51:09 +0000
Date: Mon, 20 Mar 2023 11:51:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v14 8/9] net: ethernet: mtk_eth_soc: switch to
 external PCS driver
Message-ID: <ZBhIrFlOG/B5rfDB@shell.armlinux.org.uk>
References: <cover.1679230025.git.daniel@makrotopia.org>
 <3979b99300067c595a4406dbb0dec3ca9ba14952.1679230025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3979b99300067c595a4406dbb0dec3ca9ba14952.1679230025.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_045117_412425_1E4DAB3B 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 19, 2023 at 12:58:02PM +0000, Daniel Golle wrote:
> Now that we got a PCS driver, use it and remove the now redundant
> PCS code and it's header macros from the Ethernet driver.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

