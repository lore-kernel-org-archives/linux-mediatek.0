Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD34C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NVI7c2SaZWEsOoUi/sCgxXG7/OaQXaoNC+AD+b2T4w=; b=kmfYZMiHLYGtv/HYIs1F2V0a9T
	GU7ht1HIV+bTvlroIirOy1RUEdAIzRio+dVN15JGvjNWegf0se7da2Dn/MbJUIh7k4GYiTiWQZdVi
	jIvzLzrdzh/x5ppSpLkfdB/T3bekFWjHBl6GgyyhupInkIlFzcyVdMLYyg9dEigyoW3YGZEs1/FQL
	9GjKLxuuPg57RgKkoz1m5QREtR5chdQoHBqIGbbl24uJpQ7mPFYptka58qlOU5/cr5mpDRjbyuWgL
	nIddey3+1pQQc6XDSUaw/lU5WDDSSTsM9CLl2FooQs7iGpmCq1hYd4CHbMAJXBlJt2GUMs7ZTLODJ
	3xjXxEdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Cxi-00G6Qh-2c;
	Mon, 05 Jun 2023 16:21:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Cxd-00G6LG-1a;
	Mon, 05 Jun 2023 16:21:38 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E67D26602242;
	Mon,  5 Jun 2023 17:21:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685982096;
	bh=0r6cQNK3uGc3pJiztNyfHAD9LI2rH/+twn3IcKzXoIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V4JpGvCB73IwzBPjm0YatoVY3mRol/XEoRAZ3+D1ASiZxJth7e6ICWfWJeqBWhimK
	 BcLbtD6U02KToCRPB6XzmesJlXIS/Bt+u6XO1cnk9kZk2hWb/eHHFYuKyi5Wv5T55I
	 MSiybdyFVOttuRwEafHjMNlGmffYoW0qo6JWIpPRPJoxAa1XhLwHnQcGQ+3Vi/7Ssn
	 M02O2owhQXpJCltgx4O1yvn8hJ6vzkJjNqVR+5JccMrpLw2v/DHhr3w78kjHFm/pPU
	 2IKG13naY6jadkBvhkwOxpqvKNoUP8NnUZKrkymSyF+rRzOStH1OucJWsyLdIn5bL3
	 Y2Yd5t9Hi0zAw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
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
Subject: [PATCH 5/6] clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec
Date: Mon,  5 Jun 2023 12:20:29 -0400
Message-Id: <20230605162030.274395-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605162030.274395-1-nfraprado@collabora.com>
References: <20230605162030.274395-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_092137_657495_36CFE0EE 
X-CRM114-Status: GOOD (  12.65  )
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

 drivers/clk/mediatek/clk-mt8183-vdec.c | 5 +++++
 include/dt-bindings/clock/mt8183-clk.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediatek/clk-mt8183-vdec.c
index 513b7956cbea..5830934a6d25 100644
--- a/drivers/clk/mediatek/clk-mt8183-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
@@ -27,6 +27,10 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift,	\
 		&mtk_clk_gate_ops_setclr_inv)
 
+#define GATE_VDEC0(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr)
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
2.40.1


