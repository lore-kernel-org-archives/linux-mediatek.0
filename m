Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DEBE7E0CD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lu184qV9euYKcp5XauGvcgF98v5627jKDTrjeXzM34c=; b=kJ2Xbg+SAwJ8b3QbDbmb/5XBm3
	2AGIcF39VtJ8RmUaNs3SroxRRtf8RLBKeOoXlyIaZNwBwsGv24rLQi9XuthEnev6x+I3qejaub3xP
	3dVas790ej3fmh8wceU4geddn6igHI0mL5kobAPK+vBLZBkAyS/SzS5D1D0SrWUmhuVpoAeBvkKVH
	QUQ5rARSkjNK6E0/iRJZEKaI64cIFxDjIP6exxqWpO+q1AsQ4W+XFz/zMz/FE7GbBVIeqfesxYfsX
	P4rww1HrWr1jCkuxiaHxoj4XGmApLLJC1j1UbY4WiwKDNoK/ZOSUSkaj43c3nXnu/OBi/5TgkWcRY
	vIvWGhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUfX-0000000Fjuc-26si;
	Mon, 09 Feb 2026 17:03:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUfS-0000000FjtG-0DIA
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 17:03:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-480706554beso34783105e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770656600; x=1771261400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lu184qV9euYKcp5XauGvcgF98v5627jKDTrjeXzM34c=;
        b=K9PVT2PZANDS6U4+z6RNqlHhrmn5nRLK0grspiyr90SNICehUMYMiXB8T48TKwMM0O
         JtpxMxCRIE17oQN59G/xl1qnYOK/T+m80tXFsW1Taok6OSWrlTmTnXNfCuNd1FNEEmUK
         RzfGJaOnyGyCObsDPh8508lkg6VvrtLLFI0+0rH+pkNDVRLDjJZxe4SAqtKnFnF+7fIu
         spAhxFVfTje8mKRcW6JdbQKxp/1IjyPufGEPPiccm5VGJPnjV3RVeYCMOjJ+BPZi/vwW
         Tih7fpNCcdeXBeifPjmy2H5g6d/JP/ckH058Mh2PEbqFyoRC6jasYRUVkw/SV7p/Hg0K
         klLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770656600; x=1771261400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu184qV9euYKcp5XauGvcgF98v5627jKDTrjeXzM34c=;
        b=XwSSavsCmkfcZfBRS1LMyvK40/ztFB8RvNi6CJIOF0OIIlXZCfTy4AXxQyn0WL6xxC
         wOPabDmlLYVzac8pqZBXiAeZLkwi0zQ7/gKFIieDtSswmJ+BGwwnSCZ7LUNQHijtqYFP
         8YrKPqTL31vCjcx3jZE2TS4MtKele7Wxtq0QTeshab9VD+VWJtDVIzbXi3oWfcJg27LI
         PnNVCjWQ8WUiQOjbD4nA6mKQcH9lSA7/1LxxcmSmrJJTWkPTJFA7OUVtP7T+NLFJEDbt
         pBp9sZD6/2+ylZ2FiyB5cdoWBhsDYukeqYdout/HI81AgcERUwobED7NxYs/Rd1tDorZ
         3IUw==
X-Gm-Message-State: AOJu0Yy5Efpr4IqCYmJG7XeMEgDfBJGmvYbzEJb7aoVp17R0pPxjIQlB
	IAbioPAKM2qV8U0Kye7fTUlOdJPMdVh069PL5KpZam9kH6qf+2YBrm0sa+R1kA==
X-Gm-Gg: AZuq6aKvHEEZqtRbd3hJRMbppc8Cj54WL0+gVLHaSzLPb5PlJNjW+TsSLmKhN68eejI
	M85Q6oCA4QdE0ZGEO6LpwoZ+Xk67dAYPiVHXuoVxrK6JAwkyFM1egEAsHfrJVNFgKFatVBRnAjU
	iSBLMAaaalCpu0y/6BCG0OhUtuzPJEj2KkzwHdwnKdWUphmW2Li7t9ULaXG/9HJrvr15ocr2yZF
	5YhE27trP9MZwmDqyGCUbMEJX3nyhbBWQ2XWRAQfV4Nfma4M1DzYtIL3rnPq5eyinYUwQxZO11a
	yoeTA1uA3Y9L6t6a0JdJ3JSLF11/77n5/ppDMd3C75lywJ6NtBFKRU3mO+3mOAHvv9NWrD5iPHt
	OIoOsKRovHZH2teN8PCzuFI9ZEC8asX0pwnKUzZ0cVHxCsQyi/RpvP7qEK71aQicbcee8nrGLgM
	UdlN0/MdmKmdm/aeLWugRzljcU8n0tpQ==
X-Received: by 2002:a05:600c:5489:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-4832022918dmr156996825e9.32.1770656599449;
        Mon, 09 Feb 2026 09:03:19 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832096f127sm129870525e9.6.2026.02.09.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 09:03:19 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge
Date: Mon,  9 Feb 2026 17:01:50 +0000
Message-ID: <20260209170149.419984-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_090323_722436_F29E618C 
X-CRM114-Status: UNSURE (   9.55  )
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

The original patch that was sent to the mailing lists included the values for
the route masks, but they got lost during merge: add back the full register
masks where missing.

Fixes: 060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index c468926561b4..eef14083c47b 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -10,24 +10,29 @@
 #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
 
 #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
+#define MT8167_DITHER_MOUT_EN_MASK			0x7
+
 #define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_RDMA0_SOUT_MASK				0x3
+
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
+#define MT8167_DSI0_SEL_IN_MASK				0x3
 
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
 		    OVL0_MOUT_EN_COLOR0),
 	MMSYS_ROUTE(DITHER0, RDMA0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
 		    COLOR0_SEL_IN_OVL0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
 		    MT8167_DSI0_SEL_IN_RDMA0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
 		    MT8167_RDMA0_SOUT_DSI0),
 };
 
-- 
2.43.0


