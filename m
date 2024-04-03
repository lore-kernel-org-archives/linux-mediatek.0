Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54356CD1294
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 06:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YThtGDRM6zbty1cpurINdKseOrsyodu8CUsRPn0dnuA=; b=Kq7FiydnZx1/HtWCQ7R+2CMc8A
	edfj3xJSYZmmPwpcqvBXfi4OtckyvnvexOO2QtRBsd3ny3ybQv1+zdpR1vNOHeHKWfAvELYVdYmlb
	KMEzRICv1zLVxf8QUrEIKRc2+sA2TS3fgoZsQEk4jfmo/tDopQM4LcweetimbD36/PvXZhtSwytZx
	ClFw2tOte16lqV3QZxiEPhXu+zKLxrWrXVhi9oPkWgy0jZSQd3mn0l6KDaRk0OFxGNzDJuHVLo+gY
	rxtfWKtPBRs8y9hlVOw6pBlYW6YxK6H8JDpjyUmjrppolp14IssDoBLLipMqskpH7D4gAXdQl6SeB
	1ZFpgwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruYK-0000000ELZM-3j3V;
	Wed, 03 Apr 2024 06:56:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruYF-0000000ELV7-1fSw;
	Wed, 03 Apr 2024 06:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YThtGDRM6zbty1cpurINdKseOrsyodu8CUsRPn0dnuA=; b=Og6dwOFsdThmKzLNRMgYntHdMe
	hvlWgczgjUAPnHq4JLOs1H8XlfwpqC4lnd3LFz4zvhV21W6WN0dJyIcMbdhKVdogQNKelVM1TiEbA
	Ha61mD09RuIicCEB6DU/M0ORO10Gup4b/6pLJYo4NjOogQMNPmHRTFoXGHrZ1j0wwBZi/PiHICe3x
	TiEDrf1owCLNf3GCIdrgf4ZJpLRrE+KKGbqJmsp6p0Vqvv1Pk2NV93NYRaZDjGBVQ2m7EhcfWg9bE
	7SvJp4wBoryWigryubR9LY9lXJHfnw/9oDQkIAgXmY9o4GPWu0OBXjnTKvrtgoBVm/vN4HACtwD1C
	pDEayAEw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruYA-000000042ew-3h5p;
	Wed, 03 Apr 2024 06:56:50 +0000
X-UUID: 51a821bcf18711eeac1957ae9f99f617-20240402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=YThtGDRM6zbty1cpurINdKseOrsyodu8CUsRPn0dnuA=;
	b=O+vF5cVdSGSi3Ty17u4zYwXIOLY20+GAyUBgClk1tpRPOYANSRC9chcFnMSWrDA5tDCPjDQeG0zDXC6svSOvXyLLChO+IvTJ/Nj08GHUHGNNHPB4odvfeOZzNS+KoPMqgJQ6b1LVngO7bhFvv8gOkDeB9yWQsAIk3U8KB1DffwQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:0b806881-038b-4618-bbc6-edd8f671bb7b,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:6f543d0,CLOUDID:ffe6a700-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 51a821bcf18711eeac1957ae9f99f617-20240402
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 246528543; Tue, 02 Apr 2024 23:56:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 14:56:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 14:56:04 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v4 0/9] Add CMDQ secure driver for SVP
Date: Wed, 3 Apr 2024 14:55:54 +0800
Message-ID: <20240403065603.21920-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_075647_460469_2CF0E598 
X-CRM114-Status: GOOD (  16.43  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

For the Secure Video Path (SVP) feature, inculding the memory stored
secure video content, the registers of display HW pipeline and the
HW configure operations are required to execute in the secure world.

So using a CMDQ secure driver to make all display HW registers
configuration secure DRAM access permision settings execute by GCE
secure thread in the secure world.

We are landing this feature on mt8188 and mt8195 currently.
---
Based on 2 series and 1 patch:
[1] Add CMDQ driver support for mt8188
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=810382
[2] Add mediatek,gce-events definition to mediatek,gce-mailbox bindings
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=810938
[3] soc: mediatek: Add register definitions for GCE
- https://patchwork.kernel.org/project/linux-mediatek/patch/20231017064717.21616-2-shawn.sung@mediatek.com/
---

Changes in v4:
1. Rebase on mediatek-drm-next(278640d4d74cd) and fix the conflicts
2. This series is based on 20240307013458.23550-1-jason-jh.lin@mediatek.com

Changes in v3:
1. separate mt8188 driver porting patches to another series
2. separate adding 'mediatek,gce-events' event prop to another series
3. sepatate mailbox helper and controller driver modification to a
   single patch for adding looping thread
4. add kerneldoc for secure mailbox related definition
5. add moving reuseable definition patch before adding secure mailbox
   driver patch
6. adjust redundant logic in mtk-cmdq-sec-mailbox

Changes in v2:
1. adjust dt-binding SW event define patch before the dt-binding patch using it
2. adjust dt-binding patch for secure cmdq driver
3. remove the redundant patches or merge the patches of modification for the same API

Jason-JH.Lin (9):
  dt-bindings: gce: mt8195: Add CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
  dt-bindings: mailbox: Add mboxes property for CMDQ secure driver
  soc: mediatek: cmdq: Add cmdq_pkt_logic_command to support math
    operation
  soc: mediatek: cmdq: Add cmdq_pkt_write_s_reg_value to support write
    value to reg
  mailbox: mtk-cmdq: Support GCE loop packets in interrupt handler
  mediatek: cmdq: Add cmdq_pkt_finalize_loop for looping cmd with irq
  mailbox: mediatek: Move reuseable definition to header for secure
    driver
  mailbox: mediatek: Add CMDQ secure mailbox driver
  mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver

 .../mailbox/mediatek,gce-mailbox.yaml         |    3 +
 drivers/mailbox/Makefile                      |    2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |   79 +-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 1091 +++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            |  165 +++
 drivers/soc/mediatek/mtk-cmdq-helper.c        |   72 ++
 include/dt-bindings/gce/mt8195-gce.h          |    6 +
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   36 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   |  385 ++++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  |  158 +++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      |  105 ++
 include/linux/soc/mediatek/mtk-cmdq.h         |   61 +
 12 files changed, 2132 insertions(+), 31 deletions(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h

--
2.18.0


