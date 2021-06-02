Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281B9C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 07:12:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D193261363
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 07:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D193261363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vhT5DOUlY+A1SaQ1IYPsIK7X5aTl4MxI/f+TjMoZhFY=; b=HP3KRhjqFpWuf1
	IoSN8Ao5LDDS7C5dtK7H9b2j9hW9Z1QF4npd/8vacVNrUi2GAtRU45BG5kjwylQCWXRmKwK9XaC6Z
	7FMOBznVXPJaCI+LiqscGqbkwinc2h4Sk22uhsbKRvqSo1JTJIZNAeu+8xhwM94TdMeGaYtwFmNgm
	AHaEJ5TmLsG0am/z0NnGJipZyoOWyJAz1DtlDeROYMpDyiGsyomYQT77uzUB9UxWHtqb0GmekHkHJ
	6ldW03KjHLxAMqjgFBZB9emZk5GGrW3u3eFwblbhuozJHyNLc4ogI+gDjtUFTNCJEAskbsrbPtPJe
	8qu5bKA8EznWoI2bRdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loL3I-002DGY-LL; Wed, 02 Jun 2021 07:12:32 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKm5-0025Z2-9T; Wed, 02 Jun 2021 06:54:46 +0000
Received: by mail-pg1-x52a.google.com with SMTP id i5so1494085pgm.0;
 Tue, 01 Jun 2021 23:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wQcRpX1GVoDBUQXFUYpbeCcwiOn/D1hX7CC5ehcUovI=;
 b=Cc01z3Nfcd6Nv41ZsKvNNxytIgz0UtV+N4hh1OZqwogY8TnFcxI5wKIVIOqCqsFzbs
 BGpG1UAm0zEfLzH/RWdCQ4DWYQSd9w7i9xGKD8WG3ONTuTC8ruu+Z8y5I5Hk8NOL6xmV
 F/n9YJ5/NGCaLoNcsdMw58UJYVaKUFHAy5Mm2FNBVPECZQZrAE/eW8uNE5GGdXsqUJ4n
 TE44mI24AiPZg6fGij5+gVwR7NF1sIWK3FHscTayl86pCMdCpQiWu+s5Ra551kf945nD
 7K4cYDP//X3U8LRvley/a3vX8a2xEH+czHcFBoIiHpjUsawW4LIY6rC3v99s+wQF5dQw
 6oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wQcRpX1GVoDBUQXFUYpbeCcwiOn/D1hX7CC5ehcUovI=;
 b=o8xABNMTeDhpoVod7rnnPJUIKNt9YknNSI4xLn+ZZPZDwUoNsjgpgCTyx5Z9mIdeEL
 01VgIOUGUG/8J4Ar7+w4Vc4lLV3GY7miHmaawB+nIU5ae3vRqd02NuUSyEME2C1UAGOa
 qm5IpUV9l/6WpUKoyLfRCqaWGC6lIvAt+MTbhNSXurVg+4etDsG8CEpHU6e8XtIjds3y
 gOTNThoYccObq35PhMoMXFDKfLcOrS14kteRrKTbHayy5cHw1SdQXsHVaUpPRF5zl4uA
 ZWARRlBkCTrnZeKIUDBjV3btDeP+2BjLFDqDmPA5sAk4bIW8eJ9VhKpUJpIG7LiuZBLp
 LU7A==
X-Gm-Message-State: AOAM533NDe39deQI8I4voSO+G2Pk8gOWWzsurWqExabbOlhC0ZgDW1+u
 IZIYkvbAqmgfndnCB20BcaM=
X-Google-Smtp-Source: ABdhPJzhY8w2ASZLFkI0JvBa907knpBNJtUHj5s2ZHEwZsey7YS1oZo/6jay034aCxOB+7HFka++Dw==
X-Received: by 2002:a63:1d2:: with SMTP id 201mr32583827pgb.3.1622616883726;
 Tue, 01 Jun 2021 23:54:43 -0700 (PDT)
Received: from localhost.localdomain (1-171-13-27.dynamic-ip.hinet.net.
 [1.171.13.27])
 by smtp.gmail.com with ESMTPSA id h6sm15190351pjs.15.2021.06.01.23.54.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Jun 2021 23:54:43 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, gene_chen@richtek.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, gene.chen.richtek@gmail.com
Subject: [PATCH 1/2] regulator: mt6360: Add optional
 mediatek.power-off-sequence in bindings document
Date: Wed,  2 Jun 2021 14:54:34 +0800
Message-Id: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_235445_387122_B6E56273 
X-CRM114-Status: GOOD (  11.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add optional mediatek.power-off-sequence in bindings document.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi,

Originally, we think it must write in platform dependent code like as bootloader.
But after the evaluation, it must write only when system normal HALT or POWER_OFF.
For the other cases, just follow HW immediate off by default.
---
 .../devicetree/bindings/regulator/mt6360-regulator.yaml       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
index a462d99..eaf36e2 100644
--- a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
@@ -24,6 +24,16 @@ properties:
   LDO_VIN3-supply:
     description: Input supply phandle(s) for LDO6/7
 
+  mediatek,power-off-sequence:
+    description: |
+      Power off sequence time selection for BUCK1/BUCK2/LDO7/LDO6, respetively.
+      Cause these regulators are all default-on power. Each value from 0 to 63,
+      and step is 1. Each step means 2 millisecond delay.
+      Therefore, the power off sequence delay time range is from 0ms to 126ms.
+    $ref: "/schemas/types.yaml#/definitions/uint8-array"
+    minItems: 4
+    maxItems: 4
+
 patternProperties:
   "^buck[12]$":
     $ref: "regulator.yaml#"
@@ -42,6 +52,7 @@ examples:
     #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
     regulator {
       compatible = "mediatek,mt6360-regulator";
+      mediatek,power-off-sequence = /bits/ 8 <0 0 0 0>;
       LDO_VIN3-supply = <&BUCK2>;
       buck1 {
         regulator-compatible = "BUCK1";
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
