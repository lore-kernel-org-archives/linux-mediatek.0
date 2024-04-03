Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE7DCD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=urbzCOgzD7/Hupt+Y7xPp6Zzq0kIUnTELc1uefBAO6o=; b=UdzuAFAMG4sCLplArJa2JF9ETH
	BVp0w2TTRlZ7sOLEIZQmT2wqtx9QIBEmukRhnbcwGtR80sZzbXzDtt3inEVaGchDf4KKVmP2fA0U/
	8PdXqwEFNxrenVGak31dZl7vfZLy7f9yTv9RYvo5O8reWxbFYr1uTECHlGMcFTMekf/QczV+dBT7N
	gT/DbPn6EGhnrSBvkSlISUw3BH9Vjdjdsq2cDMRrxxf6Nr05/KTNWVYPshJzKmrd+TDNggGoQ0RwW
	4BrxRdqe1Tss0mnsf0ollotdFYyq7wskpjSEvKNDh0J6yDqhbZZH/bUF/7LPV2zzwcZaRIXgtDsps
	qRir33nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpz-0000000FUbW-38ni;
	Wed, 03 Apr 2024 10:27:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpX-0000000FUGV-1jwp;
	Wed, 03 Apr 2024 10:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=urbzCOgzD7/Hupt+Y7xPp6Zzq0kIUnTELc1uefBAO6o=; b=j/74aOKFFnb3opUrsr8Tzjg0Dl
	gzii8KWLyvnOK1sqDbxtJuZguQ54E2+elwUhy3wUiY1LrsCcOQi5T4qVbc6ceKewM1dHyRy6BaXZh
	NQa07O+6HzWdT8UVdCA6L//sYRQv5vr5jMYNA0P08EST2UMqYZPEWURkOb02supw7E7mzDbGZWohc
	Tt4HoC56j83CkzdD+enBsxO7Kb8YkPwrOwHJvCoPSploiJ6z06Zf9gSil0XFd7AeqPnpniIp6+/KR
	v4ckRuLEXUR6eWZqUmpT2gs2vW9o7vut45zmyC990ZR/5DZ5nMhgoSVeDzP8Y0KL59Sl6dzAy9LzT
	qxfXyWGg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpT-00000005Lf0-23hi;
	Wed, 03 Apr 2024 10:26:54 +0000
X-UUID: a758ce46f1a411ee96d5dfc950b7243d-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=urbzCOgzD7/Hupt+Y7xPp6Zzq0kIUnTELc1uefBAO6o=;
	b=CTY2Zn8TfufIcYixJpgorfkHwyNJqj8L4uYh+yMbh9INQqhauw3konedBv9r47q7OHc74SDVxgYbY/7oCKhGXBvtbFctbmqJKtRPrrXIROqFjiI/gMIL3jcr1vyb62b09LMswPOV35egw2uuX9tfMt9rPWMVHSKusHU7g6nebfo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:feaafd86-f189-4792-ac35-406749d8e92e,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:6f543d0,CLOUDID:c69c2c91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a758ce46f1a411ee96d5dfc950b7243d-20240403
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1736827700; Wed, 03 Apr 2024 03:26:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:26:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:26:03 +0800
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
Subject: [PATCH v5 00/10] Add CMDQ secure driver for SVP
Date: Wed, 3 Apr 2024 18:25:52 +0800
Message-ID: <20240403102602.32155-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.399900-8.000000
X-TMASE-MatchedRID: 2KXNH9TWyB78rQJMqxBG8AI0yP/uoH+DKaRmDCmXszd2Cr1D6VVk8n4z
	9jl2IgzvD96xyDWv66V3DwGxIMXYVCoLG8HLfjNfXP5rFAucBUH4qCLIu0mtIGHZ+cd7VyKX4nz
	kw7itaMhZk01J3c7PAfGwWOiK+CFhvoOwdMywpfOxo9yzdPhMvUGtrAxy5ENORL9uhZIYy13fSg
	MQRUDlML1GkWouMMWsk7Vb6h17QQQ/eX/eRWk3Rd35+5/2Rxqm/8CuA+b/YYSlc5zJswSBz+b1a
	n+ANQl/kPk8oBU71SxEzxsFM1euZqo77AcuQhw7ngIgpj8eDcCbifj2/J/1cQ1fU1q220JrKrau
	Xd3MZDUb7Ul726xKAi05CVh5cvg3CMBT2WXOoJOFCmvAAvRrvyf6qUzae34r
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.399900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F9D346B31598FBEA755AAE21659235500CF499B8D32E44FB9AA7F30D098187632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_112651_863708_9AE90C2F 
X-CRM114-Status: GOOD (  14.38  )
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

Changes in v5:
1. Sync the local changes

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

CK Hu (1):
  drm/mediatek: Add interface to allocate MediaTek GEM buffer.

Jason-JH.Lin (9):
  dt-bindings: gce: mt8195: Add CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
  dt-bindings: mailbox: Add mboxes property for CMDQ secure driver
  soc: mediatek: cmdq: Add cmdq_pkt_logic_command to support math
    operation
  soc: mediatek: cmdq: Add cmdq_pkt_write_s_reg_value to support write
    value to reg
  mailbox: mtk-cmdq: Support GCE loop packets in interrupt handler
  soc: mediatek: cmdq: Add cmdq_pkt_finalize_loop for looping cmd with
    irq
  mailbox: mediatek: Move reuseable definition to header for secure
    driver
  mailbox: mediatek: Add CMDQ secure mailbox driver
  mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver

 .../mailbox/mediatek,gce-mailbox.yaml         |   10 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   16 +-
 drivers/gpu/drm/mediatek/mtk_gem.c            |   40 +
 drivers/gpu/drm/mediatek/mtk_gem.h            |   11 +
 drivers/mailbox/Makefile                      |    2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |  108 +-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 1045 +++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            |  165 +++
 drivers/soc/mediatek/mtk-cmdq-helper.c        |   75 ++
 include/dt-bindings/gce/mt8195-gce.h          |    6 +
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   37 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   |  385 ++++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  |  159 +++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      |  105 ++
 include/linux/soc/mediatek/mtk-cmdq.h         |   61 +
 include/uapi/drm/mediatek_drm.h               |   64 +
 16 files changed, 2257 insertions(+), 32 deletions(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h
 create mode 100644 include/uapi/drm/mediatek_drm.h

--
2.18.0


