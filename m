Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE767C54E66
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 22:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98jPgElsXGcy1ZG2H4h/7Y04AyNiRwKvD62w+WQHvxU=; b=bEyYRP5BhObLwVjnHa0QMqkise
	bK4ptwHCT1rkKNLg6+gbHZl7rjjAb3KMFyvMBNNoj0aPkC8BSCrr+tYbbxQZm/X+CL5AZAtIgYqEU
	1tTdoFZotvocE41k/IOs70vzemZRsZcj+fOviIC600X0oQxNhnC7E3lbmE5ulqYzcVigoA7pocV9b
	W3He0D1k/X35lST+jI8l8OJQ0tGk6Ky0Q0+3mji2pNrUJp+teIMno70VCSMx3LLp0NwyCxTZIGkaL
	QXt9ELE1jtyT0fNRjZH8olwxC9KQIXBgwD9b15dz8Pau1BMGV1wOe2a+b2jGTQQUnYA0KswRQg5VF
	OINUPQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkWjl-0000000C4Qy-31Rl;
	Wed, 13 Mar 2024 22:06:13 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkWjg-0000000C4PL-0FAE;
	Wed, 13 Mar 2024 22:06:11 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rkWjI-0003qS-1T;
	Wed, 13 Mar 2024 22:05:44 +0000
Date: Wed, 13 Mar 2024 22:05:37 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt7988-infracfg: fix clocks for 2nd PCIe port
Message-ID: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_150608_192220_A7ED4119 
X-CRM114-Status: GOOD (  11.43  )
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

Due to what seems to be an undocumented oddity in MediaTek's MT7988
SoC design the CLK_INFRA_PCIE_PERI_26M_CK_P2 clock requires
CLK_INFRA_PCIE_PERI_26M_CK_P3 to be enabled.

This currently leads to PCIe port 2 not working in Linux.

Reflect the apparent relationship in the clk driver to make sure PCIe
port 2 of the MT7988 SoC works.

Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
Suggested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index 449041f8abbc9..c8c023afe3e5a 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -156,7 +156,7 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA0(CLK_INFRA_PCIE_PERI_26M_CK_P1, "infra_pcie_peri_ck_26m_ck_p1",
 		    "csw_infra_f26m_sel", 8),
 	GATE_INFRA0(CLK_INFRA_PCIE_PERI_26M_CK_P2, "infra_pcie_peri_ck_26m_ck_p2",
-		    "csw_infra_f26m_sel", 9),
+		    "infra_pcie_peri_ck_26m_ck_p3", 9),
 	GATE_INFRA0(CLK_INFRA_PCIE_PERI_26M_CK_P3, "infra_pcie_peri_ck_26m_ck_p3",
 		    "csw_infra_f26m_sel", 10),
 	/* INFRA1 */
-- 
2.44.0


