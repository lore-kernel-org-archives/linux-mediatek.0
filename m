Return-Path: <SRS0=D1Kh=6R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B57FC28CBC
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 06:07:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ABE82075B
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 06:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hTO/1zJ8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q3B9n2gA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ABE82075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LGjD8JGcMnK4j8C0HiCW0+jY/SmJ9Zi62L3lkzwGles=; b=hTO/1zJ8FmJHbS
	wPJcBJhEX+0DCdepUFOnCqyfxVFy3Ap2XQu8orfDYg3PdDZP2tDIB3+qeCMEZ/0CzSkc7wug0v6gx
	529vLa8kKmklpAb98U3TjllbY5uL71BWck9bWWWRnvZyTGNbcdnLVfkL9gaNT4afJtzzI09aNtmx7
	Bhhm+YICn+Q6TxCSV+bSPVQgauiZjArJ0dyV9QzKc4sKfClxp0mzHWFD9pagL8mSilin0pM+SGEFS
	vHW0ElOno9zg/Fx2/5Imr4Wa4Jy+oepU1xO5keZBuanFUcJQGqBScqmpBvGSP0g9ZHkG1Z09rKSna
	i1FqMPBWSzfEQ0txQeMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jV7mZ-0007PD-03; Sun, 03 May 2020 06:07:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jV7jc-00028u-9G; Sun, 03 May 2020 06:04:17 +0000
X-UUID: 106147b8b8234804a3bdfa7e8a416976-20200502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+UgP8mNJK+2wPFsgGDjT2uhkCKhqUXeF45Q0cZIp0PQ=; 
 b=q3B9n2gA4ue8kz+8SjnntvdqdKeiqxurMX2aGWZcT+aW75YQ3xt3SzYyv5utv3Zb6eFgDzRfiDaZW8e8z9GdvZv98YsuBzjQjhMVDq8zriKFqBCr8cxiFGZDKm+IC+fmyKazyB3j7ns8yWcwuLv18J6TLS6x41XvXPkZvGZAC9Y=;
X-UUID: 106147b8b8234804a3bdfa7e8a416976-20200502
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 954935603; Sat, 02 May 2020 22:04:11 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 2 May 2020 23:04:09 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 14:03:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 3 May 2020 14:03:54 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v4 0/8] scsi: ufs: support LU Dedicated buffer mode for
 WriteBooster
Date: Sun, 3 May 2020 14:03:43 +0800
Message-ID: <20200503060351.10572-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_230416_356679_EFF86CB9 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
This patchset adds LU dedicated buffer mode support for WriteBooster.
In the meanwhile, enable WriteBooster capability on MediaTek UFS platforms.

v3 -> v4:
  - Introduce "fixup_dev_quirks" vops to allow vendors to fix and modify device quirks, and provide an initial vendor-specific device quirk table on MediaTek UFS platforms
  - Avoid relying on common device quirk table for pre-3.1 UFS device with non-standard WriteBooster support (Can Guo)
  - Fix comments for ufshcd_wb_probe() (Can Guo)
  - Make ufshcd_wb_get_flag_index() inline and fix ufshcd_is_wb_flags() (Avri Altman)

v2 -> v3:
  - Introduce a device quirk to support WriteBooster in pre-3.1 UFS devices (Avri Altman)
  - Fix WriteBooster related sysfs nodes. Now all WriteBooster related sysfs nodes are specifically mapped to the LUN with WriteBooster enabled in LU Dedicated buffer mode (Avri Altman)

v1 -> v2:
  - Change the definition name of WriteBooster buffer mode to correspond to specification (Bean Huo)
  - Add patch #5: "scsi: ufs: cleanup WriteBooster feature"

Stanley Chu (8):
  scsi: ufs: enable WriteBooster on some pre-3.1 UFS devices
  scsi: ufs: introduce fixup_dev_quirks vops
  scsi: ufs: export ufs_fixup_device_setup() function
  scsi: ufs-mediatek: add fixup_dev_quirks vops
  scsi: ufs: add "index" in parameter list of ufshcd_query_flag()
  scsi: ufs: add LU Dedicated buffer mode support for WriteBooster
  scsi: ufs-mediatek: enable WriteBooster capability
  scsi: ufs: cleanup WriteBooster feature

 drivers/scsi/ufs/ufs-mediatek.c |  25 ++++-
 drivers/scsi/ufs/ufs-sysfs.c    |  11 ++-
 drivers/scsi/ufs/ufs.h          |   7 ++
 drivers/scsi/ufs/ufs_quirks.h   |   7 ++
 drivers/scsi/ufs/ufshcd.c       | 157 ++++++++++++++++++++------------
 drivers/scsi/ufs/ufshcd.h       |  20 +++-
 6 files changed, 165 insertions(+), 62 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
