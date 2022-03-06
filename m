Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C588C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlD5y5QIx+mWvY665O5mgi9Bpfyc5aERqthd56oJJ6w=; b=mlNG7Zws0Ik20u
	oiUrUwxa0qscjLBtdWHzmaKiUHhs7Vv42bHkLpB2KAsBk7CgHmcZXDjRot0OaMtXxPNfssdekYNKO
	Ox64b8wnvd3tZq2HgrvuvYbjYxUJxuoid0kKLSkkYpAMicz9MmUfhMbdPyYE0kZaUC/d5nQL8DjvG
	OqychW2wbNb3RGpzIBL6zw44hwfP37jW7R/tqwmdfELxOWdZow7CrrPkEakLAjQb5ZHg6anE6uafk
	wGSc/TGpOq7RI2ep7i8Kri8O4Q2eREZcCuOd3gv5H+mTDlQ9Wof3D81TlLRID8TO7ysmSp3/NtIGI
	1OGMzyMYk54F58van++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQoo7-00EV6S-2q; Sun, 06 Mar 2022 11:12:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQonW-00EUob-5k
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:11:36 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7FE343F62C
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565092;
 bh=lf3L+0o9CMSrEd/gKJSlHCZX7vz5FnWuL1aM1XjlPVQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=FK2YQEGDxu8+/e9JpEnjdtywqATzRbm7vj1bzKWF8bkBB4LY6WLMKr0rCAsE6gg9n
 OHEl08qU28ztVQu6Vd+O/PdD23OFsNFs992Qn8vhIM/133x2RSnDQfrFTXvoEaXR0m
 4tPjzjX8OrPIpyiYPk7q+4tjrxuv88Uz+AO9463qu4Dd4tyLH3CcLMHpFPauK3rqkd
 MC/LrHmRwxR1wX6oRNUDOVO1rulRlRO+Pkg2KCP5copABSNKXF6+ANXUE8I8H+mx40
 8C26qolDHQz9IQAXOMyC7TVr3gnD+7hEFXTWyypesjM30fLBXLc5bWEmUeeni/e+EG
 zgHRcS2TXutmA==
Received: by mail-ej1-f69.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso6118798ejc.22
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lf3L+0o9CMSrEd/gKJSlHCZX7vz5FnWuL1aM1XjlPVQ=;
 b=d1J/o5Y4LBmO+PZ6sDwxdRVCFDpD3WTW6d6U81LgHmkp5iFbJPLOVedL+99BN6mSmx
 0K6fTowAThZsbF1lD7lIQn2PlQZMvopM7mf/CblPspw6eUJzIL+cvoyGakfVWroxjqah
 9usgQw8HVX/fLlgyhx6grAruseC7mOwUIggJ8ew50mWFHuwUIb30MRpwWNC7qjF9/EAH
 929oFCvubBg4GEPIfDq6nthA9XI2aHP5d//6J0C31TCsVzJFtxeOHi4ykiVbodXwu+Bn
 3GH8ghYEgDqoo5jP/ofCsOgT1HLzH0RxdKf0850kY7H648Sls6QfcCThUFBx24wI/oox
 0FGg==
X-Gm-Message-State: AOAM531QGntxEQcJbb7YX6AmFPeUHU6LdBAl6nyyAKv+mUVzmbNmw+RD
 UGk3hAutDO9v8K3att/kW7i2uOt5HV/BYn5jsajVxyS8UJ89xzHCFdYLTDyraSONmircLJodhkv
 cUtFnZRdKYQnQ1+T4Gox9uo/Cg1IIfsiH+y/M8hSsExmHwssGHg==
X-Received: by 2002:a05:6402:d0d:b0:416:1d69:f23b with SMTP id
 eb13-20020a0564020d0d00b004161d69f23bmr6273184edb.141.1646565091333; 
 Sun, 06 Mar 2022 03:11:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZtXPDKuzvvxfR2qyr8z+IQLrONJ/y+63x3Fbz/V1C7LxKea28+CanHlFXHMdCVOY2o4Xmiw==
X-Received: by 2002:a05:6402:d0d:b0:416:1d69:f23b with SMTP id
 eb13-20020a0564020d0d00b004161d69f23bmr6273165edb.141.1646565091125; 
 Sun, 06 Mar 2022 03:11:31 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 01/12] dt-bindings: ufs: add common platform bindings
Date: Sun,  6 Mar 2022 12:11:14 +0100
Message-Id: <20220306111125.116455-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031134_372615_52E655DD 
X-CRM114-Status: GOOD (  18.31  )
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

Include also the bindings directory in the UFS maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/ufs-common.yaml   | 82 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/ufs-common.yaml

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
new file mode 100644
index 000000000000..47a4e9e1a775
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -0,0 +1,82 @@
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
+    items:
+      items:
+        - description: Minimum frequency for given clock in Hz
+        - description: Maximum frequency for given clock in Hz
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
+  freq-table-hz: [ 'clocks' ]
+
+required:
+  - interrupts
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index d7ea92ce1b1d..ef16268b6ca6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20100,6 +20100,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
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
