Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D09C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 19:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lQMoGBR7YMUGFQP1uiSFLtd0MupXbssfmgl8Lus5Oo=; b=ZF9YxAiz1CvBHxAtZEZeoKagkr
	Yrr+CnB6Uj/CvnWE/BKX2rwFfUra+Ex9FzW7glXzLgAKtvP02mTrq5Px57zEt4i0f5dgRrsbdX8fc
	CJ57IzAo9blYoHCkaY92e7OZdRg3nIrDyCRZY7tjL+B4gOpIYh80OaGvCL0Cc+aZzxzWzsAtaYMYF
	mWjaZ5Tmm5OtHhuqadlaMLglTGS+AiJNiAyJmsB87Re7zJVxWsQT8gihz39HuJrImKr+i+SFqcA3v
	SYaMgcLI7dosVa8AugOB7UA9qnCqOyr+0Vs7Vk+Gztaus5+qLbRenXquTB2UkffvtRyJvsnuXcrKz
	moi9GcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2Js-006SCF-FW; Tue, 16 Aug 2022 19:33:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2JI-006Rp5-Jn; Tue, 16 Aug 2022 19:33:10 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B3F3660159E;
	Tue, 16 Aug 2022 20:33:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660678386;
	bh=3Atu3UpSZ4NSwkk/RpeysbRl/HDbYyNWeDk1tmMm5o4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fgcc95d6bWLpL2xDmRdqaQW5J4WH8gXjJRycYLzE/iJzXIWBvMcrkyZVwDdARwqan
	 0VknMxD1CyUu8X33QvQRInyTC0WzTqt0V5gzryo//tE4IfvUIjgTQ6IngvvkzzpaR5
	 vvf1fjTzQoRl8cDC9jmRmnMqxwYiBg6CDtFXWS/K2sCtHDn5QLohxSEHlagRn1dhs5
	 5hBU9puHmaWM8qssGcT9OtLku5Hl1roGncbqQcLUkY+APDSQlwV2aR5AYv7NKqjPbi
	 NktevX7MkbWtzoMzVllc2Zg4VofrS/H80VtTYP2JZuIiX1gK0ivCy0QxtMHwrvzsz4
	 7r7/cs9yoCnJg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [RESEND PATCH v3 2/2] clk: mediatek: clk-mt8195-vdo1: Reparent and set rate on vdo1_dpintf's parent
Date: Tue, 16 Aug 2022 15:32:56 -0400
Message-Id: <20220816193257.658487-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816193257.658487-1-nfraprado@collabora.com>
References: <20220816193257.658487-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_123308_849253_ECF595F5 
X-CRM114-Status: GOOD (  10.99  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Like it was done for the vdo0_dp_intf0_dp_intf clock (used for eDP),
add the CLK_SET_RATE_PARENT flag to CLK_VDO1_DPINTF (used for DP)
and also fix its parent clock name as it has to be "top_dp" for two
reasons:
 - This is its real parent!
 - Likewise to eDP/VDO0 counterpart, we need clock source
   selection on CLK_TOP_DP.

Fixes: 269987505ba9 ("clk: mediatek: Add MT8195 vdosys1 clock support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-vdo1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index 3378487d2c90..d54d7726d186 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -43,6 +43,10 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 #define GATE_VDO1_2(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_VDO1_2_FLAGS(_id, _name, _parent, _shift, _flags)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &vdo1_2_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, _flags)
+
 #define GATE_VDO1_3(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -99,7 +103,7 @@ static const struct mtk_gate vdo1_clks[] = {
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPI0, "vdo1_disp_monitor_dpi0", "top_vpp", 1),
 	GATE_VDO1_2(CLK_VDO1_DPI1, "vdo1_dpi1", "top_vpp", 8),
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPI1, "vdo1_disp_monitor_dpi1", "top_vpp", 9),
-	GATE_VDO1_2(CLK_VDO1_DPINTF, "vdo1_dpintf", "top_vpp", 16),
+	GATE_VDO1_2_FLAGS(CLK_VDO1_DPINTF, "vdo1_dpintf", "top_dp", 16, CLK_SET_RATE_PARENT),
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf", "top_vpp", 17),
 	/* VDO1_3 */
 	GATE_VDO1_3(CLK_VDO1_26M_SLOW, "vdo1_26m_slow", "clk26m", 8),
-- 
2.37.1


