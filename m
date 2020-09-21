Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898E5C43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:24:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17CD8207BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BHbPFvK4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5w/Heos"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17CD8207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1ePOpEtoYalVjmtxcA93AEdju+W5MR1asQP6Um3RDQ=; b=BHbPFvK4GgRifUvVYd54OQzZVe
	1zVsEDC1ywDLXoKKo9Htec9SfiDdwK+obgI4Fw9wTQJzfSCFMh8F7DyhicjBIO8w35ETJaFlcgSqo
	MUkdwBGfC2VndOzMkhQhFujdKbgm8wWwYOCWzz07J6aqdZKn19r4XJk1aecgm5Kdzv5o6xajQmdHI
	L43gY6bJRHtD50BB0tqrr3A0DHRY1BCQhkVRl9ns29R5tNtzoRNrs+1WLjT6SZoyU1/VHKMs3K89l
	RCvZX7+1e+ZnxQnn4qzWKC+RN19bnhXesXt+lwCeqn8Z2X3gejDdpzP1jl3Qq9OB5Xa3E8BdWPbV8
	RpOuVbcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKJvn-00038G-Tj; Mon, 21 Sep 2020 11:24:27 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJvh-00034M-3u; Mon, 21 Sep 2020 11:24:22 +0000
Received: by mail-pg1-x543.google.com with SMTP id k14so8745642pgi.9;
 Mon, 21 Sep 2020 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R47c8IJlDfJaqH2Rm6EUjlvpHInRK3+ab54pNsvjd9M=;
 b=J5w/HeosvzO7XIIFoWtyNmMMiub0Db+IHevN5Sj4ysEnqIaYa+x9wfXgLFW+AWLG6j
 eRCgWNuCsyHd4no7pGNCAcUxezBHzGY2CKIBkrcSm0vjK3bDGg8K9UCnn0sAzbFGtR77
 cgPDOnEX7FjUUO+J4ZbRnYO1uHrb+edNh3XGRlbpRoj9Z+g9oigdbeJ8MrpQJDRCd0Vj
 lJgkuaHXeLGh9/bCA65XTPj1+NCHa8LXhbJC+bemsWUvo2cFWlGAiEipNR/BXhC2HeiX
 0lWNs8DxMfyJ0hqxdr3Ip6d/0AhKcKF+4OgzbHJ0RiCNyzfM7alpYuUuK2fHbJ+mpduF
 Vpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R47c8IJlDfJaqH2Rm6EUjlvpHInRK3+ab54pNsvjd9M=;
 b=GJANNN0miwRVplxRKEyQ66dYQd6ff47iSKbyuBIMz7So99wdWiBtdU+iXhZ8ceqa8p
 YVNbuVfhnJ9+PwbQ4UhGcsnua0i9OmpsCNrkZVgsqjwkrh4HBcaz252KBlqWf8W95o+O
 GmZc7SeNG+kBAwfXxRC+3XX6eGpplhbRVb3bruLHLfEUj7hSxgYgXFFJ5JYn9YAmF4iM
 xj6XJwfmwAzQS1xstQADgbiMPpqRdimS74TrNSOoSKIHR9UJqvmqpu/vAPqUablYQRXI
 tIYJCvNSUiJYapvMcPCML+ktQZ7Us6wy5YSJEhCUQ2m23C1FY26CQ8dXHmvSTY3naSSQ
 j5RA==
X-Gm-Message-State: AOAM531UPCNEKL+vxZe1AnvF6Fyqyt6oSXDTHQ5E94FJvqhAxEgImb2S
 Ij9y0jNM05yn5SpHwdsvCak=
X-Google-Smtp-Source: ABdhPJx97v7qwdIXIkbCSicpl9/UNMxMCPfFKlRoFY5LsNRsmm8+tQukuQcEw6iDvEUBxNXjPV8X7A==
X-Received: by 2002:a17:902:c1d5:b029:d1:f2ab:cf6e with SMTP id
 c21-20020a170902c1d5b02900d1f2abcf6emr21808980plc.67.1600687457048; 
 Mon, 21 Sep 2020 04:24:17 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:8024:8a0d:5d5f:6f8a:a2bd])
 by smtp.gmail.com with ESMTPSA id x7sm9978663pjv.16.2020.09.21.04.24.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 04:24:16 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: iio: adc: add bindings doc for MT6360 ADC
Date: Mon, 21 Sep 2020 19:24:00 +0800
Message-Id: <1600687442-23658-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600687442-23658-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600687442-23658-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_072421_250952_A86D8328 
X-CRM114-Status: GOOD (  14.93  )
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
