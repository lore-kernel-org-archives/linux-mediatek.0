Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2CACD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 07:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f1T8/3OvwSnwBuMf0Y9HpOJTgaM0nW3wOnUThkX9kfc=; b=OvmOZVScnkOfmeNfy6kJlvuZ9A
	aZCnTilqNINPFP29xsgyDXFPMs5V/28x5OIxM2SOqQSI1IGHYG9EcPoDyHfrb08VvhHEInYDG1mDP
	7QRXd35K8fd/4w6E8qOpwOusC3pP/qeY4hzMvkkwYtKh8qzyvUToHvWJdhZR3ChvjJSasqopUnu95
	rM7215sdcaLSt78veYvUY648Bfmp+fKz7sb2KuIkComhiZsq6ft2RQDuLaKPGMGuJf2j1+IA35uBY
	XRJEYKx7zYhPch/Eqh/2KtBIQJ4heypEzgO8df9CXaACRQPbUlCfRqzwa2rAKo3aYAe0GLInnr1+A
	rgb5S/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHz2-00000001jKk-0bYJ;
	Thu, 04 Apr 2024 07:58:04 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHyy-00000001jIA-3PFi;
	Thu, 04 Apr 2024 07:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712217477;
	bh=JR03O6DqtWABDbF+UOdTpqbBb6MC16JinmCC+MPaEF8=;
	h=From:To:Cc:Subject:Date:From;
	b=NX6sNIxxfrVG0gUBHik5LbRQh3vPBIVl+iz/L8TLewL2G9Zr5eU+16R/ZPZQ8U1f/
	 417XkgyZ9trxK6wGGymLro2RJ8Emegg5FvEDpcwLhl+SNhpChMFIuBrMsvisR5kNJ+
	 XOLai6pqtm4XYbxlsnRKoWIR7ITgdE9/aSOjZSvIFCoLO8DSOssa9ppH+LN3+WAUbk
	 CYG9rDEk0sEdJdjlAn3cmVMZYyIUM4KcUTGypSaEjo/87DaeWXwxOhSnNcLb01GZAP
	 PGRsa7eCaO+TLwsm3YkJFGzmfGDK9ScyLmHZv+HtD1kyQVf7EQKef+a9ptAOZ3PetT
	 j4tj8H2HPMrcw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD48D378209A;
	Thu,  4 Apr 2024 07:57:56 +0000 (UTC)
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
Subject: [PATCH v2 0/3] drm/mediatek: Fixes for DDP component search/destroy
Date: Thu,  4 Apr 2024 09:57:51 +0200
Message-ID: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_005801_009118_19890B91 
X-CRM114-Status: UNSURE (   6.86  )
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

Changes in v2:
 - Fixed patch [2/3]

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
2.44.0


