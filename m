Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10DBCD128A
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDBPh3Zd5MPQHTnfbxFeCnae77YFIui58j4SxgeMCkQ=; b=tSxBE0smc7oqFnNU0rDqadJbpD
	KMvw6WeiilStvtqEVtjnvJPm9DUtg4/YnqFAOlE3q71yv0kEGHdWxk40c62JswPdTCkf3+ugyj/Vk
	23IeTeGROgEYA2rOZoJ2ND0rfg0en2HQJifZXDk/rz7D9RrZ1MbykzT2XhoEKTYH+1q4haCObxq5S
	z1Fu8f0OKs2Gb2GsR2tMtwPdjzrReXR7Wgj4FczHcNX++FE+K4plqbn5BMpjlYBzfOsOkjVPtzhxr
	j+X7uXzXJurgbGuG29ZdbnUtyjDE1VZKC0qLzyMXi51Lhf3SqnbkmZa3p+n4qu4nvI2vjGIZII2Fq
	gE0UUvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtYia-0000000DPuP-1XFM;
	Sun, 07 Apr 2024 20:02:20 +0000
Received: from msa-218.smtpout.orange.fr ([193.252.23.218] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtYiW-0000000DPss-2bvt;
	Sun, 07 Apr 2024 20:02:19 +0000
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id tYiBrICUDz1OZtYiJrfStr; Sun, 07 Apr 2024 22:02:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1712520125;
	bh=yDBPh3Zd5MPQHTnfbxFeCnae77YFIui58j4SxgeMCkQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=qvs10VBOaOJ7o7KEE3sCJ1qbBrUcBXVDTAqkSfuaumV8kz1YI/wUFqQCBed3AqJ4R
	 WW9w1d1LT+Pa1WfjBHBOiD5W9T6ozKlp2uYEujckaXwRLcePiUBTE/qa2cLxOh3qhj
	 S7bk4U7p9jur8kb5szZBdHfstJ6yS/P5BUUAvG2da6/reJuu/Uu7TVbpLYSZ8hIhED
	 X2Y6+UD2jq7xgj6B6xCuzalrhTepBK/dHLHCu5ml/p+pEvUl53XJ5MtceIdCU6/fTY
	 iQUdYdBqAnyNKl4jajCq1mMvX3alsRr4vn5jBA9D7wIYD3ocMw2HwzPf4hnenOfz6l
	 IPjEMwU4liSHA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Apr 2024 22:02:05 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Improve some memory allocation
Date: Sun,  7 Apr 2024 22:01:49 +0200
Message-ID: <8cb69f245311a348164b0b5ca3dbc59386746035.1712520052.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <42a87fb9837f1760d1ad4eb7162a7536785dc6f5.1712520052.git.christophe.jaillet@wanadoo.fr>
References: <42a87fb9837f1760d1ad4eb7162a7536785dc6f5.1712520052.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_130217_180485_F025B573 
X-CRM114-Status: GOOD (  14.42  )
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

lvts_debugfs_init() is called with lvts_td->num_lvts_ctrl being 2, 3 or 4.
sizeof(struct debugfs_regset32) is small. 32 byres on a x86_64.

So, given the overhead of devm_kzalloc(), it is better to allocate all
needed regset at once.

The overhead of devm_kzalloc() is 40 bytes on a x86_64, and because of
rounding in memory allocation, it leads to:
 2 * (32 + 40) = 2 * 72	--> 2 96 bytes allocations for a total of 192 bytes
 3 * (32 + 40) = 3 * 72	--> 3 96 bytes allocations for a total of 288 bytes
 4 * (32 + 40) = 4 * 72	--> 4 96 bytes allocations for a total of 384 bytes

using a single devm_kcalloc():
 2 * 32 + 40 = 104	--> 1 allocation for a total of 128
 3 * 32 + 40 = 136	--> 1 allocation for a total of 192
 4 * 32 + 40 = 168	--> 1 allocation for a total of 192

So, this saves both a few bytes and reduce memory fragmentation.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 3003dc350766..b133f731c5ba 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -204,7 +204,7 @@ static const struct debugfs_reg32 lvts_regs[] = {
 
 static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
 {
-	struct debugfs_regset32 *regset;
+	struct debugfs_regset32 *regsets;
 	struct lvts_ctrl *lvts_ctrl;
 	struct dentry *dentry;
 	char name[64];
@@ -214,8 +214,14 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
 	if (IS_ERR(lvts_td->dom_dentry))
 		return 0;
 
+	regsets = devm_kcalloc(dev, lvts_td->num_lvts_ctrl,
+			       sizeof(*regsets), GFP_KERNEL);
+	if (!regsets)
+		return 0;
+
 	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
 
+		struct debugfs_regset32 *regset = &regsets[i];
 		lvts_ctrl = &lvts_td->lvts_ctrl[i];
 
 		sprintf(name, "controller%d", i);
@@ -223,10 +229,6 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
 		if (IS_ERR(dentry))
 			continue;
 
-		regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
-		if (!regset)
-			continue;
-
 		regset->base = lvts_ctrl->base;
 		regset->regs = lvts_regs;
 		regset->nregs = ARRAY_SIZE(lvts_regs);
-- 
2.44.0


