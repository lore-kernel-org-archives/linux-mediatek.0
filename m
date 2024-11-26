Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD21D3B98B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qp363pOkk5uIWe6ckwZTUijsChIwo2BFK3HWrcaSe4=; b=GSN3842kK091R621667l3fAeln
	YCA5aMLK6Mmffy/lZrkzEMKLFTXdA6vJm0iNM1SuUa+HDc7oq+aFz3N9VMCAAKdS4Lp8qHXChChxh
	H0I2nLVtNeNfHbqJnYQTl6t/V6I1aSf6gHEGQHJ4NugckiHx2hIby5mxVHfK869pYgwmmYKlwNZGb
	NOJ3Fjd6OCZLAz6XQdnBQx/j7QYvUYRXowMcormXdeBtwQldjecx1t5paTmB2hJCKvAJweFn7nSKx
	g9ACPQ5UInFavnfOjLDXvtu1ZekaVw2ea50F7TCnG/NODdvkK0pUJe25FQ5NtwNuuz39E1diS8YAH
	DCHzsD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv2q-0000000Abes-0jHD;
	Tue, 26 Nov 2024 12:51:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv1t-0000000AbTA-3YdZ;
	Tue, 26 Nov 2024 12:50:59 +0000
X-UUID: 10d381b2abf511ef9048ed6ed365623b-20241126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5qp363pOkk5uIWe6ckwZTUijsChIwo2BFK3HWrcaSe4=;
	b=ZxKtLh1kDhYBMubMVvH4OCodK1GDPnrB7Yd99uX/eb+YTqvONVVFhlYAiH+ONEtoDm1Cpk/40nos7+0wlVgHKw2hSRQtkn84kGOnda9KAjN8zzEmkn3++o/Pt2cMqQkLOvcIGQSH6T2NWjzFXoA7FVHmV0YzglFcGughShXQYGo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:646f331f-df3f-43f9-90a7-4eba13c13b5b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:c1274ee0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 10d381b2abf511ef9048ed6ed365623b-20241126
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 490381606; Tue, 26 Nov 2024 05:50:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 20:50:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 20:50:47 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>, <avri.altman@wdc.com>, <adrian.hunter@intel.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v2 1/2] mmc: core: Introduce the MMC_RSP_R1B_NO_CRC response
Date: Tue, 26 Nov 2024 20:48:22 +0800
Message-ID: <20241126125041.16071-2-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
References: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045057_889093_78F55588 
X-CRM114-Status: GOOD (  12.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The R1B response type with ignoring CRC is used in the mmc_cqe_recovery(),
introduce the MMC_RSP_R1B_NO_CRC response type to simplify the code.

Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
---
This patch dependents on "mmc: core: Drop the MMC_RSP_R1_NO_CRC response".

https://patchwork.kernel.org/patch/13884886

---
 drivers/mmc/core/core.c  | 6 ++----
 include/linux/mmc/core.h | 2 ++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index a499f3c59de5..4603224bafb9 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -557,8 +557,7 @@ int mmc_cqe_recovery(struct mmc_host *host)
 
 	memset(&cmd, 0, sizeof(cmd));
 	cmd.opcode       = MMC_STOP_TRANSMISSION;
-	cmd.flags        = MMC_RSP_R1B | MMC_CMD_AC;
-	cmd.flags       &= ~MMC_RSP_CRC; /* Ignore CRC */
+	cmd.flags        = MMC_RSP_R1B_NO_CRC | MMC_CMD_AC; /* Ignore CRC */
 	cmd.busy_timeout = MMC_CQE_RECOVERY_TIMEOUT;
 	mmc_wait_for_cmd(host, &cmd, MMC_CMD_RETRIES);
 
@@ -567,8 +566,7 @@ int mmc_cqe_recovery(struct mmc_host *host)
 	memset(&cmd, 0, sizeof(cmd));
 	cmd.opcode       = MMC_CMDQ_TASK_MGMT;
 	cmd.arg          = 1; /* Discard entire queue */
-	cmd.flags        = MMC_RSP_R1B | MMC_CMD_AC;
-	cmd.flags       &= ~MMC_RSP_CRC; /* Ignore CRC */
+	cmd.flags        = MMC_RSP_R1B_NO_CRC | MMC_CMD_AC; /* Ignore CRC */
 	cmd.busy_timeout = MMC_CQE_RECOVERY_TIMEOUT;
 	err = mmc_wait_for_cmd(host, &cmd, MMC_CMD_RETRIES);
 
diff --git a/include/linux/mmc/core.h b/include/linux/mmc/core.h
index e13856ab6ad0..4aeab326ed9d 100644
--- a/include/linux/mmc/core.h
+++ b/include/linux/mmc/core.h
@@ -64,6 +64,8 @@ struct mmc_command {
 #define MMC_RSP_R6	(MMC_RSP_PRESENT|MMC_RSP_CRC|MMC_RSP_OPCODE)
 #define MMC_RSP_R7	(MMC_RSP_PRESENT|MMC_RSP_CRC|MMC_RSP_OPCODE)
 
+#define MMC_RSP_R1B_NO_CRC	(MMC_RSP_PRESENT|MMC_RSP_OPCODE|MMC_RSP_BUSY)
+
 #define mmc_resp_type(cmd)	((cmd)->flags & (MMC_RSP_PRESENT|MMC_RSP_136|MMC_RSP_CRC|MMC_RSP_BUSY|MMC_RSP_OPCODE))
 
 /*
-- 
2.46.0


