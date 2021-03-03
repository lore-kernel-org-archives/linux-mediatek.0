Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3293FC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 18:42:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE84E64ECF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 18:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE84E64ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IS/NY7swsefsQt206/wM20pjcii+2hfdyI4S75cN3J8=; b=DnbMRBUn8/DZoPVozyfSsAsc/p
	2ugpVTtpND57K/ZVYarX5KwB7d09HcaXzMCvGJQ2/wQggf8Zx3S/KgEez0bkWjj+CC9BWAabdEj9/
	/LUcQg2FCg/CPo992xmkOInJqnNwNOoYhGKc+ZnTT61fSHhPvW5+on5RcTZq/y+u0ZEgb2vjac9Bw
	SpNJuGufoe/Vhkrh1aJ+bfLVnsSihge8qTtbgeNKMGv2RD+QpD1GuKUksGxyRNQ1OTFp7upNhox3B
	CvTogL4odR7uGMxtxVHVcU+j2i4+FtSZD9XC908epLebFPK+3/t+iNl6uWLTy83qZ666D2KRKlXrx
	eAQ+Ql/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWRr-00649u-E4; Wed, 03 Mar 2021 18:42:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT1C-005HGq-QL; Wed, 03 Mar 2021 15:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=aS6Eu0HxJ5IATyvIgZsVEr8K1NWwHLbecPEJtee3MHg=; b=UGFijQtVOTWiVdvlvGvu73BXpH
 QnfLptYkq0/0JzXw/6MKQlWQ+yUQKmNDSiW5dbBFcP6dO0jo/2F4+mr50IVT8UJF5Bgg6ydH+u4M2
 SfDsBrZSOozETaFaWSoy+wRvDJQx75TW863hFDwSQXYZPMXh+Xdkwp5WDF+oWMuId5tS9ZFTzfWMP
 pPbH+tDob0sU8zZtIwjZgIJ8to7rwc+/zvUK4ja7DylHllP+M6bJTAlAr0hF8kmYveZ5QVjh7xTAj
 sJt3pK1LlQSB0Pdy5Pf8RvdAz0guFpD0fqmdwQoM1GhaV84sbUA3smc944cdcnem8JuIfaIxAO5/3
 ttkRmptg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHO09-0022I5-3z; Wed, 03 Mar 2021 09:41:06 +0000
X-UUID: abcfef1e071245c08894abe9eb0c20cf-20210303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aS6Eu0HxJ5IATyvIgZsVEr8K1NWwHLbecPEJtee3MHg=; 
 b=H7qxjL6hxUvWUMObuWIeid9n3EPivyqA7qZ59YpzRTUEZeyvvhFaXbTJBvM5X4SAANFJk8ScXhHzfgIthm4hvWBeLvhi/Al+0TfWIRlPYl0uqO1c1VRSYAjFzW8wrlWFgo3/6H0/7ibHJ70VQkFHB25QRVMkkjCQ7bYP4JujiS0=;
X-UUID: abcfef1e071245c08894abe9eb0c20cf-20210303
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <vic.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1382043565; Wed, 03 Mar 2021 01:40:54 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 01:40:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 17:40:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Mar 2021 17:40:48 +0800
From: Vic Wu <vic.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Ryder Lee <ryder.lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Vic Wu <vic.wu@mediatek.com>
Subject: [PATCH] crypto: mediatek - remove obsolete documentation
Date: Wed, 3 Mar 2021 17:39:50 +0800
Message-ID: <20210303093950.20309-1-vic.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_094106_277525_DC014B27 
X-CRM114-Status: GOOD (  13.45  )
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

The crypto mediatek driver has been replaced by the inside-secure driver now.
Remove DT bindings documentation and update crypto engine nodes to the mt7623.dtsi files.

Signed-off-by: Vic Wu <vic.wu@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 Documentation/devicetree/bindings/crypto/mediatek-crypto.txt       | 25 -------------------
 arch/arm/boot/dts/mt7623.dtsi                 |  8 +++---
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/mediatek-crypto.txt

diff --git a/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt b/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
deleted file mode 100644
index 450da3661cad..000000000000
--- a/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MediaTek cryptographic accelerators
-
-Required properties:
-- compatible: Should be "mediatek,eip97-crypto"
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the five crypto engines interrupts in numeric
-	order. These are global system and four descriptor rings.
-- clocks: the clock used by the core
-- clock-names: Must contain "cryp".
-- power-domains: Must contain a reference to the PM domain.
-
-
-Example:
-	crypto: crypto@1b240000 {
-		compatible = "mediatek,eip97-crypto";
-		reg = <0 0x1b240000 0 0x20000>;
-		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&ethsys CLK_ETHSYS_CRYPTO>;
-		clock-names = "cryp";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
-	};
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index aea6809500d7..25e3f3b04123 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -949,16 +949,14 @@
 	};
 
 	crypto: crypto@1b240000 {
-		compatible = "mediatek,eip97-crypto";
+		compatible = "inside-secure,safexcel-eip97";
 		reg = <0 0x1b240000 0 0x20000>;
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "ring0", "ring1", "ring2", "ring3";
 		clocks = <&ethsys CLK_ETHSYS_CRYPTO>;
-		clock-names = "cryp";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
 		status = "disabled";
 	};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
