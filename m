Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AA8EE801A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfonqNbwMtN/unpuYnCHtwihEiTnVVLG12mQuX0xlp0=; b=5CAcBBeQ/BbZyXJkSsiz4h/800
	H4A69k0hKUzhq+tv7ueD8vSLEDnjQr8m3ijMK9KGSY17fmBEKNvpNOMbyklPjBq+JKuf3q0SVnA+c
	pyvKU4q3zue91hRLYYThOpZH8d+31mebx11lyk8VF7Rc7azZXem9Q2PoLxyYK5HwlCnt7n1Umo4if
	aQ0tV3nZbMY+xFM9hUt0OgAcNwJynkYdlhVKMU667oex+gtNjNgDCI4u4qUBKNWZgGgXbVw8Chb9e
	IUli1+5Db0s9sKnCRCdscq13ycT8+Hn7tAtVRc1rD7289dqoiUSLlxYEhCkWaAQRZTp8tFKHwRehI
	in14ntNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKA-00Dzgb-2i;
	Fri, 08 Sep 2023 15:23:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedK8-00DzfK-1R
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 15:23:09 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 22E0C66072A2;
	Fri,  8 Sep 2023 16:23:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694186587;
	bh=U53MyadmkUoo+q2fgQ1q5zkF0GV25IACrHzrAL1ghFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsmNkBjmb4DzUxzQ7C3tROK4iWGGMyOVw2tfVwGYw0BuPDP/A1hwXe1bUU9WRCaQW
	 Ad/WVTNM0WJsC2IVOu3Oz5XNrf9HSJTzuKJ1fdIeNIPFWK10lghn36DYwEggiFWBbR
	 Fxo3wONRpTjhoMCumF2qHcNarOw4ZhI3suNIG93CXP8ixbdopWqrEou17+VZA7Oa4r
	 Pvf65Elam8iiZwWjbgAXcwE0sd5/0DJfo9dkSNwqW3fvKzLCy8Fi8mMj6Fx/UxYspp
	 57c/lZWPfXEbBMvspYs3LnnXiDr/HNYpXbwknoFlmdZS1X7OotQ657PHw1GXEqJQ0P
	 OI5XSWW9N+KMQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	angelogioacchino.delregno@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	dmitry.baryshkov@linaro.org,
	matthias.bgg@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/9] drm: ci: igt_runner: Remove todo
Date: Fri,  8 Sep 2023 20:52:17 +0530
Message-Id: <20230908152225.432139-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_082308_614942_0595AE5B 
X-CRM114-Status: UNSURE (   9.82  )
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

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
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


