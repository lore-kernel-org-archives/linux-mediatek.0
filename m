Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F9DC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:25:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F9F660F22
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F9F660F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZFm3/FnGT5gu2CINV1PqjTuZ9En7pynWkO2ASvKGohY=; b=DnyBj8LyR6ICE8
	BYo7aWvdK/lvbSALEqPIr7s4ksk7HUFspC51qkKj+vg1czaGxVB+n2rH3Ri04U+RpLnSs4haIFTne
	HwnuAnI5Bi1XXfP6zEQrX4C0+Yd6PdazAufT8SL2rKH5Obl+msRFKlBBK5/p8ueHX1fdJ5UJ+IWrZ
	cvyVxwEtl7xFpFo8nPyOvbJcnfK5sWa1lMcdzTNrE/TeWGxO5ZrP2Gl/EBaQtwc8b1NM/QB6Sd4Ey
	SWbB3iiVGwHm4o73hwozfuy+mx98lCwF6gyiv/xYOlTT64RlbIP3Q6Ad23JLla3mGAMQCnIXPwhue
	sCqifJYNxPq59HLV5I9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xnB-00AjY0-Am; Mon, 26 Jul 2021 10:25:01 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xmy-00AjVj-GE
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 10:24:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso6227838pjo.1
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pW0eGkvQ6eOZmaZcz9mU5uP8ebeBjXUC4Tbu5TtON8I=;
 b=Pf/oHHWsyMOfHwINIhvXpjEhEwOeE9PeRie/VkzNGnEHP/KkrFliliN125xUn7Eyxf
 fyL3spoGDZaJT1UU4bqal9TEsW5j/iEToyQqoiBm1SM/cIHbZxiwnG5kKoSivqkP3hbA
 Kkqmey7iSxTWiVftZ89sZoYc3i4DRwUR+Qw9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pW0eGkvQ6eOZmaZcz9mU5uP8ebeBjXUC4Tbu5TtON8I=;
 b=SQQGO53uNuT40ISv0F8RDjJGQBYzFHaTYJrvPT95vzL55Ou487iGlspjYC1b3Ue5Bp
 i7q9SEXjbUE51CKROwMP5d8+PRaJP36zke+iSLPyZaCHt/TaGkRWYZzLKGWqY/cBH7jC
 f1yCx/gkpJTg/YsQRG5EtZ2sgzlzZ6XYs8Xx3jzaeN+hiOlcE8HwDiYTg+BiuJAagZFu
 TnsTMzR1n8GgbtsXmKxSLC3cExX5m3TVThsbRqVXnS2wlgfx95FKtIkiLtqk53rCh/jC
 3WGfgv5wk4HMwItK3SA60jJexYzv0I8otNe8+VtRhWOOABVbcikQqIDtP/f5ejQZRcgE
 uuaw==
X-Gm-Message-State: AOAM533xc2ORpbNxpmEpnPjL6yljdTIO2VDnfOPS/8Ypeq8SdhKiy3bF
 rovKU9dvduLCidbE7maQNg9NeQ==
X-Google-Smtp-Source: ABdhPJxIOaGVeR+yfNUna6akEQLE7MrP5EeQC6pHrJ4jPJeZoRuVEcOBBRAUmwhUFQUABa/w1ZkkOA==
X-Received: by 2002:a17:90a:5141:: with SMTP id
 k1mr24638415pjm.185.1627295087208; 
 Mon, 26 Jul 2021 03:24:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:24d6:d449:2832:1652])
 by smtp.gmail.com with ESMTPSA id z124sm3113262pgb.6.2021.07.26.03.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 03:24:46 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mt8173: elm: Use aliases to mmc nodes
Date: Mon, 26 Jul 2021 18:24:42 +0800
Message-Id: <20210726102442.2119877-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_032448_592289_73AE63A8 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use aliases to mmc nodes so the partition name for eMMC and SD card will
be consistent across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v1->v2: skip unused mmc2.
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a8..d5a2cad39c9c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -10,6 +10,12 @@
 #include "mt8173.dtsi"
 
 / {
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		mmc2 = &mmc3;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
