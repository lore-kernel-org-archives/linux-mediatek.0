Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D582EDE999
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 08:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r21GcSm82WSdQ0ZGxXoEClS5nUm5GEcWPEs5LsOpEdU=; b=yOrITqNvmJhro7gnSn12NPaLxX
	CiFQSRklkbDB+eBkxfrkuPQICd4odFPWxfJmpt5aWEijHlkpqbP8jE0HPZ+vlLX5cB10MHn9Qp01q
	ZQplR/cEg7S3i9LUdEsrS4PXdUMTmoGvVdUZpUws01qsUjwD/w3ZFde5t5x+F87dMsqJoHM6jIEHG
	iqhd6mkQbKc9pCvIz3TQNCzeNOWd3dDuSDhlgtKDBFbW+Nh1pVBHDzSvrKQzBRg2Z8XJSyr2lnuP/
	LJGLv85zpAL/LE6v3Y6TUZg2SkA6cMxEyMF6dvnvioxoTbqbsLFAugveDjK/rpLl3tuxcWWEcw2LM
	2dRqG5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi7o-007lIM-2I;
	Thu, 14 Sep 2023 08:55:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi7l-007lDp-04;
	Thu, 14 Sep 2023 08:54:58 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 559036607346;
	Thu, 14 Sep 2023 09:54:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694681695;
	bh=r1jaHMPOHPCTM2uD5QgQxj8lASgXqxWcsduJK72LnYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YKB1By0On5GV8IZ9K3s+PjwayG74dV/8I/purQcQsY+OQCPoR3o32qfJgNKUUsoXf
	 SqkXNdhz2Ic+HorT016zwCFpCSTbBT1Dv95NBx7CCTGH+NwJiR6Grhh4xUuX5zA8/d
	 Huh7BxNo6pxcBB977hLUMmZwe1C/OxLEgae5TTq8PTz4MSyLm9miJARaGxzXem2RdT
	 CJsfL+9hsC4AqCgP8mXh0M2Ar1anV2GYrIjSN38SY38gYi+fwo4BfsQeZhbSIvp9Nb
	 Ceh0tZiKZV9LAcYSFWLdRAYmzVL7euf7ed8p37qJGcEeNig5YxPZ4lC66FY14n+qaJ
	 gYdAHyqOKihGQ==
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
Subject: [PATCH v4 4/7] drm: ci: Enable regulator
Date: Thu, 14 Sep 2023 14:24:23 +0530
Message-Id: <20230914085426.883255-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230914085426.883255-1-vignesh.raman@collabora.com>
References: <20230914085426.883255-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_015457_187802_E523CC24 
X-CRM114-Status: UNSURE (   8.24  )
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

Enable CONFIG_REGULATOR_DA9211=y to fix mt8173 boot issue.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

v4:
  - No changes

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 817e18ddfd4f..ca95e141a7ae 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -184,6 +184,7 @@ CONFIG_HW_RANDOM_MTK=y
 CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
+CONFIG_REGULATOR_DA9211=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.40.1


