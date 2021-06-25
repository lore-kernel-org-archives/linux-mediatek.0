Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF8FC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 08:31:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E10E261417
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 08:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E10E261417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVypTRzOGiTGoQ1O69TM6ZzSLWGeNt0lbH0DXjfyo9M=; b=30gl05+yY1CSJ/
	0tyOhI9irr+MRsJ2Xys+Nf2gwjRneE0Kf/VqGsqDR9qv/5GNul3ARq/WEA9Zda1fxrJNR30Pf5LJW
	vUFhEoHs4dDWBV6QDPbFI9dG+2ZSoxfb+drsYb/1MdHZdGZlsMWyoacZIELJpK/loOAOrbQ584y/v
	pMRkxw7IhkCTFyPtvYvD409pwCUQiGulpFzcU/9b2V65quCvpRmZamVEoDBEGlZZWN9RLzfLt+wAk
	nxGhS07uOwaPc6ZYaRNcF99dbdd9eNxzgXD9vDsssFN/mXG/ZnJV4ShaFSIVD81BJG9kQR1w+zdwQ
	2aC4d86ZeUjEjsTEWQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwhFX-000LyP-71; Fri, 25 Jun 2021 08:31:43 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwh6t-000I1N-Vn; Fri, 25 Jun 2021 08:22:49 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 019801FE5C;
 Fri, 25 Jun 2021 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGXqgezA3DH40NKC8JsOWRUv5iKSH3hlmAbcoV/jF1o=;
 b=sIUNyE4N0TNyen69kWBc5Qi9GYyDr3usMOWqmwbvapYgcIApBH5g03EPAfbholTXVBq0HB
 qW/Jt+Due5/m6vPcJflQnZ+AzxQk1nGA5bG5CSd/lS3nCH9gvoZgvTp7FHt0cvq9329qqg
 tkbSZGINVww5SD4wAiyIG+Ho1u9nZRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGXqgezA3DH40NKC8JsOWRUv5iKSH3hlmAbcoV/jF1o=;
 b=OxjXlMZplkgOX2MP4aqaDLtgahD+h+HWgMnvflbDz75hs7nQnau9yVQkfQxIbRl7uxmCOW
 MwzbCK9nqYD9wwBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C477511A97;
 Fri, 25 Jun 2021 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGXqgezA3DH40NKC8JsOWRUv5iKSH3hlmAbcoV/jF1o=;
 b=l4O/3qDtyMcVed2sR3mXrb1VMCfITzjbUp3srIfMFtCXr8T5YKNSjVXe3u3xh43rSzdOai
 gu6savaGIgSayDTVf68kMUhpGiCCFwNQe4RKda7CcC7Mu/cB0NCKzeuxFm6vbBybd6xqMz
 GYeuvOakBBqvBhK1TK93d2nyuC14/Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGXqgezA3DH40NKC8JsOWRUv5iKSH3hlmAbcoV/jF1o=;
 b=hBiA/bd1f5vNc0KOfKRQeeGN2y4FetigJQ1PHzbPyKeLFSEzrAJoMz1YJu90pJc9aAP/U6
 xh7e/KUpYA8v5cBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id MPwIL1SS1WAISwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:44 +0000
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
Subject: [PATCH v4 18/27] drm/sti: Don't set struct drm_device.irq_enabled
Date: Fri, 25 Jun 2021 10:22:13 +0200
Message-Id: <20210625082222.3845-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_012248_279977_6CB6F75F 
X-CRM114-Status: GOOD (  10.82  )
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
with userspace modesetting. Don't set it in sti.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/sti/sti_compositor.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 319962a2c17b..9caaf3ccfabe 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -145,8 +145,6 @@ static int sti_compositor_bind(struct device *dev,
 	}
 
 	drm_vblank_init(drm_dev, crtc_id);
-	/* Allow usage of vblank without having to call drm_irq_install */
-	drm_dev->irq_enabled = 1;
 
 	return 0;
 }
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
