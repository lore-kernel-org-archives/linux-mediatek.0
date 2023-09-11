Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DA4EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sFamgMdl8w1jrxD0CuX75KLI4K4cX+iG2ZHR0GUnitE=; b=BMvNibY22Rq/L1OfjRzsvUEXVV
	kVCd3LSmKtN+zF2lolRlWGQnFit7dALzT3Y0GQWi3W4gTPxSaeTCayj9cM4illYlQZ/lJGt0I8ncj
	Q0q9C22rLrWnYBkAK7v3F707b6wZLwUwPNtKX/5V/oE+8TuDJKdybi9vTi6rSWoLX83ZZ/cNTtXu2
	WbjwqBxPQggLqTQIIWxknJYYMxNINp2s/RdwhzcI20M5yXDbg32rUXE2dm1EjPZ4uPWy8sWFbSIqI
	WqPC0xbYuYjvKZ6B3b/d5fnKkG9FgLBRspN2nxDU7bVyxM0b3BPmOQvUhdsub5JYT7lC2KkO8qoEL
	kpMVoi2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeMy-000I2a-0n;
	Mon, 11 Sep 2023 10:42:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeMu-000I1Q-2C;
	Mon, 11 Sep 2023 10:42:13 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 527E46606F5E;
	Mon, 11 Sep 2023 11:42:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694428927;
	bh=uOfKmnGqS1mdLmWpPUw+MA783YWewPk/pzRvEU2KZgw=;
	h=From:To:Cc:Subject:Date:From;
	b=aCG3wBPhRkqT6IY1WGsg6Gz1Uz0s4qR5o1gnSdwN+UQ2nnImc2gdhCjavnBRWfEyS
	 WfEMwBSm3vw/o/ihz78mi/QYOOiT8e5Mbflp9BMNk40y+qIMZayPfKqZqB0QhL12Fi
	 4GjdQb6kbda3VFxdI2lebCBDMN4967z6EhdPpofi+ikZjmNF9DF6SXMWoLZfJDBNPs
	 FFs/RLizTKYuQrMw3ri/EYGZ49xcjJsZN32ikmz6ijAffLlDWS6VorSDccR1w9N5gI
	 fa9rYtBxVAicWhJVm2ciAqp9vzqvX6zUzgp8rwG1k7wVD9cc5+8o26CxofGPtcuWOs
	 L7pi6614WvGWQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-arm-kernel@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	helen.koike@collabora.com,
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
	dmitry.baryshkov@linaro.org,
	matthias.bgg@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	quic_bjorande@quicinc.com,
	krzysztof.kozlowski@linaro.org,
	geert+renesas@glider.be,
	arnd@arndb.de,
	konrad.dybcio@linaro.org,
	neil.armstrong@linaro.org,
	nfraprado@collabora.com,
	rafal@milecki.pl,
	peng.fan@nxp.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: defconfig: Enable DA9211 regulator
Date: Mon, 11 Sep 2023 16:11:39 +0530
Message-Id: <20230911104139.617448-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_034212_874667_EFEF040C 
X-CRM114-Status: UNSURE (   8.08  )
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

Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
Enabling CONFIG_REGULATOR_DA9211=y in drm-ci fixes the issue.

So enable it in the defconfig since kernel-ci also requires it.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..8359899d291f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -729,6 +729,7 @@ CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
 CONFIG_REGULATOR_BD9571MWV=y
 CONFIG_REGULATOR_CROS_EC=y
+CONFIG_REGULATOR_DA9211=m
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI6421V530=y
-- 
2.40.1


