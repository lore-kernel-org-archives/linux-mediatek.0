Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC304C83F3F
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gp0QKwpWwh6GvuFf8V+7MH4f8QwntR9CIbAHmDXkZA=; b=BMhaVRYenTEYKaX41+3EH03aIJ
	J6UGWnQv/ZxNStZG50/HfxkUSGBUh2dJr4pimbFhjmUXQ1teaYyk6Id8AaWYpq0x2ZvpZZI8GJEQs
	vBptjJfxwPmXb1ZQCY+Yz9Au+us9IACTBfdIVokNKcAycmVycjmQaTbNT8Dwguf6S9sR9bynyz5J7
	lz1IvpoZx1BvTe9RHLNbwoND97MaX5zbVxDaQseYkmxs2abQOpBQE2PfrTUbncq2nf3t561aboAI5
	p+ePKBx8uyppSW7GP269siyw356tSg+XNq6uRhdWObBPAg76g1McJtyoSUqDSdVqOEVgyolM2O+88
	mGaMYsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFW-004Rxp-2L;
	Mon, 04 Sep 2023 16:16:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFU-004Rww-1p
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 16:16:25 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A995866072B8;
	Mon,  4 Sep 2023 17:16:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693844183;
	bh=zFqttaYZLcrzVe0HaglrMmejxKKOSu901QLw+H/wB0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nLzwg6q5d/mdGSkc1ECUOZVhKdYSEY5X/XCHBSHOMPcZH2jrOF8qCm8QEM2zYnWzP
	 2r17Hdxji0WxRB16GmbqcVQ9f1WteLQboMKvOqfS5cjnb3C4eLoRljgCRZehzqA2Ig
	 h5XcooSx409BCPk7J6pw0jp/uCmKOZ8CobD2TddN6e+bfa14FT1TMWRFpNRBNrylw5
	 EFAD6FQuD1JTeSI09eQEUfuxAXf1bqbadl138cK46fTCBRxnK5l6H5Pwd/kGQAW9/D
	 e5TNK/JqcZxTDUWinriKuial1gEXWkmmN2wbY0xyohz8QQO3kU/a4VC2T8a3/q9FmP
	 HWBOe0Xoy//9g==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/7] drm: ci: Enable configs to fix mt8173 boot hang issue
Date: Mon,  4 Sep 2023 21:45:13 +0530
Message-Id: <20230904161516.66751-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230904161516.66751-1-vignesh.raman@collabora.com>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_091624_731581_B991DCA3 
X-CRM114-Status: UNSURE (   8.39  )
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

Enable regulator
Enable MT6397 RTC driver

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes
  
---
 drivers/gpu/drm/ci/arm64.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 817e18ddfd4f..ea7a6cceff40 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -184,6 +184,8 @@ CONFIG_HW_RANDOM_MTK=y
 CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
+CONFIG_REGULATOR_DA9211=y
+CONFIG_RTC_DRV_MT6397=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.40.1


