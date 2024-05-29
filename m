Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78325C27C44
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 02:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=an+Igq2pNRM/ZJbiCR6zdsAzqTAQi0MSjn8TX6fy3Dc=; b=G4PsUEnLWACPFKPdb0xvz4310F
	6sDV87e3VTRKVSQAPVeKVXTcPyAPUMnsr3T9gw08OC+batPX4wiSlkU9NGCXOYET9UsDX0sff1j2f
	fZM7f5dn2gDPilJTiLnj/LAxF6PONRrtMseOqsm6C4Iqyq5smYM5EX3CFiBarUOcNOfsNJECJzBAD
	4mvB3uMRanGHwn9BGBUWilLwdSG+oKfMLN7taxOmWaO/AgqSulfl5Jq0N4rBhnkRaUDnlwL+6aA8q
	S66ZbxGxkCNrkurg4OlE0Zra0xL+sgfFQdfNS4BQL6DDEeZbk2Vp2WTZcKsZy2C/IYftP2yNgjtPe
	GGusi8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9GR-00000002cir-3c6K;
	Wed, 29 May 2024 02:42:07 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9GI-00000002ca1-0al6;
	Wed, 29 May 2024 02:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716950516;
	bh=on0EOWF+GkQb1PJcpMNExjb9HNOdj76aATPkzOg3PAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=41Y/EPEAiCbuxuQnH4Q92zY4teEN8tmt/m7HJ5dHcGdr5VPAKPagjuEeYHoIBgC7X
	 EMIgr2nlop2O1Cqp44+whbpYLZAXdYyuTYP4/R+fkqtRLppGSCFA6LsA/6HVw7+oUR
	 25XOVhMc6NVJBjVHS6ehxO1S6qrUaNvwJJm/RtSoREKw81KiMUDlykgjMQ4Vn8k05A
	 IYIvghzwU5DNsjnbw0yTrAKrVfwbovrYppgx8GBYQfX8LFKxKJh03JYsAt2SwZMOVP
	 iupqyKSv+ibOnL2r2ST/t4XN8u6LHbIGr9S6eiMq1UYVbmwx2UHSFz/4aHR9xgiezt
	 deQSjTukXh+Cg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D7130378215E;
	Wed, 29 May 2024 02:41:52 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] drm/ci: uprev IGT
Date: Wed, 29 May 2024 08:10:47 +0530
Message-Id: <20240529024049.356327-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529024049.356327-1-vignesh.raman@collabora.com>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_194158_756420_DA93279D 
X-CRM114-Status: UNSURE (   9.98  )
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

test-list.txt and test-list-full.txt are not generated for
cross-builds and they are required by drm-ci for testing
arm32 targets. This is fixed in igt-gpu-tools. So uprev
IGT to include the commit which fixes this issue. Also
disable building xe driver tests for non-intel platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Split IGT uprev to seperate patch.

v3:
  - No changes.

---
 drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
index b7d2a49a6db3..eddb5f782a5e 100644
--- a/drivers/gpu/drm/ci/build-igt.sh
+++ b/drivers/gpu/drm/ci/build-igt.sh
@@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
                -Dlibunwind=enabled                   \
                -Dprefix=/igt"
 
+if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
+    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
+fi
+
 mkdir -p /igt
 meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
 ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 8f32de63d92e..1b29c3b6406b 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
+  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
-- 
2.40.1


