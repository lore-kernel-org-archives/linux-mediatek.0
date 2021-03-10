Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F9CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:38:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8899B64FF2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8899B64FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AGa6qbZ/cy5bBJ3lrSqgDpCGEYTK3Q/gIEijopheukA=; b=UtgRfAfo3Lxg9xFy9/p7/S7Nd
	YauMtaVRCtZr8esnNnw3uKRmwpKGB32Q7wo/qm7Vd0X9JcEkBaUVHTR1KJJa12FaHe4wZdz2NhKQg
	N88dPiLrBtHAAo9j13Yb3gpTjeP3SoC7J0zittpO3BLvTQqPUhlzRUDZR2P6xQUCmCt0qbGkLNNaF
	96oH1GQoIXHzGv/rcmHEwUiNgzfgg1lqPmUF8+/6nNs7/nEZ0D0qYfw7AzhlcNjmVTTJN8GxnoOlS
	lY/uLQC7wyC/1Zzdq6t9441mvDxyVV+aNhx14pHivjiEOQm9c8w+930P4LiTl4UrQ/ibboGZILm+C
	0SPJ52q7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJsTm-0068Re-8E; Wed, 10 Mar 2021 06:37:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJsT1-0068Ib-8n; Wed, 10 Mar 2021 06:37:15 +0000
X-UUID: 0d662093f86c47b396d5566673fd118d-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CDmeULWaNSjwNIYXDwkSqury7fCZ9gkEYdtKBCkGTXk=; 
 b=vAy3FrRDDlbQBcQL/VoDeleW3gUeZzQ+YOIxrjlA9HZqzEhs1mB32T77Tzz+0cQq+UCocGkMYevxmHkSM6aAjE0hqeW/lTQSGY5eLaPNBWk5Jw8G1hMH2NsAJRyy8JtV4DieVGg0BeK2J26c0W8MPk0/2q/tIWd+ep6r+SthKZk=;
X-UUID: 0d662093f86c47b396d5566673fd118d-20210309
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1494291198; Tue, 09 Mar 2021 22:37:04 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 22:37:02 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 14:37:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 14:37:01 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wendell Lin
 <Wendell.Lin@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, Sean Wang
 <Sean.Wang@mediatek.com>, Macpaul Lin <Macpaul.Lin@mediatek.com>, Owen Chen
 <owen.chen@mediatek.com>, Evan Green <evgreen@chromium.org>,
 <Yong.Wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>, Shawn Guo
 <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Ryder Lee
 <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, CC Hwang
 <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>
Subject: [PATCH v10 4/4] arm64: defconfig: add CONFIG_COMMON_CLK_MT6765_XXX
 clocks
Date: Wed, 10 Mar 2021 14:36:58 +0800
Message-ID: <1615358218-6540-5-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
References: <1615291538-9799-1-git-send-email-macpaul.lin@mediatek.com>
 <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_063711_773126_BE49EB2A 
X-CRM114-Status: GOOD (  10.19  )
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

From: Owen Chen <owen.chen@mediatek.com>

Enable MT6765 clock configs, include topckgen, apmixedsys,
infracfg, and subsystem clocks.

Signed-off-by: Owen Chen <owen.chen@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d612f633b771..553137e81b8e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -622,6 +622,12 @@ CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_VCTRL=m
+CONFIG_COMMON_CLK_MT6765_AUDIOSYS=y
+CONFIG_COMMON_CLK_MT6765_CAMSYS=y
+CONFIG_COMMON_CLK_MT6765_MMSYS=y
+CONFIG_COMMON_CLK_MT6765_IMGSYS=y
+CONFIG_COMMON_CLK_MT6765_VCODECSYS=y
+CONFIG_COMMON_CLK_MT6765_MIPI0ASYS=y
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
 CONFIG_RC_DEVICES=y
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
