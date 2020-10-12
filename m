Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B19DC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 11:39:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29D67206E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 11:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nJKLcCjn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fGv2d15x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29D67206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4dYCz14FJ1hHrAF+CrGXYFYVsNixIpfpfF9hF97ObT4=; b=nJKLcCjnOaj255Rt4Ogo/yixal
	OoA2n9Mb19gQrc77NX4ybrqEt27px6AamOItzCun+OEW09aROShCnLEEwaHLZsvRV9svERSCfh2cc
	V8EXZQK2nXO8FQ362B9M6ME2FZ25TJ7iRpaE2NKmclSqjb79HIkf3tOe5twhPypkGpti8tGbHgJBv
	eC5UPSY3+TblE06LGnK3xldMe2MS4zLzdMNo4oTJxUx0m3gIWBl3ss2AtPGWlHtwVc+2go5wWxkb+
	dNaPMxdQYkyyEQiTpT/0Dx1nowgHdtyNtu/KnqDSGUEZKFvFMnCTEKD9lgrAKZ2aq39FaxbhzZ7uc
	rXgBB4mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRwAN-00010e-2P; Mon, 12 Oct 2020 11:38:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRwAG-0000xw-Qv
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 11:38:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id x7so10193285wrl.3
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2020 04:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=er1O3yHYE2dfZAtg9MYR2G3dWLGNVrruH1edHcefbnw=;
 b=fGv2d15x8t8FMuQO7gEdPG/kMbWbRe2GCYErOzN+qYTexuoeqeQ13RVl4Re6jAm4/J
 R/mnTWb0U/1ir7iJE4eP5u0riKeXNPrnIlPiW9uVzgL8zlRNCbx1GC4xqtjjWSHjMZvT
 FvIYfcncwoTVI0IOtaNH62YzTzByGH0FsXiLvWIgOuKidnowQlD03XWFPxJQppPrE4AW
 T85FGuPH5Z0bZnZgABhqdtXBDCZeIglD6Y5W94LxvC7B3mLwHHq4vVGtajSovmxFOYfV
 9FC1DbUH+aLAU5IIsbtI9OeoIkudCr9gSMicBLbZfmgzX+W4plZn95pIsa/RvzK8qvAF
 BnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=er1O3yHYE2dfZAtg9MYR2G3dWLGNVrruH1edHcefbnw=;
 b=pXRjUOPumwZAkyPqZpFXFeuSZRIwUR+Siy7mOoABT+s2j7MHGE0NNbtXNovUc01W3s
 LhohKD0ecYFpHuPf9H8wLtYl8ALyaGrOoxKfB1WBsSQ7CWwysz86Vfd63Pe+3IEn9XbV
 aX7uiWGIt6jdovlJ0xlZ//4nxPWom6fLsvc574I4Ghx6YI1CAm+/Ct0ZGOAkhnU386c1
 w7c4z68VJ88K4FSBOTlJS3aFl3KEF80HzLmh7VuklgRBrS0HbHPcso8vpI9vTm/BIuJr
 SvgJKL2TF2qnNtUcXZGsaDp97scBRlPpXuDf3A7LMzB8eaTF/wMOSrc/dCcAw7a8bCXO
 JgeA==
X-Gm-Message-State: AOAM532bAsEJpFAiOZrzeMAPhKpnZ4mxhFQPHrsfmIRYUwrkUt/H+EC4
 39rMZiUwOG5ygBWTeKntUewp/A==
X-Google-Smtp-Source: ABdhPJziaYfK5ROz2ZhqIXhTGzXACuyMOEE9XE8nlHbMcsWpb1lIfGcTo1l9oqBQueuCIUPQxQaDAg==
X-Received: by 2002:adf:9e06:: with SMTP id u6mr29835150wre.208.1602502731842; 
 Mon, 12 Oct 2020 04:38:51 -0700 (PDT)
Received: from localhost.localdomain (170.175.185.81.rev.sfr.net.
 [81.185.175.170])
 by smtp.gmail.com with ESMTPSA id o194sm22378065wme.24.2020.10.12.04.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 04:38:51 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, matthias.bgg@gmail.com
Subject: [PATCH v6 1/3] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Mon, 12 Oct 2020 13:38:38 +0200
Message-Id: <20201012113840.396358-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_073852_878433_FCA8D9DC 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Rob Herring <robh@kernel.org>, dmitry.torokhov@gmail.com,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org, lee.jones@linaro.org,
 hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---

V6:
	* No changes
V5:
	* Rebased, removed regulator documentation because it will be send later
	on in another patch series
V4:
	* No change
V3:
	* No change
V2:
	* New patch

 Documentation/devicetree/bindings/mfd/mt6397.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 2661775a3825..f051a951ba72 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -21,6 +21,7 @@ Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6358" for PMIC MT6358
+	"mediatek,mt6392" for PMIC MT6392
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
@@ -52,7 +53,10 @@ Optional subnodes:
 
 - keys
 	Required properties:
-		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+		- compatible:
+			- "mediatek,mt6323-keys"
+			- "mediatek,mt6392-keys", "mediatek,mt6397-keys"
+			- "mediatek,mt6397-keys"
 	see ../input/mtk-pmic-keys.txt
 
 - power-controller
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
