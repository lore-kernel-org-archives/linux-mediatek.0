Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52117C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:17:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C1460FC3
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17C1460FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azppdsATDQ8r4b9JbNZdjYiKMxzbeoJM+ZRFrM9Tqhk=; b=KOnZvZhmpdnxsO
	e6vRb2sSs1QQ2aRwfQYHLjeoIETlUf6DF9kMgxhrP3S7p7xG+CV4AIw038WBWtVOU8gSgx0aPHBKa
	AmIs6iLU39w/itIUFl9I3gOyvDI2CxafcZmaBdZf5zPYPZuPCzA8inaDffwNPc1Wgsz62nzymXJSc
	+tCjJ6yY0ASZVGV5ZisS0pDPBL6FlTJ11HPFp+rAnaMR9UG8NcQrx722LCwokWDpipdIOs0tgtapU
	wOKRRgn/ZlsmfJR6Dt9B0n6U3Q669nx3r72UPpXd5Ty+6qXbVe2wqZStG2rrdGLJU0wHpmN6z83uK
	o/n2LWCxsZggoR7Ll1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meF1y-00Ce0u-Bd; Sat, 23 Oct 2021 11:17:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meEzX-00CcRy-0B; Sat, 23 Oct 2021 11:15:12 +0000
X-UUID: 0bdce6a428b1496a84e8632d0d40ad8d-20211023
X-UUID: 0bdce6a428b1496a84e8632d0d40ad8d-20211023
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1145453943; Sat, 23 Oct 2021 04:15:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 04:15:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 23 Oct 2021 19:15:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:15:01 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 12/13] arm64: dts: mt8192: Add apu tinysys
Date: Sat, 23 Oct 2021 19:14:08 +0800
Message-ID: <20211023111409.30463-13-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_041511_106093_D135B9CD 
X-CRM114-Status: UNSURE (   9.70  )
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

Add node for APU tinysys.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index c505c6926839..8108084a3f6f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -925,6 +925,42 @@
 			#iommu-cells = <1>;
 		};
 
+		apusys_rv@19001000 {
+			compatible = "mediatek,mt8192-apusys-rv";
+			reg = <0 0x19000000 0 0x1000>,
+			      <0 0x19001000 0 0x1000>,
+			      <0 0x19002000 0 0x10>;
+			reg-names = "apu_mbox",
+				    "md32_sysctrl",
+				    "apu_wdt";
+			mediatek,apusys-power = <&apusys_power>;
+			power-domains = <&apuspm 0>;
+			iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
+			interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "apu_wdt",
+					  "mbox0_irq";
+			apu_ctrl {
+				compatible = "mediatek,apu-ctrl-rpmsg";
+				mtk,rpmsg-name = "apu-ctrl-rpmsg";
+			};
+
+			apu_pwr_tx {
+				compatible = "mediatek,apupwr-tx-rpmsg";
+				mtk,rpmsg-name = "apupwr-tx-rpmsg";
+			};
+
+			apu_pwr_rx {
+				compatible = "mediatek,apupwr-rx-rpmsg";
+				mtk,rpmsg-name = "apupwr-rx-rpmsg";
+			};
+
+			apu_mdw_rpmsg {
+				compatible = "mediatek,apu-mdw-rpmsg";
+				mtk,rpmsg-name = "apu-mdw-rpmsg";
+			};
+		};
+
 		apu_conn: apu_conn@19020000 {
 			compatible = "mediatek,mt8192-apu-conn", "syscon";
 			reg = <0 0x19020000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
