Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E3EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 07:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6z7wb73TI5B+UxzEE4tUU1fDiUSEroUg7/2kVg15gKQ=; b=OjMQ6bHpanPxSk
	2MtXMTxQiQaer8mFbEJleXIT6yziTWXZQ5DkEHo7MSqpoQW0w98Yb/BAfuxq+tZ+CBC655tpO9VIM
	2maiVuZ+8nUWNl+9n4eaWoUPBbjilZK5u9qSyTus/xP021HhqkrSrWrDZny8Vqmhd7Yh8xbfXhRdZ
	VAYD5Ycf4hd8MgLq8FiN6hRsnOGf7ncjPps0tUl/uTgNt3mZ2HHNm1p0++tynmdOW/6eJi+NMjHi6
	eJA7alx/O/cztXrk3LdpsjdVyPovRkh8ox8ITt6TLbcqfXwAGYgUdCbUZQyU99exulo3aT3qwCPH1
	JEI6Vkj2S+cs6syldZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPgJm-005dzA-9E; Thu, 03 Mar 2022 07:56:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPgJY-005dvM-KC; Thu, 03 Mar 2022 07:55:59 +0000
X-UUID: 6ff8d0eabe174a83bdc0e317b2f9cc7a-20220303
X-UUID: 6ff8d0eabe174a83bdc0e317b2f9cc7a-20220303
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <alice.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 79116698; Thu, 03 Mar 2022 00:55:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 23:55:49 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 3 Mar 2022 15:55:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Mar 2022 15:55:47 +0800
From: Alice Chao <alice.chao@mediatek.com>
To: <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
 <matthias.bgg@gmail.com>, <linux-scsi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <stanley.chu@mediatek.com>, <peter.wang@mediatek.com>,
 <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
 <jonathan.hsu@mediatek.com>, <powen.kao@mediatek.com>,
 <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <jiajie.hao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
 <yanxu.wei@mediatek.com>, <wsd_upstream@mediatek.com>
Subject: [PATCH 1/1] scsi: Fix racing between dev init and dev reset
Date: Thu, 3 Mar 2022 15:55:27 +0800
Message-ID: <20220303075527.25258-1-alice.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_235556_712085_D5854295 
X-CRM114-Status: GOOD (  10.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Device reset thread uses kobject_uevent_env() to get kobj.parent
after scsi_evt_emit(), and it races with device init thread which
calls device_add() to create kobj.parent before kobject_uevent_env().

Device reset call trace:
fill_kobj_path
kobject_get_path
kobject_uevent_env
scsi_evt_emit			<- add wait_event()
scsi_evt_thread

Device init call trace:
fill_kobj_path
kobject_get_path
kobject_uevent_env
device_add				<- create kobj.parent
scsi_target_add
scsi_sysfs_add_sdev
scsi_add_lun
scsi_probe_and_add_lun

These two jobs are scheduled asynchronously, we can't guaranteed that
kobj.parent will be created in device init thread before device reset
thread calls kobj_get_path().

To resolve the racing issue between device init thread and device
reset thread, we use wait_event() in scsi_evt_emit() to wait for
device_add() to complete the creation of kobj.parent.

Signed-off-by: Alice Chao <alice.chao@mediatek.com>
---
 drivers/scsi/scsi_lib.c  | 1 +
 drivers/scsi/scsi_scan.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 0a70aa763a96..abf9a71ed77c 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -2461,6 +2461,7 @@ static void scsi_evt_emit(struct scsi_device *sdev, struct scsi_event *evt)
 		break;
 	case SDEV_EVT_POWER_ON_RESET_OCCURRED:
 		envp[idx++] = "SDEV_UA=POWER_ON_RESET_OCCURRED";
+		wait_event(sdev->host->host_wait, sdev->sdev_gendev.kobj.parent != NULL);
 		break;
 	default:
 		/* do nothing */
diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index f4e6c68ac99e..431f229ac435 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -1904,6 +1904,7 @@ static void do_scsi_scan_host(struct Scsi_Host *shost)
 	} else {
 		scsi_scan_host_selected(shost, SCAN_WILD_CARD, SCAN_WILD_CARD,
 				SCAN_WILD_CARD, 0);
+		wake_up(&shost->host_wait);
 	}
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
