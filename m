Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C97CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 08:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z81N/+XJIY/SQ6X4kfxMOKA9vrKWNLHCUbkhGwZ+/A4=; b=b6rg8OJ1ZaTMTiX26+ihJgjl3Z
	1oQhJxomW3idH1sOu7OQmolowBPxrGGLaVQi5W+igyICyLZjxhtSp5JZVd7c9mUp26jNoKvXfjNvB
	OUVowqyWKPoYGtc2u1h1HrJoKAue1yiy7mHyhwLvWlcHWLtWhG7Ts4H8SAUkslh36YID84qGUHvrX
	zDIqZ8ot9H+o76XG5nCn/mspHJ2RUElTH9Dt3XKqQ/XsTRUKM9nAKvcakpBrEMoVMPOLkh+tXivSx
	0a3yBhrY2ThfLZx/+vKqvgqh6nWH25SmCmGE9nZ48uzi2X9ijOUAUF4Cbpu6kO9+UH/O/NV/O6aoS
	xAJ+6H2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6d5-00000000tqF-2vOC;
	Tue, 09 Apr 2024 08:14:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6cq-00000000tdS-1s65;
	Tue, 09 Apr 2024 08:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712650479;
	bh=j3Fq9MRz+jphMARU643d4Ieg05IzjOi2gL8iIE3YmvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zs0vQ4G4UKegKiGfjNZyZDA5qTFXRsOHZ9K9448wO5mzMzwwPVdqoFqyfo4OuXPsp
	 rZis5/wj5CVS4S6EKu1nEqPMeumvAArLU6qcvLK0J8YlP+SZUr7KXqRn4lLTTuvuwA
	 B5wiI4CSD+Gx7l67vd/wGynSupG/v1ReGSL5bqkQW+6Jd9SCAhXcVskphzag+4aUjz
	 ACq0yyVQ6saTSM0nrOiwfP2fQLXV3ZuQo3VmGyTpyrFGJLIZ5LtSjzMOSHiPiOGQiL
	 Rwdua/1aWRUCE5j4l/yxSBv1xqtH5rK9DxIpOz2IKM+bm6W1cPlcqGEaBQq8tUp1s/
	 M5rUjVQQbNDZg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 680E537820E2;
	Tue,  9 Apr 2024 08:14:35 +0000 (UTC)
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
Subject: [PATCH v6 5/8] drm/ci: mediatek: add tests for powervr gpu driver
Date: Tue,  9 Apr 2024 13:43:26 +0530
Message-Id: <20240409081329.472463-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240409081329.472463-1-vignesh.raman@collabora.com>
References: <20240409081329.472463-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_011440_860411_0D0D908D 
X-CRM114-Status: GOOD (  11.72  )
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

For mediatek mt8173, the display driver is mediatek, while the
gpu driver is powervr. Currently, in drm-ci for mt8173, only the
display driver is tested. Add support in drm-ci to test powervr
driver for mt8173. Powervr driver was merged in linux kernel,
but there's no mediatek support yet. So disable the powervr:mt8173
job which uses powervr driver.

Also update the MAINTAINERS file to include xfails for powervr driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v6:
  - New patch in the series. Split powervr changes into a new commit. 

---
 MAINTAINERS                      |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
 drivers/gpu/drm/ci/test.yml      | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 333704ceefb6..92afa7b4f3dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10479,6 +10479,7 @@ S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
 F:	Documentation/gpu/imagination/
+F:	drivers/gpu/drm/ci/xfails/powervr*
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 9df55dc45173..5345a970f0b5 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -112,6 +112,7 @@ stages:
   - msm
   - rockchip
   - panfrost
+  - powervr
   - virtio-gpu
 
 # YAML anchors for rule conditions
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 959157449e4e..27930e29aabc 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -292,6 +292,11 @@ amdgpu:stoney:
   variables:
     DRIVER_NAME: mediatek
 
+.powervr-gpu:
+  stage: powervr
+  variables:
+    DRIVER_NAME: powervr
+
 .panfrost-gpu:
   stage: panfrost
   variables:
@@ -320,6 +325,15 @@ mediatek:mt8173:
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
-- 
2.40.1


