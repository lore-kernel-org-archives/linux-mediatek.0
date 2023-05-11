Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE0CC7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/UFGhB83ROP440y4JzZ2DWi4wx7mDPzfDrtis1oh0Uc=; b=iOBsMl9wBViDIyxiKEdn1muFrX
	waUqbj91nZrgWoOQbjwCcc2BGhOvIl/6h4aOA/YpOIWbBaaiY3b0i9Mi2r1ppzTn7uG9rDxSBlhfu
	ZG6T/eTRqpPWAkSCinHeqebPDRdc7y11szNLLRTe6hTwmzckyqCl658izhzWMWqh30DWpluB2/MpY
	DIfgHsRsUBZ/FyXPxccAROLENwws6fykDjwGTbxgeDQqrrgzcso66Lr3FOQEJMjlsuVXFDQq0LQK/
	5hsoYAZyWcz8puAe8p3ZmGpALFa2WbdOAn3cJMw0q1xqLzRdOOyWx4dcDxYU9ASzLuyCcg3UL3jOp
	fK4bH9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6PU-008t5B-29;
	Thu, 11 May 2023 13:32:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6PR-008t2u-2G
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 13:32:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f4271185daso45583595e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683811959; x=1686403959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UFGhB83ROP440y4JzZ2DWi4wx7mDPzfDrtis1oh0Uc=;
        b=j61F2EZHIzVROnVnEJ5dWEjJ++EssalrBvY6bt/WB/zE+mHTfRUUC/bBLbEd7+yPl6
         RX8i5zBHeuDrZGi+bAPCxS1N991+YDw3bs5Zy6SAnO/xM/UudkTyW4UgDraICDPSf0/I
         RECDKvfIjuag395gnx5RBeyaOahlsldWTVmNJrb5bFCd2AFM8Qf9VbXRqbeqTfRbpPAa
         1CeZH70bHm/Pbt2PyULvdqvNP2tnNQ2ufDY8zlryLlFsHPdx1AzWPUJJ3QSnFUSYgRjk
         2lMw0iTxLG9t0Cbw7IhYC2ioUqEjinWoW4QCUgSMcDQNnMe5Dpl/5VMizBghngXbBcU2
         I5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683811959; x=1686403959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UFGhB83ROP440y4JzZ2DWi4wx7mDPzfDrtis1oh0Uc=;
        b=kFJZKtWgROffN0PZQVAAGPHf//VJ9KjZ1ExEEvy9z1XEcJzaUh9k7xNtmEeb/+nUZq
         ZN+3cim38Jlp660oInxH39fm+5cLSUtqhHfBQW9eICi3Wpz5p2GGfifa5WHCbhDlIgUE
         0W+7EV2+x7W3oHCDHUEASx5NFlCGXLh1uzk0vsna/aOCbr+RpqZm3YgdgwumLXqwpo2G
         jQk14yBwyhaAgyukN6DNQD4vgfIPdMr1LyhOf0WPpRaXtDm2MJbOTDMJ9Jl4pGyBBnhi
         cWbzcRTOQuxhduM4bpUja1HxcGSQmgYPkJNVS3Dm8tL0b/2X4nIARaXPj9bmAH8ySx3n
         4ijg==
X-Gm-Message-State: AC+VfDxOKseuxkJz+tmKSa0GDsUYN7+7y0Lt0/FZOS7PXIBKoaZGWz9p
	Az1rENT0dXGfXoBbWVw+db7pmw==
X-Google-Smtp-Source: ACHHUZ5ETDXp0nRcAzcgFbv4kgG4x2FThcMMysyf2EOpF2sHVg9H4CuAY5NsAJC60miMV3Ro02gxAw==
X-Received: by 2002:adf:e690:0:b0:2e8:b9bb:f969 with SMTP id r16-20020adfe690000000b002e8b9bbf969mr15481747wrm.0.1683811958720;
        Thu, 11 May 2023 06:32:38 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a246:80f3:ef71:25ff:df82:9cc9])
        by smtp.gmail.com with ESMTPSA id a15-20020adff7cf000000b002f6176cc6desm20479025wrq.110.2023.05.11.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 06:32:38 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Date: Thu, 11 May 2023 15:32:26 +0200
Message-Id: <20230511133226.913600-1-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_063241_741103_A866CC3C 
X-CRM114-Status: UNSURE (   8.91  )
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

The given operations are inverted for the wrong registers which makes
multiple of the mt8365 hardware units unusable. In my setup at least usb
did not work.

Fixed by swapping the operations with the inverted ones.

Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_gate clocks")
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8365.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index 6b4e193f648d..6d785ec5754d 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
 
 #define GATE_TOP0(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
-		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
+		 _shift, &mtk_clk_gate_ops_no_setclr)
 
 #define GATE_TOP1(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
-		 _shift, &mtk_clk_gate_ops_no_setclr)
+		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
 
 #define GATE_TOP2(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
-		 _shift, &mtk_clk_gate_ops_no_setclr)
+		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
 
 static const struct mtk_gate top_clk_gates[] = {
 	GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
-- 
2.40.1


