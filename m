Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1966D24467
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 02:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CTx2RnJfJO7puldyYO2urzSFdiG6+1YvJReMvVimZC8=; b=P9P36B9JxuR6rpEB0Fy/PEnndw
	6byJbbAppIbpspU7uk6fXrF/aVstHZI583RkaHMxq4YGJQCI/eziGVCfOyO6eIS4+gLJRnfzMI+r1
	pZyjG8lSWzqPUjnzpjS5zs93MAAKTe+EQwkAUS3MQoYckaQN6Cx0M+P10goQN708Jc1Q6DT1Og9cJ
	hZ84MD/FToO+LdUmSlhksKestIXCH5U73W0vVKZSKebAhRPknJkheIIoaTri6YFed6FBAJkkZ6C6s
	6OCTWHvC7y4CMQAa8s+ld32CCU/bo4uA879JGcWxRx0Cp6bHUd31ku4HhIJUm+bXW2kEFJKfaX6Dz
	T5Dwn/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5iQ-0000000F5I2-24hW;
	Fri, 11 Oct 2024 02:49:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5iN-0000000F5Hc-1a5L;
	Fri, 11 Oct 2024 02:49:16 +0000
X-UUID: 65205be4877b11efba0aef63c0775dbf-20241010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CTx2RnJfJO7puldyYO2urzSFdiG6+1YvJReMvVimZC8=;
	b=ck1pptDqy+BrYlwcBM/mI6gJL+dg+SXsjGI8PMLwfTKJEgJFxT5drnjUHeLP3N6Thko+EvIgSsLkjm4TEfoY4V/Ihthus2TCcBZfnpLKleI62Zli8OdFnkfiTJihELVmfjiz7Hf2YQ4XQjhRQWqobOGLzVqWWqZ7ZCOvZ/sJHBc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a238b10f-ffc3-4678-b651-4534ead9d269,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:b0dc1341-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 65205be4877b11efba0aef63c0775dbf-20241010
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 242309034; Thu, 10 Oct 2024 19:49:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 10:49:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 10:49:08 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v4 0/3] Add mtk-sd support for MT8196
Date: Fri, 11 Oct 2024 10:48:33 +0800
Message-ID: <20241011024906.8173-1-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_194915_448818_5AE38F47 
X-CRM114-Status: GOOD (  13.16  )
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

There are some new features for Mediatek SoC MT8196, which include new
command/data transmitting and receiving path (abbreviated as tx/rx), and
two modified register settings.

The driver code has to be adapted to implement the above changes, and the
compatible string 'mediatek,mt8196-mmc' is added to driver and devicetree
bindings.

---
Changes in v4:
- Reorder the first two commits, and update the commit message to explain
  why the settings of stop_dly_sel and pop_en_cnt are variant.

Changes in v3:
- Separate the settings for stop_dly_sel and pop_en_cnt to a different
  commit; 
- Add the original value of stop_dly_sel to the platdata of legacy SoCs,
  for unified code setting;
- Change to return if host->top_base is NULL in msdc_new_tx_setting function,
  to simplify coding;
- Optimize the location of assignment for 'timing_changed' in msdc_set_mclk
  function.

Changes in v2:
- Use compatible string 'mediatek,mt8196-mmc' to replace 'mediatek,msdc-v2';
- Remove the 'mediatek,stop-dly-sel', 'mediatek,pop-en-cnt' and 'mediatek,
  prohibit-gate-cg' in devicetree bindings, due to SoC dependent;
- Add 'stop_dly_sel' and 'pop_en_cnt' to the compatiblity structure for
  different register settings;
- The SoC's upgraded version would discard the bus design that detect source
  clock CG when the CPU access the IP registers, so drop the related control
  flow with 'prohibit_gate_cg' flag.

Link to v1:
https://patchwork.kernel.org/patch/13812924

---
Andy-ld Lu (3):
  mmc: mtk-sd: Add stop_dly_sel and pop_en_cnt to platform data
  mmc: mtk-sd: Add support for MT8196
  dt-bindings: mmc: mtk-sd: Add support for MT8196

 .../devicetree/bindings/mmc/mtk-sd.yaml       |   2 +
 drivers/mmc/host/mtk-sd.c                     | 166 +++++++++++++++---
 2 files changed, 147 insertions(+), 21 deletions(-)

-- 
2.46.0


