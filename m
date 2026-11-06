Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63E7606A339
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZCAdSIac;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGS77yI4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WqCbehPeg42mkM3NuhRGWk2/Ovgf7IzdbwtVD2E9nX8=; b=ZCAdSIacsjRiMc
	G/sWGRN+ZEpiLcRIpfSFIofSsCzi/bnqV/zF0vyFhHz3kMjKY1gop1LR1jDpdbDnVLNQlXC4LlK+0
	JGndhjldYzpKdkbuiZpAQchkPYp8NZKDyb51xo7eV5qykbK5AFYyuG7YPAeXGLNWvKW3s5kG7SGGN
	1IJKC/YeZILjD41FNWIEKYE+/m/aScoJ7UOGXtDkllEkfr74HkRA6GfrwAbPkMZtRuRORdrM9P89t
	yNdzqbrTyiDZv6s61Zfs+zKt8na0RoeGXgH+b/n5EUqUasgwlaze42C4pALzc99aScdOZmUJGU7Hq
	i98yxS8dc1rsoURjHV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNY-0000000Cw4j-20tR;
	Fri, 06 Nov 2026 16:01:24 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNW-0000000Cw3O-3xed
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 16:01:24 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8b2382bf051so361318b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980882; x=1794585682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqCbehPeg42mkM3NuhRGWk2/Ovgf7IzdbwtVD2E9nX8=;
        b=CGS77yI4EfmcoG6eLJjjIgg0ChQSIA9A0o36tEiyONajLt9Uk7DKj2I7Z9VkypiUAQ
         mpixfd1cgPcVKF9pHfkp+mRLYglMP9T5HFiopHDXkmfEKJQln3j/Eo4izuhyOYf87NV5
         1OM5IeOzd+qbkwqBLzDIH5dhvl3Ab9MG2UjnBzee5JuFTWzmRNEy2WtL/IDH81pK+DmA
         HqKE9jCcOqU83KVwi9NjR3s7aZEL++qFsviHneOlvdv3h/Xik7fYZ98YMb+QhAc2w4ON
         gY3Ds+nFnK7pHHd35SRs6m1YX6Onck7ffcl7GH2e0ZKAJyl98fZdPyvXWT04UChaX5xa
         pwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980882; x=1794585682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WqCbehPeg42mkM3NuhRGWk2/Ovgf7IzdbwtVD2E9nX8=;
        b=mruD8ql4y0xWe6aQtIQIF5dA6dpdmIop7Hyhwk6rDSEIQ8CtRVo077ki/PfmGNrjnz
         l4DCl4Xw0e92ko045oG2UDMCsRBOLOXoy/RFuF4LsRoOFn72v8WMqofCpWOxv+JNcykX
         EtBWpgLehtI75Hyohe5kVASQX8x36UcUFxIMyAEHLQ6jaaP0sssMVbnPRjRj1tE1VTCc
         2odPkC3DvOBlYpXol2I0OlZDJcOj8AV4EquJm3NKV53XeEQYMbnXEQnB52NSazcOU+y7
         UbPS+CCciTciMCAUn7m2hXDy3saCNhwnrmgIW3F76rJv5/wTiZL+XrOockRUbzZXgKM1
         7okA==
X-Forwarded-Encrypted: i=1; AKwUvBwWVKhc08b9lq3NEsQqqwJQukage9EbBAsK7g9dRa5as+N9Of5/nr4MyIgqZv37rnbccHbPBWrpUU2yV7WQLg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9nLZqAfw1PybNohqKQ9aX85QtWtaZFvxYfrCTOXASlud0IuCHC
	ZQ7pva/0io69KTtGZ3JgPRHRAP3HlBk0W3f6b5uqzKayybCG/LCh36HX
X-Gm-Gg: AYBFou3Kygsh4d+jFIGt6807u6eTa7kRDU8liyAUDkn4pcQ4IQ891sz4XyoF2dH4Ga6
	kFCEWvx+WK1QRdH78yKuY2CXuyyxRAY/2BI52E+0HIz2PggniFNS0Acc4WJOgkzVf55QoGOvei4
	OZeTpirNmQ2/sRvxPKkuDcHWTaS7ugyNzeTjislwzAiBuC6K7Cgaf2YTCcgSQTgVngIfZME8Vtr
	9UKHJk39nD80xQ2JnLsGIFmxhuppa8h7i8XdZeATlYlvQzZ1hKmMPu7wThvGGjuYCaPn7zXKr7n
	TXF1LlhZuDuai9pYq3jN64osDEhldFINh8Uo2tu+fOg737BLqpjT6PVYX5C9CD81jWYJ31Ow1Q4
	u3LCiQqpLqySwtMSHglfv4eUD1Fk2EoU11wd7OEpdNPDseJXTWio1gn9ccIQgqOYoKejwqxTwAB
	EYJV1wCdcrfn0jjovtRFsy61xGc7CW6gY8fz7th6SNQ3XAb8gaXSr+j4CqIMGPP2Wa/ozZY0mRV
	sg14lKQq/ORCEN6yk+i3KgVsMxb9Z8S4WFV2h3nSPfNkcV24rLspaogHgSqfp89euohKXl/hy5K
	P4RvoIGB3Fmyy4w71yi7ijG3nqWzH5vzx+AMp3GhIbNVt4/S
X-Received: by 2002:a05:6300:2201:b0:3e1:549e:614f with SMTP id adf61e73a8af0-3ebb299d444mr3364948637.57.1793980882239;
        Fri, 06 Nov 2026 08:01:22 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm727930a12.25.2026.11.06.08.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:20 -0800 (PST)
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
Subject: [PATCH 2/3] power: supply: axp20x_usb_power: drain vbus_detect work before unregistering the supply
Date: Sat,  7 Nov 2026 01:00:56 +0900
Message-ID: <20261106160057.2754689-3-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106160057.2754689-1-hj351016@gmail.com>
References: <20261106160057.2754689-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080122_995475_A5B5BB95 
X-CRM114-Status: GOOD (  19.32  )
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

axp20x_usb_power_probe() registers the self-rearming vbus_detect poll
work for device-managed cancellation before it registers the power
supply:

	devm_delayed_work_autocancel(dev, &power->vbus_detect,
				     axp_data->axp20x_read_vbus);
	...
	power->supply = devm_power_supply_register(dev, ...);

devres unwinds in reverse registration order, so on unbind/unload the
power supply is torn down first and the work is cancelled last:

	power_supply_unregister(power->supply);		/* frees power->supply */
	cancel_delayed_work_sync(&power->vbus_detect);	/* too late */

power_supply_unregister() ends in device_unregister(&psy->dev), whose
release (power_supply_dev_release()) kfree()s the power_supply once the
last reference drops. The driver holds power->supply as a bare pointer
and takes no extra reference, so it is left dangling.

The vbus_detect handler (axp20x_usb_power_poll_vbus() /
axp717_usb_power_poll_vbus()) calls power_supply_changed(power->supply)
and re-queues itself via axp20x_usb_vbus_needs_polling(), so a poll
instance is essentially always pending or running whenever VBUS polling
is in use. It is also queued from the USB power IRQ. power_supply_changed()
unconditionally dereferences the supply (spin_lock on psy->changed_lock,
pm_stay_awake(&psy->dev), schedule_work on psy->changed_work) with no
use_cnt/removing guard on that path. If a poll instance runs in the
window after power_supply_unregister() has freed the supply but before
cancel_delayed_work_sync() has drained it, it dereferences freed
memory -> use-after-free.

Register the work cancellation after devm_power_supply_register(), so
devres (LIFO) cancels the work first -- while power->supply is still
valid -- and only then unregisters the supply. This mirrors the existing
"request irqs after registering" ordering in the same function: the IRQ
handler and the final queue_delayed_work() are the only things that
queue the work, and both already run after the supply is registered, so
devm_delayed_work_autocancel() still performs INIT_DELAYED_WORK() before
the work can first be scheduled.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires an AXP20x/AXP717-class PMIC).

Fixes: 6d0c5de2fd84 ("power: supply: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/power/supply/axp20x_usb_power.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/axp20x_usb_power.c b/drivers/power/supply/axp20x_usb_power.c
index 7625366..5274e1e 100644
--- a/drivers/power/supply/axp20x_usb_power.c
+++ b/drivers/power/supply/axp20x_usb_power.c
@@ -979,11 +979,6 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_delayed_work_autocancel(dev, &power->vbus_detect,
-					   axp_data->axp20x_read_vbus);
-	if (ret)
-		return ret;
-
 	if (power->vbus_mon_bit) {
 		/* Enable vbus valid checking */
 		ret = regmap_field_write(power->vbus_mon_bit, 1);
@@ -1018,6 +1013,17 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(power->supply),
 				     "Failed to register power supply\n");
 
+	/*
+	 * Register the vbus_detect poll work for device-managed cancellation
+	 * only after the power supply: devres unwinds LIFO, so the work -- whose
+	 * handler dereferences power->supply via power_supply_changed() -- must
+	 * be cancelled before the supply is unregistered and freed.
+	 */
+	ret = devm_delayed_work_autocancel(dev, &power->vbus_detect,
+					   axp_data->axp20x_read_vbus);
+	if (ret)
+		return ret;
+
 	/* Request irqs after registering, as irqs may trigger immediately */
 	for (i = 0; i < axp_data->num_irq_names; i++) {
 		irq = platform_get_irq_byname(pdev, axp_data->irq_names[i]);
-- 
2.43.0


