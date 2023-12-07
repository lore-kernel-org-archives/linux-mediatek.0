Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E712C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbdLL/b81lAO/6ZsmNd6t/3Sz11hlrzT/CNbv00TzyU=; b=zymBPFitxY9tvNpB9dSTI3hx7+
	sGKfeIyfgSaawP7U12uGJdlkdgD6Q2tyLZ0O9afn91GPSqEBIDv/xvKK70hM3nq8tSKbdTC+EYXQL
	N36jClzxiKbJLGX21/9qo/6Q/siSgyH1UJNSit++MEn3/XslkTiQEBRlSvT6iT2j91z//0qJNKkz5
	8P6/BfeXcK6MSN59zGMEH8df2cALAMjUEDKf/uDbTQ3uPsiTeecL4yUBTDU6+Dfy5JpsQt0CLNUnC
	33j0Bk/KWjdEYDWfqeo+bcxUFvpXxKp9xA/aKVZpYmVuWQYISSL+KoYIivAMr3yGLTrJwiAmC9JFj
	nQbgnIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXF-00CKUM-1U;
	Thu, 07 Dec 2023 09:19:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXD-00CKSI-02
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:19:08 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CAC7A660739B;
	Thu,  7 Dec 2023 09:19:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940745;
	bh=FI7vvMbXu6jw/8V7yXWu5M1HVFfmnKGFMWLn6Tl2uAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bc4qjA9TxkLS3NJOdvzQjV+8p6+K/mNbdEUkQRGrDgCxj+vR1BTD9G8EIC1Dr0y7F
	 NRa3+ZxR/e1uR7rThkSZ6SLCKrzUeAuCp85mz2kg3lNhyKl3kz7EDNf3jH1vyVTi2I
	 H7ByDIJ/kzpIc8xZFEzwNUQqyoRAeyTLttFHVElO34ZVjbo0wsGuMfLr/jQTIiNq0G
	 IowVm/oItYDlR0ZVJp2qrxRtNHxugUc8j45jRMsuHO81TfgBRxvuxhAJGkLr4h1XQH
	 7h05n7Bu3PSMdDs7p2yrOeKuFOVPcaR3dY+i2ZkOycSr8Ga34LLYDP+XBKtQ5jAsB7
	 2CEUg+1OYLf4g==
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
Subject: [PATCH v7 06/10] drm: ci: mt8173: Do not set IGT_FORCE_DRIVER to panfrost
Date: Thu,  7 Dec 2023 14:48:27 +0530
Message-Id: <20231207091831.660054-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011907_188039_BD806A4B 
X-CRM114-Status: GOOD (  13.45  )
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

Mediatek 8173 and 8183 SOCs have a separate display controller
and GPU with different drivers for each. For mt8173, the GPU
driver is powervr and the display driver is mediatek. In the
case of mt8183, the GPU driver is panfrost and the display
driver is mediatek. Setting IGT_FORCE_DRIVER to panfrost for
mt8173 is not the expected driver. So set mediatek for mt8173.

Support to test both GPU and display drivers for these ARM SOCs
will be added in the next patch series to increase test coverage.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173

v6:
  - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173

v7:
  - Rework the fix and reword commit message

---
 drivers/gpu/drm/ci/igt_runner.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index c6cf963592c5..f1a08b9b146f 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,9 +20,16 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip|mediatek|meson)
+    rockchip|meson)
         export IGT_FORCE_DRIVER="panfrost"
         ;;
+    mediatek)
+        if [ "$GPU_VERSION" = "mt8173" ]; then
+            export IGT_FORCE_DRIVER=${DRIVER_NAME}
+        elif [ "$GPU_VERSION" = "mt8183" ]; then
+            export IGT_FORCE_DRIVER="panfrost"
+        fi
+        ;;
     amdgpu)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/.
-- 
2.40.1


