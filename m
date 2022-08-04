Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2256C19F21
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N1vdbley9Z296Rv5iRkhYKPrVXZbEHfyZweQM+MSnD8=; b=DjGN+xk7q+EgfKgRS9h7+gSEqT
	ufwW5VIuAe02gdDohTqL0ZBQd2y3q3o07MNijN6F/dsHKN83rqYPCsNIe9Hcl9kYvoOYgBoAOCAle
	BLc9V2wVHKRmk2e5rgb7BwT1PwNZCTn1iEAebu3zuviz78vdymm1vCwb+jOspsSUc/H+XEoV+QYM5
	t0yTIRHVe/gtdz5b2JBp1VYcVpTgqK/+XItOHbSxCIsgUTQ66aGgpJpzmw+Gxrd2G/tTzGc7rpPcx
	1PKt0OxGBtgwXki3kFFxf/6NlIRPfOfCwWNTUInJMIyvXEdOuxuTXnRsb8SGfQZ6nEZKjlNZ+RJHl
	INigD54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJgl1-008fiP-DJ; Thu, 04 Aug 2022 19:43:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJgko-008fcL-JG; Thu, 04 Aug 2022 19:43:36 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F0396601BF8;
	Thu,  4 Aug 2022 20:43:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659642211;
	bh=JhqZk6xh4Hi5VnjgPmbWNCLylbZ7vVV8Fj4bhoUCc/c=;
	h=From:To:Cc:Subject:Date:From;
	b=gVNpQolsJG7SZu+9kmOgAQd3EexsdCX77uA53ofN7k93qpxPsa17QyQIj0jV5UU11
	 jLxDoWd4wMH9N93AbkEzMQdDEPG1+awdm4M4OIdNV1al8Z4wpilXm7Gi2KvzrjFEgs
	 A3Q/OUSRXx7z0BXtCuo6Xs0EZYaWFJGJJdZLi5My32W6mia0C8wY3NECn0ITEYfzKj
	 Bfrc1G77q0NoVeO/RyI9NfB3TkMqL+/RxNWXwqgkwfSDQ5ABX0TMe5QDF5Ago8ugwG
	 4v6U9pliyt3qSqAPrdOeLaOF26RGHYMny3hi6gauNwPWW8b+sZg35CSM2AwXErc1VI
	 CReCIxhk18IbA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()
Date: Thu,  4 Aug 2022 15:43:25 -0400
Message-Id: <20220804194325.1596554-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_124334_806080_70E4798F 
X-CRM114-Status: GOOD (  13.00  )
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

As the comment right before the mtk_dsi_stop() call advises,
mtk_dsi_stop() should only be called after
mtk_drm_crtc_atomic_disable(). That's because that function calls
drm_crtc_wait_one_vblank(), which requires the vblank irq to be enabled.

Previously mtk_dsi_stop(), being in mtk_dsi_poweroff() and guarded by a
refcount, would only be called at the end of
mtk_drm_crtc_atomic_disable(), through the call to mtk_crtc_ddp_hw_fini().
Commit cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
enable/disable and define new funcs") moved the mtk_dsi_stop() call to
mtk_output_dsi_disable(), causing it to be called before
mtk_drm_crtc_atomic_disable(), and consequently generating vblank
timeout warnings during suspend.

Move the mtk_dsi_stop() call back to mtk_dsi_poweroff() so that we have
a working vblank irq during mtk_drm_crtc_atomic_disable() and stop
getting vblank timeout warnings.

Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/gpu/drm/mediatek/mtk_dsi.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 9cc406e1eee1..f8ad59771551 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -685,6 +685,16 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	if (--dsi->refcount != 0)
 		return;
 
+	/*
+	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
+	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
+	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
+	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
+	 * after dsi is fully set.
+	 */
+	mtk_dsi_stop(dsi);
+
+	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_lane0_ulp_mode_enter(dsi);
 	mtk_dsi_clk_ulp_mode_enter(dsi);
@@ -735,17 +745,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 	if (!dsi->enabled)
 		return;
 
-	/*
-	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
-	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
-	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
-	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
-	 * after dsi is fully set.
-	 */
-	mtk_dsi_stop(dsi);
-
-	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
-
 	dsi->enabled = false;
 }
 
-- 
2.37.1


