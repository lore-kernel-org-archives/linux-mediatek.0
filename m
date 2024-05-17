Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B14C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrTfItgmTQ9aDEnQnQr25/2x1jzKGv+0vbRyZlBLoqo=; b=ocyF4Eu5CSacNE7WpnRmTV7ebB
	AbDdHYPM6TMyqIzL1uq0PGNbrrlMvVIgl2RXOGMdv+CALwOjoxTYlFPF0ZuHoCZ3d4LqF9PEKo/+3
	haL1vrmG218iJJKweMBDu6SoL7eIRaZSnx7iuiJ3M8N/nc0xombRd9+XKXljI9fbdQljMfvaOZy6S
	LkoKMeZPM4rns1qR0CNrp3z/GQV3nahAVydPm3CKGadEafJaXBaXMUeBpyjNcTBUtYOi8jPS6hwds
	BYaTg5D0ohv3xm7G2hOyLJW5KSn/fuvvSyVaQRe8RRT0KrrqqzUUJFMUEpHgW2BqoXz2OI9TEXnxd
	X8rzSbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tqg-00000007L7d-0M9T;
	Fri, 17 May 2024 09:25:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tqH-00000007KnS-27GE;
	Fri, 17 May 2024 09:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715937932;
	bh=aDp9iI96OBJTQES4yUVp+EROqovPxhZTdAIdqtcnWnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OthiUZqH7ibnt5nhrHOtzuP8ngSpfTMFtyvDVW3iK6gJO9pHKAp4fVrme+Q9IviDH
	 4R1zmqNkkAedMzUpGQDl/I0DNm8A6XqQXaYpjX5e4oWu+0Ctmecpk6+akgOUe7zeb+
	 ZeB7aFm7RNaMw5hJ7g7TX61zYfrdp5RzMT91PjBnmTzhJg1SMpwK1sKBzN/7hsybCr
	 AqJtQIObFIqC7MLSEiQ6PqmsL8fit6chxx48d/90OS48qca2TDbnyJ7Qr3SLxc6pGv
	 aOXKeYUcS3EnRFkQI0RwGZTonyZetvI0T+1EdA7ASTDbfUA09nPdzIUO9IpLoR36eJ
	 o0CFdxMvDWdUA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 33F7E37821BF;
	Fri, 17 May 2024 09:25:28 +0000 (UTC)
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
Subject: [PATCH v2 4/6] drm/ci: uprev IGT
Date: Fri, 17 May 2024 14:55:00 +0530
Message-Id: <20240517092502.647420-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240517092502.647420-1-vignesh.raman@collabora.com>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_022533_970835_1CD3BF3C 
X-CRM114-Status: UNSURE (   9.54  )
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
arm32 targets.

This is fixed in igt-gpu-tools. So uprev IGT to include the
commit which fixes this issue. Disable building xe driver
tests for non-intel platforms.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Split IGT uprev to seperate patch.

---
 drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
index e62244728613..7aa3ce274c64 100644
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


