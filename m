Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65AEC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7669A22E01
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7669A22E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zJM9NsBtUDwSg9Tgwmzh3Gwi1MhmGlRJzPKOhx2KpRQ=; b=AlxC/SBm8wi9IuuGfxu1mU30P
	rYQ7/bkTOsluacJOype26LBgVXOMzdyPkMA6c9b8cbRw/zawAiW9oc6Vy4PwwSIL9G0iDlqyNKYbZ
	kE14IWzKAu+46AELX5H/khzmDY7s+WwapGpmuMApXKOsMnameQUyfLylfNDCrwP1sNn3dSyrVqQFd
	prl27znQdR+3IL9OegLtDvCvFmdce0XKYaLWUrLFi3mwDVCsQZrreAMnsKUoYPJmf2h6wuDhYOs8E
	Xjg+iPMWqHmG8zJVsgWtQf0/EiTmPhUmH7pc24IvEkKI1mWjPRc25SnhSMb05yQuD6p8oJ16GL85j
	Aa96/0P9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8oM-000440-Jf; Tue, 12 Jan 2021 01:49:30 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8oF-000401-JM; Tue, 12 Jan 2021 01:49:25 +0000
Received: by mail-pf1-x433.google.com with SMTP id q20so407081pfu.8;
 Mon, 11 Jan 2021 17:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OtP2Q83ql8pOj4Inc9JGr9jKNcuTQBZobhx5BHnHH/g=;
 b=YBC1yQjH8TXjngxP/qOpGQOeT8UFI3EfWZf6v8+12cI+z8pgLG0+ii6bgWIYoBvYfq
 eyyK2D0PFMwsk0eeXU5NQjnsqV1lcHmI/SU+/JgDjHemst5DfX0AS/YjnlEXUGxHmnQF
 3tt0ext4GTdJoV7nBRRS99AuKZHBvlzIYvBOLBzYyBqKQl/dQqThoiCYe50MH3NdAGcc
 8hkI/sI/IC+phUcD5AFvguqO3eR7RSe1h0jEBd8vivFwCdJBYl79kNr0Q5MJbKAnzxdV
 xebj8hG5WiQ566cxHzDggzbIpIiA7PrzoAT7MQ8vGrR603pXUTE+aD+Q297yTRutBYWl
 1r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OtP2Q83ql8pOj4Inc9JGr9jKNcuTQBZobhx5BHnHH/g=;
 b=UYE2waZeeJMuoTY/41Y9ojHGDhDUAmptrDsxZkNxcXYvv+tVt6L+oVvybU9IIUJgju
 JsuycjkdDZ6ZJVPb6b0X1oeQWuWbe7GAtQpgxsYA02XDFtyXKL0h2FoDA8gSBppEwkCH
 IkF5dUt+nZozzxpuKGD4p5LgOnNb3PwtKY2SCCGzhqVZHD2KohtxhEqxE5WBjst12G+m
 Mdf5S8rHabKkKDII8/+TQo+ijYt0JXdbbEZs2g2nbTfoJwBQ2EWHXtep//t5Ao3zBQ4F
 vHOCor97E0gwla6STO/y5yh6C9lPjNozG7SU6GCmO9ldf29ZRYqv62rM66kWIJ/RaSUs
 Ti6w==
X-Gm-Message-State: AOAM530whvmhUAQRENhd0F5clMIbPraEF48166GGkx3QW4msNOwE4neN
 2a5ds1pSLI7OUGEDwhMMyVQ=
X-Google-Smtp-Source: ABdhPJxWyRij3haa1spWTpg4Y2dOKAQzvgqWX9I/ALksySu/d/6UfpmZJDPTx8OGtFt6Z9FmNg1LHQ==
X-Received: by 2002:aa7:8517:0:b029:19d:d70f:86ec with SMTP id
 v23-20020aa785170000b029019dd70f86ecmr2217270pfn.19.1610416161691; 
 Mon, 11 Jan 2021 17:49:21 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:49:21 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 14/19] crypto: qat: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:45 +0530
Message-Id: <20210112014650.10887-15-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204923_694883_7DFCEC92 
X-CRM114-Status: GOOD (  16.31  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com,
 Allen Pais <apais@linux.microsoft.com>, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/qat/qat_common/adf_isr.c               |  5 ++---
 drivers/crypto/qat/qat_common/adf_sriov.c             | 10 +++++-----
 drivers/crypto/qat/qat_common/adf_transport.c         |  4 ++--
 .../crypto/qat/qat_common/adf_transport_internal.h    |  2 +-
 drivers/crypto/qat/qat_common/adf_vf_isr.c            | 11 +++++------
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/qat/qat_common/adf_isr.c b/drivers/crypto/qat/qat_common/adf_isr.c
index c45853463530..bb5251d587eb 100644
--- a/drivers/crypto/qat/qat_common/adf_isr.c
+++ b/drivers/crypto/qat/qat_common/adf_isr.c
@@ -244,9 +244,8 @@ static int adf_setup_bh(struct adf_accel_dev *accel_dev)
 	int i;
 
 	for (i = 0; i < hw_data->num_banks; i++)
-		tasklet_init(&priv_data->banks[i].resp_handler,
-			     adf_response_handler,
-			     (unsigned long)&priv_data->banks[i]);
+		tasklet_setup(&priv_data->banks[i].resp_handler,
+			     adf_response_handler);
 	return 0;
 }
 
diff --git a/drivers/crypto/qat/qat_common/adf_sriov.c b/drivers/crypto/qat/qat_common/adf_sriov.c
index 8c822c2861c2..591537399edb 100644
--- a/drivers/crypto/qat/qat_common/adf_sriov.c
+++ b/drivers/crypto/qat/qat_common/adf_sriov.c
@@ -24,9 +24,10 @@ static void adf_iov_send_resp(struct work_struct *work)
 	kfree(pf2vf_resp);
 }
 
-static void adf_vf2pf_bh_handler(void *data)
+static void adf_vf2pf_bh_handler(struct tasklet_struct *t)
 {
-	struct adf_accel_vf_info *vf_info = (struct adf_accel_vf_info *)data;
+	struct adf_accel_vf_info *vf_info =
+				from_tasklet(vf_info, t, vf2pf_bh_tasklet);
 	struct adf_pf2vf_resp *pf2vf_resp;
 
 	pf2vf_resp = kzalloc(sizeof(*pf2vf_resp), GFP_ATOMIC);
@@ -52,9 +53,8 @@ static int adf_enable_sriov(struct adf_accel_dev *accel_dev)
 		vf_info->accel_dev = accel_dev;
 		vf_info->vf_nr = i;
 
-		tasklet_init(&vf_info->vf2pf_bh_tasklet,
-			     (void *)adf_vf2pf_bh_handler,
-			     (unsigned long)vf_info);
+		tasklet_setup(&vf_info->vf2pf_bh_tasklet,
+			     adf_vf2pf_bh_handler);
 		mutex_init(&vf_info->pf2vf_lock);
 		ratelimit_state_init(&vf_info->vf2pf_ratelimit,
 				     DEFAULT_RATELIMIT_INTERVAL,
diff --git a/drivers/crypto/qat/qat_common/adf_transport.c b/drivers/crypto/qat/qat_common/adf_transport.c
index 5a7030acdc33..03dcbeac25d7 100644
--- a/drivers/crypto/qat/qat_common/adf_transport.c
+++ b/drivers/crypto/qat/qat_common/adf_transport.c
@@ -324,9 +324,9 @@ static void adf_ring_response_handler(struct adf_etr_bank_data *bank)
 		adf_handle_response(&bank->rings[i]);
 }
 
-void adf_response_handler(uintptr_t bank_addr)
+void adf_response_handler(struct tasklet_struct *t)
 {
-	struct adf_etr_bank_data *bank = (void *)bank_addr;
+	struct adf_etr_bank_data *bank = from_tasklet(bank, t, resp_handler);
 	struct adf_hw_csr_ops *csr_ops = GET_CSR_OPS(bank->accel_dev);
 
 	/* Handle all the responses and reenable IRQs */
diff --git a/drivers/crypto/qat/qat_common/adf_transport_internal.h b/drivers/crypto/qat/qat_common/adf_transport_internal.h
index 501bcf0f1809..aaec7b2bc220 100644
--- a/drivers/crypto/qat/qat_common/adf_transport_internal.h
+++ b/drivers/crypto/qat/qat_common/adf_transport_internal.h
@@ -46,7 +46,7 @@ struct adf_etr_data {
 	struct dentry *debug;
 };
 
-void adf_response_handler(uintptr_t bank_addr);
+void adf_response_handler(struct tasklet_struct *t);
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 int adf_bank_debugfs_add(struct adf_etr_bank_data *bank);
diff --git a/drivers/crypto/qat/qat_common/adf_vf_isr.c b/drivers/crypto/qat/qat_common/adf_vf_isr.c
index 38d316a42ba6..1d0ff58fd9b5 100644
--- a/drivers/crypto/qat/qat_common/adf_vf_isr.c
+++ b/drivers/crypto/qat/qat_common/adf_vf_isr.c
@@ -68,9 +68,10 @@ static void adf_dev_stop_async(struct work_struct *work)
 	kfree(stop_data);
 }
 
-static void adf_pf2vf_bh_handler(void *data)
+static void adf_pf2vf_bh_handler(struct tasklet_struct *t)
 {
-	struct adf_accel_dev *accel_dev = data;
+	struct adf_accel_dev *accel_dev = from_tasklet(accel_dev, t,
+						       vf.pf2vf_bh_tasklet);
 	struct adf_hw_device_data *hw_data = accel_dev->hw_device;
 	struct adf_bar *pmisc =
 			&GET_BARS(accel_dev)[hw_data->get_misc_bar_id(hw_data)];
@@ -138,8 +139,7 @@ static void adf_pf2vf_bh_handler(void *data)
 
 static int adf_setup_pf2vf_bh(struct adf_accel_dev *accel_dev)
 {
-	tasklet_init(&accel_dev->vf.pf2vf_bh_tasklet,
-		     (void *)adf_pf2vf_bh_handler, (unsigned long)accel_dev);
+	tasklet_setup(&accel_dev->vf.pf2vf_bh_tasklet, adf_pf2vf_bh_handler);
 
 	mutex_init(&accel_dev->vf.vf2pf_lock);
 	return 0;
@@ -216,8 +216,7 @@ static int adf_setup_bh(struct adf_accel_dev *accel_dev)
 {
 	struct adf_etr_data *priv_data = accel_dev->transport;
 
-	tasklet_init(&priv_data->banks[0].resp_handler, adf_response_handler,
-		     (unsigned long)priv_data->banks);
+	tasklet_setup(&priv_data->banks[0].resp_handler, adf_response_handler);
 	return 0;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
