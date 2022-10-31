Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C24ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwno6K2Qqv+JXL4Utet5qWElq4dGxhdrJi1ZpXfBTwc=; b=zGmlJRIPwLfq3KbAZoO2KOMwTM
	pJoGYLuDmYOYGOBLHu80vz2PCAbMXS/yJgEguGGn4ha8EkeDXfK6TkZGl0Y4s9WZJVEfcTJYxf2Se
	jk1uZK/MaFQQWK3bmYVNj2JkZagea6xcVcij/6ktA1OYs1GhUbyB54uTNZr3FIPgEiA9E2bbINgUG
	5J4pen/XL2H046OqF1VhNBxletqyQwumDjFeDcp3PIqPS89sI21I+8DIRGTUtxOECcI9Oorv17K4H
	+6UpOKH0LVR97YoTMNZM2P6wUjMUSJ69O5QCkQRMHGbzSX8ubbpdk2J14VaqCa2yb47VF8SrIuUCZ
	w5jA3XQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaO1-00ECh6-VK; Mon, 31 Oct 2022 19:23:53 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaNs-00ECfi-AK; Mon, 31 Oct 2022 19:23:45 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1opaNj-0008Uc-L3; Mon, 31 Oct 2022 20:23:35 +0100
Date: Mon, 31 Oct 2022 19:23:28 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH v2] dt-bindings: pwm: mediatek: Add compatible for MT7986
Message-ID: <e2170b37f28238c59b2f43309822b63a4d0ac9b1.1667243978.git.daniel@makrotopia.org>
References: <6f28ccf3-ea27-9d5e-bd67-14f7729f713f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f28ccf3-ea27-9d5e-bd67-14f7729f713f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_122344_371924_CD0EFFB9 
X-CRM114-Status: GOOD (  11.18  )
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

Add new compatible string for MT7986 PWM and list compatible units for
existing entries. Also make sure the number of pwm1-X clocks is listed
for all supported units.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
index 554c96b6d0c3e0..952a338e06e7c5 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
@@ -2,14 +2,15 @@ MediaTek PWM controller
 
 Required properties:
  - compatible: should be "mediatek,<name>-pwm":
-   - "mediatek,mt2712-pwm": found on mt2712 SoC.
+   - "mediatek,mt2712-pwm", "mediatek,mt6795-pwm": found on mt2712 SoC.
    - "mediatek,mt6795-pwm": found on mt6795 SoC.
-   - "mediatek,mt7622-pwm": found on mt7622 SoC.
-   - "mediatek,mt7623-pwm": found on mt7623 SoC.
+   - "mediatek,mt7622-pwm", "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt7622 SoC.
+   - "mediatek,mt7623-pwm", "mediatek,mt7628-pwm": found on mt7623 SoC.
    - "mediatek,mt7628-pwm": found on mt7628 SoC.
    - "mediatek,mt7629-pwm": found on mt7629 SoC.
-   - "mediatek,mt8183-pwm": found on mt8183 SoC.
-   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
+   - "mediatek,mt7986-pwm": found on mt7986 SoC.
+   - "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8183 SoC.
+   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8195 SoC.
    - "mediatek,mt8365-pwm": found on mt8365 SoC.
    - "mediatek,mt8516-pwm": found on mt8516 SoC.
  - reg: physical base address and length of the controller's registers.
@@ -20,11 +21,14 @@ Required properties:
                 has no clocks
    - "top": the top clock generator
    - "main": clock used by the PWM core
+   - "pwm1"  : the PWM1 clock for mt7629
+   - "pwm1-2": the two per PWM clocks for mt7986
    - "pwm1-3": the three per PWM clocks for mt8365
-   - "pwm1-8": the eight per PWM clocks for mt2712
+   - "pwm1-4": the four per PWM clocks for mt7628 or mt8183
+   - "pwm1-5": the five per PWM clocks for mt7623 or mt8516
    - "pwm1-6": the six per PWM clocks for mt7622
-   - "pwm1-5": the five per PWM clocks for mt7623
-   - "pwm1"  : the PWM1 clock for mt7629
+   - "pwm1-7": the seven per PWM clocks for mt6795
+   - "pwm1-8": the eight per PWM clocks for mt2712
  - pinctrl-names: Must contain a "default" entry.
  - pinctrl-0: One property must exist for each entry in pinctrl-names.
    See pinctrl/pinctrl-bindings.txt for details of the property values.
-- 
2.38.1


