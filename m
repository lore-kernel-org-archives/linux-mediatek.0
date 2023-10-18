Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12229CDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 04:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzov/hpN4iX0pmFofJu6L2TrY3LTWXYkPYFRwpImDAk=; b=0FeNtsD+GCFInnZTWUBoxK5vZU
	JKw4a2SsRjq793GlidXpBEhTr0sKW6BwVqqgWe0yZPl7trhVqw32JUcffIYS1qrcpCANsmtvYQwe0
	ITx2+5EFYp0mbCOWzCLELF66aLdvtbVNIJRyOBZBMb3SR1c74nvGWz1RTSqrEBMOiTOfXd8UXcpSh
	G8UhQx2V4m7eaXrsd6QDJZiEYZXJTP+FFdGAPjq0He4DdgPTrNCV4F0F3a3y2ICV7U7BQA7/aBpaB
	dZsdZc2SPZQv4Pu9jvAI9R7hN4WM1mLz3dy9My/gzxzKWEuC2XY9oB6WQkMD19PdftoaVoFrbhHMO
	9zXAuSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsyJC-00DkM8-2m;
	Wed, 18 Oct 2023 04:37:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsyIp-00Djva-0t;
	Wed, 18 Oct 2023 04:37:05 +0000
X-UUID: f7aea74e6d6f11ee86758d4a7c00f3a0-20231017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qzov/hpN4iX0pmFofJu6L2TrY3LTWXYkPYFRwpImDAk=;
	b=Rb1FDxFlRANFYO8L0b19AbEfDlQy5lHHvs0Kd8i+Gavlh+25SxAkTrJ06z9oHORHmne4/3BoKQ0yY45lxc9cDFB59V6k+UzAN3Yzphbma2SOVCdAOwd+sVYgo4l4wUQF2sOKuUysvfe3vALbJVzpkFKHawLQVS0Y19nomudLxJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:5dd6a4c9-e116-4943-bfdc-162f113802ee,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:c954ecf0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f7aea74e6d6f11ee86758d4a7c00f3a0-20231017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 133859464; Tue, 17 Oct 2023 21:36:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Oct 2023 12:36:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Oct 2023 12:36:52 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 09/23] soc: mediatek: Support reset bit mapping in mmsys driver
Date: Wed, 18 Oct 2023 12:36:36 +0800
Message-ID: <20231018043650.22532-10-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231018043650.22532-1-shawn.sung@mediatek.com>
References: <20231018043650.22532-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.363700-8.000000
X-TMASE-MatchedRID: 6IKkQlwkGxfhsdkaHFW0p25IHkZABHAU0nXvwjW2mSXb6Y+fnTZUL+jk
	huBL0aGZ9SK5q0H2UamK0Joj0npda6m/G7eYsFM7wVaayvK71l/pJe7BSAYfSFsoEE3nOobwSI7
	v7A0N15jT01A2vEikVgG2ORx9EyapQylVlmxnJkaQOktEo73GFKIf1lfNT7Zi0pEcoXqJQB0G1W
	3alEv3RuLzNWBegCW2wgn7iDBesS0gBwKKRHe+rym8wnhgeYRu8Sb8LRlOeyolQIUEtjBUYtjYi
	PzlkU7iZOupnNkvA/U=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.363700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6CA514F979D6D1078D2995EBF42F856C09E6FB5109813BC33C8972EE05AA5D1C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_213703_314764_18834166 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

- Reset ID must starts from 0 and be consecutive, but
  the reset bits in our hardware design is not continuous,
  some bits are left unused, we need a map to solve the problem
- Use old style 1-to-1 mapping if .rst_tb is not defined

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 9 +++++++++
 drivers/soc/mediatek/mtk-mmsys.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index b1db09e19905..3a7108eefe9d 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -314,6 +314,15 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 	u32 offset;
 	u32 reg;
 
+	if (mmsys->data->rst_tb) {
+		if (id >= mmsys->data->num_resets) {
+			dev_err(rcdev->dev, "Invalid reset ID: %lu (>=%u)\n",
+				id, mmsys->data->num_resets);
+			return -EINVAL;
+		}
+		id = mmsys->data->rst_tb[id];
+	}
+
 	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
 	id = id % MMSYS_SW_RESET_PER_REG;
 	reg = mmsys->data->sw0_rst_offset + offset;
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 9d8507f98b7a..d370192737ca 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -78,6 +78,8 @@
 #define DSI_SEL_IN_RDMA				0x1
 #define DSI_SEL_IN_MASK				0x1
 
+#define MMSYS_RST_NR(bank, bit) (((bank) * 32) + (bit))
+
 struct mtk_mmsys_routes {
 	u32 from_comp;
 	u32 to_comp;
@@ -119,6 +121,7 @@ struct mtk_mmsys_driver_data {
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
+	const u8 *rst_tb;
 	const u32 num_resets;
 	const bool is_vppsys;
 	const u8 vsync_len;
-- 
2.18.0


