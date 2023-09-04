Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568C9C83F2C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmDoEpmBb5xUPCQZ8YM736PGCJGys0Aq46d9CyXjR9U=; b=SnZZ0O37xeiuQ8PfEs6pVy1tT8
	3b3v133AoLmFqQuhLpaUpo0jAe6HjjZu2jPGC+fgNibEkOS5G6KVkSO7/V3+/8cvgkR1hv/uV0Q63
	5y/9jr8NQN/gF79cRZ5YnjcCuFTS8dUyI5tFT6JwqVsPJwosRRAUZpaRmFocC+0m+fAYQW2uTPUEg
	XvYF+g1n272zHOEGzMHrUHA66GbTR0yH8i8crL+GAgd1hRx9DG5LNW/ufHZeaMBSbT2DW2/wv4g1f
	ZVO9dsEslAIK6WFks3ZlIicL7SSpi/hS5HPo9Vs8UKQrwftYXohGE6qjBs02brfojF72w3xUzVcnH
	W6FylF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFS-004RwO-0r;
	Mon, 04 Sep 2023 16:16:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFP-004RuU-17
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 16:16:20 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A889666072AD;
	Mon,  4 Sep 2023 17:16:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693844178;
	bh=7W5lNOyCrtC6tzFADwhpkMdQvmxObo4VaXMUWmtRyf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HOZfaooRFWiEablQxoxUOQv2pOxlMBXsxc1CL6SGGaXidRRW9jeH339PuZwFKkWw0
	 2cQqzWWMsnlLloRH7zMBUtutsUYHgQfdShnVOQ3xbc2Jg7GanVMknYJTJ3yA0htXOW
	 LXzFRlntnU6vrz/4HFAHM6K59YxQ7PDcwKlEwQpXvvDfk2Id0C7QeW7TPpmyjJDK7s
	 ove/YpCsFDB6VN4nMW0CvLteZYGaVDDyQ2GnewtNX9BbCrhEU3z/BiIEavguu2oKBg
	 LL73nEKGEIHk6Tj7bA7fjlffCk7OMbi9/SLlu0WL7ThCz+WA/rYOXAYNuY7hulHIkY
	 xRlH0bhBr0Vtw==
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
Subject: [PATCH v2 3/7] drm: ci: virtio: update ci variables
Date: Mon,  4 Sep 2023 21:45:12 +0530
Message-Id: <20230904161516.66751-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230904161516.66751-1-vignesh.raman@collabora.com>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_091619_510610_D6C0AED0 
X-CRM114-Status: UNSURE (   9.27  )
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

Update ci variables to fix the below error,
ERROR - Igt error: malloc(): corrupted top size
ERROR - Igt error: Received signal SIGABRT.
ERROR - Igt error: Stack trace:
ERROR - Igt error:  #0 [fatal_sig_handler+0x17b]

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes
  
---
 drivers/gpu/drm/ci/test.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 6473cddaa7a9..d85add39f425 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -316,8 +316,11 @@ virtio_gpu:none:
   stage: virtio-gpu
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
-    DRIVER_NAME: virtio_gpu
+    DRIVER_NAME: virtio
     GPU_VERSION: none
+    CROSVM_MEMORY: 12288
+    CROSVM_CPU: $FDO_CI_CONCURRENT
+    CROSVM_GPU_ARGS: "vulkan=true,gles=false,backend=virglrenderer,egl=true,surfaceless=true"
   extends:
     - .test-gl
   tags:
-- 
2.40.1


