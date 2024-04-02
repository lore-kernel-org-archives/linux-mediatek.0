Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64836CD128A
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogpgatue8cdCa39mSBay+PNSK0jGOBrZyn7T74oiacE=; b=Xq1ebNVgrvA0I/SnKbqeUEFWJG
	WooiNmzWzVBlCkIJOJm3+a0T3Jk8+rqruPe0aSmVE42t6TZRIpQyI5Hj35IJ/lG5R7elCcVWlTlNe
	0XGJuYXzPPtCgDgJsw6+V9/jIRl9R30w8xXuuaNzU0dy0tsTyafBaZpketQf5SJLHGf5Nc8FBLRaF
	Z+Yyy4nZiVuGF4I2neAaIFGRlpdCVydhX//oZHV6yl2NA1194W/zQCZcwc6FupwtDwRPxJZkjuefJ
	U9eVKJQZb8S3+Z6sRhtJDfy/H8Sful6H5qodoljQT0bsfscU7mYrPexGU3xwBjF71oKroufLqXaWA
	R3NDh3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUog-00000009ZXC-1d1Q;
	Tue, 02 Apr 2024 03:28:06 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUoa-00000009ZPk-2QxZ
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:28:02 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 572EA1DBD78;
	Mon,  1 Apr 2024 23:27:47 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=ODM27AWbi/WoPUM8CtduNdu60
	hE5B64Y6ULqzglTfp4=; b=BGylCQtcUPq5HrGQyLEhxDCa9a2tDru1g4KyCfJyE
	04KBLK49z/KKwnJG6LuxZPc6hFUBcVCJgDOriv+chJ6Y/tT+hluq9SNzDHi3DIWl
	xoHrRt3t7rtnwNDOOn5/YLO0DNixq1GwW5NuCRlG91PzxlgEVfQT8tDD8zfIVuQe
	2Y=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 4D5761DBD77;
	Mon,  1 Apr 2024 23:27:47 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=ROuDOPudaTnBIpzyth6id2zKJSaeiMGerblNaABRxDo=; b=xfxowGnNIiKzDpZYe0N6McbP2TG7hfRwnLsnI4eugSjK6vV2nY2TY38/mCTHPNLFq2Xv7slmgdE1wHivUGxpXqb4NgxNVS0piqZe6XF2RKxRoqbCejn9nyjGwX2OmeWcJQ97WZ54bbL6nXXPgrVlHNWWA4O7T6cbA8AkRhjrC4Q=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id BE77B1DBD76;
	Mon,  1 Apr 2024 23:27:46 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id E7B95C1CECF;
	Mon,  1 Apr 2024 23:27:44 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 06/15] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8186
Date: Mon,  1 Apr 2024 23:25:40 -0400
Message-ID: <20240402032729.2736685-7-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: F9980906-F0A0-11EE-8E76-25B3960A682E-78420484!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_202800_783100_D0F11808 
X-CRM114-Status: UNSURE (   9.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Nicolas Pitre <npitre@baylibre.com>

Add LVTS thermal controller definition for MT8186.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 .../bindings/thermal/mediatek,lvts-thermal.yaml        |  2 ++
 include/dt-bindings/thermal/mediatek,lvts-thermal.h    | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-therma=
l.yaml
index e6665af52e..4173bae530 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7988-lvts-ap
+      - mediatek,mt8186-lvts
       - mediatek,mt8192-lvts-ap
       - mediatek,mt8192-lvts-mcu
       - mediatek,mt8195-lvts-ap
@@ -75,6 +76,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8186-lvts
               - mediatek,mt8195-lvts-ap
               - mediatek,mt8195-lvts-mcu
     then:
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/includ=
e/dt-bindings/thermal/mediatek,lvts-thermal.h
index 997e2f5512..433d298826 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -16,6 +16,16 @@
 #define MT7988_ETHWARP_0	6
 #define MT7988_ETHWARP_1	7
=20
+#define MT8186_LITTLE_CPU0	0
+#define MT8186_LITTLE_CPU1	1
+#define MT8186_LITTLE_CPU2	2
+#define MT8186_CAM		3
+#define MT8186_BIG_CPU0	4
+#define MT8186_BIG_CPU1	5
+#define MT8186_NNA		6
+#define MT8186_ADSP		7
+#define MT8186_MFG		8
+
 #define MT8195_MCU_BIG_CPU0     0
 #define MT8195_MCU_BIG_CPU1     1
 #define MT8195_MCU_BIG_CPU2     2
--=20
2.44.0


