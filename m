Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AAFC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 15:18:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F1A611C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 15:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55F1A611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bXWR7IW5DoJi3f6DhMWNjqeHhFmOG1BibJO+tuvunF4=; b=3qjDLX0P1Xsikg
	hsOom5hiw/subqMzZDetzOtxmmi+5EeZ7tz4B4ADRrkxxcMXy3VGAlDAjRMd1Uo7ozqeAiKvrtwq0
	k/4QIqEzdYZuX4fWkpx2KL8gSZ4rVEim5+LpPMitzIKrpgvvkWi0ArRTE2zYmDEaSycXaaOZrIbhx
	DIgJcx1W1n564CGCrd0x3drBJt8sclMf5LyJY2fLuIHV6Aj1oHYOBVMRMsO59vuLnsqh/IK2792F1
	UQh7ByExIbS2V6p7RHopVijkUbEwoEMqI2zW+gE/5FZiTbPOHvhlPRrS54CCYSroGsd3/q/TIpTa7
	7ANRDP9GQaETaF6a4sAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbOyM-007t52-Gh; Fri, 15 Oct 2021 15:18:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbOwT-007sKm-Co; Fri, 15 Oct 2021 15:16:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6FEF21F45433
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzysztof.kozlowski@canonical.com
Cc: yong.wu@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] memory: mtk-smi: Use ARRAY_SIZE to define MTK_SMI_CLK_NR_MAX
Date: Fri, 15 Oct 2021 17:15:57 +0200
Message-Id: <20211015151557.510726-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_081617_630388_1FDFE5D4 
X-CRM114-Status: UNSURE (   8.94  )
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

This definition is tied to the number of SMI common clocks (the array
mtk_smi_common_clks): improve the definition by using the ARRAY_SIZE
macro instead. That will also reduce room for mistakes when updating
the aforementioned array in the future.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/memory/mtk-smi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index b883dcc0bbfa..6331422141e8 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -94,8 +94,6 @@ enum mtk_smi_type {
 	MTK_SMI_GEN2_SUB_COMM,	/* gen2 smi sub common */
 };
 
-#define MTK_SMI_CLK_NR_MAX			4
-
 /* larbs: Require apb/smi clocks while gals is optional. */
 static const char * const mtk_smi_larb_clks[] = {"apb", "smi", "gals"};
 #define MTK_SMI_LARB_REQ_CLK_NR		2
@@ -106,6 +104,7 @@ static const char * const mtk_smi_larb_clks[] = {"apb", "smi", "gals"};
  * sub common: Require apb/smi/gals0 clocks in has_gals case. Otherwise, only apb/smi are required.
  */
 static const char * const mtk_smi_common_clks[] = {"apb", "smi", "gals0", "gals1"};
+#define MTK_SMI_CLK_NR_MAX		ARRAY_SIZE(mtk_smi_common_clks)
 #define MTK_SMI_COM_REQ_CLK_NR		2
 #define MTK_SMI_COM_GALS_REQ_CLK_NR	MTK_SMI_CLK_NR_MAX
 #define MTK_SMI_SUB_COM_GALS_REQ_CLK_NR 3
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
