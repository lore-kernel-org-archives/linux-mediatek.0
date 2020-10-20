Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E164AC433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 08:08:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E748222E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 08:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zxrFLojU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSZFpB1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E748222E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1ePOpEtoYalVjmtxcA93AEdju+W5MR1asQP6Um3RDQ=; b=zxrFLojUyTvEmZQxdLPGjWlxX9
	8pgp4YKQKwmdTj/WTOeSSJeLfCleOe+kUtNdfw9N6m7bIOcTHnJT4sWOLNZQp1Ho0SPTv5tT/9H8T
	1ul4GpmP7T2tG+LQzoi5Gc/MLSlQBysFFxfkb8f/zrhScL/KcqXpZkKQBv9tlSA++CPkjo0fXeCuK
	mkAeRLvshEe4v6SNPZh1ts3vaRjY4nkcgjRpQCPyJpaPsCEjPKncX5EcYw5DigKf436kWGT+ZOUhb
	ZF9J1T0UKgS2Qbdl0N1Typ0D8oCwv19GiY36eNqwmK5/I1CbwQBy0skLJVc6IkE3bYppv4sb6lP0p
	N1cBxi/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUmhJ-0005Fb-Cd; Tue, 20 Oct 2020 08:08:45 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUmhE-0005E7-Eu; Tue, 20 Oct 2020 08:08:41 +0000
Received: by mail-pl1-x644.google.com with SMTP id w11so608944pll.8;
 Tue, 20 Oct 2020 01:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R47c8IJlDfJaqH2Rm6EUjlvpHInRK3+ab54pNsvjd9M=;
 b=YSZFpB1GZjW/lvoux4A3VSm4jmqdVsMXV5awGVOpMUXYdF56GRYI1EEeGbzG9G/zc4
 tBG5w3tC/UkzGrtaYzHjr4PqKi7A6po/SjMIhtHMicqg8MowMBiBEhWaDWmGB0s2jE5f
 c3cK5KhATQJwokl26GMJXlDQUkLN/KWaIJm7JRrONnqofCrdyoinI9d1wVNs+hKYc5UL
 1ppj/NSWCyoM9gfiCmoS7sSeL68eb/7l9DER1NrxumAYCST+6cYe8qTD4lUUsrqVyGea
 YD3CfA+9KRrde01nleyikmRntvh3aBkzFsBzcsjc/JGOZmOKPJ4R8gjW1NTWNsg/21hz
 wT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R47c8IJlDfJaqH2Rm6EUjlvpHInRK3+ab54pNsvjd9M=;
 b=aL2tRiv/41G7corKyM5TSc2nyjTso88Sg54Iv8zfA8yMVAUwCQ2Td/gHBoVzX75XNt
 2r4R3o9gdV8CNfud6nNMOrxitpZRTEU1C1UUxBQDYZ/Am/U8MUrSTMdbS0yLTf3ewqqg
 vYhRlqnU5lyaMj4GZuFrrR35CRc1gbdLB9yONs78CvkA/hXpD5YIkFKUDNN82Z8fXfW2
 cZTxJ3qFy3iVNWnLvwPke+YH6hVcdhv5wYnSE+SZQqcAjrNHA6aDJ76K3LBYsaPZrsLS
 RP9f5JhgDvxte8SDspgOr1O+tJA8qLf7BBCG9OLX8hdt6ZqW9dUQmK8SBf6gVH/GrLht
 +5Ug==
X-Gm-Message-State: AOAM531ax/0nV6JzLFvFzqTYwdxATPCmDWoiUN4Q8Yg+6U+7uZawC3PZ
 5LieOd3IKtwH1GMy4sjqqwk=
X-Google-Smtp-Source: ABdhPJz+seHCMqIEtQxTSJpqKz3QaHTqHPCpNbZlw4TDTHXgKsE6nxCuV4e1TDNUCddvocRKYb3FPg==
X-Received: by 2002:a17:902:d710:b029:d3:7e54:96d8 with SMTP id
 w16-20020a170902d710b02900d37e5496d8mr52751ply.65.1603181318160; 
 Tue, 20 Oct 2020 01:08:38 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:477:195c:4b74:c749:e0fe:9e69])
 by smtp.gmail.com with ESMTPSA id 17sm1347270pfi.55.2020.10.20.01.08.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 01:08:37 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v7 1/3] dt-bindings: iio: adc: add bindings doc for MT6360 ADC
Date: Tue, 20 Oct 2020 16:07:45 +0800
Message-Id: <1603181267-15610-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_040840_565642_52BE5CC0 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

This change adds the binding doc for the MT6360 ADC.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../bindings/iio/adc/mediatek,mt6360-adc.yaml      | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml
new file mode 100644
index 0000000..a7350ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6360-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6360 and similar ADCs
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  Family of simple ADCs with i2c interface and internal references.
+
+properties:
+  compatible:
+    const: mediatek,mt6360-adc
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    adc {
+      compatible = "mediatek,mt6360-adc";
+      #io-channel-cells = <1>;
+    };
+...
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
