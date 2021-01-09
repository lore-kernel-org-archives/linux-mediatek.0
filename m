Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26DAC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 11:26:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA2F23A23
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA2F23A23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K2CyJQPb2iyt8c4tMn5bHKoY/yNjOlDK8OasNRz6dxY=; b=lMnTZO5cqcQ1C/0sebpvB4ocf
	PkkuP5zzCL05xDlFKEzV2H7yEcFBRwjjL3LiGykKKZphhoh6d5uqJCHDvj3GGoLxlS19s+6G8ysGj
	5k0wiy6hJ9QXa9ifso9UQzuH00mKxM/0guPwcuPnE0LRDRpst00V77nNp1tekI/kWKUmfslZzbr54
	8I3J4UAkqyFTQAc+I9ty4AJl41GzssgZTQ5SB5PvcRnlBpYcyQZp3pManRlOur/OZRyIroXZ0lNmC
	+KSxFaI9GLFAzIY/qwxMqqoMLciZ5ERcu0GeVY+vRco1nxuz4hJEzLilJkiwS2oeMvD4GjdT1PdcL
	3k+BhVuKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyCOH-0008F8-6y; Sat, 09 Jan 2021 11:26:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyCO0-00089P-Le; Sat, 09 Jan 2021 11:26:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5970523A5B;
 Sat,  9 Jan 2021 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610191584;
 bh=ZwGNlLT0V28L32lhKP8fkz8Phifx/G7ELAZXT2Co0Nw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=az0G+ArNGOjGqZkD4UYAEJr/rNp6bRSLJYMtRkLEmhGcM/oLASeNvOJLKUUDscvoE
 /mhE0gEiDhDaKl49MMjQa5gcXnJKSUv0XF2euS8FLfg8Bh/G6S+/EHQ2xHpVfcy1LO
 zvRFuiMIGqdZosB+7V76saB4vS2nR+SUnFEWi0TDerr//3tPc+vb+vlIjYSElowKOX
 +QXuI9mG+9xKCiZkhnz1WApJA3aaJsdrfUWL9oGt48dWNtVJoDcALPqbq9Y710ik7q
 knKdYgIqzg+bzRSaf8DwWjZCKq+uykYjSpU3YDaJsZysVfpWQf5kZeIgm/Vy90bsfB
 GqvidVQ5MB4sg==
From: matthias.bgg@kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/3] regulator: mt6323: Add OF match table
Date: Sat,  9 Jan 2021 12:26:11 +0100
Message-Id: <20210109112612.1221-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109112612.1221-1-matthias.bgg@kernel.org>
References: <20210109112612.1221-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_062624_944782_F527F293 
X-CRM114-Status: GOOD (  12.33  )
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
 linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The binding documentation mentions that a compatible is required for the
MT6323 device node. But the driver does not provide a OF match table.
This way auto-loading is broken as the MFD driver that registers the
device has a .of_compatible set which makes the platform .uevent
callback report a OF modalias, but that's not in the module.

Fixes: 2fdf82923618 ("regulator: mt6323: Add support for MT6323 regulator")
Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

Changes in v2:
- check for CONFIG_OF
- add Fixes tag

 drivers/regulator/mt6323-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/mt6323-regulator.c b/drivers/regulator/mt6323-regulator.c
index ff9016170db3..646742d4db74 100644
--- a/drivers/regulator/mt6323-regulator.c
+++ b/drivers/regulator/mt6323-regulator.c
@@ -406,9 +406,18 @@ static const struct platform_device_id mt6323_platform_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6323_platform_ids);
 
+#ifdef CONFIG_OF
+static const struct of_device_id mt6323_of_match[] = {
+	{ .compatible = "mediatek,mt6323-regulator", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6323_of_match);
+#endif
+
 static struct platform_driver mt6323_regulator_driver = {
 	.driver = {
 		.name = "mt6323-regulator",
+		.of_match_table = of_match_ptr(mt6323_of_match),
 	},
 	.probe = mt6323_regulator_probe,
 	.id_table = mt6323_platform_ids,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
