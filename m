Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8F5C3F2CE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D3E20836
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q/BNYpHn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O6mF9GbT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D3E20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tlbisUcipFQg4YwJUxw5d1pquvjR7ZqafpYLUwZffQ=; b=Q/BNYpHnGRW+bh
	s5pYyLGhDbnegRwzQ8yWecfmMNNmc9n19f2640WHUYs3bzCzuOaZnDEE0r56AjnvvSJPLsxlRAa2e
	wQ3lPOzxI7LSM3JSr++iLMi3w5G7DZ6NYIq1IRZBdVbO3cnBTY39hAheXfPmo5o2b1wrxDEzV4otE
	AssmApuUFM/tBCysZPdIXU97hnfMgYuQLdtYi+RrB40r1MxEOnpQ0nB5qTweeDyRoKh5JZjHx9gll
	XEGH9QFBa46VpMCxVKNrMK6cIFUFUnwO9bAnILLtqpt4BMVPnvc1CTp1TQK96j6PUO3uQMred9Nc3
	RNbnEE1T2OfCTFMkuUKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9Kbc-0005qU-B9; Wed, 04 Mar 2020 03:21:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9KbZ-0005ne-A1
 for linux-mediatek@lists.infradead.org; Wed, 04 Mar 2020 03:21:54 +0000
X-UUID: 84b070c527a145b7bea539dbe6060611-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qsn5ZtkxofEPhSlSyo8Sta1tKWHmr79ZpPp6bUCSBTY=; 
 b=O6mF9GbTYg3/U0O2uHd8IUGywS/WyPCyEhT9S2wLrY+qe4qwWXRTUtL18guPa1SVZo6ihIGjy4sTdWoF3PBTNZgRXZyTGVFqPiZJYi672+XXqH5jhquz0obYmjBirf1oKxnFhPGbo089h5Si2IRPqux7OU5XFn0gToXtdA4904Q=;
X-UUID: 84b070c527a145b7bea539dbe6060611-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 171155011; Tue, 03 Mar 2020 19:21:47 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 19:13:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 11:11:10 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Mar 2020 11:09:47 +0800
From: <light.hsieh@mediatek.com>
To: <ulf.hansson@linaro.org>
Subject: [RESEND PATCH v1 1/3] mmc: record wp_grp_size and boot_wp_status
Date: Wed, 4 Mar 2020 11:12:15 +0800
Message-ID: <1583291537-15053-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1583291537-15053-1-git-send-email-light.hsieh@mediatek.com>
References: <1583291537-15053-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EF3CC1366C200503190F9B55F614E6A974DDF1E539B2458F696DA0060AB324932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_192153_356207_6B21154B 
X-CRM114-Status: GOOD (  10.97  )
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
