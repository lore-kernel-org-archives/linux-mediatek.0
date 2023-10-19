Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FA3CDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VK8gmZgwdW+6qfofVFZrHYCzUY50uLPP6kpSTi5R/es=; b=cMgkxi8jUJr9fo/4sjzsa4D9qY
	RAiZ8ZLR/FpD9G79D4+XdxE3VMzasC1K8NLi+LE+YYedoui/dB3vfs6KADO4t3NfOHSVrXigcl+S0
	aDqqDo4wQ1AT9gtXY9y/QWsvOkwqpnjf6qyC0qn3awzlnEnu0kHqfp8MfkjDyFlkHeLgmf9qx9E/+
	UplhVA68u1xmWdeFkhMyHssPBBHc31beHi9R4Y9Lku/dB7KCYn7usR/bi1qaPK6CG/IqiIX1L1/56
	Yfe579EKgRUpkKNpKFeGUs1wqs/qZHmo8NnVd1W/MiOicahUVFm76hG7QIOCbx32CprnI91p5kj/n
	Vdytk2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7s-00GZT4-25;
	Thu, 19 Oct 2023 07:07:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7o-00GZQS-1l
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:21 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D31B6607322;
	Thu, 19 Oct 2023 08:07:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699236;
	bh=/C8YPSzfmGfNXN2UJl9h+rxFsn3jEPSYXPfQD4IqLZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mq3qoxXAxIFlfkg6DERtIOb4ooKVeQutWJMrypQ8ggbyqun4jLC5Ozdqhu0NA7lQl
	 eF8Dk1LR3OPy1jNrAu/HrCFf2+8gZfTctYSG9tsyOMCREbICRmsdWnh4NnybzQSy3s
	 q40GkVQi0FNcaQQbA9aWGXr334QNrNbyT0tXIEt2bCPolxN8zlkzI9RqPecCMdE9O+
	 kPX/gv6sy4HyX72z737gFD1zgthm1mslKWznRQzTjOpxI2/1rPv4hMQmxEVhRMhB+U
	 7dHQMT445y0ddW7Dl9Fzfi71nufcSIXcjQlm5vSoxndOuFyMKXLL4/hj6Vx7XmsYzJ
	 teHSbZIKp+EKQ==
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
Subject: [PATCH v5 1/9] drm: ci: igt_runner: Remove todo
Date: Thu, 19 Oct 2023 12:36:42 +0530
Message-Id: <20231019070650.61159-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000720_707256_2620257E 
X-CRM114-Status: UNSURE (   9.22  )
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


