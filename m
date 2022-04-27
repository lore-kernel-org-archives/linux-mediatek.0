Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1076C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 03:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IINyaAgKpDGvC95m6frgWlIY5Jos6NNZGp05rzFJ00k=; b=h+RwnZtEsf3arn
	4+bA15BffcbbS+Nd/K0kUKSxmaIvkX+Q96ofvOjnKOdwJtAPO12ez1hBE+9xUD/sYG93cSxVhGFxY
	ZO5d4mfDKdt8j/u/5u4F4GvU4SgY8ttN5FLTnQlnusIdgVMs+NOTBOiUIzsnl15DnrgbO0g6QiM/l
	If1o0vqpL6+tKXuLUg0UDR12INRFZ5YjWlgMmQ1lIkU0w54mLYF21ehPhHdhP2FR03Qj31k6+vAyR
	MdPxOONHPypzSgohjZq4Q/AJa8pKAVe+S/5X+kFa2mR8LLx/muVdDjAfF43dfq7f0DPWu1RulT98B
	iD7hnh+s5xEsWAQveNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njY71-00H93L-9t; Wed, 27 Apr 2022 03:13:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njY6N-00H8f6-1j; Wed, 27 Apr 2022 03:12:28 +0000
X-UUID: 4a3f69c24d89401499f62a4b6c719230-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:5cb37798-91da-43a8-b3f8-859a08e41ea4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:0cf69bc6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4a3f69c24d89401499f62a4b6c719230-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 318395185; Tue, 26 Apr 2022 20:12:24 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 20:12:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Apr 2022 11:12:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 11:12:20 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V4 12/15] dt-bindings: reset: mediatek: Add infra_ao reset bit
 for MT8192/MT8195
Date: Wed, 27 Apr 2022 11:09:47 +0800
Message-ID: <20220427030950.23395-13-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_201227_150730_4C143146 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

- To support reset of infra_ao, add the bit definition of
  thermal/PCIe/SVS for MT8192.
- To support reset of infra_ao, add the bit definition of
  thermal/SVS for MT8195.
- Add the driver comment to separate the reset index for
  TOPRGU and INFRA.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 include/dt-bindings/reset/mt8192-resets.h | 8 ++++++++
 include/dt-bindings/reset/mt8195-resets.h | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
index be9a7ca245b9..ee0ca02a39bf 100644
--- a/include/dt-bindings/reset/mt8192-resets.h
+++ b/include/dt-bindings/reset/mt8192-resets.h
@@ -7,6 +7,7 @@
 #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
 #define _DT_BINDINGS_RESET_CONTROLLER_MT8192
 
+/* TOPRGU resets */
 #define MT8192_TOPRGU_MM_SW_RST					1
 #define MT8192_TOPRGU_MFG_SW_RST				2
 #define MT8192_TOPRGU_VENC_SW_RST				3
@@ -27,4 +28,11 @@
 
 #define MT8192_TOPRGU_SW_RST_NUM				23
 
+/* INFRA resets */
+#define MT8192_INFRA_THERMAL_CTRL_RST			0
+#define MT8192_INFRA_PEXTP_PHY_RST				79
+#define MT8192_INFRA_PTP_RST					101
+#define MT8192_INFRA_RST4_PCIE_TOP				129
+#define MT8192_INFRA_THERMAL_CTRL_MCU_RST		140
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
index a26bccc8b957..a3226f40779c 100644
--- a/include/dt-bindings/reset/mt8195-resets.h
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -7,6 +7,7 @@
 #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
 #define _DT_BINDINGS_RESET_CONTROLLER_MT8195
 
+/* TOPRGU resets */
 #define MT8195_TOPRGU_CONN_MCU_SW_RST          0
 #define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
 #define MT8195_TOPRGU_APU_SW_RST               2
@@ -26,4 +27,9 @@
 
 #define MT8195_TOPRGU_SW_RST_NUM               16
 
+/* INFRA resets */
+#define MT8195_INFRA_THERMAL_AP_RST            0
+#define MT8195_INFRA_PTP_RST                   101
+#define MT8195_INFRA_THERMAL_MCU_RST           138
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
