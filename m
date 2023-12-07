Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04843C10DC3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sm/lzpAvhuHS3gU6Neby55nIAMb+5+9K2s31MjKibKc=; b=sdu7Wamab6WcgA2WUx5UW+XTOZ
	txWqwJwtru913w64r7T+e5ytRXfnPVHUjHpJoby1gtP3ICUel2uX7rJsLLBI59A3Gkg+dt7lWUvyR
	TpHHdA1zEHjnpTz932pR5IqfrYXzBN3YMIBGaH7eB6dWbp9b+qoTRm45YWS1tdFjhh1PYcMRQwUtp
	ZZOR9NWe5NguxVPyLraICLPOV2PsSVVkOvQY1w97mRGgDwq+IrBRLkinV7aD6FYFVhvwPMuAyGOw9
	j185twCA1/ClNCebbBLzXdWNVQd85XiPU5m4swiZLxxY2sMqjSuX09P6zv+m1a69YnJYxI4RfEgF3
	UOqNxNcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXD-00CKSl-0E;
	Thu, 07 Dec 2023 09:19:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAX9-00CKQ6-1j
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:19:04 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4514C6607391;
	Thu,  7 Dec 2023 09:18:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940742;
	bh=Mr77Mnfxx47EKwKczlFzG/RZhOtpwmigpFeB8yxRJNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTUvobInVnqFWIb2QNHJRRJNPkSZc+hRREr6bY2gUx0L2dWCjW2capjl7Y2G9Wh/k
	 wyIBPyZzm3wDAgZWkJnWj6pzW2CUuhncd7Rv7P92k8JM4FQ0J7/gl/5rMYqJ9GWwCY
	 gGjXt0mkqmCFZo7UPHKSxD83DsBrJNl1jm6jIyR3IU6aqcbV52TWf6IxERHAAUU+YZ
	 63erHer9VGzMYnmAKaVpWsOOwa3DavdvXpiJ4KNKN7byEwIgIM1YUZcMFQRimn3xKo
	 yXNvnZNPzmE4so92v652EUABTXHRlrlDFY6nPBK6E6zQGFjFa9XUdrHyYnVzphj8Hr
	 cNS+9f4iCs/Pg==
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
Subject: [PATCH v7 05/10] drm: ci: Use scripts/config to enable/disable configs
Date: Thu,  7 Dec 2023 14:48:26 +0530
Message-Id: <20231207091831.660054-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011903_702381_E5D663EB 
X-CRM114-Status: UNSURE (   8.68  )
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

Instead of modifying files in git to enable/disable
configs, use scripts/config on the .config file which
will be used for building the kernel.

Acked-by: Helen Koike <helen.koike@collabora.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - No changes

v4:
  - No changes

v5:
  - No changes

v6:
  - No changes

v7:
  - No changes

---
 drivers/gpu/drm/ci/build.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index e2260b4a1c67..97ff43759b91 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -75,19 +75,19 @@ else
     fi
 fi
 
-for opt in $ENABLE_KCONFIGS; do
-  echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
-done
-for opt in $DISABLE_KCONFIGS; do
-  echo CONFIG_$opt=n >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
-done
-
 if [[ -n "${MERGE_FRAGMENT}" ]]; then
     ./scripts/kconfig/merge_config.sh ${DEFCONFIG} drivers/gpu/drm/ci/${MERGE_FRAGMENT}
 else
     make `basename ${DEFCONFIG}`
 fi
 
+for opt in $ENABLE_KCONFIGS; do
+    ./scripts/config --enable CONFIG_$opt
+done
+for opt in $DISABLE_KCONFIGS; do
+    ./scripts/config --disable CONFIG_$opt
+done
+
 make ${KERNEL_IMAGE_NAME}
 
 mkdir -p /lava-files/
-- 
2.40.1


