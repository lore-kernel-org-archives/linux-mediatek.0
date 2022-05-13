Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B99EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eU4aq1HXtvhFiraIH0EuTDCAuWi3/6JIoNytUyokxwg=; b=SXR5geFfb8TGCA
	68HQujCI0oNh8u04FYC6cj9m/3H826DFhADr5oB4c81JZBudjBgQssiTftqlIDOb5aiGxbUVzXYVp
	B5+uiUyiKVAhXY7OgiELbFzGcwy+11wgdHr7WNXmS1cyRGvH3ErmMM96RyBmphXmHoRqXaklTcI90
	S0028Rhuu0slgMoBf96mZmcCpHDOYh15IBIuvP2N2HJRUJk1Gqc5C9DLMOpCf6T9H7GywHQcZKGsl
	X4SGSZ6LcsB5mp2qsMYjdFeQswFAwgcvSd9rtksVYehqkqVGLsaSizAG2jjFkIJNnmAIYULD6SAjx
	SuVn9I5+tzPYfhKCNIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYvl-00H20J-Cs; Fri, 13 May 2022 17:18:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYu7-00H0xN-4I; Fri, 13 May 2022 17:16:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 488201F463D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652462198;
 bh=bX8kZUebSBXb8b4ayhewUrKLvLfjaP3abnUzIjQpOJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JVxyWUmI1D7+Pv0K9rI8B+kMa+Iv79PWC62wZch+NECBujlLvTGnlfYypq14w+eQZ
 JbudmRcwzweCDGRENMHNh1kiduLAWBZ9i514IpI3Oqxr0DRBOA+jz3lnBGSpvZneJi
 hkPm0YhLaWBjr6xSZiuUtf4CYo4zDwfaA/WixD+3eu33EWGcf5dqkZoGbSN+5IXbkY
 oapP2AXY/gk2WaoLKCraHhackKyybLjJmahDX4SCQQ0LT+XyFD7qx1CXkJU8Sya7Jx
 4jpqQX5zeRud7w8cRgk5RMKJNrmjyKl6EBhvGfanIzaV5UXyLxn7D5OgEwWGFwiV/8
 D4gsrJWsY6OtA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/7] arm64: dts: mediatek: mt6795: Add general purpose timer
 node
Date: Fri, 13 May 2022 19:16:16 +0200
Message-Id: <20220513171617.504430-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_101639_346725_D2FF8CEB 
X-CRM114-Status: UNSURE (   8.15  )
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

Add the timer node, enabling two GPTs, of which one will be used as
sched_clock.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index b6f7681cc151..217d99621558 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -198,6 +198,14 @@ watchdog: watchdog@10007000 {
 			timeout-sec = <20>;
 		};
 
+		timer: timer@10008000 {
+			compatible = "mediatek,mt6795-timer",
+				     "mediatek,mt6577-timer";
+			reg = <0 0x10008000 0 0x1000>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&system_clk>, <&clk32k>;
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt6795-sysirq",
 				     "mediatek,mt6577-sysirq";
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
