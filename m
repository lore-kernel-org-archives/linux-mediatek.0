Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2B9C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdJsEaXcN3Wzp/swFLFMOPKCn/jFzgNqYzhQHvJMiUo=; b=2dd/qrteIrea4z9Y1sW+j/Kwp6
	HI9FW/UosMqkUF1gAPYGuNqjmHdACwceaXyHcvIK6/6swOeLttpPe6JDXyrSuXeJxIIxmLpNqKQrr
	uhWVpYgiqAeOXLT1FBBaQGE0IJIUrNF9wcRxIOMkpfUFNN6BQNkqMjTbpbhHNWBPQcPBwlGB4EdyX
	11jNKJEyo+zalHaL9tqWSp6Jdu1LOCnICLEc+BMfYYCIRtti4TfgH6JLWzrcqvg220W0J6/QIfK+b
	l0JZ9QzHqX+EV6btbN33cdV0p0/2kxn344dYUenMcWiP3kLJi7BrsCiJZu9qFmfCxYpLdnIqVh7/4
	9wz30TRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JXg-008HsE-2I;
	Wed, 29 Nov 2023 12:19:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JXe-008Hpz-0n;
	Wed, 29 Nov 2023 12:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sdJsEaXcN3Wzp/swFLFMOPKCn/jFzgNqYzhQHvJMiUo=; b=St/orDDanWBYHFx5H1WrHU824u
	wpTAahSasJzj48TCvSUiojHTswPd0s/UZeKs7+1AKgk+dAm01qYdTDS6dtH+BW/O74t7GehRSnFuC
	QX3jWZsNlokCUIgAF6zGHq9SdXVb/4mbl194SfBseImA09p5l4ixrZD8pBe3fYe5uNMXt7X6q8pME
	Sd6UszyN/+x4zB4UXVQA0g4rnS4TFyC3AwI3SgQ14su6uI2ljA256xm1TiwLzld90flMEmnnIX/qB
	7jsB0UIoLug863cGhc2alA4kLFwVPH4EW56mNoyujuamDWg5bee1FA9dY0/ZdVyQ6ElsR6tUAG68S
	h5KvTmhw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JXM-000LRy-27;
	Wed, 29 Nov 2023 12:19:40 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 344CA6607325;
	Wed, 29 Nov 2023 12:19:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701260362;
	bh=O5ckehyI20/PoLmFk+FV3fLp1KbSS4iwwIAE9XfLTh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R+WiHN3gCDt6vq+jDhSG7b8yQDkYWemthE6ABt1fa9Hazyp8zqJeM9wW/w/uz0cQz
	 Eg0iMzsj7MsUCs1wGKkd96wLK/MK8PGYXoH6h6DDbJlUFg5fGLhwbiEjKGT+KCblyo
	 jSTXJKUt4qpVLqzzHFCQvxQnKuYOQv+4Jux+uFCjOGlJx+aP1fQD3bJaq15aG6bpAU
	 tVJtDMOzdUyMqCRp0Z9K1e2KzqOEbWlgzwSJlI/kXrgDLibdWeZS6KYc6JhyGxqXkm
	 daUeCsjPUoRUMXm8KmxDRzzxTORlSZrjoAKfBiSHZKE/OCrninnhKiVE/9FEwCrwrZ
	 D+UWU24o7lXgg==
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
Subject: [PATCH v6 07/10] drm: ci: virtio: Make artifacts available
Date: Wed, 29 Nov 2023 17:48:38 +0530
Message-Id: <20231129121841.253223-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_121935_410054_B353DD0E 
X-CRM114-Status: UNSURE (   8.53  )
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

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to make artifacts available for virtio jobs

v6:
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


