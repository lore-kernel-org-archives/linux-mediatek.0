Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D09CD13DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/UOv9xZiXKefNR6q5rMt8+g3tJ4eyURnjoxNDdrYYPY=; b=jTzGz2DzyQNcXQRHA/ZQlzrXC+
	bX26ET+DxxSW1iuX/y0btBMulsX5K3Hl/ARFycp0AKsViSJT/TWzCKaW0oAX6x5sVHihcidvy+70z
	zwisPidQ8O5EI4dbMmZstvpsoR+CEJJ5EQfIkdIE0rvsfk3UISyqjBOwia3+GTmqfIodIImWewYck
	5Wt2miAO7FTD9HrdiwA8k/UAhtFYhwZtASW/FOXBVsLphWgcGPsSeVQvgUuwLvG+FTEJJ9wuMyN+D
	uP+zpJUXU8LqgjgSysZUoFOX5tTsbfV9W5sjPjcXPFdJ4aahiuDVVybkQ/bFBL5a0pcHSqCynH3Ww
	gqqDYbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJpB-00GAOI-0G;
	Mon, 18 Sep 2023 19:22:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJp2-00GAFv-2l;
	Mon, 18 Sep 2023 19:22:19 +0000
X-UUID: a9ba9436565811ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/UOv9xZiXKefNR6q5rMt8+g3tJ4eyURnjoxNDdrYYPY=;
	b=qclhOeUWvzH1H0Egt7GLgJAyJrbI9L848aDHO5gSdrT6YkL2RHFiF9pRR98ni5ye6sU5yyKNjX93lEOEPLwpEIowgDdc6KUZ4s5eeT/IUZjfn1lpGrt2sCZThzNY6HACvJqptDj3VWfe1PYD3A2gFNU3XVkqdu/PciIUorn+uCg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:263f6a7c-2a85-48f6-b6d9-9db81083f912,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:d00b1514-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR
	:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a9ba9436565811ee9b7791016c24628a-20230918
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1188439896; Mon, 18 Sep 2023 12:22:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Elvis Wang" <Elvis.Wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 00/15] Add CMDQ secure driver for SVP
Date: Tue, 19 Sep 2023 03:21:49 +0800
Message-ID: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.467400-8.000000
X-TMASE-MatchedRID: 7eVHqPQV5C/JmaR8yBHGWNRZ1mKTfKthE21NSmBqEKfOxDyJFXIPjjFa
	TRf5dTetwavfQ6gcAlY7b3Js3F6vVGymsXpN1zOArDFtme53Kvsuhg66Itb65XyKcwQTdriqZSg
	PkksZfMCRWd5j2pelskrNzRlf/eAmxHJTZUnf9cgD2WXLXdz+AX9oOiiWbcZdRi9INZ1ZpGEwrA
	JnuG4aIS/rjK1CMnpugDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyMMz1R7/AueTvlEkaSw9lGL93v
	k9lpGptRcLjcbUyXX7JxRwU0I1U81K2ZEtDP2FLo548hMsDjb15pPWcZ/qZbFb8T69FNrV2jofs
	MjQaxVwyYjbiqIQ3CsykhtyXcigD6rVdgBjDT2oh1j2M6LiVMg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.467400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8B037BF6E71F03E6BA839CFECE3F62CBC7C30FEDB63D7993BBFEE9AEF3E9DB932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_122216_900003_3F507B68 
X-CRM114-Status: GOOD (  10.87  )
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

Jason-JH.Lin (15):
  dt-bindings: mailbox: Add property for CMDQ secure driver
  dt-bindings: gce: mt8195: Add CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
  soc: mailbox: Add SPR definition for GCE
  soc: mailbox: Add cmdq_pkt_logic_command to support math operation
  mailbox: mediatek: Add cmdq_pkt_write_s_reg_value to CMDQ driver
  mailbox: mediatek: Add cmdq_mbox_stop to disable GCE thread
  mailbox: mediatek: Add loop pkt flag and irq handling for loop command
  soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ driver
  mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
  mailbox: mediatek: Add CMDQ secure mailbox driver
  soc: mediatek: Add cmdq_insert_backup_cookie before EOC for secure pkt
  mailbox: mediatek: Add CMDQ driver support for mt8188
  mailbox: mediatek: Add mt8188 support for CMDQ secure driver
  mailbox: mediatek: Add mt8195 support for CMDQ secure driver
  arm64: dts: mediatek: mt8195: Add CMDQ secure driver support for gce0

 .../mailbox/mediatek,gce-mailbox.yaml         |   30 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |    2 +
 drivers/mailbox/Makefile                      |    2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |   67 +-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 1103 +++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            |  202 +++
 drivers/soc/mediatek/mtk-cmdq-helper.c        |   81 ++
 include/dt-bindings/gce/mt8195-gce.h          |    6 +
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   15 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   |  293 +++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  |   83 ++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      |   31 +
 include/linux/soc/mediatek/mtk-cmdq.h         |   65 +
 13 files changed, 1971 insertions(+), 9 deletions(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h

-- 
2.18.0


