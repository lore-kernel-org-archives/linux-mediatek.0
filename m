Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5782EE8015
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 15:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrFZbmc3ME7PyyvKIpT3qGdl7QiSaar5FuMbWnr3Em8=; b=wLlOMehCU+Ok0OOgcpXzWRGV/1
	gkd5YayWVbZAoWPY1zJ8YmDjqgeUN9cs2IoBgkcP79nyD6+IOaa2ju7c7ciU63+SMGdSethEXjTV+
	+hyhix7rA+cI5idiHSbHfsNjPPhFIAqP9gNW0mhUjGpj8e/dGhsEyZxUTrlgNh4jCkJcZnWlQfFcf
	Y9gammBEKAF6yDsSOLAsmAXQ7fQ5WSl7Zbe9zFQHkf6NzV9UhrAMZ50kQ8YuJbpk0axCFVwz9jJcz
	udQ8gZGL4b2Bi69RjtAgf9Q5zqldJ1ZkJuULZsXS0zx4FTxDVlDYuQeZ10LF//0D5aiPwSLxmZe7R
	i4yGsB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKH-00Dziq-24;
	Fri, 08 Sep 2023 15:23:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKE-00Dzhf-2A
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 15:23:16 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B35D666072AB;
	Fri,  8 Sep 2023 16:23:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694186593;
	bh=70CHDo1InUS+MvNfKVtde3bBDB5t7x+CHUmXN2X4oLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DmBNzam2pyIDL7f9vOBU6avqqZqVetkJHBgrlTVKu21IR6hPJF0iMloPdwXzchkS1
	 K70vGsS4Be60btQm1KIp86Ug3vVOzZuycrL1i4Nty7uUWpafXfRvaRSQhR/U4uP/2/
	 PNcjA+22nGCVrFaAVOlW+P0ZVKetD0Fee/0yEpbDz6DY7gdihsmffNez/CED4PL/c7
	 NlH+8u+LeyKJe2rcjWqRU9pSFDQaAFJpJwfEF349cHTa8vjrL1QdhLaUjXrR+x6Ab0
	 qTBXgLv/Ql8ZaHuwxuebp7gpgfgRYyvnxLMeLjjqnj1tfpwSPnnuG5aBf5ix9by4RZ
	 t5FwxrzzfFBwQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	david.heidelberg@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	angelogioacchino.delregno@collabora.com,
	emma@anholt.net,
	robclark@freedesktop.org,
	robdclark@google.com,
	anholt@google.com,
	robdclark@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	jani.nikula@linux.intel.com,
	mripard@kernel.org,
	dmitry.baryshkov@linaro.org,
	matthias.bgg@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for usb host mode
Date: Fri,  8 Sep 2023 20:52:18 +0530
Message-Id: <20230908152225.432139-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_082314_835593_D07C74CA 
X-CRM114-Status: GOOD (  14.63  )
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

Due to the presence of the fastboot micro cable in the CI farm,
it causes the hardware to remain in gadget mode instead of host mode.
So it doesn't find the network, which results in failure to mount root
fs via NFS.

Add an overlay dtso file that sets the dr_mode to host, allowing
the USB controllers to work in host mode. This dtso file will be used
in drm-ci, mesa-ci.

Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and Maxime Ripard]

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom

---
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
new file mode 100644
index 000000000000..a82c26b7eae8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&usb {
+         dr_mode = "host";
+};
-- 
2.40.1


