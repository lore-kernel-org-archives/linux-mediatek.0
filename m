Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7F0CD1283
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 06:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uRU+g+v6YaYs6XpTgzQurHx5FpL36IflqZzcDCDCv8=; b=ZzKi0b9p+q1NOoR8F/GXUkiZpK
	Jepb+p7AVEitwLXfdawUeZ64D6cSsKVEPN3zKvQVWTtXVooAW3EHEAn9lGpqKa5MY3Dr1cKJXARO5
	VeOv0ipKi/H/JBqQksDY47kmXPV7lfhCEBCkTSPPaGYJshGIgWlLSFk2tmJEW7lEcg5bSgSmsI6Sd
	54ly7Bkg4JVQ23U2x3qinSkbf2GgZChyTgn5bmRrNBf3W83tEOTbZWm9qkPYxmE46t6eTtnSVkXne
	/pTofcXBhi2cn24QwBv/D9nZ++SWkko18CZS129q9B6zFYWWIBxQMfZSgo3dg5ZAXl7w3OYrTWxhq
	FubZBGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrAwA-000000071uS-0eRP;
	Mon, 01 Apr 2024 06:14:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrAvX-000000071QM-0i7Q;
	Mon, 01 Apr 2024 06:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711952029;
	bh=YPFh5r4YCOP5qCk8b2dkDAc069IxTTGi4kUul2zGreU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nSSqVfnMzvhRC5Azuqs8ZEgurD2JPGlTpUessQwp73FQOGWzg+pes5AeixV6kwpXH
	 b3f/8YuLuPxgAuZ6vUT7ivFMrTsOgMRM5ArzqWaJ5oZMs2MmMMaqPIOmFqWj9MCcwE
	 YnRhppE86sf3TxarAVoajfOnsuG9t21DPbrbvPnOPNtUb5roMfiSckLHANHeqb0FNF
	 7mV5N7/+jFz4GTtMu6kxcRIo8In9y07zjiU0+x8I9C4/5SRgvYAzXwCbQbNK/5x7w9
	 YJQJAfdyf07eFkUfcVLXSei4uGh1AxjN1Z8JxUnbgN4JJwWarxYT6ksFV8mi/MeM2L
	 yh/37ubnGcGvw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 08A2C37813B6;
	Mon,  1 Apr 2024 06:13:45 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	emma@anholt.net,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	hamohammed.sa@gmail.com,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	mairacanal@riseup.net,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/10] drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
Date: Mon,  1 Apr 2024 11:42:30 +0530
Message-Id: <20240401061235.192713-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240401061235.192713-1-vignesh.raman@collabora.com>
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_231352_053126_10709879 
X-CRM114-Status: GOOD (  18.44  )
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

For mediatek mt8173, the GPU driver is powervr and for mediatek
mt8183, the GPU driver is panfrost. So add support in drm-ci to
test panfrost and powervr GPU driver for mediatek SOCs and update
xfails. Powervr driver was merged in linux kernel, but there's no
mediatek support yet. So disable the mt8173-gpu job which uses
powervr driver.

Add panfrost specific tests to testlist and skip KMS tests for
panfrost driver since it is not a not a KMS driver and skip
driver-specific tests. Also update the MAINTAINERS file to include
xfails for panfrost driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Add panfrost and PVR GPU jobs for mediatek SOC with new xfails, add xfail
    entry to MAINTAINERS.

v3:
  - Add panfrost specific tests to testlist and skip KMS tests for
    panfrost driver since it is not a not a KMS driver and update xfails.
    Update the MAINTAINERS file to include xfails for panfrost driver.
    Add the job name in GPU_VERSION and use it for xfail file names instead
    of using DRIVER_NAME.

v4:
  - Remove the gpu suffix in job and rename xfails accordingly.
    Update the MAINTAINERS file to include xfails for panfrost driver.

v5:
  - Add powervr-gpu and panfrost-gpu jobs and skip driver-specific tests.

---
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 ++
 drivers/gpu/drm/ci/test.yml                   | 24 +++++++++++++++++++
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |  8 +++++++
 5 files changed, 36 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index f7d0040a6c21..333704ceefb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1666,6 +1666,7 @@ S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/panfrost.rst
 F:	drivers/gpu/drm/ci/testlist.txt
+F:	drivers/gpu/drm/ci/xfails/panfrost*
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index d03d76692f0e..5b5d4a324659 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -111,6 +111,8 @@ stages:
   - meson
   - msm
   - rockchip
+  - panfrost
+  - powervr
   - virtio-gpu
 
 # YAML anchors for rule conditions
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index d8af670ee51d..adeb05bdb440 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -292,6 +292,16 @@ amdgpu:stoney:
   variables:
     DRIVER_NAME: mediatek
 
+.powervr-gpu:
+  stage: powervr
+  variables:
+    DRIVER_NAME: powervr
+
+.panfrost-gpu:
+  stage: panfrost
+  variables:
+    DRIVER_NAME: panfrost
+
 .mt8173:
   extends:
     - .mediatek
@@ -315,11 +325,25 @@ mediatek:mt8173:
     - .mt8173
     - .mediatek-display
 
+powervr:mt8173:
+  extends:
+    - .mt8173
+    - .powervr-gpu
+  rules:
+    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
+    # Remove the rule once mediatek support is added for powervr
+    - when: never
+
 mediatek:mt8183:
   extends:
     - .mt8183
     - .mediatek-display
 
+panfrost:mt8183:
+  extends:
+    - .mt8183
+    - .panfrost-gpu
+
 # drm-mtk doesn't even probe yet in mainline for mt8192
 .mediatek:mt8192:
   extends:
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
new file mode 100644
index 000000000000..6f5e760d5ec0
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
@@ -0,0 +1 @@
+panfrost_prime@gem-prime-import,Fail
diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
new file mode 100644
index 000000000000..41a846a59644
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
@@ -0,0 +1,8 @@
+# Panfrost is not a KMS driver, so skip the KMS tests
+kms_.*
+
+# Skip driver specific tests
+msm_.*
+^amdgpu.*
+v3d_.*
+vc4_.*
-- 
2.40.1


