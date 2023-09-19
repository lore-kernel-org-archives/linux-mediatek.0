Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BE3CD3432
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 03:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sok7FijpBkztm+3g45hUbc7bumZrR63/NFUxRceRXGI=; b=FIVTHElE7xyet/KnF4CcX2/ahx
	smJE2dtPHCS9JT4kmb+Mc9kw88+8OGjQMQ68vi3eyiBxTcENWMKgLGQ4r9mrHMQsFCNC90WXL24DT
	WjrwBDXvFXj+w++rbjQnrZzUz05a8cXNuQyIxc+y3SYJhPM7/1CIx8Em/vBEYSbi5erwcdGqAnWOb
	0wovjfaHxOfU5+GTAzFDPSZ6sQFV26hWA1Ef+V+lAPVF09ByBUF2rS01cqQsXZm44Ws5ngbEww+Si
	G+Oit6BzvHFppn/WXociEPzVGt78rkfGzpUSUUARI/3V8K3sCgChGuG19o1qo5hPB10lpHwi8/5bd
	1aZr8Iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRC5-00Gml3-0a;
	Tue, 19 Sep 2023 03:14:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRC1-00GmkZ-2j;
	Tue, 19 Sep 2023 03:14:31 +0000
X-UUID: a2947f72569a11ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sok7FijpBkztm+3g45hUbc7bumZrR63/NFUxRceRXGI=;
	b=LlQ/zhyfc3JYmAOSyA0H4ayKKEyVYCZ3Ygr8jPdB0RaKTHINeXGYz8I9dONUU1Bud/9mo/xCO43sMMk4EXpghQqtETn8qH8csvk27r9sXV8oeiu9gPCXok1AiDzy/ZdcBMXBUpUJ1M4ws4sBTK8HLmcNiTAjYtEMXxAkNgsfk4A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:5dbbe937-d44e-4027-86f7-8e4b104f660d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:0f82febe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a2947f72569a11ee86758d4a7c00f3a0-20230918
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 10487811; Mon, 18 Sep 2023 20:14:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 11:03:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 11:03:47 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Jason-ch
 Chen" <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 05/10] drm/mediatek: Add mtk_ddp_sec_write to config secure buffer info
Date: Tue, 19 Sep 2023 11:03:40 +0800
Message-ID: <20230919030345.8629-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.195900-8.000000
X-TMASE-MatchedRID: yvDAzrttxFVvH7GZAcw0g03dRRsh/h6yqQ9UezeTkTj7efdnqtsaEx4S
	wGIs+PSaGQdEeHBaW03ijpjet3oGSC1Wsi+5O6JcQ5lZokGzOart/okBLaEo+A6QlBHhBZuwVSd
	AA6mVeIYgYsU8L2jyLIAy6p60ZV62fJ5/bZ6npdiyO81X3yak8x/ZuZrxnglDckm0qt1N+wm59w
	YeEP/lO9bWMxME39m8thcSAOHAJF9+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.195900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A76E1920480E25EAD878E5572C518C87A647104F54A19B23392BEE2F7BAD73A32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_201429_895131_8B935763 
X-CRM114-Status: GOOD (  11.66  )
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

Add mtk_ddp_sec_write to configure secure buffer information to
cmdq secure packet data.
Then secure cmdq driver will use these information to configure
curresponding secure DRAM address to HW overlay in secure world.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 12 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 771f4e173353..3dca936b9143 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -111,6 +111,18 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 #endif
 }
 
+void mtk_ddp_sec_write(struct cmdq_pkt *cmdq_pkt, u32 addr, u64 base,
+		       const enum cmdq_iwc_addr_metadata_type type,
+		       const u32 offset, const u32 size, const u32 port)
+{
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	/* secure buffer will be 4K alignment */
+	if (cmdq_pkt)
+		cmdq_sec_pkt_write(cmdq_pkt, addr, base, type,
+				   offset, ALIGN(size, PAGE_SIZE), port);
+#endif
+}
+
 static int mtk_ddp_clk_enable(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index febcaeef16a1..239a65140352 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -7,6 +7,7 @@
 #define MTK_DRM_DDP_COMP_H
 
 #include <linux/io.h>
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
@@ -291,4 +292,7 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask);
+void mtk_ddp_sec_write(struct cmdq_pkt *cmdq_pkt, u32 addr, u64 base,
+		       const enum cmdq_iwc_addr_metadata_type type,
+		       const u32 offset, const u32 size, const u32 port);
 #endif /* MTK_DRM_DDP_COMP_H */
-- 
2.18.0


