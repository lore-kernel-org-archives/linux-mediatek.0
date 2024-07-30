Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10759C3DA7E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 02:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2svfNRMf+LKIyslh/t2plg9/Sg8Gj+dBrAxy5Osrhw=; b=WExsjzoZsfmpXp4wHoZ+oa0SN/
	06mA4lJujhq4pseIc9FBOnxnbkHjnpIYUL9zP3IQUy6SYV1avBkmnJHNP3RBuUBySHtg4xryQiSrh
	f7l375utp/UuAzv62UdFUWIM+6SQ2+ik+OhZ3FaXJQp3kuEQOIj8sjnNHEgbpiJNMWzbyqiPSz4QQ
	GuIYIT+M/rQDg2VpB/9WB2UQkxliIX3sQgkQUNwTH/bLRgW3dPXiA/yhV7OfVFWCAJJQYvE94V9oO
	UJrBiV9e+Wxp2nPBxMPMxp1lfaOPAj251dOMFk7VGMgb6TkKUO6SQeqAW6MOgVxivg21QlcgD8EaU
	madkx4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYcQN-0000000DKUW-41e4;
	Tue, 30 Jul 2024 02:17:15 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYcQ6-0000000DKBu-0ENU;
	Tue, 30 Jul 2024 02:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722305816;
	bh=0h/neyURmZQw5tjqqj5mAiUIZKn/WwA8LCby8onbp8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVTV9/hoar88oVa35pDAK740JstXpudV/uAcZqdTF9R2NiZrlNOxcxrHXgfAkhPLM
	 EgVqcsRIRjQnerg1GGjhyarlzaI384+6u56rI1+Dj3AwuflvhIOrcAMe7lGhrE7sLZ
	 yZ3hkiBeKMcvJblZL/I3hgc5CNO9rOmsEM6EzNjRl3cdSH9dH/gvg7in5Z2ZpMl5xP
	 VYP9X06Wn4dM6nRq61zY0w/EzXgVW/L1nehfImFb5lP+Xtl/eOk5o/N5jPJdyvfoyF
	 6X3/BAR9+6HvfG0+auDRWGxXjxQopV7hvlxpO6X+9PRzfA5ecr454+ESjUQ5yl0Nwq
	 9JVA+aHs/4k6A==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3149A3782109;
	Tue, 30 Jul 2024 02:16:52 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	melissa.srw@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/6] drm/ci: mediatek: add tests for powervr gpu driver
Date: Tue, 30 Jul 2024 07:45:39 +0530
Message-ID: <20240730021545.912271-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_191658_654417_98FAF3A1 
X-CRM114-Status: GOOD (  11.55  )
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

v7:
  - No changes.

v8:
  - No changes.

v9:
  - No changes.

---
 MAINTAINERS                      |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
 drivers/gpu/drm/ci/test.yml      | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3783f2269ff..05f72eaf5267 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10778,6 +10778,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
 F:	Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
 F:	Documentation/gpu/imagination/
+F:	drivers/gpu/drm/ci/xfails/powervr*
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 9d800f629f08..ca7f873bc2d4 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -122,6 +122,7 @@ stages:
   - meson
   - msm
   - panfrost
+  - powervr
   - rockchip
   - software-driver
 
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 219eca5ef24c..86875fb96eb5 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -294,6 +294,11 @@ amdgpu:stoney:
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
@@ -322,6 +327,15 @@ mediatek:mt8173:
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
2.43.0


