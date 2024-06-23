Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95D3C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jun 2024 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QoDiMtMZP47OvdlajKW7ucljhl2UswwZ57MVOwWpRY=; b=KTWCR/osD9CHsZ
	rlyLIOqkE09fKtDwhViKdR81tqte7fqAXMIb/l/VPu5xmCEyfuRQX1KKrVgExzKch+2MCCuXf8cdc
	W0Yw1ZMHJT1+oJ9vWlgZERCv2M73dccrQc7cMMY67BC60u4frCKxYtbqSnkaQsbxgDhax9PHq1I4Y
	c/XdZ4yqSA/tNWnRLNPWcB7YCZUFXzVxiEoM5t9VSQeC7Q7jXDX+LZ0NQ0ef4RYetbO0n4a9Rfnw0
	3XMf4eYn6j2VBdRYjnkI19n5A4p37I0x/OtRRBsNJgtnxpAtKQVbJFOhF/HLKUXFoHGLLi3VpPtvP
	2wCfN+2BfO6lzQloQbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLNX8-0000000E5hk-1cyc;
	Sun, 23 Jun 2024 13:45:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLNWs-0000000E5WS-07nc;
	Sun, 23 Jun 2024 13:45:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 128D7CE0E66;
	Sun, 23 Jun 2024 13:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EF1C4AF09;
	Sun, 23 Jun 2024 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719150311;
	bh=Gyyr16iESIWrB/kDPAonFTZhX1nUR1om4KmkiP7sV4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAbvFjKFnugm6mhYUdtC+nfP+L+2VHRx3JrmfjVRkam4C8pq88q12uF8VVkGLhzLx
	 obqxqS9fPyGHsnH3GLVU9Pf+xw/O+j+UxF3z00Em12RVWBaylfG1UB6jB4K0w1/6oD
	 gHxyfvrPkUAkSVgfYzqQVwpHrYI68c7Wu/8YyrKsIuw2AZSA83QpEOazkwyiIjt+jo
	 T4g2+yobQ7YHRrxd8ev7qt+gYpHLfRApWMADpS+6pS1V3f1e/y6lBIR6o6Xg/DY6F+
	 E87e6Ht2sFwL08T/74ShABLRvZBpleJsJpTkmoUptwQrxZeLhSNiVb46L7sTo/rgPh
	 bD2YITU3VZ3Qg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 14/16] drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
Date: Sun, 23 Jun 2024 09:44:43 -0400
Message-ID: <20240623134448.809470-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623134448.809470-1-sashal@kernel.org>
References: <20240623134448.809470-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.35
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_064514_703421_D0922841 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: Sasha Levin <sashal@kernel.org>, chunkuang.hu@kernel.org, daniel@ffwll.ch, Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit c38896ca6318c2df20bbe6c8e3f633e071fda910 ]

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

This driver users the component model and shutdown happens in the base
driver. The "drvdata" for this driver will always be valid if
shutdown() is called and as of commit 2a073968289d
("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
noop") we don't need to confirm that "drm" is non-NULL.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cdd506c803733..37d8113ba92f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -926,6 +926,13 @@ static void mtk_drm_remove(struct platform_device *pdev)
 		of_node_put(private->comp_node[i]);
 }
 
+static void mtk_drm_shutdown(struct platform_device *pdev)
+{
+	struct mtk_drm_private *private = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(private->drm);
+}
+
 static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -957,6 +964,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove_new = mtk_drm_remove,
+	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,
-- 
2.43.0


