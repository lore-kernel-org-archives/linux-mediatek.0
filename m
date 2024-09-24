Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A2BCF9C5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 02:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HReo8QASszTNsIouJrrLVwyUlRQlZpBYEZwPnmOoMvI=; b=qmY7ZUcU1d6Bz1ZewUf5ZZC/AJ
	hk26U9KC1v0jEx4eKBaToqEhdPoPsphfuxiHnxsa1zv5VEvjCXTP/5mCargLGGBVViuyg1bC5s+jt
	0zJkEKaJD1kSU3gvwtnkm1ArKqO8Yq8k+XNeYIlsjbafw3YUrHoxikUqOxe+lceIDIzlj4gg+Sm9m
	ckRIqQ5mipFVm0bqHLnG60EKM3aG2mDkj5CWZ6zvAbozyVBOTw/14AQyjrdm5dhf3RfReZYBNqciC
	CT7soSF8YO+N39+TcoGQ2vm/I+9DlYYrg36sbyyBrO+G3UeL/n43XrLu0xjfm0NbwBx0XYyzHG0de
	W7glC29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssvFu-00000000sxU-3x27;
	Tue, 24 Sep 2024 02:26:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssvFr-00000000svw-1nP1;
	Tue, 24 Sep 2024 02:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727144777;
	bh=bVBlh+fY6Ig9uXlKnweewNbRdJcBCdmmmBM3MYgyfkc=;
	h=From:To:Cc:Subject:Date:From;
	b=I6FlfQQJLJgS0B4GYHreTcgkphmT0mtS/izy2z6fKSS7SM/YLiUDuQFlVGy/mj+BV
	 LAJ5Z6OzVK7XlKTu8ty7d5B8lKWjrOvTfhYxuS2lGgxDMgwRhHeUh7zm+vBW/smVbC
	 Lh9cVPMXsPLsFyyrDTIyHDkgs2vabkhVEfSxOnu4vKWN/Wk5xbz+iG7hP43duNJhhq
	 RDxF4v0iGL0s4K00QMKKfxunJksIA+2M8LnIE854C+pIIKC3EfPWYcizvciDBHaP69
	 s0b33b7a0NOtNEuAz5lPT4Chepeo/Zztl/y2h8GLSNs+QJry4OgRR2BW0VhQ/VipCC
	 MEAHSNEfkemDA==
Received: from localhost.localdomain (unknown [171.76.80.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1187A17E0EC1;
	Tue, 24 Sep 2024 04:26:13 +0200 (CEST)
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
Subject: [PATCH v1] docs/gpu: ci: update flake tests requirements
Date: Tue, 24 Sep 2024 07:55:58 +0530
Message-ID: <20240924022600.1441969-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_192619_653347_535C92AF 
X-CRM114-Status: GOOD (  12.31  )
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
 Documentation/gpu/automated_testing.rst | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..f73b8939dc3a 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -67,20 +67,25 @@ Lists the tests that for a given driver on a specific hardware revision are
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
+https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/ for i915 drivers
+https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/ for xe drivers
+https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


