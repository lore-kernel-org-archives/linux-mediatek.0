Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C01CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 06:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHFVnvWHMVw32vv119pn4+hqDCX05amTS2jQOVou4l4=; b=CmiqZCiCUgJWQk79b+tx0+C7rj
	hkoPOtPHxMCENI8z5aJMg0Zc7InwuXVuwW77br9TH/5aP2BaUHdmcfbs5fyspdcj5mipew5CJwm5g
	mTamnAcOm5vrm3Oe+ryk1qYdcGZkSQ35ZwjENlZFDnpyr01Z2YCystsu0lgQKpd07CEaKyeQaCOjz
	cJ9GH4/LAgomTYmQ8VjKKP+cadHf4oPGdANqcN6MYUlHevaPKl4CZQdQJUy3VCp4PV7eje62HzntF
	WO5DkU6CIaWoOa87jKe8F8bNg0zrzG2F3hvdKguM5Hz0QZan3sBvMb43hpriuG8RtKle/OkJ3G7GP
	qI9FLyqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruY0-0000000ELLt-33nG;
	Wed, 03 Apr 2024 06:56:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruXt-0000000ELIP-0enO;
	Wed, 03 Apr 2024 06:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RHFVnvWHMVw32vv119pn4+hqDCX05amTS2jQOVou4l4=; b=DrSOyk9ZbBkigKxUehZlK2qtzZ
	0YOj0idVRzGCTgiqu1rCAzf0dRP5AbDvKQdat1WN8pVGwPD36RAg4JRg86cTYVc3MReIkOxb8WUFi
	Snx8vbUDgS/PLLjSzQ8wGGmejLOwu7OKm8Et88FRtBE+2Ary//a95wP0iCiFDBrUmfOvxTzGVZtGA
	OpF5xyeoBzy/3ehrBqBTnksCaH2DKknhYLq1JSUZpjcC2SuTJ6SX8/IRmoLVlN+Y6rAMavIpe4JD6
	Oi2IYZcH765S3pUnXix+QkA5RFYxcGyTLixA9Vjd/o96hWc5pUxfq5g2h9sXAUsbCyojaPXGSEpZO
	Q0x5a7mA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruXo-000000042ce-1Itv;
	Wed, 03 Apr 2024 06:56:27 +0000
X-UUID: 411b842ef18711eeac1957ae9f99f617-20240402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RHFVnvWHMVw32vv119pn4+hqDCX05amTS2jQOVou4l4=;
	b=Bj1/ZwvDLl15wwzen8i2LaGHC9Q2DfrEpo8RuROAvScYkr9SNVmnhbkEs1wnV64HrptAZvYxfyo5HWAeF4dKjCmATzpcdXeNkLjDk32ynBDVsmgjsMwNq6YAwbGy56jZOAgFCGwdH5RO7jCg14rBhHym4QIWv3bE6SLXMburC8k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:6e46e5ef-999f-414f-b872-3ff7bfda82fb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:7a74c385-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 411b842ef18711eeac1957ae9f99f617-20240402
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 883008680; Tue, 02 Apr 2024 23:56:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 14:56:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 14:56:05 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 6/9] mediatek: cmdq: Add cmdq_pkt_finalize_loop for looping cmd with irq
Date: Wed, 3 Apr 2024 14:56:00 +0800
Message-ID: <20240403065603.21920-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403065603.21920-1-shawn.sung@mediatek.com>
References: <20240403065603.21920-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.455200-8.000000
X-TMASE-MatchedRID: wDTc/wNgEcO6S8yZYvyqCb2xWbKjBfWPuLwbhNl9B5XHowbMGylTaUiO
	7+wNDdeY8AyWk2NFMNbijpjet3oGSAQmkMsZWj5BV6iWWmDPLEBzd7C7BtJobgbYcy9YQl6esKF
	vJaID/xQ8ivFkadaiTfvQCPiy8IEcHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUD7ZoojNaBJiC6o
	XnNJhZjpHDbhc/RhoqmESY40ZJpJbx6S4WQWOz4WjFDIYtzLad5bVS8RMJWvP6RDqvDaot/nfMV
	e9nSfMkSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.455200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 508594217CE15F4A544E0817F2F35A4EAA63289497798D1C52F8FECB233170B92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_075625_407578_7D431721 
X-CRM114-Status: GOOD (  12.95  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add cmdq_pkt_finalize_loop to CMDQ driver.

cmdq_pkt_finalize_loop appends end of command(EOC) instruction and
jump to start of command buffer instruction to make the command
buffer loopable.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 23 +++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 1d79a127f2d3e..676eb62ea82b8 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -565,6 +565,29 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
+int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt)
+{
+	struct cmdq_instruction inst = { {0} };
+	int err;
+
+	/* insert EOC and generate IRQ for each command iteration */
+	inst.op = CMDQ_CODE_EOC;
+	inst.value = CMDQ_EOC_IRQ_EN;
+	err = cmdq_pkt_append_command(pkt, inst);
+	if (err < 0)
+		return err;
+
+	/* JUMP to start of pkt */
+	err = cmdq_pkt_jump(pkt, pkt->pa_base);
+	if (err < 0)
+		return err;
+
+	pkt->loop = true;
+
+	return err;
+}
+EXPORT_SYMBOL(cmdq_pkt_finalize_loop);
+
 int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
 {
 	int err;
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 854b8b3d6fad0..46e4217f1d338 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -371,6 +371,14 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
+/**
+ * cmdq_pkt_finalize_loop() - Append EOC and jump to start command.
+ * @pkt:	the CMDQ packet
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt);
+
 /**
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
-- 
2.18.0


