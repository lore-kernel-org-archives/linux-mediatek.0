Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29466C64E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 06:54:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BE882085B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 06:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YAj6aMZl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uPVk90cb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BE882085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K/jnOmzV/2zJKtXdEVw5DNnPJ+E3Wjzr2DTnDH6pjzU=; b=YAj6aMZltaxEDm6PhDc9HMp615
	wav6g6R5l/ReA9asda+yQHUGevQnuA0DpgJ8BjhocxR6+jyqU+V7Ne0R0tm3/rnrt4KF5nWhRJ7bC
	w01GOUeJ60lHn6eTGbOS8vDMV0iY1n7Htl0TJmTPnmgGysOFjo8fZEXkBkj0/lrTTPbaPbUFuQuo+
	P59rjn/RwrHZYaCvqZLD4DXP9NFrs+XYURyPoJMDVdm1nbKkUbxCBP1+WsHCL3lKADSCqqrRqxICa
	orH7J9+m5jrznQwEJukN58SviABhm/RiyhS3ao8m0jGtfNkdgwGw03RfkI6rgvUx6L01Pcro+U1We
	rntiBseA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjzXv-0000oU-2O; Tue, 01 Dec 2020 06:53:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjzXs-0000nv-It; Tue, 01 Dec 2020 06:53:54 +0000
X-UUID: 05f94dbb632642a1926e3625614ab3ca-20201130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5SWOMWnx7VbWK/8OGOPjbEiQ8yykHhgq6v/1DH0xraQ=; 
 b=uPVk90cbZ7gLkhJYGfs9HAQdltx2rEWM3xpuEH380j4vCyw9HKQsEX8s6x/5plfIcgBjnDW1TWQ151Ll5vJcRKgWFfRgwcc3W0iMKTExI0pdBo/5cRzb9x2rdhJrv5IRlzc2+UVghATTpkzW4yp5GmgWln1OetgOuORQs+LSizg=;
X-UUID: 05f94dbb632642a1926e3625614ab3ca-20201130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 382288951; Mon, 30 Nov 2020 22:53:23 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Nov 2020 22:51:15 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 14:51:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Dec 2020 14:51:12 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2] scsi: ufs: Remove pre-defined initial voltage values of
 device powers
Date: Tue, 1 Dec 2020 14:51:14 +0800
Message-ID: <20201201065114.1001-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5428731B956507ECEFDF6B91B5227C59E128979F9A063864B9E6434E4E3E18F72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_015353_383214_14BDAE8F 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: bjorn.andersson@linaro.org, Stanley Chu <stanley.chu@mediatek.com>,
 alice.chao@mediatek.com, bvanassche@acm.org, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, nguyenb@codeaurora.org, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UFS specficication allows different VCC configurations for UFS devices,
for example,
	(1). 2.70V - 3.60V (Activated by default in UFS core driver)
	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
                          device tree)
	(3). 2.40V - 2.70V (Supported since UFS 3.x)

With the introduction of UFS 3.x products, an issue is happening that
UFS driver will use wrong "min_uV-max_uV" values to configure the
voltage of VCC regulator on UFU 3.x products with the configuration (3)
used.

To solve this issue, we simply remove pre-defined initial VCC voltage
values in UFS core driver with below reasons,

1. UFS specifications do not define how to detect the VCC configuration
   supported by attached device.

2. Device tree already supports standard regulator properties.

Therefore VCC voltage shall be defined correctly in device tree, and
shall not changed by UFS driver. What UFS driver needs to do is simply
enable or disable the VCC regulator only.

Similar change is applied to VCCQ and VCCQ2 as well.

Note that we keep struct ufs_vreg unchanged. This is allow vendors to
configure proper min_uV and max_uV of any regulators to make
regulator_set_voltage() works during regulator toggling flow.
Without specific vendor configurations, min_uV and max_uV will be NULL
by default and UFS core driver will enable or disable the regulator
only without adjusting its voltage.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index a6f76399b3ae..09e2f04bf4f6 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -133,22 +133,6 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
 		vreg->max_uA = 0;
 	}
 
-	if (!strcmp(name, "vcc")) {
-		if (of_property_read_bool(np, "vcc-supply-1p8")) {
-			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
-			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
-		} else {
-			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
-			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
-		}
-	} else if (!strcmp(name, "vccq")) {
-		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
-		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
-	} else if (!strcmp(name, "vccq2")) {
-		vreg->min_uV = UFS_VREG_VCCQ2_MIN_UV;
-		vreg->max_uV = UFS_VREG_VCCQ2_MAX_UV;
-	}
-
 	goto out;
 
 out:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
