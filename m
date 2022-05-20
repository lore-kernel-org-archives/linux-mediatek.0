Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hR/0li2ViFFUhhPV9p+7a01zcLh3X3wBtVIv3BBG4jk=; b=pt0pIeAsHxXv2d
	GhnWl8Ju8YCdqm8HyHc41RuREDsHAJugRpWSnp0Lo7e3mOBKfkU8K50a/TgnxBrCDc18gkzQKUWWB
	mgJna9r8cOrfYkGbjHVgGzKhgw5VlXGTVGu2V/P2KeQpYpWDZRG+159hI7G4+rFpgJLrYEI7BOfQ3
	7yeqTgNwCopce9P40p4pyoYVnqPcIX57f+PpmJw+6yjM/HsDblHfFRW5O0c/dl0NuYG6F1xRpif0/
	GgBN66AxS8Q9Ht6oyYUvI46J65enqwmiqkgT9M/q/mnmvtP+mNOOEk8r038pMAThcsbSx1X6iCuU8
	l0YQ4NkLNflH9oZfs6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns28E-00CUQ1-7I; Fri, 20 May 2022 12:53:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns26a-00CTcb-6T; Fri, 20 May 2022 12:51:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8FBD81F462B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653051103;
 bh=QOwsebbE+upK+gVJVhJOnLLBda4LVPYp2RLtMhPVfBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kvyz47qav2Xdemr7tAjD4VetXMYQoqNOwqLFnVEnrn6pbZ3gWfOKdt4ivXsFod/mL
 Src1tfD33PCWy4b/3iPGp/p7T+PgnzxyRCoUXFcgg0pjVpwSfyVOWIRehudhAjJ0xS
 2UaBjW373IJJ48wH5VdcIEiuhkb6MI3E5eLJxBS4qldLh+hPBPDDT7DMDv7QXzGblg
 cEV4o0RTJRbsYyhOU47RP3xGex1eHSeRsrSMBRxs4LT5SY+k8hdQuDsMp4aM0mEOj7
 7kSGzdI7bIg3JDsg8OBQxCfq8weuRp/r8fB88fXO7+94UdnCZF6yQ8jbYHj2vuYgnS
 p6XB6Bn5RxhCg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] Input: mtk-pmic-keys - Use regmap_{set,
 clear}_bits where possible
Date: Fri, 20 May 2022 14:51:29 +0200
Message-Id: <20220520125132.229191-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_055144_462823_BF9333A3 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Instead of always using regmap_update_bits(), let's go for the shorter
regmap_set_bits() and regmap_clear_bits() where possible.

No functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 8e4fa7cd16e6..83d0b90cc8cb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -157,28 +157,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
 
 	switch (long_press_mode) {
 	case LP_ONEKEY:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   MTK_PMIC_PWRKEY_RST);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   0);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
 		break;
 	case LP_TWOKEY:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   MTK_PMIC_PWRKEY_RST);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   MTK_PMIC_HOMEKEY_RST);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
+		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
 		break;
 	case LP_DISABLE:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   0);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   0);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
+		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
 		break;
 	default:
 		break;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
