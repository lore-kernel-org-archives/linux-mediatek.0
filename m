Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A6AC38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 08:02:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50C7206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 08:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s8OvlEjG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QzDKXpbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50C7206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sUylVrT6NLxElr40Cx+cSm7snE7sFfx95fIDnhonwDs=; b=s8OvlEjGY2i5Ek
	UkZtUiwlHBvwXDHFqNq0m28GYX29lxp9lH69Om16+yvumNvgegJrQlJmGafiOnbU3JLd2tu0y90lS
	11AOXlsOxs7ck9xjMcoo9SBYQJ64IoxFnhIPEftxUzGehFuIa8rjGn26YQmBHrBwZZqifeS7RhIKj
	B4xHlGTljGTnn6stF4klcU4MxRnjn9KubTBtneGp4+T2o//GdrXrc9c+xSUQgju/JCLoc3XtfgS8Y
	UfFNPiamJVwHkRwrBFwF1y80AJCLvbuXj1dkpu3lmnHeqrx5NSupWU8TSp2AGdEGzRmQ7mlSSjMEA
	4pyQmxz4koNOJldN7/EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWxxk-0000fE-AJ; Fri, 08 May 2020 08:02:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWxwl-0007wT-Vx; Fri, 08 May 2020 08:01:29 +0000
X-UUID: b91f84898ec4448b926120cfa05e8d16-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=q41jnBLZkm5OYDzNGhSl4Dj8ltKLKW6wmqZStHtz2CA=; 
 b=QzDKXpbm3bkTCmkLMebgJgCfKKMZYA2t+VS2l7NzhWVBiFaczjvlhKJxVJri6zV3cfmg1gSY93jJmtp8eNGZMLK6GqZnlr3GM9Ei6aRF3rSK8wREafFtZLs8bt8oL7HqLlxqmy+Ag7DyC+V3en1fgzqzJS9qff3lp+Zx/kuEp3A=;
X-UUID: b91f84898ec4448b926120cfa05e8d16-20200508
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 677852807; Fri, 08 May 2020 00:01:15 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 01:01:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 16:01:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 May 2020 16:01:17 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v8 0/8] scsi: ufs: support LU Dedicated buffer mode for
 WriteBooster
Date: Fri, 8 May 2020 16:01:07 +0800
Message-ID: <20200508080115.24233-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_010128_041612_DE65FC7E 
X-CRM114-Status: UNSURE (   7.61  )
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

v7 -> v8:
  - In exported funtion ufshcd_fixup_dev_quirks(), add null checking for parameter "fixups" (Avri Altman)

v6 -> v7:
  - Add device descriptor length check in ufshcd_wb_probe() back to prevent out-of-boundary access in ufshcd_wb_probe()
  - Fix the check of device descriptor length (Avri Altman)
  - Provide a new ufs_fixup_device_setup() function to pack both device fixup methods by general quirk table and vendor-specific way (Avri Altman)

v5 -> v6:
  - Remove device descriptor length check in ufshcd_wb_probe()

v4 -> v5:
  - Check LUN ID for available WriteBooster buffer only from 0 to 7 according to spec (Avri Altman)
  - Skip checking any possible errors from ufshcd_read_unit_desc_param(hba, lun, UNIT_DESC_PARAM_WB_BUF_ALLOC_UNITS) in ufshcd_wb_probe() and check returned d_lu_wb_buf_alloc (shall be zero if error happens) (Avri Altman)

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
 drivers/scsi/ufs/ufs.h          |  10 ++
 drivers/scsi/ufs/ufs_quirks.h   |   7 ++
 drivers/scsi/ufs/ufshcd.c       | 166 +++++++++++++++++++++-----------
 drivers/scsi/ufs/ufshcd.h       |  19 +++-
 6 files changed, 176 insertions(+), 62 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
