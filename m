Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C83CCFA18
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Nov 2025 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1CyknkAme4elZV84/7MK05eFN3kQAntRvNuaIK/zCqc=; b=vC+tJykFN7Ij66
	WPP8/L8wpUkRJbQlEokbDg+ereOvYH8E4u6aFJAIeqFZg6WW1zj4YflK0WiCKnYomgNkzTOREB6JP
	HdAKj4FzhbweKfA/lnqK3yhJ6NFU+TYW0AY5uxVHNLlD7ljKB6btt47zLUF4VC+K6ATVcqFHhwC9I
	nngrPeAFYTin76g/OwA8iT/63a8VgvK6t/JpYjUDVCHiuwB2Yyy0G2dFM8IgwmgxRKuz2JRqO76aO
	qNv2iJ2+TI9mkV5kj6U6Bv8JJDLnS2G3ypjSWIrRhkgUFPOwLVfv/m9BudPSLoNTU70FOkRdZOSwo
	lX3InRfikHJqCAIxKIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHevB-00000002xIw-0ESX;
	Sat, 08 Nov 2025 09:07:45 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHev7-00000002xI8-3l77;
	Sat, 08 Nov 2025 09:07:43 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 61B22100823;
	Sat,  8 Nov 2025 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762592856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1CyknkAme4elZV84/7MK05eFN3kQAntRvNuaIK/zCqc=;
	b=vYnMheWxSMz8itfJI9sBWPH1o2+/WDByDnUay0zuG7rM5ziF+ocP284TttKHXLGhCUTqYl
	tXeI2VMgOWgAT61e7yLUa9fecAiCa8ufoPzVqdCVW66jgJA8Q45bVlmp8K41rNANbiz9Jr
	LnaiMtpPdTzQl+b4t1pu6ghhuuQJN1Q=
Received: from frank-u24.. (fttx-pool-217.61.148.22.bambit.de [217.61.148.22])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 331521226CD;
	Sat,  8 Nov 2025 09:07:36 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] clk: mediatek: mt7988-infracfg: fix USB port0 function for U2 only
Date: Sat,  8 Nov 2025 10:07:25 +0100
Message-ID: <20251108090726.7787-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_010742_148892_88CD3E30 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

Fix the functionality of USB port0 U2 when U2 is enabled without U3.
This change addresses the issue where port0 U3 is shared with PCIE2,
ensuring that the port0 U2 function operates correctly without U3 support.

Additionally, add support to enable the U2 function instead of disabling
the entire USB port0 in the configuration for the 4 PCIe case. This
change ensures that U2 functionality is properly activated.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index ef8267319d91..da4ad365e30f 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -229,8 +229,9 @@ static const struct mtk_gate infra_clks[] = {
 			  CLK_IS_CRITICAL),
 	GATE_INFRA3_FLAGS(CLK_INFRA_USB_FRMCNT_CK_P1, "infra_usb_frmcnt_ck_p1", "usb_frmcnt_p1_sel",
 			  9, CLK_IS_CRITICAL),
-	GATE_INFRA3(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10),
-	GATE_INFRA3(CLK_INFRA_USB_PIPE_CK_P1, "infra_usb_pipe_ck_p1", "usb_phy_sel", 11),
+	GATE_INFRA3_FLAGS(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10, CLK_IS_CRITICAL),
+	GATE_INFRA3_FLAGS(CLK_INFRA_USB_PIPE_CK_P1, "infra_usb_pipe_ck_p1", "usb_phy_sel", 11,
+			  CLK_IS_CRITICAL),
 	GATE_INFRA3(CLK_INFRA_USB_UTMI, "infra_usb_utmi", "top_xtal", 12),
 	GATE_INFRA3(CLK_INFRA_USB_UTMI_CK_P1, "infra_usb_utmi_ck_p1", "top_xtal", 13),
 	GATE_INFRA3(CLK_INFRA_USB_XHCI, "infra_usb_xhci", "usb_xhci_sel", 14),
-- 
2.43.0


