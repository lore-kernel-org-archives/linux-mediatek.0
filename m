Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A64C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 06:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGM2Lo+77eTW2sT6GSG0PxPTbzaNoVhzjny8RDp7voM=; b=tlBn8Yzf+peGBk
	jn5bDC7pnLarG/EhpyMJE+1lM7uocQtWvcJ5raCCaPZyqMfWgCwoQQJ9qvAG0r/DRfZJ/NWVPrAHa
	bQm58rnbOV28VsJSxVoQ1rBCr3ms0zkFqyz//pg00hTuq23QOGwolDO19sqNo+4It6cqBhYQyLWCR
	QyY4pol9G09fGjpxzeNYdkKhn0aOxNwqHFlZQctedaw5jJ6GO0KCJGewCICnPwWYy4EpBRtB022UO
	7GfgiUsLDqu0hH8YAbdcqFMBF7TMu+BNp9D6fFj7uyXYyZ+7Y8k7twlJnUb5YsS6f01hkm84aLQTT
	QK2YR2fS+hnxksXD7Lmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJUY6-00DJNb-Ns; Mon, 14 Feb 2022 06:09:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJUXs-00DJIo-0l; Mon, 14 Feb 2022 06:09:12 +0000
X-UUID: 224c8c46f1b84ea9869f47a75189d10e-20220213
X-UUID: 224c8c46f1b84ea9869f47a75189d10e-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1015230514; Sun, 13 Feb 2022 23:08:54 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 22:08:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 14:08:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:08:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
CC: James Wang <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <iommu@lists.linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <linux-kernel@vger.kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-mediatek@lists.infradead.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Stephen
 Boyd" <sboyd@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa
 <tfiga@chromium.org>, <srv_heupstream@mediatek.com>, Rob Clark
 <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 00/23] component: Add common helpers for compare/release
Date: Mon, 14 Feb 2022 14:07:56 +0800
Message-ID: <20220214060819.7334-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_220908_072561_1B1E16B6 
X-CRM114-Status: GOOD (  11.74  )
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

The component requires the compare/release functions, there are many
copies in current kernel. This patchset just defines four common helpers
for them. No functional change.

Change note:
v1: a) Split the original patch into many small patches.
    b) Use device_match_of_node helper.
    c) Move the functions into c and export since
    the callback doesn't look like it should be "inline".
    d) Add "component_" prefix for the functon names.
    e) Add a new component_compare_dev_name.    

RFC: https://lore.kernel.org/dri-devel/20220128081101.27837-1-yong.wu@mediatek.com/
    rebase on v5.17-rc1

Yong Wu (23):
  component: Add common helper for compare/release functions
  drm/komeda: Make use of the helper component_compare_of
  drm/armada: Make use of the helper component_compare_of/dev_name
  drm/etnaviv: Make use of the helper component_compare_of/dev_name
  drm/hirin: Make use of the helper component_compare_of
  drm/ingenic: Make use of the helper component_compare_of
  drm/mediatek: Make use of the helper component_compare_of
  drm/meson: Make use of the helper component_compare_of
  drm/msm: Make use of the helper component_compare_of
  drm/sprd: Make use of the helper component_compare_of
  drm/sti: Make use of the helper component_compare_of
  drm/sun4i: Make use of the helper component_compare_of
  drm/rockchip: Make use of the helper component_compare_dev
  drm/exynos: Make use of the helper component_compare_dev
  drm/mcde: Make use of the helper component_compare_dev
  drm/omap: dss: Make use of the helper component_compare_dev
  drm/vc4: Make use of the helper component_compare_dev
  drm: of: Make use of the helper component_release_of
  iommu/mediatek: Make use of the helper component_compare/release_of
  ASoC: codecs: wcd938x: Make use of the helper
    component_compare/release_of
  power: supply: ab8500: Make use of the helper component_compare_dev
  video: omapfb: dss: Make use of the helper component_compare_dev
  ALSA: hda/realtek: Make use of the helper component_compare_dev_name

 drivers/base/component.c                      | 58 +++++++++++++++++++
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  7 +--
 drivers/gpu/drm/armada/armada_drv.c           | 17 +-----
 drivers/gpu/drm/drm_of.c                      |  7 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 16 +----
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  8 +--
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  7 +--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  7 +--
 drivers/gpu/drm/mcde/mcde_drv.c               |  7 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  7 +--
 drivers/gpu/drm/meson/meson_drv.c             | 10 +---
 drivers/gpu/drm/msm/msm_drv.c                 | 15 +----
 drivers/gpu/drm/omapdrm/dss/dss.c             |  8 +--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  7 +--
 drivers/gpu/drm/sprd/sprd_drm.c               |  7 +--
 drivers/gpu/drm/sti/sti_drv.c                 |  7 +--
 drivers/gpu/drm/sun4i/sun4i_drv.c             | 11 +---
 drivers/gpu/drm/vc4/vc4_drv.c                 |  7 +--
 drivers/iommu/mtk_iommu.c                     |  4 +-
 drivers/iommu/mtk_iommu.h                     | 10 ----
 drivers/iommu/mtk_iommu_v1.c                  |  4 +-
 drivers/power/supply/ab8500_charger.c         |  8 +--
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  8 +--
 include/linux/component.h                     |  6 ++
 sound/pci/hda/patch_realtek.c                 | 11 +---
 sound/soc/codecs/wcd938x.c                    | 18 ++----
 26 files changed, 99 insertions(+), 183 deletions(-)

-- 
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
