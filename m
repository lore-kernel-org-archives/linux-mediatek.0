Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C4CC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:53:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77CB1227C3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77CB1227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T92Gb2gqOoRqfTblF4rArPC3eGjYT0177UPNaV05tv0=; b=A190IYq2p3o9akCPJTt82vE4d
	BUNcgoNx0UU3dr0VibeisxjB7fgNfz30kosr5c6Hc7dn0SopNs3FnCB19Eq7gFdipPPztzL68B4Ra
	mpF/7GdeT/Lk+9P6YBLzoxtf+kONGUhb5EO6zj+rsM+abTWmAUU6tg6oAqTKTxevZ2/w6wa3869y4
	8ANkMRtU0C3jhGVPqtZ8FDr0Hs4YlWghoakN+zsVN3++VjOnUDilSVGqzsJr6po5ieBNuvA00lAGK
	Lg1t+MAqTYWo7sjoXsK1FbxEcm2amb5+JcK3GhgIspEPqq29KvHqhUAnM6AeRPF1InbQ2YWCDxrXd
	D2f11XMag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7m4-0002XS-D1; Fri, 04 Dec 2020 09:53:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7lx-0002VQ-W0; Fri, 04 Dec 2020 09:53:07 +0000
X-UUID: cb0ae1a076a948f68742cfad15855113-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BpKAYzxoTlyApqrwt3BBoQOUoZka5Cxh59yW+1BNECM=; 
 b=mKjZrpj+B8LwnCmEBzA2XkNTdBRAATS3pEsKM4HGVNllKj2L78uohIw4c4x2vViRvpHSgBPG4qWFve0RKGfaWnkyMhB0RwrMV7pOQItL2Zxf1HdbK+x7ivXC6dS+v8qmYXVo9nk8a4qtToGKsU95XrgUXsBxDBPnk0DFnmRYB+k=;
X-UUID: cb0ae1a076a948f68742cfad15855113-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1674210396; Fri, 04 Dec 2020 01:52:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 01:50:16 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 17:50:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Dec 2020 17:50:06 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 7/8] scsi: ufs: Introduce event_notify variant function
Date: Fri, 4 Dec 2020 17:50:06 +0800
Message-ID: <20201204095007.20639-8-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201204095007.20639-1-stanley.chu@mediatek.com>
References: <20201204095007.20639-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 024531E2C4CC7D34CC95744E369AA8D6B7D181B19CA48BF999D1145B397BC9152000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_045306_170237_BC09C0B1 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce event_notify variant function to allow
vendor to get notification of important events and connect
to any proprietary debugging facilities.

Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c |  2 ++
 drivers/scsi/ufs/ufshcd.h | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 1a7d31849511..6e72c0543c7b 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4480,6 +4480,8 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
 	e->val[e->pos] = val;
 	e->tstamp[e->pos] = ktime_get();
 	e->pos = (e->pos + 1) % UFS_EVENT_HIST_LENGTH;
+
+	ufshcd_vops_event_notify(hba, id, &val);
 }
 EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
 
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index b55a71c10fa6..8c44929bed53 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -319,6 +319,7 @@ struct ufs_pwr_mode_info {
  * @phy_initialization: used to initialize phys
  * @device_reset: called to issue a reset pulse on the UFS device
  * @program_key: program or evict an inline encryption key
+ * @event_notify: called to notify important events
  */
 struct ufs_hba_variant_ops {
 	const char *name;
@@ -353,6 +354,8 @@ struct ufs_hba_variant_ops {
 					void *data);
 	int	(*program_key)(struct ufs_hba *hba,
 			       const union ufs_crypto_cfg_entry *cfg, int slot);
+	void	(*event_notify)(struct ufs_hba *hba,
+				enum ufs_event_type evt, void *data);
 };
 
 /* clock gating state  */
@@ -1100,6 +1103,14 @@ static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba,
 	return 0;
 }
 
+static inline void ufshcd_vops_event_notify(struct ufs_hba *hba,
+					    enum ufs_event_type evt,
+					    void *data)
+{
+	if (hba->vops && hba->vops->event_notify)
+		hba->vops->event_notify(hba, evt, data);
+}
+
 static inline int ufshcd_vops_setup_clocks(struct ufs_hba *hba, bool on,
 					enum ufs_notify_change_status status)
 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
