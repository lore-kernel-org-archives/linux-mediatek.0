Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C04C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 08:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DEC3206E6
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 08:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7kDvZAw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sdz60mk5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DEC3206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRgLNjzDDqcJF3M9SunujSgEd0rDHpvusWdYCTM7NPs=; b=V7kDvZAwem/hMz
	Azl4GygdGA0m6NhTRV3y/8Rqg5hUb4MgILlgOgQLMCOexRjVaQXfkdCvjlOBd4ADn6I+1WmtZA9Xu
	kgGiYsSxPNHOW5nQI83SRwW+isFMH7qfos5znv3wnGhtSoUrdxHDNkeTbX0Oh7k1sC4gJCPPhzLrL
	knpaMuAYwn4hwAFzYmdDg087SR1T597O/99z9ALhMVWBZREiWuoQdvk7JsFwm0tT+l7I8I34ZsVi5
	P9I5IbeOSYsNe7xx/lW3/3Vd8VDD3ep5BhbtNblFPUssvMC/fgTb/hdD/tGjSMSVenj6neysGJm5z
	5Sc2oE6vX5oekDf04Ahw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWFFP-0006KV-4c; Wed, 06 May 2020 08:17:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWFE1-0004mS-OC; Wed, 06 May 2020 08:16:19 +0000
X-UUID: 57d50c614c1f4f94b3dd6b8e05ed84aa-20200506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KDFkdQAdnb7CqrRTr4RSMA17WrgSnKUZKlWHGi0/DcU=; 
 b=sdz60mk5QRAA7CFSdiAHrSVs6llJ5szLusvNtgFnWaCWIzaG4u4UUCv/hEn0KabZVtXZ9lB/qZs9sQFjlIlXyZgJg6bccWTTs9y9Ku4EN9nRhlgYkRLXUJD+nrL6FssiwQ18JHvnvLKlm1im8o40XZKCc2eAIf1Ic6V5hxnOpTk=;
X-UUID: 57d50c614c1f4f94b3dd6b8e05ed84aa-20200506
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1628020911; Wed, 06 May 2020 00:16:16 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 01:16:13 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 16:16:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 May 2020 16:16:05 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH v14 10/11] arm64: dts: Add power controller device node of
 MT8183
Date: Wed, 6 May 2020 16:16:02 +0800
Message-ID: <1588752963-19934-11-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1588752963-19934-1-git-send-email-weiyi.lu@mediatek.com>
References: <1588752963-19934-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D53F47E2007496D4AE3D75C85DDA802E406D33904E0A6D5727EC7E8DE3D47C2C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_011617_818987_62E20DB7 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power controller node and smi-common node for MT8183
In scpsys node, it contains clocks and regmapping of
infracfg and smi-common for bus protection.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 62 ++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 97863ad..5dce7d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/mt8183-power.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include "mt8183-pinfunc.h"
 
@@ -301,6 +302,62 @@
 			#interrupt-cells = <2>;
 		};
 
+		scpsys: power-controller@10006000 {
+			compatible = "mediatek,mt8183-scpsys", "syscon";
+			#power-domain-cells = <1>;
+			reg = <0 0x10006000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
+				 <&infracfg CLK_INFRA_AUDIO>,
+				 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
+				 <&topckgen CLK_TOP_MUX_MFG>,
+				 <&topckgen CLK_TOP_MUX_MM>,
+				 <&topckgen CLK_TOP_MUX_CAM>,
+				 <&topckgen CLK_TOP_MUX_IMG>,
+				 <&topckgen CLK_TOP_MUX_IPU_IF>,
+				 <&topckgen CLK_TOP_MUX_DSP>,
+				 <&topckgen CLK_TOP_MUX_DSP1>,
+				 <&topckgen CLK_TOP_MUX_DSP2>,
+				 <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB1>,
+				 <&mmsys CLK_MM_GALS_COMM0>,
+				 <&mmsys CLK_MM_GALS_COMM1>,
+				 <&mmsys CLK_MM_GALS_CCU2MM>,
+				 <&mmsys CLK_MM_GALS_IPU12MM>,
+				 <&mmsys CLK_MM_GALS_IMG2MM>,
+				 <&mmsys CLK_MM_GALS_CAM2MM>,
+				 <&mmsys CLK_MM_GALS_IPU2MM>,
+				 <&imgsys CLK_IMG_LARB5>,
+				 <&imgsys CLK_IMG_LARB2>,
+				 <&camsys CLK_CAM_LARB6>,
+				 <&camsys CLK_CAM_LARB3>,
+				 <&camsys CLK_CAM_SENINF>,
+				 <&camsys CLK_CAM_CAMSV0>,
+				 <&camsys CLK_CAM_CAMSV1>,
+				 <&camsys CLK_CAM_CAMSV2>,
+				 <&camsys CLK_CAM_CCU>,
+				 <&ipu_conn CLK_IPU_CONN_IPU>,
+				 <&ipu_conn CLK_IPU_CONN_AHB>,
+				 <&ipu_conn CLK_IPU_CONN_AXI>,
+				 <&ipu_conn CLK_IPU_CONN_ISP>,
+				 <&ipu_conn CLK_IPU_CONN_CAM_ADL>,
+				 <&ipu_conn CLK_IPU_CONN_IMG_ADL>;
+			clock-names = "audio", "audio1", "audio2",
+				      "mfg", "mm", "cam",
+				      "isp", "vpu", "vpu1",
+				      "vpu2", "vpu3", "mm-0",
+				      "mm-1", "mm-2", "mm-3",
+				      "mm-4", "mm-5", "mm-6",
+				      "mm-7", "mm-8", "mm-9",
+				      "isp-0", "isp-1", "cam-0",
+				      "cam-1", "cam-2", "cam-3",
+				      "cam-4", "cam-5", "cam-6",
+				      "vpu-0", "vpu-1", "vpu-2",
+				      "vpu-3", "vpu-4", "vpu-5";
+			infracfg = <&infracfg>;
+			smi_comm = <&smi_common>;
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8183-wdt",
 				     "mediatek,mt6589-wdt";
@@ -658,6 +715,11 @@
 			#clock-cells = <1>;
 		};
 
+		smi_common: smi@14019000 {
+			compatible = "mediatek,mt8183-smi-common", "syscon";
+			reg = <0 0x14019000 0 0x1000>;
+		};
+
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8183-imgsys", "syscon";
 			reg = <0 0x15020000 0 0x1000>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
