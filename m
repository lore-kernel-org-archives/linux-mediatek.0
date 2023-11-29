Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4236C10DC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Edy349FNAljpj2WbedkltWmMgsESaCDNN1TmpXeQWFo=; b=uaJuadSbW2gnbRMflrowhWb6zV
	5Xw5bKqBdBBg2PJmKO/yVY/0i7c74mABX4X2tAZF49RTg0DagTwiuK7YoK65GpinDdIXgTJ3oeJMY
	2nbyGFmPSlVpMYEGtO7GMN/lxpJb74qkqn10Q5aQ0kALeW20lii7TgMJ5h8gLhSepkA433Ax32ZZR
	k4zrjT5Q5FHMvWZA1wmKHf/ILKOnGyChsTSP9T1HOz7ldcnzAmcIy2BrYp1wT/lCU3SslPY9HOoAd
	EruQ7gspOV4ELl7nEuS2V5s57brUBZ7NYB37EVa3PzI/o3u3aXzTsUz806NdSK0HKr2r/cSpBTphD
	9zYsSc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JXC-008HXN-2H;
	Wed, 29 Nov 2023 12:19:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JXA-008HUn-08;
	Wed, 29 Nov 2023 12:19:17 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 51A836607323;
	Wed, 29 Nov 2023 12:19:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701260354;
	bh=LAiI9Zj6sblQ9PE3ddYSUkjK2felt6gCjLGE+jeFyco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JBI4zughUA/jDHu5gvDlkhlQ5iGsI0NYo5djTinqxMvhvHuDL9bSt1DDeaRw3TBAT
	 ZiribR2NUqhV0adE8O1YoMaTEFRKv0yVj3zAmRa2W9wlPxBNBssuJACW/srDajZ1O4
	 iG9tvVfFGLM+nz4d0IfGEM8z+WXFDNn5wOvScmCRaVzjfzH5oUjg7AdsyK4PhFoBdA
	 FTWe8m5UzZNrL1u7FY3c1Y5tXX97pTHJSl8PQEPYT+mZ6gIUR3dT45aiEPBLbXsKn7
	 UWvTMSQiBFwEkd2znzd6OkgY89FvIvgUxk8ik8lU5tMiQwK1Yc1wywyq3u5haVFEEh
	 /waf/05mDmOwA==
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
Subject: [PATCH v6 05/10] drm: ci: Use scripts/config to enable/disable configs
Date: Wed, 29 Nov 2023 17:48:36 +0530
Message-Id: <20231129121841.253223-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_041916_213103_30FB84D1 
X-CRM114-Status: UNSURE (   9.83  )
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

Instead of modifying files in git to enable/disable
configs, use scripts/config on the .config file which
will be used for building the kernel.

Acked-by: Helen Koike <helen.koike@collabora.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - No changes

v4:
  - No changes

v5:
  - No changes

v6:
  - No changes

---
 drivers/gpu/drm/ci/build.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index e2260b4a1c67..97ff43759b91 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -75,19 +75,19 @@ else
     fi
 fi
 
-for opt in $ENABLE_KCONFIGS; do
-  echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
-done
-for opt in $DISABLE_KCONFIGS; do
-  echo CONFIG_$opt=n >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
-done
-
 if [[ -n "${MERGE_FRAGMENT}" ]]; then
     ./scripts/kconfig/merge_config.sh ${DEFCONFIG} drivers/gpu/drm/ci/${MERGE_FRAGMENT}
 else
     make `basename ${DEFCONFIG}`
 fi
 
+for opt in $ENABLE_KCONFIGS; do
+    ./scripts/config --enable CONFIG_$opt
+done
+for opt in $DISABLE_KCONFIGS; do
+    ./scripts/config --disable CONFIG_$opt
+done
+
 make ${KERNEL_IMAGE_NAME}
 
 mkdir -p /lava-files/
-- 
2.40.1


