Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66A6C197A0
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 03:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bstjx1naY+ACD44JpQLykCLyHHU2RE59YMPPwiAKQfo=; b=XVIvTlvmlhynQuJ74RZaIBXvr/
	zViQ1Iov9gdu2GTtWbH4ZSi0l1hPugaCepKhnWrh4qTPdwL7aM5P3URPga1al6uanSFfq/4OQeRgP
	wZ7/s9vcN0rM4D/TH9Af1ztrhIlXV/BoJwVqO4+TDueXokIDbKSFxBGAjMVB4s5KNnEYNFNZAPFL1
	wMAZNFx1GvqRZpZ/aLi+ai2etMbdOkwNXffNDRSxY0Yd4PnatcemKEjbplIo6+1grIxkl47I1XBRZ
	+wCcG+3RWB8JttB6yobS0XN7VGu/PRBrq/FElTW/aSNAo1MXJzyUvSMjk/DAKWTVvB2NqaAQDIdBa
	lQTLbQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4C2N-007mQp-0V;
	Sat, 18 Nov 2023 03:30:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4C2J-007mQI-0h;
	Sat, 18 Nov 2023 03:30:24 +0000
X-UUID: ca5e522e85c211ee9b7791016c24628a-20231117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Bstjx1naY+ACD44JpQLykCLyHHU2RE59YMPPwiAKQfo=;
	b=o9MSK6U2cW1lSMWf3RP8tdxppe6xAVpw7U1TwkwFySyp2/p1TAde2/oFuAi/AmwSz6CWnKjdscQL167RgEElNb5t5TmTeD2IcL70NVjs8a3KrgMWx9+j2pQ1fh41ISsK/SALZ8OY3G3RXx/QwoFp6L6OZVXjH9NBPeIfFQia4nc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:66951b67-f7ee-415c-a0b3-6a32accb42f2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:a6aa8795-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ca5e522e85c211ee9b7791016c24628a-20231117
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1132276145; Fri, 17 Nov 2023 20:30:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 18 Nov 2023 11:30:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 18 Nov 2023 11:30:12 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH] usb: xhci-mtk: fix in-ep's start-split check failure
Date: Sat, 18 Nov 2023 11:30:11 +0800
Message-ID: <20231118033011.22033-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_193023_269980_7A537582 
X-CRM114-Status: GOOD (  15.37  )
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

It's wrong to use the data length in a CS (in uframe x) to check whether
there is a SS (in uframe x-2), because for a isoc-in ep, it may need some
CS to receive data;
Save the count of SS in a uframe for isoc/intr in-eps to fix the issue.

Fixes: 5c954e030f55 ("usb: xhci-mtk: improve split scheduling by separate IN/OUT budget")
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 13 ++++++++++---
 drivers/usb/host/xhci-mtk.h     |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 5b3cd455adec..61f3f8bbdcea 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -650,9 +650,8 @@ static int check_isoc_ss_overlap(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 
 		if (sch_ep->ep_type == ISOC_OUT_EP) {
 			for (j = 0; j < sch_ep->num_budget_microframes; j++) {
-				k = XHCI_MTK_BW_INDEX(base + j + CS_OFFSET);
-				/* use cs to indicate existence of in-ss @(base+j) */
-				if (tt->fs_bus_bw_in[k])
+				k = XHCI_MTK_BW_INDEX(base + j);
+				if (tt->in_ss_cnt[k])
 					return -ESCH_SS_OVERLAP;
 			}
 		} else if (sch_ep->ep_type == ISOC_IN_EP || sch_ep->ep_type == INT_IN_EP) {
@@ -769,6 +768,14 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
 				tt->fs_frame_bw[f] -= (u16)sch_ep->bw_budget_table[j];
 			}
 		}
+
+		if (sch_ep->ep_type == ISOC_IN_EP || sch_ep->ep_type == INT_IN_EP) {
+			k = XHCI_MTK_BW_INDEX(base);
+			if (used)
+				tt->in_ss_cnt[k]++;
+			else
+				tt->in_ss_cnt[k]--;
+		}
 	}
 
 	if (used)
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 865b55e23b15..39f7ae7d3087 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -38,6 +38,7 @@
  * @fs_bus_bw_in: save bandwidth used by FS/LS IN eps in each uframes
  * @ls_bus_bw: save bandwidth used by LS eps in each uframes
  * @fs_frame_bw: save bandwidth used by FS/LS eps in each FS frames
+ * @in_ss_cnt: the count of Start-Split for IN eps
  * @ep_list: Endpoints using this TT
  */
 struct mu3h_sch_tt {
@@ -45,6 +46,7 @@ struct mu3h_sch_tt {
 	u16 fs_bus_bw_in[XHCI_MTK_MAX_ESIT];
 	u8 ls_bus_bw[XHCI_MTK_MAX_ESIT];
 	u16 fs_frame_bw[XHCI_MTK_FRAMES_CNT];
+	u8 in_ss_cnt[XHCI_MTK_MAX_ESIT];
 	struct list_head ep_list;
 };
 
-- 
2.25.1


