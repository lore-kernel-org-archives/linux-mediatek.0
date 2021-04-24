Return-Path: <SRS0=4WJp=JV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E68C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 00:21:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0411A61006
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 00:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0411A61006
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lQsEsvgftlLNuCliB0NbWlNOrBx4n41IobokypiZQXI=; b=GDj8uRlqe8LGZPMQFo7u1ECOVy
	zmGKXCy6JQBnyC3FONx6P5+cTJFmRqFT2+7ZlvGBgUpwWY2Dy2R2PJSCOqr8++Zk2zIImptVqpoZK
	wnSucLi6HqjEPjiy7Etc2helehtsCYim5N3Qz3x0RFdGX7UC62C2uHARQnXneYQAGNqHaFzbx0o+n
	5MjTVfeNWyReRsyKxMGfyZdUq4BqiVzFHVHwzky4Ggv9yBbHdHTUXnM6XdOWSyzlJk9dUe/5zuNc7
	WFzhlkG/VBwTeXyxRC7ZcXlHUWSLhml2xKIadygN+mcFlj/ZRClw7oQOReYHetrYXOU8JOZ6RL2JH
	Uw87vGGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la62S-002f4C-PS; Sat, 24 Apr 2021 00:20:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la624-002ezv-7o; Sat, 24 Apr 2021 00:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=jY7ec2IzHj1F5PTEnU0go5PbplTcbsokaSnGibbiALo=; b=CnwuU4P80MGf3ZskshnpAiFoBU
 Z2n87Icodq6wYTC3G7F+YkFQ66FxXrs0+6pfZ1u4Aspjd4Xf1hl5mRzC0IToF1ZYUTZnJGOOG89Xj
 iDD14FttotqQ1S1lpp559FE9pgq7nglmF1R6nNuu9CM5a0yEqff1DgF5/Z9aSpJSBB2ZPLGI6D+K0
 7BIAh7pjsNwBLhWS6jRvDfKOb/g1vMRDiuTVdylo7VVOb0CwlBFmRBYKTqRKGjKqZ/iA0gx9OV7Dc
 n62es8jlyxGzvuXSzoUpDhw0QQOFT4p7PBN9DwLHA6omgjISQ5bRbZRpsVN1N9nJ6hHIS5d7Ht2P4
 Ek+v0FJg==;
Received: from labrats.qualcomm.com ([199.106.110.90])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la620-00EmnA-LL; Sat, 24 Apr 2021 00:20:22 +0000
IronPort-SDR: JaAr+b5Or5qRgBUODPyZyt70pX2iCiWrmebXXzFtprbNpJlCjW3TtnNPzKN/6/x9m9j2IFSRaz
 4sDDrjzEGI39nXcf1iua0FJ5USddobXDY4GT0pT6EBgqwjJDZ0d7fphkm0SDRsZkAuEx+bVyL9
 UyU+QOp+yzM56lIOQh0BDcz4kHsEj8A1m6cEuvsWepe4a/xlXhVP67xggluYAC6wrnMj1UOjL4
 eiG3eHJ+AUA764c/da+rzx41Q4rGXWe4UkpwDkSkp2SoYdHkAAdSs0VZtJTXytzDQH7k0x9Y3T
 NfM=
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="29757991"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by labrats.qualcomm.com with ESMTP; 23 Apr 2021 17:20:19 -0700
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg03-sd.qualcomm.com with ESMTP; 23 Apr 2021 17:20:19 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
 id 11B142161B; Fri, 23 Apr 2021 17:20:19 -0700 (PDT)
From: Asutosh Das <asutoshd@codeaurora.org>
To: cang@codeaurora.org, martin.petersen@oracle.com, adrian.hunter@intel.com,
 linux-scsi@vger.kernel.org
Cc: Asutosh Das <asutoshd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v21 0/2] Enable power management for ufs wlun 
Date: Fri, 23 Apr 2021 17:20:15 -0700
Message-Id: <cover.1619223249.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_172020_753649_C683873A 
X-CRM114-Status: GOOD (  15.87  )
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

v20 -> v21: 
- Addressed Adrian's comments

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
 drivers/scsi/ufs/ufshcd.c          | 700 ++++++++++++++++++++++++++-----------
 drivers/scsi/ufs/ufshcd.h          |  33 ++
 include/trace/events/ufs.h         |  20 ++
 14 files changed, 585 insertions(+), 264 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
