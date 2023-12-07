Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294DAC10DC3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpPjOl/3WFkcJi4uty9/lQzslrE6qZRrpw52G1twArc=; b=ziFH0ywAdZlThg1U6OigFbwv/D
	YCqdpyoN+1y7Gomp55ZyU+kDdRnnIX8mAjXIgT9VlBoKiftyZ4ND1anIiBgnsxiB5GuDu4ymY3YSt
	pztI3jf0nrZ4YunQyuk1zSwqgJ0Wr9jhDJK9m49BuUUk6+C1hb1U4quIZD7Mam1NK9tE5TcW5Kl/E
	W+CDiBU/bzJ3dD1MRFte8QgbuOjLXNYeEWXZi9xaPtOWIUk+0vrYBjlCMcuOcylaopb1ROtFCkINZ
	YcDIrP+lIb/ushou+mZv4yhfkKtVVF0xmadGHnGD947KUNPGRCGc9zhgDKaGIZEYpsDpaxfFkjtQq
	5p9Bc6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAX5-00CKN1-0P;
	Thu, 07 Dec 2023 09:18:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAX2-00CKKL-10
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:18:58 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 164CF660738E;
	Thu,  7 Dec 2023 09:18:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940735;
	bh=+xSYPhN1BGDcENTTPFKpFCHhHqjjtI0n3VynHDjR278=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ffq4awDW0UzI25jKYArGiPiU2YBsfyjd8oM8rzG6mhrxkEbH3LZdUN3VwB7U/bjVF
	 wQp9Cz8EffogNEkxW0zJCwYDGzCTgal4IM2qIRHH4fAijK7094/teNfc/8UPlbiRCs
	 M9TqkZROFtiPh/GwR5uRKO/OKn3LtjVdGX9JTzdBWLkPcOqMVAyUeR/aLmecWoyacq
	 CnD7RZs6fMja8QVPaxC7fXnTbfmHgTgAZ7yZ1WOC3joJnG5zI6oO0bWbovNieSBfQJ
	 oykp/pjC6oEYhkSlkCMZo+xhDTtjpvgedOvtfR2sD23nVhyfSUmkwC+Vz2kfs6aOUl
	 EEHZzQTpuVJgw==
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
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 03/10] drm: ci: arm64.config: Enable DA9211 regulator
Date: Thu,  7 Dec 2023 14:48:24 +0530
Message-Id: <20231207091831.660054-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011856_479253_D992E1D9 
X-CRM114-Status: UNSURE (   7.50  )
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

v7:
  - No changes

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


