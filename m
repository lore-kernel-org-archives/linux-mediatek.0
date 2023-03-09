Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B777C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEswQA/7bHeAL5XHrPgRkPRNdwF+hoMGmkNgGPI8Ymc=; b=e8BoXtm/GQZ+GP4i31DRR1UCym
	NaC9sCr7t48SUqUBtHUruYxr7K8OuzfNyaPfI06JGPJg1o5lAwUm9LRPFK7NEbE8ASytMK4pcAoXB
	D7dmGW4pYSxanvF6YzuQszUMecpqqvu/C3k5gBcXLEwxoY5j+3gvBsR5+Lxj5+UrRvHCkDWmATHXI
	zO6vK4v52Ti/HtcWm2p0SbMHzHfuMPfFO8M1+tlrol17rTQszlEfHyQ0s4fSv+Zpvu/jROrZ/THMV
	pcFFEsSs9wfOH3G39dfur69wT+tzXNW3QhnCT/ESOv6YunLXPp29MdKobr579HjMP1GGWz3hKnzTt
	RmxJZgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDTx-00941o-Hl; Thu, 09 Mar 2023 10:26:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDTf-0093wn-Mu; Thu, 09 Mar 2023 10:26:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B9EF6603023;
	Thu,  9 Mar 2023 10:26:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678357582;
	bh=nkvko6i3DR/+q3uywCjPVyZkbTw5ZbNySmFdON0XhIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kAh8CahGTq3xAWE5qrqzyRqFX7H8WuXeEHEzCOobzTFrNRMdPwTOBHF9nFv3BGOkd
	 dyJRW4TaMbfJsunc7TWAF+1QWKS08UCVvjMjg2bpkLa+pCv7MiZhXH0QGQZCEeN3nA
	 mZ0Rvq3RgHnae/VEiroT7FzrNz1REl4XEylfVj4PfsbN+69P7ruaPlN1dPQDukRWwd
	 YAsHqQhcMqXU/osI6nzleZwAItNmQECuajSqk75RqwiEioawSmM9nnVLqZlYRasmAp
	 qBC39G6BY2mv0dlh+i3puHers3mkzsP/BffXdCMi8a/C16a0sOA3LQdDJ9KcySyi7/
	 hMpVMDfAcdCnw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/3] soc: mediatek: mtk-mmsys: Change MT8173 num_resets to 64
Date: Thu,  9 Mar 2023 11:26:17 +0100
Message-Id: <20230309102618.114157-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
References: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_022627_919029_98A5E1FD 
X-CRM114-Status: GOOD (  11.88  )
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

The MT8173 SoC has 64 MMSYS resets, split in two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
also stated in the downstream kernel for the Amazon Fire TV 2
(Sloane) in the ddp_reg.h header.

Please note that managing more than 32 reset bits is supported since commit
2004f8be8483 ("soc: mediatek: mmsys: add mmsys for support 64 reset bits")

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index d5844aff0621..c4eeab99756b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -56,7 +56,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.routes = mt8173_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8173_mmsys_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
-	.num_resets = 32,
+	.num_resets = 64,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
-- 
2.39.2


