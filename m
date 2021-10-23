Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED89CC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 10:14:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B6660F5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 10:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5B6660F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48hoTfRKbXbEDb1EGrhFBG5SY56rKmzeOiVJ8arNpjY=; b=ndzZUeLCiKk5MN
	Jd02XwfbGcUUT/oIPzrdPUncMnbpaaeaFMFeQScAstVXIQlA78Ui2GHqFq0D+640+jf72WqdjFW4w
	EGqdV87mjnittvMw2Hi9OxcWL6ZieOMtoIW5tkEqQoQZsYkwhQ62siH3AhMVfQmU76QTFcW+FQ4b7
	DrQ6+6gqQT+YNO/xdUDxgT9eKe6FT8IUqw2otPPFncrYhHQUBFnKyd/kl2kSLk3QWajVDFclyvFAg
	3m7urCO3gaXAs2wec0/nKVa+DtouJJa/75WsR5WTX21RDvajx7LK+xgY8gi41t2n8vHSBDYpZJfyK
	BoRp9R7h23/Y3afR8a2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meE2B-00CWgw-CJ; Sat, 23 Oct 2021 10:13:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meE26-00CWez-HE; Sat, 23 Oct 2021 10:13:47 +0000
X-UUID: cef81f6466034d689b1cc4def2154191-20211023
X-UUID: cef81f6466034d689b1cc4def2154191-20211023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1156332969; Sat, 23 Oct 2021 03:13:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 03:13:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 18:13:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 18:13:40 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, "Chun-Jie
 Chen" <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v3 1/7] dt-bindings: clock: Add MT8192 APU clock bindings
Date: Sat, 23 Oct 2021 18:13:28 +0800
Message-ID: <20211023101334.27686-2-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023101334.27686-1-flora.fu@mediatek.com>
References: <20211023101334.27686-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_031346_595040_C45C1C17 
X-CRM114-Status: GOOD (  10.21  )
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

Add clock bindings for APU on MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>

---
 include/dt-bindings/clock/mt8192-clk.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/mt8192-clk.h b/include/dt-bindings/clock/mt8192-clk.h
index 5ab68f15a256..d5ac7b6c1d5c 100644
--- a/include/dt-bindings/clock/mt8192-clk.h
+++ b/include/dt-bindings/clock/mt8192-clk.h
@@ -164,7 +164,15 @@
 #define CLK_TOP_APLL12_DIV9		152
 #define CLK_TOP_SSUSB_TOP_REF		153
 #define CLK_TOP_SSUSB_PHY_REF		154
-#define CLK_TOP_NR_CLK			155
+#define CLK_TOP_DSP_SEL			155
+#define CLK_TOP_DSP1_SEL		156
+#define CLK_TOP_DSP1_NPUPLL_SEL		157
+#define CLK_TOP_DSP2_SEL		158
+#define CLK_TOP_DSP2_NPUPLL_SEL		159
+#define CLK_TOP_DSP5_SEL		160
+#define CLK_TOP_DSP5_APUPLL_SEL		161
+#define CLK_TOP_IPU_IF_SEL		162
+#define CLK_TOP_NR_CLK			163
 
 /* INFRACFG */
 
@@ -309,7 +317,9 @@
 #define CLK_APMIXED_APLL1		8
 #define CLK_APMIXED_APLL2		9
 #define CLK_APMIXED_MIPID26M		10
-#define CLK_APMIXED_NR_CLK		11
+#define CLK_APMIXED_APUPLL		11
+#define CLK_APMIXED_NPUPLL		12
+#define CLK_APMIXED_NR_CLK		13
 
 /* SCP_ADSP */
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
