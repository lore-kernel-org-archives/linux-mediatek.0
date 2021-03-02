Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8709EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 15:11:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A7D64EEC
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 15:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A7D64EEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hf3D32T5zoefXkYIcCoMnBFsG7DXOXqywDu+Daxfgc8=; b=XI47Mk0yMjKJSk0+qZKKBxfcJH
	U6wgPNt22KkErO3WhWUY+PDVG0HNTgcjU2La+JBGItXllChvFf2T6czIspG7qGFi8+LDmGCkw/157
	0pplPvaHOVLcSLwk7GZ7VnqSdQEOEvjwBbue6+Opdq4Q4txSZfWRwTAbM/7G+jhwnSO8V9yCn5MNu
	tOmrNCv3Nt3HzCv+sBuCkg009UqViLoosSuKRVJ3Hn/zeDIwZltXGGggeEZRwFxsy+8c0yt3cYWYR
	jEa4NcokI8ER9ITdCiEevtJUKkznx/S0gSnTJnhe1v927xQy67+YdTpv2Gx9rtw11Cm7kc5xIJN78
	ZCzcrfAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHT9s-005KN8-Sb; Wed, 03 Mar 2021 15:11:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSCf-0054oI-GF; Wed, 03 Mar 2021 14:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=h16X0+DjBZSurBXF2aDZgFPmE0Kramd53m57jnSrguc=; b=vCsVeha8bWSv3J3s0YInsF1cdC
 5rF9cDetnPBdPgdbp+fnZyZUhpMmLNSElPhoQfl0nmshNuvEB7HVN+XobyNBzAL3d8WShc99dvKa0
 TWTq7s5trqOHyv2/WMEDaSxjgN7dDn9meX4decPKg9sbRYTHZ0mYO7g5YTcSSpO2DX6Luau80tqgF
 4+xvbbHhsxBUTcI83u8dvhdKz9yKAMNtwsFSQg8k1gGu4UZEDYQaFpt49zGozgqDgUeqs4wF719Kd
 VjIttObdbzwLX80sUylwFBnlE5e5Ppfp2giGGYp0V/aXgDer0Yktnkm3fii4lUcceXJFS/RkmWI1F
 +5rfj1EQ==;
Received: from labrats.qualcomm.com ([199.106.110.90])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHDtn-000Yfw-2f; Tue, 02 Mar 2021 22:53:53 +0000
IronPort-SDR: Ku/2tvU1mziBv/wFkxKsgeyj/GnEr3N9oLa1lndvAmr0EEqwJjrsXHYomQUd5DGHLWsP4EHQhR
 5g9cymtHs4jxw0FXbP3f5FfaUbD4NMBpkh9V0ImMri709x4iRU/pFxVV47LjB5NhNDVMyvPi/q
 rlce33zDqqKsEOSIt0r9swpNN/Ibb6Tb3llk8fB19RrxYdbBphEG1h4CiYqq4eSvd42bYgnjTB
 J32ooCMzStc4xNzZjSyVoahbpVpIvOsr2PgiTeEgQJDiUBeyTYvthm5+xbIxlev28bKLbMFvmj
 7eA=
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="29681797"
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by labrats.qualcomm.com with ESMTP; 02 Mar 2021 14:52:39 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg04-sd.qualcomm.com with ESMTP; 02 Mar 2021 14:52:39 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
 id 0A2AF21A50; Tue,  2 Mar 2021 14:52:39 -0800 (PST)
From: Asutosh Das <asutoshd@codeaurora.org>
To: cang@codeaurora.org, martin.petersen@oracle.com, adrian.hunter@intel.com,
 linux-scsi@vger.kernel.org
Cc: Asutosh Das <asutoshd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v10 0/2] Enable power management for ufs wlun 
Date: Tue,  2 Mar 2021 14:52:33 -0800
Message-Id: <cover.1614725302.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_225353_109335_6ECA4592 
X-CRM114-Status: GOOD (  12.24  )
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
 drivers/scsi/ufs/ufs-exynos.c      |   2 +
 drivers/scsi/ufs/ufs-hisi.c        |   2 +
 drivers/scsi/ufs/ufs-mediatek.c    |   2 +
 drivers/scsi/ufs/ufs-qcom.c        |   2 +
 drivers/scsi/ufs/ufs-sysfs.c       |  30 +-
 drivers/scsi/ufs/ufs_bsg.c         |   6 +-
 drivers/scsi/ufs/ufshcd-pci.c      |  32 +-
 drivers/scsi/ufs/ufshcd.c          | 583 +++++++++++++++++++++++++++----------
 drivers/scsi/ufs/ufshcd.h          |   7 +
 include/trace/events/ufs.h         |  20 ++
 12 files changed, 495 insertions(+), 195 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
