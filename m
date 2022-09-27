Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99DCC07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 02:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkNDYHKBk0nJBWNSllWzoYdiVHavaX9jn1j8yxDr1j0=; b=nbNFgajtgJ8V7u1vpKB3dTRRpU
	kf4SUdl73pbx4xSLyleZoRAKxuruB8opTuuIcQ6SmQ2gc6cr7RYz7ut2FeeJnEQwGP029Lh6d9PEx
	FzcaQZQip8lOkajft/DcOyAky3Ckpe4INtOUoQ7IsmFsKznQhP2gkBkC3FKRrPSEQPuDdzj+hsH/S
	fq8Is4WYnA+b/654h2OS7ZJKrRNcSbro4z/xf48e6VJMSV6QcnfWe9kkVmG4DZ6YW4Yza3v+7QZFd
	Bp/LHl1c8CWbrFlnnjkf3c+8i0JWTfM3DdP2EArhwOY4otTSsGcnJxPjhkohGIdtxfdBsCERhuzxY
	/YrJK5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0oc-007zwK-OJ; Tue, 27 Sep 2022 02:59:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0oL-007zqp-Cy; Tue, 27 Sep 2022 02:59:06 +0000
X-UUID: 3d351b1f0e2240ba9bef462ec2bff553-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EkNDYHKBk0nJBWNSllWzoYdiVHavaX9jn1j8yxDr1j0=;
	b=cNmrke2PdSKadbxSYKGuijaGQlMPmLnCcQQGzQB+ttqhR+PSWM+/mYtx+T6GCygbWJAHepuu8oETSQSGlbwJSG4YLR/mmnRfz3eWkC7SkHIIjEk8wnF7KuCZ+6zeMp1VczkVarERQzk/G8Ql0d3vdw5VCD0Gmw1ejkHq3yAxPL0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:0c2b8d22-075d-4ca0-91d2-b8318c1621e6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.11,REQID:0c2b8d22-075d-4ca0-91d2-b8318c1621e6,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:39a5ff1,CLOUDID:be4051e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:2209271056302RBCBEIJ,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 3d351b1f0e2240ba9bef462ec2bff553-20220926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 732444070; Mon, 26 Sep 2022 19:59:00 -0700
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
Subject: [PATCH v3 05/11] remoteproc: mediatek: Add SCP core 1 register definitions
Date: Tue, 27 Sep 2022 10:56:00 +0800
Message-ID: <20220927025606.26673-6-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_195905_451859_38659C51 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

Add MT8195 SCP core 1 related register definitions.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/mtk_common.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index ea6fa1100a00..3778894c96f3 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 #define MT8192_SCP2SPM_IPC_CLR		0x4094
 #define MT8192_GIPC_IN_SET		0x4098
 #define MT8192_HOST_IPC_INT_BIT		BIT(0)
+#define MT8195_CORE1_HOST_IPC_INT_BIT	BIT(4)
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
@@ -56,6 +57,26 @@
 
 #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
 
+#define MT8195_CPU1_SRAM_PD			0x1084
+#define MT8195_SSHUB2APMCU_IPC_SET		0x4088
+#define MT8195_SSHUB2APMCU_IPC_CLR		0x408C
+#define MT8195_CORE1_SW_RSTN_CLR		0x20000
+#define MT8195_CORE1_SW_RSTN_SET		0x20004
+#define MT8195_CORE1_MEM_ATT_PREDEF		0x20008
+#define MT8195_CORE1_WDT_IRQ			0x20030
+#define MT8195_CORE1_WDT_CFG			0x20034
+
+#define MT8195_SEC_CTRL				0x85000
+#define MT8195_CORE_OFFSET_ENABLE_D		BIT(13)
+#define MT8195_CORE_OFFSET_ENABLE_I		BIT(12)
+#define MT8195_L2TCM_OFFSET_RANGE_0_LOW		0x850b0
+#define MT8195_L2TCM_OFFSET_RANGE_0_HIGH	0x850b4
+#define MT8195_L2TCM_OFFSET			0x850d0
+#define SCP_SRAM_REMAP_LOW			0
+#define SCP_SRAM_REMAP_HIGH			1
+#define SCP_SRAM_REMAP_OFFSET			2
+#define SCP_SRAM_REMAP_SIZE			3
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
-- 
2.18.0


