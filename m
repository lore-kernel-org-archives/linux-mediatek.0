Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DEAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 01:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ay1Tgx9J3rLh1nL+EBUz3tLBR0Yl+XvFhmGJX7stDi8=; b=dP0hGCsrca4S6J
	BagPjFF+qaHLXPjAkP6ZSVHGR8G/xQeA+K7Wp0pbCxzI3RrLQYAs9T5Cklxs9C994tPNBmnJDSt7b
	ANr6aLhSFeqj92L4v0o25vx7sFfE15pScjKlyy5SBYeyQD6RTjANV80PRp1/59lLe5VK9orXhoxSI
	EaHt/9/Wj7DKdQ3wDSnF6SW12IF1MvTgcNLiX27fz17rpjywHY07uWruR02sR5iWZcB+/+iHZQxVq
	IL/hs8gtVWEtLR209Ovdaqyv4C7BBCj4S7H3lQVo0coBkn3ksajkkDco0wySXR5ObubWJgGnPSvGS
	8w6WNLSKZJv/3jPv4Ygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN2r2-00GRRx-AS; Thu, 24 Feb 2022 01:23:36 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN2qq-00GRQA-7i; Thu, 24 Feb 2022 01:23:26 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V5LiiSH_1645665799; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V5LiiSH_1645665799) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 24 Feb 2022 09:23:20 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: matthias.bgg@gmail.com
Cc: airlied@linux.ie, daniel@ffwll.ch, p.zabel@pengutronix.de,
 chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm: mediatek: mtk_dsi: Remove unnecessary print
 function dev_err()
Date: Thu, 24 Feb 2022 09:23:18 +0800
Message-Id: <20220224012318.84935-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_172324_477462_DCD37494 
X-CRM114-Status: UNSURE (   7.67  )
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

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

Eliminate the follow coccicheck warning:
./drivers/gpu/drm/mediatek/mtk_dsi.c:1092:2-9: line 1092 is redundant
because platform_get_irq() already prints an error

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index bced4c7d668e..704252ee1198 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1089,7 +1089,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	irq_num = platform_get_irq(pdev, 0);
 	if (irq_num < 0) {
-		dev_err(&pdev->dev, "failed to get dsi irq_num: %d\n", irq_num);
 		ret = irq_num;
 		goto err_unregister_host;
 	}
-- 
2.20.1.7.g153144c


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
