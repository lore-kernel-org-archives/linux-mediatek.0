Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B7606A69A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=myQjQp9s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+uTmfm8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0V5ent2gRGVFE5jdkh23KF1cd/GkDsAuW+2Jeh4TUms=; b=myQjQp9sNmysgqEtGSVGLIy/bm
	lvVUA4wDXF5iHj6OoPkp15pxYfaO9wYf8ZdkrEleKsKBTCv5vLb8adjj7QBtmhbGvJFCOPYEU2I+F
	Kb3Z45qL1xEaCk6h4rMmNKM/16uOvT7NSXEuKs3Nh8O+IctA9t6vOutDSFUAj5WIvdXfBMGqwhZXY
	XNIb4klmLXs+XUChW3ifQarQJZLkUwq11cw+jP//QQVMBLr0QHgPCnlC26U1GVrnUX9cqtL/R5Zas
	uxaImSWfcEDfeaPAvFBJXXZ+jld2wEu6k7ZhHWSbDpFEXceat9KaNPQ4z7rveAg6nCH+jEgwlXLQM
	RTP+pErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmCW-0000000EpCn-3liG;
	Fri, 27 Nov 2026 03:00:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmCE-0000000Ep3y-3j7g;
	Fri, 27 Nov 2026 03:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B6F2455B3;
	Fri, 27 Nov 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795748422;
	b=ae+rFGG8oiOkHpiFpBTHr/1F816vMLtnQQFd9Ir/Y5/lYNpPa55p+U+Z9FQ0YVaj6z4w
	 6EpSOqruQ/DlRXUkGwLPIPSjbdrLcQ94Pj3r7NP9N4f4o6zeDkzl6mRIH/ytPDl9O38ow
	 4gPrX1m65ZYO/B00eQlWQvUvoiWAPaP4cYqmj8kKtEmmbDJEECBAWkqmzyAtjZQ82CrfL
	 YyHnRXuuJY0tOlJzBqlqwIWsjw2KqgYZTpMoMqofug5+877TRBHiawc5fBqJ/TJAUa84g
	 A7kDmRq98zDL2YwlTAKVJooi3DhfgOEfgbV+navrC7AQXDenM6yDi60+jrTytIcUeFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795748422;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0V5ent2gRGVFE5jdkh23KF1cd/GkDsAuW+2Jeh4TUms=;
	b=WU7Fc1jhPokUDKd5+6JRzYlgbuf/E/vqmWShnCjmI9tmj/svGXPmOeVVoc3ICIjm16lQ
	 NP96ABz7G3OUXH0tfib2L4RGQDX2GnfAbxcJlUG1LMCOAc0Ws7LC4+OU++0iVSpmD8/wk
	 FjlG5B0863ibSPt68v0hqVjgLjSXYJSwN01fgdb/OPmA7vVNXRtpCoxUCExhf8SwMB3dI
	 HmL/p2zfmXT32XXHPou8W6Ej5PIOMeN6iYxjEg4RbbLvhE9tH5uMSwPtbRxqcyiJL8CPf
	 vVdjl/Ob0SmpOBd+p1EplVcLdFCCjUnbAeeDhWJjree2iTUAM27Y4pdNWfEdv1OaxBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E45761F0089B;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748422;
	bh=0V5ent2gRGVFE5jdkh23KF1cd/GkDsAuW+2Jeh4TUms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=c+uTmfm884Cf2/bAz2yJjc28n/ymXll1t1bpWCmvfUwHWrirntZIVLoiXLtYiP3pP
	 ouZSEdHjgit6h325hPN7qhp2VP0cQtmNz16/CeNvP5ipQxaWn88JPG6zQ7soLMNS58
	 KX8MFDhuoj/wR8dU5zA5dF+AKidGyy791cQMX2IdYB8IfS2fQMthaTWtD8+EPWVYB4
	 AuDb9rLPtnSvjlXE93/gdu5VtAWwimRe8kBkDkP6aHcjZbdQFoGc67955dIkLUHen5
	 +hz3GcwB8zozsYLVU7neW3nnu7srqXCLd9SsLK1Dg40W6NbCEOnq7cSfNbvC1zlHRx
	 dxYyE0BIWlkdg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7508C4B519;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: amergnat@baylibre.com, me@adomerle.pw, 
 Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] soc: mediatek: mtk-pmic-pwrap: Skip WDT source and
 init on arbiter SoCs
Date: Fri, 27 Nov 2026 03:00:11 +0000
Message-Id: <20261127030009.10572-3-iasnezhkov@gmail.com>
In-Reply-To: <20261127030009.10572-1-iasnezhkov@gmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795748409; l=3004;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=YYEmyq9HmeAz5eigYAssbolziK0P0Y/IzdI3DzPSFi8=;
 b=NlmbSwySmpgUDufs1xGZHTCMYGyYxMyi+193UoV+mf2t40/vFhJ8+2SYuYFPoUrgDXm8uO88W
 82KEOB49Bm9Cau5jMjg/aIqAkwYvSg328mWMEGggmJUlZquKL/1fSvP
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
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
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

Commit 9d498d0b4043 ("soc: mediatek: pwrap: add arbiter capability")
added PWRAP_CAP_ARB for PMIF-SPI arbiter SoCs (MT6873, MT8195, and the
upcoming MT6789), where the bootloader already initializes the wrapper
and the watchdog registers (PWRAP_WDT_UNIT, PWRAP_WDT_SRC_EN, and
PWRAP_WDT_SRC_EN_1) are absent from the per-SoC register tables.

However, pwrap_probe() only guarded PWRAP_WDT_UNIT with
!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB), leaving the writes to
PWRAP_WDT_SRC_EN and PWRAP_WDT_SRC_EN_1 unconditional. Because omitted
entries in static const int regs[] default to 0, those writes land at
offset 0x0 (PWRAP_INIT_DONE2) and overwrite it with wdt_src
(0xffffffff) on every probe. Similarly, falling into pwrap_init() on
PWRAP_CAP_ARB SoCs would write legacy non-arbiter registers whose
offsets also default to 0x0.

Extend the !HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) guard in
pwrap_probe() to cover PWRAP_WDT_SRC_EN, PWRAP_WDT_SRC_EN_1, and the
cold pwrap_init() fallback.

Fixes: 9d498d0b4043 ("soc: mediatek: pwrap: add arbiter capability")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Added in v3. Drafted with an AI coding assistant.

 drivers/soc/mediatek/mtk-pmic-wrap.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 9067718..6b0d462 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2533,7 +2533,8 @@ static int pwrap_probe(struct platform_device *pdev)
 	 * The PMIC could already be initialized by the bootloader.
 	 * Skip initialization here in this case.
 	 */
-	if (!pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) &&
+	    !pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
 		ret = pwrap_init(wrp);
 		if (ret) {
 			dev_dbg(wrp->dev, "init failed with %d\n", ret);
@@ -2554,16 +2555,18 @@ static int pwrap_probe(struct platform_device *pdev)
 	}
 
 	/* Initialize watchdog, may not be done by the bootloader */
-	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB)) {
 		pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
 
-	/*
-	 * Since STAUPD was not used on mt8173 platform,
-	 * so STAUPD of WDT_SRC which should be turned off
-	 */
-	pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN);
-	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
-		pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN_1);
+		/*
+		 * Since STAUPD was not used on mt8173 platform,
+		 * so STAUPD of WDT_SRC which should be turned off
+		 */
+		pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN);
+		if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
+			pwrap_writel(wrp, wrp->master->wdt_src,
+				     PWRAP_WDT_SRC_EN_1);
+	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
 		pwrap_writel(wrp, 0x3, PWRAP_TIMER_EN);
-- 
2.54.0 (Apple Git-157)




