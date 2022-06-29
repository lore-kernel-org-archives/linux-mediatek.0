Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE35C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 11:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuWeqiN11Nl2GFiJH6wbJO9nndhoN2u0vs6RJG8CKzA=; b=1SnQ/LTQv71Xxz+AiNf5AH71Fp
	2XNTU/UJXR2/KU7nLJVAVV1z7aa//qoM128bnoyWWXeV2XQh3//VlxjwS62VoPwgsYgVyluRI/9AK
	8kUk5+tw9FTsGLpAeYihbvnfvia1xMolkOsF6qQk//tuzu5IiNq+EhNRulCjpiPolHwFe1PQhgjyO
	g+FaN50Q4LRcdMHQoUG6EcJo3wzuKOherr3UuXEXQk+a6zXVpiJbIdIV6vzFt5XBGA6lSm8YR5DVi
	IZH3sxRYedY+XcrL2r8QcNusv/p+W4qQO089bitiIKUKeybw0WhpfeKgndUGAlQoCjUO1Kne5PeQ7
	32LZxIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VfR-00BKBg-2L; Wed, 29 Jun 2022 11:15:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VIz-00BALr-0R; Wed, 29 Jun 2022 10:52:24 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 52E556601916;
	Wed, 29 Jun 2022 11:52:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656499937;
	bh=yJMWD0379qYfTWb2hFD7ek0Oc83E0yWUu24MTyo1EJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hLRe20D8l3H6G8jkdYHFx2cBfJECQrzOKp95hd4/4S/yWA+HDDLPLBhu6UWXeF1Yi
	 LY0+X3yx19nya3KgkXCslMxXV8VGtEoNsYxvfUo1md4gihRxWNlRHl/ZfTbHEfPbjo
	 RqUQfJbhAnBHsPN0xctk68UMNwgKJp5ijy6COK8jAQUqfzHWMSIJI+4b+3LSi4DjsR
	 WHlR2MF0eZHrb8wHaszQavr+8vWdUpKxlOkEmAnvzmkpZM8ARKTdHaoEh5OzJJmFYj
	 8/UVmZ8Et7jr3yZylL29qVXstjKzfcaBJdI23weGoXouBz5gdSS+TX20fgEgISPI1f
	 baqfVOh3E46fw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	chun-jie.chen@mediatek.com,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: reset: mt8195: Add resets for PCIE controllers
Date: Wed, 29 Jun 2022 12:52:04 +0200
Message-Id: <20220629105205.173471-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com>
References: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_035221_334613_E9F7E6D2 
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

Add the reset index for PCIe P0 and P1 (PCIe0, PCIe1) on MT8195.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/reset/mt8195-resets.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
index c87ba621e72e..5471468c43b7 100644
--- a/include/dt-bindings/reset/mt8195-resets.h
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -31,6 +31,8 @@
 #define MT8195_INFRA_RST0_THERM_CTRL_SWRST     0
 #define MT8195_INFRA_RST3_THERM_CTRL_PTP_SWRST 1
 #define MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST 2
+#define MT8195_INFRA_RST2_PCIE_P0_SWRST        3
+#define MT8195_INFRA_RST2_PCIE_P1_SWRST        4
 
 /* VDOSYS1 */
 #define MT8195_VDOSYS1_SW0_RST_B_SMI_LARB2                     0
-- 
2.35.1


