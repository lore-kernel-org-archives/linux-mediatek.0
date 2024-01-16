Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FD1C4706C
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNIxWQ2clmxFYRbmhwcojq119L+nMv88ZavIupiyick=; b=ppCaqTQqBwsqzb3alYLSk1/Avw
	xwPfpI9adOaHM0gFzB57djsyaTlyQ8elLoPr0Rx7C8/2mtkTu/EcUVAF63WbffyPP92dn3yy6JMfg
	vG7pqrr/YWQBk/3JnywhNoMN80vW3Y2F9vJ7Dl1JaFqjlmjCiQp+BJqa98bjV/cfbqNu6Vh++boP1
	fLExlSuYwptlOALgLqs9N3D+sSo8tctFQkNabrp0CBfB2an7hFJ9dhfXtHnnVR6+US7vAKb9rbItR
	0g8RI4KCppCsb3zmEbwNCyChalyXigMeyrEyYk4MtRDoJhOdI+W5JkFljc22fMge20/egmG8+8Whq
	oRu9bPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPgAu-00BbqS-2M;
	Tue, 16 Jan 2024 09:56:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPgAp-00Bbkl-38;
	Tue, 16 Jan 2024 09:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705398958;
	bh=py8W8Asz6iLe+zesCfN7lkNBclqdDY+sNYRWL+acWNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q33qlN5C3QOawEnjwhIwxeamlUwIULyZc5ROCjgkxM0xbGvHo4F9GT6rf0NB/a+Sh
	 JWyQyGCVhATE5xVNBEOv9EUpKOpJQYCJQI9T84EpyKGuL75dfbv/A1njeSVYSXHinv
	 T1hzjOVvJtsP3w1H79FEsRoULr3BW4Gf6VOkwNqnPPlTNIPCYgOqdsO0qbWJFwhXw7
	 V6TTwh06oUo9jmasF7aVHZ/xBBE/EsjjdvaLcd567TiGwZg53oDwgNpvPZ10mzPHpI
	 AL6ajO5Q+k+voViAKDduLlWAhBNluGe2E0bjjp4Cg1Pb/YbChlp7pQicSQRUW+fCaB
	 2ATW/vDWY539w==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 67ED03782067;
	Tue, 16 Jan 2024 09:55:54 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] drm/ci: meson: Add job to test panfrost GPU driver
Date: Tue, 16 Jan 2024 15:24:37 +0530
Message-Id: <20240116095439.107324-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116095439.107324-1-vignesh.raman@collabora.com>
References: <20240116095439.107324-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_015600_139053_D07D9F4D 
X-CRM114-Status: GOOD (  11.57  )
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

For amlogic meson SOC the GPU driver is panfrost. So add
support in drm-ci to test panfrost driver for amlogic meson
SOC and update xfails.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost GPU jobs for amlogic meson SOC with new xfails.

---
 drivers/gpu/drm/ci/test.yml                      |  7 +++++++
 .../drm/ci/xfails/panfrost-g12b-gpu-fails.txt    | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 8a04f7daafed..1493da288ab2 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -358,6 +358,13 @@ mediatek:mt8183-display:
     DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
     RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
 
+meson:g12b-gpu:
+  extends:
+    - .g12b
+  variables:
+    GPU_VERSION: g12b-gpu
+    DRIVER_NAME: panfrost
+
 meson:g12b-display:
   extends:
     - .g12b
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt
new file mode 100644
index 000000000000..56a2ae7047b4
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt
@@ -0,0 +1,16 @@
+kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
+kms_cursor_legacy@single-move,Fail
+kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
+kms_force_connector_basic@force-edid,Fail
+kms_hdmi_inject@inject-4k,Fail
+kms_plane_cursor@overlay,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_cursor@viewport,Fail
+kms_properties@connector-properties-atomic,Fail
+kms_properties@connector-properties-legacy,Fail
+kms_properties@get_properties-sanity-atomic,Fail
+kms_properties@get_properties-sanity-non-atomic,Fail
-- 
2.40.1


