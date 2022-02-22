Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD7FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGdysWXIcXWQG3+aMDO3iedF13KEdBBZFtT/gbK1mtc=; b=S3RN0NdB5rOYNK
	r5RJ7x2Aql10e+8RM6c48wFijn8hdMPB7vMH6DN1in8kr1tOarzf4LDNcAPUotADbyb6PRr9pPZFH
	AmAKXmXCj5PAicGF+4UvfNDwFKnZ9/hz0OZxr3xaxYTIVsGG667Skjrf7Aot3yZ+3c9xjWcRzslMI
	uaolf+rPjP/2YvhdX1N3VUhfC4qvG+z8kWIFDk220rqhW4cbECWfClhQRcmaC0hGNobJh5J/hZPkw
	2gvKm5Ry/QCmPONcEHk4YnSLMbYM1FB+myC+4s3iuHbjJcvOitBN7VEJGEygyS6NJfV40XPTvw23O
	nOtRsc1Vd58kR54wqG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWfH-00A10q-W2; Tue, 22 Feb 2022 15:01:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWds-00A03R-TD
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 14:59:57 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5F5D9407C5
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645541984;
 bh=74/pBhghHeWH7/mWTs7/IJw313x+oiYcimgGGTWLW0I=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=niBofM20C0r4XBxO6g+H2P4uTa1vJxPqXFwSgzAvoZ3Kr7g6vjTigfXg44iUkc1+x
 YzCVKMCeGi4bYA6ZB4yF+/naHtftl/Z1Gj6jxMyFDl8WX+5qiaE5vQVFNtmNh4IXc2
 Qh+WPZLDIUctGQhFHSWH5qU/+klIPOEu24U1IgPmc58L97d0X6ZZ71eqrUIKBmggOs
 174OS82nOAf1KCoEDeoB0u8OFctK6Iw1Oq5XGwmMYeB6flvEqHQ/VQmaHvtc1r24i3
 M6p4lgg2IbMmodnpfNTXDG0xckK+pFWzy7JS28B2sHvPgxxShHUm5JeyQRwfHZ5eJJ
 HXjqCloVYl2vQ==
Received: by mail-ej1-f71.google.com with SMTP id
 sa7-20020a170906eda700b006d1b130d65bso1937740ejb.13
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 06:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74/pBhghHeWH7/mWTs7/IJw313x+oiYcimgGGTWLW0I=;
 b=vhlK8PNYuf7yQBsB2aGZXslz58tvQp736owNaO0QL4rsUqPmszf0pX2PWHMR8sb5/H
 Wf0UZxlioUcrx6rDVBI4XdutEMpbUcAhlUOFWL/7d33Xh1Q1o9yb1q+EFntDpa2D4Lnm
 yv019rZl2SYuwBmlNhT77UUuFLDpa3zW/fDjLJ0EBuSKRChUz9tRFglCIQS4rkXdSnAB
 e8NbUExHehh0dHnJ/KbZfvsQLDL6b4DVuyhKktQ4ucrO/4w/vl2SUv1HHB0p5sQ6sYxW
 oe10abRbyYxAcIPtccUqT1z50lXnX7oS/6UF3j1a4iCWEbfIftCPrauoy1Cpw3khQeyV
 5ziw==
X-Gm-Message-State: AOAM530guoqFDmdl7y8XUEUuR+eV33x4P9Op5fQAQdA84oArr3z1tJe0
 eDj0W9ZTF3JOpRC3a3hxmADzujKrEX57yTNM4znakRFoZXEVxKUIBrrAYBMnuXyRUe3F8XVWLbN
 5wi5Djgx4dihmnxhw0DTkRfhBUI9liqdgVNP6rwDy0ALgM+VFvg==
X-Received: by 2002:a17:906:194f:b0:6ce:3670:92b with SMTP id
 b15-20020a170906194f00b006ce3670092bmr19235888eje.737.1645541983456; 
 Tue, 22 Feb 2022 06:59:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnm5ZDMw7fGj3UZIRVOLHmbWI713Qr92YShXMsW7GfodY/Q/WqKceA948ZzJpTHBhv2Bc9gQ==
X-Received: by 2002:a17:906:194f:b0:6ce:3670:92b with SMTP id
 b15-20020a170906194f00b006ce3670092bmr19235863eje.737.1645541983264; 
 Tue, 22 Feb 2022 06:59:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:42 -0800 (PST)
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
Subject: [PATCH v2 02/15] dt-bindings: ufs: samsung,
 exynos-ufs: use common bindings
Date: Tue, 22 Feb 2022 15:58:41 +0100
Message-Id: <20220222145854.358646-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_065953_204710_C5EF596B 
X-CRM114-Status: GOOD (  11.34  )
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
