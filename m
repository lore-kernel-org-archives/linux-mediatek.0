Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FADEDE99B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptUWfLfFR1XDZyBIwtybI3oB3YLouBVD4jVoh0v1jrs=; b=aVRKm8eIH3W1sjcCIBwPGNulmk
	+EDf0fexj29dHy8yyrsOczDBXLZPUK9HBxlck5PYyfqNobLefbS2bHke7YtAMwDfMVSJ9LPA7UT9A
	YSVu7l8Mn5a35NN0/mEdL0F25Y+YvTd0emAV4NQXjI0/7v0ygaxHqD4j8Oj8TA5G1AfaruxbI0BXs
	0zo8dkbg/L1FOdq/rPr1xbRZWNdGzhxGAZ/6miMddIRiJFHMNQz0Wy1R6NGvLfxrvqezTP4+ii9k0
	VINBwVv7SpsnIuSwzBzn3OhZ0CduLfBaavnx+7ls1j/h+Z8HALwpRI3iMqImEhf6w8W19PRaLJf1L
	LiqpLUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi7e-007lAR-2t;
	Thu, 14 Sep 2023 08:54:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi7c-007l8O-1P;
	Thu, 14 Sep 2023 08:54:49 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EFFAA6607343;
	Thu, 14 Sep 2023 09:54:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694681684;
	bh=PU85NKHz/oMhuUTydOeh3ho+jeYv9lrAwp2IFzWwwIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G/ivB7kT6mAxRPzERQQBUy1Ac/QljDW6GOeGeE/4WTAa/Sh9qPMCD0s1yv5Hw0KIY
	 pLYniQR7ITN2NaWqol9Ou+w/y6BXoEUpOPe//pCvi+/nQM/GfZdkbAs+dZ4G5ZKHpe
	 UZ4Kaw8CosLRGQ6X1UQHNoDGmhVMoKB7MsNylevqct1HBBG6CDMzRa/sdQ1JbhP/w5
	 smAyfzw/eactsshpX+WM6NQbU55JB6wiIQbKBG4hensdTk5BrlPUnWlZcAeui+oQLp
	 ECfq4zq8bSpoO5MPchLq0YLYWTk2K2D//S8OCDXAz8cEXkqJJgq72b9uPVEZmQASXj
	 1pnnEKTxN4i5g==
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
Subject: [PATCH v4 1/7] drm: ci: igt_runner: Remove todo
Date: Thu, 14 Sep 2023 14:24:20 +0530
Message-Id: <20230914085426.883255-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230914085426.883255-1-vignesh.raman@collabora.com>
References: <20230914085426.883255-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_015448_619691_44F9732E 
X-CRM114-Status: UNSURE (   9.37  )
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
  
---
 drivers/gpu/drm/ci/igt_runner.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 2bb759165063..5bf130ac57c9 100755
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


