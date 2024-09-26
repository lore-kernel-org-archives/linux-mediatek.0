Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD54CCFA07
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hHRGBhh1KrCp3M7e9L9l2UwtZkUBkpjAI3XYt9hpnvY=; b=fro8M0/7xerbaazf0ntvRINxUM
	S15vnoGtu1+4ukZIteP5bVk81kXtE0X+G2CKLwQbZ3iPFWtOOyAxC4lX9Y56XQqSVZsD73y3DcdcP
	UApvBXUxFCCpo6YZ1gV91Bf0Ckce97MGb12HOJk+79prpROzJ+TrQDHV7KTBGhfCgNbEBWQv7xwwt
	p8RD97v0XW0ApW5MkTtLw0MnZdtnId+JMnIYk6EhBQlzijizns4Z0foYaO+qyOtvCkI6KOHISnyyU
	zALlS1jWnX4pC3ZafnYdsHVrYkM832aszjMPnXhlh2a57ONnjRn5uupnlj/CFIHaR5RASFzqHf6p/
	zKZLAveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stip1-00000007UTm-3Apd;
	Thu, 26 Sep 2024 07:21:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stib4-00000007RwY-2SkB;
	Thu, 26 Sep 2024 07:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727334447;
	bh=KnAJPqBaS5mXano/IWPtVY1GwRK9RukKLmDCVvuE62k=;
	h=From:To:Cc:Subject:Date:From;
	b=a6qG1sYPRZwPWN61Ga0JUd2JAOsqgmxztWRWL7bQyRnlvitHYMF1KaYiokMoe90QL
	 y0Z3W5WTVkarVdSfrD0gilBztAbMN9+Nl2XmUon16zfnlqbH3MMB6MEo6gwyN1chMZ
	 Ws24NLwZgR0HaoUXMSRR9ZlxGDiUgHCb7Trje6ira3SDxES3YSw1Xp46P3aIhJ4atB
	 bvQwTNUASavoZB4mXLO1zjyG8zshAZLVTm0Y2vAFT0NQFWuMOwyu394ObkzfiDPWs2
	 HnpyVWilPmTXyapS5PY6PZNtVpy2So9ybSPpNinWx92FjggJnEEd6mokyHEC1mm2Tn
	 pMtK3XWjBoW/A==
Received: from localhost.localdomain (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69E9F17E0FDC;
	Thu, 26 Sep 2024 09:07:24 +0200 (CEST)
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
	mripard@kernel.org,
	rodrigo.vivi@intel.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs/gpu: ci: update flake tests requirements
Date: Thu, 26 Sep 2024 12:36:49 +0530
Message-ID: <20240926070653.1773597-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_000730_804798_F78BF5F1 
X-CRM114-Status: GOOD (  12.57  )
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

Update the documentation to require linking to a relevant GitLab
issue for each new flake entry instead of an email report. Added
specific GitLab issue URLs for i915, xe and other drivers.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
- Add gitlab issue link for msm driver.

---
 Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..f918fe56f2b0 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific hardware revision are
 known to behave unreliably. These tests won't cause a job to fail regardless of
 the result. They will still be run.
 
-Each new flake entry must be associated with a link to the email reporting the
-bug to the author of the affected driver, the board name or Device Tree name of
-the board, the first kernel version affected, the IGT version used for tests,
-and an approximation of the failure rate.
+Each new flake entry must include a link to the relevant GitLab issue, the board
+name or Device Tree name, the first kernel version affected, the IGT version used
+for tests and an approximation of the failure rate.
 
 They should be provided under the following format::
 
-  # Bug Report: $LORE_OR_PATCHWORK_URL
+  # Bug Report: $GITLAB_ISSUE
   # Board Name: broken-board.dtb
   # Linux Version: 6.6-rc1
   # IGT Version: 1.28-gd2af13d9f
   # Failure Rate: 100
   flaky-test
 
+The GitLab issue must include the logs and the pipeline link. Use the appropriate
+link below to create an issue.
+https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
+https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
+https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver
+https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


