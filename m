Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDDFC48BC3
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Feb 2024 03:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CTkpCAt52XGgguaJPVayTwv86qpgvut5YPHklVZRrNA=; b=tH4o47yNyw9zwtDO7sBnpabmi7
	hKhtGnrUxPLXQRoMxn0WV6eObNw7I85tn6rJkW4jfx5DC4IEtJGjfU9c3y/IgdUBGH99IYbgTxoIT
	84XE53ucFajG1QBG5v3m7m+VJs7ap5TTn/Vv1GSaA6aLdb31q8HcMHMNiLKm9xtVWWHuK1lDrhdZp
	g1oectw66lJL3YMHEhjnAwyjCUu11lfB0UKNAc3D/IyP823snO62LAPM0VAQAJgM2q+Y1NnslT5qZ
	p+IA5KU2SSAGeGLFNV8mBwXe1qTXoWoPI0LQ3viMXFvcADqqK2XcKnvXLmNpCmhSQuJwBMUzCQqo0
	UuBXeiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbXas-00000006sSj-3h5R;
	Sun, 18 Feb 2024 03:11:54 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbXaq-00000006sRK-0Gix;
	Sun, 18 Feb 2024 03:11:53 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rbXaP-00054G-35;
	Sun, 18 Feb 2024 03:11:26 +0000
Date: Sun, 18 Feb 2024 03:11:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Jianhui Zhao <zhaojh329@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>, Steven Liu <steven.liu@mediatek.com>
Subject: [PATCH] clk: mediatek: mt7981-topckgen: flag SGM_REG_SEL as critical
Message-ID: <fc157139e6b7f8dfb6430ac7191ba754027705e8.1708221995.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_191152_126480_A075B45D 
X-CRM114-Status: GOOD (  10.60  )
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

Without the SGM_REG_SEL clock enabled the cpu freezes if trying to
access registers used by MT7981 clock drivers itself.
Mark SGM_REG_SEL as critical to make sure it is always enabled to
prevent freezes on boot even if the Ethernet driver which prepares
and enables the clock is not loaded or probed at a later point.

Fixes: 813c3b53b55b ("clk: mediatek: add MT7981 clock support")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt7981-topckgen.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7981-topckgen.c b/drivers/clk/mediatek/clk-mt7981-topckgen.c
index 682f4ca9e89ad..493aa11d3a175 100644
--- a/drivers/clk/mediatek/clk-mt7981-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7981-topckgen.c
@@ -357,8 +357,9 @@ static const struct mtk_mux top_muxes[] = {
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_SGM_325M_SEL, "sgm_325m_sel",
 			     sgm_325m_parents, 0x050, 0x054, 0x058, 8, 1, 15,
 			     0x1C0, 21),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_SGM_REG_SEL, "sgm_reg_sel", sgm_reg_parents,
-			     0x050, 0x054, 0x058, 16, 1, 23, 0x1C0, 22),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SGM_REG_SEL, "sgm_reg_sel", sgm_reg_parents,
+				   0x050, 0x054, 0x058, 16, 1, 23, 0x1C0, 22,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_EIP97B_SEL, "eip97b_sel", eip97b_parents,
 			     0x050, 0x054, 0x058, 24, 3, 31, 0x1C0, 23),
 	/* CLK_CFG_6 */
-- 
2.43.0


