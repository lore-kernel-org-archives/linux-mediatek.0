Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA5ECA9EC5
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 01:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w5e0+n/SZwb+mdMGSpmZA8wmqSq0w/SQYcFKC9N+I3s=; b=J/f9AmlnjU1fFUwmmP1EJR31no
	AFTXwvkAzxFOF73YG/qixobuIRTboQT4/f4s2k3jrQFkALHZlC28/UlbKxiR5/Un8bDWCdlQthXcX
	G03tUu6KjyA2m/g/B42/4oC1D0ZvkS951rAS3BY+f08IR1UXLbiSXiuHCcqEgVvEh6/Hp3oDyLHBy
	TF12jJUxOr1I0m1MBjL6L2YoZ1c6Pc8ZzVcS+0tMTNdZt8lPX/jhjs0lwUmnE+/afW886ecUHlo/c
	tp6iQSXyxFPdDCmmnxivakSO0FGkEY0uEfjZOTC9uoUMLHFMMG1ceIfeXgFcQu+St/Rm6bTAvUZDk
	UDpkHsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFiAL-00000008c01-0ivN;
	Sun, 11 Oct 2026 01:15:53 +0000
Received: from mail-qk2-x01.google.com ([2607:f8b0:4864:34::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFiAH-00000008bz7-2sqJ
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 01:15:51 +0000
Received: by mail-qk2-x01.google.com with SMTP id d75a77b69052e-534b7b19206so10345631cf.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 18:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791681348; x=1792286148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5e0+n/SZwb+mdMGSpmZA8wmqSq0w/SQYcFKC9N+I3s=;
        b=kKXNpMvdGCshz7Wvh6Bo8moDODbU78qE56JkZ71FLzyaRJ5cx8FPIxE+6/jvbPSYqz
         pI61UbOupP3/OhCUrIeAWdaxY5eQLCHkr3NrNI24FsaAAO0o2RB4LJEp0sRmZiHJQbNe
         MfU/JSvrUMHd3snsYxBWhk7DOCmAO5ubjre1oDddDsLncyyOawA6z0O0waSFTmxQv+NT
         JbbWay6ifn9Nst0l2S28p4/LM49M8CXJjaF6nKMSRgWmmLIct/Q4Jaos9JiMhBnMZVXt
         h4laUi1Donauct7lYXXc87InVz/7eStXy9jmnrTAEA/q1RFu81m8QgCMXvbRCs8XlWr4
         nXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681348; x=1792286148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5e0+n/SZwb+mdMGSpmZA8wmqSq0w/SQYcFKC9N+I3s=;
        b=mjYJqRM0A6UKtkHQmZuqU1D/HSB/ZZQxsRZzf58IUA5dPfsmv0jLewYKoIVQHOo1iZ
         uKF+B8RY6U3fvPpaE33Zqx/2IPgYY0LInVS59qt6bXEKlmf6ibPPCqIQRdZGy1nxqoq2
         wYB9WCN5xBmTG8WTtHMXcjbLLZwJ8WcJ2JiQB2qVrsIVIz/lHVWHRnz74KXXoNdkRU0D
         UYJECQuW9qw+kwmFyXukL5l6mSL3f9RO9Vmx4l2eB2ohhVoCfyQ10vxPjOY9WGmBB6pz
         N+4K2jAlFHffO/QFfX0z0o1GJs4El60OVJo9cWc7ShCeksaTp44rDe8iHmeQ0rI4aN/z
         7kRw==
X-Forwarded-Encrypted: i=1; AKwUvBzrsHaTaHWZ7jWkbAKNyYwtGRfoAF6Ae/iahakN07UgJugajzX571M9KwznMS9zOv8oxPKN2Xe9ON+hNgY6tw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIESXqMg0X4Xd7C5JZOCKw5CKqOZGTX2ix8Tmbq9RVqv7SxQ6uC
	WEt03XpXE8U4U0O2RK0fUQUC4OSSt1BzanHbYrwfDaFSKtBgZvZ49VSf
X-Gm-Gg: AYBFou1+PtpSnEEfK5Nbiicyz8fQgv9we9hT2V9gX288X6oPTsvOhjgxpIRbXbjwVSv
	si999pJqgXbIE01MFWMIXjxnduU1DXCG8fhGkxM+Qz7N1RZEO2qzZjhyQGUyb78oAt/yayDhnz1
	x0LsW31ow2AezoaZ7sLZqh1zuBIkb3/Ro4Y9VXRA/c1apb5s5gDR7p8vN3Pr+Gwai10WemNi0c3
	MESFY0WSBrSdVF5YiKLQLtSaSCrxpVAOd+HuzyXTPJSPvANCA9OMZC0LLPZTrQpxpiBrdN9/d7M
	+bDfFUKFkwcxmDVhU2Z1csgkqhxzWV9yMxRZzVTbhUI4eLZZlLEKF5UccBpRUDhIOVCkWKhAp/U
	uJ467TNzEWUWYdL7dzfIU2sL66Mdk56vwmcOIb0l7e5snVZYDiWwYcXMhPbpChtO0mvqQUkoyVD
	53kRi7liQ+Oy/PCtc1uGfxR3McEoDmXjfU3HCZ+32eT2RPobcviY2vb2rhmDjN1yiXoT4=
X-Received: by 2002:a05:6214:3d8a:b0:919:5a24:d77c with SMTP id 6a1803df08f44-91b5556a830mr104675746d6.31.1791681348207;
        Sat, 10 Oct 2026 18:15:48 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550c354asm58641236d6.39.2026.10.10.18.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:15:47 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Freddy Hsin <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: mtk_wdt: Stop a running watchdog over system sleep even if not opened
Date: Sat, 10 Oct 2026 21:15:36 -0400
Message-ID: <20261011011536.1139162-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_181549_739235_45B8D73A 
X-CRM114-Status: GOOD (  16.20  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_wdt_suspend() and mtk_wdt_resume() only stop and restart the
watchdog when it is active, that is, when userspace has opened it.

But a watchdog that the bootloader left enabled stays enabled at probe,
marked WDOG_HW_RUNNING, and the watchdog core pings it until userspace
takes over; that has been the case since
commit bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe()
to prevent the system freeze and it doesn't reboot by watchdog problem").
If the system suspends before userspace opens the device, or userspace
never does, nothing stops the watchdog and nothing pings it while the
system sleeps, so it resets the system one timeout (31 s by default)
into the sleep.

Also stop it on suspend and restart it on resume when it is running in
hardware, like sp805_wdt does.

The core's ping worker for such a watchdog would keep running across
the sleep and could ping the stopped watchdog after resume, before
mtk_wdt_resume() has started it again. Have the core stop the worker
over system sleep with watchdog_stop_ping_on_suspend(), as imx2_wdt
does: it pings one last time before the system suspends and restarts
the worker once everything has resumed.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---
Changes in v2:
- Also call watchdog_stop_ping_on_suspend() in probe, so the core's ping
  worker doesn't run across the sleep and ping the stopped watchdog
  before mtk_wdt_resume() (pointed out by the Sashiko review of v1).
- Link to v1: https://lore.kernel.org/all/20261011004322.1118027-1-agentzoan@gmail.com/

Testing: on an MT8189 Chromebook (next-20261008 plus MT8189 support)
whose firmware leaves the watchdog off; a local module parameter
(mtk_wdt.start_timeout=31) starts it in probe the same way a
bootloader-enabled watchdog is picked up (WDOG_HW_RUNNING set, fed by
the watchdog core, nobody opening /dev/watchdog). Without the suspend
change the board reset about 30 s into s2idle. With v2: 4 s2idle cycles
of 60 s each, awake 45 s after every resume, all came back with no
reset (so the worker feeds it again after resume). v1 also passed a
10-minute s2idle sleep. Not tested with a watchdog actually left enabled
by a bootloader. Built with W=1, checkpatch --strict clean apart from
the sign-off.

 drivers/watchdog/mtk_wdt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1630ab65d593..3c493a470b37 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -543,6 +543,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	mtk_wdt_init(&mtk_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
+	watchdog_stop_ping_on_suspend(&mtk_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
 	if (unlikely(err))
 		return err;
@@ -572,7 +573,8 @@ static int mtk_wdt_suspend(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev))
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev))
 		mtk_wdt_stop(&mtk_wdt->wdt_dev);
 
 	return 0;
@@ -582,7 +584,8 @@ static int mtk_wdt_resume(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev)) {
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev)) {
 		mtk_wdt_start(&mtk_wdt->wdt_dev);
 		mtk_wdt_ping(&mtk_wdt->wdt_dev);
 	}

base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0


