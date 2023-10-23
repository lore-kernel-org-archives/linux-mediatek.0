Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDBDCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 04:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xXrJ1JDFPw4gg5dP3Qb/YMU97iTq3amTRcCjyvCBMi4=; b=Izov1IGRss3LI3ZqxzPC3sYOdk
	rqg/G+emmUJb8djRwKR7U+OZUqTPPtjoadR6R0FvuBhqiTKuk0zUH5Y9tYAMpPG1v44wiJQmB+j4v
	fEzjtevDULoBrDZr69iRu1JrRLfpnHVPrAJxSpwDFibrcw3ZnZ7CRIHYP1o08IGY+vs5demxhJ3PU
	8KQVxzuip+ZWCPBD68bLrqL+yte/4/MA2R/D7LiiA9iBbcn6B4vsYI5FmgzEsguw4ypKYCcr8LOrf
	MkgwevF2TVeYId2xQl8rf9CUGfZKcNHFftTWoBgb1cIFzCJiYLAxAwidp+jnF/b+f4QRlEGupQO/h
	1UnWtYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qumhc-006OaK-0X;
	Mon, 23 Oct 2023 04:38:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qumhX-006OYf-2K;
	Mon, 23 Oct 2023 04:38:05 +0000
X-UUID: efd298fe715d11ee86758d4a7c00f3a0-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xXrJ1JDFPw4gg5dP3Qb/YMU97iTq3amTRcCjyvCBMi4=;
	b=ceGP/VOMQwof5chdetsigm2mVaU8Jb6QR099mfIBNSrHuGJ3caRK1B5k7bZNbQymh1Mf6XX1U1LcKVIciQdj9maxkKx2TYKLv5W5R5RP9wO/Zo+nnV6JpJ65jR7P9N6vGV+HBypcJNJyiiLP0VS/mnO2cDlgfddu8zOZowtNCcM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:4d91419d-5237-41ff-a35d-6cd2aedd4832,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:5f78ec9,CLOUDID:577731d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR
	:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: efd298fe715d11ee86758d4a7c00f3a0-20231022
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1826420858; Sun, 22 Oct 2023 21:37:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:37:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:37:53 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson
 Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Subject: [PATCH v2 0/9] Add CMDQ secure driver for SVP
Date: Mon, 23 Oct 2023 12:37:42 +0800
Message-ID: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_213803_774411_6D079A40 
X-CRM114-Status: GOOD (  14.61  )
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

For the Secure Video Path (SVP) feature, inculding the memory stored
secure video content, the registers of display HW pipeline and the
HW configure operations are required to execute in the secure world.

So using a CMDQ secure driver to make all display HW registers
configuration secure DRAM access permision settings execute by GCE
secure thread in the secure world.

We are landing this feature on mt8188 and mt8195 currently.
---
Based on 1 patch:
[1] soc: mediatek: Add register definitions for GCE
- https://patchwork.kernel.org/project/linux-mediatek/patch/20231017064717.21616-2-shawn.sung@mediatek.com/
---
Change in v2:

1. adjust dt-binding SW event define patch before the dt-binding patch using it
2. adjust dt-binding patch for secure cmdq driver
3. remove the redundant patches or merge the patches of modification for the same API

Jason-JH.Lin (9):
  dt-bindings: gce: mt8195: Add CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
  dt-bindings: mailbox: Add property for CMDQ secure driver
  soc: mailbox: Add cmdq_pkt_logic_command to support math operation
  soc: mailbox: Add cmdq_pkt_write_s_reg_value to support write value to
    reg
  soc: mailbox: Add cmdq_pkt_finalize_loop to support looping cmd with
    irq
  mailbox: mediatek: Add CMDQ driver support for mt8188
  mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
  mailbox: mediatek: Add CMDQ secure mailbox driver
  arm64: dts: mediatek: mt8195: Add CMDQ secure driver support for gce0

 .../mailbox/mediatek,gce-mailbox.yaml         |   10 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |    2 +
 drivers/mailbox/Makefile                      |    2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |   61 +-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 1102 +++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            |  202 +++
 drivers/soc/mediatek/mtk-cmdq-helper.c        |   72 ++
 include/dt-bindings/gce/mt8195-gce.h          |    6 +
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   14 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   |  293 +++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  |   83 ++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      |   31 +
 include/linux/soc/mediatek/mtk-cmdq.h         |   60 +
 13 files changed, 1935 insertions(+), 3 deletions(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h

-- 
2.18.0


