Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B829BC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P5Pm2TfKIvtWuWuxlKvYpUeeGhkk7xt+ODFpdOckcGM=; b=Kt4fR+zmSAmtXV2RIBZ5JhVx+s
	hWFvQLjDqOrmXoymGDW6idxdanhS9tj7KIBQGGFXcStoZjICPWpsgFqhm3IbYmFIuuv52WSX8TGz4
	g4uWlL/FMFlhABt8etjFpChS6xHmsWsE4ccYGgxjrZSa+TJKjsxsRZQeWT4aOk9+JUC894CCSHuwR
	v94y9tmxlU7fVUMJejA0M6Q/lNwcn0crj4ljinYoVTuwpSlQmkq1Dw9MkzBvMHc02mmKMIdvYmku1
	fDYnGNzZ+COsaLefU4fjkPcklg+81HyzrNrKFNQPSfG2030V4QFhAgMM7GlcmXicTeSiUMBWLuFzW
	xZbjPpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9Pf-002KsW-4D; Thu, 09 Feb 2023 16:04:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9PA-002Kbo-Qx; Thu, 09 Feb 2023 16:04:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33023B82146;
	Thu,  9 Feb 2023 16:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA9DC4339B;
	Thu,  9 Feb 2023 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675958648;
	bh=uGWGuY+pmiRv/F2JmrrPyILmZOGSnM3BIAkj+vJKlL4=;
	h=From:To:Cc:Subject:Date:From;
	b=bVjPyodjAw/enyukcdGaAowwPIKj15AZ84URDOR9Az8NqH6qrJzbqlohMweQxxEUv
	 mxH7rlb7wdcxFVQK2onSAo946XoOEKHZfaV6esemsltxZTdpeUOuEMo77l3tUNcNA4
	 Kz0WBnrYAbs+7wOUiVwHm3GxKof5i394GS5Us+XliZk4buVqzsI+Qsa/iypQIo6MSk
	 4gYI+zgrjsxZs3dv1QuSBuq6JrN1uqyrvZL87FZCji1YGTpbM1YG0BtUgcjCcPPnWg
	 d2SPjeqELRvv/DWt3w1Mu3ZUy1n0gArjQk82ASP1Nfl/egiME8qsh9dc2E9eetFclc
	 9YaCeolm19rmA==
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v1 1/4] arm64: dts: mt8195: Update vdosys compatible
Date: Thu,  9 Feb 2023 17:03:54 +0100
Message-Id: <20230209160357.19307-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_080413_075784_0231724D 
X-CRM114-Status: GOOD (  12.32  )
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

In an effort to fix the vdosys implementation, the compatible has
changes. Fix the device tree to adhere the binding definition.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 00891bfa564e9..8f1264d5290bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2369,7 +2369,7 @@ vencsys_core1: clock-controller@1b000000 {
 		};
 
 		vdosys0: syscon@1c01a000 {
-			compatible = "mediatek,mt8195-mmsys", "syscon";
+			compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", "syscon";
 			reg = <0 0x1c01a000 0 0x1000>;
 			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
 			#clock-cells = <1>;
@@ -2555,7 +2555,7 @@ larb1: larb@1c019000 {
 		};
 
 		vdosys1: syscon@1c100000 {
-			compatible = "mediatek,mt8195-mmsys", "syscon";
+			compatible = "mediatek,mt8195-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-- 
2.39.0


