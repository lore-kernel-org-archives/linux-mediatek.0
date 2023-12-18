Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C6C35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 22:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v9sJxu+peZKEvGLvTmMpiV6Tv/puBAp7n/rM5sIpeRQ=; b=elUc8p1zZbaLbHxt6YW4ZQqxlr
	IElU85T8svFJV9MqIMQ9BKEp6MzTVJaXGo0qsKpZ0FxHwHKQ0/SW1tXUlFr/ooMMM7YZ9M/ALFH3y
	3T26cNiDc88bM3p2YixPWzVn+vWN9gd6ZQ/SlnX0LmnXba/fo7fPS/D4WOztej2/52VOd2h7lUkJn
	T5e9SkDeSpCe2G5hGAKTIVw91CrWqiTvITwbfdaBebdQVJmqwoQsdJ7E+/ItLbSmXuRBMuGL281j9
	9H/xSnj4grHHGBtD/FGKrmFnVTTI0DKuXyahtDUQgSkF0CaMjJAClvaMzyhRrIN3UjvSsZsVMKuDY
	Kt9tnRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFMPk-00CGBz-1d;
	Mon, 18 Dec 2023 22:48:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFMPh-00CGBB-1S;
	Mon, 18 Dec 2023 22:48:42 +0000
X-UUID: 9478e2629df711ee958cff29c719f35b-20231218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=v9sJxu+peZKEvGLvTmMpiV6Tv/puBAp7n/rM5sIpeRQ=;
	b=jTTi9TD/+OYGwTr2VSkioUKhzVzO53F35oZSmEVGyHCruJpgvdqxbCgCXjW4EVgPQiSUXnF1WZO3a1Fyk3IffQevYfuq8ERgQtBovhOzYU/58MFVPQgQHj/evMD5VXfD2DipAzqts3Xm2Y827PRehXu/rN77Rcw48CdaLAB8n4U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:7eb98434-3291-4bc7-a0a4-5bd35abc1c63,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:4faad0fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9478e2629df711ee958cff29c719f35b-20231218
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2040635828; Mon, 18 Dec 2023 15:48:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Dec 2023 06:48:33 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Dec 2023 06:48:33 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <yongdong.zhang@mediatek.com>, lin.gui <lin.gui@mediatek.com>, Bo Ye
	<bo.ye@mediatek.com>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] mmc: add wp_grp_size node
Date: Tue, 19 Dec 2023 06:48:29 +0800
Message-ID: <20231218224832.81347-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.793700-8.000000
X-TMASE-MatchedRID: HI0v3Fgc2rNGlhjnipkGEAwfhKwa9GwD+lX/RcQoG2FX4H/AHZTAKiQH
	YX2qyjfSlB6IdnaWhV1I7JPsZpNRgcL2WgOVZLNHhDqIQb7sQecK3n1SHen81VeilmPI7oJlf8S
	IQrqULYwLYtJsevMdjZZLxtyQINIcxzvHgMQjo/aEryjhqiyzyitovaaHxlUrXFNHTRKzg/r5WK
	Feqf3EsSNfw7OZ1vFwDx215gVwcojLJhhr8sBh+jNdJzhXekT2r4ukWaaTegDdPCHlFNPO/7K3o
	/jvHhd/z0if0vMXZ3Thyvjhw0nKvqtL0wBaA/G+syw+ZJnFumTeDOoY8z6DT8gYL9oUjHj+EPrQ
	9ei0HsbGhcwVapF2+oAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7DBO8LavgWJ5Hm17+SOHjgqwxZ+
	f6eSsGVBAmUDF4FZTXrw8q3AM+fg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.793700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4E964EB1473B3EB755A3FB3DD72D6712BE60E1BDEBE85B41496191B6C6DC46B52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_144841_543458_A20A97E2 
X-CRM114-Status: GOOD (  16.15  )
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

Signed-off-by: Lin Gui <lin.gui@mediatek.com>
Signed-off-by: Bo Ye <bo.ye@mediatek.com>
---
Change in v2: 
-remove Change-Id
-replace space with tabulation
---
 drivers/mmc/core/mmc.c   | 16 +++++++++++++++-
 include/linux/mmc/card.h |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 705942edacc6..e0d72378ac77 100644
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
@@ -790,6 +802,7 @@ MMC_DEV_ATTR(csd, "%08x%08x%08x%08x\n", card->raw_csd[0], card->raw_csd[1],
 MMC_DEV_ATTR(date, "%02d/%04d\n", card->cid.month, card->cid.year);
 MMC_DEV_ATTR(erase_size, "%u\n", card->erase_size << 9);
 MMC_DEV_ATTR(preferred_erase_size, "%u\n", card->pref_erase << 9);
+MMC_DEV_ATTR(wp_grp_size, "%u\n", card->wp_grp_size << 9);
 MMC_DEV_ATTR(ffu_capable, "%d\n", card->ext_csd.ffu_capable);
 MMC_DEV_ATTR(hwrev, "0x%x\n", card->cid.hwrev);
 MMC_DEV_ATTR(manfid, "0x%06x\n", card->cid.manfid);
@@ -850,6 +863,7 @@ static struct attribute *mmc_std_attrs[] = {
 	&dev_attr_date.attr,
 	&dev_attr_erase_size.attr,
 	&dev_attr_preferred_erase_size.attr,
+	&dev_attr_wp_grp_size.attr,
 	&dev_attr_fwrev.attr,
 	&dev_attr_ffu_capable.attr,
 	&dev_attr_hwrev.attr,
@@ -1764,7 +1778,7 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 			mmc_set_erase_size(card);
 		}
 	}
-
+	mmc_set_wp_grp_size(card);
 	/*
 	 * Ensure eMMC user default partition is enabled
 	 */
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index 7b12eebc5586..b9c3c6303a22 100644
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
@@ -306,6 +307,7 @@ struct mmc_card {
 	unsigned int		eg_boundary;	/* don't cross erase-group boundaries */
 	unsigned int		erase_arg;	/* erase / trim / discard */
  	u8			erased_byte;	/* value of erased bytes */
+	unsigned int		wp_grp_size;	/* write group size in sectors */
 
 	u32			raw_cid[4];	/* raw card CID */
 	u32			raw_csd[4];	/* raw card CSD */
-- 
2.18.0


