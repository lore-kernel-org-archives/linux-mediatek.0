Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A9CE6FE49
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RjOqOxuIJDuX0YfWEdy7Tdj1ONWyCuLUuaVyti5Obbs=; b=flPjHNAPmiZHbreJHU5REbCrcY
	OPa1TDaraodEZXROPTy4DguxOkQDISe9V2AgYX3CFi1AuRI/zU8db9436AJQwkqqz90e/TWAGmAhE
	rFqds5YMZ8stz3JUlu00nRpYwKmoPkxSJzKPXYYZSTkVST2iggScN8JB/dUdNup0/jZMy+gVY+65k
	ECOihf8XnbdwPr+aYQ9LopDS/0rG/JBI1oXctizUUDKA2pyBPOKK6CWuaP+GKxzpEWyabNbvwJbtS
	8CsuSxn6tSMGh0fSzIIhCtiRvGJDbosPITJ0L7VmYymgAa5wdTkBE4zhsDHQ7N0m5audxOR6rDWGG
	AvPZqrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIGO-0000000GsXb-0IZy;
	Sun, 08 Sep 2024 13:47:36 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIFL-0000000GsS3-0kVv;
	Sun, 08 Sep 2024 13:46:34 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee466ddaaa85bd-d3eb2;
	Sun, 08 Sep 2024 21:46:20 +0800 (CST)
X-RM-TRANSID: 2ee466ddaaa85bd-d3eb2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from 192.168.102.140 (unknown[223.64.113.255])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee466ddaa9ebd6-10a89;
	Sun, 08 Sep 2024 21:46:20 +0800 (CST)
X-RM-TRANSID: 2ee466ddaa9ebd6-10a89
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: codecs: fix the right check and simplify code
Date: Sun,  8 Sep 2024 21:46:04 +0800
Message-Id: <20240908134604.3652-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_064631_766442_57D048D5 
X-CRM114-Status: GOOD (  12.39  )
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

In the file drivers/base/platform.c, the return description of
platform_get_irq is 'non-zero IRQ number on success, negative
error number on failure.', so the check is wrong, fix it. And
when get irq failed, the function platform_get_irq logs an error
message.

Fixes: 5e2404493f9f ("ASoC: codecs: add MT6357 support")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index df6dd8c5b..4ec86b71d 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -2155,11 +2155,11 @@ static int mt8365_afe_pcm_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < afe->irqs_size; i++)
 		afe->irqs[i].irq_data = &irq_data[i];
 
-	irq_id = platform_get_irq(pdev, 0);
-	if (!irq_id) {
-		dev_err_probe(afe->dev, irq_id, "np %s no irq\n", afe->dev->of_node->name);
-		return -ENXIO;
-	}
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	irq_id = ret;
 	ret = devm_request_irq(afe->dev, irq_id, mt8365_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret)
-- 
2.33.0




