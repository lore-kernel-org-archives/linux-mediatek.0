Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8839FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 02:50:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 588DC20658
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 02:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H518tCWn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T+a3pvn5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 588DC20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RMjaQ4Q/e85a8A9/VX1NqFxU+BrUxuAw3U2qgEGsCtA=; b=H518tCWnLjy9INyJ4QFIMXn+M
	I1R8lfi1XwQ7SCNAPfu46EksWTFTltM4T/ODtLUak7PVjIPcIyJX+DYFpeXYSs3pDi0QlBrQ25ked
	EmeyeBmhPCOHytHct9c/D5gmFUIDLDKhbui4tSHcsrSyPWkNCwncocm5HsUOEkBC2TqWyb/0WYXDr
	rqH5BN9Q0Fj6VKee0RSIVoErB4L4DQjVCBOEX9IIT1WwctpVU6tNEuIgxXNZjuDTmKHHGvohhmyIO
	TQ4fZPaeufjjRfctUIB785p/2KnhNCn43r7IGboHkLLFs2IyVDHK0X9UgAfgGuNO8OQUvLSvQ6yYJ
	DJgdjm+ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7VEK-0004Pd-Ld; Mon, 17 Aug 2020 02:50:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7VEC-0004N0-AL; Mon, 17 Aug 2020 02:50:29 +0000
X-UUID: cf779449f0754e449b42057067a867c6-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MgYUQXlp69yp7mKaPcEZgq7fYcJApihBC9PfPYl1V5Y=; 
 b=T+a3pvn5Riwc1Td3C+29fVB27q6BnhS4e9ipbaKgZzGyi7o3qG1leAsvOd3ysWujeGihYELuCIkkVkn4D9o9ljC702X6Lpi7uYc9Yd2YW2F6DuCP+gRJOCodb26QxXTFY8F8xhmFT6rPmI39ujvtxkHXIjHgW0DaJBlZD/Os4tY=;
X-UUID: cf779449f0754e449b42057067a867c6-20200816
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 357189380; Sun, 16 Aug 2020 18:50:24 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 19:50:22 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 10:50:14 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 10:50:13 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v4,4/4] arm64: dts: mt8192: add infracfg_rst node
Date: Mon, 17 Aug 2020 10:48:42 +0800
Message-ID: <20200817024842.5289-5-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200817024842.5289-1-crystal.guo@mediatek.com>
References: <20200817024842.5289-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5FFF82912C4D34533A815E971113554A0C15B8FFE38DEDC7CA39E726646117A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_225028_541715_47EC6AE8 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 stanley.chu@mediatek.com, srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, afd@ti.com, fan.chen@mediatek.com,
 Crystal Guo <crystal.guo@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, s-anna@ti.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add infracfg_rst node which is for MT8192 platform

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 931e1ca17220..a0cb9904706b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
 #include <dt-bindings/power/mt8192-power.h>
+#include <dt-bindings/reset/ti-syscon.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -219,9 +220,17 @@
 		};
 
 		infracfg: infracfg@10001000 {
-			compatible = "mediatek,mt8192-infracfg", "syscon";
+			compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+
+			infracfg_rst: reset-controller {
+				compatible = "mediatek,infra-reset", "ti,syscon-reset";
+				#reset-cells = <1>;
+				ti,reset-bits = <
+					0x140 15 0x144 15 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: pcie */
+				>;
+			};
 		};
 
 		pericfg: pericfg@10003000 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
