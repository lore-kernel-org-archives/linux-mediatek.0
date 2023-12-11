Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16651C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 01:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lfuDY+KQeCMnDwSJFHVtTfoZ+XTL/4R860opzzeA5b4=; b=xSlAonftHzu1uBKBL2orvcjoft
	wd9MzldsuuLpZW5OWBpNDw6QyxD2pTGH63fEw2SCRpSAXwLnPeY/WBFPvsZIW5ZK+gVolnaYpugue
	C/pAWPO+ELh9+kPnflwzdxBBDhzKp2DE20DNfSGtokvOhyJLjysDShmTbFu4872H93BxO6WxIArZp
	awiAMLvn5Iz1FHC5efGV9V6XuVNdeTmf1X65kP45H+TnctYQun4GUae+T7iskDSAmFSQCqUd5VkmL
	LeF4MFdYnJ8vrzCIRIv0WEic1ynNYrHmRXwWBunijdzHt2zNQYe78vlYS/BpdBl5wIByvYDeYzMes
	BJfSZ/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCVB8-003jHZ-26;
	Mon, 11 Dec 2023 01:33:50 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCVB4-003jG8-1P;
	Mon, 11 Dec 2023 01:33:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rCVAg-0004Q6-1V;
	Mon, 11 Dec 2023 01:33:23 +0000
Date: Mon, 11 Dec 2023 01:33:14 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maso Huang <maso.huang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt7986: silence error in case of
 -EPROBE_DEFER
Message-ID: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_173346_479728_1B32FA22 
X-CRM114-Status: GOOD (  10.49  )
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

If probe is defered no error should be printed. Mute it.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index c1390b3734101..24a4b943030d7 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -144,7 +144,9 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);
+
 		goto err_of_node_put;
 	}
 
-- 
2.43.0


