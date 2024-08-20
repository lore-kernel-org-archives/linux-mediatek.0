Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C21EC5321E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0sUDtqU8UXz2+A95knZ7ryFsZBRjCwmhZ1uQAm5xJYI=; b=LtZKMXd9F7+/bCmnxGK+3N/pjJ
	TckLtwTv0j7Xr/8nZrUL0340Uf8muSJfxPH+OU5SYNuetVCxZX64pq+iSN0OZU+lteUtcNhmHg0Jj
	YnrykU0ST/Qpufzutr9S5FDPFHnlHHb9eeXH9cEde7nUGaEJFuBKXoXr1olrNy0Sqcv4IPQgA+ZM3
	GWsdZYG/98iQa4L9BzkLEsaJv60CRjCc8stJRmpIOEme3z2Xj+brd3sM3PWjped4UdQ7AtaEC9lPM
	oQb56P4yxqdhihbjWeUVxS7hQs/mcY2V9R62imrZUT4WuGw7x6JOzgnxxQbss1D4heUOjo3xdQCXZ
	9y+b0yyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgIzN-0000000496f-3qAc;
	Tue, 20 Aug 2024 07:09:09 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgIzL-0000000495s-2RHt;
	Tue, 20 Aug 2024 07:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724137742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wsf//7UlKFeMXs5mrlbsA3f7Sm4SWFQ4OhMWchFGrGlXmj8gyuwFrLdduALbIjd5yxD/zZ3xWd4GtW5mnphQOV52asjwadd4hDidbod+cjlJ19uEUG9xkh5AwjmM7VJomKofTpUJPPt7uQMy4sR5pRHv5V0wI5vzUBomskToNRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724137742; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0sUDtqU8UXz2+A95knZ7ryFsZBRjCwmhZ1uQAm5xJYI=; 
	b=ey+YqA/aEMyzbL8PrY058CoHw8u3SY9WK2lKKy6B+4+NvOcwr0DHW7DwOqQ25z2R9z6ipQbtVKN6IhGP4vAaPNgiYPiYXQPYoIQmYzCYIH35iciLlKRgcbaU6HO+J0s6srUj8P6mOb6DJRIolVgRJ8bBE1R4AHI7lxbpXFhTuYU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
	dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724137742;
	s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0sUDtqU8UXz2+A95knZ7ryFsZBRjCwmhZ1uQAm5xJYI=;
	b=WIvgmHa3eQbPb3a7PFmqg1lZ2yCyvmY6UKsmiivIyQWAx3BGMcQN2zw+HO/so6H0
	m9pD1V6TJJCZTdFNaufvpephnLfyMBltYY2V4cQsnEurCyc6aiM9qoIDdprUYPLn5Fy
	5My6pDr8Isr9zkWPj0ZfqFCewFT+1t8ZfTb20OzE=
Received: by mx.zohomail.com with SMTPS id 172413774108257.39914871221299;
	Tue, 20 Aug 2024 00:09:01 -0700 (PDT)
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
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: increase timeout for all jobs
Date: Tue, 20 Aug 2024 12:38:16 +0530
Message-ID: <20240820070818.1124403-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_000907_692824_354CCBB4 
X-CRM114-Status: UNSURE (   8.85  )
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

Set the timeout of all drm-ci jobs to 1h30m since
some jobs takes more than 1 hour to complete.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index b6f428cdaf94..09d8447840e9 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -10,6 +10,7 @@
 .lava-test:
   extends:
     - .test-rules
+  timeout: "1h30m"
   script:
     # Note: Build dir (and thus install) may be dirty due to GIT_STRATEGY
     - rm -rf install
@@ -71,6 +72,7 @@
     - .baremetal-test-arm64
     - .use-debian/baremetal_arm64_test
     - .test-rules
+  timeout: "1h30m"
   variables:
     FDO_CI_CONCURRENT: 10
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
@@ -215,7 +217,6 @@ panfrost:rk3399:
   extends:
     - .lava-igt:x86_64
   stage: i915
-  timeout: "1h30m"
   variables:
     DRIVER_NAME: i915
     DTB: ""
@@ -414,6 +415,7 @@ panfrost:g12b:
 
 virtio_gpu:none:
   stage: software-driver
+  timeout: "1h30m"
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
     DRIVER_NAME: virtio_gpu
@@ -436,6 +438,7 @@ virtio_gpu:none:
 
 vkms:none:
   stage: software-driver
+  timeout: "1h30m"
   variables:
     DRIVER_NAME: vkms
     GPU_VERSION: none
-- 
2.43.0


