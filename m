Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0A4C11F66
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 10:12:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3F360FF2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 10:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3F360FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z0oyemk5NaIksZA/9PO/wUV4Za/M4GizHuy6sQkHSTA=; b=vcp0DhxGyhyar4
	IFN/Ebwl/k/dZFOrowgOEuuK3ML73z4fJ7WPyiqw56W5QPRxh6Pl6G3bf26HqkJabE5aS9PhMo4Qs
	3rLr1zim1vSg585k9qbdSgBvA0U5LQ3BTreLftIZRdVjVZtXnnV3dzfbAj9+bed+X5i1z8YZCO+Hp
	WmUg+jQVnfMyZQpUKkWqcRyl7B3rms/gT8Rrxe2Ssfj93yO6samSLf8Ad7689exPvx3+nA3eprzMW
	pNuLCbJrOkti3MXEUVpllss2S3ubzYamNtD0WxxQnfODlvhrGdZQnMx/3YlOhKu1ITnzaC+bdIQQH
	xiXwdrc8uUZLrvK+EDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3bsH-00D2ii-BZ; Wed, 14 Jul 2021 10:12:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3brs-00D2aw-N5; Wed, 14 Jul 2021 10:11:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 23F721F42DB7
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, Crystal Guo <crystal.guo@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Fabien Parent <fparent@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: [PATCH v2 0/7] Add support to the mmsys driver to be a reset
 controller
Date: Wed, 14 Jul 2021 12:11:34 +0200
Message-Id: <20210714101141.2089082-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_031152_927501_B5148B9D 
X-CRM114-Status: GOOD (  16.45  )
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

Dear all,

The following patchset is a reimplementation of the patch sent by Jitao
Shi [1] some time ago. As suggested by Chun-Kuang Hu, this time the
reset is done using the reset API, where the mmsys driver is the reset
controller and the mtk_dsi driver is the reset consumer.

Note that the first patch is kind of unrelated change, it's just a
cleanup but is needed if you want to apply all the following patches
cleanly.

This patchset is important in order to have the DSI panel working on some
kukui MT8183 Chromebooks (i.e Lenovo IdeaPad Duet). Without it, you just
get a black screen.

Best regards,
  Enric

[1] https://lore.kernel.org/linux-arm-kernel/20210420132614.150242-4-jitao.shi@mediatek.com/


Changes in v2:
- Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
- Added a new patch to describe the dsi reset optional property.

Enric Balletbo i Serra (7):
  arm64: dts: mediatek: Move reset controller constants into common
    location
  dt-bindings: mediatek: Add #reset-cells to mmsys system controller
  dt-bindings: display: mediatek: add dsi reset optional property
  arm64: dts: mt8173: Add the mmsys reset bit to reset the dsi0
  arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0
  soc: mediatek: mmsys: Add reset controller support
  drm/mediatek: mtk_dsi: Reset the dsi0 hardware

 .../bindings/arm/mediatek/mediatek,mmsys.txt  |  2 +
 .../display/mediatek/mediatek,dsi.txt         |  6 ++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  2 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  5 +-
 drivers/soc/mediatek/mtk-mmsys.c              | 69 +++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h              |  2 +
 drivers/watchdog/mtk_wdt.c                    |  6 +-
 .../mt2712-resets.h                           |  0
 include/dt-bindings/reset/mt8173-resets.h     |  2 +
 .../mt8183-resets.h                           |  3 +
 .../mt8192-resets.h                           |  0
 12 files changed, 96 insertions(+), 6 deletions(-)
 rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (98%)
 rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)

-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
