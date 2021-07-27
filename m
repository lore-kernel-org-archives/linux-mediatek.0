Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8732FC4320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 13:19:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5618761A3A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 13:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5618761A3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2RGilh3ROZUhvZrsDyzhmCDltySHVp0opHtP73pXYU=; b=v1CQP8ZD54ZBTJ
	rynXTvfGNSQBip0RJgcDxlT3mU2Ht517nEK9AgXfBcbNdx6p+XKkjYKF/jJ5lOJ8OY9wB+gWjHW6l
	0ZA6nfJ/KkcmuqYLIWNNy27Nz0nYcPh3obj072/4EiPjoZgYX5uG0m6ZsLo77BrhVDGC++julb0Q5
	Z2kYfGW9pD9z0FhXClrtEkqTvMPTHWjBB1AXpi4XdgoiG9tXjr70JdFFu/ehy++HEVj759BypTz9H
	A/vGAeiVE0teS6/b/Wf/rvvZfvzlVzpuY7pQepe5sfNtK24ahJmjFIIFkSqUfTBQ+UpobiDfPg0TG
	HoMG9FyxhgoJYvkZdVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Mzl-00Eqs8-Tr; Tue, 27 Jul 2021 13:19:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8MzN-00Eqm5-Gn; Tue, 27 Jul 2021 13:19:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 237F361A3D;
 Tue, 27 Jul 2021 13:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627391955;
 bh=mBenjGICbGqU4sL6JcNUEpVkieVEjgsM+z7KIGEOHJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M+ugYWeP/xvYjK61sZjwE7Adtl7tA54WmBj/QmbJ4IbA+c5tQJogoYfdVvAr1Aszh
 OTDAubGyMZrwSvslfFFro7iMdbMdJEVUPBz/LnCWentKQgXG7yPwOgq0X0C9Aq3aLh
 7+EwPPOGxdgJ9bW3mN3EQ9/HSPVlDjbgOS08c1Y2Lucjp/Sl3V0kZCXMq3WNByV3gL
 3lvZ4twRvnY+/X7etSxvwC9nwAI7pqIyLdO0XfpDklCU/g2RcHVpT4srAa64Jl0um5
 kv+02QVCPtz1ONRcPZ2PDWYPL+MvyddRXX9AnA0LLNpQ1hjMHeS0snc+7gTXwOvW+2
 3M83u2DaMtLBA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Axel Lin <axel.lin@ingics.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 05/21] regulator: mtk-dvfsrc: Fix wrong dev
 pointer for devm_regulator_register
Date: Tue, 27 Jul 2021 09:18:52 -0400
Message-Id: <20210727131908.834086-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727131908.834086-1-sashal@kernel.org>
References: <20210727131908.834086-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_061917_613478_C0D6798B 
X-CRM114-Status: GOOD (  12.05  )
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

[ Upstream commit ea986908ccfcc53204a03bb0841227e1b26578c4 ]

If use dev->parent, the regulator_unregister will not be called when this
driver is unloaded. Fix it by using dev instead.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Link: https://lore.kernel.org/r/20210702142140.2678130-1-axel.lin@ingics.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index d3d876198d6e..234af3a66c77 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -179,8 +179,7 @@ static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 	for (i = 0; i < regulator_init_data->size; i++) {
 		config.dev = dev->parent;
 		config.driver_data = (mt_regulators + i);
-		rdev = devm_regulator_register(dev->parent,
-					       &(mt_regulators + i)->desc,
+		rdev = devm_regulator_register(dev, &(mt_regulators + i)->desc,
 					       &config);
 		if (IS_ERR(rdev)) {
 			dev_err(dev, "failed to register %s\n",
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
