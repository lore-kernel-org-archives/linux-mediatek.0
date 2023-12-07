Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BF1C10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXain3niiCf8A3u+pxyFxzEUu1ZYzaIaFCar+Q9Gi1s=; b=hY6UyGSjuJbf5ygG8VCs5WeCg/
	mKlzN4nuitXmHvcQ/1e2TBX14R2WI/W2wuD/fcqpHaIhs8TUjgf2/v9RgRqGqRlzalmuzrJUacsJx
	y33Yzr5wWibFtJ57idA7cQHO63KBbcobLksHZ83J5PT9FwxIgutjVMC8onEkfi9DWEum5HhUfldMF
	jPaRDcKVxDCZOOxiIQIASL8Pjx5lv9MJfwrvTOZFvz3PsusG/7N9gmhVwS9zHAFJ5co0l7cRLw9LC
	DEHXOA95wuccyu//wlHb4oY/XfdpWisTKGPolU+IZDeTBAOYDwLMQ0YjgA0mdi9LSshsMjl4SJsyv
	NklO43tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXJ-00CKXU-0m;
	Thu, 07 Dec 2023 09:19:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXG-00CKUU-1R
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:19:12 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4621966073A3;
	Thu,  7 Dec 2023 09:19:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940749;
	bh=jsXvyaxLK1RLJ0w3to/+TD1bfT9/09QovVkjG8ry5mQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wc6CEcmUdfsE+2O+VjiYKiRkj6IaKLsk1IKefHHhHMgg3T0ctwHbOmceNjNQ0hTRF
	 RxmlPJS6I3eIbk5I5lSMBr9+5X7+coCRSs5SGtZhA/sjrNu02oZMgFVx5Szi+iMVgW
	 JJAW1EiFdHkpkgg2jgTUZtN+SifVl0B/mE8OvgFYeV0PRDuxf3IHSHnbzZjQWbiPL0
	 Xu6J5WlP0OyqJTr+lvq6r/U+saYAt8eYE7SzKZ9FKufgabdgItKpksSPs4Nv/UL1ec
	 K9OgM2RYDgSFPhJNoIj+NDVzuaxdq36+0XYveQEmWR7r5nUx52sguKJHVabtZA4y7G
	 fSPGo6aAi/4xw==
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
Subject: [PATCH v7 07/10] drm: ci: virtio: Make artifacts available
Date: Thu,  7 Dec 2023 14:48:28 +0530
Message-Id: <20231207091831.660054-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011910_611881_ECE6FA53 
X-CRM114-Status: UNSURE (   7.36  )
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

There were no artifacts available for virtio job.
So make the artifacts available in the pipeline job.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to make artifacts available for virtio jobs

v6:
  - No changes

v7:
  - No changes

---
 drivers/gpu/drm/ci/test.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index e0fdc55c9b69..2c9a1838e728 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -329,6 +329,8 @@ virtio_gpu:none:
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /lava-files/bzImage
+    - mkdir -p $CI_PROJECT_DIR/results
+    - ln -sf $CI_PROJECT_DIR/results /results
     - install/crosvm-runner.sh install/igt_runner.sh
   needs:
     - debian/x86_64_test-gl
-- 
2.40.1


