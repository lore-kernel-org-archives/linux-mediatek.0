Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3F0C10DC3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcGps3dXgbPUkAcIQmlMxphFgEzt0FudxPWLUqxl4Jw=; b=oL5orpxQBq3OaNRu8nhLNyigcD
	RUluKySmivQd9tp1XtZRailkgoQ42LNzCeEm761YajDJULVoz9M/GzMjh+wt1nrxKShPuusrX67mI
	n7O9QqxI3cANEFrMFhMHIt/arZAs2pTxuHp1JmISJgyTBOGxQ1W8nzIknnXoUVfonRO7rl5ewNkBB
	Db2mL9GIspmMPdRTnB1p/wV1J/HWWP+9rn38GoMXJ18xjjFExQKhaS8lsIjH8h2X57rqv5z6kFdYC
	YjEH9BV5gqU4hip2EvtdD+gKU3244IPLbxK5BKjmnqfylpW2jU2T+05wfmyhSLEA5F67YXdqcmwwN
	ZEWU6gdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAX8-00CKQ1-1z;
	Thu, 07 Dec 2023 09:19:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAX6-00CKN4-07
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:19:01 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 923BB6607390;
	Thu,  7 Dec 2023 09:18:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940738;
	bh=ZBoHoYMq5tj8/E//F1IEVjOTUa6tqdPIN71pGD/UNCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W3KW/mVYdzo3RXmjZaJdEWG5tGBIgdYndNkmLqRLriikHmnCHJ4YX4zaYi+Q9THLh
	 vJZPNChgEGemXE2Z5lE8wSvcWWruxIHLeR46CmXxQONlphVgjwrjwwe4nGsrAgCinq
	 uBnVcr9rK64YIElf/dfzuF3b6JuWY7j3ScqHMtdqmGUSmqYsM89x0HvcuULZfMmzhR
	 hqVke6MRSj98p7yOFKhjYrXKI8xjHe80uS+LkYzgi3EjGvwAzq0vO5oz1tBkG3Ssi3
	 A4bBaJwCoCjfMlsLNCj/u/Yvfv6EnXTLg+08itjjPpAAD4fRTSWSBIkIS6Do/vwUD5
	 kKPMPqRoXw9XQ==
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
Subject: [PATCH v7 04/10] drm: ci: Enable new jobs
Date: Thu,  7 Dec 2023 14:48:25 +0530
Message-Id: <20231207091831.660054-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011900_203598_30C1F65A 
X-CRM114-Status: UNSURE (   8.54  )
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
TODO: current issue: it is not fiding the NFS root.

mediatek:mt8173:
TODO: current issue: device is hanging.

virtio_gpu:none:
TODO: current issue: malloc(): corrupted top size.

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

v6:
  - No changes

v7:
  - Fix checkpatch style problems in commit message

---
 drivers/gpu/drm/ci/test.yml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 4af10f0ff82d..e0fdc55c9b69 100644
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
@@ -280,9 +277,6 @@ mediatek:mt8173:
     DEVICE_TYPE: mt8173-elm-hana
     GPU_VERSION: mt8173
     RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
-  rules:
-    # TODO: current issue: device is hanging. Fix and remove this rule.
-    - when: never
 
 mediatek:mt8183:
   extends:
@@ -340,6 +334,3 @@ virtio_gpu:none:
     - debian/x86_64_test-gl
     - testing:x86_64
     - igt:x86_64
-  rules:
-    # TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
-    - when: never
\ No newline at end of file
-- 
2.40.1


