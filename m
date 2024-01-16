Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F21C3DA79
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 00:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqQK+wuHjj+2NMnr1ZsTaGRuk0D0/SsG9NdOJHc2XTs=; b=MXCOxM+YA+5RVIUFByW3m0BEEG
	ln/a1idcviDbjpRxQvnUUAFXzN5CYQ5f5Cqye3XBMJH7YJ12f4OtnvkXBZ3miLLs5yzXxZETR0ITa
	fhMufFEtY4nzZ/6HB787I500KSpPvKpzkS3NuFC2QXugDXhHc1EU8WGkcE5gHzUt/EHf1gR72CjNG
	VFrk9MKfxuW17/wjF92LMWeQG2qXU0hdeDXVxySaN3QaampTFsVIyY6ZehZ8NXKbH6Rn+h5BhDV9Q
	ruSDp0n90a8UxC/FiU3uux4NfqNbJwacHRPIaGX/RpPyXHKxy1Yu/iRoPcwbvqR7Q8+jKLltr4F1k
	+IlkMhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPX5P-00ASn9-2d;
	Tue, 16 Jan 2024 00:13:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPX5L-00ASmg-26;
	Tue, 16 Jan 2024 00:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DABF1CE180B;
	Tue, 16 Jan 2024 00:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72D1C433C7;
	Tue, 16 Jan 2024 00:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705364020;
	bh=qu8PZWL5sa4HADRmhp8O/xnDAnb+X3Fz4jVED4/Lwsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lf7ZY1IJiiVtM6xVuHvS5TN9wz1+kxMtqs9WUhosdOD2UQIcDuXSAvotLTMZAregC
	 PzxwQfHsHdkHhaQ8+iYvusOI97wj26Qteu/d1e8pMDJJ6ucnEB227TAdlEN5B0orZD
	 pOttQNna5gH4oO+xHSeauFfQnyYD5H1J34ipt6IavLefIBR9QQs7jq6JGo2S9uMq5j
	 LCX/VnBLpcFIo5r67K8vqqSgtfv/dvRPQZChRGGkxiNBg5/rcBUzhB3fT9n/WXR4kQ
	 WeiM3Pnqx4CR+r2nTHnER6RwZF59JR+SaTYcptT6KP2KlGuS00WIVk2MmgRfC+Hdbn
	 FmMGTUWOGG3Kw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Bo Ye <bo.ye@mediatek.com>,
	Sasha Levin <sashal@kernel.org>,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.7 18/18] thermal: core: Fix thermal zone suspend-resume synchronization
Date: Mon, 15 Jan 2024 19:13:00 -0500
Message-ID: <20240116001308.212917-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116001308.212917-1-sashal@kernel.org>
References: <20240116001308.212917-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_161344_043084_C5D8624A 
X-CRM114-Status: GOOD (  16.35  )
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

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

[ Upstream commit 4e814173a8c4f432fd068b1c796f0416328c9d99 ]

There are 3 synchronization issues with thermal zone suspend-resume
during system-wide transitions:

 1. The resume code runs in a PM notifier which is invoked after user
    space has been thawed, so it can run concurrently with user space
    which can trigger a thermal zone device removal.  If that happens,
    the thermal zone resume code may use a stale pointer to the next
    list element and crash, because it does not hold thermal_list_lock
    while walking thermal_tz_list.

 2. The thermal zone resume code calls thermal_zone_device_init()
    outside the zone lock, so user space or an update triggered by
    the platform firmware may see an inconsistent state of a
    thermal zone leading to unexpected behavior.

 3. Clearing the in_suspend global variable in thermal_pm_notify()
    allows __thermal_zone_device_update() to continue for all thermal
    zones and it may as well run before the thermal_tz_list walk (or
    at any point during the list walk for that matter) and attempt to
    operate on a thermal zone that has not been resumed yet.  It may
    also race destructively with thermal_zone_device_init().

To address these issues, add thermal_list_lock locking to
thermal_pm_notify(), especially arount the thermal_tz_list,
make it call thermal_zone_device_init() back-to-back with
__thermal_zone_device_update() under the zone lock and replace
in_suspend with per-zone bool "suspend" indicators set and unset
under the given zone's lock.

Link: https://lore.kernel.org/linux-pm/20231218162348.69101-1-bo.ye@mediatek.com/
Reported-by: Bo Ye <bo.ye@mediatek.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/thermal/thermal_core.c | 30 +++++++++++++++++++++++-------
 include/linux/thermal.h        |  2 ++
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 9c17d35ccbbd..fe3bcfba4d67 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -37,8 +37,6 @@ static LIST_HEAD(thermal_governor_list);
 static DEFINE_MUTEX(thermal_list_lock);
 static DEFINE_MUTEX(thermal_governor_lock);
 
-static atomic_t in_suspend;
-
 static struct thermal_governor *def_governor;
 
 /*
@@ -405,7 +403,7 @@ void __thermal_zone_device_update(struct thermal_zone_device *tz,
 {
 	const struct thermal_trip *trip;
 
-	if (atomic_read(&in_suspend))
+	if (tz->suspended)
 		return;
 
 	if (WARN_ONCE(!tz->ops->get_temp,
@@ -1515,17 +1513,35 @@ static int thermal_pm_notify(struct notifier_block *nb,
 	case PM_HIBERNATION_PREPARE:
 	case PM_RESTORE_PREPARE:
 	case PM_SUSPEND_PREPARE:
-		atomic_set(&in_suspend, 1);
+		mutex_lock(&thermal_list_lock);
+
+		list_for_each_entry(tz, &thermal_tz_list, node) {
+			mutex_lock(&tz->lock);
+
+			tz->suspended = true;
+
+			mutex_unlock(&tz->lock);
+		}
+
+		mutex_unlock(&thermal_list_lock);
 		break;
 	case PM_POST_HIBERNATION:
 	case PM_POST_RESTORE:
 	case PM_POST_SUSPEND:
-		atomic_set(&in_suspend, 0);
+		mutex_lock(&thermal_list_lock);
+
 		list_for_each_entry(tz, &thermal_tz_list, node) {
+			mutex_lock(&tz->lock);
+
+			tz->suspended = false;
+
 			thermal_zone_device_init(tz);
-			thermal_zone_device_update(tz,
-						   THERMAL_EVENT_UNSPECIFIED);
+			__thermal_zone_device_update(tz, THERMAL_EVENT_UNSPECIFIED);
+
+			mutex_unlock(&tz->lock);
 		}
+
+		mutex_unlock(&thermal_list_lock);
 		break;
 	default:
 		break;
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index cee814d5d1ac..1da1739d75d9 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -149,6 +149,7 @@ struct thermal_cooling_device {
  * @node:	node in thermal_tz_list (in thermal_core.c)
  * @poll_queue:	delayed work for polling
  * @notify_event: Last notification event
+ * @suspended: thermal zone suspend indicator
  */
 struct thermal_zone_device {
 	int id;
@@ -181,6 +182,7 @@ struct thermal_zone_device {
 	struct list_head node;
 	struct delayed_work poll_queue;
 	enum thermal_notify_event notify_event;
+	bool suspended;
 };
 
 /**
-- 
2.43.0


