Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40B0EE499F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIc7SGyKjtIJWxxHr+CfY2KS6kyJa2K/v52JHZdDePY=; b=BtyCA8PjPm+MulXMPEyoS9YNe5
	W8SGrhx6737IgxRBBZeee5tG3VMf9dMyJS8T6z2ZYV0fYI/t6iFp6amUHcqJxNbzr96cTx+XpIFmn
	t1dUgleaDRI0w1Eafv1MHZ+xg1xQbJlkluRmMDoGDaUMAh0VmwMs2eSEugRpQxs+SVRMvYKm4d1uK
	GXyvdYvZT/Xg1tKR4amAARLsTjmtM8c4BdLE2IQn3uimDPi63sEVmWT9amddywt6EaWq3ZE/gaC1Y
	xrUo48hi7NB2yeYaBmpNpgeHO2Z6+ac8vuPLzgY8h3k90ltAw7GRvbjJNLzLRoTsOK3M2yHV1LISb
	8vk8h0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMfF-00000009XFF-2UMV;
	Wed, 11 Sep 2024 12:41:41 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139] helo=cmccmta3.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMbm-00000009WV7-0Gwa;
	Wed, 11 Sep 2024 12:38:09 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee966e18f24ca2-25ca6;
	Wed, 11 Sep 2024 20:38:00 +0800 (CST)
X-RM-TRANSID: 2ee966e18f24ca2-25ca6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee166e18f20e9f-cca1b;
	Wed, 11 Sep 2024 20:38:00 +0800 (CST)
X-RM-TRANSID: 2ee166e18f20e9f-cca1b
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
Subject: [PATCH] ASoC: mediatek: Remove redundant error message
Date: Wed, 11 Sep 2024 20:37:51 +0800
Message-Id: <20240911123751.2078-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_053806_730760_03909520 
X-CRM114-Status: UNSURE (   9.65  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the function mt7986_afe_pcm_dev_probe, when get irq
failed, the function platform_get_irq() logs an error
message, so remove redundant one here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index d400bea0e..7db090414 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -529,10 +529,9 @@ static int mt7986_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id < 0) {
-		ret = irq_id;
-		return dev_err_probe(dev, ret, "No irq found\n");
-	}
+	if (irq_id < 0)
+		return irq_id;
+
 	ret = devm_request_irq(dev, irq_id, mt7986_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-- 
2.33.0




