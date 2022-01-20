Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A8DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQR9mmxePIhwdMj59Rq/zEfuVzj5J4DxiossEAKhtv4=; b=DThVTRkQEZ2EYF
	LdjLr5vu7cUwM98NekTAG/HlFzpuf+C/+omqHuuX31s7kWeLt1r9YMS5wj9GYo5kqCP2WtPNaZwwO
	cGqHMJjxxhh5OhyPOVV8CZltummICmBo+qAMyMREszpZ8ksOEAY2baOdbdpZJkHTWVpBkQaKU6rPC
	LUDiMcr+vAJ1vYnWt4/eAGMOgrY7GKQqzkrBVrRfZcSSBjdLTHrS1lyIqHnZn09J3GaihcuI917oS
	a7ZgZdnp+/ZSc5DXuuV+oaYOi6bIk47Ts9C8pIrl+B/sWuuk2f/o7r9ToDjnAY8WomGC4Np32caKf
	+FrtDCMc387lMYa2S5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAcee-00CtJ2-4Y; Thu, 20 Jan 2022 18:59:28 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAceG-00CtCf-QS; Thu, 20 Jan 2022 18:59:07 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id C20D36C0049B;
 Thu, 20 Jan 2022 20:58:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1642705139; bh=Mp9kGuVBlC0Ago6NIpMWZJ/WkxFZQYYgpDvOpyIAg5E=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-ESPOL:
 from:date:to:cc;
 b=kOahGYNXe1hp47zHoxdJOaLh99tH16xgsH/a5Hs5F3BB3Ude1riRim5g3vKVkWMzU
 cnk0nd2+BIr0qVCEbCakwZ5WBrAQer7MFMpVYf7CbjAHzmYsU8lC2CfsS8VkVf/1oA
 wP9CfupCGVAtX9PctP24vpwhgH3iIOFRn2jC7Cgo=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id B1E936C006AE;
 Thu, 20 Jan 2022 20:58:59 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
 by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id zrkmbK32Y5_z; Thu, 20 Jan 2022 20:58:59 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 5C4CA6C0049B;
 Thu, 20 Jan 2022 20:58:59 +0200 (EET)
From: Boris Lysov <arzamas-16@mail.ee>
To: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: qii.wang@mediatek.com
Subject: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: remove mt6577 support
Date: Thu, 20 Jan 2022 21:58:52 +0300
Message-Id: <20220120185853.24266-2-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220120185853.24266-1-arzamas-16@mail.ee>
References: <20220120185853.24266-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +dBm1NUOBlzQh1+kSn3cDQIzqylVJY3o+OCk0Rhfgnn7NzCFekARMmO6mXAFPnHC3iM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_105905_214636_636C623E 
X-CRM114-Status: GOOD (  10.67  )
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

Remove mentions of mt6577 from the dt-binding doc because the existing driver
doesn't support this SoC. mt6577 was used in this driver as some sort of a
"generic" configuration and it is now replaced with mt2701.

Update the dt-binding example to replace mt6577 with mt6589, as the example
uses [1] register addresses of the latter SoC.

[1] https://marc.info/?l=devicetree&m=159949247901831&w=2

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 5ea216ae7084..d1d0c5d2b9e9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -4,13 +4,12 @@ The MediaTek's I2C controller is used to interface with I2C devices.
 
 Required properties:
   - compatible: value should be either of the following.
-      "mediatek,mt2701-i2c", "mediatek,mt6577-i2c": for MediaTek MT2701
+      "mediatek,mt2701-i2c": for MediaTek MT2701
       "mediatek,mt2712-i2c": for MediaTek MT2712
-      "mediatek,mt6577-i2c": for MediaTek MT6577
       "mediatek,mt6589-i2c": for MediaTek MT6589
-      "mediatek,mt6797-i2c", "mediatek,mt6577-i2c": for MediaTek MT6797
+      "mediatek,mt6797-i2c", "mediatek,mt2701-i2c": for MediaTek MT6797
       "mediatek,mt7622-i2c": for MediaTek MT7622
-      "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
+      "mediatek,mt7623-i2c", "mediatek,mt2701-i2c": for MediaTek MT7623
       "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
       "mediatek,mt8173-i2c": for MediaTek MT8173
       "mediatek,mt8183-i2c": for MediaTek MT8183
@@ -38,7 +37,7 @@ Optional properties:
 Example:
 
 	i2c0: i2c@1100d000 {
-			compatible = "mediatek,mt6577-i2c";
+			compatible = "mediatek,mt6589-i2c";
 			reg = <0x1100d000 0x70>,
 			      <0x11000300 0x80>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
