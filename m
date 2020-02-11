Return-Path: <SRS0=52uS=37=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F39DC3B186
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 03:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB67C2082F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 03:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KcHxcP9o";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="sTa2eBmg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB67C2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xIFq9tdBaS+iLvW3aFKe1475mbJljTmH1dYgM8aPRlE=; b=KcHxcP9oGaCFFf2X39jbovO4r9
	xUN6/6PUezfSDrylPWGBilKqLIyQ6AK+QlPe68YhQ0+99u/YudH3LKoNyYWnouiLjdsq9nxCA4lvP
	YnjBs5pjeFKP9K6RXWt5W06WEVUgIN2aKMOsjQXK4IxrY8FhRKmYYIMRAlZR4FT/2MhITgh+BiDmD
	vrj24S+YjM/x2ciHEj4RpQuq13ysuCQ9V0UJ2ykWHzuBKdDZNzH4JfAOWId8EQ8NEDrGksQ5k3HxZ
	R76DbQVcJtlHcrR/JYJkgL4TavGxQs8LCO6asxvH83bq+JeHWrw70BpWnkSbrweBugTSAKDW5JIP4
	WBfkKQAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1MQF-0001o9-P8; Tue, 11 Feb 2020 03:41:15 +0000
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1MQD-0001n3-M0
 for linux-mediatek@lists.infradead.org; Tue, 11 Feb 2020 03:41:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1581392473; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6kid3p1QZ9UEZ2W3UC/TZABXrNRicqOESmbFfSk4vhE=;
 b=sTa2eBmgpUir4VZJ1opDZ92FtVgW8XMilbL/bx6ielwmHiSKaX0S4jakrMO7vaowAJaQ/98D
 MxBU0U++PMyToWhyRVU81RHnyn2x3GxvxmMWZHn48zDexSwBaMXlYIrjtGIAKBLd1HwqOWyZ
 mbfSExklynIx4xBYd2wIMB0S0yQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e422255.7f99af11d260-smtp-out-n03;
 Tue, 11 Feb 2020 03:41:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B8225C4479C; Tue, 11 Feb 2020 03:41:08 +0000 (UTC)
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 379A9C43383;
 Tue, 11 Feb 2020 03:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 379A9C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=cang@codeaurora.org
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH v10 2/7] scsi: ufs: set load before setting voltage in
 regulators
Date: Mon, 10 Feb 2020 19:40:45 -0800
Message-Id: <1581392451-28743-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581392451-28743-1-git-send-email-cang@codeaurora.org>
References: <1581392451-28743-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_194113_782251_CA77B022 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Venkat Gopalakrishnan <venkatg@codeaurora.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Asutosh Das <asutoshd@codeaurora.org>

This sequence change is required to avoid dips in voltage
during boot-up.

Apparently, this dip is caused because in the original
sequence, the regulators are initialized in lpm mode.
And then when the load is set to high, and more current
is drawn, than is allowed in lpm, the dip is seen.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 10dbc0c..83ae093 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7248,6 +7248,11 @@ static int ufshcd_config_vreg(struct device *dev,
 	name = vreg->name;
 
 	if (regulator_count_voltages(reg) > 0) {
+		uA_load = on ? vreg->max_uA : 0;
+		ret = ufshcd_config_vreg_load(dev, vreg, uA_load);
+		if (ret)
+			goto out;
+
 		if (vreg->min_uV && vreg->max_uV) {
 			min_uV = on ? vreg->min_uV : 0;
 			ret = regulator_set_voltage(reg, min_uV, vreg->max_uV);
@@ -7258,11 +7263,6 @@ static int ufshcd_config_vreg(struct device *dev,
 				goto out;
 			}
 		}
-
-		uA_load = on ? vreg->max_uA : 0;
-		ret = ufshcd_config_vreg_load(dev, vreg, uA_load);
-		if (ret)
-			goto out;
 	}
 out:
 	return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
