Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AACC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 11:26:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3518C23A3C
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 11:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3518C23A3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hbicV2Q3LnxFvW2uTyX9660WM1WtZGu4Sr7mPqSZVyU=; b=t0TTdVgmLJJhFyrxcYLA7sqxBE
	03u9ao7uyYDFCEqz0GJKZ2wdQi2I0Rk2KxOQ41jC6vq+vOguqmb4Qy1dPSl7okTKIxcw2VuJBMXQr
	f0HtsyuHNCgJ8Xz/cew0yz7NTS4PsyPxAkddLixlD8QqwkFoThiAzcupkvWGtGwqm0KpO20fwgzU9
	GZyrB1HkooF7rKXQNRp7I1/3wJIC/aAjl+9Mlmit4KjMSS/swy4bzJyphY70g9h6Saoahld3izdOe
	ItzsT7kdCtYSSub2FAF1fCgkDniCimy5n+RpCRCxAdjWgBOmpYFo32sR6+Px5jIfBd4k8pS+XQhPd
	H/o7lAAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyCO6-0008BE-Hj; Sat, 09 Jan 2021 11:26:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyCNu-00086s-QX; Sat, 09 Jan 2021 11:26:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A57623A23;
 Sat,  9 Jan 2021 11:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610191577;
 bh=STRnszbJDiMCR1dFP63SP57c2zY2aY54/4HtRf2kO0A=;
 h=From:To:Cc:Subject:Date:From;
 b=k9T+k17RJDnLBntW8S4DF+qQBhHYQSAiqhanrh8ksHpWU9FTRU2iTUnxiPSwZavFD
 kioJBXGt6eQyOZEhN7uYLN1scf3fW3FVmhJ8DkREypjE5H85OESszxJGd9JlbqyL9i
 /7mJLrHYk3SjMhsjteVYJ3AxroxVTCMiskBL9yIuviRq5fD4RxjSW67yWF/lGXfVTi
 c1e3TV9Gcg8rDocxjQAs0Ar+fUWYalzC0rG/bu7Jzc5Uv7asw3eIjwv7mrul579ZRF
 4B9llOwaNNfDH5MQit+1zwWdkc33dgfZtzPTHe+8AkE3kR3yW/tF6Rs86l3usOSvI9
 PvlRysC7G42+Q==
From: matthias.bgg@kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/3] regulator: mt6360: Add OF match table
Date: Sat,  9 Jan 2021 12:26:09 +0100
Message-Id: <20210109112612.1221-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_062619_065957_EB2F136E 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Gene Chen <gene_chen@richtek.com>, Matthias Brugger <mbrugger@suse.com>,
 Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Binding documentation mentions that a compatible is required for the
MT6360 device node, but the driver doesn't provide a OF match table.

Fixes: d321571d5e4c ("regulator: mt6360: Add support for MT6360 regulator")
Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

Changes in v2:
- check for CONFIG_OF
- add Fixes tag

 drivers/regulator/mt6360-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 15308ee29c13..f7b2514feabf 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -445,9 +445,18 @@ static const struct platform_device_id mt6360_regulator_id_table[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6360_regulator_id_table);
 
+#ifdef CONFIG_OF
+static const struct of_device_id mt6360_of_match[] = {
+	{ .compatible = "mediatek,mt6360-regulator", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6360_of_match);
+#endif
+
 static struct platform_driver mt6360_regulator_driver = {
 	.driver = {
 		.name = "mt6360-regulator",
+		.of_match_table = of_match_ptr(mt6360_of_match),
 	},
 	.probe = mt6360_regulator_probe,
 	.id_table = mt6360_regulator_id_table,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
