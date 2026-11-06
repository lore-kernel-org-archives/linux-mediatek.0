Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002F606A32E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AB0g6O4D;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBjzqXdS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=stncjCpIcaZGwyCzQ3Mf39ygwW1cfGfLhkLPVcA4MfQ=; b=AB0g6O4DY29GLa
	q5cuQ3bjdbFLPDPImKG6H8wzyWetUWw/QRCUevp0MClDQloNfwD+roGx0AMqEoSQJ1IMnOjee83k6
	fv/4/oejw4DPZxIb1lvdzHOV2+wTYWsP38vdvcWm8UBzL7IRCB7Tal8S8CRFsMFTvFvmzGjUMiR9q
	jwNjFHekRQCnyPA+Af1Qe8YI0v214iK3aSsL1KFhv4BjgK5BQgEx3Bt0sWe6ugBYz6nmkdiqUWbaY
	0//+CIhihDl6i4yTy/05gco388GMNNZKW6I/9/QZi6gjZWKAwuL2nZ6rFi4xeGb8LkisfrowrtxS6
	TC9/O3sy15hHov6gONQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNf-0000000CwBM-3m7V;
	Fri, 06 Nov 2026 16:01:31 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNc-0000000Cw7z-32ui
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 16:01:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so567953b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980887; x=1794585687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stncjCpIcaZGwyCzQ3Mf39ygwW1cfGfLhkLPVcA4MfQ=;
        b=vBjzqXdSBas7tTGLWSoM+FFqFCAI4aOdnGcYJweHV1yJgMFF49/bB8iET4FI7J63Yx
         uh0dh5FtkNfnis4bN80k0xwVVlVatSTMyM3qHVwrqZTT3poM27wDPReT8/93w3bUQIQF
         CQhlBJm5P80bFooi2HTuCKckCPuufRqSuiM6J3OA5ECdpQXAh5K+Vz9NiHBbmGiU1+iw
         sKb6ibwGLo7rNn/J3W9Y2dVojHXoDdU1cl15bZVoV+Ptbjk3PP5ejeXbmdxxhwiyuoym
         Y/jTsZXRWKhlcHmDccmNkbvDz3m8rO/Wz6j068udnwBrQnbE8l1y2tmKF17rlXqKaUky
         4JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980887; x=1794585687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=stncjCpIcaZGwyCzQ3Mf39ygwW1cfGfLhkLPVcA4MfQ=;
        b=n5OmFM+OAHLvC3mO+Ewj9ZfWZ6Unp+XeV6VGtbcdzcNJxF58so6azTmiP9afeQl2Yc
         tsJczG5Zib0Pw82ARyvm1HU4J0Nhi8if3jdp04KnLtvaapaf1d+7TKs1iatWzXuVL4yJ
         dQAu/2BQAW2yueQNE+Qj8cCTBhwRl20OPdowHTQjxp4uD80BBpF7tb7d6VU+po5kLOal
         FiVzbOhTJJfjggPmYBJ2Eb5YNTVo9+hO7NkVcsnxiSDDsGvzKcS5k2nhRx/sMFILE6vz
         omhCbHHhdi4MKS6B375Om+bpsEuQ8gS6Laxwbf1/HXjK3AVK0b0hDzQCNuToEgxYWCBF
         /3mA==
X-Forwarded-Encrypted: i=1; AKwUvBzJKbEkhoc23eJqkK8dbcG81URXyQvuETiasv6ctBGfZxo7ux+iLhV5Q85ftVxeIybIyz5LRsfQqZjdvJqktQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8cNviOP0tRsIkqNFh4xuUYDbnVloyY3rKoR3XDI0gP4yNGCDDc
	bFa27q8Lwb9sGnQj5XNacywXQNG7A5MgOFtvKyQBpRT9fU8ysWF+zcEn
X-Gm-Gg: AYBFou2+By32lseEIy44qVuWNoQIdQmakS3zJcsAAcY5Gp3Z7LUGZ8goWhCO+lcFFLX
	DtoCC5XJDy7W1sUqWv1a+LNRdeQCS58+aahzAr2rle+mn5u1VljvEN8xA0SVELdk+Was+UnMsE6
	EF10fpAaeYA88nKEYbc1TAh96gAk970Y0OQ6v29iI7cAfCZrhywZ1F0AIppe8apjZ0WNkn78lm3
	nbrvnNRHxELON+3GDhuINrUUSNfxvNFtmuBGQjk2XNMETGo/xiL4nuYteJNycKIc1V7MZZOPw4Y
	p1zpz+KhwrpurADBIhG0X2VbmsLUl1H22wQ/8WCyzuT8Hm2ZPiRWJQQsSMiHoSdKdl5GAcLUky5
	cVZTQsKBbmYhGlOzIE0X1izPPt6ld8Urj6G8EiWcbU05yHwjVCVJiZYLZEZKLaTc2jDRn1Y43LT
	dGFgC1uvjz2YtM2qHTMnhLDOtq0IodwvbhlXlwrqg9gYSrRzBeu6N2PN6UkWDBdbSsyvA6lvlvp
	dIddD2NayED//5aiDRIwgMJUsuytt3J8LyaoE6GADQE56N8BaMz2lHS8NN+4nb+8jZqeOjq8wGn
	/5aAEoN4OZtJJ1DFtL7RwGpB57YERczZrFZAuDzRPvnud1+A
X-Received: by 2002:a05:6a21:599:b0:3eb:aa33:e586 with SMTP id adf61e73a8af0-3ebb29c72f3mr3246747637.32.1793980887506;
        Fri, 06 Nov 2026 08:01:27 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm727930a12.25.2026.11.06.08.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:26 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] power: supply: mt6360_charger: drain chrdet_work before the power supply is freed
Date: Sat,  7 Nov 2026 01:00:57 +0900
Message-ID: <20261106160057.2754689-4-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106160057.2754689-1-hj351016@gmail.com>
References: <20261106160057.2754689-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080128_770356_4480C8E1 
X-CRM114-Status: GOOD (  14.98  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

mt6360_charger_probe() registers the chrdet_work cancellation via
devm_work_autocancel() *before* devm_power_supply_register(), so devres
(which unwinds in reverse) frees the power supply device first and only
then cancels the work:

	devm_work_autocancel(..., &mci->chrdet_work, ...);   /* registered 1st */
	...
	mci->psy = devm_power_supply_register(...);          /* registered 2nd */
	...
	schedule_work(&mci->chrdet_work);

The work handler mt6360_chrdet_work() runs mt6360_handle_chrdet_ext_evt(),
which calls power_supply_changed(mci->psy). chrdet_work is scheduled at
the end of probe, so on an unbind that races that work, devres tears down
in reverse order: devm_power_supply_register()'s release frees the power
supply device before the devm_work_autocancel action drains chrdet_work,
and the work then dereferences the freed mci->psy -> use-after-free.

Register the work cancellation after devm_power_supply_register() (and
after the other devm resources), so reverse-order devres cleanup drains
chrdet_work while mci->psy is still valid. chrdet_work is only scheduled
later in probe, so moving the devm_work_autocancel() (which also
initialises the work) down is safe.

Found by code review; not runtime-reproduced (requires MT6360 PMIC
hardware and a charger-detect event racing device unbind).

[USER: add a Fixes: tag. SHA not verifiable in this graft-at-7.3 worktree.
 Blame the devm_work_autocancel() introduction in mt6360_charger.c on a
 full-history tree and confirm the 12-char SHA + subject before send.]
Fixes: 0402e8ebb8b8 ("power: supply: mt6360_charger: add MT6360 charger support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/power/supply/mt6360_charger.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index b4d4623..e382db4 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -790,9 +790,6 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	mci->vinovp = 6500000;
 	mutex_init(&mci->chgdet_lock);
 	platform_set_drvdata(pdev, mci);
-	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
 
 	ret = device_property_read_u32(&pdev->dev, "richtek,vinovp-microvolt", &mci->vinovp);
 	if (ret)
@@ -828,6 +825,16 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	if (IS_ERR(mci->otg_rdev))
 		return PTR_ERR(mci->otg_rdev);
 
+	/*
+	 * Register the work cancellation only after the power supply is
+	 * registered.  devres unwinds in reverse, so this guarantees the
+	 * work (which calls power_supply_changed(mci->psy)) is drained
+	 * before the power supply device is freed on unbind.
+	 */
+	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
+
 	schedule_work(&mci->chrdet_work);
 
 	return 0;
-- 
2.43.0


