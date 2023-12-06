Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E66C10DCE
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaQSwzEe0Xur6B1Z8BTAtunQazBNhblKyHvqvRPA9qI=; b=iuccDlLxcpQ8uPUQK5/sU87kOY
	b00Fqu9kCuxQWBEOnzpHpf6ZVV2E/oqlQdExs7KrHIFWd0TW9VPp7kmm36i0Vm5xjKRMIqHWA3TV2
	Mp2qmg8iVm1uEPDaNMITTrFXsnli8uhJPgFm6LyfqwpbNRQ2QF+MEEiLJSvxzJM/OambW6nfdA4pT
	7APOPJpMRSUEp8G4g8Sdv87aNiA1fjmVeGdNVr8Q0ufSuaFSAtHxPm6Fkk7P1UIU4GiGRfr3As/8K
	kZckfxh4FBgChJNqB+J2rJxALM3gikmdH3m1X3XqqYfWUM8+/Yl1hvheXWDUlWRhfbI8xu3c3LyTk
	vFsd7Wag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAx4R-00B5Ee-3B;
	Wed, 06 Dec 2023 18:56:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAx4N-00B5DH-1W;
	Wed, 06 Dec 2023 18:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gaQSwzEe0Xur6B1Z8BTAtunQazBNhblKyHvqvRPA9qI=; b=NuxGpwJ4zNCkf1lg45ptXAd9Dw
	jTCjNyllqYlOVX5/Ps2/IfyyeZFIBv3uy+5VWQyeox8aqYKLHvDWdKVnCzs8fp+pKKFZCGtwy+s+Z
	4y0+mNr3+WzkoMX4vPHbvs7KxlvriN1CgzZ+DuEQBaHenZk1udPJTCehWCReaIGwLgbVyS58nfgV8
	sLbB9Y8kkBUdhTxRymYT7LxdzYPTK2wNSaqSmbeXe263/JNNWSBQVymB+pDEzDEsgxTjLHF66rxOK
	KQPCgGQAZKhh10jWejOBTDZ4cYVL88xmF2jNWDw+ag3N5Co3yFbwGa+7Ke3CO2PtWzCtpxAIqoVwr
	eNkiCryw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57102)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rAx3o-0000HF-2e;
	Wed, 06 Dec 2023 18:55:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rAx3m-0002x1-U7; Wed, 06 Dec 2023 18:55:50 +0000
Date: Wed, 6 Dec 2023 18:55:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v2 8/8] net: ethernet: mtk_eth_soc: add paths and
 SerDes modes for MT7988
Message-ID: <ZXDDtmRklS6o994V@shell.armlinux.org.uk>
References: <cover.1701826319.git.daniel@makrotopia.org>
 <3ccc33fa14310ab47e90ff8e6ce46f1562bb838e.1701826319.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ccc33fa14310ab47e90ff8e6ce46f1562bb838e.1701826319.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_105627_510428_CA3116F3 
X-CRM114-Status: GOOD (  11.98  )
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

On Wed, Dec 06, 2023 at 01:45:17AM +0000, Daniel Golle wrote:
> @@ -516,6 +538,21 @@ static struct phylink_pcs *mtk_mac_select_pcs(struct phylink_config *config,
>  	struct mtk_eth *eth = mac->hw;
>  	unsigned int sid;
>  
> +	if (mtk_is_netsys_v3_or_greater(eth)) {
> +		switch (interface) {
> +		case PHY_INTERFACE_MODE_1000BASEX:
> +		case PHY_INTERFACE_MODE_2500BASEX:
> +		case PHY_INTERFACE_MODE_SGMII:
> +			return mtk_pcs_lynxi_select_pcs(mac->sgmii_pcs_of_node, interface);
> +		case PHY_INTERFACE_MODE_5GBASER:
> +		case PHY_INTERFACE_MODE_10GBASER:
> +		case PHY_INTERFACE_MODE_USXGMII:
> +			return mtk_usxgmii_select_pcs(mac->usxgmii_pcs_of_node, interface);

From what I can see, neither of these two "select_pcs" methods that
you're calling makes any use of the "interface" you pass to them.
I'm not sure what they _could_ do with it either, given that what
you're effectively doing here is getting the phylink_pcs structure from
the driver, and each one only has a single phylink_pcs.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

