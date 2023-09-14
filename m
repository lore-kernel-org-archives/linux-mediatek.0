Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D908EDE998
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGZrOlaW9HPSImcTGOTHMKpOH361601kEy/9k/WUoBE=; b=B4NHfP6a4tGFGbkLrzGWyLbNz1
	hOfxexj238WDldiFiXMH2WEpl9RSirkKfGpD24x4cUFnNLFMe2c0IQZUyz5K/fuprC+nlZyLmMfqK
	pT7DdVoZlpz+4A3cW9SYkJGEal60fquW+bgQZ33vD6j5x3CctI208wRJAYE87K6ZAk5XQ1s5hP+G+
	V1KHn84GIBBoxcWucIjBvdVgUq1sn88o9R87a7fnkPSXCZ+gSN1exUpBU+clh3wb2srFAY1bg8pl1
	3TgalcWL3nx1QFC8DNT/g4x2l0fAinQK2U0kKVBW4boguuwkscT3ie82qdThQaJLXonqo/wyuvqeW
	Q4wfZqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi7k-007lDx-1H;
	Thu, 14 Sep 2023 08:54:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi7h-007lBH-0L;
	Thu, 14 Sep 2023 08:54:54 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A19566607344;
	Thu, 14 Sep 2023 09:54:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694681691;
	bh=WAADeM4n8OJOyI9caqh8EVKMP5u+WM1xQrDERBfHNtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g93x5nqsPwUrWkY3du6T6zcF4hLUqr6D95bGlmh4yw6RTyBN5UYJmirVtm7dKL72I
	 rmnMGERQUq1ZbVCcJJQ5t2WfxnuYi6ZRv58XaM3hgXEt2BuJ9Kld3wcaNrAItypmbM
	 he9T2+FYJFOWRzgfObn0xcEAnYiTdtXIvmVOmy4MHYWQSPzGqI+D/14ybyMWWAofJZ
	 Om1Et2fcen0rixBv1RQPjgxwHT23WvsORu/5mkluLrrcU3vaeWUbzTpOGbWjhEEp7A
	 95Hcvt6/D0DNGxea/tRPoirBnxpd1tfu4ph5WR4yIduLDHuytcwXUQjX9ExS063p7A
	 36OJShiIX/gug==
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
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 3/7] drm: ci: virtio: Update ci variables
Date: Thu, 14 Sep 2023 14:24:22 +0530
Message-Id: <20230914085426.883255-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230914085426.883255-1-vignesh.raman@collabora.com>
References: <20230914085426.883255-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_015453_267567_9BFCEFEE 
X-CRM114-Status: UNSURE (   9.25  )
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

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - No changes

v4:
  - No changes

---
 drivers/gpu/drm/ci/test.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 56009e5495cc..e8503a533be0 100644
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


