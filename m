Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987A8C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A1CA20836
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nLx/x6z1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mzDV54eH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A1CA20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fA4Dw0u2zzoFM5e2wHJEq1V2IZRD5lwFMuADhr58npg=; b=nLx/x6z1LLDW6R
	+BZ+l79crqDzBuk7T8NBBlxzx/kVVhxncnOey96Jcuel7exE9K3+4OK4rlyQ7Jy7Qws/x1JuVjJi4
	SAJnHRU/USGLJIpH/Lrzz7nMXbn/qWWeQj1ov6XcpmDUouM6RjnnjfuSRH4z7B+w5k38NDf7ZJD8l
	/cHb+lSvlFUqV3nVoiaqUYISP8pwCHtTIjJwv/wXvnXwRKkceUnxYS6xKHyCbUuvWDvPRawq6Rs+u
	KjO6lT68scyQfO/hbDFAUVwJnwJUpALnmBO8iS7XbrbQNmMva8fteMvW4/2hP31IL4pxeZiNAtbWS
	S86VVPqGfkDdioJ1d2Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9Kbb-0005pU-IL; Wed, 04 Mar 2020 03:21:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9KbY-0005nv-D4
 for linux-mediatek@lists.infradead.org; Wed, 04 Mar 2020 03:21:53 +0000
X-UUID: efc5a79a4e09443fbf8c27372c702301-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7FGKC2CL96iktvyoBP2vbwLVT6EXR3CbHjrpB2EcLgw=; 
 b=mzDV54eHbuWv4VhGtBiswDYgZSb8SEZVa6dtiWBj3/ddQrO+9b06Dm0Qe+3Y6d6Hto4hHPV9vDTm/Pnol/wpCpFqO39KiA/pvFNc9nhr8CKBl2st8ikQSSBoA5AbTE53zvR+mzGuJqk9QiKCma7db6IWmx2ZB+5wpJ3QazydLA8=;
X-UUID: efc5a79a4e09443fbf8c27372c702301-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1051093803; Tue, 03 Mar 2020 19:21:47 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 19:13:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 11:11:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Mar 2020 11:09:47 +0800
From: <light.hsieh@mediatek.com>
To: <ulf.hansson@linaro.org>
Subject: [RESEND PATCH v1 3/3] block: set partition read/write policy
 according to write-protection status
Date: Wed, 4 Mar 2020 11:12:17 +0800
Message-ID: <1583291537-15053-4-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1583291537-15053-1-git-send-email-light.hsieh@mediatek.com>
References: <1583291537-15053-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_192152_447370_EE6D89A2 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: axboe@kernel.dk, kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 Light Hsieh <light.hsieh@mediatek.com>, linux-block@vger.kernel.org,
 linux-mediatek@lists.infradead.org, stanley.chu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

For storage device with write-protection support, e.g. eMMC, register
check_disk_range_wp() in struct block_device_operations for checking
write-protection status. When creating block device for a partition, set
read/write policy according to result of check_disk_range_wp() operation
(if registered).

Without this patch, ro attribute is not set for created block device of
write-protected partition. User perform asynchronous buffered write to
such partition won't get immediate error and therefore he won't be awared
that write is not actually performed.
With this patch, ro attribute is set for created block device of
write-protected partition. User perform asynchronous buffered write to
such partition will get immediate error and therefore he will be awared.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
---
 block/partition-generic.c | 10 ++++++++++
 drivers/mmc/core/block.c  |  1 +
 include/linux/blkdev.h    |  1 +
 3 files changed, 12 insertions(+)

diff --git a/block/partition-generic.c b/block/partition-generic.c
index 564fae7..69088e8 100644
--- a/block/partition-generic.c
+++ b/block/partition-generic.c
@@ -394,6 +394,16 @@ struct hd_struct *add_partition(struct gendisk *disk, int partno,
 		goto out_free_info;
 	pdev->devt = devt;
 
+	if (!p->policy) {
+		if (disk->fops->check_disk_range_wp) {
+			err = disk->fops->check_disk_range_wp(disk, start, len);
+			if (err > 0)
+				p->policy = 1;
+			else if (err != 0)
+				goto out_free_info;
+		}
+	}
+
 	/* delay uevent until 'holders' subdir is created */
 	dev_set_uevent_suppress(pdev, 1);
 	err = device_add(pdev);
diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index ee85abf..af81311 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -1047,6 +1047,7 @@ static int mmc_blk_compat_ioctl(struct block_device *bdev, fmode_t mode,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl		= mmc_blk_compat_ioctl,
 #endif
+	.check_disk_range_wp	= mmc_blk_check_disk_range_wp,
 };
 
 static int mmc_blk_part_switch_pre(struct mmc_card *card,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 053ea4b..7814290 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1707,6 +1707,7 @@ struct block_device_operations {
 	void (*swap_slot_free_notify) (struct block_device *, unsigned long);
 	int (*report_zones)(struct gendisk *, sector_t sector,
 			unsigned int nr_zones, report_zones_cb cb, void *data);
+	int (*check_disk_range_wp)(struct gendisk *d, sector_t s, sector_t l);
 	struct module *owner;
 	const struct pr_ops *pr_ops;
 };
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
