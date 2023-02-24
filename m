Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841C3C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D28DDJH9u+51fbuNH6FlD2OnOZeG3P4gcCfgY7q18CY=; b=u6NxdlT/vLGbZqciUw1uXTb69x
	lWJSFhx4vj++Lx1Z/fzBcxhyTEhXFaGDiJWvY0F42vkeSqjTR1ftP719bzHPCWw7DOrWcVeDgnWRu
	H9PJovS/ctiTVI8TDrop3D3F5gOCRoY0g45dS/bg5oXZLuc8J41tE757k5fG00XFMJyFYT4G/xTo4
	S2Nocn4AJIM4ty7SW/pes1EdZFqsoIDNGlpKGfqC+8oa0vvjymwa4uu4vXQhQQPbsSnzn2tMt8chB
	zpYPaLAbYORNLO5IgzGUN1NQuL3kd5eUWR2/v5Jhyqed0SOZQFpu/09kZX1nTeA2/JBcf4MhHl1ld
	Gh5+Zcag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXK3-002Pun-GD; Fri, 24 Feb 2023 12:37:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXJU-002PbZ-EI; Fri, 24 Feb 2023 12:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D28DDJH9u+51fbuNH6FlD2OnOZeG3P4gcCfgY7q18CY=; b=BNE/u4RIuLfquJUUW/5GHhr5xb
	6IMOtvCE8YP+oPn2pV0vtPN76WPlcEfgEvdu/UoULGVQctoQVafOl7MoMj1uto8Ys9KULGeNVAvA4
	30WEk/kA+xyILfnuGLP3Yk122pvgMTZbpvrgfArx2c/H+2RKP2ce/pZ3jeAEi585GO7jtjxWc1ysC
	3cwFMcgb0PbGnf7EN6jFY/4ghQyq2+rtw5fgy7ewpkWe0et5+5xLXI2SB76yPTMqy9CzuSopgWYQ9
	WnSQipgMl5iWRi4q/majMecLnck4tOJlXQRgHwiVeaSuuV6uVvGytYqzL92RKhBksO9UER0OlFyiG
	qeJp4FDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47980 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1pVXJL-0000dz-KN; Fri, 24 Feb 2023 12:36:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1pVXJK-00CTAl-V7; Fri, 24 Feb 2023 12:36:27 +0000
In-Reply-To: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
References: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>,
	 Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 4/4] net: mtk_eth_soc: note interface modes not
 set in supported_interfaces
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1pVXJK-00CTAl-V7@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Feb 2023 12:36:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_043636_525538_6905DECD 
X-CRM114-Status: UNSURE (   9.35  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f78810717f66..280490942fa4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -530,9 +530,11 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		case PHY_INTERFACE_MODE_GMII:
 			ge_mode = 1;
 			break;
+		/* FIXME: RMII is not set in the phylink capabilities */
 		case PHY_INTERFACE_MODE_REVMII:
 			ge_mode = 2;
 			break;
+		/* FIXME: RMII is not set in the phylink capabilities */
 		case PHY_INTERFACE_MODE_RMII:
 			if (mac->id)
 				goto err_phy;
-- 
2.30.2


