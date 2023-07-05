Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D75EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zgy577JCdaO/FRhLElxSLndyWxA1tVn7RX/mdF8tKUE=; b=uRGuxd0wWDH3ZJWaabesnmonkI
	5AlvDPEbzORlXVYzuoyh55ne2/K/QLrm+ST2pgn744/aKIJRpxMx0PmSptg4PiekWAGgZysV8YOt+
	NFSMSlz/9o2YCeOTuquXyZ2xpBmXNpDsAAHTCLyhPmgFlUL5qCWfnqXEpPtni5WEEH1wTICTLEipH
	hCM6lBHBnGo0tMVP09ae6zGUgwVpiV4Pj8pq4DCsb9cr/aM0gbvbo/3HftrE81SIR9mhfCMoEuynf
	ZKJG8P1qaEfU50dbSIUOBAyCBNH2/9F6UyKujlhMX7tuUFowLyHLGugJYFC1WZpZY1NmHXg2NEnqw
	/4IGw35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGz25-00FOAm-0O;
	Wed, 05 Jul 2023 09:42:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGz21-00FO8Z-1w;
	Wed, 05 Jul 2023 09:42:43 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F2C3D660087A;
	Wed,  5 Jul 2023 10:42:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688550159;
	bh=zINDDL4xiGK/8luSkmKXT+SCyjHKCbbr1Sc9XWyTjCM=;
	h=From:To:Cc:Subject:Date:From;
	b=GuCdJlW0aAu+LpdTEmm5X87DRUudiBJENtp6Ld0vjQY7EaPja74qJ2fQ7MK4Wewo1
	 ksoE7FJQ5+LMx2McHb8JCxk8hPnYTHI5JrRp6GwWwNSV4HReFc3RLG3noT3uV4rn58
	 8Asj6s/x/gIUZudjq1oEBO2BCh9xClWkYOtDdB+t7PAAvnZDPy+/HCNeDaqO7XAfn5
	 M0+1z3NaUV63Tu3J/aV+5JXOwLNI6QKQAe2zDCWiYxKx8kV+TF43iMt6TgtScMgZeL
	 1mlDAL0SYMMGKK7VbUcZ/8T1Mnzgb3sKs3o+TnEG1kSXO8BdA8V40LnJdQQm8PmQLG
	 KxZoYMbGr4wZA==
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
	kernel@collabora.com
Subject: [PATCH v2 0/3] drm/mediatek: General cleanups
Date: Wed,  5 Jul 2023 11:42:29 +0200
Message-Id: <20230705094232.75904-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_024241_845455_F30395F5 
X-CRM114-Status: UNSURE (   6.49  )
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

This series performs some cleanups in drm/mediatek; specifically, changes
it to use devm_platform_ioremap_resource(), dev_err_probe() and
devm_pm_runtime_enable, hence harmonizing log formats and removing some
unneeded lines of code.

Changes in v2:
 - Switched from devm_platform_get_and_ioremap_resource() to dropping
   struct resource pointer with using devm_platform_ioremap_resource()

AngeloGioacchino Del Regno (3):
  drm/mediatek: Use devm_platform_ioremap_resource()
  drm/mediatek: Use dev_err_probe() in probe functions
  drm/mediatek: Use devm variant for pm_runtime_enable() when possible

 drivers/gpu/drm/mediatek/mtk_cec.c            | 29 ++++--------
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       | 22 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     | 20 +++------
 drivers/gpu/drm/mediatek/mtk_disp_color.c     | 23 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 20 +++------
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 29 +++++-------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 27 +++++-------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 13 +++---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      | 44 +++++++------------
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  3 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 22 ++++------
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 18 ++++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 18 +++-----
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       | 18 +++-----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 30 +++++--------
 15 files changed, 122 insertions(+), 214 deletions(-)

-- 
2.40.1


