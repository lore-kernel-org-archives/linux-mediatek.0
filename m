Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89315C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:18:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7E461241
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7E461241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bRRCObkO1jUKT56vn3Im7u4O059lAF6DIn+lmT0jyg=; b=ZbR7SqQ/zHvf95
	+OU07vUe3NxLbLEp7AgdVDoeDxN4Tjgs9dXZMUhmgoUhf8PYzzvmijCzMZmFORXt/0XZfeB3RXbcz
	0qg+IKPUpdFYPVvk30CrW7RSAPiYQ4gtD5Cu8dMZvGoPz1UpG+NAkBue7G/d3LQhImmwdrcMOGijV
	SeWE7fGCqp0snFHI7mcaePKvPloD4W620IO9iExNiTdF7bzPmTkSsCNV8Q8dfYgG8Fp7ilhcmS8JY
	RHrbFwVGIPhH/0GMkQkwpn+uELW6MVKA0z7xuKpjg9FE3zkPhuBOO+sIyRuluZLO8+5IlVXq7hfIc
	WpkzO7uHX9qBUzHT+viA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGRz-0035SZ-Qh; Tue, 15 Jun 2021 21:18:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvi-001lI9-VM; Tue, 15 Jun 2021 17:32:53 +0000
X-UUID: bf9934651d274a98816aa9bfaabc893b-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yryBMB1nUbKvmcXFhVrb4CjQQDDyrWLYk5B8hzPnTJI=; 
 b=Vhk7uETUM77KIx1/sOknGQho/IfZW8AzrO9ch1Lh/Z/BuMvA5r5bGqfD1Tw0MyY5LI35UL4AuJ7/cjXhe2B5YyzE3mudmeL84ADqU8F+DpWHzZtZVnhYMp0tHxHOaWyoP+kCGxOXRfZCG6Z+IWSH+pq1o6L7iEPfO+Qhw5mVE3E=;
X-UUID: bf9934651d274a98816aa9bfaabc893b-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 307277768; Tue, 15 Jun 2021 10:32:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:42 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Crystal Guo
 <crystal.guo@mediatek.com>
Subject: [PATCH 01/27] arm64: dts: mt8195: add infracfg_rst node
Date: Wed, 16 Jun 2021 01:32:08 +0800
Message-ID: <20210615173233.26682-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103251_106719_22EDA2E5 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Crystal Guo <crystal.guo@mediatek.com>

add infracfg_rst node which is for MT8195 platform

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 629cd883facf..8cda62f736b3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/ti-syscon.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -273,6 +274,20 @@
 			};
 		};
 
+		infracfg: syscon@10001000 {
+			compatible = "mediatek,mt8195-infracfg", "syscon", "simple-mfd";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+
+			infracfg_rst: reset-controller {
+				compatible = "ti,syscon-reset";
+				#reset-cells = <1>;
+				ti,reset-bits = <
+					0x140 26 0x144 26 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE)
+				>;
+			};
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8195-wdt", "mediatek,mt6589-wdt";
 			reg = <0 0x10007000 0 0x100>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
