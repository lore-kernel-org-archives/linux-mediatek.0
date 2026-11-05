Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51AD606A32E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iJi2ChQu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pygWu//i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=; b=iJi2ChQuItgfN+gY1QVIIRBHFH
	kicE8rcm+w2TiHVCNzPmdrt6/6QeBMi4m0PfT8jwSNNPBrZnb6O0JxPlPKOanMmnu4Uu1UuWiAO+T
	nOszb+oWe+I+PCaSDScXdY5gpZNsl6IyxOicFVSfPoTLQivdQU5y/HWTrOqs9stWy19gXXeetErN9
	hDQTEK1S6p6T1X5G+8MdEc/XHNnhI95vgVLsc2/9mZfuCxZrxHcy1MBma9zfIK3rt/nWwUEQz/2hl
	uuFaytCJJaE2bOuT3sxMJ2ozSeSt4pczmSWcVhiTEl5t2ulvHo8ovEbP68D939mP553JBrobjxZB3
	RVUts0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv1f-00000008Utk-2Nav;
	Thu, 05 Nov 2026 10:48:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv1c-00000008Usv-3LuU
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 10:48:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-491846221ffso348508f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 02:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875735; x=1794480535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=;
        b=pygWu//icZGOjVrSil42we9ZsQKTr+fN65TI9BlKHFZfhGgCnu41hl+HjVHTnkTX0b
         BRENK7y7xhMaA3TG+BclgGg0VGSI3DoX2ZsmxlJwXe+9zQDQPJt2QjgRbHR7gcMFbHrG
         W6ld0+V78AHrpKqJ78CCUm7u8Ka5R8RwKwV+ctNjvqDgbM0DLbQVVCHrSDz7qpHIOSzh
         YlZA1AqX8nlp6PERQGxXMmqXGZPpaXrRggWppcFLssXl2atkBcQqTx9WAF8CkoHSVF2I
         k6xaxZ4YngHJT0FK+bQtnU4JOiBmUxKW8+JlL96fkxGNSsyfwQZMm8nbfEpGSfnzAbDD
         nSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875735; x=1794480535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=;
        b=wUgvOGZRXk8RUW2swqu+XToaInzyFkTJwRTx1ji5I5t7C1/PtwODTE8hfVatbixAco
         nLUyzyhhjTnbOIDZjxFpu5wmk+SpVmfwE7iUzdh3yXRllrqM/sHPC1dNFNel5RCZq0wV
         LN+fcY6zMgZ4jsQGwYWsagl69Uzhl1gi0Pc0NPZ03riX0NorXS1EjN4c+//CF9AOcyuG
         x1dC6UVRT2uTGD1jbYYrgMHQb3ELGiEPV+LDK6tWIZltQMmO4vIokWBUQjx92LSQEANA
         923T/BK0bhg//heaylnm5uTQWVFDzahLwdAfR7/hPvRsEC6k9DRVjS29iHU9f4MAJhnp
         gc7w==
X-Gm-Message-State: APuU4Z8d8zGPTFx2Db8Kvgvt4D6IuG2YTzBJ7MZYUFq4xsMYcpDx35YB
	x/SmOAWJPQr0vd+7bHZxiJ1ToYIfY8xJXy+FOGGvtqBKIRhTDEfRoPgp8G75N4y0rYc=
X-Gm-Gg: AYBFou2x+fEKaY68c+mbmcX7dx4Qb9Q7UcqJmYlZ9sAPzwvz3/09KqlmO5DyVHfq6VK
	r5592Icr19zRUXc7Eb4My5K13h+2P3BiMUR/MMT0EIT7QC4dITVWBdPRAjHZXrpEsC0z1/ljMRE
	bO1UlTknjTCJ+DSV5RrT3YtFS6rlryeILl/lfwtm3qinZU5cZc4xFOAEYfaB1bYXkRRvLW2mblg
	gWvUHDnjdsyQzXcvSMa0XIFJZtlVcnmzte1euCd2/BvguREQy5ZlNcGLMS7hpJD4xHsOkoWFoeb
	nANu7qxN4NKjfQvS9sQx5KylW1FpQv21UgBwmW7NHP00zMYQP8kDwdULGquIyjVe88yvIT5GNjz
	CqgX47F3cq4379ed/tjH9pSqMTGMi1OKwJzyy/fmDACuG1F+a+4FVdWq92LsGEAGqHLkrWv/dUS
	u25N6nhRGWQsqJxrnlNpxK0F3R7qFdmW2eBMzzyhhCbxV2MKTHKJ9IEaJc1Xv5z/mm5kJ7I0lfr
	ol0alakCtidIVMFso8q0WiQkoydrcwBMNOmiya5IbGh7hy+AMNW9+NEHpEUI+ecxwhrrJe2em4+
	iKA0l8h94GcEOtus1Wy7L6/k
X-Received: by 2002:a5d:5d05:0:b0:48e:38e:3102 with SMTP id ffacd0b85a97d-48e6e4f692cmr41112254f8f.29.1793875734675;
        Thu, 05 Nov 2026 02:48:54 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm10384627f8f.45.2026.11.05.02.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:48:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
Date: Thu,  5 Nov 2026 11:31:05 +0100
Message-ID: <20261105104837.1105227-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_024856_901192_1D843A85 
X-CRM114-Status: GOOD (  12.44  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the MFD_CELL_* macros to describe sub-devices. No functional changes.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch was previously submitted as part of the mt6392 series [1], but
it can be merged independently and does not introduce any other change.
The mt6392 series will be rebased and sent out again without this change.

This patch has been rebased on v7.4-rc1 and line width has been adjusted
for 100-char limit to keep items on a single line where possible.

[1] https://lore.kernel.org/linux-mediatek/20261021105109.199886-1-l.scorcia@gmail.com/

 drivers/mfd/mt6397-core.c | 180 ++++++++------------------------------
 1 file changed, 37 insertions(+), 143 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5d5f816492aa..6fbc2445dc3b 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -124,168 +124,62 @@ static const struct resource mt6323_pwrc_resources[] = {
 };
 
 static const struct mfd_cell mt6323_devs[] = {
-	{
-		.name = "mt6323-auxadc",
-		.of_compatible = "mediatek,mt6323-auxadc",
-	}, {
-		.name = "mt6323-efuse",
-		.of_compatible = "mediatek,mt6323-efuse",
-	}, {
-		.name = "mt6323-rtc",
-		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),
-		.resources = mt6323_rtc_resources,
-		.of_compatible = "mediatek,mt6323-rtc",
-	}, {
-		.name = "mt6323-regulator",
-		.of_compatible = "mediatek,mt6323-regulator"
-	}, {
-		.name = "mt6323-led",
-		.of_compatible = "mediatek,mt6323-led"
-	}, {
-		.name = "mt6323-keys",
-		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
-		.resources = mt6323_keys_resources,
-		.of_compatible = "mediatek,mt6323-keys"
-	}, {
-		.name = "mt6323-pwrc",
-		.num_resources = ARRAY_SIZE(mt6323_pwrc_resources),
-		.resources = mt6323_pwrc_resources,
-		.of_compatible = "mediatek,mt6323-pwrc"
-	},
+	MFD_CELL_OF("mt6323-auxadc", NULL, NULL, 0, 0, "mediatek,mt6323-auxadc"),
+	MFD_CELL_OF("mt6323-efuse", NULL, NULL, 0, 0, "mediatek,mt6323-efuse"),
+	MFD_CELL_OF("mt6323-rtc", mt6323_rtc_resources, NULL, 0, 0, "mediatek,mt6323-rtc"),
+	MFD_CELL_OF("mt6323-regulator", NULL, NULL, 0, 0, "mediatek,mt6323-regulator"),
+	MFD_CELL_OF("mt6323-led", NULL, NULL, 0, 0, "mediatek,mt6323-led"),
+	MFD_CELL_OF("mt6323-keys", mt6323_keys_resources, NULL, 0, 0, "mediatek,mt6323-keys"),
+	MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0, "mediatek,mt6323-pwrc"),
 };
 
 static const struct mfd_cell mt6328_devs[] = {
-	{
-		.name = "mt6328-regulator",
-		.of_compatible = "mediatek,mt6328-regulator"
-	}, {
-		.name = "mt6328-keys",
-		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
-		.resources = mt6328_keys_resources,
-		.of_compatible = "mediatek,mt6328-keys"
-	},
+	MFD_CELL_OF("mt6328-regulator", NULL, NULL, 0, 0, "mediatek,mt6328-regulator"),
+	MFD_CELL_OF("mt6328-keys", mt6328_keys_resources, NULL, 0, 0, "mediatek,mt6328-keys"),
 };
 
 static const struct mfd_cell mt6357_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6357-auxadc"
-	}, {
-		.name = "mt6357-regulator",
-	}, {
-		.name = "mt6357-rtc",
-		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
-		.resources = mt6357_rtc_resources,
-		.of_compatible = "mediatek,mt6357-rtc",
-	}, {
-		.name = "mt6357-sound",
-		.of_compatible = "mediatek,mt6357-sound"
-	}, {
-		.name = "mt6357-keys",
-		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
-		.resources = mt6357_keys_resources,
-		.of_compatible = "mediatek,mt6357-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6357-auxadc"),
+	MFD_CELL_NAME("mt6357-regulator"),
+	MFD_CELL_OF("mt6357-rtc", mt6357_rtc_resources, NULL, 0, 0, "mediatek,mt6357-rtc"),
+	MFD_CELL_OF("mt6357-sound", NULL, NULL, 0, 0, "mediatek,mt6357-sound"),
+	MFD_CELL_OF("mt6357-keys", mt6357_keys_resources, NULL, 0, 0, "mediatek,mt6357-keys"),
 };
 
 /* MT6331 is always used in combination with MT6332 */
 static const struct mfd_cell mt6331_mt6332_devs[] = {
-	{
-		.name = "mt6331-rtc",
-		.num_resources = ARRAY_SIZE(mt6331_rtc_resources),
-		.resources = mt6331_rtc_resources,
-		.of_compatible = "mediatek,mt6331-rtc",
-	}, {
-		.name = "mt6331-regulator",
-		.of_compatible = "mediatek,mt6331-regulator"
-	}, {
-		.name = "mt6332-regulator",
-		.of_compatible = "mediatek,mt6332-regulator"
-	}, {
-		.name = "mt6331-keys",
-		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
-		.resources = mt6331_keys_resources,
-		.of_compatible = "mediatek,mt6331-keys"
-	},
+	MFD_CELL_OF("mt6331-rtc", mt6331_rtc_resources, NULL, 0, 0, "mediatek,mt6331-rtc"),
+	MFD_CELL_OF("mt6331-regulator", NULL, NULL, 0, 0, "mediatek,mt6331-regulator"),
+	MFD_CELL_OF("mt6332-regulator", NULL, NULL, 0, 0, "mediatek,mt6332-regulator"),
+	MFD_CELL_OF("mt6331-keys", mt6331_keys_resources, NULL, 0, 0, "mediatek,mt6331-keys"),
 };
 
 static const struct mfd_cell mt6358_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6358-auxadc"
-	}, {
-		.name = "mt6358-regulator",
-		.of_compatible = "mediatek,mt6358-regulator"
-	}, {
-		.name = "mt6358-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	}, {
-		.name = "mt6358-sound",
-		.of_compatible = "mediatek,mt6358-sound"
-	}, {
-		.name = "mt6358-keys",
-		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
-		.resources = mt6358_keys_resources,
-		.of_compatible = "mediatek,mt6358-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6358-auxadc"),
+	MFD_CELL_OF("mt6358-regulator", NULL, NULL, 0, 0, "mediatek,mt6358-regulator"),
+	MFD_CELL_OF("mt6358-rtc", mt6358_rtc_resources, NULL, 0, 0, "mediatek,mt6358-rtc"),
+	MFD_CELL_OF("mt6358-sound", NULL, NULL, 0, 0, "mediatek,mt6358-sound"),
+	MFD_CELL_OF("mt6358-keys", mt6358_keys_resources, NULL, 0, 0, "mediatek,mt6358-keys"),
 };
 
 static const struct mfd_cell mt6359_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6359-auxadc"
-	},
-	{ .name = "mt6359-regulator", },
-	{
-		.name = "mt6359-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	},
-	{ .name = "mt6359-sound", },
-	{
-		.name = "mt6359-keys",
-		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
-		.resources = mt6359_keys_resources,
-		.of_compatible = "mediatek,mt6359-keys"
-	},
-	{
-		.name = "mt6359-accdet",
-		.of_compatible = "mediatek,mt6359-accdet",
-		.num_resources = ARRAY_SIZE(mt6359_accdet_resources),
-		.resources = mt6359_accdet_resources,
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6359-auxadc"),
+	MFD_CELL_NAME("mt6359-regulator"),
+	MFD_CELL_OF("mt6359-rtc", mt6358_rtc_resources, NULL, 0, 0, "mediatek,mt6358-rtc"),
+	MFD_CELL_NAME("mt6359-sound"),
+	MFD_CELL_OF("mt6359-keys", mt6359_keys_resources, NULL, 0, 0, "mediatek,mt6359-keys"),
+	MFD_CELL_OF("mt6359-accdet", mt6359_accdet_resources, NULL, 0, 0,
+		    "mediatek,mt6359-accdet"),
 };
 
 static const struct mfd_cell mt6397_devs[] = {
-	{
-		.name = "mt6397-auxadc",
-		.of_compatible = "mediatek,mt6397-auxadc",
-	}, {
-		.name = "mt6397-rtc",
-		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
-		.resources = mt6397_rtc_resources,
-		.of_compatible = "mediatek,mt6397-rtc",
-	}, {
-		.name = "mt6397-regulator",
-		.of_compatible = "mediatek,mt6397-regulator",
-	}, {
-		.name = "mt6397-codec",
-		.of_compatible = "mediatek,mt6397-codec",
-	}, {
-		.name = "mt6397-clk",
-		.of_compatible = "mediatek,mt6397-clk",
-	}, {
-		.name = "mt6397-pinctrl",
-		.of_compatible = "mediatek,mt6397-pinctrl",
-	}, {
-		.name = "mt6397-keys",
-		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
-		.resources = mt6397_keys_resources,
-		.of_compatible = "mediatek,mt6397-keys"
-	}
+	MFD_CELL_OF("mt6397-auxadc", NULL, NULL, 0, 0, "mediatek,mt6397-auxadc"),
+	MFD_CELL_OF("mt6397-rtc", mt6397_rtc_resources, NULL, 0, 0, "mediatek,mt6397-rtc"),
+	MFD_CELL_OF("mt6397-regulator", NULL, NULL, 0, 0, "mediatek,mt6397-regulator"),
+	MFD_CELL_OF("mt6397-codec", NULL, NULL, 0, 0, "mediatek,mt6397-codec"),
+	MFD_CELL_OF("mt6397-clk", NULL, NULL, 0, 0, "mediatek,mt6397-clk"),
+	MFD_CELL_OF("mt6397-pinctrl", NULL, NULL, 0, 0, "mediatek,mt6397-pinctrl"),
+	MFD_CELL_OF("mt6397-keys", mt6397_keys_resources, NULL, 0, 0, "mediatek,mt6397-keys"),
 };
 
 struct chip_data {
-- 
2.43.0


