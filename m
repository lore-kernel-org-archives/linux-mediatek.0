Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE87C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 13:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D695761074
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 13:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D695761074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zFW4vhDUn3+VTn4OgOUmcHYCSYsTOIS+q4rK9o3VqW4=; b=k+C5VKrg5O00lp
	y0VoVCKHV6ZPiO7Fw04J0exqVq827gtxj5tuqxmIHVYujYPTsMMVXo1GpYGp54cWxalWG8ChHv0TI
	5mcL0gXyeCnP6DF7j84Ng8dPl+6fK4SFK8mZO/aS40C2JYAAG9CE+DHKTFl6sZdcV6vHu/yVx8wqK
	lJhT4CUySjGUavDFH2lb/U9hHeDSARoFLiqqQAGPL+2P7dmzPVxZo+ffGjd+E+kfyfd3TJiVNaMvq
	sDZCMtLEEzbeyo27DHyR7yc2Qz7oQ28bpNKK19pDS/0yviYLMVNdx1FhLz6wr9qZKfU58UgLbC75n
	hJlhUbM+2/PbNc7tD0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcSZE-00Fm9W-Jz; Mon, 18 Oct 2021 13:20:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcSZ2-00Fm77-Ad; Mon, 18 Oct 2021 13:20:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7220A6103D;
 Mon, 18 Oct 2021 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634563227;
 bh=FEQkeCeHNlf9/VijMNNnZDKsvPpnX5/75zjmn6URwyU=;
 h=From:To:Cc:Subject:Date:From;
 b=BoSIof50bn3wOeWzmaLZ4H/xm3Ln7k/OHudTuwRDOYoKEbY0TiKF08ygtybXKrtvD
 Jo1kINXlULGjZ7RZPlTqtktTRubzrH5MP0gwITlEA9B9N8SJuxs0ZWLt7mCBiUb9qm
 wCSK4cjqZ9W9kySai7o4bJ8wdfNucFUYIzH/8AqHVhS0xMV+IOdvRPqIWOtAb+QRQG
 BSIaQipWRQKf58E5vqkTbyl9z5188irS3KV3LBawg9IdwBCtWb7pVFH7m3HnVcqq2O
 TH6my8wf1F9wMn/lwpih5lSHLNuDjjOBLUrReyFWDU0cOctyehzvchKdKN+GpBTww6
 T29x00OADloDg==
From: Arnd Bergmann <arnd@kernel.org>
To: Stanley Chu <stanley.chu@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Peter Wang <peter.wang@mediatek.com>, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] scsi: ufs: mediatek: avoid sched_clock() misuse
Date: Mon, 18 Oct 2021 15:20:01 +0200
Message-Id: <20211018132022.2281589-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_062028_410173_8B210864 
X-CRM114-Status: GOOD (  12.32  )
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

From: Arnd Bergmann <arnd@arndb.de>

sched_clock() is not meant to be used in portable driver code,
and assuming a particular clock frequency is not how this is
meant to be used. It also causes a build failure because of
a missing header inclusion:

drivers/scsi/ufs/ufs-mediatek.c:321:12: error: implicit declaration of function 'sched_clock' [-Werror,-Wimplicit-function-declaration]
        timeout = sched_clock() + retry_ms * 1000000UL;

A better interface to use here ktime_get_mono_fast_ns(), which
works mostly like ktime_get() but is safe to use inside of a
suspend callback.

Fixes: 9561f58442e4 ("scsi: ufs: mediatek: Support vops pre suspend to disable auto-hibern8")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/scsi/ufs/ufs-mediatek.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d1696db70ce8..a47241ed0a57 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -318,15 +318,15 @@ static void ufs_mtk_wait_idle_state(struct ufs_hba *hba,
 	u32 val, sm;
 	bool wait_idle;
 
-	timeout = sched_clock() + retry_ms * 1000000UL;
-
+	/* cannot use plain ktime_get() in suspend */
+	timeout = ktime_get_mono_fast_ns() + retry_ms * 1000000UL;
 
 	/* wait a specific time after check base */
 	udelay(10);
 	wait_idle = false;
 
 	do {
-		time_checked = sched_clock();
+		time_checked = ktime_get_mono_fast_ns();
 		ufs_mtk_dbg_sel(hba);
 		val = ufshcd_readl(hba, REG_UFS_PROBE);
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
