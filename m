Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D0CC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 13:32:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668CE23406
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 13:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668CE23406
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nFBrUBVSUDe8F/L+Xnnd0Ml6VuvC77u2o5s2kZ97oxg=; b=nGAuOgfhe4O16iQ5RzaqHI6RoT
	lt/kyhixkPzn13Syl7ERRfYLf5ViFb979iiBnidO49NudjWRHpSJ38uqP01GGIqKR+XYgAUQ9xzCs
	CcEsi1pCx0NoXZdGKVCbgHWRATFaNG9UqoCwm73SQS7dvwNHPwbvAG5RAq5cXtwt3vdtyeBA1tXS4
	Tr6o3uQkdGvSZHRrnmhUkU2HFR5wuyY+jKhC5xr/AinlCpqD96+0XWsjW6UVnfuVCiyZXz2K3wu/y
	3H/aw9OaXqGQesDaU72/ccDgoCojplSUIE20ZnDfISaGQ/6/6U674W85IxJ9SmuqNPYUPhuidx5HE
	Y5A/syQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmzaI-0006Qh-9S; Wed, 09 Dec 2020 13:32:46 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmzaF-0006PH-1I
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 13:32:44 +0000
Received: by mail-ej1-x642.google.com with SMTP id g20so2157513ejb.1
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 05:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yISQlKdDdQEs0rtCA572V+GjrNXLUJl3S5cKMAgTTQQ=;
 b=VAkDTljn67tjle7mF1B8R2mxdtZP5EQIuxGcTWvyzZ/4QkBTfafez9leqhcRR9YkE8
 +3tezKLppEv4UZLbgeV9aSGzoN0kW+x8EWw6/Hz6cZidYZzRf/zL7ncXg/JepZbMhvjc
 63jA+AVWp75z0L0GAcz8I6mTRUCiwjSwYUFSGxXgBKid81GYAzSXIkxwHu/Cl+Ut9bHd
 DuMg2OY9KpqnEtlHbEGrcw56p5wEFGTavzUjTLxFDoJzpuJaGOFGZiNI1cMRZin6us69
 AhJbVKh/Lkp9rO5XJ4I5uuD9n5+wS2IV19SWCdBDx1sKP0W/xvJr9BHN23zZHkfv9xhp
 TdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yISQlKdDdQEs0rtCA572V+GjrNXLUJl3S5cKMAgTTQQ=;
 b=a4vDT+kz/4gnl9wv4paDfo18pqWDw70SUHq1L4k4it/nRYwfMObgS9lmDX2WoFr1XN
 zVnzM0bZyXwf8XckKZ7/9xo5SLR8K3Bopoh35P46jbDgmzbmdpEkXiw/BzGBANNdeKhe
 H3yvbAx2P+sI3+Ij84njuY7pvUIdz1xpnNlsHAVaQaoqUP9PQo1lzL0PUcB3IWCcBmry
 YGJscb4YFohuXKRkY7LYaNHomTI+VCODN0zKdbK7H0LOnj+tzhZmMUyIPIWFFsBNAbFY
 69ObaDr8fCcdTCNXiChaz9vtuLmiG68MZtNJgF2q1IUYRRjcCj4aFMhpquWOOofMqRsp
 Samw==
X-Gm-Message-State: AOAM532BGaPb8zC+GG2NNHMdfX4cSflwV2JuqXrsoIn+tpHJ6jdFIfbW
 9N+mCq1fJ1C4Zt7042z/e0LGbw==
X-Google-Smtp-Source: ABdhPJy7erseB4aaSf7rBqmFXKIkLTwJ81qA/owJwMdJ1Yk4vNWGCUjUn2gUuTyFbtEhRZC1F9pDSQ==
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr2046210ejx.113.1607520761731; 
 Wed, 09 Dec 2020 05:32:41 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id bq20sm1490646ejb.64.2020.12.09.05.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 05:32:41 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: power: Add MT8167 power domains
Date: Wed,  9 Dec 2020 14:32:36 +0100
Message-Id: <20201209133238.384030-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_083243_263163_233E3194 
X-CRM114-Status: GOOD (  15.38  )
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
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power domains dt-bindings for MT8167.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
This patch was made on top of https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.10-next/soc

v3:
	* Remove MT8167_POWER_DOMAIN_DISP since it was an alias for MT8167_POWER_DOMAIN_MM
v2:
	* Implement on top of new SCPSYS PM domains driver

 .../power/mediatek,power-controller.yaml        |  2 ++
 include/dt-bindings/power/mt8167-power.h        | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8167-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index fd12bafe3548..ad6db377f943 100644
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
index 000000000000..c8ec9983a4bc
--- /dev/null
+++ b/include/dt-bindings/power/mt8167-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8167_POWER_H
+#define _DT_BINDINGS_POWER_MT8167_POWER_H
+
+#define MT8167_POWER_DOMAIN_MM		0
+#define MT8167_POWER_DOMAIN_VDEC	1
+#define MT8167_POWER_DOMAIN_ISP		2
+#define MT8167_POWER_DOMAIN_CONN	3
+#define MT8167_POWER_DOMAIN_MFG_ASYNC	4
+#define MT8167_POWER_DOMAIN_MFG_2D	5
+#define MT8167_POWER_DOMAIN_MFG		6
+
+#endif /* _DT_BINDINGS_POWER_MT8167_POWER_H */
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
