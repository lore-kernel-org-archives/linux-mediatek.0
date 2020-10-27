Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE166C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 13:12:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717FD20829
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 13:12:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hvnkDIqC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XL3n8URZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 717FD20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4clMIS9EM0cRaTLIlQmR04ACAR6Q2pxVYk6Seb/BDE4=; b=hvnkDIqCjgfz6NOsDYgyTRFosz
	Gb24j8IsqlHIuGUcdUTMcam0R+snrBPhX5m6UVFrj6nOWFlKbHNch+39HOYiTiGUVfGTzwVEbRjFA
	mOBqeHJfxg9lBdlyiGKbVQr1NZSWrNMklgPqd1fq3+gCw1i0ABgDi7x5ukccLfc+2PjER132qKRKp
	z/T+76pz4JdTkbnBne9QHl+f8bDZnH15Vb6oHXkpv4JDBamM+j64N3XpLBzZecem0lPlYN3KDboZX
	KLUS9Y4oa/JECmHaZNbBEE66iDxArXWllpI1wCgjf357MyR0yIl5BQQU7qLrkpirmAvwvJ3HY7oHa
	a8ZZGN0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXOlT-0002Es-1U; Tue, 27 Oct 2020 13:11:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXOlQ-0002Ds-33
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 13:11:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id n6so1810022wrm.13
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 06:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kdzVNUmBorGOvHJ+kuujXmASC0q55W9RUZ1wT5ddYb4=;
 b=XL3n8URZ9/nfLX3xpUTkreqFiTCvhLbd3edP321U7deumP3SwL+CNrBhKQBC7WVEEj
 rl0EJqEa/2M3UvYBKdt4UGbtA6+okNwPigKuI0n2CrbVBsQ4MohEol1ehgw1/SIwLcHa
 eUC0pa+IvSOHijYIYXL7kZwNv7s2kk31YjG+zMwteNgJM7W8JBOAy1IShG1Wzw9ByK0C
 cXccgKR/2cBh2DnATn2IqnozPPM/LZ0mPBvWnoIPckintDaQaqoaZcFqeh/drfWsktFQ
 XPbckvfEaJnvn+eVZBJ+A6uX57uQa3LUQ04EQBEnNLRlRdLODxccpg4agk8WZJq27vaU
 QACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kdzVNUmBorGOvHJ+kuujXmASC0q55W9RUZ1wT5ddYb4=;
 b=A3NEVjgV0B/j7TBJnUv2mVLeEzGbQanLOkR1Nq6LKetBQ1/LEnlaWzgTN3T44nRWZp
 RxiVCOYETNBGrvlcti0CwCVDr+VCp+p6lgIsHUyxrHd7jX694JQDMnOjDCrDjPIAiLEV
 wntNLyJR4842AjdMK3l+/WAQle1n+mrxHAllX9nf/hBgL+6KkM645wlSJmD0e32U8G7D
 4N4O0/1vpQE0fl6ul95ljafw+AjgNgdNE8oArGpFt6G2IDhPhsm12em/QmEgWcx2rXjW
 3RRmDRnJgBsgU5CoLiOVKHO67YYVY6wxmizbeGzyOdLmfBFMRTChHNNW6ce9hLtiPJ1p
 QIWA==
X-Gm-Message-State: AOAM5338CAKcELYXU4vBiSXfLcrEX+4jezwoLHSmZyaOppGkVIxpBDiG
 kBk0C/RIp+i8shS+tnoflJAM2w==
X-Google-Smtp-Source: ABdhPJxoBc58msQkjTQ20On5cTV8fuD0bFRNORO6EcSQUdHPh39ckWgocQL7IVi4sOz4bXLDzKG48w==
X-Received: by 2002:adf:ea0b:: with SMTP id q11mr1396904wrm.80.1603804306588; 
 Tue, 27 Oct 2020 06:11:46 -0700 (PDT)
Received: from localhost.localdomain (54.169.185.81.rev.sfr.net.
 [81.185.169.54])
 by smtp.gmail.com with ESMTPSA id v6sm1780117wmj.6.2020.10.27.06.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:11:45 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: power: Add MT8167 power domains
Date: Tue, 27 Oct 2020 14:11:20 +0100
Message-Id: <20201027131122.374046-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_091148_165312_22E5694E 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, enric.balletbo@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power domains dt-bindings for MT8167.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

This patch depends on the SCPSYS PM domains driver [0].

v2:
	* Implement on top of new SCPSYS PM domains driver [0]

[0] https://patchwork.kernel.org/project/linux-mediatek/list/?series=370737

 .../power/mediatek,power-controller.yaml       |  2 ++
 include/dt-bindings/power/mt8167-power.h       | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8167-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 0318ffb1133c..73e5452c3a5d 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -23,6 +23,7 @@ properties:
 
   compatible:
     enum:
+      - mediatek,mt8167-power-controller
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
       - mediatek,mt8192-power-controller
@@ -59,6 +60,7 @@ patternProperties:
       reg:
         description: |
           Power domain index. Valid values are defined in:
+              "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
diff --git a/include/dt-bindings/power/mt8167-power.h b/include/dt-bindings/power/mt8167-power.h
new file mode 100644
index 000000000000..7e3babfc2eef
--- /dev/null
+++ b/include/dt-bindings/power/mt8167-power.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
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
