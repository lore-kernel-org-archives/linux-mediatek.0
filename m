Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5D4C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LaHeIEXSDqLPWCEr1H1qx35IPhoAnKqjm7+jVCy8sXc=; b=NSZF72sss9jXf7esL1uk+if4uo
	l5lOfYyDHZwyhEIr3ghCanEgGa7dmVqSFf8TeyyaXsoowPNy4mh6Na89TylaQBp1jfWq3oUhVEgZw
	BJbGYlWz34D9ob6ALptauqudUU1HmNuqtlpazDBLoV8G4k9ClTrd4PAA/HRUhUUPyzZKfmoss6OIG
	MgpqQunZ/E41VKQZiID25SPm3pY/wCkGUG00QfsLndUzayUdaqk8HId61L94yrzWSTAU33vLqm0wz
	DBEGpDXNxQFt9EGCqJ92x8113dHV5goas6+6+IAVyAsWK/dKK3jEuv8Rzvz0a7KrJ/i+z+Qqu8mAT
	T7Pftu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ25-002xL5-0o;
	Wed, 12 Apr 2023 11:53:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZ20-002xGu-1Q;
	Wed, 12 Apr 2023 11:52:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 52D9266031FE;
	Wed, 12 Apr 2023 12:52:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681300375;
	bh=8iaiiDcFwWvEikKyBM/EHvngwZZN5lPfvgSCIoQUJv0=;
	h=From:To:Cc:Subject:Date:From;
	b=HHHKkgfyhj8S7yhY+Yhqg5BII5aB2y4NIJHNgD+UjIk95Qs4+XnnnbmvVgE6gcy5B
	 VUkR5cIoL6Qz7QKfOgOknbZKRJAKvrQ9LIg7FNPrdgXhaVff43Uxp9OfiPiF1IhswS
	 2IWH/up5QzCII5y3wzkkDi+ZX/wZO2D4tp27kk3WJNpwSj4ScylG+oGjAWgtKvCB0s
	 T8I6atAlXtuPgL4qZMlujWS6wFGf4dxa0mJCx9UcF1WDYRQKNJ4Uoht5S8YvsQdneo
	 B2qmRBiJov9X8jsAX72k0C9alFpSGqjl7tflXp7cV+u1z03CrJGOaLVBXqCPUQVIGK
	 5ufVyt/9cF+nA==
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
Subject: [PATCH 0/4] drm/mediatek: Small mtk-dpi cleanups
Date: Wed, 12 Apr 2023 13:52:46 +0200
Message-Id: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_045256_606284_271C9344 
X-CRM114-Status: UNSURE (   5.87  )
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

This is a small cleanup of the mtk-dpi driver, switching it to devm
variants where possible and where it made sense, and reducing lines
while retaining and improving human readability.

AngeloGioacchino Del Regno (4):
  drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
  drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
  drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
  drm/mediatek: mtk_dpi: Use devm_platform_get_and_ioremap_resource()

 drivers/gpu/drm/mediatek/mtk_dpi.c | 59 +++++++++++-------------------
 1 file changed, 21 insertions(+), 38 deletions(-)

-- 
2.40.0


