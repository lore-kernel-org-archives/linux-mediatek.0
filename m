Return-Path: <SRS0=UdZw=6B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B63C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 05:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D4DC206D9
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 05:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LtQafx4O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Miljsmve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D4DC206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTZv+AAmiFpz1daJL4eVsNjQCDN/1STLSayZWFo/vO8=; b=LtQafx4OsyJUuX
	NPn/Y6j6marKNO6kvEPx23RdHt+bTOrU9E9/vwEM8E6Gq7uild69u5oQ3543VmndIrsIUVLnEBbMC
	lw7GFdt4WbxROUtWDcrRgEusVwRI2zCP7DuHh8FmgQgk1Q5m8WOR1rE0ptd4psuMQjFxuL8oXCZWV
	fPtorHVXalSXah9x/BhhCRvUr2zI3S+BWgZXpHr3Eh/wkfvhjRQ7NRNm5vguOL2oxPTER9KJWyNTB
	5JPPKtmM1rrbORJdF/T4w7QDEpQCvcziIoolRzdpuSavSd2wTa+Oir8PKDo0nqgzCsY5H8v8OqOaH
	xmHM7giY8a28De7p+gCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPJTX-0002Vz-Gx; Fri, 17 Apr 2020 05:23:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPJTM-0002Jc-A3; Fri, 17 Apr 2020 05:23:29 +0000
X-UUID: f127d1de36b64854827075a95f7e5d87-20200416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+zpT5B2IshhZ214mCSGdW/SvpDv7hKMz1rnXfEoTBUc=; 
 b=MiljsmvesNAjTzcryn9BOY90EuXWSeTKVZOhLQHv7FCngg8UuCptbyLct3iyvUjQHsqjcgpWRhvQ7ZVVyvIiOt+Merq6p1BTp4CRTecvj1MfPUc1KF5Qbc/GxzTWtJV2dViDX0pLO7hRup40IQzF1hJUtVNaeymY3tKxv0bB9x8=;
X-UUID: f127d1de36b64854827075a95f7e5d87-20200416
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1143253080; Thu, 16 Apr 2020 21:23:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Apr 2020 22:23:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Apr 2020 13:23:11 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Apr 2020 13:23:12 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Min Guo <min.Guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 2/2] phy: phy-mtk-tphy: introduce force_vbus for u2 phy
Date: Fri, 17 Apr 2020 13:23:06 +0800
Message-ID: <1587100986-3104-2-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1587100986-3104-1-git-send-email-macpaul.lin@mediatek.com>
References: <1587100986-3104-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E815C42225B82684929207EFF6F91564BF86715E507A584A4955B6A5F960DCE12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_222328_363387_70E06105 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Macpaul Lin <macpaul.lin@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For some platforms, they don't have vbus pin connection between usb phy and
mac. Hence we need to control force_vbus related registers to keep hardware
works normal.
This patch add corresponding behavior of force vbus in u2 phy related
functions.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index cdbcc49f7115..46f0fea175e5 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -99,6 +99,7 @@
 
 #define U3P_U2PHYDTM1		0x06C
 #define P2C_RG_UART_EN			BIT(16)
+#define P2C_FORCE_VBUSVALID		BIT(13)
 #define P2C_FORCE_IDDIG		BIT(9)
 #define P2C_RG_VBUSVALID		BIT(5)
 #define P2C_RG_SESSEND			BIT(4)
@@ -318,6 +319,7 @@ struct mtk_tphy {
 	int nphys;
 	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
 	int src_coef; /* coefficient for slew rate calibrate */
+	bool force_vbus;
 };
 
 static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
@@ -611,13 +613,20 @@ static void u2_phy_instance_set_mode(struct mtk_tphy *tphy,
 	switch (mode) {
 	case PHY_MODE_USB_DEVICE:
 		tmp |= P2C_FORCE_IDDIG | P2C_RG_IDDIG;
+		if (tphy->force_vbus)
+			tmp |= P2C_RG_VBUSVALID | P2C_FORCE_VBUSVALID;
 		break;
 	case PHY_MODE_USB_HOST:
 		tmp |= P2C_FORCE_IDDIG;
-		tmp &= ~P2C_RG_IDDIG;
+		if (tphy->force_vbus)
+			tmp &= ~(P2C_RG_VBUSVALID | P2C_FORCE_VBUSVALID);
+		else
+			tmp &= ~P2C_RG_IDDIG;
 		break;
 	case PHY_MODE_USB_OTG:
 		tmp &= ~(P2C_FORCE_IDDIG | P2C_RG_IDDIG);
+		if (tphy->force_vbus)
+			tmp &= ~(P2C_RG_VBUSVALID | P2C_FORCE_VBUSVALID);
 		break;
 	default:
 		return;
@@ -1187,6 +1196,11 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 			retval = PTR_ERR(instance->da_ref_clk);
 			goto put_child;
 		}
+
+		/*
+		 * On some platform, vbus is dis-connected between PHY and MAC.
+		 */
+		tphy->force_vbus = device_property_read_bool(dev, "force_vbus");
 	}
 
 	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
