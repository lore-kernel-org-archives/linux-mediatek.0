Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D364C07E94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 10:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC17B611CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 10:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC17B611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGLj9cPoilU0qlvwNMHD1kwmPEdNOrBl+7UpoVDEL2k=; b=MfMvaZPQV4Rtxf
	JKuSaWUfL6tdhoNqsoqwxcV61Y1Fvk0nP/vda/WPaewdcZ10b0JuXK8m+qtXVJjS/eE1YotGuSsfD
	EzuUh6LdIUE0C8jqrHBReezYmGBmIThdcqcuHpeW5jLXuAXOxmuzusa1H/UcQY5sh8vPlpttWYcBk
	TI+TtAfvZNOq30UhuFzcFMjxMhkdt1MvkLj74v0N36wXSUd9K5d5f78X6GP/6ETbCOrxqNpwQvV8u
	FJgYYEWFeCiKjX/aTYZlq+1ulxr5jaBXfucaVWVXjtMU1UQ7gT8NKcMMDKgBCXIJy+WPUct5FXEli
	FcI6EnjrtgTG+EHEf5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp7Po-00D4A9-Sc; Fri, 04 Jun 2021 10:51:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp75t-00CyD8-Gs; Fri, 04 Jun 2021 10:30:29 +0000
X-UUID: 18378cc22ff1497b821259a300c4a21b-20210604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/u0BIU3bEcgg/15KXiGVFMoL8RBBq+3wyL5ahU5jJps=; 
 b=RbnqAjZVno/Sla+fBFAsozOx6oGP4ZTRZUs51eI/U23mKmg/46g8nhjCwoGce6u+u+4rz8cxTDafDh0FHJRQS+DAdgR/HgGXyqYM0dIEN80p7X/+aqA3sOMTbpOHkSBSzgHjmPFD8kMZbIo6k+fBt0JUSpWMvkN7WkCssWGc+4c=;
X-UUID: 18378cc22ff1497b821259a300c4a21b-20210604
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1544213564; Fri, 04 Jun 2021 03:30:21 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 03:30:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 18:30:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Jun 2021 18:30:13 +0800
From: Dawei Chien <dawei.chien@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>, Henry Chen
 <henryc.chen@mediatek.com>, Dawei Chien <dawei.chien@mediatek.com>
Subject: [PATCH V10 10/12] arm64: dts: mt8192: add dvfsrc related nodes
Date: Fri, 4 Jun 2021 18:29:57 +0800
Message-ID: <20210604102959.13807-11-dawei.chien@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210604102959.13807-1-dawei.chien@mediatek.com>
References: <20210604102959.13807-1-dawei.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_033025_596929_5F944AC0 
X-CRM114-Status: GOOD (  11.21  )
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

From: Henry Chen <henryc.chen@mediatek.com>

Add DDR EMI provider dictating dram interconnect bus performance found on
MT8183-based platforms

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index c70a3bf744fa..ab3dabcc722e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -5,6 +5,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/interconnect/mtk,mt6873-emi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
@@ -286,6 +287,7 @@
 			compatible = "mediatek,mt8192-dvfsrc",
 				     "mediatek,mt6873-dvfsrc";
 			reg = <0 0x10012000 0 0x1000>;
+			#interconnect-cells = <1>;
 		};
 
 		systimer: timer@10017000 {
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
