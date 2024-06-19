Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BB8C2BB85
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCDjN/As86jDnrAkHGFZTZl/g1Bs8vDiRH5vH0ETVR8=; b=Y2gULeQ7/YyISyQn8sZwtrDeFu
	Y+NOG5rWdXkqFne81xcY5Gl12ijXWLcIaZ8vIGZPVlprgdiF4O0j6x7rDg8UlG61+CzG59I9ZMWja
	nj5F/WAw+eDmFyYtEx1cyKtTbvq2XEYRf8agSQzSSw+BWv5aITJbcPxWf5lczOKtUV9I1zj3Z5WTH
	xSdyuWv00kAtO3ZgY/u7B89vtj6n2IpS3M4uuBy7aNH8KifyKUCRVELytGQGn3+MxIbfBXs+/Zbkg
	OTrrbFKlofXzQ5TlNXw+GBkMIl5TARhhtO+As6j52PTjaYw6qEfcDxwvN7FslQVG+K9iW3y2CpQ75
	k0b9yPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKy-000000024GE-0ZPz;
	Wed, 19 Jun 2024 16:39:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKc-000000023xI-30H6;
	Wed, 19 Jun 2024 16:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E3CB619A2;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CEB8C4AF0E;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718815125;
	bh=QFJzZ2f8/HswaPFNTTO8YkFgvDDXRL8Qp41YYaAOvug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MT+yBYIuVNZ7cmjAI2XU4w5cMbPBYD3vj6rdg0cHG5Dmk7tWYhQUZYSDQjIPeL7Eg
	 Rq0gYVWubH5T+iqTZKYcxbW3/ZWHGzanjNvS5gpjrYOWlTXGHFGz2s492sUdSLRUlG
	 faWngpulACBpUZcrxjA6dM4Zq1pYEuxX9KByHRbyZeB/vrenS+Q0k0aacDiYCsOSsh
	 tAXla22HzGPi/mPSoq2ty0SlNMshf2SXIOCzBYyv/2znfb5neGKoLwz98sEoHTFpsJ
	 XEJeQwC+CJg4/+9pIp0dNo1Kpj5SPiHEso/Aeh1TJ3QQn+ZbwRNiX+DAt6gw8lTwW3
	 yqUlSaA051y5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB5EC2BC81;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:45 +0800
Subject: [PATCH v3 05/14] drm/mediatek: Fix destination alpha error in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-5-a9d62d2e2c7e@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=2135;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=rAChFGdFoC8c4exvZmv1sFfltc3v4bPxNFkorgTlPyw=;
 b=/nzXSR2LT5b/JzbTE2HsfTlQ/Sm2B6QzhhZM9OPWslO+9oQ2A2nd0ih+48/0SEhG0JZdjIBLk
 3pmcNsQCRI9B/t1R4U1FwCFw8IPjG3kbqaZJp18j8KDwqTYzHAeEjFT
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_093847_133852_2785466F 
X-CRM114-Status: GOOD (  12.75  )
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

The formula of Coverage alpha blending is:
dst.a = dst.a * (0xff - src.a * SCA / 0xff) / 0xff
      + src.a * SCA / 0xff

dst.a: destination alpha
src.a: pixel alpha
SCA  : plane alpha

When SCA = 0xff, the formula becomes:
dst.a = dst.a * (0xff - src.a) + src.a

This patch is to set the destination alpha (background) to 0xff:
- When dst.a = 0    (before), dst.a = src.a
- When dst.a = 0xff (after) , dst.a = 0xff * (0xff - src.a) + src.a

According to the fomula above:
- When src.a = 0   , dst.a = 0
- When src.a = 0xff, dst.a = 0xff
This two cases are just still correct. But when src.a is
between 0 and 0xff, the difference starts to appear

Fixes: 616443ca577e ("drm/mediatek: Move cmdq_reg info from struct mtk_ddp_comp to sub driver private data")
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index bd00e5e85deb..693560fa34e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -72,6 +72,8 @@
 #define	OVL_CON_VIRT_FLIP	BIT(9)
 #define	OVL_CON_HORZ_FLIP	BIT(10)
 
+#define OVL_COLOR_ALPHA		GENMASK(31, 24)
+
 static const u32 mt8173_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -274,7 +276,13 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
 	if (w != 0 && h != 0)
 		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, &ovl->cmdq_reg, ovl->regs,
 				      DISP_REG_OVL_ROI_SIZE);
-	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
+
+	/*
+	 * The background color must be opaque black (ARGB),
+	 * otherwise the alpha blending will have no effect
+	 */
+	mtk_ddp_write_relaxed(cmdq_pkt, OVL_COLOR_ALPHA, &ovl->cmdq_reg,
+			      ovl->regs, DISP_REG_OVL_ROI_BGCLR);
 
 	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
 	mtk_ddp_write(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);

-- 
Git-146)



