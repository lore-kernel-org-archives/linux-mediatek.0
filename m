Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4293CC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 16:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/COsyFzT/isDE7HpwjinDslJZ350mczlYpGBC1sGSHo=; b=W7j7YRH2fodEWcjQtpV9X0T0GC
	TW6v30IAGt31Hcp5ScrISoDh+/QBiwPWjp67HPo1c2zsJ3+YSMOBPv3ibYx7sqrs3QbsPMQVMp9Yr
	m/ZfK9rlTdtb22Rbr3VmXBJ8cwox4UhYEn/Pn3H3+eglpwhiXAIeNoVBGDSsqSb7vN4XwnjGnS1Uc
	GK9/pwyTydwSh5VkTK8JQMI4gqSS+8EESfZjp0sXyEEniwRTFPyDB8pohlpvM53HcO8md21nOyBbS
	Gw8UoFESjRSL9RIBDIz/ReP1R9N79Uv+fWgP6pBYOsXp+vRl46DnQwwz5X0t+0bTlHATQK3DmFcoz
	uNeGFDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9Pv-002L4i-OP; Thu, 09 Feb 2023 16:04:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9PE-002KeO-9e; Thu, 09 Feb 2023 16:04:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAE8261B0F;
	Thu,  9 Feb 2023 16:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FB8C4331D;
	Thu,  9 Feb 2023 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675958655;
	bh=4NI43FI1odeK5NMjk1q4hgRlikJL79bNrNo0FrjEahU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bXRCX8yzU2MFIyfUNivWfDugTbqb0quXUUeLBypa8Cc0TaryezddYbZWvRLXwjAE4
	 vGdOk0dWOUIARqo5AFQyEkKsnwd0t6Wq7c1vBXeyBTOtr5O4zttxmakN4xXhjiBWCp
	 fOrsJxtdETdLZ/Da71a/IoZIufSp9AakaYiuSo5MC6AqrMcNUPwuOxkKSYNKHcZc0B
	 28L+YQ8cacBZoithMGGcbv7y+5k/ppZpg8Q+X3BIhGlUNTtQ5k37I8qdKsNjAGIWwe
	 j4nxj+l2jIi7WYGxuImIfreNhg3EiD0x0hSAps7Oe6NyhYdZxX4khNo3ZHpYVAt89A
	 /QFYFje8wp6zA==
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v1 4/4] Revert "arm64: dts: mt8173: add mmsel clocks for 4K support"
Date: Thu,  9 Feb 2023 17:03:57 +0100
Message-Id: <20230209160357.19307-4-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209160357.19307-1-matthias.bgg@kernel.org>
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_080416_413309_6C3F588C 
X-CRM114-Status: GOOD (  12.04  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

This reverts commit fc6634ac0e5380aeb1063275a2e9a583d41b2306.

The mmsys is a clock provider but does not have any clocks connected to
it. Therefore assigned-clock properties should be applied to the users of mmsys.

This fixes the DT schema check:
mediatek/mt8173-elm.dtb: syscon@14000000: 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index c47d7d900f283..b753547e250fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -988,8 +988,6 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
-			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
-			assigned-clock-rates = <400000000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
-- 
2.39.0


