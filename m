Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C0ECA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 11:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2FA3208C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 11:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kbQFAUxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2FA3208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OD8mCYly8uAkGaNjmYDGpijMmEnz5raWFeDqgMp+wg=; b=kbQFAUxW8piM4R
	P54XecdnIKR5Je6bCxhC0q+cBJKNcAJOuaJjoxqiSubCMPMm7Rv60FrtZqxTNH4NWhd+5DYhEdYky
	AMsHUeF88YRD2idELVQAzI83msUyo7VDDCMfpj0Ww9YbbBfMCSWampsxU54XD9LabtSJPcJBtVAGP
	Ff5P37XRO3wrXj67CZINwX7ZtfG83MBfvSfrTtpVm04ICkSkV2S7w858pCCOH5oNHedqD/8qFJ8qK
	xdSXuHrADo9o2Zpv5uVxu+NIu6anuoLDyFkDzjX2upH1KRDpWOTfSG5lfw7t7wbSr2Om8/uHJLn7r
	NnD2oPEbFj2Wk0+RO0fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP3Zk-0007Mj-8f; Mon, 28 Oct 2019 11:52:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP3YI-00060q-O9; Mon, 28 Oct 2019 11:51:16 +0000
X-UUID: 6031477ff9714ca9afe0a1290f12ec91-20191028
X-UUID: 6031477ff9714ca9afe0a1290f12ec91-20191028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1124719717; Mon, 28 Oct 2019 03:51:05 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 28 Oct 2019 04:50:43 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 28 Oct 2019 19:50:43 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 28 Oct 2019 19:50:41 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] arm64: dts: mt8183: add calibration property in mipitx
 and efuse
Date: Mon, 28 Oct 2019 19:50:39 +0800
Message-ID: <20191028115039.96555-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028115039.96555-1-jitao.shi@mediatek.com>
References: <20191028115039.96555-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 874EBAED7C61D14B2E6DF088FC4F8EEF8DE1751A9C5E2DE6439A9E921321BBBB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_045114_793580_7016F993 
X-CRM114-Status: UNSURE (   7.09  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Get mipitx calibration data from efuse.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 2b6e010d6866..7bfb8dafe1ce 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -668,12 +668,17 @@
 			#clock-cells = <0>;
 			#phy-cells = <0>;
 			clock-output-names = "mipi_tx0_pll";
+			nvmem-cells = <&mipi_tx_calibration>;
+			nvmem-cell-names = "calibration-data";
 		};
 
 		efuse: efuse@11f10000 {
 			compatible = "mediatek,mt8183-efuse",
 				     "mediatek,efuse";
 			reg = <0 0x11f10000 0 0x1000>;
+			mipi_tx_calibration: calib@190 {
+				reg = <0x190 0xc>;
+			};
 			thermal_calibration: calib@180 {
 				reg = <0x180 0xc>;
 			};
-- 
2.21.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
