Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBCFC2D0B1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 06:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E355E206CC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 06:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mGG+zOTW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="K8F0nVDU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E355E206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8D+0hYnSZ6tx8Q+eKfl7CeCozD8CawVTdPZ2ntcVIhY=; b=mGG+zOTWXuU2ec96MUHrHnW0YM
	cdYHKU9NaPiL/uQ3XINv5q/Mu0N2Ef3xrSXlGKus1zo02MMpg0zOZU3IqkQsYJSbl2aAApY+FiM/l
	asolK6bW0I4oGMG/sxUXIuCEwdpHzT7UtCeJVbq2eIA49Orf0KegrHvOCant7PDqbQ0PLMsKQmslA
	emtatkONGGAXYQI9QvPB08YX432X7JWUMYJwRJsl658/1McBqzfKkNsKfXYHL6dsYP5RUEqCphPCv
	/tGFbZ1BCOpKj+jMoCf4x+S8nKU9WWtL8YGxhQ2ebGyndwpmhxKqyMidE8o1crNINsC4wz/vnpig6
	71pBNIeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izb71-0003Zw-Lc; Thu, 06 Feb 2020 06:58:07 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izb6L-0002gC-C7
 for linux-mediatek@lists.infradead.org; Thu, 06 Feb 2020 06:57:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580972246; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Acsfsqg2b6NUDHJeY/gDJ1vlOSDS93J/sV1EZBqKdko=;
 b=K8F0nVDUPbrIk58/5E/cuRqkwWeknVN8r5qOUiDV3D8aznDrQs0TEmt2X3gv0DbpmWyJDMsM
 k6xIaDJiQrpf/KvVItRasYrV6rV6mcGNM0ahliMJjttnI85PI9XzjbA94sABEYGKPKuQE3hw
 ZrxoQXjIglIWaDsmEoHpHIiYVFM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3bb8cf.7fcc8b230e68-smtp-out-n03;
 Thu, 06 Feb 2020 06:57:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9E7DEC4479C; Thu,  6 Feb 2020 06:57:18 +0000 (UTC)
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 475A5C433CB;
 Thu,  6 Feb 2020 06:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 475A5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=cang@codeaurora.org
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH 5/8] scsi: ufs: Fix ufshcd_hold() caused scheduling while
 atomic
Date: Wed,  5 Feb 2020 22:56:48 -0800
Message-Id: <1580972212-29881-6-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1580972212-29881-1-git-send-email-cang@codeaurora.org>
References: <1580972212-29881-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_225726_244395_2152EDB6 
X-CRM114-Status: GOOD (  10.12  )
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

The async version of ufshcd_hold(async == true), which is only called
in queuecommand path as for now, is expected to work in atomic context,
thus it should not sleep or schedule out. When it runs into the condition
that clocks are ON but link is still in hibern8 state, it should bail out
without flushing the clock ungate work.

Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index bbc2607..e8f7f9d 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1518,6 +1518,11 @@ int ufshcd_hold(struct ufs_hba *hba, bool async)
 		 */
 		if (ufshcd_can_hibern8_during_gating(hba) &&
 		    ufshcd_is_link_hibern8(hba)) {
+			if (async) {
+				rc = -EAGAIN;
+				hba->clk_gating.active_reqs--;
+				break;
+			}
 			spin_unlock_irqrestore(hba->host->host_lock, flags);
 			flush_work(&hba->clk_gating.ungate_work);
 			spin_lock_irqsave(hba->host->host_lock, flags);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
