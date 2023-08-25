Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908D1EE49AD
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBA/kXspgla7jhykDrZlLMgABjD6ErmW6R+kJ9FlF2E=; b=mBrQdRm4fVQytBTUmaUytaSTCH
	NNP02fQD6eX0diQdmgLLFgvomvaN3UL7k44DPLOZWCnjLysK3zP/xXw0Z7m1TqDchO6wvQXTA/XZe
	aoP4VcBPEinrT5liHA2r56UsI7+2Nj7rtrPIATCoVkCBAFek4sLiEs4xKEP5CkBMGkWIQzRilfHAj
	cPOYQrRz/5wTpq7hQVAeOe2qkuv3jTcotNiu65whEkhPanHTQNKlqgYwPm+YN3MAt7cL8CFFY+mNx
	WXYCvPK2MX9SwfV3Dzv1HHFlBQVBdQMOgMzc6KUwl50ACLwAGJCSoe8/UyOTidXZ2mXQE3xlD/PIE
	kSeYcMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVsY-005NWM-0S;
	Fri, 25 Aug 2023 12:25:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVsH-005NMo-2W;
	Fri, 25 Aug 2023 12:25:15 +0000
Received: from localhost.localdomain (unknown [171.76.83.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E7736607286;
	Fri, 25 Aug 2023 13:25:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692966312;
	bh=REQjWp2zHtrfiDs99kq+h6FJkxnRTdlAsV7mFgtYf4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yd4+NKJOxy5N8Tm6mcZMdl+mvuQ74D5UxsXwSCKscOHz9vuwz3b3bTwaPZ/VgcjXZ
	 FJTMdnsF4mV7I0nLA1ldxV1fLEttVn6s8U6izBM+Bppx/D0l5EKx2mbX99n6e9L9PM
	 yTY7YAYz2pbkKO4C1butaugpRlvHeuX4KWEq6G1JH7pvXlxG9LmxmfrK7ASb8knF70
	 CWmoS+za8k2+l8HIq+TZZyve7Y3auOyZNZAT7Q9gLYNzqnqmb52Ol6+Sov0H2KVpqo
	 1VodBSiEz+/VxgynTr87DE3CltOmDByr6/1uu93o1rOwgNxfB9LnKgGkc1IOUQnCCo
	 AJSGaLdztKHig==
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
Subject: [PATCH 2/6] drm: ci: Force db410c to host mode
Date: Fri, 25 Aug 2023 17:54:31 +0530
Message-Id: <20230825122435.316272-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230825122435.316272-1-vignesh.raman@collabora.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_052513_944972_EBFF7E39 
X-CRM114-Status: UNSURE (   9.06  )
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

Force db410c to host mode to fix network issue which results in failure
to mount root fs via NFS.
See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8

Since this fix is not sent upstream, add it to build.sh script
before building the kernel and dts. Better approach would be
to use devicetree overlays.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..c39834bd6bd7 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
     fi
 fi
 
+# Force db410c to host mode to fix network issue which results in failure to mount root fs via NFS.
+# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
+sed -i '/&usb {/,/status = "okay";/s/status = "okay";/&\n\tdr_mode = "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+
 for opt in $ENABLE_KCONFIGS; do
   echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
 done
-- 
2.40.1


