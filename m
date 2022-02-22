Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E4FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6SeeTqX/QMlvql1q8lnsd9ru5QL+Ei4XsoPA1S7ywA=; b=g119AEJN/s2l73
	FQFqbpZZYZDFKyo3r1zR0fYdZVBcqjEI/5Lk4gwjVcI5J8FVz9Zs/5zLOsXckD7cr/MdrRFCFVy3Y
	Jhd3HQtnEJEpUT+DRial1ecp+MMhi4gbF9SvVcqBDdmpoB8Ltl2oNNu7jR6khex0U5W4CckIvwZs9
	9LknhVdxE7Kvm6kS9+9epj/83uUQYS4zpUtDjc7dJ8gtIHbmAA4TGghWRmOGCcMTVfiSS2Vdu9cNU
	eaIv63f2gJLxmTap2BsaXuHkIWXSY1lW4dk4oY8Xya3JKzghSvnaF3Ir86nnq4qTHZIiH2z8IKwfB
	/9FppiijoasmBZWj2/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWeA-00A0J2-U1; Tue, 22 Feb 2022 15:00:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWdr-00A03M-5b
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 14:59:54 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 74A5F3FCA0
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645541982;
 bh=S4dRVCvOCJBf/TgKU+SSH97N+njRRxFUmbUfADNYkMQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=tutXKflI6CrBnmxvsXIvLlXU1L62TQ6A7AytQc3LQ1J6OKnuFgmF3lsENv1PqDuW5
 Kk8kokRYQcoFAPBZLuEzEVy7bN51bXJI2Q49geo2sNTUiiUjVQ4LKKb8HZbTj/YFV9
 oPvy59NaHSczDcd1Fnr94rvYrpOirBn88FXaItUqMFjRmt8QjPWVY8dhZA4+t3QC1I
 6W6ibS0916GDoiRahtkRdqp+UtDTk6E8JEO6BW6hakFd9Avx5iMWDYlLE3Kal2awPf
 Rr+g9uYtAc/Y0a3DUPcoWi1kpAol8gMUcD2xCiS6NNh6aUfGRezPVrnCU8AvhFyHb6
 Umf1RFxbmPBqA==
Received: by mail-ed1-f72.google.com with SMTP id
 eq13-20020a056402298d00b00412cfa4bb0eso7278975edb.7
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 06:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4dRVCvOCJBf/TgKU+SSH97N+njRRxFUmbUfADNYkMQ=;
 b=AxAluC1ZmPPJKs3ayvKr6DPZfecPpVjE7ug7C5FvBOWRKKXit5uj10e1iF81FXhvQE
 Su0yE81iKlALJrM/WqqPO6VZK9QFWtGZfcvAqmgwgTAp4PzF39HOLsZADSGX75bGHka0
 fL4DUvTjJ/fy/rcrjuuOU5x78W/8uCT1St6VCjLdosYOU0qpYSUAX18BhE9NR4xw+a/O
 idBlEb6kK3fA1HfV1g3DFpgJs1t9ONKa/Welk/u3970BucNSe57PXBZ39L58jI9K11CC
 t/mf+fVI+0I02oODL+Dr83TvhGeprzcTv+jCWDJ8gIQNT/yLCsXVYhfwiBXNJQEKmM5V
 Zdkg==
X-Gm-Message-State: AOAM533I/1aCOFQ4wJ2bL9lIsKMJK46Yp9/+Hxt2E+b9tKmY4zTwdtgj
 ErLPt55bYWWhEEL+gl3QleTFWTwBnMZebAen3WCQntARTYdnQjd2rJNOQIiWOCQkgzQqtlJc1HE
 LgGTVm+a1GHYki/ZnfGVIPkF352T3IJIIwQJqg/+CogdIQpjXEg==
X-Received: by 2002:a17:906:cc8d:b0:6c9:6df1:7c55 with SMTP id
 oq13-20020a170906cc8d00b006c96df17c55mr19473156ejb.317.1645541982087; 
 Tue, 22 Feb 2022 06:59:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIhq541BP8xUfNXZfL1fB9MquqPsLmy1uzBQ8P2KwTPXTxvLGRbz9RKniac/wyFeuTOl8HKA==
X-Received: by 2002:a17:906:cc8d:b0:6c9:6df1:7c55 with SMTP id
 oq13-20020a170906cc8d00b006c96df17c55mr19473139ejb.317.1645541981833; 
 Tue, 22 Feb 2022 06:59:41 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 01/15] dt-bindings: ufs: add common platform bindings
Date: Tue, 22 Feb 2022 15:58:40 +0100
Message-Id: <20220222145854.358646-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_065951_358929_DACAE14F 
X-CRM114-Status: GOOD (  20.59  )
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

Add bindings for common parts (platform) of Universal Flash Storage
(UFS) Host Controllers in dtschema format.

The 'freq-table-hz' is not correct in dtschema, because '-hz' suffix
defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
and use 'freq-table' instead.

Include also the bindings directory in UFS maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  2 +-
 .../devicetree/bindings/ufs/ufs-common.yaml   | 88 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/ufs-common.yaml

diff --git a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
index 4d13e6bc1c50..dc93fe2d3458 100644
--- a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
@@ -80,7 +80,7 @@ examples:
                 compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
                 reg = <0x0 0x4000 0x0 0x10000>;
                 interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-                freq-table-hz = <19200000 19200000>;
+                freq-table = <19200000 19200000>;
                 power-domains = <&k3_pds 277>;
                 clocks = <&k3_clks 277 1>;
                 assigned-clocks = <&k3_clks 277 1>;
diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
new file mode 100644
index 000000000000..85c73d2853e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/ufs-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for Universal Flash Storage (UFS) Host Controllers
+
+maintainers:
+  - Alim Akhtar <alim.akhtar@samsung.com>
+  - Avri Altman <avri.altman@wdc.com>
+
+properties:
+  clocks: true
+
+  clock-names: true
+
+  freq-table-hz:
+    deprecated: true
+    description:
+      Use freq-table.
+
+  freq-table:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Minimum frequency for given clock
+        - description: Maximum frequency for given clock
+    description: |
+      Array of <min max> operating frequencies in Hz stored in the same order
+      as the clocks property. If this property is not defined or a value in the
+      array is "0" then it is assumed that the frequency is set by the parent
+      clock or a fixed rate clock source.
+
+  interrupts:
+    maxItems: 1
+
+  lanes-per-direction:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+    default: 2
+    description:
+      Number of lanes available per direction.  Note that it is assume same
+      number of lanes is used both directions at once.
+
+  vdd-hba-supply:
+    description:
+      Phandle to UFS host controller supply regulator node.
+
+  vcc-supply:
+    description:
+      Phandle to VCC supply regulator node.
+
+  vccq-supply:
+    description:
+      Phandle to VCCQ supply regulator node.
+
+  vccq2-supply:
+    description:
+      Phandle to VCCQ2 supply regulator node.
+
+  vcc-supply-1p8:
+    type: boolean
+    description:
+      For embedded UFS devices, valid VCC range is 1.7-1.95V or 2.7-3.6V. This
+      boolean property when set, specifies to use low voltage range of
+      1.7-1.95V. Note for external UFS cards this property is invalid and valid
+      VCC range is always 2.7-3.6V.
+
+  vcc-max-microamp:
+    description:
+      Specifies max. load that can be drawn from VCC supply.
+
+  vccq-max-microamp:
+    description:
+      Specifies max. load that can be drawn from VCCQ supply.
+
+  vccq2-max-microamp:
+    description:
+      Specifies max. load that can be drawn from VCCQ2 supply.
+
+dependencies:
+  freq-table: [ 'clocks' ]
+
+required:
+  - interrupts
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index aa0f6cbb634e..c2cff57d32f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20015,6 +20015,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 R:	Avri Altman <avri.altman@wdc.com>
 L:	linux-scsi@vger.kernel.org
 S:	Supported
+F:	Documentation/devicetree/bindings/ufs/
 F:	Documentation/scsi/ufs.rst
 F:	drivers/scsi/ufs/
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
