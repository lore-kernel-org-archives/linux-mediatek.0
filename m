Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3407FC10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmxN9NuqOQTjYuC8dHe4jhhGbvQX/32Ly2pM8xpabcU=; b=T9BwyBWNv36KN1hZSY8ZlU6yCc
	WgDkrbV7l429OUfGtTbwt/CKVIWDQcjsJ9pyucyUbp7UKZmnzkhc4YsDkAhnpKBKSoespeaPwuScK
	IUZM1SONRpKreqROTnbE7ywdliCDQh+0m/ggVdmvPmI3VhtvcZNz1u/oc45z2sjQoH3C2nhmvj89k
	5WkVDV9Ou600LDgiRhsyO0cYHHJizrUEMeUNEVxuxOlH0qdmv2fLwvGuG2YUwQDaD/s0kt0fEOSA1
	/leBIjvHiBXE5KMdVpN/0Uzc1/+bhhHpvhO9pN0PAqXlJPJ5c3gZqk92jxv9NXj09SE/rqXM4AScA
	cjOI5PSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAWz-00CKJ9-0i;
	Thu, 07 Dec 2023 09:18:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAWx-00CKHH-0p
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:18:52 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF9336607390;
	Thu,  7 Dec 2023 09:18:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940728;
	bh=dQ0I3KVxJFnBzrqq6GuCqoIBfvIJZXEwFZhY/AqFdis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ReWjOiZo9rxuv/mfLQexz/CZDhQnyU2IUB2pl3m01Gxopu3JDxYb0fbVcBtNkasqv
	 GJVP3rK/ROcmbjFowKQEvaEnxUz/fq1/fn88/C4qvMwtday/5qgNlaJkKpsn6YMh9U
	 8Aw6vImsjYoLkhwpv7xb3uQOBQ+l2+Jr5U/cSx5Lu/qjqLcNuGSFi1zM+92WvQG0eM
	 OinQGbzbHkyBVaaNRJ7ULbQX1mxDwUb+e/nRKofQHbg0FO/aWVykPJYldH9wFeYNbY
	 aPqtEPpXXcIsdWdD7c6c2ludMrKNJ05ZXrix1QAe76TXkSUeCob/kw94v7EMemew0j
	 XzHFGABMBb4/A==
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
Subject: [PATCH v7 01/10] drm: ci: igt_runner: Remove todo
Date: Thu,  7 Dec 2023 14:48:22 +0530
Message-Id: <20231207091831.660054-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011851_417018_759CD4C6 
X-CRM114-Status: UNSURE (   8.44  )
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

v7:
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


