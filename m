Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB20C4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:54:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E0BF20709
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/NpU/ul";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvzERQVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E0BF20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1ePOpEtoYalVjmtxcA93AEdju+W5MR1asQP6Um3RDQ=; b=A/NpU/ulb4PJSk4xc/NftTkZPR
	whekIGaZmb5rcjeKYJGn8fQ55sMe7X6BQOkOlsofqHS7KecOgXdCZ38nN+FToVvm6g9TI0MV/TG7n
	dCtfiZBUcwSHKL9lbImTq5bBVyEjYjDs6DIOdoLeh4ygGopWMjmCaMux+v1VXNcoNwaDrgfyHpD1l
	FcKLygJq/irHVh+mlQirTDAZtp+N8pQPzQZOtFabL4cDVMrqGXb/qrB+SsyEnepJpTNszizhtEjrX
	BRV3I6hpIXTxyVBobT+JhiyuWQQ/eh0gq5Tfuk+FJ/hXI3pZYI/0EQYQPXNXt5MytNYbMpIYoo3yH
	mYc1Q9rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXsk-00024D-St; Wed, 30 Sep 2020 08:54:38 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXsg-0001zr-5O; Wed, 30 Sep 2020 08:54:35 +0000
Received: by mail-pf1-x432.google.com with SMTP id l126so721918pfd.5;
 Wed, 30 Sep 2020 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R47c8IJlDfJaqH2Rm6EUjlvpHInRK3+ab54pNsvjd9M=;
 b=JvzERQVQPGqQCN8X2IH9mVeQmtRCPSP5Xf2uIxgztZo79fyP0v4tUCcWoJqUzAFipA
 Tt0hYEKiz4cTZHu80aD0k94E3JcSmJpomI7tYqIkNnHsnsHbdSn+845KQkKcCobvSB75
 clkt/YUSBCAEMRXJRc2LamkHdF/vq7fjRLvlBqmBEO8YC5NdbU4DFglPcSZM9lEpnNX0
 +pl6xLTLY1CR7G8a6Y0JAVXzCBWlupctkvdhmMukszP3K7IcmQTBK7OMkMUUXh3VrJPp
 URB3Gys5hUKcMr4Fu9bSfwCSxNVhnGuRrtlEY1LbpWD/sZqTUqm1RZZAx8HZJ7XdDsKZ
 SqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R47c8IJlDfJaqH2Rm6EUjlvpHInRK3+ab54pNsvjd9M=;
 b=VisOHOt3adK3XVNrtePMAHRSCOwZg4caoPNKyPvk6WWJCzuvB7/CW1YHDVNmWW2x36
 Y+h8B9wF8RbysO1nLK4R8OC9k0VDFnl5Uvb3dc3jjTJa6e+OES3nrEDMb5o8hCDbA5G5
 wUxcCAnttUEWCDgTTwk49zAuNEr2hYa9E6ikQQa8sc1uQy72K/fqpt3fcxX2XsKBf8rr
 fWOv509TCCaArtvmP7dd4MvP3dsLiuCvP/yFsijMUDUv4W5iPmJhmEMmoSmoqEHNVhb3
 E0uHmx90VhCnrHmVMCiw0ZjMwmDob7Utq9VWFaIrKcb5afXkiYfRotH0+8r0SDuS5Zw8
 G5OA==
X-Gm-Message-State: AOAM532PskQ+ajJXEhwm3tRbjs+UjjRzU8WEO2O7Sn+B8nJJr7s7j1Q8
 g++VSIJUEVxuZCcrM3GkfdA=
X-Google-Smtp-Source: ABdhPJwzr2vBL5N2ejGDjUjQiOUt4onfhVWvhsNawi5014zLNf+DNWB1b9pUsQVkmNnNhZcLXT7Faw==
X-Received: by 2002:a63:e94a:: with SMTP id q10mr1353780pgj.189.1601456068133; 
 Wed, 30 Sep 2020 01:54:28 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56b:d17:8c76:3dc4:5429:d7e4])
 by smtp.gmail.com with ESMTPSA id
 x13sm1513938pff.152.2020.09.30.01.54.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 01:54:27 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v6 1/3] dt-bindings: iio: adc: add bindings doc for MT6360 ADC
Date: Thu,  1 Oct 2020 16:54:06 +0800
Message-Id: <1601542448-7433-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_045434_252947_BDB8C6ED 
X-CRM114-Status: GOOD (  14.90  )
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
