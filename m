Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2521EEE8015
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lytMR+vcRzzN59e4c6TlBnL8BfhYx5tIJLqfbByVJMw=; b=X2T1YPrOgIZTBVQLrV2wWShjHw
	iMKG5jvSlwl0dZV3fWxXWlIZYFmLDjjsNvQ7aVYETai5hgf0VtQZXQXnud7MoluOTcI3P17Z9iMdw
	LDeXz9irLyOv25paLVyrzE0U30RlPEcsAiy6g/bcG+8uIpDAV9ZEiM7iRKMDwDF6k6ylgVAbuCvuM
	hCiX/Gcr/hLO1bwpICBAZ52cce/r5j6bbOj9z7vG1yB8wfC/9uCgSsMA9LDU9/bPGNfjMlKQBEvZV
	7q+jfDjpdw2cXYyYaDmnydHq6c9ZHbD2JhlYqWqf1+xsHIsi9U7aDj3xtAghZB4weW+KqC54V4Ece
	M67Y6YgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKz-00Dzxl-0R;
	Fri, 08 Sep 2023 15:24:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKw-00Dzvs-20
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 15:24:00 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B15E666072AC;
	Fri,  8 Sep 2023 16:23:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694186637;
	bh=5EL9eVG51FsQl3AUWqIFCSbQ/zvgCyfjZgP+m+A22ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOBXsLznaxQVmUs/xs/cLj/OKsA8O9X3FCFqolqoPKMoKNn05MfErt3NG9MFj60VA
	 HW32LskUPFhwmEvWQQCiw2VrCaW2zoCN+o62NO8pIJ7YlZ0iny+kDP2pc6+QtRyBE+
	 bafb6cLs1viGLSnW5jwpHS3H2yzl9JW9PcY++Yi7C6R7E0MSBZsboUjz/ZLbl7/Ve9
	 LbbsN7m7IOMFd46fFKgOAUjRn0x9Zg8QWMKas08G7OrjGCrAu6TIM0CsX+Wk0XHejb
	 BW4xRUQJXvz921dt/+jcI9YYcIZ5qp431ANmpEuRD1lEgpif92WUN9V1cRsKcWvxAB
	 BGzh3vwSim6VQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	angelogioacchino.delregno@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	dmitry.baryshkov@linaro.org,
	matthias.bgg@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 9/9] drm: ci: Use scripts/config to enable/disable configs
Date: Fri,  8 Sep 2023 20:52:25 +0530
Message-Id: <20230908152225.432139-10-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_082358_786315_5019FD09 
X-CRM114-Status: GOOD (  10.46  )
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

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - No changes

---
 drivers/gpu/drm/ci/build.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 092c195af242..093929a115de 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -70,19 +70,19 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
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


