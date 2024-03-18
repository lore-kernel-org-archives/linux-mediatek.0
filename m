Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2167C54E77
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddt1++tL00CEeGdHHzhkcHzIlRrH6LspSRbcib6583I=; b=x07A9LW/5kllWOUktywPqYL0wW
	ukZRG4nbsHoPQmjMFsxgmEpdUIWHyUYzD5960AfxB1llZfGTIMt6Yz/AljL6lmOWhryU5aVvX0YxM
	dGiclwzRsvoeyAl1X2pD/pF57FdF00H/Lmrh4lSrHQshCd532ORqnim4AaHmnJBLaoI62FnkWma93
	rmIk31qfseMUG7leQteqSrNUrfDKvEcFNVA1AHhsEg/3v3g2/ksqHuLGY3UUox5W+Yk1PxHxgxbNE
	X+er1ip5tzyRkpzGlxkmJD2+GnAGGS07QDVcfF1TBhC11Wmq8bpmYyDIZwInE0oFthxiJF6ZAMiNU
	3xddtkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTj-0000000ACa2-0E6Y;
	Mon, 18 Mar 2024 21:25:07 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTa-0000000ACTv-2oqI
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:25:01 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 4A6D6234E3;
	Mon, 18 Mar 2024 17:24:58 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=BzYO/BRS3nuGVE4aH0ME/K3s0
	oCcWv61BiLYxgyBbSI=; b=bLz6XzrBvWOKnfh1CTfz4wL5cmurkTOKfDfcoGT7g
	pGu4qzwWlxOn6U+cu5rSwQt5WEZlYaAR0Nri9DNZbfdvxPG08y8Niit0WpbukkDg
	NTDGBdgO8gATYkBPK9fi5qqUUpmrQbHTtw26nVVJVa6mN0M2hW2mIMBmVq5NCZiV
	t0=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 42604234E2;
	Mon, 18 Mar 2024 17:24:58 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=yy9ZBV3bBYtehfvMt0pa7NKX6qI0enPfmDme0BevxTE=; b=nUreU5t+9CBRltMImmOCS9WyaAvl3hLNlBB60U334bN1T6UX/7Gjzrw61TH43wv8sfg32bs1F+lfy22WiUrxfSCtLmdolBzTalUN/iJTTxriOFWkAuMyIRFPc6vbwyhDiJ7XJSx/ZMmUbapB+Fa/PU6be6PPGnC3CojLLa+f1Xk=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 5B5DB234DB;
	Mon, 18 Mar 2024 17:24:53 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 3D0E0BE2BA5;
	Mon, 18 Mar 2024 17:24:50 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 05/13] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8186
Date: Mon, 18 Mar 2024 17:22:07 -0400
Message-ID: <20240318212428.3843952-6-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: F5D91C6C-E56D-11EE-9EF6-F515D2CDFF5E-78420484!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142458_946117_883ED641 
X-CRM114-Status: GOOD (  10.42  )
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
index 997e2f5512..3197ca6087 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -16,6 +16,16 @@
 #define MT7988_ETHWARP_0	6
 #define MT7988_ETHWARP_1	7
=20
+#define MT8186_TS1_0		0
+#define MT8186_TS1_1		1
+#define MT8186_TS1_2		2
+#define MT8186_TS1_3		3
+#define MT8186_TS2_0		4
+#define MT8186_TS2_1		5
+#define MT8186_TS3_0		6
+#define MT8186_TS3_1		7
+#define MT8186_TS3_2		8
+
 #define MT8195_MCU_BIG_CPU0     0
 #define MT8195_MCU_BIG_CPU1     1
 #define MT8195_MCU_BIG_CPU2     2
--=20
2.44.0


