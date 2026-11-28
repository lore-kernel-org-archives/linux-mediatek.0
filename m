Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A60606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 04:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FSpSDMXW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgZytO7z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1omq5zaZSNAgQ0lIqwWNv6K7+NNYpic02q8zoYZFr/w=; b=FSpSDMXWdzH5MtbO1YcQ7BmYG0
	Q7U+7semP209g1YnIZ3yTvNWtgzDig+Fo6Nc3/zHuX9l0+MtOOYyjvFlZJ+vr7Cv75YKUz5lYlEgF
	cwWMPPSali/1hh1cMIQ8bdUSqd57uQp0ilr+JXkaL6AuWWhzjmaSWYziasw3nd1xn/bHi0WJni2Jh
	s6XXiAJg5pTvWtgDMDQjB89uxemjwNe4VAD7sBn7ymOM+7Z3Z8WHr39yqk12slpSLrmRmCxRnska+
	6Sg6iTlDpiTP67kK3QW49/u3tnVM6/LF+JNy8XljftZ3jVi2jgzlWuFVkALe3IcG8OkFCpDqSQcA1
	X3aKHGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXABI-00000000NTM-3DfO;
	Sat, 28 Nov 2026 04:37:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAB2-00000000NNM-2enl;
	Sat, 28 Nov 2026 04:36:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1874A60210;
	Sat, 28 Nov 2026 04:36:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795840603;
	b=qlLjLvaXjUTv721nX0dEHVNIqizxJs0sC3myetgmHLDy4C3BGd8aq1q3y6VYlcGnFB3+
	 C13lQICW62mxmJ8+vatZMnoWq2Q0w1NtjHkypdMe5O99bL6zZmERulHXuOWa71HJMZRcl
	 0TVzaYKHupzmZ3Nj79T8/tgcOoyUNoGFGtpRetoQ5LmNzT7v/t1bnqJv/u79o5px8Uv7q
	 9CnafP2e9ZBjiGDDXxGrWnKkyXyc8EC2FyImXwAYtOBSBPbTXV+KnH2VQGYt+QnnUiHQ5
	 YcKNmeLH0DkJJlAL9b0doyNJSLb24f5g1k2gSUGVLLCRuCDpCiHbf3QiDCWZ6DEevIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795840603;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1omq5zaZSNAgQ0lIqwWNv6K7+NNYpic02q8zoYZFr/w=;
	b=zgmwiOhurhZuXZX9+i26e6TzfxvAh8IsmKooevUnAWpopBqj6C71IP/UsyRvC1mKYHDv
	 Yr3w3iirS14FRSTiuw4GBxGp2wJHl5LzS4RKOsQ8zCg+S8zUz3ZbM7mbwWXrr8UiGH58P
	 whdfmLrbMSFgJlq3pVgKvbdTwr3lMuzZUwJbh73teejFoaXy9Zw4x3BEp5IUkmwQ45+bY
	 +HxlkpQ0oxxid6NFmewsyvzvAVEAigQnsSn9nFIbMrVtc2m7fRaYqUAe7vbGdEr/l1Gc8
	 OdhmmbFy8Z/qng+v+aa8k9dh/OarfW64mfkhcgILSHkz8lABZK8i+r+KKtsP3smX8+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 623A71F00898;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795840603;
	bh=1omq5zaZSNAgQ0lIqwWNv6K7+NNYpic02q8zoYZFr/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=IgZytO7zeSjY8JwAvA+dvrxBTBOsdco2VfX/t2VaWZel2Lkw3s30Z7zBbWPfayB3Z
	 xXaSDP2sNYr4kNQiG1viTMofQW0Zq/wq7ja23d4mMJqb5jRosEvNBnnupkXkB2ozoq
	 qMV6m//UGuRkdlIXbHT4AEtxVMaDkn4qMSOcSgVghEcJrTLXx0GBVkbtfvp3/XJTVQ
	 YNOwIvTKu/MGsmVbOY/uuetYwUlXZSBOf2r29kwHwZR6eI9ukGbKGDgiQ/1s2qulBn
	 wLBuch2HZrnqjTUubxYXpSgiU643a5PKUQo+EiL2aV1doKtfZBV7/T6E9e2OJdQbR1
	 v+kuxRqOAt6cA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E17914DFAB;
	Sat, 28 Nov 2026 04:36:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rva333@protonmail.com, amergnat@baylibre.com, me@adomerle.pw, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] soc: mediatek: mtk-pmic-pwrap: Skip WDT source and
 init on arbiter SoCs
Date: Sat, 28 Nov 2026 04:36:31 +0000
Message-Id: <20261128043629.67417-3-iasnezhkov@gmail.com>
In-Reply-To: <20261128043629.67417-1-iasnezhkov@gmail.com>
References: <20261128043629.67417-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795840589; l=3153;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=Olk5p4P7Ta5NkxLPdczqkMU6NbZVlJ+bSIfjfAU8K+w=;
 b=09LCe56FcQeyMWpC9kqoszJZEOLPk9XlVF/qbSz6ukumQiMkr0Y4A9RNiVGIlx6hhDQkIRBIv
 NRlGn5H1cqlA4dSzAgFOLZysOjWhpNFq4PsvUAgx2oQ5i4zi59yXXd7
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
Changes since v4:
- Rebased onto linux-next (after dev_err_probe() conversion in
  pwrap_probe()).

Added in v3. Drafted with an AI coding assistant.

 drivers/soc/mediatek/mtk-pmic-wrap.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 11f6f30..bdc0f90 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2553,7 +2553,8 @@ static int pwrap_probe(struct platform_device *pdev)
 	 * The PMIC could already be initialized by the bootloader.
 	 * Skip initialization here in this case.
 	 */
-	if (!pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) &&
+	    !pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
 		ret = pwrap_init(wrp);
 		if (ret)
 			return dev_err_probe(wrp->dev, ret, "init failed\n");
@@ -2571,16 +2572,18 @@ static int pwrap_probe(struct platform_device *pdev)
 				     "initialization isn't finished\n");
 
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




