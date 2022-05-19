Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18704C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlqG35gOh4DQblRbtqhEPEjcaguF1jicbjBVCBuwzlo=; b=xUoUsGYU0T6t0Q
	qLUrnLAKfrvbzo7yc89FHvsHCqfEJOrypZbeTZuPUW9oyEtBA3a1/MMdn1sK4vYcjDave6Q7lIYRv
	rgf8ZT6GSiwLDES4CzyyHIfSM1AGKEnQ0CeI+DdeIRiGle+B3ydOY4YPsfG32eMql/V74dd97vEJ8
	ZXZuLNjH4Lo8xiv0lXnIFm7UrSMY2lcj9VPBjw6uZTIadLAxGrlHO0xE0YnnhRJrY3NLxEa2WH8qo
	M18uqdSIAGBYSlSv2FDY8zqEFqnUKMiwzmkYDTh23UQuVSzZPnNpe/4gxqpNDClMCKYyFIUCMAEZA
	Nz/8ByEakf1mPVc5FO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhWp-007cOW-Jp; Thu, 19 May 2022 14:53:27 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgWz-0078TJ-Bz; Thu, 19 May 2022 13:49:36 +0000
Received: by mail-qk1-x734.google.com with SMTP id 135so2213154qkm.4;
 Thu, 19 May 2022 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwBfJw5/BJNtRay4oCR2RSqvzBCGfp1734JkjgoOzz4=;
 b=fs/uXmWU4zDYd3zoUKnpovlsFnqcRqmWaXzoviY7wwM2pBe5X5WKqiF/JoNVYlXgqo
 rd1qd9Pca064uvXp6jBK8L6PO0tKPNYhFtemVkpvOinxgzdQf0reeVTqxBroIjdI8lmf
 ZzbDvr1GK9OPkNPRntI+WIQdO1NsTUvp0M820JOhdvjqfpLhrBarf+F33e5PcPb7lYDY
 aeIsjzgla1dh87peoGViai6UGzX3IduUt7quVBqvOuii60owMzU8tZxKvEiAoV9zIiC0
 LdnZ1xo8sWe6VpuZbVWl7fRERJF+yx+H4Qo43BuOxWLGcsKb9O58JZGN9087LAfxSO/S
 asyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwBfJw5/BJNtRay4oCR2RSqvzBCGfp1734JkjgoOzz4=;
 b=NSp0suTKBlkn7UHdCT9MmCsCqQWrq6GrAm+MbO5PXh9Gy4BqqQK/jlBXG1blY7z45E
 qPjAQJUkxaE+q2gLmcMJIqbjkUIiiYam6Ak0KMiikBdjgxPgwBC1NTy/xehJzPIqC/TN
 LZV8FcuMp/nnOWM+fk3MCOoV/+sZt8OlyS25V5emzg3ahx7K2/k0QEUD62Wp+EKaOyUI
 VbS8vQIvGPVMhWsp49HCrRFLDrVWfmggh/6Gnfq5WChJF36kek63yBeATTig8ens3pMM
 yA6SkEPNIMFoNOYse3Y7+Sgtb2dWGEQ2xEQLdsQu9TVLKr8C/O/FuHYzqFPXgXJYMLF/
 CaQg==
X-Gm-Message-State: AOAM5329gQ51An8qAQTZLaeEowmqraqXwDIbBVHh+NbqKt2THycCqX82
 YbPD3vL7NIggCfpZSEJD+n4=
X-Google-Smtp-Source: ABdhPJxXOzQEfbshSAFTXW/WKDfXcuWSh8vP79n1R4ztS9+cKHzly2gJ9NajNbLKHmij01cQOZXqDA==
X-Received: by 2002:a05:620a:258b:b0:680:f66e:3381 with SMTP id
 x11-20020a05620a258b00b00680f66e3381mr2961492qko.291.1652968170786; 
 Thu, 19 May 2022 06:49:30 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a3754c3000000b0069fc13ce23dsm1315024qkb.110.2022.05.19.06.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:49:30 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/6] clk: mediatek: Use mtk_clk_register_gates_with_dev in
 simple probe
Date: Thu, 19 May 2022 17:47:24 +0400
Message-Id: <20220519134728.456643-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519134728.456643-1-y.oudjana@protonmail.com>
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_064933_466586_7D5CCB4D 
X-CRM114-Status: GOOD (  11.67  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Register gates with dev in mtk_clk_simple_probe.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Dependencies:
- clk: mediatek: Move to struct clk_hw provider APIs (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/ 
- Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
- Export required symbols to compile clk drivers as module (single patch)
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

 drivers/clk/mediatek/clk-mtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 41e60a7e8ff9..3a8875b6c37f 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -434,7 +434,8 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	r = mtk_clk_register_gates(node, mcd->clks, mcd->num_clks, clk_data);
+	r = mtk_clk_register_gates_with_dev(node, mcd->clks, mcd->num_clks,
+					    clk_data, &pdev->dev);
 	if (r)
 		goto free_data;
 
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
