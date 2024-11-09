Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A993D5E375
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Nov 2024 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6Zla5ZKOb62SarLRgKgI6y77r/jSiZOU0W1xzRUrws=; b=Ko+J6lnfSiJ53kxArDmKWMzF7y
	RDtaZL1y6x2mpGzrjre6PQEQDO7NwFa++M0RJePf16r2oB17SVw1TOc1/2xNxi6mx6Bpoz5kVcUwH
	8tvv4Zl1SjAnmW/ZJxXoiMoT2cYB/wL/DH67kMTvZgRw1lGu+w77pazkx0bPvoF0i0wB4uxBnh8cf
	hXEJ7EqZiNS8TzH6IrTRjUrRkkPUGDA7JPrdBem7TvBO6Ty+53lt5Fw2kFxIXES/BDhy/si2VfZSM
	OauPSdj9EJaPHQxwagOX2a3zatB8A/3syIfBNgeTCAZjlW82YROZXd96VuKIcejXpoI+Q1jO4OeQF
	0wa2kpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nHM-0000000DYAY-15hN;
	Sat, 09 Nov 2024 15:21:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nDt-0000000DXdm-1iDu;
	Sat, 09 Nov 2024 15:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731165479;
	bh=eLx0mv3l0t8dDseyOxotcA8WePZEOhSvmmm8Mnw0iNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qJ8ZKYZxmmnZiHe56sAIWXftljzD5x88KjNm1b6nES+TogWK5noUiQlOYrahcvqXq
	 Gau64MLdkhHL72g393CjhbW7MNNS92Orb+VVOqCCqQWloVsvOELuLE5nBzkoPzr2qj
	 PyD7ocZ2CGbkiulK2TKgw7Ny3xwBcwW47DcXGpECHdri+0CJPMl7LCjlljMmhFvNEo
	 zP58izllyVEQnKXl0mf4eKqCPAlhC/ROIvJJy2LkhHLfhHlGjR1VTmgioKQnW8y++W
	 YQwPCNTOoN9yxWoMNipCtzM7nFDnBTCdUl1DDaqGBeAa/cK9fN2KMjXGsA/lWWRwHP
	 8y4/ir22ssN5g==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C05117E3696;
	Sat,  9 Nov 2024 16:17:56 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sat, 09 Nov 2024 10:16:32 -0500
Subject: [PATCH v2 1/2] net: stmmac: dwmac-mediatek: Fix inverted handling
 of mediatek,mac-wol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241109-mediatek-mac-wol-noninverted-v2-1-0e264e213878@collabora.com>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_071801_619347_09BA6F4B 
X-CRM114-Status: GOOD (  12.06  )
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

The mediatek,mac-wol property is being handled backwards to what is
described in the binding: it currently enables PHY WOL when the property
is present and vice versa. Invert the driver logic so it matches the
binding description.

Fixes: fd1d62d80ebc ("net: stmmac: replace the use_phy_wol field with a flag")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index f8ca81675407ade786f2b9a38c63511a0b7fb705..c9636832a570a211a53f9480b0a8aec56509199f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -589,9 +589,9 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 
 	plat->mac_interface = priv_plat->phy_mode;
 	if (priv_plat->mac_wol)
-		plat->flags |= STMMAC_FLAG_USE_PHY_WOL;
-	else
 		plat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
+	else
+		plat->flags |= STMMAC_FLAG_USE_PHY_WOL;
 	plat->riwt_off = 1;
 	plat->maxmtu = ETH_DATA_LEN;
 	plat->host_dma_width = priv_plat->variant->dma_bit_mask;

-- 
2.47.0


