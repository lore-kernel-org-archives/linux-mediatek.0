Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1064DC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 08:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D240861427
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 08:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D240861427
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jB4T9tewyiozlo/8X+BsDTr0yOukqtWkwG0bGQ5DDM=; b=wv5dwbaXw7BoPJ
	rGU+VBgjWREUElnRRDzDU+KSIwST/MCac5hTqtixaRKwULBKIvDvbpeBvjKY6xRXGOqYmkSs58iT9
	5Y4xPGknD+QgvIKR/8UWr9MHGY6FTI21h3tVdgeKU9myl04XsMw0rg5adnK7r6bMsx+kDVngmVNtM
	vB1gTZZBkyDuGx8CigW5pWZeIF9C9PG0jj2kr91wp/Q6cPX+a1SgwV+WSTduK6O5ltLUTz6VKwr+9
	fDKwAyTWaed3G5MhJk7bvHPp45xHfU6+E85tWjPHwPFcUykKeQOIEGHj/qJdV6FHNF28QyBKIBpTl
	vrkyvd8Hpea+iEdVl7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwhGp-000Mxi-3L; Fri, 25 Jun 2021 08:33:03 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwh71-000I6w-S1; Fri, 25 Jun 2021 08:22:58 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43E321FE5B;
 Fri, 25 Jun 2021 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=lQxKazJFDK0uvgkuMHd4jF82EI3+AakwWUtD2iCarYXCj7wh/Xt8WIiYYh25AWL89OtwLp
 ENBeDe/MZXCQuYkJS3MphnMs0IDuHSZ0+CSbXNZrPfbCqSwYkQ+IBrFrd7pKpVvo7GSqgX
 YCXAvRDtcKLBW0m/AIouxakBhS2jFtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=BMk+XOiuF4U9c5cTx3kDp22DQBrWCO+Vbf3DFVeqsXfwnCaG+Ea5io3Rt537H6dm0hHGq3
 eqyqK0S9OMe3nCBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 22DF511C9B;
 Fri, 25 Jun 2021 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=lQxKazJFDK0uvgkuMHd4jF82EI3+AakwWUtD2iCarYXCj7wh/Xt8WIiYYh25AWL89OtwLp
 ENBeDe/MZXCQuYkJS3MphnMs0IDuHSZ0+CSbXNZrPfbCqSwYkQ+IBrFrd7pKpVvo7GSqgX
 YCXAvRDtcKLBW0m/AIouxakBhS2jFtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
 b=BMk+XOiuF4U9c5cTx3kDp22DQBrWCO+Vbf3DFVeqsXfwnCaG+Ea5io3Rt537H6dm0hHGq3
 eqyqK0S9OMe3nCBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id iP2pB12S1WAISwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v4 25/27] drm/vmwgfx: Don't set struct drm_device.irq_enabled
Date: Fri, 25 Jun 2021 10:22:20 +0200
Message-Id: <20210625082222.3845-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_012256_188355_0163DAAB 
X-CRM114-Status: GOOD (  10.23  )
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

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in vmxgfx. All usage of
the field within vmwgfx can safely be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index b9a9b7ddadbd..4b82f5995452 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -292,15 +292,11 @@ void vmw_irq_uninstall(struct drm_device *dev)
 	if (!(dev_priv->capabilities & SVGA_CAP_IRQMASK))
 		return;
 
-	if (!dev->irq_enabled)
-		return;
-
 	vmw_write(dev_priv, SVGA_REG_IRQMASK, 0);
 
 	status = vmw_irq_status_read(dev_priv);
 	vmw_irq_status_write(dev_priv, status);
 
-	dev->irq_enabled = false;
 	free_irq(dev->irq, dev);
 }
 
@@ -315,9 +311,6 @@ int vmw_irq_install(struct drm_device *dev, int irq)
 {
 	int ret;
 
-	if (dev->irq_enabled)
-		return -EBUSY;
-
 	vmw_irq_preinstall(dev);
 
 	ret = request_threaded_irq(irq, vmw_irq_handler, vmw_thread_fn,
@@ -325,7 +318,6 @@ int vmw_irq_install(struct drm_device *dev, int irq)
 	if (ret < 0)
 		return ret;
 
-	dev->irq_enabled = true;
 	dev->irq = irq;
 
 	return ret;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
