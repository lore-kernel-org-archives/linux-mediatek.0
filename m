Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EE5C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31L5XfkC7nOqnwd3onzzgaCh9FQ4V3Rs2y+qh7wDzFU=; b=Sds6LR8PVRU2ub9+c46wZENRqP
	6QdrxSLB3sFbzc1OIyN85ehMmILTYSvcSBwVItOo737kvPxMYE5rJYC7rD9nGP8nTsvXuYhdESK4Q
	pnRv4TkLDephrNhP7as2LfTxNBLyt4FgI/D+ndL26R2zsxSeessH2R3rcWa9+HhjenE8BGc2oXx/A
	VSUCGB/Nav/aVzknHQ68DrgUCnODNHpjQF0GG4dV8iEdSqIaE+3DJQeWO+3SfLHMCCrplL4cLODfN
	Xbh3JnnyUq8bsgb6l9HZtNj1Ll3qpgjOqkIF4KuK+MNjDVz+qptvSALsx3nksa3RNvhLpIAkOym1Z
	uazO7XjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVtF-005NwB-2b;
	Fri, 25 Aug 2023 12:26:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVsk-005NfD-0R;
	Fri, 25 Aug 2023 12:25:43 +0000
Received: from localhost.localdomain (unknown [171.76.83.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 45CC9660728F;
	Fri, 25 Aug 2023 13:25:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692966340;
	bh=rgpvSeZGKF3SGFM/V9KInphj6CaJZryw7a6Wsi7NMHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUsazqsdd7YYCLplGD/KDgVV9qU8B7rbCgTNMJwelCqQvmG/vZMNdJXYqZEECL/nL
	 EOVV27wzXS6bnAmH2uFcQXqMxz+Dmmq1srKqTdUThEhbUieSsk4iR17OP1aPOn4l0+
	 a5EflmDqvEa2IEboOYZ3DW1zpi9qiaY6mrO0BDCzsyuYe3gv+j0z5FLJtXhPKUOeQ7
	 +bYxU8nK3WN/ucLD9QwgOKn2nMrdDM3qO5Xb5g+FNzQv78xls3x6jMwOttal7xKcOe
	 kQAtjS5VksTlpXSkYKKQ08dDod9zl4c/GXZnUHqwxSYvaCcSAdecYRLqqlEUHutoWK
	 uN3CmS1+MkWKg==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	gustavo.padovan@collabora.com,
	robdclark@google.com,
	anholt@google.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	corbet@lwn.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	heiko@sntech.de,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 6/6] drm: ci: Remove rules
Date: Fri, 25 Aug 2023 17:54:35 +0530
Message-Id: <20230825122435.316272-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230825122435.316272-1-vignesh.raman@collabora.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_052542_327796_A93EEAEB 
X-CRM114-Status: UNSURE (   9.48  )
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

Remove the rules from the following jobs, as the issues noted in the
TODO comments have been resolved. This will ensure that these jobs
are now included and executed as part of the CI/CD pipeline.

msm:apq8016:
TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.

mediatek:mt8173:
TODO: current issue: device is hanging. Fix and remove this rule.

virtio_gpu:none:
TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 drivers/gpu/drm/ci/test.yml      | 9 ---------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 2c4df53f5dfe..d2aac4404914 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -248,4 +248,4 @@ sanity:
 
 # Jobs that need to pass before spending hardware resources on further testing
 .required-for-hardware-jobs:
-  needs: []
\ No newline at end of file
+  needs: []
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index d85add39f425..1771af21e2d9 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -108,9 +108,6 @@ msm:apq8016:
     RUNNER_TAG: google-freedreno-db410c
   script:
     - ./install/bare-metal/fastboot.sh
-  rules:
-    # TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.
-    - when: never
 
 msm:apq8096:
   extends:
@@ -273,9 +270,6 @@ mediatek:mt8173:
     DEVICE_TYPE: mt8173-elm-hana
     GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
-  rules:
-    # TODO: current issue: device is hanging. Fix and remove this rule.
-    - when: never
 
 mediatek:mt8183:
   extends:
@@ -333,6 +327,3 @@ virtio_gpu:none:
     - debian/x86_64_test-gl
     - testing:x86_64
     - igt:x86_64
-  rules:
-    # TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
-    - when: never
\ No newline at end of file
-- 
2.40.1


