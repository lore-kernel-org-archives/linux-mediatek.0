Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E51C55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1669922265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="17+L1wyX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qWD7AjF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1669922265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GOU4Jrb6Ni+zfzLw4H++dX/pmfPC/ADhTjRXbfGnD3w=; b=17+L1wyXFFM09Pjna/tZbDvtS
	qn3Z5yg+qE9yocwX6GMMIYY56F7EYYGeWlJ/Ywpuw7Rf50WIYYjxU9MaBxB2RXiINJO4U+yL9ydsL
	i8+oldPW9bcY86sqfh6qYhNbPwr9CD4zQAugjrV/qefMf3rujyjS2mqsQqFjAPfG9QQ4jP8kvAQEE
	AwkxdsRqzcRQP/w8LVNYJUMwxm5Femg8PYP8IKs/KV6cPYncH+hWY11TcLdmfnvx7cWvONsd4ttkv
	S1gdlq1/BfN3T+J9jHsyIYM+gK9xc3E73HS3y8MNKiJzc9Va6CnoULmXfQzXmMvObPgwtNxju/7sg
	tSBKRdu3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYWt-0006Yr-IT; Mon, 16 Nov 2020 07:02:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVp-0005yh-JQ; Mon, 16 Nov 2020 07:01:19 +0000
X-UUID: f52625913a014d0ea67e8cb6f53fa9e7-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Zun4w9xfE1D5usMeuUFY/IUKi+cwQIeZ8viFMzbNgiU=; 
 b=qWD7AjF4cOxdvldBo4HUjrsLMNpm3I6qt0Mgzldnwlod9erW98W2crBfZk6LFGG+y1lPw7DqXbgOzy5y4AWb7I0DVrqVCfGw8LXPLDxQeoJJzy2dUy2JQxzn3H3COp6leID7yTMUryNUbtrbVsEv3hwbOQwum1iTsldC1RLL4YU=;
X-UUID: f52625913a014d0ea67e8cb6f53fa9e7-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 934367607; Sun, 15 Nov 2020 23:01:10 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:51:10 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:56 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 7/9] scsi: ufs: Refactor ADAPT configuration function
Date: Mon, 16 Nov 2020 14:50:52 +0800
Message-ID: <20201116065054.7658-8-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5926274FF60AC1D2252A78452B893F06980F61EAFD7235CF175F1E25C3F32A5E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020117_839276_34A57723 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, kwmad.kim@samsung.com, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Several vendors are using same code to configure ADAPT
settings for HS-G4. Simply refactor it as common function.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 16 ++++++++++++++++
 drivers/scsi/ufs/ufshcd.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 9186ee01379a..80cbce414678 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -3587,6 +3587,22 @@ static int ufshcd_dme_reset(struct ufs_hba *hba)
 	return ret;
 }
 
+int ufshcd_dme_configure_adapt(struct ufs_hba *hba,
+			       int agreed_gear,
+			       int adapt_val)
+{
+	int ret;
+
+	if (agreed_gear != UFS_HS_G4)
+		adapt_val = PA_INITIAL_ADAPT;
+
+	ret = ufshcd_dme_set(hba,
+			     UIC_ARG_MIB(PA_TXHSADAPTTYPE),
+			     adapt_val);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ufshcd_dme_configure_adapt);
+
 /**
  * ufshcd_dme_enable - UIC command for DME_ENABLE
  * @hba: per adapter instance
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 5191d87f6263..d0b68df07eef 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -956,6 +956,9 @@ extern int ufshcd_runtime_idle(struct ufs_hba *hba);
 extern int ufshcd_system_suspend(struct ufs_hba *hba);
 extern int ufshcd_system_resume(struct ufs_hba *hba);
 extern int ufshcd_shutdown(struct ufs_hba *hba);
+extern int ufshcd_dme_configure_adapt(struct ufs_hba *hba,
+				      int agreed_gear,
+				      int adapt_val);
 extern int ufshcd_dme_set_attr(struct ufs_hba *hba, u32 attr_sel,
 			       u8 attr_set, u32 mib_val, u8 peer);
 extern int ufshcd_dme_get_attr(struct ufs_hba *hba, u32 attr_sel,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
