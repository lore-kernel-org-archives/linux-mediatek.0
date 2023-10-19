Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA98CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrBQkKlj7azPaWFlMJULiJYb9zGSVeJFMo8PhMQXUw4=; b=qAPg/dQrUQ3jAK0NCeaaDWX8SF
	OJQujVxwqjdh0/a2Hw/MhKWdFxMfhEh/0z7lECOZ2z0TTNOIlNqEOe28xjm+wUe1pF5UoDYJPjFTi
	VrdwW57MDviOH106dpr1OSEFXzI8v94venF8D/tKJeiZqZzGNy/5d/k8urpZUXpQ1gXahWtsn2W/p
	GBpj+/JUSU24V1NNf05SRNDkWjFBZjAWq1OMO4roErYjjL2jHn0Bt1XAYDbJgPFfmanoUWuHPJjUo
	Y/kp2D8PX41OEM8Y27cKU7NHTRcVHogrgEjmIRyo2XrYLGjGUs1OK4OK3eDVtKWBGRns3putH0m5j
	4QG5nlpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN80-00GZXh-2l;
	Thu, 19 Oct 2023 07:07:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7y-00GZVL-00
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:31 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 312196607322;
	Thu, 19 Oct 2023 08:07:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699248;
	bh=dP49oNFW4L6PoyHV6yP5EM19BPbpo0PpVXtziD3DbIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MfUYe/Bdv/jgi41RnOXeMv7LI2HX9Tea3DQFrHHHd5TK47TmAuAxXdjitKdYw7Hhm
	 hheO/6eJWsyl/rU96GXdudDV/813yd2QiozornvW3LXRL8CVlStQE6FprFyaOnNIl3
	 S3OuKjpzVw1ZCHW6XUVdeA2Do14v9UdfpkkbCGFIP9G0R75d9mx8U8dVE/wABiKRWq
	 1NUfFoDDMREKDL7nyJq1Kddxu7kL65HNHXrNfEc2YaVQpn/ILH0Vczi/JY1wsznjMq
	 eOzXUPIioBztCZoaSH1MN6TFbHOgN0X2qce4A/FBgSUb5opZvahyUCbk3R4gFjCkUY
	 8PvTl+SDdThCQ==
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
Subject: [PATCH v5 4/9] drm: ci: Enable new jobs
Date: Thu, 19 Oct 2023 12:36:45 +0530
Message-Id: <20231019070650.61159-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000730_172270_71292E16 
X-CRM114-Status: UNSURE (   9.01  )
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

Enable the following jobs, as the issues noted in the
TODO comments have been resolved. This will ensure that these jobs
are now included and executed as part of the CI/CD pipeline.

msm:apq8016:
TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.

mediatek:mt8173:
TODO: current issue: device is hanging. Fix and remove this rule.

virtio_gpu:none:
TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Reworded the commit message

v3:
  - No changes

v4:
  - No changes

v5:
  - No changes

---
 drivers/gpu/drm/ci/test.yml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 9d58c0e3bbab..763aef28010e 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -108,9 +108,6 @@ msm:apq8016:
     RUNNER_TAG: google-freedreno-db410c
   script:
     - ./install/bare-metal/fastboot.sh
-  rules:
-    # TODO: current issue: it is not fiding the NFS root. Fix and remove this rule.
-    - when: never
 
 msm:apq8096:
   extends:
@@ -274,9 +271,6 @@ mediatek:mt8173:
     DEVICE_TYPE: mt8173-elm-hana
     GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
-  rules:
-    # TODO: current issue: device is hanging. Fix and remove this rule.
-    - when: never
 
 mediatek:mt8183:
   extends:
@@ -331,6 +325,3 @@ virtio_gpu:none:
     - debian/x86_64_test-gl
     - testing:x86_64
     - igt:x86_64
-  rules:
-    # TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
-    - when: never
\ No newline at end of file
-- 
2.40.1


