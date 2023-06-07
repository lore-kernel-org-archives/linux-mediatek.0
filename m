Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA92C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 20:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2P8q6j4Yqvg98j9Xj2agwuFsbF38JXpuR/6XOsVIk4=; b=3WIyb2YnY0Oxflkbyalcye6R1T
	UWyFgyeG95BgAhb1kHdmDdTrclPGl2pu7DPmUymTt5QZPfyKfFazEq1lXEawJ+ElzPFW9Zs2Lmhl4
	DH5/3YXnf1DMCwz8T2IV6KQS5loUHTyF5Fta8o5RpSZzHePLfd2B/qPosyZQmknO3+9HZqFGNWPb4
	XtagRps+Xaa0l3ueOuAVRNa0FxxTwFS7nBj+lpeSBjVS5k60wgv+CcLOos8E7Cl5Ag1SI2mAV2KmH
	sfKFQSF9xyjhlLkx1YnJEEmL5V61Wj2Z0NlSNpuugqBwVP93CPGfBseTPoxrvMfkiY0/4BUfTkdpX
	BeXtGfdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q70Dy-007DUh-2w;
	Wed, 07 Jun 2023 20:57:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q70Dt-007DOj-0W;
	Wed, 07 Jun 2023 20:57:42 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 98E276606F0D;
	Wed,  7 Jun 2023 21:57:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686171459;
	bh=IHu+5VHbpn9tYN0aeoiKy2zTGue/frX6mQhuF4Dk/XE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O52Eho0T3yp7+0mui4z26cOHabKuCSsXrF2DqF5Rb3n1rZ/OJlP0F4Ip8oondaYoB
	 bsAbsRrlpt1YddHdvHdksMQmjr7XfcXKUGtK4pdK3W+3qmNh/NjgKDMjxYq3WRZ5ni
	 F88pQ6/PYBGb/08S+pr4ZinFmBYzZPHTKO1PlerLK6ynyiH0RD5olnAeWrthRovhfx
	 lQqRVsiPQT4kLx/1sbzgOB1enepQ6Ja1/BzC6hGJ261RipK+A8Xi71WsFN07BHQMAI
	 9Rquy2Y0VC1xXkh97Lpw7x31kfXrkCCPOU90qpH7l+Q49yQjORGanfMoDS2ouaIQW6
	 mxI2GpseKK2jA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/5] clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec
Date: Wed,  7 Jun 2023 16:53:41 -0400
Message-ID: <20230607205714.510012-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607205714.510012-1-nfraprado@collabora.com>
References: <20230607205714.510012-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_135741_336348_5675C18F 
X-CRM114-Status: GOOD (  13.81  )
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

Add the CLK_VDEC_ACTIVE clock to the vdec clock driver. This clock is
enabled by the VPU once it starts decoding.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added CLK_IGNORE_UNUSED flag

 drivers/clk/mediatek/clk-mt8183-vdec.c | 5 +++++
 include/dt-bindings/clock/mt8183-clk.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediatek/clk-mt8183-vdec.c
index 513b7956cbea..03c4f1acfdb8 100644
--- a/drivers/clk/mediatek/clk-mt8183-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
@@ -27,6 +27,10 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift,	\
 		&mtk_clk_gate_ops_setclr_inv)
 
+#define GATE_VDEC0(_id, _name, _parent, _shift)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &vdec0_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
+
 #define GATE_VDEC1_I(_id, _name, _parent, _shift)		\
 	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift,	\
 		&mtk_clk_gate_ops_setclr_inv)
@@ -34,6 +38,7 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 static const struct mtk_gate vdec_clks[] = {
 	/* VDEC0 */
 	GATE_VDEC0_I(CLK_VDEC_VDEC, "vdec_vdec", "mm_sel", 0),
+	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "mm_sel", 4),
 	/* VDEC1 */
 	GATE_VDEC1_I(CLK_VDEC_LARB1, "vdec_larb1", "mm_sel", 0),
 };
diff --git a/include/dt-bindings/clock/mt8183-clk.h b/include/dt-bindings/clock/mt8183-clk.h
index a7b470b0ec8a..32dd7d91dbe2 100644
--- a/include/dt-bindings/clock/mt8183-clk.h
+++ b/include/dt-bindings/clock/mt8183-clk.h
@@ -357,7 +357,8 @@
 /* VDEC_GCON */
 #define CLK_VDEC_VDEC			0
 #define CLK_VDEC_LARB1			1
-#define CLK_VDEC_NR_CLK			2
+#define CLK_VDEC_ACTIVE			2
+#define CLK_VDEC_NR_CLK			3
 
 /* VENC_GCON */
 #define CLK_VENC_LARB			0
-- 
2.41.0


