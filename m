Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E486C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D09206EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AK8ofAFI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aAagKIs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D09206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfxnwVRdpmy9u834+yC7bErZzezQwbmGTpSBw34GWi0=; b=AK8ofAFIGxBORc
	xVF8nzHU0Im/N3efkpSSM9crCtySqSUgMIvvlOxF3pNDRIXeTbptKWLBKzQasUMM/KTjjcF6nqKMW
	OsIpkGWBSzfK/5PZdDdZAOALvj0ABSXAq15S9rJPxoa/wA16G9cMesfIZazCJavxlrykigVQHRfWR
	UOfM0eDqeb/ni+CnCMuhs8fszEatAkMkKCIQO+gGFPPOIp/buFXTFnvYDGqkdg1AlNv0IANjy5Eph
	6rWvYl9fqd+GVl4kHUCE/0nc4TOB8Pvan62gh3FswSgfNldP2oXdeCpgW3UUtXyIRFncZ5Rze2kal
	vwE50cOWartodUtYUHKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgsB-0004iI-0x; Fri, 13 Mar 2020 09:44:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgs8-0004gH-AL; Fri, 13 Mar 2020 09:44:53 +0000
X-UUID: cc3cdff7b523497e8793031559bd4d66-20200313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dHVIssRQ//ChPQ0rQbsqbfW2EvYkungBACJezcgPQ3Y=; 
 b=aAagKIs+v22l9NW7YaL4F0xQ1xdCoKF6ka1VyyjySNEbiNuERrVH0+CIvw9PH1oNWux9MfJA+i8d1eC4b2gzwQdraRQJdYeof/1xRcBt0A5+WcDrbrKK5ShEn+roZqdBzmT5jKjnXPBLSVwlU5lolaN5O6CMOz8yxzhNWd2R4Qk=;
X-UUID: cc3cdff7b523497e8793031559bd4d66-20200313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2461183; Fri, 13 Mar 2020 01:44:44 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 02:34:43 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 17:32:17 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 13 Mar 2020 17:33:41 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V4 08/13] dt-bindings: interconnect: add MT8183 interconnect
 dt-bindings
Date: Fri, 13 Mar 2020 17:34:21 +0800
Message-ID: <1584092066-24425-9-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
References: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_024452_372377_452C274F 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike Turquette <mturquette@linaro.org>, srv_heupstream@mediatek.com,
 James Liao <jamesjj.liao@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add interconnect provider dt-bindings for MT8183.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/dvfsrc.txt        |  9 +++++++++
 include/dt-bindings/interconnect/mtk,mt8183-emi.h      | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/mtk,mt8183-emi.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
index 7f43499..da98ec9 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
@@ -12,6 +12,11 @@ Required Properties:
 - clock-names: Must include the following entries:
 	"dvfsrc": DVFSRC module clock
 - clocks: Must contain an entry for each entry in clock-names.
+- #interconnect-cells : should contain 1
+- interconnect : interconnect providers support dram bandwidth requirements.
+	The provider is able to communicate with the DVFSRC and send the dram
+	bandwidth to it. shall contain only one of the following:
+	"mediatek,mt8183-emi"
 
 Example:
 
@@ -20,4 +25,8 @@ Example:
 		reg = <0 0x10012000 0 0x1000>;
 		clocks = <&infracfg CLK_INFRA_DVFSRC>;
 		clock-names = "dvfsrc";
+		ddr_emi: interconnect {
+			compatible = "mediatek,mt8183-emi";
+			#interconnect-cells = <1>;
+		};
 	};
diff --git a/include/dt-bindings/interconnect/mtk,mt8183-emi.h b/include/dt-bindings/interconnect/mtk,mt8183-emi.h
new file mode 100644
index 0000000..2a54856
--- /dev/null
+++ b/include/dt-bindings/interconnect/mtk,mt8183-emi.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT8183_EMI_H
+#define __DT_BINDINGS_INTERCONNECT_MTK_MT8183_EMI_H
+
+#define MT8183_SLAVE_DDR_EMI			0
+#define MT8183_MASTER_MCUSYS			1
+#define MT8183_MASTER_GPU			2
+#define MT8183_MASTER_MMSYS			3
+#define MT8183_MASTER_MM_VPU			4
+#define MT8183_MASTER_MM_DISP			5
+#define MT8183_MASTER_MM_VDEC			6
+#define MT8183_MASTER_MM_VENC			7
+#define MT8183_MASTER_MM_CAM			8
+#define MT8183_MASTER_MM_IMG			9
+#define MT8183_MASTER_MM_MDP			10
+
+#endif
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
