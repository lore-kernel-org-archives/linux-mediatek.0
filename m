Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B62C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 19:50:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0B1613C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 19:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0B1613C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t2LSVpJFcwGX2pMrJ12ILPq7oghjV4moM9kIQx4LgPs=; b=R9DE5YK9kOeuSEE/4vzaRzazJi
	jCtcbr1N70pF1RZBX0XODkcVtRjkveei5AZKHv9YO5waZ9qtHT4r79EUkySzMr7kUC025Oo1qJS9Y
	y46PIB8agJ+dqPYB/R6E4cEXa57m27kUZ8K4u/1JMZyuXDqqCTtwP+NnVpyOLyrJpecrgsjM5N5g1
	5jSPouaaGn1+iY2OEC0wHFYD3vhPCpexHnhkNPG7TL2CnxyCFVFvm9mykN0OgShfUqxJajcYyl3pk
	KtRHc/CYMpivYwCOot84EYVq4pAgRgBJ2sbrakt4uGH9RvcovHr6vZGGdvnyj7dxDDDF3Ii9C2hmv
	XPWFVc0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXUTK-003GPq-4k; Fri, 16 Apr 2021 19:49:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXUT9-003GP7-Eq; Fri, 16 Apr 2021 19:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=oM/WS/J38RInl5wMhtwvCPFSiHBjulHHssRHlVAKQGA=; b=dHnRFQqCeergisXPMeiwvuWQfR
 Sl0uYvHTK0c6xyQNhi/pRn0k0i3KwwgtQ8YQVC6zGaeAdVozW7GwFRh9Zc3XOu43nRIALQDrwFAnr
 BRSSzPvBdJgdBRkINHlNQT4syfcuDkFcFzdB57E92ScrUuzqK1St4yf4EE42edFw5+pD3cLQZs7qP
 Y837N6LPJXisIGsmfU/FOtey46p8RbVK42O3TldvQF/H0clCE+u/hp60vAMLC1V77tVhIDZQP08JW
 PydxYP8p1+Olk9rofqjIR3nWXRyjkY3h67EX1I3V7DYc5C3PInoC/7lMd8ytSzEa2kjjx5qBXWhaj
 eNum32iw==;
Received: from labrats.qualcomm.com ([199.106.110.90])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXUT3-009fEw-De; Fri, 16 Apr 2021 19:49:34 +0000
IronPort-SDR: yEGHPUEBsQUrfeshkypGDcZ3MLRjnQ4C12LgtraP4KrN/CXA14X8ldsEXILpdWit7bTAPUmZCG
 aJv282gaN3RD3dXwQ2PnqWmH61b533qHD/niNXA+mQcRGqKH1Ag+WEgwpWQC7XfC702QJ1AWMO
 UUUelnT+2rHFMfL/baeOMrWnfKVZJlKf7g3LrwW5uJlluqydnWlSkd7yj8SdFZmldsZqRiLpyx
 gwo54iykIomtX1aew43a33gATq/sV/uSzN8MCdGGhu4Ps9H4sUfHMIVxTFF+Z6YdVjzRxyADvc
 vNw=
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="29752530"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by labrats.qualcomm.com with ESMTP; 16 Apr 2021 12:49:28 -0700
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg02-sd.qualcomm.com with ESMTP; 16 Apr 2021 12:49:28 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
 id 34BD5213F9; Fri, 16 Apr 2021 12:49:28 -0700 (PDT)
From: Asutosh Das <asutoshd@codeaurora.org>
To: cang@codeaurora.org, martin.petersen@oracle.com, adrian.hunter@intel.com,
 linux-scsi@vger.kernel.org
Cc: Asutosh Das <asutoshd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v20 0/2] Enable power management for ufs wlun 
Date: Fri, 16 Apr 2021 12:49:24 -0700
Message-Id: <cover.1618600985.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_124929_511222_607B10F8 
X-CRM114-Status: GOOD (  16.66  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch attempts to fix a deadlock in ufs while sending SSU.
Recently, blk_queue_enter() added a check to not process requests if the
queue is suspended. That leads to a resume of the associated device which
is suspended. In ufs, that device is ufs device wlun and it's parent is
ufs_hba. This resume tries to resume ufs device wlun which in turn tries
to resume ufs_hba, which is already in the process of suspending, thus
causing a deadlock.

This patch takes care of:
* Suspending the ufs device lun only after all other luns are suspended
* Sending SSU during ufs device wlun suspend
* Clearing uac for rpmb and ufs device wlun
* Not sending commands to the device during host suspend

v19 -> v20:
- Addressed Adrian's comments
- Addressed Bart's comments

v18 -> v19:
- Addressed Adrian's comments
- Fixed smatch warnings

v17 -> v18:
- Addressed Adrian's comments

v16 -> v17:
- Addressed Adrian's & Daejun's comments

v15 -> v16:
- Brought back the missing changes
  * Added scsi_autopm_[get/put] to ufs_debugfs[get/put]_user_access()
  * Fix ufshcd_wl_poweroff()

v14 -> v15:
- Rebased on 5.13/scsi-staging

v13 -> v14:
- Addressed Adrian's comments
  * Rebased it on top of scsi-next
  * Added scsi_autopm_[get/put] to ufs_debugfs[get/put]_user_access()
  * Resume the device in ufshcd_remove()
  * Unregister ufs_rpmb_wlun before ufs_dev_wlun
  * hba->shutting_down moved to ufshcd_wl_shutdown()

v12 -> v13:
- Addressed Adrian's comments
  * Paired pm_runtime_get_noresume() with pm_runtime_put()
  * no rpm_autosuspend for ufs device wlun
  * Moved runtime-pm init functionality to ufshcd_wl_probe()
- Addressed Bart's comments
  * Expanded abbrevs in commit message

v11 -> v12:
- Addressed Adrian's comments
  * Fixed ahit for Mediatek driver
  * Fixed error handling in ufshcd_core_init()
  * Tested this patch and the issue is still seen.

v10 -> v11:
- Fixed supplier suspending before consumer race
- Addressed Adrian's comments
  * Added proper resume/suspend cb to ufshcd_auto_hibern8_update()
  * Cosmetic changes to ufshcd-pci.c
  * Cleaned up ufshcd_system_suspend()
  * Added ufshcd_debugfs_eh_exit to ufshcd_core_init()

v9 -> v10:
- Addressed Adrian's comments
  * Moved suspend/resume vops to __ufshcd_wl_[suspend/resume]()
  * Added correct resume in ufs_bsg

v8 -> v9:
- Addressed Adrian's comments
  * Moved link transition to __ufshcd_wl_[suspend/resume]()
  * Fixed the other minor comments

v7 -> v8:
- Addressed Adrian's comments
  * Removed separate autosuspend delay for ufs-device lun
  * Fixed the ee handler getting scheduled during pm
  * Always runtime resume in suspend_prepare()
  * Added CONFIG_PM_SLEEP where needed
  
v6 -> v7:
  * Resume the ufs device before shutting it down

v5 -> v6:
- Addressed Adrian's comments
  * Added complete() cb
  * Added suspend_prepare() and complete() to all drivers
  * Moved suspend_prepare() and complete() to ufshcd
  * .poweroff() uses ufhcd_wl_poweroff()
  * Removed several forward declarations
  * Moved scsi_register_driver() to ufshcd_core_init()

v4 -> v5:
- Addressed Adrian's comments
  * Used the rpmb driver contributed by Adrian
  * Runtime-resume the ufs device during suspend to honor spm-lvl
  * Unregister the scsi_driver in ufshcd_remove()
  * Currently shutdown() puts the ufs device to power-down mode
    so, just removed ufshcd_pci_poweroff()
  * Quiesce the scsi device during shutdown instead of remove

v3 RFC -> v4:
- Addressed Bart's comments
  * Except that I didn't get any checkpatch failures
- Addressed Avri's comments
- Addressed Adrian's comments
  * Added a check for deepsleep power mode
  * Removed a couple of forward declarations
  * Didn't separate the scsi drivers because in rpmb case it just sends uac
    in resume and it seemed pretty neat to me.
- Added sysfs changes to resume the devices before accessing


Asutosh Das (2):
  scsi: ufs: Enable power management for wlun
  ufs: sysfs: Resume the proper scsi device

 drivers/scsi/ufs/cdns-pltfrm.c     |   2 +
 drivers/scsi/ufs/tc-dwc-g210-pci.c |   2 +
 drivers/scsi/ufs/ufs-debugfs.c     |   6 +-
 drivers/scsi/ufs/ufs-debugfs.h     |   2 +-
 drivers/scsi/ufs/ufs-exynos.c      |   2 +
 drivers/scsi/ufs/ufs-hisi.c        |   2 +
 drivers/scsi/ufs/ufs-mediatek.c    |  12 +-
 drivers/scsi/ufs/ufs-qcom.c        |   2 +
 drivers/scsi/ufs/ufs-sysfs.c       |  24 +-
 drivers/scsi/ufs/ufs_bsg.c         |   6 +-
 drivers/scsi/ufs/ufshcd-pci.c      |  36 +-
 drivers/scsi/ufs/ufshcd.c          | 719 ++++++++++++++++++++++++++-----------
 drivers/scsi/ufs/ufshcd.h          |  21 ++
 include/trace/events/ufs.h         |  20 ++
 14 files changed, 592 insertions(+), 264 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
