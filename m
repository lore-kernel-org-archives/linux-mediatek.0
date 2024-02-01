Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CB4C47DDF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m2emezRz8Asml0Bn0pPNmnXOd/FkD04O27kvKDHk7bY=; b=itHZ2/tA7CeTBZZbKBTVGrNUB7
	J9kNPjKYPv+ie5VmVq1TTChXG00xn5MzuTwmG1iXYWIKhV1Vze1IcHDWDrr9OdqPpgzOcSDgZFCcu
	fWWiIs7O/ZeXl6C7EMcGyQl45/JSyb5k7Av5jfp4KqQlcU8zTrCupdjki+LPajYQXTaiFaTp7wEJa
	sTAe+yTXmtRHsu/85qjgvKUVSCVndBYe4b2gxj13+eIrQmcWS3u96yDKoQXxnrOUy2e0hzYXDNg1L
	9AYYznOiEjCNI0lZI9G4G/C1R/VOrxlWWmkeNv5gKJSdYXBbmjUr4EweYmPMTOT1Y7U+8sNG6c0Kd
	5C+KBDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWZE-00000007qKF-2v1C;
	Thu, 01 Feb 2024 12:53:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWZ9-00000007qFI-3YzB;
	Thu, 01 Feb 2024 12:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706791991;
	bh=AiYqxfdfmN8jEke9jGAUzoN6GSbkaeqahTRB/bnjbXA=;
	h=From:To:Cc:Subject:Date:From;
	b=eYf4a29fl7BlgqPMXrORpEyZup6lT/KKme8ccW3IGZkpZ2xSBehBh8MFFv09N7mh9
	 JwPXb3xTHwmkcHVYo7LY6fQexTrliD0QAvcJQCFC3I+6C1RfpchwQNa2icK2HCQh+O
	 mUFmWV9cXvYPybkckWot0cjw47IEiXUEQzuPkzTJv5kaK4MmxAhjtH0iy2vRJu9Pxj
	 0ORfdgPpePj8pFFCUepfGUBOkTh64idLcx12YHp/5oCAcbx008BelXX3DadZd8IuIy
	 BSUuVa2jc/bk3kTdU1rj3UwE5HnJsKNrvOTA5xZM64Jn8B7qujwW8JKXtogEroim5f
	 Ml5HwSh5mWcVg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B6D44378047F;
	Thu,  1 Feb 2024 12:53:10 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	nancy.lin@mediatek.com,
	nathan.lu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH 0/3] drm/mediatek: Fixes for DDP component search/destroy
Date: Thu,  1 Feb 2024 13:53:01 +0100
Message-ID: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_045316_041816_E80D7066 
X-CRM114-Status: UNSURE (   6.56  )
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

This series performs some cleanups for DDP component CRTC search and
correctly iounmaps the previously of_iomap() calls from drm_ddp_comp.

Tested on MT8195 Cherry Tomato

AngeloGioacchino Del Regno (3):
  drm/mediatek: drm_ddp_comp: Fix and cleanup DDP component CRTC search
  drm/mediatek: Perform iounmap on simple DDP component destruction
  drm/mediatek: drm_ddp_comp: Add mtk_ddp_is_simple_comp() internal
    helper

 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 113 +++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
 3 files changed, 80 insertions(+), 38 deletions(-)

-- 
2.43.0


