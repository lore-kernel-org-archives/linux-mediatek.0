Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A8BCAC5A0
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyzb18S/tGDFuXVMVl2vn3CkQzRB6ouZynR87IYZKIo=; b=X7W2cVpIV6dqpwhR4b/shqGWi1
	tCALnDDTqz766ceItVZLNVHCDxRzigegj81KNLli/8iSnDJQ/y2vgQkItD4/eXIn5nradutc/etLp
	2/leIjq8CcqeiYJAT3mOEKcf+M5/ZQxl9trB16LuRvwd2zWz3ddlnpew47prdl160wQN0cITccTCe
	sy6Aq6UJAEMG33/YnKj4MQuXR236eEmrWUX+484nvAeYuyJdD4KeEMOt3La4Mb+SG8GHemkZdh+Jf
	7cxH9cTS6HmEwuMKeOosEojZwMjDAgJs1UwtdSUVW9XTESNffnjMkKBhttIhPOlAPfIAfVQCeQ4Ud
	ynt8NwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwDG-00000005HvQ-0wG1;
	Sat, 20 Sep 2025 11:57:10 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwDA-00000005Hqh-0JQA;
	Sat, 20 Sep 2025 11:57:05 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uzwD8-000000000X1-06us;
	Sat, 20 Sep 2025 11:57:02 +0000
Date: Sat, 20 Sep 2025 12:56:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: dts: mediatek: mt7981b: add 'soc-uuid' cell to
 efuse
Message-ID: <36886630b6f5eac7e9ecd3d9f59db0ed076342d0.1758369130.git.daniel@makrotopia.org>
References: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_045704_112361_6644F713 
X-CRM114-Status: GOOD (  10.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The efuse of the MediaTek MT7981 contains a 16-byte unique identifier.
Add a 'soc-uuid' cell covering those 16 bytes to the nvmem defininition
of the efuse to allow easy access from userspace, eg. to generate a
persistent random MAC address on boards which don't have any
factory-assigned addresses.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 277c11247c13..25c164114213 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -237,6 +237,10 @@ efuse@11f20000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			soc-uuid@140 {
+				reg = <0x140 0x10>;
+			};
+
 			thermal_calibration: thermal-calib@274 {
 				reg = <0x274 0xc>;
 			};
-- 
2.51.0

