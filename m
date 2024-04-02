Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2DCCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljpjoDfmgOFM+Djwow9YqZxVDxWMWsC81rP6fUeCyD8=; b=rPJE2ajsqSvjYcrQk5el79yRBC
	8HsjkJHAvPc02LWWXUz54wPBtjySnjYVGw6PsIG98VvkTijpsc82Wvi1xFLC4ex9pdurocS+3AnHZ
	GRyAXBDHmZzL1Mss5nmEiVucCOrTAJjcekYkbALr3OdCLr2D/qbPr8YmoU6uCyhQtgROMCXHgXZJ9
	lN8b4aDSQDBpJeDvQlWfi1T8KxL0AGAJwrjUpQNH+/EV2FntvffoNiRH2Vpp3AwDnvs8BhF0lRYjn
	jjxTTcJn5dpNTb9jT1o7tZ+CR+FSzcIXEjU7AyiT6jwlp8hpb0Tsc7sQJ/8b1biVOrrzZlC4s/sao
	2Y9l0JSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUv6-00000009adX-0FWO;
	Tue, 02 Apr 2024 03:34:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUv3-00000009acO-1do1
	for linux-mediatek@bombadil.infradead.org;
	Tue, 02 Apr 2024 03:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ljpjoDfmgOFM+Djwow9YqZxVDxWMWsC81rP6fUeCyD8=; b=XMT3ThutfePAo+SkfH2rxJrT0C
	YXcN5YHmJyKX3vUPPVE7IVSJMKVBFI2I60qJCoXJZaC1oHFH8bEgbHJgY+Z86IikzpeFPjeF+kIM7
	PNm1FVO8E0bLBNgbfAoUqnoKqXScxgT+B12JdPbdbnC7kH/SpHo8F7fd0rtQhvjADm+IdXo0xg7nF
	RkdNSTOqYD4X/D5955F9bH9QY6LA4bxj5CC7YZTu7Rad19A82JhhHOLyEN9IvNVCbGenL3S6gE3BM
	UTBzh2nWGC3pD6ma4qUhutRDad2ROFpkzNKPRHHeo32yQQXXu7ieyxZHE8IQyd9vdlk8FVUcFxWBp
	9vsgZiJA==;
Received: from pb-smtp20.pobox.com ([173.228.157.52])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUux-00000003POw-0P6q
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:34:39 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id A999E250DB;
	Mon,  1 Apr 2024 23:34:30 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=BwJGuKkJlm/KiBlbl/p36YL1Z
	nrVVIlNiNrusr4VlVE=; b=oc00ZDkhRcPR4xoMkB9eWib2ZiERGayPIxzMmIZD0
	2P4+vKV9zaQ2gpXv8fundx7L+2ImlytlXn6VjBDwwWeUQoOc/5w+4OKyW9C0FJGZ
	Ve53Dj1KbuhoD256K1iDJb6rDZMGR95VCchB0LZhaVqofGUWHytkKYf2fv4VsL5I
	YU=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id A20FE250DA;
	Mon,  1 Apr 2024 23:34:30 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=oYdmhye+IyS1lSjTZzFHFlM1bTrQAJxcccMGglzUASg=; b=l7AjR9Oo7ZIrakzGiqHKzWBWHsrUp1I6baYaqZmopAtWUyQhAtkULD3huiOXSG6rtPXN8zPIqHIBWlVMgF9UioNM63NyL+iVcQKh0NA1AnsTwP4gFDuaab+meGVFOnn3FAdL6aDhfz/9ZM0PuD7cav5/XWFjBQU4+VkIxobjy3Y=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id C1757250D4;
	Mon,  1 Apr 2024 23:34:24 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id C3C8BC1CED6;
	Mon,  1 Apr 2024 23:27:45 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 12/15] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8188
Date: Mon,  1 Apr 2024 23:25:46 -0400
Message-ID: <20240402032729.2736685-13-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E6D36846-F0A1-11EE-A7F2-F515D2CDFF5E-78420484!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_043436_775995_FC092253 
X-CRM114-Status: GOOD (  10.11  )
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
index 433d298826..bf95309d25 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -26,6 +26,22 @@
 #define MT8186_ADSP		7
 #define MT8186_MFG		8
=20
+#define MT8188_MCU_LITTLE_CPU0	0
+#define MT8188_MCU_LITTLE_CPU1	1
+#define MT8188_MCU_LITTLE_CPU2	2
+#define MT8188_MCU_LITTLE_CPU3	3
+#define MT8188_MCU_BIG_CPU0	4
+#define MT8188_MCU_BIG_CPU1	5
+
+#define MT8188_AP_APU		0
+#define MT8188_AP_GPU1		1
+#define MT8188_AP_GPU2		2
+#define MT8188_AP_SOC1		3
+#define MT8188_AP_SOC2		4
+#define MT8188_AP_SOC3		5
+#define MT8188_AP_CAM1		6
+#define MT8188_AP_CAM2		7
+
 #define MT8195_MCU_BIG_CPU0     0
 #define MT8195_MCU_BIG_CPU1     1
 #define MT8195_MCU_BIG_CPU2     2
--=20
2.44.0


