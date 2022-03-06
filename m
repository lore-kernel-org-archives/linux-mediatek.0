Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBF0C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2kADs4/e5Z9Rk5VcMFAUF1KSn4I6jPGAMGzfrxiUus=; b=xbkxPX7lWSyF5I
	sQB+G3UdwVurAv/OpAzonwtx8S7AF4+h7strynCnlblGMFIrak4qriJTes+y1tuClJLncBbkdSzBL
	/5ltksfQWB4EkFe79pyrLINVC8uQzr3ZVIKVCFP7RD8Kt76j4fFmrir2hG588+3L2BmMrbjTxVPZL
	ol+4rjcCD/oD9wMTv2rsrXo6i8jsUDUjdAuCRk/UE03OxYyOZsTwXAmgfC3R93e4/pCdzpl8leHQ1
	cyNkLaeoFlmw2hk1y6KVEQW4GdqplxFnU63HxEzxurLBnHv1DQBJ0zfbvOqyUawVz+kOwPrBZ+H6G
	c/8jW0gjj7NZ3RByNtsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQoo8-00EV7W-Ro; Sun, 06 Mar 2022 11:12:12 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQonY-00EUpw-7Y
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:11:37 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EA2F73F637
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565093;
 bh=l+3yBFGs2kRX1wnF/pKhhZHPFcB8pp4apl6TxfDIAEo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=cNaou40RPlvBhEhsJwKhPo6bGSoddqMe9MgHZCG9Jb2UvptSeUqi4YeEgCS5/2SsX
 FXECURlxxqHJ3t5jsrjVRGj+Qy3g0+Ne3NKJVAVIwMi7zNdhHo/KwLQTkq2eXAnHGK
 /oPD3YcMzb5W5h7cNz302qKYUF/ZZ0rzr4GYx1+C471gNOmpV1tfOUlr9EA42/xE4u
 wGclw7t9Oo3Jz46gQaEor5Pgjwt0e7DgXJDL0wPJuhI9hbFAFLgQZR8ApFfpWCAT59
 szwUrzxsvny96weNlj4vDtYyvvmNp5Lr1lQboLNEAje+9XQAXdvF4djXmYOTLXhcze
 YZSjtKi0EUWTw==
Received: by mail-ed1-f72.google.com with SMTP id
 y26-20020a50ce1a000000b00415e9b35c81so4493443edi.9
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l+3yBFGs2kRX1wnF/pKhhZHPFcB8pp4apl6TxfDIAEo=;
 b=Gjra2sbrXLFiKDABiLWaq8DW2sprK14WUs3+6ftMVEavj78tHLc51pjWIA/9cNfiYw
 0YW2tuHK6sXZuXRjYYANKBKdOruIuFYsWNQAuWJGRjRDBDgk2DT0ion79zJ4Rvylt4yA
 zR+J5wCd24vMlHSVbRcBscJRjwnmhJWyn6reCcDJr/JFplajD44gfWy28hJXooDmIaMO
 YVwKEVfZUZ5YIxeMAAheCtaGMl4xq9rzy+Xi1YQ5HjIuG7ZvMP3I6OwEfidxdKQDlFC1
 rYX3pcUTrnWztM1S4nJFMybuzsQ7ZmtNl33dkYZeq4sD1k8Od0cGRwUMtTfkLs9nsT7X
 S7fw==
X-Gm-Message-State: AOAM530Gqsct3kla1lbnF0wrhc2NHf/+R2uciyyqofAFBnDZLQv1noWg
 xB5va1FgHuISx9UXjd8xMkbf9E8rqFKXtLCvI52ZHC9Gpz2quFyUmgAsoRWue5wWXg8QjJjkv8C
 ck4wqNUup/xKRIhTcYz6X/nwdly0L4EydNUgpV89JTuUHQxmo1Q==
X-Received: by 2002:a17:906:2bd7:b0:6cd:f89d:c828 with SMTP id
 n23-20020a1709062bd700b006cdf89dc828mr5685970ejg.232.1646565093013; 
 Sun, 06 Mar 2022 03:11:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFqqBEGSiJykeoRQrbuWpAeTlK57pqo/2+l/saQ7OCHi1VkQZAPsAbz54RGXOqql4jg2q7ZA==
X-Received: by 2002:a17:906:2bd7:b0:6cd:f89d:c828 with SMTP id
 n23-20020a1709062bd700b006cdf89dc828mr5685937ejg.232.1646565092784; 
 Sun, 06 Mar 2022 03:11:32 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:32 -0800 (PST)
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
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/12] dt-bindings: ufs: samsung,
 exynos-ufs: use common bindings
Date: Sun,  6 Mar 2022 12:11:15 +0100
Message-Id: <20220306111125.116455-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031136_430170_1EB21ACF 
X-CRM114-Status: GOOD (  10.81  )
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

Use common UFS bindings in Samsung Exynos UFS to cover generic/common
properties in DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index 95ac1c18334d..c949eb617313 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -11,12 +11,11 @@ maintainers:
 
 description: |
   Each Samsung UFS host controller instance should have its own node.
-  This binding define Samsung specific binding other then what is used
-  in the common ufshcd bindings
-  [1] Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
 
-properties:
+allOf:
+  - $ref: ufs-common.yaml
 
+properties:
   compatible:
     enum:
       - samsung,exynos7-ufs
@@ -47,9 +46,6 @@ properties:
       - const: core_clk
       - const: sclk_unipro_main
 
-  interrupts:
-    maxItems: 1
-
   phys:
     maxItems: 1
 
@@ -67,13 +63,12 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - phys
   - phy-names
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
