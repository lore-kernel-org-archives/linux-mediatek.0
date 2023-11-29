Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6691EC07CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSkGW27ZvBIF6MNZPYcxiV+0RV4aKeKULOjeQftURTY=; b=Ao71gzDvhfV8q62wYZjtqVY4jU
	oai9KeWkCHjmgdVvMCosfKRBJJKZWLo7/Hv7EzZPMRD+6BvwCA5xAwABctwqN/r/JxOoM6bqGW4AZ
	xWpb4bKtH+mbDsQ+kNyFWRhAZzRSpVSQJw+IrGaxHIJoGrzXXtyR4ECucLOmjWRWgPL8Eo7YWBDir
	SdLHp3PT/kvrHHN9New7iWJ2nbRAak8rHF50FDrT57t7t193kMlt5dkHRlCVDxvZiSK5wzIJCObFI
	BoLk26crnQ6JJElqXPQUIViyfyXTtYwUQJpj5NCFEAMPrAKXJb+uhcOm+dJ9sA4Q4L+H917Zw+B+4
	2dsqtiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JX4-008HQy-14;
	Wed, 29 Nov 2023 12:19:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JX1-008HO7-39;
	Wed, 29 Nov 2023 12:19:09 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 22BC86602F24;
	Wed, 29 Nov 2023 12:19:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701260346;
	bh=jtOx/7NoZzqOMAnpBtB9GJItxRHHHlEm6yj66jXJL6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cESTV4V42mPAKCChVMQlOKBvZnr5RUqPtiSeZcNslr5Eq+AxJMuxPERH+C7xtlPnW
	 dPVqExtF+ejvtER9rbMHr3G4rNwNAg21bw8xK8dFddqpduHkonsvjfMFOownugQodp
	 8L37fo5S9JOvGp8l5oqEi+RzHHaj1fWegtX3dlgGYj+mfVFz6uGfFhLRV+9mBtTYYG
	 JyMD0KI9DSeYL4g2/ZqheCJIBDdx9Og9rjaDSxHd3wl4JE8LfvLASY62b9TbmH0ar8
	 XbL06cPJP1rO7IHo2+Q12XMGHe6bN+/b/tSSCS2Cad6bB3EEFL7kyL4ZGrvYcIC20j
	 y/FTJ7V5AP5IQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 03/10] drm: ci: arm64.config: Enable DA9211 regulator
Date: Wed, 29 Nov 2023 17:48:34 +0530
Message-Id: <20231129121841.253223-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_041908_142703_334ABA21 
X-CRM114-Status: UNSURE (   8.64  )
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

Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
Enable CONFIG_REGULATOR_DA9211=y in arm64.config to fix mt8173 boot
issue.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

v4:
  - No changes

v5:
  - No changes

v6:
  - Updated commit message

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index b4f653417883..8dbce9919a57 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -186,6 +186,7 @@ CONFIG_HW_RANDOM_MTK=y
 CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
+CONFIG_REGULATOR_DA9211=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.40.1


