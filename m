Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA9CECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfS6VfbrB2hhKB3MP/E2QySNmwkMTvwsYKUzykDeyHs=; b=N4BZ41/O2GVymwmcdw/kThZPcs
	DYezmvsxKNaMkSyoukTiz0q2LTZn5irdFBqA7XLqnSIN60pVYMI26YqGJpMDoRGn6XfHB81CHoihO
	BZIb6LCjhfC8EtvXbtGP9rOcRu5UTT5nYIUj/qQV8T4B9v7cXm4nwN1t6YdxY1V3e6mJ10U4JFcUi
	4vVYMjEnBYDQ6GpnvHL5SI3V+i9KHmPnwGM0zC9dca1WRsM/4DbJOa+LlM4lR8WR3FiBkD4skCc0b
	cjIOCChEuhhLFCcwkQKcQVKK2cNLGoWxNtDFZZWlIJ6lv7Yb244vJHrqxrVWQ9l7ooPqMKfcZwl5p
	Mh7iSe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCA3-003CN3-Dc; Mon, 05 Sep 2022 13:29:11 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8yF-00HID1-NR; Mon, 05 Sep 2022 10:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pfS6VfbrB2hhKB3MP/E2QySNmwkMTvwsYKUzykDeyHs=; b=VIhpt7vD5qMlUt2Vd+lT6Y/uI5
	7V5MYMNVnyfZI8YoBqu+kbU2YurIFmpELPGyx1NfeE03hSgh5VKTATg83vFrRFad/rI+QUrKdi3Rb
	sHND750goCbUJGfi6rNVxyflyNHCeNTNRAAGfj+Mr3pa7Z7y5cVEgDNAGr0iMWfVKbgB7UkszZiGs
	RLDJp6UXC2BrLMbKo2hWrMbE5SeLMIUytQLsg3vRH5YnaVlCEo5SmOtsOQuYKYT1F8UQvQeKb6+04
	vvSsCeg8emhBTMYPpuGZRVWiyEPu1oscvXI6pg2NNIA0spuj63/f3HC1OJPULLg8j6Cb0Z0AbaNsL
	G8QVnt/w==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8yC-009NGc-OU; Mon, 05 Sep 2022 10:04:47 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 051916601F31;
	Mon,  5 Sep 2022 11:04:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662372279;
	bh=HrCKKc/4oHF8ameggu4aG6O2V2G7VX/dsz8S56XbbxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KcF6CebA9m1M0yB5Gh3ymTfDLM3L0SKuavBBxR9Fgg6EXH7J74i3Ahmrwghuhbmgq
	 k+qo/KvEIwX/9iOCDBwzUUUrHpkTnylY73luFG9QnQtT+L1lLVfhNFcsGkxopc6FU9
	 zu+Goz/InJSVjQMJiIJUlsTlViWCn1yzJNUoX73L3MHETu/0lNcNuDetWm8t5Rf/u/
	 bzGBPct1YRhwUAuwc1Se0hME85PZ7cp3o5+uYVzpi+69QTOoXs/SADU6aDWreDsjB5
	 JCi7qsq1TQNsMUifFTJMBH7u4xT7P8ZMID5YTue1HIyePHEU4MpqBmAuCXuHqyX96X
	 4kXHo2QeF24EQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 09/10] clk: mediatek: clk-mt8192-mfg: Propagate rate changes to parent
Date: Mon,  5 Sep 2022 12:04:15 +0200
Message-Id: <20220905100416.42421-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905100416.42421-1-angelogioacchino.delregno@collabora.com>
References: <20220905100416.42421-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_110444_824509_C0DF2544 
X-CRM114-Status: UNSURE (   8.36  )
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

Following what was done on MT8183 and MT8195, also propagate the rate
changes to MFG_BG3D's parent on MT8192 to allow for proper GPU DVFS.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8192-mfg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192-mfg.c b/drivers/clk/mediatek/clk-mt8192-mfg.c
index 3bbc7469f0e4..8ea5acdf832c 100644
--- a/drivers/clk/mediatek/clk-mt8192-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8192-mfg.c
@@ -18,8 +18,10 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.sta_ofs = 0x0,
 };
 
-#define GATE_MFG(_id, _name, _parent, _shift)	\
-	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+#define GATE_MFG(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs,	\
+		       _shift, &mtk_clk_gate_ops_setclr,	\
+		       CLK_SET_RATE_PARENT)
 
 static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_pll_sel", 0),
-- 
2.37.2


