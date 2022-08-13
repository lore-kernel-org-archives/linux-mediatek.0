Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C5CC25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IkARQOyCkbKRyiQVo0E+3fF3PnzXAw1PITXNc7Jpyh0=; b=TYPBjAWH3MiFWLFFtivVepPZw/
	TbDqbNhy3kIHYwfkcShkSKlUl4LiaMFONPgzhd9Vo57puwOk0ec/sdDeUpBW/gSO/IwRHzBxZ0PmY
	gc6oqiaGPMZ8J8biqm4Oe7ta3hp0N5QNClNI+j7S1Rs+kCrU39Vgv2k/6BXUaG84zSFLc4Q1a06DF
	IbFCuX2eC4JHl1ISJgGbi/ocjbOIgltLhv2iEsuioNHZ1qt6Rewl4R9MBmuPZGYScrynLn5f4ybPf
	VkWvCCFEyyyl0er2mib5oS3UCFYYSMGxWCuwd5GWZeU0dyhrPwXzb9CdiHnoCXGYcGq3dh1I8Rp0M
	smS1RUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMmbn-00DQMM-CK; Sat, 13 Aug 2022 08:35:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMmbc-00DQJp-Ii; Sat, 13 Aug 2022 08:34:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id j1so3435401wrw.1;
        Sat, 13 Aug 2022 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=IkARQOyCkbKRyiQVo0E+3fF3PnzXAw1PITXNc7Jpyh0=;
        b=iy2tGlJJWOePjP4JMIf2lWvBMTtWcxBCklDT3Rer6sFEgnlJJEM8z97vQMqav6pmT4
         Is04EhSQMJadSQuv0fQj0oYzHiIpgrfvRQ2ZvQFvsdsnkk4gSZk/N3G1jAwUMHp71imR
         kimdykDY14s0nu8Enb9f9vSCxCHQzqjYVfmjceGisBBurTmDOI4G6A4/MLrow2KUmh7p
         6I8BLVpwbxceUC7ozfY62oeon/v9MJ9RtG++gaUugVc938y4pSUotBSwG7Egl5CAv0/s
         dLSRQ9l4/yS2jxQI0GEYexvHn3vk/iRdZTKI12cTYXen00JY58bnctTmka273oG6i1Ue
         fEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=IkARQOyCkbKRyiQVo0E+3fF3PnzXAw1PITXNc7Jpyh0=;
        b=xcaZt4SDKbUhlB2UBeFP+LSreON42dqIHd+KdyTdb3+x6iYm6sHWu6A1f7QWykl65F
         fCH3vHXvfi4jHVmp5KDKiZVPU1O+NyKWYvaerbJjQxPFkg2LaILquqtanCjCfnOvZYzG
         BNSiIl97C7142Y2M/tZ+PQtOwq63xuaRQ8SgLVNk4Jk6SwAxr5HqP31pSgyyl9Co1nmW
         hHR4hdawv2zfW6qvi9imlWfJ/esVCcwoHvyXOt7q2M0YdfoWpbppOEM8bpaCLT4kEEUR
         ZnfBUpcRx46g6d4SIdS+uuSLhEsCA/BleNOR9T5N2a5rWzfc3aUGq9NaR0e083L3EW5t
         Bh4w==
X-Gm-Message-State: ACgBeo0lH/bKzQRxr5odcsBnQKvYMDCw4a+UMbzLLi5lhfHucfrFiLu3
	HnSNUsUGHzBB5hE2qjDxXZY=
X-Google-Smtp-Source: AA6agR7rr8NCgKEiWScS7tmJrKZ0xvzCBH96rM1Fx03ZPKypl/m1UJj5NiIZA8ksFaWKOBT90pXuGA==
X-Received: by 2002:a05:6000:547:b0:218:5f6a:f5db with SMTP id b7-20020a056000054700b002185f6af5dbmr4024036wrf.480.1660379690470;
        Sat, 13 Aug 2022 01:34:50 -0700 (PDT)
Received: from localhost.localdomain ([105.235.129.49])
        by smtp.gmail.com with ESMTPSA id q4-20020a05600000c400b0021e8d205705sm1471365wrx.51.2022.08.13.01.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 01:34:50 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: mediatek: Use mtk_clk_register_gates_with_dev in simple probe
Date: Sat, 13 Aug 2022 09:33:20 +0100
Message-Id: <20220813083319.45455-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_013452_639016_FE60263D 
X-CRM114-Status: GOOD (  11.76  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Register gates with dev in mtk_clk_simple_probe.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch was originally part of a series, and is sent alone now since
it doesn't depend on the rest of it and can be applied directly:
https://lore.kernel.org/linux-clk/20220519134728.456643-1-y.oudjana@protonmail.com/

 drivers/clk/mediatek/clk-mtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 05a188c62119..4977870912b1 100644
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
2.37.1


