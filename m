Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D534DC41513
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rsq7plQ/F0ndcc9bEjUHw97Zaa92iAqhmMCCUBU7WwA=; b=ubws0wKx3Qm862OUy5MhgHksvg
	u0HRv1DVxigUWq++ziBFDMo5PwU6JvNl/fQFhZVVYgKV2MJd1ErOy2v9qJBX2jm78GgELXC9wTAvA
	eojOJwLH2fyQzLpZngIVPQ1P5zDKzxpwhLq0MUTfouMBzlGHFkDjIRBqovgAqtzS8UDWLug+ScmPl
	oR3HkZ9LsRgCgycLqQ4io2P5pvoaUVAumSta123DRiEx/VNOSJbaBuuSpflFoqtm4/rxJOAGuNDrE
	Rmot9wAxdI3LLRmiSrJSxXXyaZuHjzagFp/68/6h8a9y7DMeYtm5lLfxDef9adVg24gY5hTuaHCLd
	nVkllwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRW7i-007dJS-0W;
	Thu, 03 Aug 2023 11:04:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRW6G-007btZ-1z;
	Thu, 03 Aug 2023 11:02:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E45D7660719E;
	Thu,  3 Aug 2023 12:02:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691060554;
	bh=EES2yF/cg8QCjFjl2OGiEbmr3nkWYxd9TW0sjHleq8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J4sJkz+hyIsoZ3Z5RYW1/dEItwKl69Hr8/VaPoib0kmdXtCW0d1og28pknDD4gyKB
	 5mv4zT7shwfHcRG7KgxNKkNdfNgQlbGtnIkwlsj91qr+4s1kuC0BV+Mb4YCKFuPqzo
	 6UEMP7VDO2iGOSNSQRQ7mawh5c7x78bg0VClhvipK8l3y38tDu4ZruYVTqgBbt80yY
	 DfRcM45jhwPhlvhggPFHIEHFftuo0RROfscQprTxyWlcdejaKaY8gAEMbvNti812FB
	 e/mgTtcyxWbAy2VX9wUvmoVKlGPhTiKTfn1gSrsgT/2vaBXmuR90IaYbmqony1IIsU
	 Koa+IeoNzxjOw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	ehristev@collabora.com
Subject: [PATCH v9 15/16] drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
Date: Thu,  3 Aug 2023 13:02:13 +0200
Message-ID: <20230803110214.163645-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803110214.163645-1-angelogioacchino.delregno@collabora.com>
References: <20230803110214.163645-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_040236_817412_C66CE6FA 
X-CRM114-Status: UNSURE (   9.92  )
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

The mtk_disp_gamma structure was completely undocumented: add some
kerneldoc documentation to it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index d9a70238d524..867445a2af9e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -54,8 +54,12 @@ struct mtk_disp_gamma_data {
 	u8 lut_bits;
 };
 
-/*
- * struct mtk_disp_gamma - DISP_GAMMA driver structure
+/**
+ * struct mtk_disp_gamma - Display Gamma driver structure
+ * @clk:      clock for DISP_GAMMA block
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform data for DISP_GAMMA
  */
 struct mtk_disp_gamma {
 	struct clk *clk;
-- 
2.41.0


