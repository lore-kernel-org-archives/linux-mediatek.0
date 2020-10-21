Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1E7C56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:42:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A7321D7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNcUPzUJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ejJUXrzh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1A7321D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6KaFPcta3FI5LbWsJPG+1uIIQLnLO6KE0DbdLt+J+qI=; b=UNcUPzUJbxWwQylMe3yPcewz7
	WIC1fbejHCgQl/pRXM+sA2RgaM/NWX5CVQG3p7AIZjxnmfXL9CKjEAHyvCnFWK32RORNyADl5b4O0
	6m2xMJA0PBP160aS0pRDIEV7uqwgW4NNpfBObqqlSUnzTcfsUtjOcIutKjU52/ULFg4Hy3AXju0K3
	f9apzgY9gqIco0i86EuGFQfNTBI5x//E6j33IDBcWLiMnsPRUX3PkYjNWUbt24xAWJvqRfcmnPPYh
	6IXQR1R7fzwfL2t0Vn/+SK3thoAWCIuNkGiLtGdxpughTh+Yr+OxSA6UijZ7PDHCpJdW1it+zm1u3
	GBhkgp0Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVHCJ-0006VT-5A; Wed, 21 Oct 2020 16:42:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVHCA-0006S3-2m
 for linux-mediatek@lists.infradead.org; Wed, 21 Oct 2020 16:42:38 +0000
Received: by mail-wr1-x442.google.com with SMTP id n6so3747845wrm.13
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2020 09:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJ1aKiINz0LrDU7aEXlCXE8tQqMpnuCeNmVOG6Ww0Oo=;
 b=ejJUXrzhfpQggo3vO73m1qC2ZK7LYm9EZfc6A/LtRy5ByuRubgYG+fwFBIu/0V1H/2
 jTA5a9YkArTcVWbMcngRM0EWvr66+7EAn2ztGJMgE2LmPfRwRLKjZx8WdZyUwcaVPyqI
 9yLQ45kLhXWMK1Ewzxsxh7thE//owACHFh7d/XjLVC1rFo6Fdc6vuappjtg05+7Zl+M1
 lvlNIjnjClBhbepPGXcvJFciSUDz4kvHnJGltnpDGllNWmTKEv/dHFfb8dYOHohXlUdI
 ihJ/JE2NIGn/uhQ6bNEChusM1zoVZja207abAl9HYHeFYeldjuCCj5mbY03a4VwSQUJG
 yS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJ1aKiINz0LrDU7aEXlCXE8tQqMpnuCeNmVOG6Ww0Oo=;
 b=FDmBO26kx+0YsVDEEufZ1oJmLrJeim60X2ogTB+qKNsXo8s34PQbVDVntwaCcFiPXQ
 tgofzKbTPHp8ANELNPqP4QfShchM2Zg97NZcoF7LKNY4UshT6ucgQFRrZNQCEwIfsK1q
 TZxzpEVx1afMs09Oyeecchq9c5eCOqZUH0wmCXLWDL0px6ZfhaylKddDx8UyMBVyV9vG
 j2SKuj873pxS7h9adywhm6Eby/yyiyCOTRwoUWqLUt5WlP+1ga1z6gfdSGgYrdNblo9R
 0lmXYBpmTNenlPsLDHDAWN604uHOmbqf+SequAjW49KQOAsANAEWWPeCzAmulbPpQgxA
 7+CA==
X-Gm-Message-State: AOAM530ZY/ITkDldn65aeCjTWxU9RrtZbSWF3pCU4hylLNK22eTNanw2
 tnj9KiSbxMt/yMJJocfk7MrRXQ0+tD9Pvw==
X-Google-Smtp-Source: ABdhPJx73zW9wIrp01tKrd0AfCe57dEOyLM7D7HDQ0Xn+ABvJXdf/J86jJpZPTzBTZV6B1/xQWM35g==
X-Received: by 2002:a5d:4fc5:: with SMTP id h5mr5545357wrw.145.1603298556934; 
 Wed, 21 Oct 2020 09:42:36 -0700 (PDT)
Received: from localhost.localdomain (58.164.185.81.rev.sfr.net.
 [81.185.164.58])
 by smtp.gmail.com with ESMTPSA id a3sm5321724wrh.94.2020.10.21.09.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:42:36 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: thermal: mediatek: add documentation for
 MT8516 SoC
Date: Wed, 21 Oct 2020 18:42:30 +0200
Message-Id: <20201021164231.3029956-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021164231.3029956-1-fparent@baylibre.com>
References: <20201021164231.3029956-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_124238_158630_43B3D92A 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: amitk@kernel.org, daniel.lezcano@linaro.org,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com, rui.zhang@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MediaTek MT8516 SoC.
The SoC thermal IP is similar to MT2701.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 2d20f6b0dca0..5c7e7bdd029a 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -14,6 +14,7 @@ Required properties:
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
+  - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller
 - clocks, clock-names: Clocks needed for the thermal controller. required
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
