Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB393C47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCU/s6HqUkToAOYHUmvET0lGL4SvTZKlVsxyLKBpsao=; b=L/hMZhtr9L1ejQoAilCunZqrUw
	qYnUvPkFXfUMG2pmafMgdIeeHoSxhgr77Ab26MTd7rEtuIfpDUfcc/fkVwAjyAV5fePV+W8s6gmzh
	yRs0Wh82T7CjSp6JvuDjYKa3HQH7rqfZhTU5IfNCXyTH/QKpc2NYQ2WEIYSl0HUyXdEooDZqYTdnT
	tVU0XGp9WT/pgop/9PkqtiqVDd+K4g+GAdO2NEOP23BqxZIeIT4lHKGjTZr+T64VfyTqAvOy/+kGi
	FfXKhMjXBAlDo1kwaXnKuj7aRoPwphogXqR9SPZRY5j3+qd2NpDdKPwG/0f+DIKtClaKatx+dNNaL
	Rp53Zr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfx-0000000H5bz-3Lnn;
	Tue, 30 Jan 2024 15:05:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfp-0000000H5U5-2fti;
	Tue, 30 Jan 2024 15:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706627116;
	bh=6N6FAjXigJ9d8AkYgIE1f8w7WFjcPKRaWeUfSnl1DpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OR4aG3gcL75Vg89pgrdxJiieN9PUUtjILkykBHeHB/ibJ7dpxnh7arOXTZuyQlzLT
	 FmtSdff3adspZonXecyllV1UluP+Zc6Mr/3ZkcXEX5l265ITrK55RL5ELXMpDkXwWA
	 8y6D+aLEF/A34hnrn8NjWoe3lvA7szctTHo4f9n500nb3+IVVxhpx8ybyWsZwNFWGb
	 GVRnlsM/enEmxW+w27FNqoBEIXcoAuo/grBJ3R7CdaSI8nmfXRBb3qM7tqkXeCfRK1
	 taGEpnOkR+Cjx82fR7d5RTxpLILgvwd57Z/y1dj70+z4ZeS0l7VXtrXyJ00h25ouX9
	 Rsxi1mP2vCaLQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA71C3782081;
	Tue, 30 Jan 2024 15:05:11 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	robdclark@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] drm/ci: meson: Rename exisitng job
Date: Tue, 30 Jan 2024 20:33:35 +0530
Message-Id: <20240130150340.687871-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_070518_144277_6C3C96D9 
X-CRM114-Status: GOOD (  10.56  )
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

For Amlogic Meson SOC the display driver is meson. Currently,
in drm-ci for meson, only the display driver is tested.
So rename the meson job to indicate that display driver is tested.

Rename the name of xfail files for meson (g12b), to include
information about the tested driver and update xfails
accordingly.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Refactor the patch to rename job to indicate display driver testing,
    rename the existing xfail files.

v3:
  - Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME.

---
 drivers/gpu/drm/ci/test.yml                           | 11 ++++++++---
 ...on-g12b-fails.txt => meson-g12b-display-fails.txt} |  3 ---
 2 files changed, 8 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{meson-g12b-fails.txt => meson-g12b-display-fails.txt} (84%)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index e153c5a7ad80..bf4c303a65f2 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -346,20 +346,25 @@ mediatek:mt8183-display:
     - .lava-igt:arm64
   stage: meson
   variables:
-    DRIVER_NAME: meson
     DTB: ${DEVICE_TYPE}
     BOOT_METHOD: u-boot
     KERNEL_IMAGE_TYPE: "image"
 
-meson:g12b:
+.g12b:
   extends:
     - .meson
   parallel: 3
   variables:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
-    GPU_VERSION: meson-g12b
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b-display:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: meson-g12b-display
+    DRIVER_NAME: meson
+
 virtio_gpu:none:
   stage: virtio-gpu
   variables:
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
similarity index 84%
rename from drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
rename to drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
index 56a2ae7047b4..f123fb0cb820 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-display-fails.txt
@@ -7,9 +7,6 @@ kms_cursor_legacy@torture-bo,Fail
 kms_cursor_legacy@torture-move,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
 kms_properties@connector-properties-atomic,Fail
 kms_properties@connector-properties-legacy,Fail
 kms_properties@get_properties-sanity-atomic,Fail
-- 
2.40.1


