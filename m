Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1625C11F66
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 13:36:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F71B61D90
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 13:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F71B61D90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaeMeRRWt4Kty1Rx49zzogSNsGDgLODmWp9ouLOAaos=; b=i8oawf2Yk6SZvu
	uR9bTltcDKPx1GNKuVJRMblzd4gi4rwi4pBXGdyapxVK/pq6lDs8XutFisRj2Zq1Ob8h351y59N4N
	lzvM0nDqurgh07GWI9ZdVW8QIFhutBv3uwcFoxv9FEtbUqGUCyRzNEfAsbkUdud03pOC4yvJgkYnh
	VBPLLtbXOmRUf30ZTWLyBfGkkVHn9bKRpw5l9sK4K2xuvoCEL2KRswUTiOquNsUymKMPo64lnt1Ej
	JIncGWjgkKD16L6um9+FUs6NZPRfUM+gfJM4PGBy+muZ59G/CrUdbyF94x9OLa/U+HZlFb8S7PpWh
	Ts1BoCSKhi51OFlN1j2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyDun-00B5Ea-JP; Tue, 29 Jun 2021 13:36:37 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyDQW-00AwMv-8g
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 13:05:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id y17so6158367pgf.12
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nrWs2dcQQbgOae2afCRNt5dMIBQMgs08LTHn8M2WFwg=;
 b=W/VJ9uwFGEFVmSckJPfKA46s+bbC+0CKNOIKrivOK33+cZviPX5bIEZzmgxz68zruP
 cEwvcKZs0Fx7bYKhc0HvaPZdVq2TpgFkgJhoQPg1pZ7jksgBl/4RerDmi+aWgYmP7Fy9
 q09cUx8sASxsTj100nus9BYQSpuhUoAQ+aDQdTlt5rJUMmE5HX6hnbzIWQZHzN/+v0HP
 N/cwf0qpNuN57gS4xvWR8zbkhanYUVjZopaLS3qTeSNgVygxWPjH5xVzb5WsEzW38t8q
 e1bTB3wSZ4gEd7mAnMX99N8m33LuL3t/3qwOdM5ktH43YGD8+T56qn+MQDaGC+JviEZw
 KlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrWs2dcQQbgOae2afCRNt5dMIBQMgs08LTHn8M2WFwg=;
 b=cw0UZ6kYpGMYdXbZaexcjpsqDaoLjop5OUy/a2+rNCgPlKonZkXJNLTY87IMBaEv3c
 aPiv+V4dR5NYHf7Va53NCtoFZHcUBD16p8ce6fm5tMkYQeKE2gHfh/8s3Gmo7PR+PvBt
 RyqZmigsBcK9lvSgp63upFGVgy1WTQEMDsE4ZoD6nV82AchQb/JLYHNaTDgL623oBIi2
 mWpJqTbe9cMvBbOzJqmcTq3hJezZUKIYE7i8jWDXEZKikHLPVyk09f8hrJWmpuvwI6oT
 edqlMEmb4MnmCpjyKLkouFI6f58kEN14N5x+r4lLwgNPclCCxXclXvOOxQapaKatm+E9
 1Dcw==
X-Gm-Message-State: AOAM532B1GmEsIo8epaSzz5ewguQq11MJM/3peskOkPYj6iLBGh+3Ls6
 6pTN7vUvNTFvJSnQ4Ywq/gdECw==
X-Google-Smtp-Source: ABdhPJxeKX8hi/esqw5TO9vNZ9dpHw2w/oMYdY2ij0Il3pTsGjSzBttJgQ/8/xirZghrbI8oB5AvBg==
X-Received: by 2002:aa7:8254:0:b029:2ed:b41:fefc with SMTP id
 e20-20020aa782540000b02902ed0b41fefcmr30374718pfn.42.1624971918745; 
 Tue, 29 Jun 2021 06:05:18 -0700 (PDT)
Received: from localhost.localdomain (122-117-179-2.HINET-IP.hinet.net.
 [122.117.179.2])
 by smtp.gmail.com with ESMTPSA id u13sm18766769pga.64.2021.06.29.06.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 06:05:18 -0700 (PDT)
From: Axel Lin <axel.lin@ingics.com>
To: Mark Brown <broonie@kernel.org>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Henry Chen <henryc.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Wen Su <wen.su@mediatek.com>, linux-mediatek@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 3/3] regulator: mt6397: Remove modeset_shift from struct
 mt6397_regulator_info
Date: Tue, 29 Jun 2021 21:05:03 +0800
Message-Id: <20210629130503.2183574-3-axel.lin@ingics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629130503.2183574-1-axel.lin@ingics.com>
References: <20210629130503.2183574-1-axel.lin@ingics.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_060520_390367_6F28B5A8 
X-CRM114-Status: GOOD (  10.97  )
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

The shift setting can be calculated via the corresponding mask field,
so remove modeset_shift.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/regulator/mt6397-regulator.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index 0a30df5e414f..b9bf7ade1f8a 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -32,7 +32,6 @@ struct mt6397_regulator_info {
 	u32 vselctrl_mask;
 	u32 modeset_reg;
 	u32 modeset_mask;
-	u32 modeset_shift;
 };
 
 #define MT6397_BUCK(match, vreg, min, max, step, volt_ranges, enreg,	\
@@ -61,7 +60,6 @@ struct mt6397_regulator_info {
 	.vselctrl_mask = BIT(1),					\
 	.modeset_reg = _modeset_reg,					\
 	.modeset_mask = BIT(_modeset_shift),				\
-	.modeset_shift = _modeset_shift					\
 }
 
 #define MT6397_LDO(match, vreg, ldo_volt_table, enreg, enbit, vosel,	\
@@ -175,11 +173,11 @@ static int mt6397_regulator_set_mode(struct regulator_dev *rdev,
 		goto err_mode;
 	}
 
-	dev_dbg(&rdev->dev, "mt6397 buck set_mode %#x, %#x, %#x, %#x\n",
-		info->modeset_reg, info->modeset_mask,
-		info->modeset_shift, val);
+	dev_dbg(&rdev->dev, "mt6397 buck set_mode %#x, %#x, %#x\n",
+		info->modeset_reg, info->modeset_mask, val);
+
+	val <<= ffs(info->modeset_mask) - 1;
 
-	val <<= info->modeset_shift;
 	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
 				 info->modeset_mask, val);
 err_mode:
@@ -204,7 +202,10 @@ static unsigned int mt6397_regulator_get_mode(struct regulator_dev *rdev)
 		return ret;
 	}
 
-	switch ((regval & info->modeset_mask) >> info->modeset_shift) {
+	regval &= info->modeset_mask;
+	regval >>= ffs(info->modeset_mask) - 1;
+
+	switch (regval) {
 	case MT6397_BUCK_MODE_AUTO:
 		return REGULATOR_MODE_NORMAL;
 	case MT6397_BUCK_MODE_FORCE_PWM:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
