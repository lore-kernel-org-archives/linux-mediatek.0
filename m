Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48336ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 06:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JmGZk+jQFAEiH3JwSTcQKy/FhWJAfUDEUzJ2Ol2leIo=; b=QNpNJJkHKyPc2ktHlQwkbZPqhS
	uNEuye07srQ9RtznklYzVfTJCjXMHY8h8ScudEagwL3NO5qNC1TedvXXrcnXAdlt9f6O+r9tgGzF4
	jpm+JUC6vjbhtrJOtZf6mbf782Q91B9U+2PjCq/U6ZW12mpiWNIiSGjhW3ko79bPDlusB7ZHZk+db
	NTQbCD+hQpRoAp2x2aYkMMkG3sqQnAkzrDAsagqcVegBJbcNwh98QwmKDx/muDUyTFXMVEiEaTAPP
	684JFLtW1EWe1NdvZy6OlplKJCTGWHB7ybZEG2Gr3VVfmLD3ZL2/gAqtyFgxy6TNgBJWfv5Kfmr4w
	43EEWGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWXmX-00DSnX-VD; Fri, 09 Sep 2022 06:46:29 +0000
Received: from mail.nfschina.com ([124.16.136.209])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWXmL-00DSjq-Ny; Fri, 09 Sep 2022 06:46:19 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 73E231E80D5E;
	Fri,  9 Sep 2022 14:44:37 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCJdTlgd51AI; Fri,  9 Sep 2022 14:44:34 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: yuzhe@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 4EE7A1E80D06;
	Fri,  9 Sep 2022 14:44:34 +0800 (CST)
From: Yu Zhe <yuzhe@nfschina.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liqiong@nfschina.com,
	Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] ASoC: mediatek: mt6359: fix platform_get_irq error checking
Date: Fri,  9 Sep 2022 14:45:11 +0800
Message-Id: <20220909064511.22343-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_234618_011984_087E815B 
X-CRM114-Status: UNSURE (   8.72  )
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

The platform_get_irq() function returns negative error codes on error,
fix the checking.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 sound/soc/codecs/mt6359-accdet.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index c190628e2905..b70aac5075ad 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -965,7 +965,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 	mutex_init(&priv->res_lock);
 
 	priv->accdet_irq = platform_get_irq(pdev, 0);
-	if (priv->accdet_irq) {
+	if (priv->accdet_irq > 0) {
 		ret = devm_request_threaded_irq(&pdev->dev, priv->accdet_irq,
 						NULL, mt6359_accdet_irq,
 						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
@@ -979,7 +979,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 
 	if (priv->caps & ACCDET_PMIC_EINT0) {
 		priv->accdet_eint0 = platform_get_irq(pdev, 1);
-		if (priv->accdet_eint0) {
+		if (priv->accdet_eint0 > 0) {
 			ret = devm_request_threaded_irq(&pdev->dev,
 							priv->accdet_eint0,
 							NULL, mt6359_accdet_irq,
@@ -994,7 +994,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 		}
 	} else if (priv->caps & ACCDET_PMIC_EINT1) {
 		priv->accdet_eint1 = platform_get_irq(pdev, 2);
-		if (priv->accdet_eint1) {
+		if (priv->accdet_eint1 > 0) {
 			ret = devm_request_threaded_irq(&pdev->dev,
 							priv->accdet_eint1,
 							NULL, mt6359_accdet_irq,
-- 
2.11.0


