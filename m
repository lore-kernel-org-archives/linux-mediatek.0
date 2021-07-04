Return-Path: <SRS0=KhaQ=L4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4988AC07E95
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E8AB613C2
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E8AB613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Lmq6Py7+/1SHVeO4AqV7KqHZ026Q2iOOAdXHZHa7+4=; b=3vYXU+Rjpzfeir
	JGMg8RvpBPCLh+6UwJPSKfDbMnrYo04VFSLRcC+Oqu80e2UH7v+HeckPVT6rTUg/IPFXvrd3XG/uk
	c88aLsbrIccYjzQ/8/PVjz/t+y+VufXeDNCE+jETAz9tXaMHqjUxxOEOb8ICal1AAZHuM+7giGJ5j
	C9b4el6amlLEU31rXc1qMW3gZjXfzRxBx7nlmghK4mekWsqmGv/nStFK0PqeeCCp9Wj19TlCNwpFu
	E/aS2DhNRxfgbiWK2erpbsjflffM3BHO/1ZpikAs+rN6ntCK9PYZvHUxCA8gFUt8PO72IwMMUb/cQ
	OrdJEmI4EwvKuIkmuC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Beh-0079Cm-0e; Sun, 04 Jul 2021 23:36:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0BD0-006ua4-6Y; Sun, 04 Jul 2021 23:07:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07F306141C;
 Sun,  4 Jul 2021 23:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625440049;
 bh=raElE/LTi6RdTWtu6Qz0VjOIA0GIV9i4FphLeAtxHu8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WY2WEJL8tB8Q2Se0ECpbVo/4D+hwkZfYXUVpkyHRq7FD8py58icXHlxnVv8fGdB1/
 WoLnA9nSO/LSrSlN7QQ5gbQZNOrVtljbTbJ1XRpbTbV6DoaQomUJWEI4CDsXobC4kw
 Sdmb2qv8eX30PlYGvWMEJFw4+1GOshDIVjSrHaBeePOpFcM34e88sJyrRoaUSx28Nl
 yNHg4kOr3hs/VPKJXrp79Fk+siYW5EPhkL7oZ8n+Pb2RazUmm07L59Fl7lzNv3YnFI
 ElVJPe4M3JNBK+Jq9CA/dQy8BBQkAlX/0GfW17OCXaL8bV/CteJ3OwAuylMNLiooqg
 XwbOM9N548vFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Axel Lin <axel.lin@ingics.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 54/80] regulator: mt6315: Fix checking return
 value of devm_regmap_init_spmi_ext
Date: Sun,  4 Jul 2021 19:05:50 -0400
Message-Id: <20210704230616.1489200-54-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230616.1489200-1-sashal@kernel.org>
References: <20210704230616.1489200-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_160730_278571_14DC6956 
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
