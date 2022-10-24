Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43797C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHJH4OOAtqeTFTAzuGKjMpf4KxcwARZ3zjQByRKNiLs=; b=YHVYJH84C59WRhViyZsXXEWadq
	2xQ7Gz+UgC3vnENOSPyjcmjS9MBl/R0jVpb6A4YoFuPvZIiLExDQy2I9GkE/Z1MPGsclB5umzagxy
	c3F2cxGEx/EnA6ko5vSqm2YGjMDqf90xpVWKDHT6J6kkxgmaDt/ctqfQf802TM0IEeoXplWkNt0Gq
	g3p1qCjk6lYy2369stlA0beDef0guvpP/2NDdv1Ako+gjEbhH7U/FEmyi4/xVf0xUqflqKORbwdp0
	OppDv7s0aOCHjaRFCTiTwaC2Dyai2DsDTvzejIIfKjJBOFkkDzaxXWgQKwr3KKmyDvyRQOUNy6WNk
	QKC9SuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omufm-000ikg-Ek; Mon, 24 Oct 2022 10:27:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omucK-000gsf-8k; Mon, 24 Oct 2022 10:23:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3845F6602828;
	Mon, 24 Oct 2022 11:23:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666607015;
	bh=cFT+o4Ig5ByoGHgC0vTyak35uHSg61Q19NXiTzNpjik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YGnTc+IReCmRA7bWXydR2Hdv6Bnn/uXbOJEQs3d5d1uM7N/BdzOYHrqhl/cBsuxiV
	 j4ilXDkZQB6Ck2HaALWVoVrCrIohYi/D+L83SkLZmn5XROg3mN2oAcexcOkhvgiXLP
	 JsNHFR0ZWvA+BfihXEbIQKuf0vRWdX9mUUnNE8RJV0KNf/EnW7mfrrbzqhkxIy88/U
	 mINd1Y8HbJj3wwdn/QPkIKqwQpNTcc3OCa+1ILgSVGtReh31CdnDEECKpUdGwhfyWH
	 SqDqV4zEtyi2+k+SM8EuPaGogGR2o4Z+9FBdQlcbczkbFOta+ARFPzJPddgVRTl8G/
	 ZGb50/3OipgwA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	msp@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] clk: mediatek: mt8186-mfg: Propagate rate changes to parent
Date: Mon, 24 Oct 2022 12:23:06 +0200
Message-Id: <20221024102307.33722-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_032336_463945_6B25350F 
X-CRM114-Status: UNSURE (   9.20  )
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

Propagate the rate changes to MFG_BG3D's parent on MT8186 to allow
for proper GPU DVFS.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8186-mfg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-mfg.c b/drivers/clk/mediatek/clk-mt8186-mfg.c
index f1f92216f894..0142d741053a 100644
--- a/drivers/clk/mediatek/clk-mt8186-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8186-mfg.c
@@ -16,8 +16,9 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.sta_ofs = 0x0,
 };
 
-#define GATE_MFG(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+#define GATE_MFG(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_SET_RATE_PARENT)
 
 static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "top_mfg", 0),
-- 
2.37.2


