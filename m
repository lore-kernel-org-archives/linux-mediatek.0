Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685FE60A2612
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ugtV16QF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Szd48X2e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ypJ08Z/cH9sdI6bgD8/7yWENIXEqxl6euoBHXQWcshE=; b=ugtV16QFzwsfKURngNAZsHM5Qr
	8EmfLcsQtwhPuwbHbO2nvPatQYO8wYSVetDWQNJseAHWfrci9vRHnl5w6wZVJJhBBgwQX4RCfyxFY
	Qc2NAdfuYnYWfbkyfQTKH/8eclOfB1DZvXy1GRhWgJCH1CBH1Uqrwx4VtPk4OzsE0OnuBYYweDLUv
	u46Y4Z0yEStcjjVC30FekvcYL68gXevjN4QAGVU9uQZ+HgtNIJPAcn4ZRkkvTPJ/NSgaDwW3hCSA8
	8vf1diD1z/L2M4+Vgwf2ztyDfVuwh49Bi/fH6B4sWWOLud0LmK7+dy68ibXXRRjoTwjRUrrlg1H84
	kw6uOKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThl8-00000009KwP-0cpC;
	Wed, 18 Nov 2026 15:39:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThl6-00000009KvR-063J;
	Wed, 18 Nov 2026 15:39:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5996442BB8;
	Wed, 18 Nov 2026 15:39:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795016379;
	b=ZLWnXGDgZ8+uAIvPzM6FYaLwFJjmW2U3RUn4lNg51mpsgtumpwnHzAV6URKbzasV69aL
	 f5JvHzHj79aaIkk+ESEhSgzENj1dtwPAsE1EV2NfF2fJpWh+pZyIpOnmVrslxhS9+Mp9S
	 a1WEbM+Ky5b+yZ8uF6bhc+2AczzF1ItWx5YaHbrzDARJbLh1ksIXSDov12KhTIQ99VDkK
	 XVm+3V1VGsiCozwQ4ONlYmoXTW9OILU2FBwHOBGhlIDaNAUuoRdTJSZj7pjq0OjSAGrkP
	 dwgp08raTP+xX0SvvnN+oGigkYTpCdJI1F4kgpwFca55zWJvHsPklOuRExfbtUsIebg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795016379;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ypJ08Z/cH9sdI6bgD8/7yWENIXEqxl6euoBHXQWcshE=;
	b=wfXQaWJ7mCqNkyAwyJt2xns+mxhs1IM8vCKVPoHCOE41hqxhpOgvSH1npoyqAzTibANE
	 XDGPSJdYdOdfyAtPMUUSI/S9jPMvomgIYkR1+h1ELdrXGnAB0ROmOwg7q3UdbYXRACIv0
	 0HOvbk5sYc4edfYcaMAJJJAbzFyPoDI3E4PfnUPDvf4kNdwQRrmXPzG7hDKMoe3Io11Cj
	 xfXCixbg0ZPggxuRpvSZQvNl6KN6U/TjMkzk3Zsbzjs/x/RICD/vL88VSb5LBX1YErqAP
	 pK7jzaW4C3AhAhBPdkWcEtLniVbTtgZtRhL72DYYF7UDHF7stgOOGkWnSfA6QeNe7aQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D59E1F000C8;
	Wed, 18 Nov 2026 15:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795016379;
	bh=ypJ08Z/cH9sdI6bgD8/7yWENIXEqxl6euoBHXQWcshE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Szd48X2epr/W7NQHXko7KLD7VBhdpWF7W8bMakDo30m+Ll4ypAFlbQKkLJlOAmcJn
	 9g8BNXs6NmzdwiDaJsIgRWh4Sb9oxbBqTR8bqsfgGvxvffJ+BcEbe2UzpDSHodlnzJ
	 8XQIuhPjB6R3b48ZiU4VG8Sqw9WJoBdvLVSGB6Cyff2lFwZNUkf61GC1lR9ydTeBuI
	 GqZG/w8pFl+2MtLdQdwk1n0zvtxfY0h4n07X0qYGbeMFcSC9rqm/qsxw3YdDtF0R6J
	 97QFvFOyhW2N5xeVmb4on1Ke17IymCef26r0yAknhosgiWSzsh5fU+Y1CtGA47RXsO
	 4dYKobYxHC+vQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2D7FE4AE12;
	Wed, 18 Nov 2026 15:39:38 +0000 (UTC)
From: Ryan Leung via B4 Relay <devnull+untilscour.protonmail.com@kernel.org>
Date: Wed, 18 Nov 2026 15:39:31 +0000
Subject: [PATCH RESEND v4] wifi: mt76: mt7996: add thermal zone device
 registration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-mt7996-thermal-zone-v4-1-fd26d2a55b0c@protonmail.com>
X-B4-Tracking: v=1; b=H4sIALLG/WoC/yWNwQ7CIBBEf6XZsyQtaYr1bK892KPxQGGVNRYMo
 FEb/l3Q45vMvFkhoCcMsKtW8PikQM5maDcVKCPtBRnpzMBr3tWCc7ZE0fcdiwb9Im/s4ywy2Wg
 Uam604FvIy7vHM71+1iMchmkY93D65+ExX1HFoixNQyE6/y73KaUvkSbj744AAAA=
X-Change-ID: 20260722-mt7996-thermal-zone-a1de7cb1d728
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Leung <untilscour@protonmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016378; l=4995;
 i=untilscour@protonmail.com; s=20260906; h=from:subject:message-id;
 bh=uvdd8eEFkrwV4Xyy+ziwLkkjmUbgGSFn3bMaGJTPF3w=;
 b=J0I2IvqJvGrgPUC4nnU+/Ex13oHDnooV/SeIF9rb5QhfKwF7JxDZBWJZkZrvpY0lOXZKmcPd9
 4pSRuLmT6h9Ayyrvc33h2Kb5Omxi9Z9MTGSrZeEXH7b8cKeHTHjdzCm
X-Developer-Key: i=untilscour@protonmail.com; a=ed25519;
 pk=eCaNcoQNRWYKZ9D7KbOGKvQVK2YFguJXZxglTtAR7Xk=
X-Endpoint-Received: by B4 Relay for untilscour@protonmail.com/20260906
 with auth_id=1011
X-Original-From: Ryan Leung <untilscour@protonmail.com>
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
Reply-To: untilscour@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ryan Leung <untilscour@protonmail.com>

Register the mt7996 phy as a thermal zone sensor using
devm_thermal_of_zone_register() so that device tree thermal-zones
nodes can reference the Wi-Fi chip as a temperature source. This
allows the kernel thermal governor to control external cooling
devices such as PWM fans based on Wi-Fi chip temperature.

Registration is non-fatal: -ENODEV is returned when no
thermal-sensors DT property references this device, which is the
expected case on platforms without a thermal zone configured.

Unregister the thermal zone together with the existing cooling device
when the phy is torn down, and on the hwmon registration failure path
in the same init routine, so neither is left registered against a phy
that is about to be freed. Clear both pointers after unregistering,
since this init-time failure path can now run before the normal
teardown path also unregisters the same phy, and without clearing them,
that second call would unregister already-freed objects.

Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
Changes in v4:
- Clear phy->tzone/phy->cdev in mt7996_unregister_thermal() after
  unregistering, making it idempotent.
- Link to v3: https://patch.msgid.link/20260810-mt7996-thermal-zone-v3-1-ae9d7cd6cde1@protonmail.com

Changes in v3:
- Unwind cdev/tzone registration in mt7996_thermal_init() on hwmon registration failure.
- Link to v2: https://patch.msgid.link/20260810-mt7996-thermal-zone-v2-1-563dfbbf9175@protonmail.com

Changes in v2:
- Take phy->dev->mt76.mutex around mt7996_mcu_get_temperature()
- Unregister phy->tzone explicitly in mt7996_unregister_thermal() before the phy is freed
- Link to v1: https://patch.msgid.link/20260722-mt7996-thermal-zone-v1-1-88896e6e9985@protonmail.com
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 40 +++++++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  1 +
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index cc94eade9950..e28fe357c9d7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -234,17 +234,42 @@ static const struct thermal_cooling_device_ops mt7996_thermal_ops = {
 	.set_cur_state = mt7996_thermal_set_cur_throttle_state,
 };
 
+static int mt7996_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct mt7996_phy *phy = thermal_zone_device_priv(tz);
+	int val;
+
+	mutex_lock(&phy->dev->mt76.mutex);
+	val = mt7996_mcu_get_temperature(phy);
+	mutex_unlock(&phy->dev->mt76.mutex);
+	if (val < 0)
+		return val;
+
+	*temp = val * 1000;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops mt7996_tz_ops = {
+	.get_temp = mt7996_thermal_get_temp,
+};
+
 static void mt7996_unregister_thermal(struct mt7996_phy *phy)
 {
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
 	char name[sizeof("cooling_deviceXXX")];
 
+	if (phy->tzone) {
+		devm_thermal_of_zone_unregister(phy->dev->mt76.dev, phy->tzone);
+		phy->tzone = NULL;
+	}
+
 	if (!phy->cdev)
 		return;
 
 	snprintf(name, sizeof(name), "cooling_device%d", phy->mt76->band_idx);
 	sysfs_remove_link(&wiphy->dev.kobj, name);
 	thermal_cooling_device_unregister(phy->cdev);
+	phy->cdev = NULL;
 }
 
 static int mt7996_thermal_init(struct mt7996_phy *phy)
@@ -275,14 +300,27 @@ static int mt7996_thermal_init(struct mt7996_phy *phy)
 	phy->throttle_temp[MT7996_CRIT_TEMP_IDX] = MT7996_CRIT_TEMP;
 	phy->throttle_temp[MT7996_MAX_TEMP_IDX] = MT7996_MAX_TEMP;
 
+	phy->tzone = devm_thermal_of_zone_register(phy->dev->mt76.dev,
+						   phy->mt76->band_idx, phy,
+						   &mt7996_tz_ops);
+	if (IS_ERR(phy->tzone)) {
+		if (PTR_ERR(phy->tzone) != -ENODEV)
+			dev_warn(phy->dev->mt76.dev,
+				 "failed to register thermal zone %d: %ld\n",
+				 phy->mt76->band_idx, PTR_ERR(phy->tzone));
+		phy->tzone = NULL;
+	}
+
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
 
 	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
 						       mt7996_hwmon_groups);
 
-	if (IS_ERR(hwmon))
+	if (IS_ERR(hwmon)) {
+		mt7996_unregister_thermal(phy);
 		return PTR_ERR(hwmon);
+	}
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index da9958647b54..63154c338362 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -388,6 +388,7 @@ struct mt7996_phy {
 
 	struct ieee80211_sband_iftype_data iftype[NUM_NL80211_BANDS][NUM_NL80211_IFTYPES];
 
+	struct thermal_zone_device *tzone;
 	struct thermal_cooling_device *cdev;
 	u8 cdev_state;
 	u8 throttle_state;

---
base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
change-id: 20260722-mt7996-thermal-zone-a1de7cb1d728

Best regards,
--  
Ryan Leung <untilscour@protonmail.com>



