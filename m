Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C0FC83F17
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 11:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHASiKC6ea3EK1AJgDe4GArg+/xURA4ZhnAw3m4ql44=; b=zwHLQIOPfBhD98A7tCjfpdqbv3
	Qh4L34ivZXQ6AoSXgA0ToigqSq8qYcRT5Ov+Y8TF1dCQL55MqIqKpY6EDNZM2HxOWy2UELPpQDFHb
	9CuXQRbf8qZ7/WvYw9TA1Qhw0hsvtrQi5kuiDUgIaF9atrW0olJqIFuuyf/Tt1b2SoAsSSYBKGl2T
	VmoJvmWIdA2XaMshYtLZ5RGvZPsYlsNWSb5X2AEN662Ya5I7I7DaU38jxu0Q6LyS9gOJzknRUGMQv
	Tfd58eXUXdrrtSJgFuygRwocvkPoAkIBuXDW6cNQcok5DfaKOfBAEl6mmO2Vul8pwcovk2Q130GRD
	28qalsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjFL-0000000CQq1-1D21;
	Fri, 18 Jul 2025 11:27:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucijU-0000000CMJS-2nEn;
	Fri, 18 Jul 2025 10:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752836067;
	bh=DcifpRdDner2fj6W9Zx9zgD04arAmO1TSTumNsIisT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KCNOCUkYes2/54fgCGIHjrDjFy1DHXqXEPSFz0wxCD0pgcCFoq5lNZqMtune+HtNi
	 6m3rrIbFN4ZN8tfSAdotWU+S/NMb0lvy2bQA00sMYPR0JYsmRBeKZr0roUpGRAAn+U
	 6TE+9rqibOHkcRCM5gLQkqwzHnd4d8pRS/7DCRxOsA9pofco1BUulAaICf0dCAtrwh
	 dfvXUWov5cKabLimFYIXktubZEhG3DvI02WUdq3/4iHa80iydeXJmgskUePPROwd0L
	 C/cSdQxVZ5r2pRq3oFPukmGciryaHexfbzdtMF+6+Bn+mnsC0e5f07q7cxCv+HB0qJ
	 GRzkIXRIrW8uw==
Received: from debian.. (unknown [171.76.80.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B702417E1522;
	Fri, 18 Jul 2025 12:54:23 +0200 (CEST)
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
Subject: [PATCH v1 2/7] drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
Date: Fri, 18 Jul 2025 16:23:54 +0530
Message-ID: <20250718105407.32878-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_035428_844236_0AA866A4 
X-CRM114-Status: UNSURE (   9.99  )
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

The sm8350-hdk jobs are short and each test takes around 2–3 minutes and
the full job completes in about 10 minutes. Running 4 parallel jobs uses
4 devices at once, which is not needed. Set parallel to 2 to reduce
device usage.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 53d19ffaaf61..d1ef2d91e7d8 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -185,7 +185,7 @@ msm:sm8350-hdk:
   extends:
     - .lava-igt:arm64
   stage: msm
-  parallel: 4
+  parallel: 2
   variables:
     BOOT_METHOD: fastboot
     DEVICE_TYPE: sm8350-hdk
-- 
2.47.2


