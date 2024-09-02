Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C099CCD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TyVDYav3Nzbmm84YEt4RiUopjs6QxdUyqIWaillQHM=; b=Sex113QjAunBAC/2ipn5feW3Rt
	/g8NmiixCYhWsSzdb6SJFJXeSO+qQUEpN9258Zur3n9o7Tyjs1Q9G+zB/IsZDJrMnLcA0u0u8pjhy
	WRJbEAFV16NeynU08GmorhlkJ3ml1NEA07Jar2Ji+bgRBHrBv381e4MYHs+70aaKlWiK1e4JEl/gF
	xb+biDa8TLaE4GehS1rVMIRrHajSVc/Vo+NnXbY0SlkZ4ILA+O+bzDNGkMQy5hFHDkf4t31LFyTGz
	27mmU9HAdrd7colfcFb+0X8jGg8OLkuzcn8zMdAOBLMzqxGIoCf6kDU+5/TrdikH/kRxfC8OHdfna
	o1LDBkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3HS-0000000DgdN-1X9t;
	Mon, 02 Sep 2024 09:23:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3Fr-0000000DgAl-2Yit;
	Mon, 02 Sep 2024 09:21:50 +0000
X-UUID: c67e6bb6690c11efba0aef63c0775dbf-20240902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0TyVDYav3Nzbmm84YEt4RiUopjs6QxdUyqIWaillQHM=;
	b=nLTTS1xHlJldfud33WnQxJLYYWnjVR+xszccl8WLp4psuV+PUxlKzo1IA/ftAe8ZGciXK4NZkz8Se473m9nOEwvG04BqC390UR0I4BiOCQDfL4fyK9WPvdQxEpqOkSyS85jphJhkKESQ6nfTct4qsQswBY+HOn4RPaYL8hfZ1fI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:98c47b85-a1e7-4dea-972f-8db3420ea3ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:888e2c15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c67e6bb6690c11efba0aef63c0775dbf-20240902
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1232481588; Mon, 02 Sep 2024 02:21:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Sep 2024 17:21:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Sep 2024 17:21:42 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: <stable@vger.kernel.org>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Yenchia Chen
	<yenchia.chen@mediatek.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Len
 Brown" <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 6.1 1/1] PM: sleep: Restore asynchronous device resume optimization
Date: Mon, 2 Sep 2024 17:21:20 +0800
Message-ID: <20240902092121.16369-2-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240902092121.16369-1-yenchia.chen@mediatek.com>
References: <20240902092121.16369-1-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.609000-8.000000
X-TMASE-MatchedRID: BBt3isQeX+AhSBTdgDTdzWivjLE8DPtZFAr+wPWe7jF3vUA6/Pi03D6w
	DkfdfiqcXr7NXg/pSgQefN6Epq6WAQtrOhDKumbSFYJUGv4DL3y1k3bRIdXVNGojx25puFlrKT3
	PsaLyojR2Drq+F6jWouKOmN63egZIZW+a5JK8E6htzb3s8Aa1ZoEcpMn6x9cZCqIJhrrDy2/j6f
	SiVX5Avye7w8ymgFM4n88pz6ki3TziteLUiHQ2KjCIlN/eSPB9pQH4ogtVQP0ifM7JMNHW67Ed0
	qNn8ZtHviELeOq3H9dv+GfOK6fpuGf/awmfCAYuqb4ybQC/JXM3GofkGVB3jpkd+ko3Vgxli18y
	270V9usnMrhHFzIbpcTKrSvo7uRnHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW8uEWPj8FUvT1QcP
	yn7Jx71FwKxCoIs0l76R+Ne/F29gGYeMEsOGG3UMMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.609000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EB139BE01F5C4CA15EB7AB3C3F70AE66EEA8A0798DB991896ED73109B1010E052000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_022147_797597_1E8E8A3C 
X-CRM114-Status: GOOD (  21.95  )
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

commit 3e999770ac1c7c31a70685dd5b88e89473509e9c upstream.

Before commit 7839d0078e0d ("PM: sleep: Fix possible deadlocks in core
system-wide PM code"), the resume of devices that were allowed to resume
asynchronously was scheduled before starting the resume of the other
devices, so the former did not have to wait for the latter unless
functional dependencies were present.

Commit 7839d0078e0d removed that optimization in order to address a
correctness issue, but it can be restored with the help of a new device
power management flag, so do that now.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
---
 drivers/base/power/main.c | 117 +++++++++++++++++++++-----------------
 include/linux/pm.h        |   1 +
 2 files changed, 65 insertions(+), 53 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 9c5a5f4dba5a..fadcd0379dc2 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -579,7 +579,7 @@ bool dev_pm_skip_resume(struct device *dev)
 }
 
 /**
- * __device_resume_noirq - Execute a "noirq resume" callback for given device.
+ * device_resume_noirq - Execute a "noirq resume" callback for given device.
  * @dev: Device to handle.
  * @state: PM transition of the system being carried out.
  * @async: If true, the device is being resumed asynchronously.
@@ -587,7 +587,7 @@ bool dev_pm_skip_resume(struct device *dev)
  * The driver of @dev will not receive interrupts while this function is being
  * executed.
  */
-static void __device_resume_noirq(struct device *dev, pm_message_t state, bool async)
+static void device_resume_noirq(struct device *dev, pm_message_t state, bool async)
 {
 	pm_callback_t callback = NULL;
 	const char *info = NULL;
@@ -674,16 +674,22 @@ static bool dpm_async_fn(struct device *dev, async_func_t func)
 {
 	reinit_completion(&dev->power.completion);
 
-	if (!is_async(dev))
-		return false;
-
-	get_device(dev);
+	if (is_async(dev)) {
+		dev->power.async_in_progress = true;
 
-	if (async_schedule_dev_nocall(func, dev))
-		return true;
+		get_device(dev);
 
-	put_device(dev);
+		if (async_schedule_dev_nocall(func, dev))
+			return true;
 
+		put_device(dev);
+	}
+	/*
+	 * Because async_schedule_dev_nocall() above has returned false or it
+	 * has not been called at all, func() is not running and it is safe to
+	 * update the async_in_progress flag without extra synchronization.
+	 */
+	dev->power.async_in_progress = false;
 	return false;
 }
 
@@ -691,18 +697,10 @@ static void async_resume_noirq(void *data, async_cookie_t cookie)
 {
 	struct device *dev = data;
 
-	__device_resume_noirq(dev, pm_transition, true);
+	device_resume_noirq(dev, pm_transition, true);
 	put_device(dev);
 }
 
-static void device_resume_noirq(struct device *dev)
-{
-	if (dpm_async_fn(dev, async_resume_noirq))
-		return;
-
-	__device_resume_noirq(dev, pm_transition, false);
-}
-
 static void dpm_noirq_resume_devices(pm_message_t state)
 {
 	struct device *dev;
@@ -712,18 +710,28 @@ static void dpm_noirq_resume_devices(pm_message_t state)
 	mutex_lock(&dpm_list_mtx);
 	pm_transition = state;
 
+	/*
+	 * Trigger the resume of "async" devices upfront so they don't have to
+	 * wait for the "non-async" ones they don't depend on.
+	 */
+	list_for_each_entry(dev, &dpm_noirq_list, power.entry)
+		dpm_async_fn(dev, async_resume_noirq);
+
 	while (!list_empty(&dpm_noirq_list)) {
 		dev = to_device(dpm_noirq_list.next);
-		get_device(dev);
 		list_move_tail(&dev->power.entry, &dpm_late_early_list);
 
-		mutex_unlock(&dpm_list_mtx);
+		if (!dev->power.async_in_progress) {
+			get_device(dev);
 
-		device_resume_noirq(dev);
+			mutex_unlock(&dpm_list_mtx);
 
-		put_device(dev);
+			device_resume_noirq(dev, state, false);
 
-		mutex_lock(&dpm_list_mtx);
+			put_device(dev);
+
+			mutex_lock(&dpm_list_mtx);
+		}
 	}
 	mutex_unlock(&dpm_list_mtx);
 	async_synchronize_full();
@@ -747,14 +755,14 @@ void dpm_resume_noirq(pm_message_t state)
 }
 
 /**
- * __device_resume_early - Execute an "early resume" callback for given device.
+ * device_resume_early - Execute an "early resume" callback for given device.
  * @dev: Device to handle.
  * @state: PM transition of the system being carried out.
  * @async: If true, the device is being resumed asynchronously.
  *
  * Runtime PM is disabled for @dev while this function is being executed.
  */
-static void __device_resume_early(struct device *dev, pm_message_t state, bool async)
+static void device_resume_early(struct device *dev, pm_message_t state, bool async)
 {
 	pm_callback_t callback = NULL;
 	const char *info = NULL;
@@ -820,18 +828,10 @@ static void async_resume_early(void *data, async_cookie_t cookie)
 {
 	struct device *dev = data;
 
-	__device_resume_early(dev, pm_transition, true);
+	device_resume_early(dev, pm_transition, true);
 	put_device(dev);
 }
 
-static void device_resume_early(struct device *dev)
-{
-	if (dpm_async_fn(dev, async_resume_early))
-		return;
-
-	__device_resume_early(dev, pm_transition, false);
-}
-
 /**
  * dpm_resume_early - Execute "early resume" callbacks for all devices.
  * @state: PM transition of the system being carried out.
@@ -845,18 +845,28 @@ void dpm_resume_early(pm_message_t state)
 	mutex_lock(&dpm_list_mtx);
 	pm_transition = state;
 
+	/*
+	 * Trigger the resume of "async" devices upfront so they don't have to
+	 * wait for the "non-async" ones they don't depend on.
+	 */
+	list_for_each_entry(dev, &dpm_late_early_list, power.entry)
+		dpm_async_fn(dev, async_resume_early);
+
 	while (!list_empty(&dpm_late_early_list)) {
 		dev = to_device(dpm_late_early_list.next);
-		get_device(dev);
 		list_move_tail(&dev->power.entry, &dpm_suspended_list);
 
-		mutex_unlock(&dpm_list_mtx);
+		if (!dev->power.async_in_progress) {
+			get_device(dev);
 
-		device_resume_early(dev);
+			mutex_unlock(&dpm_list_mtx);
 
-		put_device(dev);
+			device_resume_early(dev, state, false);
 
-		mutex_lock(&dpm_list_mtx);
+			put_device(dev);
+
+			mutex_lock(&dpm_list_mtx);
+		}
 	}
 	mutex_unlock(&dpm_list_mtx);
 	async_synchronize_full();
@@ -876,12 +886,12 @@ void dpm_resume_start(pm_message_t state)
 EXPORT_SYMBOL_GPL(dpm_resume_start);
 
 /**
- * __device_resume - Execute "resume" callbacks for given device.
+ * device_resume - Execute "resume" callbacks for given device.
  * @dev: Device to handle.
  * @state: PM transition of the system being carried out.
  * @async: If true, the device is being resumed asynchronously.
  */
-static void __device_resume(struct device *dev, pm_message_t state, bool async)
+static void device_resume(struct device *dev, pm_message_t state, bool async)
 {
 	pm_callback_t callback = NULL;
 	const char *info = NULL;
@@ -975,18 +985,10 @@ static void async_resume(void *data, async_cookie_t cookie)
 {
 	struct device *dev = data;
 
-	__device_resume(dev, pm_transition, true);
+	device_resume(dev, pm_transition, true);
 	put_device(dev);
 }
 
-static void device_resume(struct device *dev)
-{
-	if (dpm_async_fn(dev, async_resume))
-		return;
-
-	__device_resume(dev, pm_transition, false);
-}
-
 /**
  * dpm_resume - Execute "resume" callbacks for non-sysdev devices.
  * @state: PM transition of the system being carried out.
@@ -1006,16 +1008,25 @@ void dpm_resume(pm_message_t state)
 	pm_transition = state;
 	async_error = 0;
 
+	/*
+	 * Trigger the resume of "async" devices upfront so they don't have to
+	 * wait for the "non-async" ones they don't depend on.
+	 */
+	list_for_each_entry(dev, &dpm_suspended_list, power.entry)
+		dpm_async_fn(dev, async_resume);
+
 	while (!list_empty(&dpm_suspended_list)) {
 		dev = to_device(dpm_suspended_list.next);
 
 		get_device(dev);
 
-		mutex_unlock(&dpm_list_mtx);
+		if (!dev->power.async_in_progress) {
+			mutex_unlock(&dpm_list_mtx);
 
-		device_resume(dev);
+			device_resume(dev, state, false);
 
-		mutex_lock(&dpm_list_mtx);
+			mutex_lock(&dpm_list_mtx);
+		}
 
 		if (!list_empty(&dev->power.entry))
 			list_move_tail(&dev->power.entry, &dpm_prepared_list);
diff --git a/include/linux/pm.h b/include/linux/pm.h
index 93cd34f00822..bfc441099d8e 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -653,6 +653,7 @@ struct dev_pm_info {
 	bool			wakeup_path:1;
 	bool			syscore:1;
 	bool			no_pm_callbacks:1;	/* Owned by the PM core */
+	bool			async_in_progress:1;	/* Owned by the PM core */
 	unsigned int		must_resume:1;	/* Owned by the PM core */
 	unsigned int		may_skip_resume:1;	/* Set by subsystems */
 #else
-- 
2.18.0


