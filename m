Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394E9C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:52:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB6FB64D9E
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB6FB64D9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ScMjOh/8uVx8fpXRgTorDIjoZ9bzgaZlsSUvl8Dec0k=; b=WlvCbmgC2kx804nPWS6Vh4hd/
	n8pe99JYd2lEeDo3U4LslBl5kuHAwC3iuN+ajq+jEEmU4M3xXBDlkhsJYj1d0aywVjjrNuXsd9Wq0
	cQBhtI5ogDZYxTcI5GymnBikyPZfm2kO1cV7Xeng7If9OPOyp+mnL6A704E9PRvG6tzM2/Rdzvatm
	5c8XGvQKfhhVv0/AUInqq1wHkNaA2+zyWR2kVvUPI9Z6OIgIgxJ+9PJMfqzA2YrUFvbWNdtlwRmrr
	vOnTcGdRZrpv2/y6unXWoAJNL7qnh1cgyUZO5mdnTKlTEhWeVNKzTPcM0Xd+xGC5EH68/5OGyzsq0
	MfF/NKXlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLndg-00G05q-LX; Mon, 15 Mar 2021 13:52:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLndG-00FzcG-CN; Mon, 15 Mar 2021 13:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=YrXYb47iHZTDDmf2NfqCZJXSIoyel1WxIkIvI2cDYMg=; b=coTaIoYgtQUOgrKTguaBrDpyQw
 Ew7IQCUdVBFI5HignPpdChsNC8pPzshGItF3i1S4f2WHJUh7tUORl2hjz/ymD3N5nCB0F72gLKleQ
 i3qaBo+f56lwgM+pkuVCv7lukbqz9kynEx2j+VUfSW0IHB7lojxuqXNcLcIyMPZyRjZ3uSH6m2yL3
 u1InWVwXOjTtPwF0vh6Z/TsdckYVspgPdUBG6F4+lJ8pKTcPJI4qZ1xB2+tTokN4/cNULwt3MVJJ0
 7mUK9455pRQACnz0shWYFjhfe4EYknEHLWCLhO+dg4h4HRZw9Z68fJ4mx0s1VO8xoQJ0ZjPd9vqod
 2GsISqCw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLnSo-000FSY-SG; Mon, 15 Mar 2021 13:41:05 +0000
X-UUID: e686313440c84c48be000edc0155268c-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YrXYb47iHZTDDmf2NfqCZJXSIoyel1WxIkIvI2cDYMg=; 
 b=cnqhMqKkWmHB4DTzAs2skCwvxUzNdUVNq9iOIimkWNXoLcDlcFka+Xsba0G9C4altaxSnedvQX0Vv0/QDSbLeqX9g6sCCTijmLNHkbEBzgF6o/uzoFy9XLtCBlYPOG6mIIAVwyGq0UJxDqSkVmFH5ies6IJkkIj1JuuPKosihlo=;
X-UUID: e686313440c84c48be000edc0155268c-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 734784118; Mon, 15 Mar 2021 05:40:47 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 06:30:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 21:30:43 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Mar 2021 21:30:43 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12 2/7] arm64: dts: mt8183: add svs device information
Date: Mon, 15 Mar 2021 21:30:13 +0800
Message-ID: <20210315133018.4976-3-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210315133018.4976-1-roger.lu@mediatek.com>
References: <20210315133018.4976-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_134056_204669_45FA8852 
X-CRM114-Status: UNSURE (   8.93  )
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

add compitable/reg/irq/clock/efuse setting in svs node

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 80519a145f13..441d617ece43 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -657,6 +657,18 @@
 			status = "disabled";
 		};
 
+		svs: svs@1100b000 {
+			compatible = "mediatek,mt8183-svs";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>,
+				      <&thermal_calibration>;
+			nvmem-cell-names = "svs-calibration-data",
+					   "t-calibration-data";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -941,9 +953,15 @@
 			reg = <0 0x11f10000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			thermal_calibration: calib@180 {
+				reg = <0x180 0xc>;
+			};
 			mipi_tx_calibration: calib@190 {
 				reg = <0x190 0xc>;
 			};
+			svs_calibration: calib@580 {
+				reg = <0x580 0x64>;
+			};
 		};
 
 		u3phy: usb-phy@11f40000 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
