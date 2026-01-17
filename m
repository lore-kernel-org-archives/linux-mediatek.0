Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E01C9830B
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jan 2026 00:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3v4IT7uWSytWUC/ktuY7y9Iyo/ioyXksI5Ob5LzQ34Y=; b=WJ7k94K/Q9sTLjvMdLMMH70qKJ
	yebYCJ19b8ObpzWMm/Ppesyd6nnqF4uwVNvNe1dKg3QAHbLyv9pJgUfTppV4/BhkYCxHBB0TmMvY0
	R2KerVq1hlY3jRej/xkcSY4yxkcK3ZDBbjv3P34pfZwqbZt+RivdHDre3dU1LKZhu7+BvQ7yzzBgw
	cDL/AUp3RPZqF6ZNZtc/p73+a7O9BN+Fe3xrnQGl8PKUE0jWrtVShxXMTgZR6WP5vrtpCZf1tMmy8
	fBfMq4IGA4ETfQ7YbWyldc/96EkX99Gp+MzdL2aubTGcf7UselU2Oa2CCuDF628j0lhM7GnOLjF6U
	wblRmndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguXo-0000000F47O-3ljw;
	Sat, 17 Jan 2026 00:52:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vguXl-0000000F46i-2QvZ
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Jan 2026 00:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E946242A5C;
	Sat, 17 Jan 2026 00:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2A3C116C6;
	Sat, 17 Jan 2026 00:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768611116;
	bh=i5NYbZPhxgD20wVMiqN2xiI5tZUHzwf8fDZZGFnHqnM=;
	h=From:To:Subject:Date:From;
	b=bM8WL8/nDTqkjg1aRQTxsFpbwDiYkyqEJ29XNwbeZJhF7ORyXzhPpBlgqsfPlibyX
	 E0uN4pXRsXOj7I6hpx+Jg2uc7ICpSHm5tnIFh+n5T//9a3uVjkhPKEkvMa7EJyc2kH
	 xKDHvd4/P+mX3uGrIHhTUArM4qwS/7WahbzxFXDS1MByU/aQ1CaU87Q6jtRn5b1tq2
	 925ermSRbIoS02xQcZ7HdqkikQ99FjJmpJo5u/M2UYmup6oEUVqhvn6TW7HhmefU0q
	 vkgCAxZn7YuEjrRXwB8DLPEJVmFDLfCXLN3KyDnllB0MjyeQcAOYXp3Uslb1/dOZti
	 Z6kDUQVCCUIrw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Chen Ni <nichen@iscas.ac.cn>,
	Liankun Yang <liankun.yang@mediatek.com>,
	Abhishek Rajput <abhiraj21put@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [GIT PULL] mediatek drm next - 20260117
Date: Sat, 17 Jan 2026 00:51:52 +0000
Message-Id: <20260117005152.3770-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_165157_664711_2888DDDA 
X-CRM114-Status: UNSURE (   5.80  )
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

Hi, Dave & Sima:

This includes:
1. mtk_hdmi_v2: Remove unneeded semicolon
2. Move DP training to hotplug thread
3. Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
4. mtk_dsi: Add support for High Speed (HS) mode
5. Add HDMI support for Mediatek Genio 510/700/1200-EVK and Radxa NIO-12L boards

Regards,
Chun-Kuang.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20260117

for you to fetch changes up to 79643afdd985ee14f9dddd66da262314f04d1640:

  dt-bindings: phy: mediatek,hdmi-phy: Document extra clocks for MT8195 (2026-01-17 00:10:01 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20260117

1. mtk_hdmi_v2: Remove unneeded semicolon
2. Move DP training to hotplug thread
3. Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
4. mtk_dsi: Add support for High Speed (HS) mode
5. Add HDMI support for Mediatek Genio 510/700/1200-EVK and Radxa NIO-12L boards

----------------------------------------------------------------
Abhishek Rajput (1):
      drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_crtc.c

AngeloGioacchino Del Regno (2):
      drm/mediatek: mtk_dsi: Add support for High Speed (HS) mode
      dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195

Chen Ni (1):
      drm/mediatek: mtk_hdmi_v2: Remove unneeded semicolon

Liankun Yang (1):
      drm/mediatek: Move DP training to hotplug thread

Louis-Alexis Eyraud (1):
      dt-bindings: phy: mediatek,hdmi-phy: Add support for MT8188 SoC

Nícolas F. R. A. Prado (1):
      dt-bindings: phy: mediatek,hdmi-phy: Document extra clocks for MT8195

 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 29 ++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.c                | 24 +++++----
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 57 ++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  4 ++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |  6 +--
 5 files changed, 87 insertions(+), 33 deletions(-)

