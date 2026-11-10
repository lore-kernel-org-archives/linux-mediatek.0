Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED860A381F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cbl23JaO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpcheFby
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=e6GgDV+gCZut6r8ooJSgXjRan//AHShoRsNWsbfTZuo=; b=cbl23JaOXXeRGwBV3fe2iOfmw5
	cOkswZOpoUadH9hRSGtvg4FRgIiYJUWx32YijmlVetyxyJZYcjteEO7M8ZghtLtA4EvTdqtIePaK3
	pRLedLCVI+DFravraPNlW/lob4wb6uEas90d+cdHP0MO62uTKu7NP14gz8wU/n4NZVlxaLKis2619
	s1rA53MGKN6j93sULLt+qpFXmPrvB+zphjxg8v6V3zz6bNWHqgAoM+9g221IOeIAAz8QPZCxOcSaq
	J59xI22O6QL33cmcWiPLgq8S/4iMTeVxd4y9dscvZn4l6DErD4R1nuRvWRJyZEraZrRU+3WxaqET+
	vzTlNhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpqO-00000004hmz-3chK;
	Tue, 10 Nov 2026 17:41:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpqN-00000004hmb-0CUb;
	Tue, 10 Nov 2026 17:41:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C2EA62F47;
	Tue, 10 Nov 2026 17:41:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794332473;
	b=h8kVEIKhkdnPP/4Pkmr4BYWlX/vEBT+QGT/cdxZnDpTcQlsaq1BM71fsTcLsCN80+BjF
	 Dk+FdVM4psYq1/FnVmHsKxyH1FOz44VwB9zlUTLIDQ4BT/s0rVjkAsK/ha6Xselk+zNqK
	 21vXQzG76FkRn1y5hoA9wxpj0XXyKRxx2OOwTkMPBE7ceFs//c1Gh3XVyDCXdpou0MzDX
	 5Kr8/rR7bpCPspSVZuC5xp/Y7SaBT7i9L/bijuWT7eDf64cizTQcqvq4HZTFGQg5x0OEH
	 Sypuy5KObG6LmTqTC2mMR281cUMVkQi9EresOFEr/Y255nwVcp4Xx32eXwWj0BE9WqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794332473;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=e6GgDV+gCZut6r8ooJSgXjRan//AHShoRsNWsbfTZuo=;
	b=r41h3De+Qg1Lrn5WhgcZ9FkVoUxb+3x+pGOKmPr9mOlTUc0vYwygoyNvFjz65ovXgXOJ
	 412wmSlvrjxFDmG0z+/RRZWRwzKcUZerK5tc2xJeFXsjcfYj9D8yannDPMW1sTOtgBEmj
	 z545CXyHLBg5kw0DyBHmCCRxi7emAFPdexQHr0BseqagSdsviVg6535xJSQfKIkmsgs2+
	 oOn93w/WReclXkQ9dtwgljUIlxqp6dAWUrA39n85n+BvEtL4pAqzKKTOSatD8hTcuX4LH
	 kjTQELQ/q0PJziTFB2Op/UOM4QtHSFJS5OdciiIaoJCdaSFVozvqrutqGaEk7XhWWzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3760A1F0089F;
	Tue, 10 Nov 2026 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332473;
	bh=e6GgDV+gCZut6r8ooJSgXjRan//AHShoRsNWsbfTZuo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=UpcheFbylx7jrBTxXQbwvHuXpDBfNYiJmN/bzjAKsZsEdZWuy13Y0iC6p3/xUJ6bK
	 g3b6Za7DJDiAIg9+TcUQu5U6He/o1kQuPN/b+mQ7mJ/jcjdLk/h2FsUSADE6NqTNYs
	 By6kkPmN96R28eG3waTQAFRK9eB086yeX956b84C2/z3vdpfEUqFbaXGR0mcjElVGF
	 GxsWChJMVvxH9ONX9Lu1DRJFdfU+GqX2kTU2+eefa2uN/USzT4sLLoqBuotqGFRblY
	 6dyFSmcykoxAw4kYdp/XDid9Q6a/Y66tjf7zwDXGfz5KxkSFTkz2H9AXdAScMmozp7
	 SgO9xoOgZqF2g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BB5BF48C2D;
	Tue, 10 Nov 2026 17:41:12 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Tue, 10 Nov 2026 17:41:11 +0000
Subject: [PATCH] mfd: mt6397: Use PMIC specific interrupt count for domain
 creation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-mt6397-irq-num-fix-v1-1-81d17454194e@protonmail.ch>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWZtEK+ryKmKBDkaiaBGJeHfF8
 jvJ+S9wZJkcFMEFlg52PBsPEQbQDrXpCVl7g4ykEkJEOG0qzlNku6LZJ+z4RKkpzXSdqDwh8Mf
 Fkp+/aFn9dnszUru9JbjvB67Zdkx2AAAA
X-Change-ID: 20261110-mt6397-irq-num-fix-2de78da5695e
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794332472; l=3349;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=bRyoobaVcT/dxO3uclPekPpnlK3tbVg5L4EF4M1asiQ=;
 b=shkTxPb6Mh+r0/BI9HyAkBzh6F25GjW78PFF3C9N6LhR9jcgsCq4mgYvUOTw3+RcFWSfbNwR1
 w7LycfMCPjJD7pXpw/dfoGWMCkxuUppMZaBagYIJkUS7ocpyfmQEFFw
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: bengris32@protonmail.ch
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ben Grisdale <bengris32@protonmail.ch>

mt6397_irq_init() currently creates its IRQ domain with a fixed number
of interrupts (MT6397_IRQ_NR). However, not every PMIC supported by this
driver has the same number of interrupts as the MT6397. The MT6328 has
47 interrupts, so its interrupts above MT6397_IRQ_NR (32) are currently
unusable.

Correct this by passing the PMIC's actual interrupt count to
irq_domain_create_linear() based on the chip ID. Define the missing
interrupt count for MT6328, as the other supported PMICs already have
it defined.

Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 drivers/mfd/mt6397-irq.c        | 7 ++++++-
 include/linux/mfd/mt6328/core.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 5d2e5459f744..783be9f5c9c3 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -171,6 +171,7 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
 
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
+	unsigned int irq_num;
 	int ret;
 
 	mutex_init(&chip->irqlock);
@@ -181,6 +182,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		chip->int_con[1] = MT6323_INT_CON1;
 		chip->int_status[0] = MT6323_INT_STATUS0;
 		chip->int_status[1] = MT6323_INT_STATUS1;
+		irq_num = MT6323_IRQ_STATUS_NR;
 		break;
 	case MT6328_CHIP_ID:
 		chip->int_con[0] = MT6328_INT_CON0;
@@ -189,12 +191,14 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		chip->int_status[0] = MT6328_INT_STATUS0;
 		chip->int_status[1] = MT6328_INT_STATUS1;
 		chip->int_status[2] = MT6328_INT_STATUS2;
+		irq_num = MT6328_IRQ_STATUS_NR;
 		break;
 	case MT6331_CHIP_ID:
 		chip->int_con[0] = MT6331_INT_CON0;
 		chip->int_con[1] = MT6331_INT_CON1;
 		chip->int_status[0] = MT6331_INT_STATUS_CON0;
 		chip->int_status[1] = MT6331_INT_STATUS_CON1;
+		irq_num = MT6331_IRQ_STATUS_NR;
 		break;
 	case MT6391_CHIP_ID:
 	case MT6397_CHIP_ID:
@@ -202,6 +206,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		chip->int_con[1] = MT6397_INT_CON1;
 		chip->int_status[0] = MT6397_INT_STATUS0;
 		chip->int_status[1] = MT6397_INT_STATUS1;
+		irq_num = MT6397_IRQ_NR;
 		break;
 
 	default:
@@ -216,7 +221,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		regmap_write(chip->regmap, chip->int_con[2], 0x0);
 
 	chip->pm_nb.notifier_call = mt6397_irq_pm_notifier;
-	chip->irq_domain = irq_domain_create_linear(dev_fwnode(chip->dev), MT6397_IRQ_NR,
+	chip->irq_domain = irq_domain_create_linear(dev_fwnode(chip->dev), irq_num,
 						    &mt6397_irq_domain_ops, chip);
 	if (!chip->irq_domain) {
 		dev_err(chip->dev, "could not create irq domain\n");
diff --git a/include/linux/mfd/mt6328/core.h b/include/linux/mfd/mt6328/core.h
index 9a08aed72b9f..18e000cf5d29 100644
--- a/include/linux/mfd/mt6328/core.h
+++ b/include/linux/mfd/mt6328/core.h
@@ -48,6 +48,7 @@ enum mt6328_irq_status_numbers {
 	MT6328_IRQ_STATUS_FG_ZCV,
 	MT6328_IRQ_STATUS_SPKL_D,
 	MT6328_IRQ_STATUS_SPKL_AB,
+	MT6328_IRQ_STATUS_NR,
 };
 
 #endif /* __MFD_MT6323_CORE_H__ */

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-mt6397-irq-num-fix-2de78da5695e

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>



