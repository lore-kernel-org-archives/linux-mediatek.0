Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080E6C38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Sbs3CGBXJ1W6tlgr+E6WWx0EaLoDMOFwaUawkV6foA=; b=htwlwiLcC9Bze0I9RzGqrJG6nF
	XXrVMJ376+1o0TL9WaGTO/hiUNB5POxu2BrWBAhUAhaY60R9/Ecn2CCTePuzPTTSDplCcmTAqHUhs
	iuTXcqy0ANHWeU+Ufydy9fRJzMAPIdGLMlvqz5Zu+18PdVp5cROyyoBAqGPhm8HJnoqtHtFQBKHlU
	z/xZJkVc9e14MMTZjHfa8DbukQCy89/L6fZaMtDGe2ymkSwXUBf/Q6eNMERIMOcNo6FovCEbyhLMo
	GgRbBfh91KD1lCpmN6bWVYquN8qVmO2gJaNeRRNJZLwFeLQAhZfIsqxZBJNGIJr4tJLbvpoCm770F
	YeeiPgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onj6z-00A9Ef-BZ; Wed, 26 Oct 2022 16:18:37 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onj6n-00A9At-0V; Wed, 26 Oct 2022 16:18:26 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1onj6d-0006SF-Cg; Wed, 26 Oct 2022 18:18:15 +0200
Date: Wed, 26 Oct 2022 17:18:07 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2] clk: mediatek: fix dependency of MT7986 ADC clocks
Message-ID: <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org>
References: <9bde77be-f4ec-11e7-e645-7c4465bcf6db@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bde77be-f4ec-11e7-e645-7c4465bcf6db@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_091825_069355_CCF5F727 
X-CRM114-Status: GOOD (  12.09  )
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

Fixes: ec97d23c8e22 ("clk: mediatek: add mt7986 clock support")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: add Fixes: tag

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


