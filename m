Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4585EE8019
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUJ9s937JsUiRuVl09BZ208fDzigmLwLBeRp4qFP48M=; b=LiNOzPfiYn2lw/6bmEQ6uDDO6n
	/sflaVDG8D+Cr4cD0dnVI6SAoqn8d+IV7ysBfJ15P1flzdh5IhBe6+O91+9aE0o3/4moL1huTeDHh
	Oy0ilbAWWquqPuD0hDo73xWtF+O8xNRgVzkrki0kgnTAltJbkKKbGdLm8ORy8aXUcMZRdXQLXUkY6
	BoB1IbD5HDvvr6YKPD434KINS7a82hgK4bpikUu3CFmmLCf/zorc1PzlIawRAGntvZUw4FwRN4WJV
	6k6UXyAV+CRTPB2HcbfLvy3741jCOoIvdLAblev894TEbgAVRUiMLzFWBVk9dVLTRRhzupQDm9Z4K
	iDmYJycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKg-00Dzqg-2T;
	Fri, 08 Sep 2023 15:23:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedKd-00Dzpc-2s
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 15:23:41 +0000
Received: from localhost.localdomain (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F3BAA66072E5;
	Fri,  8 Sep 2023 16:23:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694186618;
	bh=1DMUcJv4d1kKtiR6FbxgUJP2I64N2rk3k1pv7kM9Q04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z/RfLJbpsdHUSr96KD1hZTeQsHweQi/WNCPnDDTOiV5AG55qLdb71TVSzKrmIAs1W
	 sUbSw2t4XTK24BTVBovODkAqviyPTv8DjQuHTHwuEXcDOetV+doKR1+kcHD4mv852E
	 hS5bhmyKzQOKn6dKPYfrKb7IYU/jnj6zRekkibCKmIsT2+V/xckSTWgzTLRTjTzP8M
	 CNZCTDoboQTdUL6S5GQg06rwErHxDAQtwfrh9flOM6a+dZIZ7Ows/dKUkQiLAghzz+
	 SXAVcPPiZq3LMUfxTOFhQ3i0ZZmSxGKKmbYYWyvjVgf1x88qFgf3HJAZwSDknqAXx+
	 ONBzBjaIkoB/Q==
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
Subject: [PATCH v3 6/9] arm64: defconfig: Enable DA9211 regulator
Date: Fri,  8 Sep 2023 20:52:22 +0530
Message-Id: <20230908152225.432139-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_082340_051340_D4D0F716 
X-CRM114-Status: UNSURE (   8.89  )
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
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig

---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a25d783dfb95..ef22b532b63a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -711,6 +711,7 @@ CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
 CONFIG_REGULATOR_BD9571MWV=y
 CONFIG_REGULATOR_CROS_EC=y
+CONFIG_REGULATOR_DA9211=m
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI6421V530=y
-- 
2.40.1


