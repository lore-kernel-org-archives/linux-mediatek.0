Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A4CC88CB2
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qamhlME2r966idTNeQhvo+9XfzIUatPhkEBFxm39h+w=; b=hEFSnigyHiEuGn/0H19KWWQEki
	MVjCWt1IM8pc9VO+dxAJoJ9n93XrbHUDOu5p6Eb1jFtyn0aevdb4ClFVeh7fB+1D/NL225gGU5kHN
	Rh7VzP1fMrKqKyX/qy1Q581NeI9W6iYZfqISTsFqSn7yNB8nlsBgHp7dXoq62LWpoJlGBTIo37OTY
	WLETrw3jAzitGixtjvKdi/RZqMq2OAjrzTSAfkoK5n4mKnMgizFiiQhAlU8ZbmlxE7Wg3WY8jhg3m
	KyaFoJF3Q+JHuvuS74Av1SUPkQHyNyfZkn/GF3muG65HZQGWXPwLlGZtRETPsQEIw5j/DpH2UyQyB
	t4CQsDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFg-004S13-27;
	Mon, 04 Sep 2023 16:16:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFe-004S07-2G
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 16:16:36 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E7DE466072BA;
	Mon,  4 Sep 2023 17:16:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693844193;
	bh=sLkmIO8lMBzqmT0rb01FcG0pHWafR6A2drXY2Umo+KA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8G9bhr7Itw2yiIOZ6jhP+q0eWOXiZbHttQe7VB/vCthFkLlofgQagKOCmLFTwv0U
	 SOm6eOBi0ox8nPbW+GoeePvOt9ZXfYxeX8CyMVwZXQ2MU+bWuExFYqwDkEyhQeF1IG
	 AHYwa7shv23XMgX34ddkH6W2chOhPEu9Kp2NpB0FTLm9MH2cbU0M1ItwrK/b1V2L1b
	 UqZfPblbfwASbmaroPkehJykqxMnaUkr2O01kXP/ZUx8rUBTReiwAJxKfFzYHvv+8S
	 YqLFM5KgmFGNGZDbIHunCsve+uJsAR+j/e3J1S1imR2bz6ZGs8FoOW93/TVQpU3XaX
	 RcCB5F2+VayBA==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 6/7] drm: ci: Enable new jobs
Date: Mon,  4 Sep 2023 21:45:15 +0530
Message-Id: <20230904161516.66751-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230904161516.66751-1-vignesh.raman@collabora.com>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_091634_861638_4A123875 
X-CRM114-Status: GOOD (  10.23  )
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

Enable the following jobs, as the issues noted in the
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

v2:
  - Reworded the commit message
  
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


