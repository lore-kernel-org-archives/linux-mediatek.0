Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6459CF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 10:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TJJiNX7xzBVw7rDLaJpKWCl5SgF1VViK+SpXtjAV9jc=; b=LxkdGBPw9AW2vS5fV0uJUiD6nD
	ddY5fR+Lj/QzjbV6KSYC9YUIpW6/+Pbpmw4ur2Gk93Y/psQcLO1ncP9DWuGifZzRXDvIllC3iFfT9
	GUZgMWJ08Yj4xOnUNs2pkKi85VGVuW/GpoWEIPh1U4OLFdHTtYO5Pm+cLgvxTBnkOQ+TA/X2ZVNe7
	OtFxHa/Dlmr2u9J0xZ1SIcyRJTGDqODm3l6Xm6UjQ+A3iKqi8MeXzWM9/R639P4WXRp6MPaTTDJkj
	RYIhWAO48qVX9qVeLgajCWggaypLZbuDVqR25hgo78Ln5sTWVPc3EJLJCivnup0d3mXDbBUB934qI
	TV7kZonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDGx-0000000GdaD-0dIo;
	Mon, 30 Sep 2024 10:04:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD5a-0000000GaiS-1Ajm;
	Mon, 30 Sep 2024 09:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727689988;
	bh=xlQB+YRnWzPDGKcdRmDpIo+//kocNTxv1zsa8DtTEpI=;
	h=From:To:Cc:Subject:Date:From;
	b=kRe5RniRKjhzyPUIS9aI2gdQY/3yfKtncMkphK8EzeLqmp1VuuBWod/AA66jPXaNd
	 EKRfxBP86hBpWoINgH9hkEhh+lONXGBZUmjk20jMP43TLhVSYUzoeldgkgazVcPL8j
	 v+YoK6UZ7SpvFTo6sS2UT166Ry/DaV7GyOQ6xhSqnDZfk2GxgmN7YU9/I9n9oYwheV
	 StpzBoIns/k8gwxB+xso+IansWWxQUChjuk6E9n9YVfie/psblmf4Nc8Iqe5ZJF9z+
	 Y/fkYSDfLJnwsCX4Wfx+JjgMUPo/W7g2Ggtl0tWUReRwX5zUgUpaokHfSY3/d3MVtD
	 hcqp2lZxrEpfQ==
Received: from localhost.localdomain (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFD8F17E1147;
	Mon, 30 Sep 2024 11:53:04 +0200 (CEST)
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
	quic_abhinavk@quicinc.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] docs/gpu: ci: update flake tests requirements
Date: Mon, 30 Sep 2024 15:22:47 +0530
Message-ID: <20240930095255.2071586-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025310_540871_EA750807 
X-CRM114-Status: GOOD (  11.36  )
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

Update the documentation to specify linking to a relevant GitLab
issue or email report for each new flake entry. Added specific
GitLab issue urls for amdgpu, i915, msm and xe driver.

Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #intel and xe
Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
- Add gitlab issue link for msm driver.

v3:
- Update docs to specify we use email reporting or GitLab issues for flake entries.

v4:
- Add gitlab issue link for xe driver.

---
 Documentation/gpu/automated_testing.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 2d5a28866afe..6d7c6086034d 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -68,19 +68,25 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
 the result. They will still be run.
 
 Each new flake entry must be associated with a link to the email reporting the
-bug to the author of the affected driver, the board name or Device Tree name of
-the board, the first kernel version affected, the IGT version used for tests,
-and an approximation of the failure rate.
+bug to the author of the affected driver or the relevant GitLab issue. The entry
+must also include the board name or Device Tree name, the first kernel version
+affected, the IGT version used for tests, and an approximation of the failure rate.
 
 They should be provided under the following format::
 
-  # Bug Report: $LORE_OR_PATCHWORK_URL
+  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
   # Board Name: broken-board.dtb
   # Linux Version: 6.6-rc1
   # IGT Version: 1.28-gd2af13d9f
   # Failure Rate: 100
   flaky-test
 
+Use the appropriate link below to create a GitLab issue:
+amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues
+i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
+msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
+xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.43.0


