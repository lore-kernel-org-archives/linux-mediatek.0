Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8412606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 22:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jOomMXeq;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=j3ilvKbE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:Date:Reply-To:To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eM62stGlO9Wse+nXJb2nhJ+ESqdO/DZ9KfICfYRljao=; b=jOomMXeq/QETcVyHWAtPHKGtiK
	OuouFfYaJvmxPKOOyCDZiU2nB36I5Fj7M6rjiqhdjQ/0k5ghyiXq3Qhy3Q7ZDr/onPlxexHQswC4a
	w0Cl4bLGDJ4ESUbgtLhiRyJoWNHb9z2M1L7f4bZ3GXHVuV8DlBInN4zpoc3AKDnKTULu1w1fELW6Y
	8tPUd2EQKjelsoQeA3KM8zRjPdeL8T7mpBL1f3wXv2mkBq/NOAMjvrFuiK0oeQBn6geTFFv5dke1z
	M2vp8jvRD0cKzbwb9XOt3Yx3oLGlLMrzhRixDKeS1YL/g8cOGzSCfFstuQV4/M1oHlunWQeXkmzUC
	+w+DLsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQugR-00000005CAu-2nsj;
	Tue, 10 Nov 2026 22:51:19 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQugN-00000005C8f-3X7b
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 22:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794351072; x=1794610272;
	bh=eM62stGlO9Wse+nXJb2nhJ+ESqdO/DZ9KfICfYRljao=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j3ilvKbE2p1jKmPfpCdK0zEPr3YJ3hayhKXluJHGBtP5M3UKofViNrz9AbcvmWSRz
	 cZaL52hH2CCbe6bgtttj6bMcLoW4d9e1CCA0SWsm0U6laeaadKb1UzfR2TWLcoa9Z7
	 qWdlOirI1vxzj9rwWd7WOqMSlaWHiyx0mReowbWG1KTwKn4HpP+cdRehBdmPT1oo+T
	 cXTfK048v8RTJRae8tL4B1CJSCPaSuipXI6KmrOTuuoKrQ9s8fk0ImTd7lQsvWdNHG
	 qh4oVCIeKind0iWdshxvQs08PlpjQizcZ8MmOSbF4BctmC6DzhDBlU+jnCvCuBdJy0
	 O4VAORjL/Btww==
Date: Tue, 10 Nov 2026 22:51:07 +0000
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for domain creation
Message-ID: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: b6e27d1989934072699f0422e290035781386c66
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_145116_046806_56315C03 
X-CRM114-Status: GOOD (  10.47  )
X-Spam-Score: -1.5 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261110-mt6397-irq-num-fix-v1-1-81d=
17454194e@protonmail.ch
---
 drivers/mfd/mt6397-irq.c        | 7 ++++++-
 include/linux/mfd/mt6328/core.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 5d2e5459f744..783be9f5c9c3 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -171,6 +171,7 @@ static int mt6397_irq_pm_notifier(struct notifier_block=
 *notifier,
=20
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
+=09unsigned int irq_num;
 =09int ret;
=20
 =09mutex_init(&chip->irqlock);
@@ -181,6 +182,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 =09=09chip->int_con[1] =3D MT6323_INT_CON1;
 =09=09chip->int_status[0] =3D MT6323_INT_STATUS0;
 =09=09chip->int_status[1] =3D MT6323_INT_STATUS1;
+=09=09irq_num =3D MT6323_IRQ_STATUS_NR;
 =09=09break;
 =09case MT6328_CHIP_ID:
 =09=09chip->int_con[0] =3D MT6328_INT_CON0;
@@ -189,12 +191,14 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 =09=09chip->int_status[0] =3D MT6328_INT_STATUS0;
 =09=09chip->int_status[1] =3D MT6328_INT_STATUS1;
 =09=09chip->int_status[2] =3D MT6328_INT_STATUS2;
+=09=09irq_num =3D MT6328_IRQ_STATUS_NR;
 =09=09break;
 =09case MT6331_CHIP_ID:
 =09=09chip->int_con[0] =3D MT6331_INT_CON0;
 =09=09chip->int_con[1] =3D MT6331_INT_CON1;
 =09=09chip->int_status[0] =3D MT6331_INT_STATUS_CON0;
 =09=09chip->int_status[1] =3D MT6331_INT_STATUS_CON1;
+=09=09irq_num =3D MT6331_IRQ_STATUS_NR;
 =09=09break;
 =09case MT6391_CHIP_ID:
 =09case MT6397_CHIP_ID:
@@ -202,6 +206,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 =09=09chip->int_con[1] =3D MT6397_INT_CON1;
 =09=09chip->int_status[0] =3D MT6397_INT_STATUS0;
 =09=09chip->int_status[1] =3D MT6397_INT_STATUS1;
+=09=09irq_num =3D MT6397_IRQ_NR;
 =09=09break;
=20
 =09default:
@@ -216,7 +221,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 =09=09regmap_write(chip->regmap, chip->int_con[2], 0x0);
=20
 =09chip->pm_nb.notifier_call =3D mt6397_irq_pm_notifier;
-=09chip->irq_domain =3D irq_domain_create_linear(dev_fwnode(chip->dev), MT=
6397_IRQ_NR,
+=09chip->irq_domain =3D irq_domain_create_linear(dev_fwnode(chip->dev), ir=
q_num,
 =09=09=09=09=09=09    &mt6397_irq_domain_ops, chip);
 =09if (!chip->irq_domain) {
 =09=09dev_err(chip->dev, "could not create irq domain\n");
diff --git a/include/linux/mfd/mt6328/core.h b/include/linux/mfd/mt6328/cor=
e.h
index 9a08aed72b9f..18e000cf5d29 100644
--- a/include/linux/mfd/mt6328/core.h
+++ b/include/linux/mfd/mt6328/core.h
@@ -48,6 +48,7 @@ enum mt6328_irq_status_numbers {
 =09MT6328_IRQ_STATUS_FG_ZCV,
 =09MT6328_IRQ_STATUS_SPKL_D,
 =09MT6328_IRQ_STATUS_SPKL_AB,
+=09MT6328_IRQ_STATUS_NR,
 };
=20
 #endif /* __MFD_MT6323_CORE_H__ */

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-mt6397-irq-num-fix-2de78da5695e

Best regards,
-- =20
Ben Grisdale <bengris32@protonmail.ch>



