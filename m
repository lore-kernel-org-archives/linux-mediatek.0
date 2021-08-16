Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F92C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:01:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFD1361875
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFD1361875
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xdm3gfr0ptv/a8aF3dbbqn1xvEt79TfW6Ue2sGvhY4s=; b=gMr7iC6yg7BopH
	VM0E68oOaxTMCYzaOjaI8z4GcoICXnoF7BKGv9cnSAp30aXfJ88WdCKa+CF+RBJxBAVAFpx716SRA
	8B+FsbhEYUrVR8m4RtCOSByi8AFCZcQ+9z7bu26iW5Qrh9znCmmqtOpPLvomeAZ+HeNmd3962WYRe
	8Pde0GBUAc4hnZGfi5yZjpWbPb7EEqNt2/Qrvm5KYElt/HrhzN/iGDcxQaNVgcZUyT5b1I81bFge/
	RC4LhNvxDm5WzcoepBQxB6RLwLju2laUSqEPKw5gxe4qUSqX39VCXh6uRwQV79HYltba0b8zDRdja
	adyMXmJITOLz+gKsWKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFZQl-00GeWu-M2; Mon, 16 Aug 2021 10:01:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFZPu-00GeCy-4X
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 10:00:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1750693wmb.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UDJl1ra07oVDdz98SG+iWdsSDX/qH4lLdmGYx5g/CN8=;
 b=UQAyx7S0xUtzb5rTtzfeSVsO9o+fgeGp9Nm2qsgnLgbRKWX+fddfLIKN64iYkM2A2z
 MRfyQMKROkCJ8L1xbxXgKL3EO4qI17hTWLw+CYKLPoINaJuhRbiTNmhkhxFqY91AL86v
 t1pPO6mPDprK4yELktLu/ZBvlmCrSt7uvigyNzkoTQ1AzmWbroFa8xAqYOmtn63mwUrz
 BeLHNgGed4T/eRoYG7o/v9tL99Q+Kr2DWH3quLRUwE46LMI484PxnHCwLQi3Fy4U/MjY
 P3l0wI0LIep52C7+iLezChqstJBlHfUr56ubVB4HKdRGa1TjZySBQateYIbI+wAl+7Zl
 d1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UDJl1ra07oVDdz98SG+iWdsSDX/qH4lLdmGYx5g/CN8=;
 b=bjVnsjuNJB4MjkS6ygMp3paqfloPvwGtKA7mHpp5u42nZZ35vb5AA4CuluRb2slxUp
 pZFEw6IIvGXdE9FR8VSuwsC+EehRL5S7exuEcDERDBSM8NooeaItfpYgiEiSxN6ZfYG4
 DqduDuP+hQ+P+4f5vgRiwMol+lz1CNd+1gTFMmlR3cst0wKcE43KsyF0pWVUIqi54RQL
 XBit25NmKjrUnzq0YsCHmk9vDrjXvL5qimgj7Gag3jSAJMm+se7kOdleT7Wdmyi5jUs/
 GNnCTgpOrc2CbX5eX5aNKLh5ZNF+Y+NqfICmnj/FOYhCYZJDudHseMuzr2Wq5zabTYpO
 TmVQ==
X-Gm-Message-State: AOAM533EClD4t7RjZCJPRNArNst7ASU/4Fg0HS0iKNdnYciKNKaGt5Ab
 CNI2UOV2jHL6gAZPyaymm/9k3A==
X-Google-Smtp-Source: ABdhPJwDYN8zt110c62GL+L9QAZr4E6pKpjaOL2oGDz6fohYbxdvZxmPMyAy0YyEKhI9y39j9ZFhaw==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr14711494wmi.2.1629108020370;
 Mon, 16 Aug 2021 03:00:20 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:92b1:d3c2:1204:85e2])
 by smtp.gmail.com with ESMTPSA id u10sm1916645wrt.14.2021.08.16.03.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 03:00:20 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH RESEND v3 4/4] arm64: dts: mt6358: add mt6358-keys node
Date: Mon, 16 Aug 2021 12:00:13 +0200
Message-Id: <20210816100013.100412-5-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816100013.100412-1-mkorpershoek@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_030026_203647_5972FA7B 
X-CRM114-Status: GOOD (  10.62  )
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

This enables the power,home keys on MediaTek boards with a mt6358 pmic.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index fa159b20379e..a1b017a6a751 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020 MediaTek Inc.
  */
+#include <dt-bindings/input/input.h>
 
 &pwrap {
 	pmic: mt6358 {
@@ -356,5 +357,16 @@ mt6358_vsim2_reg: ldo_vsim2 {
 		mt6358rtc: mt6358rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
+
+		mt6358keys: mt6358keys {
+			compatible = "mediatek,mt6358-keys";
+			power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+			home {
+				linux,keycodes = <KEY_HOME>;
+			};
+		};
 	};
 };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
