Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73660C7619B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 08:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4422E20718
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 08:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p/21TART";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ovFWnEov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4422E20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFx15DlA0in0xpe4Ghtq94SUIaUJylqvqxeFuk+qt2Q=; b=p/21TARTYelFh9
	sjsbrdK7cTt3BREIvirWEBV45R3QcaYsIG4nYBQaDIU+jFhh215UOps+r5RNURLIOeywFzSgJY+MD
	zXRwwE/EYXCJM5vA4/UEyymJ2zMkZRA7gpZw2ZhWbdfamg6bhL0UyZ8bpRkCnMCNebqeo6RLUV8Hj
	ROZOdf5AWZD0/pHtQNxyqvJ6RXc3w+UDlPnMv5MlEtHnKIAV5xNE3J08Wn1z1aXXFFxdXgk1tGQdf
	OyfdlTfswXIIo7rAPcU2L1yrN8vpN6p33hbvjGHqVX7+YNfM3kz0F2U7QbunAZpIAdBJOmzUX5JD8
	C28PuVzRZps0arC0jStg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3bdp-00009G-7M; Mon, 17 Feb 2020 08:20:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3bdH-0006xM-AN; Mon, 17 Feb 2020 08:20:00 +0000
X-UUID: af25591f23994d42b03bcef43e657805-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From;
 bh=jQ9jiEAD2Qgw9xt2uBetQRSbbbkk2xVLWRf6Tt0CQOM=; 
 b=ovFWnEovHbQgmArRt5239KHyQ/tn7TP89aiWMIdtCIk6W17QAFYapr48Z0NdANrTuFX4EtEBbKuvXFaZ1vuwDabLvj8EMNnYai2K95H1cUAIvZtfIlnjDWpHKcx/vgJxC7Qqt2nAiwouHs+LQFBzUdiPPWtDr+mJSqHOvBo+fhE=;
X-UUID: af25591f23994d42b03bcef43e657805-20200217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1186865318; Mon, 17 Feb 2020 00:19:52 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 00:20:39 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 16:18:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 16:19:21 +0800
From: Yong Liang <yong.liang@mediatek.com>
To: <yong.liang@mediatek.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] amr64: dts: modify mt8183.dtsi
Date: Mon, 17 Feb 2020 16:19:22 +0800
Message-ID: <20200217081922.22544-2-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200217081922.22544-1-yong.liang@mediatek.com>
References: <Add watchdog device node>
 <20200217081922.22544-1-yong.liang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E9D7FE62B9A55861B3935A74EF087037A76413B02FF19D309EAAD239B8C7F5C52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_001959_364464_45263E3E 
X-CRM114-Status: UNSURE (   6.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

Add watchdog device node
Document base on http://lists.infradead.org/pipermail/linux-mediatek/2020-January/026415.html

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 10b32471bc7b..8b59e0eba2eb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -253,6 +253,13 @@
 			#interrupt-cells = <2>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8183-wdt",
+				     "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		apmixedsys: syscon@1000c000 {
 			compatible = "mediatek,mt8183-apmixedsys", "syscon";
 			reg = <0 0x1000c000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
