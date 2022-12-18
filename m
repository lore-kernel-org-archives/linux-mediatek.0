Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE5EC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Dec 2022 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTH7HFPa/sjugvIOMxDw4mdeT3bXN+KaA0Ptd1qlGPE=; b=0KZw9PvTAIRW7BpnoNJvYl8AIa
	jkBsywBCheR0XgBLyLBCNZtRwymqJ/OBLbMsHT3pWEsjhrvbD1djIiVEKCznZUmnJd0lxazvUDDsf
	pRQl7IjNhnSj2/dOWMZSog8cuTkTLZDcCE+KScDIv0nGl1zCDmgsqj/tP5YPkPkkbJCWHZP1PY7/m
	twuDekde9FeWsmcvWr0kEd2EJ2lN1jW4SFMjUc3Uip4V2uj+c+kvWLGpoLMcL0PLaXVUwPeg0PPuU
	VyLGYb8IP1+z/ohF7BoMS7Xrrb9YL4EnwcwuA1FkBz0WPhcNkj8zXmDfEPyutFwzcQZBgYENNkxCK
	lEDJP+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wMA-002vR9-Ut; Sun, 18 Dec 2022 16:17:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wJ1-002tg6-MF; Sun, 18 Dec 2022 16:14:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07B9460DCB;
	Sun, 18 Dec 2022 16:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F50C433F0;
	Sun, 18 Dec 2022 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671380066;
	bh=WeOOt14tkYeELBrtRWfPT2/q6Bw4lnOCH2VvxZFmpcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dzmje4hKaeQrYSHdhC+sIKTl3vsoWacmBh8tQRli0WQoXINR+Wqf7Mr1mMLxCBasE
	 k7LqmV3sTY8OOk6+9M5zm2XyZVrSPCuQjwCxkfZkoL5t/VEjQrnrny3xTuP/U/5vb3
	 AHaHONGG6Kfl8ILtoF53bllgO0bqNgEnNOVYWhGdXez2iqNqEbBM4ECR20H8dWU8zJ
	 VxowEVeEmbTITMAuJfKzJnSADTunTJDwQm3aTlWokw/DCyvSstR4Hx5OphJ93pikv8
	 RR1bOp1B2B4T8VdKu67+dmU6OxBKjVBQ8JRhZCsDheOuOjWjPeipBaK/zSUbYu/KxQ
	 pSYuOEKPUL4mQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	ndesaulniers@google.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 24/46] drm/mediatek: Fix return type of mtk_hdmi_bridge_mode_valid()
Date: Sun, 18 Dec 2022 11:12:22 -0500
Message-Id: <20221218161244.930785-24-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218161244.930785-1-sashal@kernel.org>
References: <20221218161244.930785-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_081427_822245_8B65CBF4 
X-CRM114-Status: GOOD (  12.62  )
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

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 890d637523eec9d730e3885532fa1228ba678880 ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/gpu/drm/mediatek/mtk_hdmi.c:1407:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = mtk_hdmi_bridge_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
'enum drm_mode_status', not 'int'. Adjust the return type of
mtk_hdmi_bridge_mode_valid() to match the prototype's to resolve the
warning and CFI failure.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 3196189429bc..7613b0fa2be6 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1203,9 +1203,10 @@ static enum drm_connector_status mtk_hdmi_detect(struct mtk_hdmi *hdmi)
 	return mtk_hdmi_update_plugged_status(hdmi);
 }
 
-static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
-				      const struct drm_display_info *info,
-				      const struct drm_display_mode *mode)
+static enum drm_mode_status
+mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+			   const struct drm_display_info *info,
+			   const struct drm_display_mode *mode)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 	struct drm_bridge *next_bridge;
-- 
2.35.1


