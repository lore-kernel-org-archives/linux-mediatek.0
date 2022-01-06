Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 06:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGTx/UkqxfjhsJBTP5u1J4iKWoMAkFPEZIexu11+wP0=; b=ZHwop4xUUnhImt
	IvZM0ij6c2FYErNngXV48mGF9Xh0AumHkRuTbm6nyMTV1nguIWJ1XsGjC5l27Ras9jvBx1SgobSh/
	DjGU1RgX7/mZQZM+D5uvi/sXgmAOC3hh66sDzWdbRpmQoZdSxU7dK41MSeVjWNlvRmm78xJ11pFRg
	qMSZTX6QqjQ7ucgyT4UBhSdha3dObssKJKTP9geIFgwu6Nd1M5B7ahVkp5bKDtjqhthjpUbVW7fwf
	2qMJBGqegYAGOzEtu5fZT62gnYpnvqZUD62RkXp1Nu0eCweCsQ/Z26++YoOcIGx2HinALNCZPPYh/
	QWUyOHX1PV16XWvniLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5MkV-00GoXV-7d; Thu, 06 Jan 2022 06:59:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5MkT-00GoWU-9y; Thu, 06 Jan 2022 06:59:46 +0000
X-UUID: 5ba160bc03a94185bc6877f671ab14e4-20220105
X-UUID: 5ba160bc03a94185bc6877f671ab14e4-20220105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 575052357; Wed, 05 Jan 2022 23:59:42 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 22:54:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 Jan 2022 14:54:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Jan 2022 14:54:18 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH 4/4] dt-bindings: regulator: Add MT6358 regulators
Date: Thu, 6 Jan 2022 14:54:07 +0800
Message-ID: <20220106065407.16036-5-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220106065407.16036-1-johnson.wang@mediatek.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_225945_392007_0E56C83F 
X-CRM114-Status: GOOD (  10.59  )
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

Add buck_vcore_sshub and ldo_vsram_others_sshub
regulators to binding document for MT6358 and MT6366.

Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 .../bindings/regulator/mt6358-regulator.txt   | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
index 9a90a92f2d7e..7034cdca54e0 100644
--- a/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
@@ -8,14 +8,14 @@ Documentation/devicetree/bindings/regulator/regulator.txt.
 
 The valid names for regulators are::
 BUCK:
-  buck_vdram1, buck_vcore, buck_vpa, buck_vproc11, buck_vproc12, buck_vgpu,
-  buck_vs2, buck_vmodem, buck_vs1
+  buck_vdram1, buck_vcore, buck_vcore_sshub, buck_vpa, buck_vproc11,
+  buck_vproc12, buck_vgpu, buck_vs2, buck_vmodem, buck_vs1
 LDO:
   ldo_vdram2, ldo_vsim1, ldo_vibr, ldo_vrf12, ldo_vio18, ldo_vusb, ldo_vcamio,
   ldo_vcamd, ldo_vcn18, ldo_vfe28, ldo_vsram_proc11, ldo_vcn28, ldo_vsram_others,
-  ldo_vsram_gpu, ldo_vxo22, ldo_vefuse, ldo_vaux18, ldo_vmch, ldo_vbif28,
-  ldo_vsram_proc12, ldo_vcama1, ldo_vemc, ldo_vio28, ldo_va12, ldo_vrf18,
-  ldo_vcn33_bt, ldo_vcn33_wifi, ldo_vcama2, ldo_vmc, ldo_vldo28, ldo_vaud28,
+  ldo_vsram_others_sshub, ldo_vsram_gpu, ldo_vxo22, ldo_vefuse, ldo_vaux18,
+  ldo_vmch, ldo_vbif28, ldo_vsram_proc12, ldo_vcama1, ldo_vemc, ldo_vio28, ldo_va12,
+  ldo_vrf18, ldo_vcn33_bt, ldo_vcn33_wifi, ldo_vcama2, ldo_vmc, ldo_vldo28, ldo_vaud28,
   ldo_vsim2
 
 Example:
@@ -354,5 +354,17 @@ Example:
 				regulator-max-microvolt = <3100000>;
 				regulator-enable-ramp-delay = <540>;
 			};
+
+			mt6358_vcore_sshub_reg: buck_vcore_sshub {
+				regulator-name = "vcore_sshub";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+			};
+
+			mt6358_vsram_others_sshub_reg: ldo_vsram_others_sshub {
+				regulator-name = "vsram_others_sshub";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1293750>;
+			};
 		};
 	};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
