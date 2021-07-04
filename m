Return-Path: <SRS0=KhaQ=L4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5AAC07E9A
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:18:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41E561363
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41E561363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Lmq6Py7+/1SHVeO4AqV7KqHZ026Q2iOOAdXHZHa7+4=; b=iEDy2FYuNCPh5q
	3UBVLHY9diQQRwh6dkzLrY+P4zRnduBUSHyeHmtriVze4Kv0L0D25NJRAW6JFwmENiHHOTURmDrzb
	MzIjjzCXpSdhjFrwnC+gb1EjqMiF5vNyToxqb5BxwaWIgC0o7MIEthkD//MXTD0KC1zIx7XWFKpsY
	cr9okEVJdJEmpTqiSVr++MJdddP/upKXJN7HVk8ka5wKYPDsDQTL9AGB6fswnX39daVOWBjG+7wSU
	RLiMrxqUfVDDesi7tp/WkFBKY/Kq5kW658agCItV7D3RLxVZOdSFnCCJEAxNOI6tW00G1qIlVHFWV
	y0BpA1L2gmb+umJgutcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0BN5-0070dm-Lq; Sun, 04 Jul 2021 23:17:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0BBD-006t6R-Lh; Sun, 04 Jul 2021 23:05:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 961356135D;
 Sun,  4 Jul 2021 23:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625439939;
 bh=raElE/LTi6RdTWtu6Qz0VjOIA0GIV9i4FphLeAtxHu8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cr0y8w//bhqQ9FOJCpWWyjzKnh4YQEp2mgP8EW/0Kc362G3RxfnrpLAB7VHqCpEUk
 TCuhmCjeod3NG83jcPMPrJkamEu2ZpauMCC1eX6BomGzrgpg0NuLf0kN+jpeq63HKP
 yS+wxbLi3ug93MjMIlXoThL75N7Ie+SeAW7QdO7aHEhxWBK1SeHp1XQIkZjya4etRa
 edGkFs0HiJz46UmlV/9TuWggRrKMy2tgv19GTP24xqYbqS8vogCXFDLgT7v3ruC9xx
 i66SV54cGLloI6prLi7Ymm5BpKawkBVXD/4/iD236lV3liWb6NIWO/nMitKoB8lSRo
 Utb9CHDjyjpyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Axel Lin <axel.lin@ingics.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 57/85] regulator: mt6315: Fix checking return
 value of devm_regmap_init_spmi_ext
Date: Sun,  4 Jul 2021 19:03:52 -0400
Message-Id: <20210704230420.1488358-57-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230420.1488358-1-sashal@kernel.org>
References: <20210704230420.1488358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_160539_779898_CDBEBCAC 
X-CRM114-Status: GOOD (  10.61  )
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

From: Axel Lin <axel.lin@ingics.com>

[ Upstream commit 70d654ea3de937d7754c107bb8eeb20e30262c89 ]

devm_regmap_init_spmi_ext() returns ERR_PTR() on error.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Link: https://lore.kernel.org/r/20210615132934.3453965-1-axel.lin@ingics.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/regulator/mt6315-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index 6b8be52c3772..7514702f78cf 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -223,8 +223,8 @@ static int mt6315_regulator_probe(struct spmi_device *pdev)
 	int i;
 
 	regmap = devm_regmap_init_spmi_ext(pdev, &mt6315_regmap_config);
-	if (!regmap)
-		return -ENODEV;
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	chip = devm_kzalloc(dev, sizeof(struct mt6315_chip), GFP_KERNEL);
 	if (!chip)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
