Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13CEC001B0
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aFArg5kACAe5Oei1u9k7Gh/cN/DUfFPPW++4rn4jJ3k=; b=hxhMYY2lIa7F32F4El+F4iAxVX
	8NfXNuj14wZicVAkQDKBkp8ePxIil8qpf6ASFlxhG6ecEaQU3aYRPenm8x1runquec60febvxxDPz
	0uo+tBSsk5IY/uV+Dk/DDGN1HUBGstRVolSkkC3Ebg+b9sUCxXHSJcyzdnmd55F54zRPa8/HU06zi
	zcyO3auxMrWE7NMlqp+IR5ilntDTdoqtmSKOF+gu2HVzlb6VADthNHacToWqmmwc2hcUfJxjnpEVn
	u5spYmgujR9Y2RbxLJ6V8lXDyVQOqwhJnQ2Q26JLoa/Ph2ueDq5WXfixdFpzFYlYz+sVlJEXOya2u
	1/u+3c+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVD0C-00FKks-08;
	Sun, 13 Aug 2023 15:27:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVD09-00FKk5-0E
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Aug 2023 15:27:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0903A6192A;
	Sun, 13 Aug 2023 15:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB43C433C7;
	Sun, 13 Aug 2023 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691940451;
	bh=xJYiJuaA3LSVPqhh7xJEHUAJFebjN0TG/fZeGdA6izU=;
	h=From:To:Cc:Subject:Date:From;
	b=bvAB4SVN3DQHiUalcwqKM9N5ulDXC1pWLwa5VniPee/kEyzkCHrSGA0l9yScBBfpM
	 +vVVVMcoNjZndPNbl6TRenwXV2FTNv8pEywYOS0DHkhgqQEqWyhVPTKN8e1gUpsFlm
	 FKArpkPdL/dn4oAbpIrILmzV2l9PebR6gZ0KUqzkk1/ieIfwKifE9pQ62GQo93rMuQ
	 UOahV1B/H19zvhxMF4iuG13RJ2wHbzH3+h37s+YdUMSLJ+4bInv4LeBmiCLl3yRKMO
	 r9p/cVwQ0LCkbVNILsANzlXNmIciceEJOK5t2KkkUDiSqiLGbSS9Nb/+PwO1AJEmEI
	 79VCYcSMFgZ3g==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: "Nancy . Lin" <nancy.lin@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Sui Jingfeng <suijingfeng@loongson.cn>,
	Lee Jones <lee@kernel.org>
Subject: [GIT PULL] mediatek drm next for 6.6
Date: Sun, 13 Aug 2023 15:27:26 +0000
Message-Id: <20230813152726.14802-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_082733_215730_971752C1 
X-CRM114-Status: UNSURE (   9.41  )
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

Hi, Dave & Daniel:

This includes:

1. Small mtk-dpi cleanups
2. DisplayPort: support eDP and aux-bus
3. Fix uninitialized symbol
4. Do not check for 0 return after calling platform_get_irq()
5. Convert to platform remove callback returning void
6. Fix coverity issues
7. Fix potential memory leak if vmap() fail
8. Fix void-pointer-to-enum-cast warning
9. Rid W=1 warnings from GPU

Regards,
Chun-Kuang.

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.6

for you to fetch changes up to fb7e600df0a006f3661eddb424cd92bae26df350:

  drm/mediatek/mtk_disp_ccorr: Remove half completed incorrect struct header (2023-08-13 14:42:43 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.6

1. Small mtk-dpi cleanups
2. DisplayPort: support eDP and aux-bus
3. Fix uninitialized symbol
4. Do not check for 0 return after calling platform_get_irq()
5. Convert to platform remove callback returning void
6. Fix coverity issues
7. Fix potential memory leak if vmap() fail
8. Fix void-pointer-to-enum-cast warning
9. Rid W=1 warnings from GPU

----------------------------------------------------------------
AngeloGioacchino Del Regno (17):
      drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
      drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
      drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
      drm/mediatek: mtk_dpi: Switch to .remove_new() void callback
      drm/mediatek: mtk_dpi: Use devm_platform_ioremap_resource()
      drm/mediatek: mtk_dpi: Compress struct of_device_id entries
      drm/mediatek: dp: Add missing error checks in mtk_dp_parse_capabilities
      drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
      drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
      drm/mediatek: dp: Use devm variant of drm_bridge_add()
      drm/mediatek: dp: Move AUX_P0 setting to mtk_dp_initialize_aux_settings()
      drm/mediatek: dp: Enable event interrupt only when bridge attached
      drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabled
      drm/mediatek: dp: Move PHY registration to new function
      drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
      drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
      drm/mediatek: dp: Don't register HPD interrupt handler for eDP case

Jason-JH.Lin (4):
      drm/mediatek: Remove freeing not dynamic allocated memory
      drm/mediatek: Add cnt checking for coverity issue
      drm/mediatek: Fix dereference before null check
      drm/mediatek: Fix void-pointer-to-enum-cast warning

Lee Jones (2):
      drm/mediatek/mtk_disp_aal: Remove half completed incorrect struct header
      drm/mediatek/mtk_disp_ccorr: Remove half completed incorrect struct header

Nancy.Lin (1):
      drm/mediatek: Fix uninitialized symbol

Ruan Jinjie (1):
      drm/mediatek: Do not check for 0 return after calling platform_get_irq()

Sui Jingfeng (1):
      drm/mediatek: Fix potential memory leak if vmap() fail

Uwe Kleine-König (1):
      drm/mediatek: Convert to platform remove callback returning void

 drivers/gpu/drm/mediatek/Kconfig                |   1 +
 drivers/gpu/drm/mediatek/mtk_cec.c              |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c         |  11 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       |  11 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c       |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c       |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        |   6 +-
 drivers/gpu/drm/mediatek/mtk_dp.c               | 366 ++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_dpi.c              | 104 +++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c         |   7 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c     |  16 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  13 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c          |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c        |   6 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c              |   6 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c             |   5 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c         |   6 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         |   5 +-
 21 files changed, 326 insertions(+), 274 deletions(-)

