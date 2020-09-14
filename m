Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324D2C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:12:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E67620897
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D6j3MuS4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZhLbfYJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E67620897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tyN5ZUAADjq6e3p2+WZEBwbKvJ1Uk26ZTNbYT/jGeL8=; b=D6j3MuS4oFiAwHXiNlTbd2fc4H
	pz/3aiNXVy/5XVxT8KReWng/vibk+ofMdNzvfCI9k4dKGT5RX6oNyh4xQRkD0bcJZ4HKspKhgBFTh
	ZTyYp1YxwpqXDX0WJIktcLWNn6xikGAfbi1FB6lCcjl02q7Y7h6tgNZEo+htKd39mfBw8YkIkk0q2
	8iGrLfvSijcs8+XOIEoSqwTK5f83aNynFKBhlVxQj5Ib8Fme0CGAq2faMmJvBBQQz3u7xncDePGvu
	skXcIzfTXRgh86favzLRK4hIBO4SQgg7XO6cRniSkDG3k7UCTQAB8KrALKpgCY4QNZroIJJu6RoIg
	46CTXEVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHxeJ-0008DS-Rl; Mon, 14 Sep 2020 23:12:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHxeB-0008CX-PM
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 23:12:32 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A1C320897;
 Mon, 14 Sep 2020 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600125150;
 bh=ilRqcuoTqEksaiQcJUzdJh0oFIOK/WygW04bpazbtmo=;
 h=From:To:Cc:Subject:Date:From;
 b=dZhLbfYJu5sZtodjE518NgSUfmltDgX5OIGvkvchit8XGMTxI4cSh99sgcScEGm3v
 XKJUp05ieeA3TGyIzY47Jtjb78WTulaAKREWYJkGEisBMOE8GIy1P07DI5A7aI6v0w
 DNQUBjqx59sZybX8QO6PbPNWQwD2Vk5p0Lwlx3D0=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.10
Date: Tue, 15 Sep 2020 07:12:27 +0800
Message-Id: <20200914231227.30500-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_191232_112100_94BDDC49 
X-CRM114-Status: GOOD (  12.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Move Mediatek HDMI PHY driver from DRM folder to PHY folder
2. Convert mtk-dpi to drm_bridge API
3. Disable tmds on mt2701

Regards,
Chun-Kuang.

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.10

for you to fetch changes up to 09e872d558ba6a7f4468c4e8cdf0cd5a99bfc175:

  drm/mediatek: Disable tmds on mt2701 (2020-09-14 23:05:23 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.10

1. Move Mediatek HDMI PHY driver from DRM folder to PHY folder
2. Convert mtk-dpi to drm_bridge API
3. Disable tmds on mt2701

----------------------------------------------------------------
CK Hu (3):
      drm/mediatek: Move tz_disabled from mtk_hdmi_phy to mtk_hdmi driver
      drm/mediatek: Separate mtk_hdmi_phy to an independent module
      phy: mediatek: Move mtk_hdmi_phy driver into drivers/phy/mediatek folder

Chun-Kuang Hu (1):
      MAINTAINERS: add files for Mediatek DRM drivers

Enric Balletbo i Serra (2):
      drm/mediatek: mtk_dpi: Rename bridge to next_bridge
      drm/mediatek: mtk_dpi: Convert to bridge driver

Frank Wunderlich (2):
      dt-bindings: mediatek: add mt7623 display-nodes
      drm/mediatek: Add ddp routing for mt7623

Stu Hsieh (1):
      drm/mediatek: dpi/dsi: Change the getting possible_crtc way

chunhui dai (1):
      drm/mediatek: Disable tmds on mt2701

 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt                   |  2 +-
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt                    |  2 +-
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt                    |  4 ++--
 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt                   |  4 ++++
 MAINTAINERS                                                                            |  1 +
 drivers/gpu/drm/mediatek/Kconfig                                                       |  2 +-
 drivers/gpu/drm/mediatek/Makefile                                                      |  5 +----
 drivers/gpu/drm/mediatek/mtk_dpi.c                                                     | 80 ++++++++++++++++++++++++++++++++++++++++++++++----------------------------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c                                            | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h                                            |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                                                 | 23 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c                                                     |  6 +-----
 drivers/gpu/drm/mediatek/mtk_hdmi.c                                                    | 21 +++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_hdmi.h                                                    |  1 -
 drivers/phy/mediatek/Kconfig                                                           |  7 +++++++
 drivers/phy/mediatek/Makefile                                                          |  5 +++++
 drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} |  4 ++--
 drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} |  2 +-
 drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c}               |  6 +++++-
 drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h}               |  3 +--
 20 files changed, 159 insertions(+), 59 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (96%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (95%)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
