Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DBF606A326
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HpqKT0cD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqwhQzt5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=On7o3YDJ6A9N2qE/v0Dd5vQ6+keSrhVbU1SUb028uOU=; b=HpqKT0cDi6R3pL
	eMqOmcmAKB3Ywgr4C/im5CjQRDExpwAiIp/SMcYTienxasyLFKTY6ouJfIishd7TGi9JNqJ9ZDKvT
	yEXX/8U82D1XNvwDx/NhbOMyPktw2lZJhjYOGHFkTartuKM0BpFjWcmhgrS0+QU6KWy37CByWnzyS
	b0eKSYI0Z7oQJhxe262dnniFA0OVcm/s3NI5qGE3Nd3otyh/HCMb3KlyHuvt3Fl40mH/fVttAloFR
	0Bb+UtYBNaByA9hbITaCxHLIcHOy04q4N9SV4nOZbW4rf0f6d4Xd8YUwoqJkhqROkZBFcNVVZU4IM
	wCdDE8Cu4pDeHBOxNFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNU-0000000Cw0j-1MoJ;
	Fri, 06 Nov 2026 16:01:20 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNS-0000000CvyM-0C8N
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 16:01:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8a05b210703so365549b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 08:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980877; x=1794585677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=On7o3YDJ6A9N2qE/v0Dd5vQ6+keSrhVbU1SUb028uOU=;
        b=EqwhQzt5KvwAMx3qwIVG358EFvETvp+0ZaipXiHUTGJw9ZO29EONeymLZW3keL8xMt
         1EZ7MmTglfoe2j1nUdPzQ6rd+xR8wSaF3U0W9HWFj2PMnMKmWjoAheKG00SFf8G3YaGv
         JqHzpia9mj9fwrS86pzydw3iUQfyif/Om182p459x5hqZLqPWx6It3oZcBqQ0PvTIzMh
         6jTdMzIcN9Z4zyFYWKrW5MxfRQqcljz6/ZVAuPGMjOQBGOEqDKYg2tuNNH0uKmznx5MH
         dCXehjizDwunvfg40pV7YuctCQX0AKAisjC/SBFiCBVE6K9gPzFRqODdKV3jHBibBZI5
         XZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980877; x=1794585677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=On7o3YDJ6A9N2qE/v0Dd5vQ6+keSrhVbU1SUb028uOU=;
        b=lcSwDXfK2m8CFhZuN+vSQkG0hpIxe0NnQUHOzwMWPRjpTY4+glEqGcOxldJN+7QTZg
         ROYzlxsqZ18oOi3wAxfWqKptc1s+w2NUYb60es4b+NRnX6N6lmSTxgUIyE47/BjzBZaP
         ozz9Frlg6trFHFgomrsehfuKT2SaUWQRCiQojP88c5AkeBhsyn9R2XaMcqvsuu8vBHxe
         Gp7UMNJjyfFsCrAbTsJYC3X7Le+jh4jFLqdInUiSHPHn2dw2jiP6HhrpK6JZS2Twl5jI
         F0fgrfYsELj/jLNmwoVp65IjqF51OjDUJyGC2RoYG4wIxH/kjnCP0IY1CYANMsPR65HN
         dmaQ==
X-Forwarded-Encrypted: i=1; AKwUvByaQJ4/h3UgzCwOin0B/+VYeQitTvJujA6FnB6igEP76K/hXtiza1raxiJvNMgJYjLCy5tu0OEi9VJd6wN0dA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9m4aGy+9R1D5UUtgQLXQ4WBW5t6blo0TuGweGDZG0UB13K57Sm
	KZ3H8fe0/JPnySjjM92+z5gIw4Jj2SpAYJk+u/XhKwrBTiSvCE13EJG8
X-Gm-Gg: AYBFou3lImaPGujY/VT03FQQOUtR0e3/+mRxScXYLo8Dov+XGKgREvdwUMQXE635o6W
	rAiTWzczkDk4FKSCtfYEX3hl/mfgvZzqOD4ie8kx/IZTMAcVDaSawcYpcQQsQL8scwD6cxr2Weu
	AEna2kC9ioaBQCu5qYvu5h4KleF9fjsPvlvftEF/iW8neSGEyZ71mY0MHjRB7xXPDaF74M7ousQ
	XIrsQVsZaDF2KJ6Cx2Fs2JYDt9mDtvgYHk1sxux9512OXfndPmTbN/6Jec6qxGtckLS6GOfjFjP
	28UiiRatA8rK1m2RY9LOH2y+O9IrN/irSX0D9gdzudXbJsNzC1wwSTti9x46gbkMXitOaqyqeOw
	5DPSwmzVBwu5Og9GjvQSb1EjUKH3kP2Xtzrep7MT+qgoNk9aBcxtDlsZsv53ingHjoPtN0iGHdE
	gQ6fCtPYs+ekHT22Pme6xBC19cbwy7Bat6cwV0d2AQixaBoYtMlsHzw3cuvgX8NF/pOrcaLswcc
	kj0HpSeLyJDqqR/0k0zvsJIufZXyWuJp2xZOGbbGp/CoAwW8cfsRUfTiKuE6ObTOIs9f2uT3uGj
	hIYs7GXPRtOhMrdwcf6KSKnPUm0HW/1ud+5lWOZ2Vs5VmjxFtHHWY16IukzUqUXdeSvIP5o=
X-Received: by 2002:a05:6a21:880e:b0:3e0:b1b2:2af9 with SMTP id adf61e73a8af0-3ebb2aa0e0bmr2982479637.60.1793980876624;
        Fri, 06 Nov 2026 08:01:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm727930a12.25.2026.11.06.08.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:15 -0800 (PST)
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
Subject: [PATCH 1/3] power: supply: ltc2941: drain poll work before the power supply is unregistered
Date: Sat,  7 Nov 2026 01:00:55 +0900
Message-ID: <20261106160057.2754689-2-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106160057.2754689-1-hj351016@gmail.com>
References: <20261106160057.2754689-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080118_097496_53B5C997 
X-CRM114-Status: GOOD (  16.61  )
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

ltc294x_i2c_probe() registers the self-rearming poll work before the
power supply, so device-managed teardown drains it too late:

	devm_delayed_work_autocancel(&client->dev, &info->work, ltc294x_work);
	...
	info->supply = devm_power_supply_register(&client->dev, ...);
	...
	schedule_delayed_work(&info->work, LTC294X_WORK_DELAY * HZ);

devres unwinds in reverse registration order, so on unbind/unload the
power supply is torn down first and the work is cancelled last:

	power_supply_unregister(info->supply);		/* frees info->supply */
	cancel_delayed_work_sync(&info->work);		/* too late */

power_supply_unregister() ends in device_unregister(&psy->dev), whose
release (power_supply_dev_release()) kfree()s the power_supply once the
last reference drops. The driver holds info->supply as a bare pointer
and takes no extra reference, so it is left dangling.

ltc294x_work() re-queues itself unconditionally every LTC294X_WORK_DELAY
seconds, so a poll instance is essentially always pending or running at
unbind. Its ltc294x_update() calls power_supply_changed(info->supply),
which unconditionally dereferences the supply (spin_lock on
psy->changed_lock, pm_stay_awake(&psy->dev), schedule_work on
psy->changed_work) with no use_cnt/removing guard on that path. If the
poll instance runs in the window after power_supply_unregister() has
freed the supply but before cancel_delayed_work_sync() has drained it,
it dereferences freed memory -> use-after-free.

Register the work cancellation after devm_power_supply_register(), so
devres (LIFO) cancels the work first -- while info->supply is still
valid -- and only then unregisters the power supply. Nothing queues the
work before schedule_delayed_work() below (external_power_changed is
NULL and ltc294x_reset() does not touch the work), so moving the
registration is safe; devm_delayed_work_autocancel() still performs the
INIT_DELAYED_WORK() before the work is first scheduled.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires an LTC2941/LTC2943 gas-gauge chip).

[USER: add a Fixes: tag. SHA not verifiable in this graft-at-7.3
 worktree. The bug entered when ltc294x_i2c_probe() was converted
 to devm_delayed_work_autocancel() ahead of
 devm_power_supply_register()
 (drivers/power/supply/ltc2941-battery-gauge.c). On a full-history
 tree, blame those two devm calls; confirm the 12-char SHA +
 subject of the devm-autocancel conversion before send.]
Fixes: 6d0c5de2fd84 ("power: supply: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/power/supply/ltc2941-battery-gauge.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/ltc2941-battery-gauge.c b/drivers/power/supply/ltc2941-battery-gauge.c
index 6ebb555..8f8a8f6 100644
--- a/drivers/power/supply/ltc2941-battery-gauge.c
+++ b/drivers/power/supply/ltc2941-battery-gauge.c
@@ -531,11 +531,6 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 
 	psy_cfg.drv_data = info;
 
-	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
-					   ltc294x_work);
-	if (ret)
-		return ret;
-
 	ret = ltc294x_reset(info, prescaler_exp);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
@@ -547,6 +542,11 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(info->supply),
 			"failed to register ltc2941\n");
 
+	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
+					   ltc294x_work);
+	if (ret)
+		return ret;
+
 	schedule_delayed_work(&info->work, LTC294X_WORK_DELAY * HZ);
 
 	return 0;
-- 
2.43.0


