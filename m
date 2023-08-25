Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417F5C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16KenFNhuIS01WbFdih/8cP8xa3Zk3yeDppFve14KYY=; b=RTFcJ7o1n+2jzR+5sR07RQHZaz
	TvdIzoKUtrjvKXFRS1F4QZcZsaa8+rvzM+qVUg6ujxtMXXDLwqwLNBBeRr+E/mBq4YuVD2hIxN8JX
	Wp74BrSJQBV73JCDc0c0waoVwXSuBiY/vzA9y09ad32Ka0mqahu8nGqQSUaAlBnbxzODnyi6r85X8
	NHZEQWFqQgz0C631Kjrl8Q2yPshSahk7en+W9W3g5nzBkqXb6zEvgYH40V3Yv44t+DIDOJW/A0pDk
	uJDN4tGJdLaCeCmRc6huccTzMGRhs6v1KwXw0Dv0ilPA/JcCJZs35qS7CytXiSZx+0T9vNDScsFcf
	l3jvVdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVsM-005NP9-0r;
	Fri, 25 Aug 2023 12:25:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVsA-005NJO-2S;
	Fri, 25 Aug 2023 12:25:08 +0000
Received: from localhost.localdomain (unknown [171.76.83.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0DE23660319E;
	Fri, 25 Aug 2023 13:24:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692966305;
	bh=x4lq+tbR066pnVQGeJjEJAxiYr3tkgjX1Xjly0l74rI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wi+smrECNXlcnUOBI7muZ/8Nm8As7l8y6nvRVAqrMSZgU8xWkdOzhvNJ1TL2rVRhV
	 ablXvIcmLPu01xDlOLUujge/fRUGoYyfbaMnP8OzGLVRWu4uNvbLUi72C+BIEC7IHn
	 SmwjvI3b0cokzv+aOFSSS6t5++foVeu6fhuBewNDxrwj4wOouQAoCbczYw+GL9faM2
	 dsdEDuy32afZqIehx19Ir2PfDFDxoJlt5EBHg/5d3C5GcxgRq/PqPk4RHTMU8viPzL
	 f9zUHPHN10hz9hxR3tDpz682Sgh+7HwXDx7f9dLpOIJ5csTx1kiIlNDT0j2nPAtHqF
	 4dnfo7WtXwSdA==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	gustavo.padovan@collabora.com,
	robdclark@google.com,
	anholt@google.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	corbet@lwn.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	heiko@sntech.de,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/6] drm: ci: igt_runner: remove todo
Date: Fri, 25 Aug 2023 17:54:30 +0530
Message-Id: <20230825122435.316272-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230825122435.316272-1-vignesh.raman@collabora.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_052506_923939_F657FDA7 
X-CRM114-Status: UNSURE (   9.15  )
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


