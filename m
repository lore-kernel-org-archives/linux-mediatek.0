Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E45C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 15:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ov9TiPDknb6R9yF2IVYZFuRm6kOrz1Qf6/9qeS+Jpgw=; b=08zypM53lmx326kjepH/ko+4pj
	rNaMEGnhvz4ERiXVJlY7k+WOn0SCWMGdQJljENbb3Su582toC9YS/RmAkkut03/hWdn56WyxOKCJw
	PINqdgucHugqNrXrARrvLaFgYrTuaUT+SdcuBmLBS3YfqPvNzAnCMcjEI2ANp64+6h+XEWSzebMVm
	XcbZLQq07HMiGV4LGDmWnyhTTzJf/TGv6r+SqNwGZbOFeXJ95Z2xr6x4FLPlUB8U1MhmH2oSu7ygj
	Ztpj/EgaMovz3/GkRFhQ8a82QRmwA66rXIowqRabZOqg8u/l0bXjpcach4+bkXyZcNbVmYJtiarkF
	Tg/2AUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDbW-007maU-2W;
	Wed, 01 Nov 2023 15:58:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDbR-007mZi-02;
	Wed, 01 Nov 2023 15:58:00 +0000
X-UUID: 6a33816c78cf11ee9b7791016c24628a-20231101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ov9TiPDknb6R9yF2IVYZFuRm6kOrz1Qf6/9qeS+Jpgw=;
	b=eRKHuDNR7dwvvJC73Gf2FnXBKgTtvdU2LnK0b/TF9b04figWWQG0nT55jpzRc63BdYeulD1QNeCi7J/BirD08Ye9h1aeFYDNAzXlj5abPelL2N1B4DAjuS+D3WkKujoZy4g79VhTkECX9hKXLsjrDDIDDO0qsW4lnvdDg0q4h0M=;
X-CID-CACHE: Type:Local,Time:202311010849-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:fe422fb5-f3c9-427d-ab9e-a15d51e95809,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:c53de694-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6a33816c78cf11ee9b7791016c24628a-20231101
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1827127839; Wed, 01 Nov 2023 08:57:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 1 Nov 2023 23:37:49 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 1 Nov 2023 23:37:48 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <yongdong.zhang@mediatek.com>, <browse.zhang@mediatek.com>,
	<lin.gui@mediatek.com>, <qilin.tan@mediatek.com>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mmc: add wp_grp_size node
Date: Wed, 1 Nov 2023 23:37:37 +0800
Message-ID: <20231101153738.118659-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_085757_058214_00C5B43A 
X-CRM114-Status: GOOD (  17.33  )
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

From: "lin.gui" <lin.gui@mediatek.com>

Detail:
Add node "wp_grp_size", corresponding to WP_GRP_SIZE
(write protect group size) of eMMC's CSD register.

Scenario:
The eMMC card can be set into write-protected mode to
prevent data from being accidentally modified or deleted.
Wp_grp_size (Write Protect Group Size) refers to an
attribute of the eMMC card, used to manage write protection,
and is the CSD register  [36:32] of the eMMC device.
Wp_grp_size (Write Protect Group Size) indicates how many
eMMC blocks are contained in each write protection group on the eMMC card.

Final rendered file:
"/sys/class/mmc_host/mmc0/mmc0:0001/wp_grp_size"

Signed-off-by: lin.gui <lin.gui@mediatek.com>
Change-Id: I73952dbde2db375ba918daadb3264380b7863096
---
 drivers/mmc/core/mmc.c   | 16 +++++++++++++++-
 include/linux/mmc/card.h |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 4a4bab9aa726..9b67e49a9e63 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -136,6 +136,17 @@ static void mmc_set_erase_size(struct mmc_card *card)
 	mmc_init_erase(card);
 }
 
+
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
@@ -186,6 +197,7 @@ static int mmc_decode_csd(struct mmc_card *card)
 		b = UNSTUFF_BITS(resp, 37, 5);
 		csd->erase_size = (a + 1) * (b + 1);
 		csd->erase_size <<= csd->write_blkbits - 9;
+		csd->wp_grp_size = UNSTUFF_BITS(resp, 32, 5);
 	}
 
 	return 0;
@@ -791,6 +803,7 @@ MMC_DEV_ATTR(csd, "%08x%08x%08x%08x\n", card->raw_csd[0], card->raw_csd[1],
 MMC_DEV_ATTR(date, "%02d/%04d\n", card->cid.month, card->cid.year);
 MMC_DEV_ATTR(erase_size, "%u\n", card->erase_size << 9);
 MMC_DEV_ATTR(preferred_erase_size, "%u\n", card->pref_erase << 9);
+MMC_DEV_ATTR(wp_grp_size, "%u\n", card->wp_grp_size << 9);
 MMC_DEV_ATTR(ffu_capable, "%d\n", card->ext_csd.ffu_capable);
 MMC_DEV_ATTR(hwrev, "0x%x\n", card->cid.hwrev);
 MMC_DEV_ATTR(manfid, "0x%06x\n", card->cid.manfid);
@@ -851,6 +864,7 @@ static struct attribute *mmc_std_attrs[] = {
 	&dev_attr_date.attr,
 	&dev_attr_erase_size.attr,
 	&dev_attr_preferred_erase_size.attr,
+	&dev_attr_wp_grp_size.attr,
 	&dev_attr_fwrev.attr,
 	&dev_attr_ffu_capable.attr,
 	&dev_attr_hwrev.attr,
@@ -1759,7 +1773,7 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 			mmc_set_erase_size(card);
 		}
 	}
-
+	mmc_set_wp_grp_size(card);
 	/*
 	 * Ensure eMMC user default partition is enabled
 	 */
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index daa2f40d9ce6..62873ecc52f1 100644
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
@@ -304,6 +305,7 @@ struct mmc_card {
 	unsigned int		eg_boundary;	/* don't cross erase-group boundaries */
 	unsigned int		erase_arg;	/* erase / trim / discard */
  	u8			erased_byte;	/* value of erased bytes */
+	unsigned int		wp_grp_size; /* write group size in sectors */
 
 	u32			raw_cid[4];	/* raw card CID */
 	u32			raw_csd[4];	/* raw card CSD */
-- 
2.17.0


