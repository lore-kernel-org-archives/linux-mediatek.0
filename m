Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF2BC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 12:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Vk3LKSa20ghlaWsXaP2Lewh4VmGLgzGFoTB0UBXmoQ=; b=NN5CL2mlQ5gEHA5sGXXgkqsgoI
	HsRfm+BxXetZ3ur3//EZMnZ1WJQvY66POQxZEg/TaT3RMr4zJt4NE1KXu3h2IAvz6aLGCW2vbl4wt
	qvFGMZi16ulpb0FOz8yEWl7Std5JYn7QZFC/7lhluB5dzNl4ZXrdpL1bnRTPsGztkmScerxMXvq/B
	MPwY19UtBNvEqDHr6O+Uzw9hTOdlaOfI4Uyru0AbmeTDZ1Decbekd/p96YmBkXEXpCUINkDWnBNNF
	GL97FqO1tYyD+bgN/xJX6gB2vGihTjw8Dd3YRJQjLZ+56+Xs5BI94UbM97Hci4wNrZ2j+2p24F3mo
	SNBY5+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Kwv-00C0pQ-5m; Thu, 22 Dec 2022 12:45:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K4u-00BXSS-Lb; Thu, 22 Dec 2022 11:49:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EF2CE6602CDA;
	Thu, 22 Dec 2022 11:49:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709775;
	bh=Tr/46hNNOpqiOPa/o4lwiU65I35XnBdfwH4jCPa5+O8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XkvZjgkK5shQMRzCcdGGltXudtsDvdURUWGjYcJTBAXYZPzM7FfHwOfzn3Wrx5UtU
	 bioxR2SRpIqJ6SmRehVzitgBgg/+RFltcUtMqpaBXy6Ct4YnpLVakKNoF9tC1m4nXG
	 dIA20SB/YDTwdbU3zYfcMcxyiKXFGErxLiBUGYAkQ6AXeJy+JHoKdDr1YAyrDOEjE/
	 QZgX/7PV/SzOT7C2vae5zGZQwaZNFTJJBJuAn7xJgBGyLhGA794rpKjl5ropAJ9aon
	 HuGag79PsKpMLd6qdcf+Y3LC+y87JX6zKrhb70p7qnSg75NdWr8/4AdJDmWuSIPjQ9
	 eWEeyp7OPIGEA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 12/25] dt-bindings: clock: mt2701/mt6779: Add dummy clock with ID 0
Date: Thu, 22 Dec 2022 12:48:44 +0100
Message-Id: <20221222114857.120060-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034936_891047_05C719B5 
X-CRM114-Status: UNSURE (   9.52  )
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

As done for MT8173 and as a preparation for clock controller drivers
cleanups, add a dummy clock with ID 0, allowing us to simplify
driver probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/clock/mt2701-clk.h | 3 +++
 include/dt-bindings/clock/mt6779-clk.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/mt2701-clk.h b/include/dt-bindings/clock/mt2701-clk.h
index 6d531d5ae065..0ec2c81453b0 100644
--- a/include/dt-bindings/clock/mt2701-clk.h
+++ b/include/dt-bindings/clock/mt2701-clk.h
@@ -7,6 +7,9 @@
 #ifndef _DT_BINDINGS_CLK_MT2701_H
 #define _DT_BINDINGS_CLK_MT2701_H
 
+/* Dummy clock for backwards compatibility */
+#define CLK_DUMMY			0
+
 /* TOPCKGEN */
 #define CLK_TOP_SYSPLL				1
 #define CLK_TOP_SYSPLL_D2			2
diff --git a/include/dt-bindings/clock/mt6779-clk.h b/include/dt-bindings/clock/mt6779-clk.h
index b083139afbd2..478d4af33b2a 100644
--- a/include/dt-bindings/clock/mt6779-clk.h
+++ b/include/dt-bindings/clock/mt6779-clk.h
@@ -7,6 +7,9 @@
 #ifndef _DT_BINDINGS_CLK_MT6779_H
 #define _DT_BINDINGS_CLK_MT6779_H
 
+/* Dummy clock for backwards compatibility */
+#define CLK_DUMMY			0
+
 /* TOPCKGEN */
 #define CLK_TOP_AXI			1
 #define CLK_TOP_MM			2
-- 
2.39.0


