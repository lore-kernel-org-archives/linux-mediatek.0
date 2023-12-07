Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C62C10F09
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHjz0vS+UMHI/uxso9eAdYWDLnPktQ6MDj9X1HHFDv0=; b=AZQdhxPQWErxLoYCwkdbsWbHZv
	sWlZL07/KSZ6gKDY+7GBjH0duAjsPCVLKRh4Mi+UAI9JHOKIitEi0PdMiGa/j5MCRXUDIh37fK+3e
	8vOyJZ1Ajw/2eRiiK+EKqNb0FLOWgOTizrSXSFQpL3eJBrJDefP6lijDNbBRyss5Qdz+kOMUZa2vw
	G179eCZh5uskNmRsXbvSzLJltm2t0onv2LdTCzdc8Gl8jU3CTXHL2zgB+X+5+RpfzL81OnPEWceIS
	tEGJDpVZauyjt7cU6gQQCWHUnVjgPAsEq7eWAkFGd6lTozp2WnaBQ+5DWlD358rSt9HB7KVRajgY4
	gtdqmyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXM-00CKaT-2H;
	Thu, 07 Dec 2023 09:19:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXJ-00CKX3-2d
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:19:15 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C4E396607394;
	Thu,  7 Dec 2023 09:19:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940752;
	bh=0x2mujmBnS9QcHk0k7mgb0lg6gdp78HOH3dqjQW7Q0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RtF7/utlbhd991M0yU/aU3QXOf91lczA8VbtqdHnGSh7deLj4PuhtuezbVtyLVJZm
	 m5It3tciFlapi1oPIHJP1vly4Pv7vgdwbTltX3eMZoAQ/qSM49K5uuz4eL+UjAW0ek
	 SmM4Wh+E83rWtciCsH67UH28Hc8TAQe0H+rrLD8SZvKJeh+rs3GnJA5Ex8cYUj5vFL
	 BffwZK9fFex8Q9HppK2+0k7J7xO39rBaFcNP+Q9N6cGx/6xeZV0Y9QO5vADNvj+ofk
	 gRPEtG1hkV13hOZC05BksYwDp31BdZV39Ls3ixUwczbC2JS3K0npLZFdOkWa5/TM9x
	 eUrlWBErTtQNA==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 08/10] drm: ci: uprev IGT
Date: Thu,  7 Dec 2023 14:48:29 +0530
Message-Id: <20231207091831.660054-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011914_028953_98013835 
X-CRM114-Status: GOOD (  10.29  )
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

virtio-gpu kernel driver reports 16 for count_crtcs
which exceeds IGT_MAX_PIPES set to 8 in igt-gpu-tools.
This results in below memory corruption,

 malloc(): corrupted top size
 Received signal SIGABRT.
 Stack trace:
  #0 [fatal_sig_handler+0x17b]
  #1 [__sigaction+0x40]
  #2 [pthread_key_delete+0x14c]
  #3 [gsignal+0x12]
  #4 [abort+0xd3]
  #5 [__fsetlocking+0x290]
  #6 [timer_settime+0x37a]
  #7 [__default_morecore+0x1f1b]
  #8 [__libc_calloc+0x161]
  #9 [drmModeGetPlaneResources+0x44]
  #10 [igt_display_require+0x194]
  #11 [__igt_unique____real_main1356+0x93c]
  #12 [main+0x3f]
  #13 [__libc_init_first+0x8a]
  #14 [__libc_start_main+0x85]
  #15 [_start+0x21]
 
This is fixed in igt-gpu-tools by increasing IGT_MAX_PIPES to 16.  
https://patchwork.freedesktop.org/series/126327/
 
Uprev IGT to include the patches which fixes this issue.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v6:
  - Added a new patch in the series to uprev IGT to fix memory corruption

v7:
  - No changes

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index aeb9bab1b069..dac92cc2777c 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d1db7333d9c5fbbb05e50b0804123950d9dc1c46
+  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
-- 
2.40.1


