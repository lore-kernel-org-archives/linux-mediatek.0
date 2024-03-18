Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BEFC54E71
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tp9pS86jt7EByb0LHJZootitRvKHsZVrpw6g/Ig23Xw=; b=KOP69e/80GlUibTUlfQ74kNe2d
	hM4WFCCxQPf45dF3nQedDN6kZrxJCWZgdy8MAPq+kWDkJZECXxeWaLDlZzM1MIGIpvuyl9Fn4aoKv
	xXMmgg5o+8XYMeKXeTH40SOofkahe1UbyZX8OqLF0R8I9WDKreiiNGUk2wUdiysqo4/hlmMuYIdZM
	hDpoZj5j2Tibwg+79TNRYpHm/N/gCOaP4NHLfArX/hTN4EB1L2uCCsMz+qmTi3XADOtsQ5Huj5EM8
	tMCvHj9sE4PDpWu3DvpIHPb8oRlurNV6CmGOOVwpl5RVNAkBN+kR+dt7Irs8EaLV2DRKVmUqy7rFe
	/rcdxXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTf-0000000ACWg-2Axa;
	Mon, 18 Mar 2024 21:25:03 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTY-0000000ACS1-2DQy
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:24:59 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 309001EA51F;
	Mon, 18 Mar 2024 17:24:54 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=riBa2i2K5aVkfxrVFil1GzpH3
	/MJZgEvPoRpDmR6jew=; b=ozpoh6YsU2Wg/+Cwuee0tvNZL277kGIXf8c/Ga2eO
	klSin18eoybgfrvfdtCvnCkBIJDVd940LRxOMBCTssciltydNNl+X0qosjIWWlGf
	Ab9U33zRhDNIZ36D+xY0uwxpVetlHSwS+TbVbKrO7dgNBeLi9ji88K4PTnHu9q/t
	Gk=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 288FC1EA51E;
	Mon, 18 Mar 2024 17:24:54 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=WcTGoIDUaHZ+qNSs8SEiFxxzSk5tmdUFvUu3wByDWpE=; b=a/RBSYa8C5G4UPU4RJuKTdDGyl0hRgqu+O/LlKF8PzbIr82UloRbMPe+2zdqeNzeZ0Tm47NFaXZsWFHGzQxrrm9pL4kmMjyggYFQ7i2avfpZXhW/QX7euaEeBXPPDngPKD5kL9ABwuEYcOvi+AoFGkIR5xOLXx1Az+dnP9ESDrM=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 942491EA51D;
	Mon, 18 Mar 2024 17:24:53 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id CD791BE2BAD;
	Mon, 18 Mar 2024 17:24:50 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 11/13] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8188
Date: Mon, 18 Mar 2024 17:22:13 -0400
Message-ID: <20240318212428.3843952-12-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: F5FC9052-E56D-11EE-BA10-25B3960A682E-78420484!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142456_742397_83842C72 
X-CRM114-Status: GOOD (  10.83  )
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

Add LVTS thermal controller definition for MT8188.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 .../bindings/thermal/mediatek,lvts-thermal.yaml  |  4 ++++
 .../dt-bindings/thermal/mediatek,lvts-thermal.h  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-therma=
l.yaml
index 4173bae530..331cf4e662 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
@@ -20,6 +20,8 @@ properties:
     enum:
       - mediatek,mt7988-lvts-ap
       - mediatek,mt8186-lvts
+      - mediatek,mt8188-lvts-ap
+      - mediatek,mt8188-lvts-mcu
       - mediatek,mt8192-lvts-ap
       - mediatek,mt8192-lvts-mcu
       - mediatek,mt8195-lvts-ap
@@ -61,6 +63,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8188-lvts-ap
+              - mediatek,mt8188-lvts-mcu
               - mediatek,mt8192-lvts-ap
               - mediatek,mt8192-lvts-mcu
     then:
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/includ=
e/dt-bindings/thermal/mediatek,lvts-thermal.h
index 3197ca6087..04fa9d7821 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -26,6 +26,22 @@
 #define MT8186_TS3_1		7
 #define MT8186_TS3_2		8
=20
+#define MT8188_MCU_TS1_0	0
+#define MT8188_MCU_TS1_1	1
+#define MT8188_MCU_TS1_2	2
+#define MT8188_MCU_TS1_3	3
+#define MT8188_MCU_TS2_0	4
+#define MT8188_MCU_TS2_1	5
+
+#define MT8188_AP_TS3_1		0
+#define MT8188_AP_TS4_0		1
+#define MT8188_AP_TS4_1		2
+#define MT8188_AP_TS4_2		3
+#define MT8188_AP_TS5_0		4
+#define MT8188_AP_TS5_1		5
+#define MT8188_AP_TS6_0		6
+#define MT8188_AP_TS6_1		7
+
 #define MT8195_MCU_BIG_CPU0     0
 #define MT8195_MCU_BIG_CPU1     1
 #define MT8195_MCU_BIG_CPU2     2
--=20
2.44.0


