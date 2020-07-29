Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1F2C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:44:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD3F20838
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AUQ5lA2K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yike37CL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD3F20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eam5iip8LWiBzVkMaOXWHOVhiJuntSyB+prtM7DdxBA=; b=AUQ5lA2Kr2C/DvUV0fZpqtGfVU
	CIhmj4nbWpFedvZmRfLPLRdBlmxKWyFjybSo6iKK/QBlZGeTrwBfh5krJ/20AsfNl563d2PqsIzwC
	ofXqzZjE6ZSEUH0EFyw7PCZWBnvbGnhBGX9ZXhii098VASsJg3cNmmnG6Nw2FFU9OZjeZvIAZB9ar
	7zhqPOnbuSdhZ0wmzTKuqy644YqKxOfV0TkA2rBHoJmxteoeXQhUArW9sBLpKdNJFWP8b23aXz2Iz
	r3cWbVAGkG0SjRG4REV0DJVB3jcB36yUd4H4r9XjzRRKN8euA+PJr6gjGiJ9v6p3UYhQYeaVrRTT2
	J9KGaZ5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0glI-0002Vq-Ia; Wed, 29 Jul 2020 07:44:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0glC-0002Sn-94; Wed, 29 Jul 2020 07:44:23 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B964D20809;
 Wed, 29 Jul 2020 07:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596008661;
 bh=EAAEADU7DSjaLvXALOCEsiBzv+cV9IYKsedOqf641lM=;
 h=From:To:Cc:Subject:Date:From;
 b=yike37CLVQmHz0JUqQNOKjuZ3Am1/pbaBIWrX2PWKJHTCJ5QY9PKb6B1SIA/HVxhu
 Tot/6jU8FXITkwE/DI3HTqeqIdmxRg7Bi+QsHhamZDK7kn+9st8Cp+AWJ3i8624dZ1
 gjFvMo05FB5c3t4plz2TvdczGhJgbDX8bI3q3D8E=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] soc: mediatek: mtk-infracfg: Fix kerneldoc
Date: Wed, 29 Jul 2020 09:44:14 +0200
Message-Id: <20200729074415.28393-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_034422_408123_D6CC9EF1 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/soc/mediatek/mtk-infracfg.c:34: warning: Function parameter or member 'infracfg' not described in 'mtk_infracfg_set_bus_protection'
    drivers/soc/mediatek/mtk-infracfg.c:34: warning: Excess function parameter 'regmap' description in 'mtk_infracfg_set_bus_protection'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/mediatek/mtk-infracfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
index 341c7ac250e3..4a123796aad3 100644
--- a/drivers/soc/mediatek/mtk-infracfg.c
+++ b/drivers/soc/mediatek/mtk-infracfg.c
@@ -19,7 +19,7 @@
 
 /**
  * mtk_infracfg_set_bus_protection - enable bus protection
- * @regmap: The infracfg regmap
+ * @infracfg: The infracfg regmap
  * @mask: The mask containing the protection bits to be enabled.
  * @reg_update: The boolean flag determines to set the protection bits
  *              by regmap_update_bits with enable register(PROTECTEN) or
@@ -50,7 +50,7 @@ int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
 
 /**
  * mtk_infracfg_clear_bus_protection - disable bus protection
- * @regmap: The infracfg regmap
+ * @infracfg: The infracfg regmap
  * @mask: The mask containing the protection bits to be disabled.
  * @reg_update: The boolean flag determines to clear the protection bits
  *              by regmap_update_bits with enable register(PROTECTEN) or
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
