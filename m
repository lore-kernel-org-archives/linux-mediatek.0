Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68D3C7EE43
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bdjQDa2CSB5TDpC4t2izbKWWsI3+nOORPdJBIQ1KdMw=; b=WDrOuVXgTnjvlnD97FE9guNH3A
	88rSKb79FRQGjFpxMbWS5hKhImOEXDBioRkGtAxcpO/Mg31FEnYexll3Dj6NYhSL8magJXZJIZpzm
	xG3f0v9CUjCB6QqTtko7xmYoPCI2htU5LlGJdsYZBPssMz0iuPHK/exOKv5TLZNgxKIljofH2pdy4
	jRwbbFe4ZyELpxWXUmB2TQkVc0/1czyiSVAGivWMyBopgXXKNwodY3qyoHnl4++MR0g3z2uevabom
	26HpRPTGS6CWz35FmFLl4BSHCBlQZ74tj6kmVvvb2IjcaWmo3ueAm+vTbSwKeCeMeVr0n2mzmyfi6
	eAKwncwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ccs-008njL-1S;
	Thu, 08 Jun 2023 10:12:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Cco-008nh6-34;
	Thu, 08 Jun 2023 10:12:16 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 01C966606F10;
	Thu,  8 Jun 2023 11:12:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686219133;
	bh=htK85a15rgB70pAiwirg1NuBxZSlaNpIlLEQliB0CKQ=;
	h=From:To:Cc:Subject:Date:From;
	b=KXRtkM4CXJf+IOobM2UO7YbpAL05O78sIPHxI2S5I6kSf1wCmo94OLUl7IAgrUiOt
	 nKWRrOftMrcsEBZGfpLdcHvnbsm8QiBUZXhF2+SOXAU3LtPJ/GZUVKziaX/kdmZFfe
	 rtb0TEPQK3exBin/8T6WjwAj+Y2BlE9JODWUBLk0AQN4AbQE0uqptb+/tORNIMcRem
	 kOReUlz1/AwZ5zidDHcbWWd+mSgMTVfRe07k+bdVrS1W5xRwSC25rkuo2WyLxLWurj
	 PeIj9NwRH8r909MctKH5r+1s7A/Wr1sHMewI40u6pcss2gyAnlS8kq1eogOS+gTbPp
	 LQBpdN8pBqjFQ==
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
Subject: [PATCH 0/3] drm/mediatek: General cleanups
Date: Thu,  8 Jun 2023 12:12:06 +0200
Message-Id: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_031215_117294_627FF0D8 
X-CRM114-Status: UNSURE (   5.70  )
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
it to use devm_platform_get_and_ioremap_resource(), dev_err_probe() and
devm_pm_runtime_enable, hence harmonizing log formats and removing some
unneeded lines of code.

AngeloGioacchino Del Regno (3):
  drm/mediatek: Use devm_platform_get_and_ioremap_resource()
  drm/mediatek: Use dev_err_probe() in probe functions
  drm/mediatek: Use devm variant for pm_runtime_enable() when possible

 drivers/gpu/drm/mediatek/mtk_cec.c            | 29 ++++---------
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       | 21 ++++-----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     | 19 +++-----
 drivers/gpu/drm/mediatek/mtk_disp_color.c     | 22 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 19 +++-----
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 28 +++++-------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 26 +++++------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 13 +++---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      | 43 +++++++------------
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 21 ++++-----
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 18 ++++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 17 +++-----
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       | 15 +++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 29 ++++++-------
 14 files changed, 121 insertions(+), 199 deletions(-)

-- 
2.40.1


