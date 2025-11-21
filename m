Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E27CFC295
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gu/swdtkJRXrXKE3PJga92ckv2dOw8LlwFrBdhwZ1wc=; b=UinFRRZSh5v7G+AIrKotl2y0+O
	FBxuPLHiDxGP6ZDfsOrvZ+gjavwsvu9OnXfcEAc4/ZWYSBgVQwIRMPt07ChkD768FZsv64dGUEU99
	44B9y2Jl+vr5IBrsHLYsX8X+ACrxrKcOeXUJDAytw/PPD/JE9ImpVCgtt81+D9Os0YAchT+j8teF4
	WI/jh6DhMX79P6kkx4c7TL+zElYVobylJGZF3UY4JPAFVicFmgsCIbJxG9tFqCerX9b0YhSS5fYXf
	0kKsj+j1zWqPje7qI/J7oFz0t3Fv3Uz1YjAX3R5M/7g6c2LebHF928rO4EJscewL3IytbsvZdKODp
	pwb4Jb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUHi-00000008kKF-3SWa;
	Fri, 21 Nov 2025 16:46:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUHh-00000008kJL-0iMi
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 16:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89CF5605D3;
	Fri, 21 Nov 2025 16:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD10C19422;
	Fri, 21 Nov 2025 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763743616;
	bh=a40IkiU6xvqjxBkq9vQ37vCmt5+0t9lSnkk0qDk52Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6VnLmeWZp24GSdjtF3oHTE3KCuOHk4p1ho6LiP5NydWyXcRI1obhWJ7W1YHb6jCa
	 besem1XY1hJTPv3dUTEXrrCNqoS2B5ldARzovTOYKHZ0z8qMQa8kT+6Y3aXOseOwKp
	 0O51BVkYKwINyOdyTg5Y5xx3Rs82tfP4Q6cnfneORgE3KY/3XPDAvIPzbKqSnD/rk2
	 fNjzzYhRXVmgpi6kBVgMSXJBIyjjAoRqIG+F0Wpg7SWMup4RMVAA1/453ix0HNTGwf
	 H0W5bIGFpV4th3yOHo4jM0evljHiK4dJh7wahpIKZ1NKMkEzoduI6aAVWXqP+xCmjo
	 VnAkV7/zuFqgA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vMUHh-000000003ZU-2YXq;
	Fri, 21 Nov 2025 17:46:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] memory: mtk-smi: clean up device link creation
Date: Fri, 21 Nov 2025 17:46:24 +0100
Message-ID: <20251121164624.13685-4-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121164624.13685-1-johan@kernel.org>
References: <20251121164624.13685-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Clean up device link creation by bailing out early in case the SMI
platform device lookup fails.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/memory/mtk-smi.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 3609bfd3c64b..aaeba8ab211e 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -595,25 +595,28 @@ static int mtk_smi_device_link_common(struct device *dev, struct device **com_de
 
 	smi_com_pdev = of_find_device_by_node(smi_com_node);
 	of_node_put(smi_com_node);
-	if (smi_com_pdev) {
-		/* smi common is the supplier, Make sure it is ready before */
-		if (!platform_get_drvdata(smi_com_pdev)) {
-			put_device(&smi_com_pdev->dev);
-			return -EPROBE_DEFER;
-		}
-		smi_com_dev = &smi_com_pdev->dev;
-		link = device_link_add(dev, smi_com_dev,
-				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
-		if (!link) {
-			dev_err(dev, "Unable to link smi-common dev\n");
-			put_device(&smi_com_pdev->dev);
-			return -ENODEV;
-		}
-		*com_dev = smi_com_dev;
-	} else {
+	if (!smi_com_pdev) {
 		dev_err(dev, "Failed to get the smi_common device\n");
 		return -EINVAL;
 	}
+
+	/* smi common is the supplier, Make sure it is ready before */
+	if (!platform_get_drvdata(smi_com_pdev)) {
+		put_device(&smi_com_pdev->dev);
+		return -EPROBE_DEFER;
+	}
+
+	smi_com_dev = &smi_com_pdev->dev;
+	link = device_link_add(dev, smi_com_dev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	if (!link) {
+		dev_err(dev, "Unable to link smi-common dev\n");
+		put_device(&smi_com_pdev->dev);
+		return -ENODEV;
+	}
+
+	*com_dev = smi_com_dev;
+
 	return 0;
 }
 
-- 
2.51.2


