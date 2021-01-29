Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC225C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:12:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8197A64E62
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8197A64E62
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UH+uBHrjEmKFFrAsnC//2/vTWUqctNjndgDHn2EysEM=; b=D6K1V2jPXe4DvX6x+L7sFv/Vw
	vtMYdg/Vrevic8TbABgAIZFAdN1S1aN1w/lCmtLaxulaAj1kxFLqwF468Per+ASVuQ7F6x8PYTqrB
	tA5GNfpyBsmXElkT4bDKwWgz4+Q2dTDDbCfHIlPRVoZ/lXGs2KCjgDENpi5Q7t1bMDgY+ZRwwZ0sj
	lZkM0qOt8vg3xB6V6u54mpZvE9mqz+KH+eVycdc3KDizwt5mBbOsIJWUNoxqhanFOPFQjRl+G3blX
	GYZK1bC6TNJVDK7DeCPDF95Aao4ftPtpsnh1+77nJHZFk5EIIRFqlQQEg/9jj2dCWEf72HhrapHJI
	Ssrq0ZOcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QlL-0000b0-Qu; Fri, 29 Jan 2021 10:12:23 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QlH-0000YN-7p
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 10:12:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d13so4997117plg.0
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 02:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Q1gaJlN7GWe2x19ZhaQSHphrQHFchOaFImEFcFfFXk=;
 b=BteCdaU5hoqyjPm8sNTydA6b8KcXnxTp+2nWI/0jOKSm7g5BPjOJDTlFlR5O9GzNON
 Et+QwypTcWWSdChcA+NWEL7zVd3sdClOAMDDJn55uGrP6h+0LOBXYahlhEDttM5wqldO
 WjaByyaTnZpM0eOHNAOzKDfRhSo7kn7MhAY6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Q1gaJlN7GWe2x19ZhaQSHphrQHFchOaFImEFcFfFXk=;
 b=rkJIcNex+0hQeVP7k31jHoIWGt3s5+m+ZwfiymQR97wXSGeXy500c03RVKoEwTeNYv
 azggD2sOoyQ2NABR17FtXGa1MIkau2hTkTKYEt71BwVCqSbIEPf5+dnZvoS+Ma64AnIH
 km0TrRMAi5VCk8iFB4miLloLghmsl/e2ZRQoA60rruulYP5Hvuhi7Wm5XIm6rse7BrxW
 R8AQSAXvNC0ui1VS2xyy74lENExPHHbGRizdsAbRnmUmi0hjQSSsH4DbEck4UfMF6yFU
 ZRfV8UiLQa6bAYC7n3wjDadlKrc46gjI08iQbje6vJ+AnfstdFEmsjzzQDp9RsKiCkFc
 Jjnw==
X-Gm-Message-State: AOAM533UsiLpXLOR+Qj/Q+/A5sv2e/C+Rci0LGTpK38QWwzF5eGxovm2
 D9BGdpp/R6IPcLMN1HxfSyoV/g==
X-Google-Smtp-Source: ABdhPJw/8PROvYVtr+OMoceWOKulAxsU4rDf2rxOdYdBIaU5M0B5O5emm78p/yPynJfw/SfiHH/19g==
X-Received: by 2002:a17:90a:9ac:: with SMTP id 41mr4094669pjo.46.1611915137003; 
 Fri, 29 Jan 2021 02:12:17 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id a2sm7532533pjm.51.2021.01.29.02.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 02:12:16 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: power: Add domain regulator supply
Date: Fri, 29 Jan 2021 18:12:06 +0800
Message-Id: <20210129101208.2625249-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129101208.2625249-1-hsinyi@chromium.org>
References: <20210129101208.2625249-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_051219_311752_F013BAB9 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some power domains (eg. mfg) needs to turn on power supply before power
on.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 .../bindings/power/mediatek,power-controller.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index d14cb9bac8497..e529586af5a12 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -82,6 +82,9 @@ patternProperties:
           be specified by order, adding first the BASIC clocks followed by the
           SUSBSYS clocks.
 
+      domain-supply:
+        description: domain regulator supply.
+
       mediatek,infracfg:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the INFRACFG register range.
@@ -130,6 +133,9 @@ patternProperties:
               be specified by order, adding first the BASIC clocks followed by the
               SUSBSYS clocks.
 
+          domain-supply:
+            description: domain regulator supply.
+
           mediatek,infracfg:
             $ref: /schemas/types.yaml#/definitions/phandle
             description: phandle to the device containing the INFRACFG register range.
@@ -178,6 +184,9 @@ patternProperties:
                   be specified by order, adding first the BASIC clocks followed by the
                   SUSBSYS clocks.
 
+              domain-supply:
+                description: domain regulator supply.
+
               mediatek,infracfg:
                 $ref: /schemas/types.yaml#/definitions/phandle
                 description: phandle to the device containing the INFRACFG register range.
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
