Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BCAC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLn8SOXnvgO12PdEznK7MgAI+AfBYA/WNa4J5hJ0mkw=; b=XgLQJU32qAedyPpktIMSvlE7Jw
	X3YTXiAJ0B+LgqBfKP6J4uykPI0R5QQJLR2kPM1zk+2VZEo9IPAG0WnqG1FzOuFOmkG+UcqiyW3iZ
	jEKfjI02EICEYqfvVKnFZpvWJZF94h8pOfPO2JhPwu3GqQ6/usaUjOdRUyLX3r4U0AbfCwZqr/pvO
	TPGB0cthHBZTR1TaYl+Fa1vCTeGp//vvPUbvI/gd3MBPTrFy54wYR7WzvJZehfRnU9LxhZWS39ivI
	pRNqnp1DTmtUo/bnu1nddbyK8SHJg/adSevKhpTxJvuaPCJkcb8LjNFY/By7/Asg+BdxxKeUiupVi
	vJ00oh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JWz-008HMr-1u;
	Wed, 29 Nov 2023 12:19:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JWu-008HJi-0c;
	Wed, 29 Nov 2023 12:19:01 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E61C6602F27;
	Wed, 29 Nov 2023 12:18:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701260338;
	bh=DI8NeroZ4KuIzbHmXtJcxjhkRSFvlWciXa6rjeCI55k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kRhx/2kuS24H4npWUoFcWkL6nqKXoBTHVFKhUY0thnxcB/rwKUVUUYC6+twghI7gm
	 w6GNltt6DTz68tWbkxOrFYK9ZowNpN3j4ASRkUgoKSEiCDA36J/56kI3FsTPQGNoFC
	 RUvZgfpE5YLfGnY0yuInslNOG0eBeaEcU/s4vn1aQjECtcUBHKA8YAaRD/fuCNzH5N
	 SIwXsbryAyYsQur9RpXq37SxKCGOVaSM71yNgdicPCCJlBJf2uy3mLCEWpE4V+yJV7
	 CZpFb0vjZkgjz4mUp6eWma07v9ULz04Vy1LCL5tSkaLPV8OdnnMB4I3OO2R7PZwdkm
	 olN2eayaPSRhw==
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
Subject: [PATCH v6 01/10] drm: ci: igt_runner: Remove todo
Date: Wed, 29 Nov 2023 17:48:32 +0530
Message-Id: <20231129121841.253223-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_041900_357712_F2444640 
X-CRM114-Status: UNSURE (   9.58  )
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

/sys/kernel/debug/dri/*/state exist for every atomic KMS driver.
We do not test non-atomic drivers, so remove the todo.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - No changes

v4:
  - No changes

v5:
  - No changes

v6:
  - No changes
  
---
 drivers/gpu/drm/ci/igt_runner.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 2f815ee3a8a3..c6cf963592c5 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -15,7 +15,6 @@ cat /sys/kernel/debug/device_component/*
 '
 
 # Dump drm state to confirm that kernel was able to find a connected display:
-# TODO this path might not exist for all drivers.. maybe run modetest instead?
 set +e
 cat /sys/kernel/debug/dri/*/state
 set -e
-- 
2.40.1


