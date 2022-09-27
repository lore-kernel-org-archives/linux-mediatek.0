Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5806C6FA93
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 02:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGV4Mh7EE7zp++AbZ62Qr7GojYfsLp9od1ijjZk+9Z0=; b=UfDax18/XO8JPq2LQrtc/bjDxh
	yoXMM0NtJfjjQTdPEJWhCUsDXGGSE2IRQqYq49bpjsNPZ+Q4ounYpdm4t3UFFZIu7QFdb32rnolr6
	D1Y3yqv0zlkknqpFnq6LN/RLXkTxXS7qz8ZT9I0pP5C3/9WGvHRN6yiRJjjPFs75YMwd5NzxYZdXY
	e5LnL8/RDXfK9tzruvYb6QlCwG9zVnmPGMcTLVuMXLjySw1eYUq9vhKY0woXqe5wDB2gb4VAoyhKb
	u5nTDvEiCuIPCfik/8f8TRIoCTsVYs1weqKE+NqyeVfqN3iOAmU767zHLA5PYzkIC/a7S8gYc2hVa
	rT7bvS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0oe-007zwp-05; Tue, 27 Sep 2022 02:59:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0oM-007zqB-1v; Tue, 27 Sep 2022 02:59:07 +0000
X-UUID: 2d2a7ef72881475d980dcfdee528c738-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SGV4Mh7EE7zp++AbZ62Qr7GojYfsLp9od1ijjZk+9Z0=;
	b=uAU8reRiRyNr+OB05uqjAtfQbeqGqJyw0HUAKWo5vskweTc7Xm8eak4nGPjwCi410L+nBp4TtYRnP0f9MTlVu7ePN32QVZcjiGgzTbTXFEkSe1yg9WiPNmxT47Gtvq4b3unFlMF3q2zG8UkHst4w3SzWigBKE+bigZwmGXJz1oc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3eff0546-487d-4c65-bbe5-981080f267e1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:3eff0546-487d-4c65-bbe5-981080f267e1,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:61d41c07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:220927105630LRPANMO4,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 2d2a7ef72881475d980dcfdee528c738-20220926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 185073817; Mon, 26 Sep 2022 19:59:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Sep 2022 10:56:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 10:56:26 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 09/11] remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
Date: Tue, 27 Sep 2022 10:56:04 +0800
Message-ID: <20220927025606.26673-10-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_195906_459977_6B3A3763 
X-CRM114-Status: GOOD (  15.29  )
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
have the same viewpoint of SRAM, SCP has a "Core 1 SRAM offset"
to control the viewpoint of SCP core 1 to allow core 1 boot
from different SRAM location.

The "Core 1 SRAM offset" configuration is composed by specifying a range
and an offset. When SCP core 1 accesses a SRAM address located in the
configured range, SCP bus adds the configured offset to the address to
shift the final physical destination on SCP SRAM. This shift is
transparent to the software running on SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 2d43338b96da..0f1b587f8502 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -477,6 +477,8 @@ static int mt8195_scp_before_load(struct mtk_scp *scp)
 
 static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 {
+	u32 sec_ctrl;
+
 	scp_sram_power_on(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
 	/* hold SCP in reset while loading FW. */
@@ -485,6 +487,27 @@ static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
 
+	/* The value of SRAM offset range is from the viewpoint of SCP core 1.
+	 * This configuration adds an offset on SCP bus when SCP core 1 accesses SCP SRAM
+	 * to solve the SCP core 0 and core 1 both fetch the 1st instruction from the same
+	 * SRAM address.
+	 *
+	 * Because SCP core 0 and core 1 both boot from the head of sram, this must be
+	 * configured before boot SCP core 1.
+	 *
+	 * Configure the range of SRAM addresses will be added offset.
+	 */
+	writel(0, scp->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_LOW);
+	writel(scp->sram_size, scp->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_HIGH);
+
+	/* configure the offset value */
+	writel(scp->sram_phys - scp->main_scp->sram_phys, scp->reg_base + MT8195_L2TCM_OFFSET);
+
+	/* enable adding sram offset when fetching instruction and data */
+	sec_ctrl = readl(scp->reg_base + MT8195_SEC_CTRL);
+	sec_ctrl |= MT8195_CORE_OFFSET_ENABLE_I | MT8195_CORE_OFFSET_ENABLE_D;
+	writel(sec_ctrl, scp->reg_base + MT8195_SEC_CTRL);
+
 	return 0;
 }
 
-- 
2.18.0


