Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D547EC77B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqigNPjoqKeKD2agzFAT/W5oY4HvVCWX+QfTRwASFyU=; b=nrHE6iYBnQnRHOJJY+xW/emfV7
	jydJtgjrLirwiPQnuTDBEnYpA+s/rsuscHHSo7ZV+1cZ6bdmQPI3FrC5GDs/sJQzRrUiNwxAYCgKn
	ZY9KvkNtc5vgNNQ+BZqz+f87t81+cseP+UAEpIGFigu4n/tTVZsazWUPXyr47MK0wbviV6ueExzZP
	7UUQ3L4vTzQ/YY3PppUTpJHKJ0IRaUNc34dqNopBCCxTwJNXUJvfgjjpyaa/CzRlz+8SIRyL+hhLy
	dfJWFXMnU8aEDZvraI57JddX/c+0HY6kD+1DLmKfZWE6F1uYMHuh2V/dxew3G3Cexj00URwd4VGHO
	xk+DMAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prIid-001DvJ-1J;
	Tue, 25 Apr 2023 13:28:31 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prIiP-001Dre-0I;
	Tue, 25 Apr 2023 13:28:29 +0000
Received: from localhost.localdomain ([172.16.0.254])
	(user=ziqin_l@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33PDQ3id031077-33PDQ3ie031077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 25 Apr 2023 21:26:21 +0800
From: Ziqin Liu <ziqin_l@hust.edu.cn>
To: dzm91@hust.edu.cn, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: hust-os-kernel-patches@googlegroups.com, Ziqin Liu <ziqin_l@hust.edu.cn>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: clk-mt8173: fix memory leak in clk_mt8173_apmixed_probe
Date: Tue, 25 Apr 2023 21:26:00 +0800
Message-Id: <20230425132601.106181-1-ziqin_l@hust.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: ziqin_l@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_062817_519980_7410C981 
X-CRM114-Status: GOOD (  11.60  )
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

'base' from of_iomap() is not released until the prode function returns,
a memory leak will occur in some case, so use devm_of_iomap() instead of
of_iomap() to automatically handle the unused ioremap region.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Signed-off-by: Ziqin Liu <ziqin_l@hust.edu.cn>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index a56c5845d07a..f80de9e60b21 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -90,7 +90,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int r;
 
-	base = of_iomap(node, 0);
+	base = devm_of_iomap(pdev->dev, node, 0, NULL);
 	if (!base)
 		return PTR_ERR(base);
 
-- 
2.25.1


