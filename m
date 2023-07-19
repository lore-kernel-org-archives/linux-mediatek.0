Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76723C001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxzWsRaU5XAlggThHiidDD19i0Dq48k73iIM3XmpNfA=; b=XU6IOB2OIIbz+T
	NbckEPis3ETaLFOSIl7jTukkaRIO/s80qC54DTJss386JbBx68I0/vtGICk88MBR55nF91IjOBxSe
	pOLddbdUNL05TKpouBPWlbQ6tDERzwtvlvpv5sCCatWEdTgvycm4u/dts2SSfsCpcLgh+nKhPvFFv
	Hv8QysFrdCMBeG8rWuv8T+v61SGDNZTkTXwiBqyfcXFnkzq5y7sr1QRxpHxwhlII2E1B7r5EKayT1
	PpJ0cfzqO/XTTR4aeYfi8D6twFRrZAXiSESRcoxIGNEIdWKm0s7tSMTdj9U7fspqmTm87qXPlDifa
	cKNjOQuVwxleYa2pNOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xo-0068pc-0V;
	Wed, 19 Jul 2023 07:51:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xk-0068my-0W;
	Wed, 19 Jul 2023 07:51:09 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 12288660704A;
	Wed, 19 Jul 2023 08:51:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689753066;
	bh=GHT1o/URgGKhDhU+jS7uxQ4L+jklUoeHFxxBe3xYfCg=;
	h=From:To:Cc:Subject:Date:From;
	b=mUwEqZO8afN7oGV9HJ7vHhe3METlJgBKFXslTZBFSkXZGigNLULQQfgKV1KXaUTmm
	 RhGqWPnexSBUCIDKRYYzs9DjW+ptKqCddqymnBNurKVUZ2Ieq9gDbnSFmgq8WCmno5
	 9VkP+lpzcNcHu4fqBdCaC/gTVLB1CNJh86NofZdIHbJ6w4lWIe13OhesqHTuUBLqTC
	 H+O4EVEuZV5bnp5cetI10eQ5+p6/TKy3iuMr8F/ILo2uBQWvtqU+LZ1SNIW9EiJL3A
	 KcpPtEgmjgaNymKJCJ1dmIg1xRjRCl/MjmrG0q58KIyQjsV1FHxan6UTbFBbZTS20V
	 gFMkd5c6KWk4g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 0/6] drm/mediatek: Small mtk-dpi cleanups
Date: Wed, 19 Jul 2023 09:50:50 +0200
Message-Id: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005108_362147_9EDF5438 
X-CRM114-Status: UNSURE (   7.87  )
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
2.40.1


