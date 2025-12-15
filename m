Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B97D5B16C
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qaxvP2WYgpi5GMaZilKu13Wv/sdWBnmAfZaJh8qJCs=; b=4AxdnxCsd3RDOkj+ogIuHmOaoX
	5w1znZNaqDEjN+k8nuScX+pUZph9LAWxPcEqW2CY/qRESqHO4FflERmKCe6I1dG6XCpb7nFQnu0QI
	gOCXxZ9wAvrEMYRDkOCepOTqswEJbB5aoAATakhW9SvxyHq4gfA6iUTRb2cDKkfXLiD17IVTCu3MY
	1QcA4h4hsFVyrTORICAgjJiGqf2zRZ9KoBC2mErQWFDBG9BesT/4O911alNTCd57+YQNLNC9tSDR7
	DLAhwl7s8DG51uhZMavS7MNzzcMdz+eQyE5M9fbRsSnArfXHEHKtzvnT0FdTQp+5ZTdxtkGGzXOq6
	HsW15Ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9SG-00000003mqh-0Pao;
	Mon, 15 Dec 2025 14:21:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9SE-00000003mpd-337x
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Dec 2025 14:21:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4159600AC;
	Mon, 15 Dec 2025 14:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27364C4CEF5;
	Mon, 15 Dec 2025 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765808497;
	bh=MTKeMG3Bg3HAsEC7hfWzoaJNW/z6vXP7y9UpwJgb2Xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LOUnWz8f8B28/CmY93A7rmr4wvY2vxzJ4iJruFcYfnS6A16fTe6GKcuzkZjndkfYO
	 hxR3rFifSqdWt5sLao1yCxtMuU5yLlyangxWzGmQbSiiqA71mBwoKCjc6l8kwvON5P
	 NcNF2Vk2667uFdvGoOQPk5yUk/HJthKAhW+suNlNhmqlMS8bbMIsLVLRWotQOd6L/n
	 5ky7SnmylKzT9UXD6d1iyUocrJ76/5A4cdMSbkAKaoTYrnIwmRf5L+ck63XXj5Rrcq
	 jp4CXknDK2uAa40bVmejxyFxDWkuHBVH1bLfZAspw3ZvftPNcSVfaa3HUkAYdsxpdg
	 Y/TdBbMQPXALA==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Ed Tsai <ed.tsai@mediatek.com>, linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
 freddy.shin@mediatek.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v1] PM: runtime: Do not clear needs_force_resume with enabled runtime
 PM
Date: Mon, 15 Dec 2025 15:21:34 +0100
Message-ID: <12807571.O9o76ZdvQC@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <20251215122154.3180001-1-ed.tsai@mediatek.com>
References: <20251215122154.3180001-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
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

On Monday, December 15, 2025 1:21:42 PM CET ed.tsai@mediatek.com wrote:
> From: Ed Tsai <ed.tsai@mediatek.com>
> 
> needs_force_resume is a bitfield member in struct dev_pm_info and must
> be accessed under the same lock as its bitfield group.
> 
> A real concurrent write was observed between needs_force_resume and
> idle_notification; stacks below:
> 
> write needs_force_resume:
>   pm_runtime_reinit+0x110/0x360
>   really_probe+0xe0/0x464
>   __driver_probe_device+0x9c/0x104
>   driver_probe_device+0x3c/0x1a8
>   __device_attach_driver+0x100/0x17c
>   bus_for_each_drv+0x10c/0x168
>   __device_attach_async_helper+0x7c/0xf4
>   async_run_entry_fn+0x4c/0x1b4
>   process_scheduled_works+0x1dc/0x498
>   worker_thread+0x220/0x320
>   kthread+0x150/0x27c
>   ret_from_fork+0x10/0x20
> 
> write idle_notification:
>   rpm_idle+0x464/0x5f8
>   __pm_runtime_idle+0x7c/0x170
>   scsi_autopm_put_device+0x18/0x28
>   scsi_sysfs_add_sdev+0x1a0/0x1d8
>   scsi_probe_and_add_lun+0xbd8/0xcd0
>   __scsi_add_device+0xb8/0x11c
>   ufshcd_async_scan+0xb4/0x3a4
>   async_run_entry_fn+0x4c/0x1b4
>   process_scheduled_works+0x1dc/0x498
>   worker_thread+0x220/0x320
>   kthread+0x150/0x27c
>   ret_from_fork+0x10/0x20
> 
> Fixes: 89d9cec3b1e9 ("PM: runtime: Clear power.needs_force_resume in pm_runtime_reinit()")
> Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
> ---
>  drivers/base/power/runtime.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 84676cc24221..3328543b1ed8 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1879,11 +1879,22 @@ void pm_runtime_reinit(struct device *dev)
>  				pm_runtime_put(dev->parent);
>  		}
>  	}
> +
>  	/*
>  	 * Clear power.needs_force_resume in case it has been set by
>  	 * pm_runtime_force_suspend() invoked from a driver remove callback.
>  	 */
> +	if (dev->power.irq_safe)
> +		spin_lock(&dev->power.lock);
> +	else
> +		spin_lock_irq(&dev->power.lock);
> +
>  	dev->power.needs_force_resume = false;
> +
> +	if (dev->power.irq_safe)
> +		spin_unlock(&dev->power.lock);
> +	else
> +		spin_unlock_irq(&dev->power.lock);
>  }
>  
>  /**
> 

Thanks for the patch, but this happens because the flag is cleared when
runtime PM is enabled which shouldn't be necessary, so I'd prefer to make
the change below.

---
From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Subject: [PATCH v1] PM: runtime: Do not clear needs_force_resume with enabled runtime PM

Commit 89d9cec3b1e9 ("PM: runtime: Clear power.needs_force_resume in
pm_runtime_reinit()") added provisional clearing of power.needs_force_resume
to pm_runtime_reinit(), but it is done unconditionally which is a
mistake because pm_runtime_reinit() may race with driver probing
and removal [1].

To address this, notice that power.needs_force_resume should never
be set when runtime PM is enabled and so it only needs to be cleared
when runtime PM is disabled, and update pm_runtime_init() to only
clear that flag when runtime PM is disabled.

Fixes: 89d9cec3b1e9 ("PM: runtime: Clear power.needs_force_resume in pm_runtime_reinit()")
Reported-by: Ed Tsai <ed.tsai@mediatek.com>
Closes: https://lore.kernel.org/linux-pm/20251215122154.3180001-1-ed.tsai@mediatek.com/ [1]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/base/power/runtime.c |   22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1878,16 +1878,18 @@ void pm_runtime_init(struct device *dev)
  */
 void pm_runtime_reinit(struct device *dev)
 {
-	if (!pm_runtime_enabled(dev)) {
-		if (dev->power.runtime_status == RPM_ACTIVE)
-			pm_runtime_set_suspended(dev);
-		if (dev->power.irq_safe) {
-			spin_lock_irq(&dev->power.lock);
-			dev->power.irq_safe = 0;
-			spin_unlock_irq(&dev->power.lock);
-			if (dev->parent)
-				pm_runtime_put(dev->parent);
-		}
+	if (pm_runtime_enabled(dev))
+		return;
+
+	if (dev->power.runtime_status == RPM_ACTIVE)
+		pm_runtime_set_suspended(dev);
+
+	if (dev->power.irq_safe) {
+		spin_lock_irq(&dev->power.lock);
+		dev->power.irq_safe = 0;
+		spin_unlock_irq(&dev->power.lock);
+		if (dev->parent)
+			pm_runtime_put(dev->parent);
 	}
 	/*
 	 * Clear power.needs_force_resume in case it has been set by




