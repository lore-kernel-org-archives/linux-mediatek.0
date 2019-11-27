Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35297C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 02:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A3A2068E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 02:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIOZQvt+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nUNBjPIa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A3A2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TatB/kBYu3doCT8ImVy5Zda3JwjJqgShNZ4FoND3hE=; b=bIOZQvt+9g4xvO
	So/DGjb5RUeYs6e3xKuN16w8vS/y9ChHJYO74Nz0Wy3knwLClL7QUrl/S6MEo/rN8nEhEPrPL6Rna
	WR8dOI/R3F/HUk3pA25runn/LkwogdNbkaWCfwScRzVzk4S0zx32oW6Iu9hWcN3mDjx/sSvdAtEfE
	PGU2I+zZv3M6tyx6RsI8CFzFd0Nt7B89GSHNHnmTJgqXSGMBtI5icyYKfmDnsBO99AO6/7cVk5REi
	iAvJ3REXDK/xrwCarzgE1OJ6O29WfVoS3hNgrSLi1VqBS2wKsszYQ+FwLk91yE04dXVKq8xeyYn/2
	T5K7jKwbQtrGCvPftJFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZme7-0007nE-AI; Wed, 27 Nov 2019 02:01:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZmby-0004Xn-Jy; Wed, 27 Nov 2019 01:59:24 +0000
X-UUID: 2e156b9f0197425290428511759d2f38-20191126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=otgyjccjU3Jcg3ZFhBOHDV+FECv2mn5CGbV/nCdhKDk=; 
 b=nUNBjPIaNuFiqznoPP24Q9Z6MwaVdH5Ghukga14Q7bBvcbN88+OyTvszXEn5VCangvk/Sg8/iK6VdcL6zH/DT5xgzyHwdYVdgqVZNcmLYu3lYaW6z91xbTXYdre1kf6TICEOldnR8MiPplbAzJXYS/azCWrpmxwassj/kg+qGQ8=;
X-UUID: 2e156b9f0197425290428511759d2f38-20191126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 4489092; Tue, 26 Nov 2019 17:59:11 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 17:59:18 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 09:58:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 27 Nov 2019 09:58:18 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH v2 05/14] arm64: dts: add gce node for mt6779
Date: Wed, 27 Nov 2019 09:58:48 +0800
Message-ID: <1574819937-6246-7-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_175922_748546_660A504A 
X-CRM114-Status: UNSURE (   9.81  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>, Dennis
 YC Hsieh <dennis-yc.hsieh@mediatek.com>, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add gce device node for mt6779

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index daa25b75788f..10d59385f4a1 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt6779-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/gce/mt6779-gce.h>
 
 / {
 	compatible = "mediatek,mt6779";
@@ -159,6 +160,15 @@
 			#clock-cells = <1>;
 		};
 
+		gce: mailbox@10228000 {
+			compatible = "mediatek,mt6779-gce";
+			reg = <0 0x10228000 0 0x4000>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
+			#mbox-cells = <3>;
+			clocks = <&infracfg_ao CLK_INFRA_GCE>;
+			clock-names = "gce";
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt6779-uart",
 				     "mediatek,mt6577-uart";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
