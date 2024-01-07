Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41BC47077
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2n3txj6/jmrhz3DYsK0OV/s61I4FvsrFPJ83pERyYY=; b=RTxigrntkrg7BDz3m6dcGYv3aj
	FKC+77IgOQrLSx+wrALMkAm2fNH45KOKHTM0w2N+dje1QI7gyt0ggUaeYqjnBb4O+ZcO3Itz3Q0fb
	Ks5MerAlrER5V55lGLne+ERnJ9Nj+TdZtHIrTkRyVMJC5hJ8WyItF/yoDf93JEJ2p62nmGARHezGD
	EnE35gm14j5T5aY8ViUF8i532ZoaK4pg7kLbQ0zUuq0hO7TEhjdufmotJftonVLCv2k1asCQB2ZBk
	hnPhrZT8TBBHQkqLRwbWn2ZLhnryEqTZOKz0HzBSeAtLqieoz1NnhS6hvuICHRFyq9FJAZDFWpfiL
	1ZeYzUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMOXN-002dba-39;
	Sun, 07 Jan 2024 08:29:41 +0000
Received: from smtp-25.smtpout.orange.fr ([80.12.242.25] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMOXK-002daj-11
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Jan 2024 08:29:39 +0000
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id MOXDrF2CYiIuMMOXDr7vDG; Sun, 07 Jan 2024 09:29:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704616175;
	bh=i2n3txj6/jmrhz3DYsK0OV/s61I4FvsrFPJ83pERyYY=;
	h=From:To:Cc:Subject:Date;
	b=Wr3PdlO8sT2ulzf5BARVxJrPvz+SGF+saHX7S8M3y9fKfdUhM+hu9rxBkT2l2PZmn
	 JcCuSJ5svMFqToYWc5pTW1Xx/b3341L7QRGc7xgCmHATkZt6RzSaa8dpkZ5MMg/toq
	 nDQ/yHDITr0ax3ShBOwSX5nhiB/ywbFqXdEn5X1VXQuSfarnY3N5OgJNHSCmVgVrA3
	 UOA1jN3WBX3GvKTR74F9m5AXjRyOlMtXOf+lFvHrhPHG9JZ9XCzy9QaNqK3HzlT8dS
	 1XAKtxCj+wqE+CaeIhyXKEUy2YNt0UepBJ2HDg99G6ibKE5HbKGXJocXb8egHRbTVg
	 AXyILBsppDazw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jan 2024 09:29:35 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt7622-apmixedsys: Fix an error handling path in clk_mt8135_apmixed_probe()
Date: Sun,  7 Jan 2024 09:29:28 +0100
Message-Id: <2c553c2a5077757e4f7af0bb895acc43881cf62c.1704616152.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_002938_516325_E710A0D8 
X-CRM114-Status: UNSURE (   9.50  )
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

'clk_data' is allocated with mtk_devm_alloc_clk_data(). So calling
mtk_free_clk_data() explicitly in the remove function would lead to a
double-free.

Remove the redundant call.

Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 9cffd278e9a4..1b8f859b6b6c 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -127,7 +127,6 @@ static void clk_mt7622_apmixed_remove(struct platform_device *pdev)
 	of_clk_del_provider(node);
 	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
 	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
 }
 
 static const struct of_device_id of_match_clk_mt7622_apmixed[] = {
-- 
2.34.1


