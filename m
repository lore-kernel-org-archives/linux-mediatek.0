Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B63DC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 19:40:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFACA611BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 19:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFACA611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LqBzqzOiJqi17Hl4co7R0EFkUXUv1PsW5CnkTC7kpP0=; b=O3geKdoBak1iyWZ/pbsvZre8KL
	JYeca0gLa4syG+WobYoAh0SmIEVCeTeue+eWiKFsn5YdgDoBHzGMRHJu37CvFO2Ec75clVadEX6/n
	QmDlpm6fuipQp6BQaLYUjaPLaKiQVt8ha671FZ13dMq//ws4t5VXuVhxXReGUX1qZaVfNh7wqWuTX
	Ef7jBPUInr8NRiCE8u3zl5e1IiPPXyusdU7pTVGEF4IpS9xtQ3y/fX/SQlXxyRhgbGb2eTKN3GLnY
	32bvYuf3eDv1mNQDllMDjip6FIHZ4RlBi70DpMpBp1D8BZeClfi6I6f/0Iunh/593jZ/7VXfgnoAy
	3B7ZGudQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj5Zq-001kqB-Tm; Tue, 18 May 2021 19:40:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj5Zf-001kot-IP
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 19:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=w916I/0sjB8ZeTLALSSIwoUKwmWfEbuQ72Hpwd3NOu0=; b=qoyJ4njonAQAvPIz9p7iAIXkX+
 6oaiNk2JfMocI0YM0XghtBHgFDONHPYHNYDBNN4DkmLC0fkvz11WYDtmANpwVyezun1bVDbhjMt+G
 TsDm5AJ6IYvonfQFiE3k/3Y/wujTXeH+tGmzTtnlcwKsFU6uC2lcgDPEcVE1kSRE4+8HvWWLz8tCw
 6zchi3StOyKPZf6rcmUhlBHTR/0y1aG6I1MXR12tzX0nVp/CtKhudAvSONme9C3H41bH1LE5FhAp6
 aFMhzMN0amrIescXy5c1i1c5EiRzhMhB0SL1MZ8bVRbrpA39n1nBVLui7aeX+YvY6OJyYCyR0GFgc
 BLE23nMQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj5Zc-00Ev3t-Hm
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 19:40:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id h4so11466900wrt.12
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 12:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w916I/0sjB8ZeTLALSSIwoUKwmWfEbuQ72Hpwd3NOu0=;
 b=imtv0CYo96W3t7tK4e2c0G+asBQh3MxUV4zhTePtdhickz6yO6CV/Uxe+0mDylMgKa
 OOYFukZKU+SLyEhPO2dNddst9TRtn4XyBfw5Uvip/dl4tP8yOMZQV4lMiwa/xVGksInt
 v90XyXqT6Pys9EfGXyaUGJMiUtRKeYPjmY1TMvSBllAsJkypu1reDAprpqraATtzspaZ
 vPutGVyjLKQSsXtkLqeHIlJMXri05RvfeRYYYgBCaDwD3eRCTORRRimvb+/PO6pC3hIk
 DOYLDfuZ3k+SSsFnV/EQXzaa0W2uphkDUjbwX0Ws0leGltYP9wLnVn5/SSF4v3ZeajkG
 nagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w916I/0sjB8ZeTLALSSIwoUKwmWfEbuQ72Hpwd3NOu0=;
 b=inBwgtgh0RRP+6oUfzGo+2LcmAH7D9ZPMv9nhRYZ2GIkSBlCWGL/1ERVE+GZEGHNh7
 FWESUybAgR6Tu9d/6vQNMwYHvTrXgmwmlNesxoff9nj6TsqYOscbSSX9jm8ZxForbdXY
 oB6iJUWK6LgG57dGFg1lpB+xsLYZWse29z7Aitm2A4yZRivN9SE90gPpad17bPErAkvN
 i24x3Jg2Eju5cq0mGSpqh+GAPoVelwWCP4Q/Gagpx+/aO2XF/GpAaaRWOPcnDSnm3q7j
 cdHrNYlBqjohQkIzpB+XQ0uK0tUdwhtyf/Pt71SedmtI2RT2rhxCY9MLRhxfYCyQuD6V
 lsIA==
X-Gm-Message-State: AOAM530xjabytZPaN0wn9Y6CmsS7izOCqAL2Im8CmwVrEmc5CuMfLDXU
 zC9Ko2GjTx1GMkehRxOiZruM7A==
X-Google-Smtp-Source: ABdhPJxqBvFdPKeDHOE6hCEivMK6rdREhcDBBFaoT/XGgJgqhulDWVhyvbfztJUlEUSOEXnTWAQJKA==
X-Received: by 2002:adf:f788:: with SMTP id q8mr9020066wrp.205.1621366810997; 
 Tue, 18 May 2021 12:40:10 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id q186sm5484407wme.20.2021.05.18.12.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:40:10 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: power: Add MT8365 power domains
Date: Tue, 18 May 2021 21:40:07 +0200
Message-Id: <20210518194008.2921469-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_124012_607472_34768787 
X-CRM114-Status: GOOD (  13.33  )
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

Add power domains dt-bindings for MT8365.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../power/mediatek,power-controller.yaml      |  2 ++
 include/dt-bindings/power/mt8365-power.h      | 20 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8365-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index f234a756c193..9a26a2cee7fb 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -27,6 +27,7 @@ properties:
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
       - mediatek,mt8192-power-controller
+      - mediatek,mt8365-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -64,6 +65,7 @@ patternProperties:
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
+              "include/dt-bindings/power/mt8365-power.h" - for MT8365 type power domain.
         maxItems: 1
 
       clocks:
diff --git a/include/dt-bindings/power/mt8365-power.h b/include/dt-bindings/power/mt8365-power.h
new file mode 100644
index 000000000000..352440c4b5dd
--- /dev/null
+++ b/include/dt-bindings/power/mt8365-power.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8365_POWER_H
+#define _DT_BINDINGS_POWER_MT8365_POWER_H
+
+#define MT8365_POWER_DOMAIN_DISP	0
+#define MT8365_POWER_DOMAIN_CONN	1
+#define MT8365_POWER_DOMAIN_MFG		2
+#define MT8365_POWER_DOMAIN_AUDIO	3
+#define MT8365_POWER_DOMAIN_CAM		4
+#define MT8365_POWER_DOMAIN_DSP		5
+#define MT8365_POWER_DOMAIN_VDEC	6
+#define MT8365_POWER_DOMAIN_VENC	7
+#define MT8365_POWER_DOMAIN_APU		8
+
+#endif /* _DT_BINDINGS_POWER_MT8365_POWER_H */
+
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
