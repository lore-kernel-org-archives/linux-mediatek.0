Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0DFC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1C220757
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lIjxK29R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YH2V0UBP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1C220757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BoizNa8q+e9B4aOs7jjQEdYkPQm55duZh6enPwJBAI=; b=lIjxK29R28/B0n
	XZjB1jNF1G3YHfEj3jts+5Q7AqVo3RbAXm+6SE8ZalRTZ6046lOgkGJJfauC+ZTCpG3HkhEyE/mW/
	6PWGa7i7+LrNwznLRurVi1HOmTvLEdY4cdGHcWEkWVi3lT+C0l9YousJqffqXyFUlBv4vMIl6uqpD
	qwDH8xiSuluXWDBlZsSKwI7cagDTyVegHRcWxOD4ShywgWfpviRB7VdRA4pmEvpzHRXSWygtyu4Lb
	dAIBDwqj/x6nTm3EEB16gGgbEQd27AOZH7BFXLoRrmudI91LySUx3PeP6NDYAsYKswucwmAn4zSIC
	naZnk1lsujds3sEKPPzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6dO-0007qw-Ke; Fri, 22 May 2020 12:18:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6d8-0007cM-GQ; Fri, 22 May 2020 12:18:27 +0000
X-UUID: 1d8f54acd4594452ad18895e4d693061-20200522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ew+RGCuaV2Y1qHcybtLqf6q5Y9tu1r8jPZYZhoV+ToI=; 
 b=YH2V0UBPdZlL1oq6ZRPdnUgPH+Aih2B1lfoAMwcL67pPHfazvho10sXICTN0XyVmqDEGRtwoWAD1wbRSU7rYzc3FJcC8l4RLiZ0u81VNk4EDfniBQi86H4c9cvGWflUWBu8l9umfCnkm+kFqygArIhIbbSAtVmEY+W2fv9zjvZk=;
X-UUID: 1d8f54acd4594452ad18895e4d693061-20200522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1823408088; Fri, 22 May 2020 04:18:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 May 2020 05:18:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 May 2020 20:18:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 May 2020 20:18:15 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 2/3] scsi: ufs-mediatek: Do not gate clocks if auto-hibern8
 is not entered yet
Date: Fri, 22 May 2020 20:18:13 +0800
Message-ID: <20200522121814.9100-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200522121814.9100-1-stanley.chu@mediatek.com>
References: <20200522121814.9100-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EC14E64B95F65F537FD575F5BFF78750F27DEDB020CC5039E24A355D6DD574C92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_051826_552311_DB25490A 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: pengshun.zhao@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are some chances that link enters hibern8 lately by auto-hibern8
scheme during the clock-gating flow. Clocks shall not be gated if link
is still active otherwise host or device may hang.

Fix this by returning error code to the caller __ufshcd_setup_clocks()
to skip gating clocks there if link is not confirmed in hibern8
state yet.

Also allow some waiting time for the hibern8 state transition.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Andy Teng <andy.teng@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 36 ++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 523ee5573921..3c85f5e97dea 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -178,15 +178,30 @@ static void ufs_mtk_setup_ref_clk_wait_us(struct ufs_hba *hba,
 	host->ref_clk_ungating_wait_us = ungating_us;
 }
 
-static u32 ufs_mtk_link_get_state(struct ufs_hba *hba)
+int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
+			    unsigned long max_wait_ms)
 {
+	ktime_t timeout, time_checked;
 	u32 val;
 
-	ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
-	val = ufshcd_readl(hba, REG_UFS_PROBE);
-	val = val >> 28;
+	timeout = ktime_add_us(ktime_get(), ms_to_ktime(max_wait_ms));
+	do {
+		time_checked = ktime_get();
+		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+		val = ufshcd_readl(hba, REG_UFS_PROBE);
+		val = val >> 28;
+
+		if (val == state)
+			return 0;
 
-	return val;
+		/* Sleep for max. 200us */
+		usleep_range(100, 200);
+	} while (ktime_before(time_checked, timeout));
+
+	if (val == state)
+		return 0;
+
+	return -ETIMEDOUT;
 }
 
 /**
@@ -221,10 +236,13 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 			 * triggered by Auto-Hibern8.
 			 */
 			if (!ufshcd_can_hibern8_during_gating(hba) &&
-			    ufshcd_is_auto_hibern8_enabled(hba) &&
-			    ufs_mtk_link_get_state(hba) ==
-			    VS_LINK_HIBERN8)
-				ufs_mtk_setup_ref_clk(hba, on);
+			    ufshcd_is_auto_hibern8_enabled(hba)) {
+				ret = ufs_mtk_wait_link_state(hba,
+							      VS_LINK_HIBERN8,
+							      15);
+				if (!ret)
+					ufs_mtk_setup_ref_clk(hba, on);
+			}
 		}
 	} else if (on && status == POST_CHANGE) {
 		ret = phy_power_on(host->mphy);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
