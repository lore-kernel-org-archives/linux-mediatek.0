Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A611C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 00:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=AaGEegH7rRcetmtGc/yZk+8R1wa4adiaQvnD7B5+y2Q=; b=sVS
	BSb1bBnZdGBJup0u0+FKIOwlsZpyTlTrKYL5KJ+u76IqP/jaTJv8Uh6PkhmPwPy9vdprCsNvggabL
	JemPE87WDwUUBAyrTIlwCPJ6kEu7sGp9xhTNsRQ1hrDuBJf7gypVuCX+fi+DtkSGmJe61lV1s38ar
	VSMKtJUmWA8X5vtN3GElCx1vd24MOOi8MMiv+nFayotmuiOdKcHZ6Xk61pfJ8zmEPbbzFuD15/XdM
	vBc0pJXncAzSBr/EYIhzh80kUx8gFQ+xGN1CrEGr30w6pU08WcO2w66ythjoYow+/je78uHjM/J8P
	Fczq22pm6+jQmu9wWgr/5FhaMziwMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbseA-008QqT-Nv; Tue, 14 Mar 2023 00:36:10 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbse7-008Qog-Gn; Tue, 14 Mar 2023 00:36:08 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pbsdl-0005Ll-0T;
	Tue, 14 Mar 2023 01:35:45 +0100
Date: Tue, 14 Mar 2023 00:34:05 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH net 0/2] net: ethernet: mtk_eth_soc: minor SGMII fixes
Message-ID: <cover.1678753669.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_173607_575846_07CFA389 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: Alexander Couzens <lynxis@fe80.eu>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This small series brings two minor fixes for the SGMII unit found in
MediaTek's router SoCs.

The first patch resets the PCS internal state machine on major
configuration changes, just like it is also done in MediaTek's SDK.

The second patch makes sure we only write values and restart AN if
actually needed, thus preventing unnesseray loss of an existing link
in some cases.

Both patches have previously been submitted as part of the series
"net: ethernet: mtk_eth_soc: various enhancements" which grew a bit
too big and it has correctly been criticized that some of the patches
should rather go as fixes to net-next.

This new series tries to address this.

Daniel Golle (2):
  net: ethernet: mtk_eth_soc: reset PCS state
  net: ethernet: mtk_eth_soc: only write values if needed

 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 +++
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 28 ++++++++++++---------
 2 files changed, 20 insertions(+), 12 deletions(-)


base-commit: 512dd354718b98c60d4ff6017ff8c9f66c10d03f
-- 
2.39.2

