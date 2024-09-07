Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B8E6FE49
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 00:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCHSnlKs7nbNTJVYOubK3rmYPxj9MGSnBIf+5OHCecE=; b=sDvYazFMyl6CBnsXIz725vVV7M
	vJCwdPDva4kYo34BP91xmbm6jRTkprP2rgGOaVIwbpGQQxCHue+Wxml6ucqBN1XrN0+cg75Vm5/b+
	YCHdij85l7JfElgTj7yYgHMREcI0xRd+Ksy7pOC9C5yc16ry78OC0rC8+IJ9DTWg+kML5jmhNqMT4
	XnrOPB+yhSPzdZxxvLWYSPnyFP2Vr8gmbXrtw0K6KjVNUiGIWtwQBZPFnL7jsmqnkItH1LdijxljS
	tYJeUL5BwGbuaN5lJx7TnRGgm3cW6ogf/N7uRgR/5G6XT37Q2EdBB/1ndpmGrRTdKY12llPMeHy2E
	IptEHWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjmg-0000000Dyut-0fNf;
	Sat, 07 Sep 2024 00:58:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjjp-0000000DyHb-13dJ;
	Sat, 07 Sep 2024 00:55:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 443E45C5AD7;
	Sat,  7 Sep 2024 00:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5AAC4CEC4;
	Sat,  7 Sep 2024 00:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725670540;
	bh=iSQufWGpx94L8jD/fIu7r3A06l7ki4DXdmHTvAiYL80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sSxPW2sFMCFSmehq8NSEkbXl3fNtzmSJ9LJxUiy6tk22JT1lWq0k/LNUUiKu/SWGl
	 IX3IqozxmqcyuX0oEOt8pVnSMV+NH+WF9Yb83qz7NnFR0g653PywNMg0CH66N7EoO0
	 fjHh/pOGEPv6TFJnSl9C+I3DDQOf/D7qkxpWgY4Qg+ureyaU2baNYd9YDMUipPzWyq
	 eVgcbLokxA1nBTxvlridk71RPJzLAStxaKyF2tM56XnfdEAmSiOoCvrlLr5QuXltUu
	 3V9/0yIrW4ii28dpVafBdut8suqjYmH323Igr8scJODtq4NWv9kmC90YeQC24oYqvD
	 mW+Om5SotZQ2A==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 07 Sep 2024 01:53:27 +0100
Subject: [PATCH 2/7] ASoC: mt8365: Remove spurious unsigned long casts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-asoc-fix-mt8365-build-v1-2-7ad0bac20161@kernel.org>
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iSQufWGpx94L8jD/fIu7r3A06l7ki4DXdmHTvAiYL80=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm26R+zknCtJq+ENLDqwu1RsLA7s39ffxBc41Hj
 KN25Rko+ZmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtukfgAKCRAk1otyXVSH
 0IHSB/92x7A9qdeg88jK2oSvesXS/dYxWzhp9sqLKjt2RvrB7oYqO/C2RlYbYaf1todLCgSAQhe
 p+jsJEaaD5U9vMDyp6rd/+2Urx5qJcBVXU/KlVptzaNrytAcyBVqqwMqwFH8S6V3RoisfHV9VTc
 N67ePaaDqers+7fgRq/rkUHfM3UdXOiKm3GkegtrcvrSWHIa7zapJwgTnjinufYnCXrFn3OGpe1
 d7Htr52YKD9WAH2sL6Ro3Rvdggjwi4RvTtc/ncnASTEgLdF3ZYDM+IbWtjP0tL4ZNXbXLQUzMr+
 NMiVrX+ihx36pTcGzqAKpgMZgKJoi1pPPXlL7rcL9jh3bGAt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_175541_410317_4294E694 
X-CRM114-Status: GOOD (  10.87  )
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

The regmap APIs take unsigned ints not unsigned longs so casting their
arguments to unsigned longs is not a good choice, the constants being
cast here are all unsigned ints anyway.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index 5003fe5e5ccf..6b4d8b7e24ca 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -385,7 +385,7 @@ static int mt8365_afe_set_2nd_i2s_asrc(struct mtk_base_afe *afe,
 		/* disable IIR coeff SRAM access */
 		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
 				   COEFF_SRAM_CTRL,
-				   (unsigned long)~COEFF_SRAM_CTRL);
+				   ~COEFF_SRAM_CTRL);
 		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
 				   CLR_IIR_HISTORY | IIR_EN | IIR_STAGE_MASK,
 				   CLR_IIR_HISTORY | IIR_EN |
@@ -393,7 +393,7 @@ static int mt8365_afe_set_2nd_i2s_asrc(struct mtk_base_afe *afe,
 	} else {
 		/* disable IIR */
 		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
-				   IIR_EN, (unsigned long)~IIR_EN);
+				   IIR_EN, ~IIR_EN);
 	}
 
 	/* CON3 setting (RX OFS) */
@@ -456,7 +456,7 @@ static int mt8365_afe_set_2nd_i2s_asrc_enable(struct mtk_base_afe *afe,
 				   ASM_ON, ASM_ON);
 	else
 		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
-				   ASM_ON, (unsigned long)~ASM_ON);
+				   ASM_ON, ~ASM_ON);
 	return 0;
 }
 

-- 
2.39.2


