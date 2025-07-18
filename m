Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10330C83F34
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xo4TIb5JN0cOH4wN/ldu+RCOLbntwhut8qleq2LkF2c=; b=oYdN8uL5+XrqjyV9yVrOBYJdGD
	1Dr+vc4pBRVBzi9OAS47vMPPsaM2/pM9vSqLLik+zEfofjJkcz0vmzHQt9iIaNz0ca3paBpgvbvQL
	tf2mn/g11bfGR7oyDYt/OJ82KsDpdA9tintNDL6UEZl/qFU+noNauUy+KijmPithOlY/1IYR14LFy
	jf5HbZZ9ZoAeLEUB9i8r53wjT1pe0lAyDu2ImD2RZvdGnLb6NoElyg3crrxtLQCWqCY1FMJkbSrvd
	VfNAnMzueiiRtasNep9xDaSbiJ+JOUZZsjGRErJxXGlVy3YMtf1ZgCdXAuoPR6Yrhpnq0AXXGz9MP
	4bExkffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjFJ-0000000CQnq-4Bm8;
	Fri, 18 Jul 2025 11:27:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucijR-0000000CMI1-06e5;
	Fri, 18 Jul 2025 10:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752836063;
	bh=k7CAZOnVX3McTF9rA6EaJjI3tqH2gxRiw0k5BhFfu+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sjynf/u+D9SjkEYOCSDJrxhLi8UWPgyv13WkmDPUqBdHSgA888JhJLdg2oy4ObMt9
	 KYovrzdWiDYVeLa6c/50qDU4SmZUkqP4hdwseHAWYqUiWl9/DLSMkdg/eHjqBXq3V0
	 76icLc08zdr3iH8cQQnP3A3TndrdxnqI6Cmnqdkyh8Y5BRBOLwHTMH0bacvHfMhe6u
	 IMFfDQ7HPmWFgWTe9AEcT9oOMstEHna+guZKMatkjZkjXJJq9RA01Zr/bWQ7IOaSeV
	 dwZJdK6I2M1V9A4pWQ7OUaRAJxUnSC/SMxapeKOdL1pFzZPKZ3IBVSK0VJoykx9kOd
	 sz9xgKfJK5huw==
Received: from debian.. (unknown [171.76.80.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2D9217E156C;
	Fri, 18 Jul 2025 12:54:19 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal jobs
Date: Fri, 18 Jul 2025 16:23:53 +0530
Message-ID: <20250718105407.32878-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_035425_206368_6D922972 
X-CRM114-Status: UNSURE (   8.40  )
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

These devices are being moved to LAVA. The jobs will be enabled and the
job definitions will be updated once the move is complete.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 81147e86bfd0..53d19ffaaf61 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -148,7 +148,9 @@ msm:sc7180-trogdor-kingoftown:
     GPU_VERSION: ${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
 
-msm:apq8016:
+# FIXME: Disable the bare-metal jobs. These devices are being moved to LAVA.
+# Once the move is complete, update the job definitions accordingly.
+.msm:apq8016:
   extends:
     - .baremetal-igt-arm64
   stage: msm
@@ -165,7 +167,7 @@ msm:apq8016:
   script:
     - ./install/bare-metal/fastboot.sh || exit $?
 
-msm:apq8096:
+.msm:apq8096:
   extends:
     - .baremetal-igt-arm64
   stage: msm
-- 
2.47.2


