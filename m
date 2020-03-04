Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C04C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:01:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A7A4214D8
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nD78mkat";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZLDaJyn2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A7A4214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tlbisUcipFQg4YwJUxw5d1pquvjR7ZqafpYLUwZffQ=; b=nD78mkatotdvTc
	2P2sTPRhplQ38u2SRxVxG6JCEiiImLta7HFubZdsW0xCUH2LRTNjGyiXzAH3z7qZYkWXRl27ju+xc
	IEGi428putFWogxvsZ9k3pSRm65Dt+0ljcB/WTA6juOu0ZSd2ni5zdIIGmzS7bsaf3qzsxDwfs3WF
	qyTeqf582KqvNHgoiNh+L0452RszsWtl0Rl9ZqlKifwl6KFAHQU0dtUy5vsoiX10+Z/K94xoRscqO
	wqoGmTI78BTPMoBS08/IDEJ3H5WMF1rknK4YSSQdLAk9TfJkX/NUwUtNiCER1C75KOJ01v5hr5XDa
	JY678huDLy3pKyxPuACQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9KHp-0006k7-Rm; Wed, 04 Mar 2020 03:01:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9KHl-0006e2-43
 for linux-mediatek@lists.infradead.org; Wed, 04 Mar 2020 03:01:27 +0000
X-UUID: 0f7b9e8965434339a9f320c7a7caab5c-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qsn5ZtkxofEPhSlSyo8Sta1tKWHmr79ZpPp6bUCSBTY=; 
 b=ZLDaJyn2TCLa7CuepC1aRDzwajHeVoeUiC97mLbZIauMIAMUEYldfo5wRGbnDgzTEcSWjhUInSzHS3VpCX8JhxGnoXhcbjaw4IA4FwJbcSQqCW1sqZiyzPFRjdmZ7lig5Z/eur+GsBf3nqhLz6fPfE5lGo7Aj5KOqPLpJ/nbLVk=;
X-UUID: 0f7b9e8965434339a9f320c7a7caab5c-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1422687399; Tue, 03 Mar 2020 19:01:18 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:58:30 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 10:59:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Mar 2020 10:58:16 +0800
From: <light.hsieh@mediatek.com>
To: <ulf.hansson@linaro.org>
Subject: [PATCH v1 1/3] mmc: record wp_grp_size and boot_wp_status
Date: Wed, 4 Mar 2020 10:57:33 +0800
Message-ID: <1583290655-7858-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1583290655-7858-1-git-send-email-light.hsieh@mediatek.com>
References: <1583290655-7858-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_190125_192664_AD496ED9 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: axboe@kernel.dk, kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 Light Hsieh <light.hsieh@mediatek.com>, linux-block@vger.kernel.org,
 linux-mediatek@lists.infradead.org, stanley.chu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

1. record wp_grp_size (write-protection group size) in struct mmc_csd and
   struct mmc_card.
2. record boot_wp_status (boot partition write-protection status) in struct
   mmc_ext_csd.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
---
 drivers/mmc/core/mmc.c   | 16 ++++++++++++++++
 include/linux/mmc/card.h |  3 +++
 include/linux/mmc/mmc.h  |  1 +
 3 files changed, 20 insertions(+)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index f6912de..77305c8 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -127,6 +127,16 @@ static void mmc_set_erase_size(struct mmc_card *card)
 	mmc_init_erase(card);
 }
 
+static void mmc_set_wp_grp_size(struct mmc_card *card)
+{
+	if (card->ext_csd.erase_group_def & 1)
+		card->wp_grp_size = card->ext_csd.hc_erase_size *
+			card->ext_csd.raw_hc_erase_gap_size;
+	else
+		card->wp_grp_size = card->csd.erase_size *
+			(card->csd.wp_grp_size + 1);
+}
+
 /*
  * Given a 128-bit response, decode to our card CSD structure.
  */
@@ -177,6 +187,7 @@ static int mmc_decode_csd(struct mmc_card *card)
 		b = UNSTUFF_BITS(resp, 37, 5);
 		csd->erase_size = (a + 1) * (b + 1);
 		csd->erase_size <<= csd->write_blkbits - 9;
+		csd->wp_grp_size = UNSTUFF_BITS(resp, 32, 5);
 	}
 
 	return 0;
@@ -496,6 +507,8 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 *ext_csd)
 		card->ext_csd.boot_ro_lock = ext_csd[EXT_CSD_BOOT_WP];
 		card->ext_csd.boot_ro_lockable = true;
 
+		card->ext_csd.boot_wp_status = ext_csd[EXT_CSD_BOOT_WP_STATUS];
+
 		/* Save power class values */
 		card->ext_csd.raw_pwr_cl_52_195 =
 			ext_csd[EXT_CSD_PWR_CL_52_195];
@@ -769,6 +782,7 @@ static int mmc_compare_ext_csds(struct mmc_card *card, unsigned bus_width)
 	card->raw_csd[2], card->raw_csd[3]);
 MMC_DEV_ATTR(date, "%02d/%04d\n", card->cid.month, card->cid.year);
 MMC_DEV_ATTR(erase_size, "%u\n", card->erase_size << 9);
+MMC_DEV_ATTR(wp_grp_size, "%u\n", card->wp_grp_size << 9);
 MMC_DEV_ATTR(preferred_erase_size, "%u\n", card->pref_erase << 9);
 MMC_DEV_ATTR(ffu_capable, "%d\n", card->ext_csd.ffu_capable);
 MMC_DEV_ATTR(hwrev, "0x%x\n", card->cid.hwrev);
@@ -828,6 +842,7 @@ static ssize_t mmc_dsr_show(struct device *dev,
 	&dev_attr_csd.attr,
 	&dev_attr_date.attr,
 	&dev_attr_erase_size.attr,
+	&dev_attr_wp_grp_size.attr,
 	&dev_attr_preferred_erase_size.attr,
 	&dev_attr_fwrev.attr,
 	&dev_attr_ffu_capable.attr,
@@ -1709,6 +1724,7 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 			mmc_set_erase_size(card);
 		}
 	}
+	mmc_set_wp_grp_size(card);
 
 	/*
 	 * Ensure eMMC user default partition is enabled
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index cf3780a..0139461 100644
--- a/include/linux/mmc/card.h
+++ b/include/linux/mmc/card.h
@@ -32,6 +32,7 @@ struct mmc_csd {
 	unsigned int		r2w_factor;
 	unsigned int		max_dtr;
 	unsigned int		erase_size;		/* In sectors */
+	unsigned int		wp_grp_size;
 	unsigned int		read_blkbits;
 	unsigned int		write_blkbits;
 	unsigned int		capacity;
@@ -94,6 +95,7 @@ struct mmc_ext_csd {
 	u8			raw_exception_status;	/* 54 */
 	u8			raw_partition_support;	/* 160 */
 	u8			raw_rpmb_size_mult;	/* 168 */
+	u8			boot_wp_status;	        /* 174 */
 	u8			raw_erased_mem_count;	/* 181 */
 	u8			strobe_support;		/* 184 */
 	u8			raw_ext_csd_structure;	/* 194 */
@@ -278,6 +280,7 @@ struct mmc_card {
 	unsigned int		eg_boundary;	/* don't cross erase-group boundaries */
 	unsigned int		erase_arg;	/* erase / trim / discard */
  	u8			erased_byte;	/* value of erased bytes */
+	unsigned int		wp_grp_size;    /* write group size(sectors) */
 
 	u32			raw_cid[4];	/* raw card CID */
 	u32			raw_csd[4];	/* raw card CSD */
diff --git a/include/linux/mmc/mmc.h b/include/linux/mmc/mmc.h
index 897a87c..2c9d988 100644
--- a/include/linux/mmc/mmc.h
+++ b/include/linux/mmc/mmc.h
@@ -259,6 +259,7 @@ static inline bool mmc_op_multi(u32 opcode)
 #define EXT_CSD_RPMB_MULT		168	/* RO */
 #define EXT_CSD_FW_CONFIG		169	/* R/W */
 #define EXT_CSD_BOOT_WP			173	/* R/W */
+#define EXT_CSD_BOOT_WP_STATUS		174	/* RO */
 #define EXT_CSD_ERASE_GROUP_DEF		175	/* R/W */
 #define EXT_CSD_PART_CONFIG		179	/* R/W */
 #define EXT_CSD_ERASED_MEM_CONT		181	/* RO */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
