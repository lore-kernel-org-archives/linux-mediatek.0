Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAEEC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 00:03:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECF321744
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 00:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRly370d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yxWpMRiW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECF321744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CFSg8FxiRPk1I34UlxE57OhikkcGgVnCPmSRtbfTIkw=; b=PRly370dp83+9+Y8YsOHY7nQJy
	dDfAfLnsGLAgeTBNMZEbNpEIIRZAVIhX4hIPC1nBiTSF1SYxElwLzzxyTbxAK+USBQbpgnTsL8mEk
	6MJjnQgb1cNa54NM3IRuBxyW4fLuUsJK/bUxOpEq7opz8TTCHdDm93Bt+iO5nY3kxkNfHt1c4RyEW
	vpcCZ4pwuksGRZeD/wyxhrADT+Ae68ijhXj9A5weUQgJXchojSlJdkNO1TKclYzN4GXbSu1v9MeZP
	I0JA0zC95Lt0rNC00LgnJ2GOJO2BFA4TNf2Og7ybKHVXl1OtQDDr/nuG0n6tPCkW+TjPSYsXjjq4o
	043QLv0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Y2z-0001GM-GM; Thu, 20 Aug 2020 00:03:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Y2q-0001Ba-VO; Thu, 20 Aug 2020 00:03:05 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AC4E208E4;
 Thu, 20 Aug 2020 00:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881784;
 bh=WXvp02546LbDNcX171OiDWWC59ghuXzbW2bJ3O0fb3c=;
 h=From:To:Cc:Subject:Date:From;
 b=yxWpMRiWw1jgtV+J7U8e9ZdW2GvSzBiyJqnhN/rqayr67N14ZgxSzTVIYNnrv2NBL
 I94QwMjvxrSruZHt9JP1zdupNNCPwV0qXj4HjuvaunmYKHjJmKWB/5jMIHb/T1/hXY
 lhUYWRInYnTuewnpuvSTTUlPMnanbe78KCN1gyBg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 01/18] scsi: ufs: Add DELAY_BEFORE_LPM quirk for
 Micron devices
Date: Wed, 19 Aug 2020 20:02:44 -0400
Message-Id: <20200820000302.215560-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_200305_091920_A26C33F9 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Stanley Chu <stanley.chu@mediatek.com>

[ Upstream commit c0a18ee0ce78d7957ec1a53be35b1b3beba80668 ]

It is confirmed that Micron device needs DELAY_BEFORE_LPM quirk to have a
delay before VCC is powered off. Sdd Micron vendor ID and this quirk for
Micron devices.

Link: https://lore.kernel.org/r/20200612012625.6615-2-stanley.chu@mediatek.com
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufs_quirks.h | 1 +
 drivers/scsi/ufs/ufshcd.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/scsi/ufs/ufs_quirks.h b/drivers/scsi/ufs/ufs_quirks.h
index 5d2dfdb41a6ff..758d3a67047df 100644
--- a/drivers/scsi/ufs/ufs_quirks.h
+++ b/drivers/scsi/ufs/ufs_quirks.h
@@ -21,6 +21,7 @@
 #define UFS_ANY_VENDOR 0xFFFF
 #define UFS_ANY_MODEL  "ANY_MODEL"
 
+#define UFS_VENDOR_MICRON      0x12C
 #define UFS_VENDOR_TOSHIBA     0x198
 #define UFS_VENDOR_SAMSUNG     0x1CE
 #define UFS_VENDOR_SKHYNIX     0x1AD
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index bd21c9cdf8183..ab628fd37e026 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -218,6 +218,8 @@ ufs_get_desired_pm_lvl_for_dev_link_state(enum ufs_dev_pwr_mode dev_state,
 
 static struct ufs_dev_fix ufs_fixups[] = {
 	/* UFS cards deviations table */
+	UFS_FIX(UFS_VENDOR_MICRON, UFS_ANY_MODEL,
+		UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM),
 	UFS_FIX(UFS_VENDOR_SAMSUNG, UFS_ANY_MODEL,
 		UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM),
 	UFS_FIX(UFS_VENDOR_SAMSUNG, UFS_ANY_MODEL, UFS_DEVICE_NO_VCCQ),
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
