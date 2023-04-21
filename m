Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1578C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 15:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/UMt2wJQ+BHoiCY8xNuNWgoidX4ZHkUCmlm8sN/xC8=; b=qkUDnRC3knA247r4QZ+ZD7a98Q
	VAM28EvDMwikuCg4wEib2ySn2HUAUcAq2rsKSPI+TY+V+igd1HebPx6UtIyGEKM5f0tmhV5RonSni
	jms+AUyIjuw6OYHXOHFuUU2H7phK4dFNnA0qYdweXGAtMy4aOwej/uD3CH2NfO6qRqUjJgKW7JYxP
	VeVIU2gr0vCWaAGipzUeHb1JbJ6d3PxrUkW7Pl6Eh0rIOV87e7y06Psi/N4GlTGOteheUMZUbgsVm
	3wruZdoSdqf81Ot4sdNJxpYd2HF0RgYJdTPZeOmxpBRJCmN6oP9YimWGYs1FpSdG5iqs00mk+enXb
	/kAxP+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppscb-00BGhe-2h;
	Fri, 21 Apr 2023 15:24:25 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppscO-00BGdJ-1T;
	Fri, 21 Apr 2023 15:24:24 +0000
Received: from van1shing-pc.localdomain ([10.12.182.0])
	(user=silver_code@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33LFAE1Q025521-33LFAE1R025521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 21 Apr 2023 23:10:16 +0800
From: Wang Zhang <silver_code@hust.edu.cn>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: hust-os-kernel-patches@googlegroups.com,
        Wang Zhang <silver_code@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] net: ethernet: mediatek: remove return value check of `mtk_wed_hw_add_debugfs`
Date: Fri, 21 Apr 2023 23:10:09 +0800
Message-Id: <20230421151010.130695-1-silver_code@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: silver_code@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_082412_873496_074668B6 
X-CRM114-Status: UNSURE (   9.78  )
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

Smatch complains that:
mtk_wed_hw_add_debugfs() warn: 'dir' is an error pointer or valid

Debugfs checks are generally not supposed to be checked
for errors and it is not necessary here.

fix it by just deleting the dead code.

Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
This issue is found by static analyzer. The patched code has passed
Smatch checker, but remains untested on mediatek soc.
---
 drivers/net/ethernet/mediatek/mtk_wed_debugfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
index 56f663439721..b244c02c5b51 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
@@ -252,8 +252,6 @@ void mtk_wed_hw_add_debugfs(struct mtk_wed_hw *hw)
 
 	snprintf(hw->dirname, sizeof(hw->dirname), "wed%d", hw->index);
 	dir = debugfs_create_dir(hw->dirname, NULL);
-	if (!dir)
-		return;
 
 	hw->debugfs_dir = dir;
 	debugfs_create_u32("regidx", 0600, dir, &hw->debugfs_reg);
-- 
2.34.1


