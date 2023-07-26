Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7ABC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QLeQpxi8sHi7ql/SHPOFZupRF4A4pXBpX3t3WkR2lEY=; b=W1WcgWu+vtKHXa
	tWUVPaBC0acleDq9MyNyJ+k2u31Y8If4rkru942GKsBb8uFtmuziqlnv/Iz4EwoKiaroBj+D6qVFB
	vbTB9yz1p5tXk01+wX2RMq+dvMpe4xSNcsLmwU+hXnepzM4QNpOEWSYW3DQpwM/rhKMNUzBW0fmCA
	U45R0yl2fd3wOF87jJ7UiPeOmaDMeYS4h6L1OEG72yoPONiCji2OU2fncFG9I6nU3HN6z1JrhJo4j
	0zYStXamIMd6w2zpFPi4t+6WO6QF10xuxkTkqMrwtDH4XLnPO4OfWUs+Ggxmj1891KshZA3j/1Wjn
	vKtVybIDZK9nHkk37xXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnR-009ZVU-2L;
	Wed, 26 Jul 2023 08:23:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnN-009ZSJ-3C;
	Wed, 26 Jul 2023 08:22:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1ADB466015A0;
	Wed, 26 Jul 2023 09:22:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690359774;
	bh=2FI4H4ZuB88bJj5ThgiVFOLbFXbRfR4pQKiai84ySXE=;
	h=From:To:Cc:Subject:Date:From;
	b=htPJevGv9woHxVLnVshT+DxXQ5Qw8YdZjOtXszz0ml3btE1K0XA7IPUhfVbs9XjPh
	 QzdxoOiMk4L2UZo17kkxO8JGF7UBJy0rPPkLsOMqzI69EYcJFD+94a1vu2zDqY6fJm
	 rC2oqWJAaH+oHnrBtVzJxlPDLP6Lc5ud5TYMjaEsHX+AOs6Vk9OdXuMjavwthuWx3m
	 tAVNnzjbFvM3wycKbTaxR+Y0jLqSs6rqBZ6c2svDMgUj0wY3TealqIAX/54mOBC/hv
	 C1OcuptPopAWpMFyFlemQ2QSH7WdeY4kxWZZS0vh7xIoMnl7hhVWt3Y7GFmFMrC9P0
	 dX1l16lkpjqzw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 0/6] drm/mediatek: Small mtk-dpi cleanups
Date: Wed, 26 Jul 2023 10:22:39 +0200
Message-ID: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_012258_197076_F7595FEF 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes in v3:
 - Fixed removal of mtk_dpi pointer in mtk_dpi_remove on patch [1/6]
   instead of patch [3/6]; thanks CK Hu!

Changes in v2:
 - Removed drm_bridge_remove() call in patch 1
 - Added dev_err_probe print to devm_drm_of_get_bridge()
   call error handling
 - Switched to devm_platform_ioremap_resource() to remove
   the useless pointer to struct resource in probe function
 - Added a commit to compress struct of_device_id entries
 - Added a commit to switch to .remove_new() callback

This is a small cleanup of the mtk-dpi driver, switching it to devm
variants where possible and where it made sense, and reducing lines
while retaining and improving human readability.

AngeloGioacchino Del Regno (6):
  drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
  drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
  drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
  drm/mediatek: mtk_dpi: Switch to .remove_new() void callback
  drm/mediatek: mtk_dpi: Use devm_platform_ioremap_resource()
  drm/mediatek: mtk_dpi: Compress struct of_device_id entries

 drivers/gpu/drm/mediatek/mtk_dpi.c | 100 +++++++++--------------------
 1 file changed, 32 insertions(+), 68 deletions(-)

-- 
2.41.0


