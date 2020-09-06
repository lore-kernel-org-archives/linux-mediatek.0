Return-Path: <SRS0=UOtS=CP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE1EC43461
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 18:10:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635682078E
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 18:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jz/GGPIW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nzzQyiNa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 635682078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+sq0MQmjP5lJSMMTW6JXvLR9eJ3tjrrBZWaRNU/a8WY=; b=Jz/GGPIWvjYOLHpqzm/OBmbOSi
	xpVRz/FlS9gRgsk3DQqXeW+Hzl5BVyDN9LYz6aOovrkXtyV3cuuPNUSCqrQoCSv6C/PEuiVJBnzV4
	wXkhYcB7ltEl6m9C+bWPkQSSqM/v5/ih4Aqtc5Zs1zDcJOnhZkYdwb/G422ReEc0WwQ0Ij40ZtnR7
	8coP3g+8e8Q4oNZ8TDhy7hXhiMbse4r+E6RBqE/E1GLvC0DxsLEN/l8vLFfwpbruUOA2magT/NFKF
	P9D7lnxksCZAFG8Cf+RWcVryf0HZZ9Hjqzh27FNo9rCMdjy2AWXf2qFl8YMHw9IKDaOxbhc8JDHaw
	gLp3Gogg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEz6w-0007Z7-0p; Sun, 06 Sep 2020 18:09:54 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEz6r-0007XV-45
 for linux-mediatek@lists.infradead.org; Sun, 06 Sep 2020 18:09:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id q9so11426652wmj.2
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2020 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NQSqriQ+Oe6AXLkXoxURAgwhIAz5B8mg5HUOyceRaNE=;
 b=nzzQyiNa8rQcUAxBAKtcjxvn8Z/NBnTq1BCOt8tepxUgorNExl1s0ZkDz1CyCc70xC
 bB6xvUMwoV0UTUU+mv8bjg0hWZsvrsrou45DpBCu1+OOH5Vru8A0mFbQVD7cMcVkAOVp
 xropCu5NotExuTib2BY0RPN6qsRiItiRgcwYGWErDtodSMgW/THTIDr8AJDLBNSR/0Q8
 BuShhulLeCJf9gnEO/WeZi4COs/OvEoUU5TdwNCVZvKW9Y+iZoLCtao6AHDCc8bI6As4
 EVclkLAEDCZ+PzcLZF2pVQr+a11H8d7nHYuFG8LyislgqlcZphJTPeufC68EkzllDA7g
 lnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NQSqriQ+Oe6AXLkXoxURAgwhIAz5B8mg5HUOyceRaNE=;
 b=BVqOYQWjC0fBBQLkri+44dGcuZQWxPxsQhbwVmH8KbmtK1EO1zx8FFP6CvRiREe0v6
 qM/kn6RUxtagYScA/IJ3NaabhREgLeZSD4TgcKMPghyJAzgtGJF07olXRneaUglaPhwZ
 TT8DvEBDCqjkF5aMtDZVj7OtzqO726WEvJ7BvQpYq+vkQ/UNBp+RQCw+bi4WIdv0AVYd
 lqOXf3sMhgXu2SxxqXv9OxBOBVu3HRSCwt6Pqr2kNEdnT/kJvFk1HMBdImzgGj+KF4hD
 0SRk5pWNLH93hz688wg5i796qFUQ6sDWXz9tEvLkneYAPXJKzQtz7lpZ4vxpJQt8V1Hq
 jgfA==
X-Gm-Message-State: AOAM530knAmitGE3Ee68X5x6aDM1995GT26ZDNdGMyMzeVbRSkpUaLHA
 eRU2nokW5DGtXt7Jzs5Y6GlaQTpNQkFCeQ==
X-Google-Smtp-Source: ABdhPJwT0GnOgudgWfvSH7xfMSErDdiy138y71snJGOMmAaWrk+a+mBdo9cAwboSzipzn8KYwteQtw==
X-Received: by 2002:a7b:c84a:: with SMTP id c10mr17091888wml.139.1599415787873; 
 Sun, 06 Sep 2020 11:09:47 -0700 (PDT)
Received: from localhost.localdomain (208.19.23.93.rev.sfr.net. [93.23.19.208])
 by smtp.gmail.com with ESMTPSA id s11sm24593937wrt.43.2020.09.06.11.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 11:09:47 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: mediatek: Add binding for MT8167 SMI
Date: Sun,  6 Sep 2020 20:09:37 +0200
Message-Id: <20200906180938.1117526-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_140949_284101_8BE44FDE 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 robh+dt@kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device tree bindings documentation for MT8167 SMI.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../bindings/memory-controllers/mediatek,smi-common.txt        | 3 ++-
 .../bindings/memory-controllers/mediatek,smi-larb.txt          | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
index b64573680b42..dbafffe3f41e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
@@ -5,7 +5,7 @@ The hardware block diagram please check bindings/iommu/mediatek,iommu.txt
 Mediatek SMI have two generations of HW architecture, here is the list
 which generation the SoCs use:
 generation 1: mt2701 and mt7623.
-generation 2: mt2712, mt6779, mt8173 and mt8183.
+generation 2: mt2712, mt6779, mt8167, mt8173 and mt8183.
 
 There's slight differences between the two SMI, for generation 2, the
 register which control the iommu port is at each larb's register base. But
@@ -20,6 +20,7 @@ Required properties:
 	"mediatek,mt2712-smi-common"
 	"mediatek,mt6779-smi-common"
 	"mediatek,mt7623-smi-common", "mediatek,mt2701-smi-common"
+	"mediatek,mt8167-smi-common"
 	"mediatek,mt8173-smi-common"
 	"mediatek,mt8183-smi-common"
 - reg : the register and size of the SMI block.
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
index 8f19dfe7d80e..0c5de12b5496 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
@@ -8,6 +8,7 @@ Required properties:
 		"mediatek,mt2712-smi-larb"
 		"mediatek,mt6779-smi-larb"
 		"mediatek,mt7623-smi-larb", "mediatek,mt2701-smi-larb"
+		"mediatek,mt8167-smi-larb"
 		"mediatek,mt8173-smi-larb"
 		"mediatek,mt8183-smi-larb"
 - reg : the register and size of this local arbiter.
@@ -22,7 +23,7 @@ Required properties:
   - "gals": the clock for GALS(Global Async Local Sync).
   Here is the list which has this GALS: mt8183.
 
-Required property for mt2701, mt2712, mt6779 and mt7623:
+Required property for mt2701, mt2712, mt6779, mt7623 and mt8167:
 - mediatek,larb-id :the hardware id of this larb.
 
 Example:
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
