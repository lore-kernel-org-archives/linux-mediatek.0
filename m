Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68117E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPoopGLWVLPi2SmZElx0MdVEWVF3HSJwWlBXrl2iFIA=; b=MYvRJXGaYPLMhM
	up2+k2m5Vkgo+e7Fpe1/Gq9atQDWJBkqmwhRX9769y5halVRbJOrFi39Ko0isxwe6NDs0RrvGkgnx
	88fSySCEbtnJ+Iw+JvCgJZGqtfOREis3ekUawzpj9YKPElmQJlShOk3JsjgP85Oe0jZLKyuxr36CO
	V0tonDq4PBjKb8jLhicfcLt376dgQ869XJa0T+GF5t8esyb7bQhddXUQvQ5FyjoAot+OIK++nj2dW
	9TwOvEdY/ccaqHaU3/3sVhTGvZAYoOkjjMuS3LnxnvR11L48sUWMvO+j5+Fh0UeyIg2Rr02knVN6W
	aN/5OQ60WfPeZzuMQq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTw1-0000000Cw8N-2QPk;
	Tue, 17 Dec 2024 09:32:09 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdT-0000000Cr4A-1stm;
	Tue, 17 Dec 2024 09:13:01 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 359DF60272;
	Tue, 17 Dec 2024 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPoopGLWVLPi2SmZElx0MdVEWVF3HSJwWlBXrl2iFIA=;
	b=uq9eJZcKO37SmiDYQTQSccmvAXpTXAXSJ8KVKS9BvNhr/c5Xfjbu7mC2vrxg3XBTEk+WR3
	e6Y+i0eY7E+VIrEBZkzxdo2LHAD8hOEXiApnvMEzHvsQFjvqoTrt32jHV1IOdeWTr8BDVi
	COi4PyRaz1+KWHV4Rp8tqFGcF84sbR0=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 7BED5100532;
	Tue, 17 Dec 2024 09:12:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 08/22] arm64: dts: mediatek: mt7988: Disable usb controllers by default
Date: Tue, 17 Dec 2024 10:12:22 +0100
Message-ID: <20241217091238.16032-9-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9199ffbc-98e2-41f5-b99d-21585855a86d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011259_642453_320ED5AA 
X-CRM114-Status: UNSURE (   8.17  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

The controllers should be enabled at board level if used.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index a7954bf5c81e..f8b01f3fff32 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -334,6 +334,7 @@ usb@11190000 {
 				 <&infracfg CLK_INFRA_133M_USB_HCK>,
 				 <&infracfg CLK_INFRA_USB_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+			status = "disabled";
 		};
 
 		usb@11200000 {
@@ -348,6 +349,7 @@ usb@11200000 {
 				 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
 				 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+			status = "disabled";
 		};
 
 		mmc0: mmc@11230000 {
-- 
2.43.0


