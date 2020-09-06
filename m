Return-Path: <SRS0=UOtS=CP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523EEC43461
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 17:24:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B557920738
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 17:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LtctB3WI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d6FbYoTX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B557920738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJErCaxGolWY8jazuTsJDYjy+JOc/XVE+aPr/bm9SeM=; b=LtctB3WIUgNa5J5DcFcB3OflUX
	eMHNYUJxPU9W8OO/YOl+AcqR0Yd9X+U2R72haU8tPmjkw3smmTw/QTS0uTIf6UcK4D89i7BJtynJ2
	wcfQQM87PxYyv//++cOmJguDpAUSNbzU33dGiHfDzEPrZ6x+ihWdm+ZbM7CUgrhPuhScX//Hb6iK4
	hhfnWeosZJFPxEvb8U6klayAjDMl9Ap344IUsG1/SgWt5SN778oaKRZoGpjZ8fhjKvLour1nHhVm7
	CmVu1GmOClVNnfnsSI0+GIT2a4edk1Gel6irg9q3IPM0egeTWKFULkY+AMWbed54fUAlg+Z2ZjPRx
	jYwi71XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEyOP-0005gT-QS; Sun, 06 Sep 2020 17:23:53 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEyOK-0005ex-Dh
 for linux-mediatek@lists.infradead.org; Sun, 06 Sep 2020 17:23:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id q9so11315329wmj.2
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2020 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=24ZDJaQJlYP3s2jo1tr1kyqJxA9JzOYlONK3x6abO2U=;
 b=d6FbYoTX3LMhvmjG+jX+H6oSnX1Qndfcpvcxt5qQWX4Y78bPaBDa4xRRJkGGV3QlvM
 8YGb6Im8Mjept7h32sZJHxabk5VZWWfaUnye/cogIJqV0e4NpJvYMHNRsw76PExqbw0n
 V2LbQzQxx4zsAfESqEZmi2i19fQAtKzIAN/VDiajDzm1tAIzrS4jC8t9JP6Zp653HTc2
 oj14wcAknZHl8N1J8852WE4H7MWHqFQ+XFphCD1eANKYQ2zcT84/gySUtgVmkCV65WyZ
 +iAO629pmuiiuoIhcGiM4BDh9ehdIHjYeZp2XDbMe8GsPKenMVEpZCiQ2m+EiVE6BFtL
 sa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=24ZDJaQJlYP3s2jo1tr1kyqJxA9JzOYlONK3x6abO2U=;
 b=el4SKw0OiMhf5d73ba0TT9hBf6NFuAHIRfMY8qUXGhBAfzVnx4GFF0uP3ZYeE2uhui
 2ns9WqhxGSDjgSccx4WjwQ/Xsnsfn4nsRbgmGUANyl1EZh8g6UT1DuaWqEYTZ0Show5O
 7X7YP/0dXpK+Kb+ToYRgwLAAqhgLyyYQVb9dQZjkOJlVHfNYCRgTZcJEOTq7lYMfXi2o
 DUBlyJ1t942lVfT0wxC/fwjAxb7STfHrtazFJJQIy5PfLoNSbm1tFrYoSOnQh2Qf22um
 jhGT2VcgtkQ1c4XdubXttqLmQsDRtn6g+Zp+eHTyos4+2sDVbk1goQfQP4VnApRI5EN3
 bz0A==
X-Gm-Message-State: AOAM531pL/Yg3tbG4p2RXaRkRWSKno6amThI3WBMv+NFMgkZyx/GhrB0
 BWjUhkm9lsG/UQPs2ld18oBPXQ==
X-Google-Smtp-Source: ABdhPJzaf8R4dDPqvdxcZZz/jT1v1MZKWYRXPj9+fLQGi86TF6O09EDkNB0DzeAay/sWNs2GuzJqnA==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr17151926wmj.30.1599413027189; 
 Sun, 06 Sep 2020 10:23:47 -0700 (PDT)
Received: from localhost.localdomain (208.19.23.93.rev.sfr.net. [93.23.19.208])
 by smtp.gmail.com with ESMTPSA id p18sm4490311wrx.47.2020.09.06.10.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 10:23:46 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: mediatek: add MT8167 power dt-bindings
Date: Sun,  6 Sep 2020 19:23:36 +0200
Message-Id: <20200906172337.1052933-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_132348_490504_98D9E1DB 
X-CRM114-Status: GOOD (  14.37  )
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
Cc: ulf.hansson@linaro.org, krzk@kernel.org,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 mars.cheng@mediatek.com, macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
 owen.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the SCPSYS binding documentation for MediaTek MT8167 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  3 +++
 include/dt-bindings/power/mt8167-power.h           | 14 ++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8167-power.h

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index 2bc367793aec..08cb8438a35d 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -10,6 +10,7 @@ domain control.
 The driver implements the Generic PM domain bindings described in
 power/power-domain.yaml. It provides the power domains defined in
 - include/dt-bindings/power/mt8173-power.h
+- include/dt-bindings/power/mt8167-power.h
 - include/dt-bindings/power/mt6797-power.h
 - include/dt-bindings/power/mt6765-power.h
 - include/dt-bindings/power/mt2701-power.h
@@ -26,6 +27,7 @@ Required properties:
 	- "mediatek,mt7623-scpsys", "mediatek,mt2701-scpsys": For MT7623 SoC
 	- "mediatek,mt7623a-scpsys": For MT7623A SoC
 	- "mediatek,mt7629-scpsys", "mediatek,mt7622-scpsys": For MT7629 SoC
+	- "mediatek,mt8167-scpsys"
 	- "mediatek,mt8173-scpsys"
 - #power-domain-cells: Must be 1
 - reg: Address range of the SCPSYS unit
@@ -42,6 +44,7 @@ Required properties:
 	Required clocks for MT6797: "mm", "mfg", "vdec"
 	Required clocks for MT7622 or MT7629: "hif_sel"
 	Required clocks for MT7623A: "ethif"
+	Required clocks for MT8167: "mm", "mfg", "vdec", "axi_mfg"
 	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
 
 Optional properties:
diff --git a/include/dt-bindings/power/mt8167-power.h b/include/dt-bindings/power/mt8167-power.h
new file mode 100644
index 000000000000..8e7bcb4834dc
--- /dev/null
+++ b/include/dt-bindings/power/mt8167-power.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DT_BINDINGS_POWER_MT8167_POWER_H
+#define _DT_BINDINGS_POWER_MT8167_POWER_H
+
+#define MT8167_POWER_DOMAIN_MM		0
+#define MT8167_POWER_DOMAIN_DISP	0
+#define MT8167_POWER_DOMAIN_VDEC	1
+#define MT8167_POWER_DOMAIN_ISP		2
+#define MT8167_POWER_DOMAIN_CONN	3
+#define MT8167_POWER_DOMAIN_MFG_ASYNC	4
+#define MT8167_POWER_DOMAIN_MFG_2D	5
+#define MT8167_POWER_DOMAIN_MFG		6
+
+#endif /* _DT_BINDINGS_POWER_MT8167_POWER_H */
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
