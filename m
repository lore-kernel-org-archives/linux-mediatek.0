Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BEFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 19:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRvIPOd6zgemYFP/0K9JWH6K9lRA5CJhUXIwBjaqrRI=; b=qZEIsKgO96bn4DDUecxNWaJzgv
	NCAR4+PdNMbxpNxWeANgGwVfXZm40MAm/ABxrtvOPRQt0JpYQTHB0femmN2yGDp1YKC0PEQ5/6vQ+
	MDu+Ejl3VE4DBseRi602B1V4namSR4wD5wtf05qQNAfz2bIwE0zWU90VdwWrfhLoO3khMpqx7+LgT
	LU7mM+011o7wCZp9omDhpVEWYijNfrM2vI8BIRDNDWMjCf5dltYPCAoCwcsOeKu9ZRE0xipusJ6qa
	OU2qi/ZbthSizhA9RXNcoQ1HhrTrzEllnYHBHwP/r2j5wTrVLIHTP4eAcSDrxTapXdC0j1ctaNh2d
	EYAzIjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbbN-001X63-EA; Thu, 20 Oct 2022 19:53:13 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbbC-001X1w-9i; Thu, 20 Oct 2022 19:53:03 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1olbb8-0005vb-A5; Thu, 20 Oct 2022 21:52:58 +0200
Date: Thu, 20 Oct 2022 20:52:52 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH] clk: mediatek: fix dependency of MT7986 ADC clocks
Message-ID: <Y1GnFEjOWpplFjqI@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_125302_358035_27768F2D 
X-CRM114-Status: GOOD (  11.12  )
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

It seems like CLK_INFRA_ADC_FRC_CK always need to be enabled for
CLK_INFRA_ADC_26M_CK to work. Instead of adding this dependency to the
mtk-thermal and mt6577_auxadc drivers, add dependency to the clock
driver clk-mt7986-infracfg.c.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index d90727a53283c7..49666047bf0ed5 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -153,7 +153,7 @@ static const struct mtk_gate infra_clks[] = {
 		    18),
 	GATE_INFRA1(CLK_INFRA_MSDC_66M_CK, "infra_msdc_66m", "infra_sysaxi_d2",
 		    19),
-	GATE_INFRA1(CLK_INFRA_ADC_26M_CK, "infra_adc_26m", "csw_f26m_sel", 20),
+	GATE_INFRA1(CLK_INFRA_ADC_26M_CK, "infra_adc_26m", "infra_adc_frc", 20),
 	GATE_INFRA1(CLK_INFRA_ADC_FRC_CK, "infra_adc_frc", "csw_f26m_sel", 21),
 	GATE_INFRA1(CLK_INFRA_FBIST2FPC_CK, "infra_fbist2fpc", "nfi1x_sel", 23),
 	/* INFRA2 */
-- 
2.38.1


