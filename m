Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F64C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24elYmleIP1I/BEGuciJw7iRNLF+n2u/f0zeyrHbGLg=; b=EpPmZ44YNu7eEC
	dlnfnoq7d7smXTHIy7RaTxXmIgc1AnOnqlHSggbyDWdOqoIvWwpwcy7EmQbhC2Zrz2+N2lSDYDae1
	F74CaejW6eaZ/CPC+StNCTaZCkRemlAKSmy5xicVLefMoF7H6RfR8HdiMkmieCaQSdjEZJhYzAKiS
	ViF+ljt4ADEoPzbmhyGMj4vSDTMOT3TZ5zrThXKVkM1ql5zkM+bZcYiaPf/m9KZoUlQqjvZ73wptG
	M++GvEOP756OqzqJ7GDZG273fsmIj3y/5vBxiKxV67f04z4uw/SlhUm94c3mtY2qN0ZgeqNpeaR4v
	hzA2e57rJ7XzXTWAoZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4OT4-009Cvf-AP; Mon, 03 Jan 2022 14:37:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4OSi-009Cry-0k; Mon, 03 Jan 2022 14:37:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 947C31F424E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641220642;
 bh=QIrc2bb8Mrasiom9iIiy7g+f0RYvDaspbjMj2QcgCbQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fDXnfUhNavlAFHDED0sqUIs8UUE3luAUemyeH9Z3+Qt4JASAwIr8giPgfx+fZbeOp
 JyG2wHkUolD88qUv8kbRdFx7evoxtIJFtGYcmhHOr2wqAB1brS0ESiDUVZl6kDg4MB
 Flxk/dbcOX0sLIq2Gz03y44y4Bd35JvvKd+jan7ldXalJMA+/ydxrWmnAfBuPXk0sP
 C4Q0DCunCHhmxFaxulbwB3xxEgDYf8smUwzauFzaNemcluEPjb7PD1Fd5JM1MGulKy
 JxduP95Z4Y8+3FKA8cXoYFewbAsBcHJuuguHRNP8LfhHH1cX+NK3jhlnBEezQAc0Pi
 i++DXtBaXm9Aw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, miles.chen@mediatek.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Subject: [PATCH 2/2] clk: mediatek: clk-gate: Use regmap_{set/clear}_bits
 helpers
Date: Mon,  3 Jan 2022 15:37:12 +0100
Message-Id: <20220103143712.46675-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103143712.46675-1-angelogioacchino.delregno@collabora.com>
References: <20220103143712.46675-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_063724_264489_8A1514FF 
X-CRM114-Status: UNSURE (   8.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Appropriately change calls to regmap_update_bits() with regmap_set_bits()
and regmap_clear_bits() for improved readability.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 957fa1d68f07..5d88b428565b 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -53,17 +53,15 @@ static void mtk_cg_clr_bit(struct clk_hw *hw)
 static void mtk_cg_set_bit_no_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
-	u32 cgbit = BIT(cg->bit);
 
-	regmap_update_bits(cg->regmap, cg->sta_ofs, cgbit, cgbit);
+	regmap_set_bits(cg->regmap, cg->sta_ofs, BIT(cg->bit));
 }
 
 static void mtk_cg_clr_bit_no_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
-	u32 cgbit = BIT(cg->bit);
 
-	regmap_update_bits(cg->regmap, cg->sta_ofs, cgbit, 0);
+	regmap_clear_bits(cg->regmap, cg->sta_ofs, BIT(cg->bit));
 }
 
 static int mtk_cg_enable(struct clk_hw *hw)
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
