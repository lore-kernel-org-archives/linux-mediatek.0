Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA75C83003
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXn8SvH2/w9lO1bbMXJFemS5MdtvWe7KC3lTPxKRpm0=; b=IlqMrxfgf3OkS0GuzPuftJv0Hk
	NDAGopks3piEhCoz5x3x6ZWxi683J4e222GI0XyKh1du2319z3wW4RNkts9zxQvX0T5WDhq87miUr
	mXl5z2fc8wIjwTV1uyIp31Myxt8STQJSNACz7L8j5k0pVJ/gbxyOnTDa6JUynhFkA+/UwB3ippr0J
	2Wn3RX/1Vf+L/MSpkMSYLFFhAf9vjj7xDJtuDDHSR0zch8EfX94I8weam8IVv1UTar8fBPlJvjM7J
	49LJh4tbx+smk+OFGomRj/+8muAWYY+Nt12vc1HPrUdvxumL6qxgJETsVopsQpAGPI1VgWE9TWArZ
	6yMqPrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nVI-004htF-27;
	Wed, 07 Jun 2023 07:22:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nVB-004hl5-0U;
	Wed, 07 Jun 2023 07:22:42 +0000
X-UUID: 13ef3f1a050411ee83ed1395ce914268-20230607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QXn8SvH2/w9lO1bbMXJFemS5MdtvWe7KC3lTPxKRpm0=;
	b=k5ZFjO1AslVffJQhDmVjvt9TLpMQnypjFb++FCf2Pou1jZWWg96oX6tcMrrPBkJdxHu7NYJyRQqFD6vdVhkm4B/YivKG7s4exBX+kR9f7Ed+6fHe1fG8BtiepUywL/2tHraAH/4hL2xmuCRteJQHIZQ1eE9o1xJkSpYyVHzHy6E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:d0120fc9-dd8b-4bc5-a51f-ec5c975fad24,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:f75dd63d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 13ef3f1a050411ee83ed1395ce914268-20230607
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 167726036; Wed, 07 Jun 2023 00:22:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 15:22:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 15:22:24 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v13 08/11] remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
Date: Wed, 7 Jun 2023 15:22:19 +0800
Message-ID: <20230607072222.8628-9-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230607072222.8628-1-tinghan.shen@mediatek.com>
References: <20230607072222.8628-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_002241_198401_A6AA79DF 
X-CRM114-Status: GOOD (  18.13  )
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

Because MT8195 SCP core 0 and core 1 both boot from head of SRAM and
have the same viewpoint of SRAM, SCP has a "core 1 SRAM offset"
configuration to control the access destination of SCP core 1 to boot
core 1 from different SRAM location.

The "core 1 SRAM offset" configuration is composed by a range
and an offset. It works like a simple memory mapped mechanism.
When SCP core 1 accesses a SRAM address located in the range,
the SCP bus adds the configured offset to the address to
shift the physical destination address on SCP SRAM. This shifting is
transparent to the software running on SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_common.h |  7 +++++++
 drivers/remoteproc/mtk_scp.c    | 27 +++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 0bfd242c41cc..2806bd71ef94 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -65,6 +65,13 @@
 #define MT8195_CORE1_MEM_ATT_PREDEF		0x20008
 #define MT8195_CORE1_WDT_CFG			0x20034
 
+#define MT8195_SEC_CTRL				0x85000
+#define MT8195_CORE_OFFSET_ENABLE_D		BIT(13)
+#define MT8195_CORE_OFFSET_ENABLE_I		BIT(12)
+#define MT8195_L2TCM_OFFSET_RANGE_0_LOW		0x850b0
+#define MT8195_L2TCM_OFFSET_RANGE_0_HIGH	0x850b4
+#define MT8195_L2TCM_OFFSET			0x850d0
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index edbf71f4c21e..82bba6146d23 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -498,6 +498,9 @@ static int mt8195_scp_before_load(struct mtk_scp *scp)
 
 static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 {
+	u32 sec_ctrl;
+	struct mtk_scp *scp_c0;
+
 	scp_sram_power_on(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
 	/* hold SCP in reset while loading FW. */
@@ -506,6 +509,30 @@ static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
 
+	/*
+	 * The L2TCM_OFFSET_RANGE and L2TCM_OFFSET shift the destination address
+	 * on SRAM when SCP core 1 accesses SRAM.
+	 *
+	 * This configuration solves booting the SCP core 0 and core 1 from
+	 * different SRAM address because core 0 and core 1 both boot from
+	 * the head of SRAM by default. this must be configured before boot SCP core 1.
+	 *
+	 * The value of L2TCM_OFFSET_RANGE is from the viewpoint of SCP core 1.
+	 * When SCP core 1 issues address within the range (L2TCM_OFFSET_RANGE),
+	 * the address will be added with a fixed offset (L2TCM_OFFSET) on the bus.
+	 * The shift action is tranparent to software.
+	 */
+	writel(0, scp->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_LOW);
+	writel(scp->sram_size, scp->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_HIGH);
+
+	scp_c0 = list_first_entry(scp->cluster, struct mtk_scp, elem);
+	writel(scp->sram_phys - scp_c0->sram_phys, scp->reg_base + MT8195_L2TCM_OFFSET);
+
+	/* enable SRAM offset when fetching instruction and data */
+	sec_ctrl = readl(scp->reg_base + MT8195_SEC_CTRL);
+	sec_ctrl |= MT8195_CORE_OFFSET_ENABLE_I | MT8195_CORE_OFFSET_ENABLE_D;
+	writel(sec_ctrl, scp->reg_base + MT8195_SEC_CTRL);
+
 	return 0;
 }
 
-- 
2.18.0


