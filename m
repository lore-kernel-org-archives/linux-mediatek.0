Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C68FCA0FF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wf86l0kudUFiNUBRGjvR+P7VCY/eF345O3Jgqb+e3LQ=; b=Iw4mSiBACR7ld8RyrjGnsoYp5Q
	2mu2ZbliRDHsozDiyq8AtZ5ufubjBjC9joxHKpwe1Msv+a/701DnwMIO3hzGk5N+s/jDkK1i/Eym6
	MIMAytRN0P39t+UE5hW0CmrzTXFZu2eJdjeeTl3wdPXOzNDYAJ70E8y5bXAJWsUixzJ5xpBBRXTwQ
	YONfySpEHXNdk1cm4j7Lin96YoxcBhn+XLMZj0usyiDkud64AtyKDn9wUA7SkdizhvHjcWQzvldTa
	6m3J99wCUfVekZtc0O18/m1kgpusdoiae8SsO1YrRXYFLjud6BY937c2bVlBmhsoEdwaIG4OWkcT5
	5eJK9q9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFI-004Rrc-0D;
	Mon, 04 Sep 2023 16:16:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCFF-004RqX-11
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 16:16:10 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 866776607239;
	Mon,  4 Sep 2023 17:16:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693844168;
	bh=8FGqnMwKWzExttutUydgPKrWeHHmGACCAPVXjKbEUGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cx6l/QTA5Ypgzbgh3Gxi2LZIdYN8TE5DzBO+iDvwfUOrN2EBswnnWFAalGUm2/Zj2
	 2BQaHBNk5PdpYn89YSjFKKBm+Ijnbx0EpfkGUpLsGWU75OY7kRvaIL6uVlKx7XC4iZ
	 qSGmIn5p76Qn/hxFN//sMmDpGXrdUVOyl0TgjPcfBb1NrmF29JwwPU1syfalD3Ovb8
	 KuXBZbTcBfKjlOruKk5BgbhHzI6DbWClCYA13BlrSR+J5XkJ29afOF8PJ7Cd7rDVEi
	 G0j04SHqmsNmLlCTUBGjuLQhlPCmq3YE4siIfR7Hnt9RtXFNdFDZK+eSnGq7jncTD4
	 bXOTxbGzB7oiw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/7] drm: ci: igt_runner: remove todo
Date: Mon,  4 Sep 2023 21:45:10 +0530
Message-Id: <20230904161516.66751-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230904161516.66751-1-vignesh.raman@collabora.com>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_091609_477278_C5DEA423 
X-CRM114-Status: UNSURE (   9.59  )
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


