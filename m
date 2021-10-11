Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8888C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 16:03:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82EE160551
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 16:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82EE160551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PIBorfjw/h8riz6dPdLEjL8SNF3rVP0d7UY0uWHbO7Y=; b=wl7+y7qi6tqdiM
	9EEpC9IIaCpsTNlZuxKq3oZ4J29VGArb1rUabhgBWkB8I88GXaXjhYP+vuha44wY9LgpRer3fASWV
	XmTqEeRJJQZJkjqeEOoliqlOLX+roSjzn68phu6JXnOlvzpQB7iA+Nlm0mKeK9YaaYbk9B+PEb9Fu
	Ubc/A8kJBD86+1Ihe2TGDLgm4Ck8GfY7LXqLmXdCtvTF+dFAsz9fwWBUTCNAEe9bO3zcbVle2hsAT
	j3CEAhKiDE+edhzerv/elJoOAsG2wydzmPjjPbFLSmAI2Jw0c1RHidf9k05i67HKENiBN7jQ2IdGz
	0AlPHw3va4LUbLRpwAAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZxlV-00A0vp-Gm; Mon, 11 Oct 2021 16:03:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZxlI-00A0s5-0N; Mon, 11 Oct 2021 16:02:49 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:b116:1535:401e:a6ca])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ACBE71F42A6B;
 Mon, 11 Oct 2021 17:02:45 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, enric.balletbo@collabora.com,
 houlong.wei@mediatek.com, hsinyi@chromium.org, hverkuil@xs4all.nl,
 irui.wang@mediatek.com, maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
 tiffany.lin@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS)
Subject: [PATCH] arm64: dts: mediatek: mt8173: remove double 'assigned-clocks'
 binding
Date: Mon, 11 Oct 2021 18:02:36 +0200
Message-Id: <20211011160236.6815-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_090248_200332_0341553B 
X-CRM114-Status: UNSURE (   9.57  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The clock '<&topckgen CLK_TOP_VENC_LT_SEL>' is declared twice
in an 'assigned-clocks' list - in vcodec_dec and in
vcodec_enc_vp8. Fix it to be declared only in vcodec_enc_vp8

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index d9e005ae5bb0..51781444cedd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1422,15 +1422,13 @@
 				      "vencpll",
 				      "venc_lt_sel",
 				      "vdec_bus_clk_src";
-			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
-					  <&topckgen CLK_TOP_CCI400_SEL>,
+			assigned-clocks = <&topckgen CLK_TOP_CCI400_SEL>,
 					  <&topckgen CLK_TOP_VDEC_SEL>,
 					  <&apmixedsys CLK_APMIXED_VCODECPLL>,
 					  <&apmixedsys CLK_APMIXED_VENCPLL>;
-			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
-						 <&topckgen CLK_TOP_UNIVPLL_D2>,
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D2>,
 						 <&topckgen CLK_TOP_VCODECPLL>;
-			assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
+			assigned-clock-rates = <0>, <0>, <1482000000>, <800000000>;
 		};
 
 		larb1: larb@16010000 {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
