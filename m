Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C1C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 17:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3dLvWjwNF+JHORC7V1MKlMyoFAHZMYFTi81kXuMIi4=; b=aMJKcoyjL0/t8p
	ZW3xyfnD44SvMtTWrPw7uTSqSnnzeXP5lx14TpLjVd8BbgjEJl2tCNM6KjNXALGfNyNDJW3Ole5bt
	ew+EiBQ0WZyuIDJ+P3eDMbghGHd2WF6aD4M6x1/rBBX843LgUbOFT7+tu43J+cBYCSkTXLKpTJMxz
	sHLk/7+GMd05KeNFTk81ZKMA0/ljINdou3DQd8rzNRe09ArRiCxHVqqG1l1dA4hEFzHlvk+OmzVsd
	iYDJeWcKq0IFXJb45Wbb7G5QM6MSyh75SmMxwNNjFsMfqxSiK0Rvb6ElliJk8PGBvCzA7ct59tyY1
	AyOiluJhVmlP7p4HdWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi6e-0094EU-No; Fri, 10 Jun 2022 17:07:32 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi5O-0093U8-JB; Fri, 10 Jun 2022 17:06:16 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 015A060407;
	Fri, 10 Jun 2022 17:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1654880773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=muhHy3u6o7qlrEhJK4TIIhDI8FS0kFjcupuOglkyEww=;
	b=Ea8GWlilsZRa7b9SZmJA/cus7/asdVVglnpJSOV5gEioGqrq7ZHA/W15M3iYNfAjiKHvaX
	Qsot5FRIG+5R8x2m/yr1E/9CBG22RHvZyFf1KqCRMDsimU4aHz4B7M8l/KaVCWBuwyJ22B
	3MWLvHbscK4z429CMe8yfYt27RMcPJU=
Received: from frank-G5.. (fttx-pool-217.61.154.155.bambit.de [217.61.154.155])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id BA712100863;
	Fri, 10 Jun 2022 17:06:11 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 5/6] dt-bindings: net: dsa: make reset optional and add rgmii-mode to mt7531
Date: Fri, 10 Jun 2022 19:05:40 +0200
Message-Id: <20220610170541.8643-6-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610170541.8643-1-linux@fw-web.de>
References: <20220610170541.8643-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: 608a6b67-0651-4348-8dfb-93f736e41a27
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_100614_851294_A782BBBE 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

A board may have no independent reset-line, so reset cannot be used
inside switch driver.

E.g. on Bananapi-R2 Pro switch and gmac are connected to same reset-line.

Resets should be acquired only to 1 device/driver. This prevents reset to
be bound to switch-driver if reset is already used for gmac. If reset is
only used by switch driver it resets the switch *and* the gmac after the
mdio bus comes up resulting in mdio bus goes down. It takes some time
until all is up again, switch driver tries to read from mdio, will fail
and defer the probe. On next try the reset does the same again.

Make reset optional for such boards.

Allow port 5 as cpu-port and phy-mode rgmii for mt7531.

- MT7530 supports RGMII on port 5 and RGMII/TRGMII on port 6.
- MT7531 supports on port 5 RGMII and SGMII (dual-sgmii) and
  SGMII on port 6.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v4:
 - add port 5 as CPU-Port
 - change description
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml      | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 112cfaa7e3f6..a3bf432960d8 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -55,6 +55,7 @@ description: |
     On mt7531:
       - "1000base-x"
       - "2500base-x"
+      - "rgmii"
       - "sgmii"
 
 
@@ -124,8 +125,8 @@ patternProperties:
         properties:
           reg:
             description:
-              Port address described must be 6 for CPU port and from 0 to
-              5 for user ports.
+              Port address described must be 5 or 6 for CPU port and from 0
+              to 5 for user ports.
 
         allOf:
           - $ref: dsa-port.yaml#
@@ -152,9 +153,6 @@ allOf:
       required:
         - resets
         - reset-names
-    else:
-      required:
-        - reset-gpios
 
   - dependencies:
       interrupt-controller: [ interrupts ]
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
