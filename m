Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5416C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMROI+KyTxkRwOY6Y2Mkyb4j/NIBOwy1O3mAhVSp7Zc=; b=jDW9oVqqtYuqJKmwj84CiPYMLg
	WcrpFz4J1jLoJf+XR/c7LlzerY5fa+xqRvApoRaGh/MdMNcS+oTof37j7ob7kaHkM0pC//xb/t0xJ
	vzc1CoeC9Ju/vEg/E85YDddjc54tKs2HmXHo6eDgEuF88leJNpe9J+CXOszdYQ/EQK14MD3LkwdTk
	qL1mtm7W0VSFPkd2TMqm2O31LWBV8ahO8tqr1JH7IwfIIHhjrivukAdtMDJxHHfS77I2bqvlY7JXP
	bri6h+Mz0+gVQSJ+n22sDb8tRWPeikz3S+aDa/0gG7nSVe+da8Vtg4ic+f9OXQD7IrA7k8zNZld2B
	sSnBexZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9qR-00EryI-2O;
	Mon, 18 Sep 2023 08:43:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9qD-00EroU-2v;
	Mon, 18 Sep 2023 08:42:51 +0000
X-UUID: 561c660055ff11ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hMROI+KyTxkRwOY6Y2Mkyb4j/NIBOwy1O3mAhVSp7Zc=;
	b=FwyynsLVp4BC86n4vzIrnTq2E8QhjLo8X4+w/4n0teEKg+0IPrGza5AqQa3e9zmien6nn4qoM1JmiXVnWrdPBvbssAsqaXaSw6fr08x7WYHdx5H3VfBbK7JGISZRT12wDnO3JwyluHYK1lrkaxB3e1XU75yTL/oFUZn2iUmX/qU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:1b004f35-08f9-4f07-846d-befcf69597f1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:f594f6be-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 561c660055ff11ee86758d4a7c00f3a0-20230918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 256433708; Mon, 18 Sep 2023 01:42:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 16:42:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 16:42:10 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Chen-Yu Tsai <wenst@chromium.org>,
	CK Hu <ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>
Subject: [PATCH v2 02/11] soc: mediatek: Support GCE jump to absolute
Date: Mon, 18 Sep 2023 16:41:58 +0800
Message-ID: <20230918084207.23604-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918084207.23604-1-shawn.sung@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.545900-8.000000
X-TMASE-MatchedRID: wDTc/wNgEcMLazoQyrpm0huZoNKc6pl+X4GSJGyYc35GL0g1nVmkYXB4
	4IkzjfYywLMNNIlHL0L9Id3tL+hFwoS2KcusOPFAoMfp2vHck9XzWEMQjooUzaVznMmzBIHPsKF
	vJaID/xQ8ivFkadaiTfvQCPiy8IEcHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUMTh4vIBXfjEjwV
	wu7UGckDtnB9jUmlXAF8gvGd3ATIXcs08IJF1Ww1GPJeBexK4PXDRlFVZzjO/EDk7r56pdm/luA
	qyqxuxoSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.545900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0FA05998AD91C59151682AED4596AD464A18BD4B332223096FD5D3E87DD8428E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_014249_949214_CC664629 
X-CRM114-Status: GOOD (  10.94  )
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

Add a new API to jump to the head of cmdq packet by
appending a jump command at the end of it.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 16 ++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b0cd071c4719..e029ce231df1 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -441,4 +441,20 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_flush_async);
 
+int cmdq_pkt_jump_absolute(struct cmdq_pkt *pkt)
+{
+	struct cmdq_instruction inst = { 0 };
+	u8 shift_pa;
+
+	shift_pa = cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
+
+	/* jump to head of the packet */
+	inst.op = CMDQ_CODE_JUMP;
+	inst.offset = CMDQ_JUMP_RELATIVE;
+	inst.value = pkt->pa_base >> shift_pa;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_jump_absolute);
+
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index a253c001c861..106988cc5f01 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -276,6 +276,8 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
+int cmdq_pkt_jump_absolute(struct cmdq_pkt *pkt);
+
 /**
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
-- 
2.18.0


