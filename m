Return-Path: <SRS0=mAey=JI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A15CC433B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 09:37:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7C2610E9
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 09:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB7C2610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ekMiDVTtx4uCf6QZdpXBukpGbzM1bzKE5Zdh1f/6/Xs=; b=bjrJU9tahjVAcgSbxP+aiS4SM
	qKkhVYZu4NF8TugCBWik0m6lCjE43F966vPVEGWlZx82hz+EzxzzD7NJEh+TeNC6MuxpqxS0gf9Cv
	zrGlKG+/5v6jGefwuLhOHX8+LIwEUy+0jbNCY+0OkU09sw/YPbITf+ONlxSM+tDnYGq0QDri0iD4c
	VWqH2V8mJWPvIrMLviGZO4n3zUEVj6dtbKpB6sa4hLZgm3xeKu1d1xCYoeziuzsgsWV4DhKihqg5v
	e70wQ2WgFhDC/ph6DTWwixdkx1fQaZs/SyVvdE04DCuBT3KnIkJWWH8T5baB+1Lp1ifm12G9GkhZN
	aXefL3Hbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVWWs-004FdL-KB; Sun, 11 Apr 2021 09:37:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWWq-004Fas-AB; Sun, 11 Apr 2021 09:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=HwcPEuIylZLGc7V8wQpF+N1MEkUolC1zUaGcU+/RsWE=; b=GcsnlTv4tJX8hIEM3Xgc+XD3l2
 W+boP9Y5N/t0a0RmpDa+T22V99fYOCzJxt0+UXmoZ8dFEUXZU+BsbAiG2ktquJX3E5RCMz2arwwPV
 RhVsK72ormCMhjk7fo3ksbuf6APH018mSuSLku0ohO9B93+vq/pbf13YhSWL/rcZqhG/q+Dph14ZH
 t1eyJR4hFKXCkaZ72GNjojmUcOnTY9ACl7KTR3IbBFUM5T/YZkeIArq+UvfuonV5ectbHuFnyMk/r
 j+3O6hXrj2f6zUS1D6inuoXUoYEZfB7SBENKx+o6Uzsi/NftfipLENBULaGAj4F3YH0SF8c4PQCMP
 eYofJDKA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWWn-005RDZ-K9; Sun, 11 Apr 2021 09:37:14 +0000
X-UUID: cb95d082d9f546dbafa68956a8e03826-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HwcPEuIylZLGc7V8wQpF+N1MEkUolC1zUaGcU+/RsWE=; 
 b=fCtMSHDgVH6cUoRBNs8U3bRm3oVQJ/U8SvqoTKqg9YxOpudqNApv+zkmFDoun2FPb8ddBxBqn0HYn3NFsfpVZdfw0bivhBsN3+nS8f2x2bmUjLpl4iGlAW5hgqRAobKZlC0k5W0mXbGrFjfsr539Z5K9XhDO+ppXIWcySfxxvc4=;
X-UUID: cb95d082d9f546dbafa68956a8e03826-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 464783982; Sun, 11 Apr 2021 02:37:12 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 02:27:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 17:27:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Apr 2021 17:27:09 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 2/5] arm64: dts: mt8195: add pinctrl device node
Date: Sun, 11 Apr 2021 17:26:56 +0800
Message-ID: <20210411092659.22838-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210411092659.22838-1-zhiyong.tao@mediatek.com>
References: <20210411092659.22838-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_023713_702108_DB6CA037 
X-CRM114-Status: UNSURE (   9.14  )
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

This commit adds pinctrl device node for mt8195

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 068fe24efd2d..48b28a9d35cc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -273,6 +273,27 @@
 			};
 		};
 
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt8195-pinctrl";
+			reg = <0 0x10005000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>,
+			      <0 0x11d30000 0 0x1000>,
+			      <0 0x11d40000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11eb0000 0 0x1000>,
+			      <0 0x11f40000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "iocfg0", "iocfg_bm",
+				    "iocfg_bl", "iocfg_br", "iocfg_lm",
+				    "iocfg_rb", "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 144>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH 0>;
+			#interrupt-cells = <2>;
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
