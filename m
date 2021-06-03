Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07724C47096
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 10:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB944613D2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 10:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB944613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZxUrTEAHA+0g9C6bQIm9SjmKwmjUTr0gXeDdRp35P4Q=; b=YAawjXgTKefKnh
	5rHhjRhoivq0qcMomHkawkXzz/1SGp503ApklUA8SDntd9YFWCaO71yx6PaB/4Ahi8xyMnI3ZyUZH
	uTnYBsIAaM5WtTXwNo1VUL1Daz2dZNZkoeRTUlKuClEaoUBNIa+h3CusZtPbe5zXYqQhWrrX6EAVf
	fofswNikN/3/f+xwyv1E+X5JXxnX5da+4vxexalPU3w7vowiinhJ4q/CI0cBW3/45KtzqayZmHlVp
	cC1G9GUjvK2Oyuuiq9ce6YzzStcqOi81RoiwXtQELI8w6XZo4t9qi7cDwuuz6TX1cBynrEa5DnzlF
	atbxvcdYR/McP2wQbFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lol4J-008CJy-4P; Thu, 03 Jun 2021 10:59:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lol4E-008CIl-Rt; Thu, 03 Jun 2021 10:59:17 +0000
X-UUID: 81dee5a5092440df954c3a560e75886a-20210603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GotzffB4w5PD1xyY/fIJvLT/+914MY4GxCEnnBLJuuc=; 
 b=foS5wsnUjnj8nw10G1PCrw3ZxJHGjumNVJd4xylQGUuuQeko4UnTq9aplCsJbigEDPWevFdup5JQT0Zmil+v3LLgNhFCSQB+UaripMxVNGP2W8pb4nQjwgvADsJhqk3Tufd8cNrpC/Gp47yllevgdM6z3+MzOpEZrzfzeXHpppI=;
X-UUID: 81dee5a5092440df954c3a560e75886a-20210603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ben.tseng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1240575989; Thu, 03 Jun 2021 03:59:12 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 03:59:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 18:59:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Jun 2021 18:59:02 +0800
From: Ben Tseng <ben.tseng@mediatek.com>
To: Fan Chen <fan.chen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
CC: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Michael Kao
 <michael.kao@mediatek.com>, Ben Tseng <ben.tseng@mediatek.com>
Subject: [PATCH v2] arm64: dts: mt8183-kukui: Enable thermal Tboard
Date: Thu, 3 Jun 2021 18:59:01 +0800
Message-ID: <20210603105901.21552-1-ben.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_035914_947219_DF105C26 
X-CRM114-Status: GOOD (  13.35  )
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

From: Michael Kao <michael.kao@mediatek.com>

Add Tboard thermal sensor settings.

pull-up voltage: 1800 mv
pull-up resistor: 75K

Vsense = pull-up voltage * Rntc / ( pull-up resistor + Rntc )
AuxIn = Vsense * 4096 / 1500

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change in v2:
        - Rebase to kernel-v5.13-rc1
        - Resend
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcf..65768ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -847,6 +847,20 @@
 	status = "okay";
 };
 
+&thermal_zones {
+	Tboard1 {
+		polling-delay = <1000>; /* milliseconds */
+		polling-delay-passive = <0>; /* milliseconds */
+		thermal-sensors = <&tboard_thermistor1>;
+	};
+
+	Tboard2 {
+		polling-delay = <1000>; /* milliseconds */
+		polling-delay-passive = <0>; /* milliseconds */
+		thermal-sensors = <&tboard_thermistor2>;
+	};
+};
+
 &u3phy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b..4173a5d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -673,7 +673,7 @@
 			nvmem-cell-names = "calibration-data";
 		};
 
-		thermal-zones {
+		thermal_zones: thermal-zones {
 			cpu_thermal: cpu_thermal {
 				polling-delay-passive = <100>;
 				polling-delay = <500>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
