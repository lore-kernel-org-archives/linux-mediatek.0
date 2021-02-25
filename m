Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79269C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 23:37:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F75764F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 23:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F75764F26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJVzLnIXqiHO4l4c8zWecOaW1MYJLpzJkUf/lqDiWIs=; b=nXp/wkQUKs5sFgErVn83De6+RX
	kWDcFvAPSuhQ/7+05J9FgSVvaJrqyYIH4oUm0TaykMUuZc94giY33PVrJDnzGYzMwWOWpw1bX0gy8
	QJigIkmU4v0kwqEu7qSOtMPNbV3UE3rcCZuL7LY6Q103YJFHu4nneFzdthZ+CrDRpy1MEu9j28FmL
	ieC4+JAYjahF85r7QF9ivu1pMxj7CI7RNeopdpLaR6AFKbU9C0fpoJrL21/y/uEVgX5U31soOCejT
	5Kgw2GQYrP2dVcskRSdJiZZAzGHosEtXqG5MCEw5m0XQcKEd+/W3Bqw0kZ6T+JZzZSWISM8LfQDqd
	DOeE43mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFQCV-0004Xm-DE; Thu, 25 Feb 2021 23:37:43 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFQCR-0004WQ-JE; Thu, 25 Feb 2021 23:37:40 +0000
IronPort-SDR: 8ZKnWHuV6wdP9AY/ZuI0iI39Qz52MGEQXTGWf6cKvsbeMzYyR/GkwpNy4AE4B+FhHLvigkE8P4
 Y8TG/fq3tWLPGwaHbdNPx0A6sEVC9SQvkopV2PSw2lh2kDqzHPqZcGl88au3UX/7qnQ4N02kUQ
 dRrnW+CRWlsXNIvGCgk65DNSO8kTUk2jrjhQQa6Xd1tsk7I+oFAtWmG9X1NvhxJMiTaqeLsCSo
 cvtafwzPQPHhOGJADThOxRfRil0/PS23icqSDYxrCJh7lp1Bs9ilGwqo+bqAPPJ6xImnJu2aCj
 K7o=
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="47791155"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by labrats.qualcomm.com with ESMTP; 25 Feb 2021 15:37:39 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg01-sd.qualcomm.com with ESMTP; 25 Feb 2021 15:37:38 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 92687)
 id 5ABE121A25; Thu, 25 Feb 2021 15:37:38 -0800 (PST)
From: Asutosh Das <asutoshd@codeaurora.org>
To: cang@codeaurora.org, martin.petersen@oracle.com, adrian.hunter@intel.com,
 linux-scsi@vger.kernel.org
Subject: [PATCH v8 0/2] Enable power management for ufs wlun
Date: Thu, 25 Feb 2021 15:37:32 -0800
Message-ID: <cover.1614295674.git.asutoshd@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_183739_809373_08E092AF 
X-CRM114-Status: GOOD (  13.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-msm@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Asutosh Das <asutoshd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
Message-ID: <20210225233732.jfYs0fkYM6oMDhlnZvgPou1PZlBss76iJ4KcSx6Gm4k@z>

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
 drivers/scsi/ufs/ufs-sysfs.c       |  26 +-
 drivers/scsi/ufs/ufshcd-pci.c      |  26 +-
 drivers/scsi/ufs/ufshcd.c          | 540 ++++++++++++++++++++++++++++++-------
 drivers/scsi/ufs/ufshcd.h          |   7 +
 include/trace/events/ufs.h         |  20 ++
 11 files changed, 498 insertions(+), 133 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
