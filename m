Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C8EC5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 11:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q5WuaCMJDw1pbZ4ztPZ18MjsiyYlAPImik90vW7Ffm8=; b=O9Cy9KsD7CCcfp9rFNxMAvbXu+
	gcuCApqG3wolTFYiACRB2cpYEmiAMPshYygr7dAV37JyylaL0YI+H7zVuxKJaae9yExdO7wKGSaJK
	vsELaLMW1RylzuEmljkIJGtD9ZSTVXMnus8teAMpVCPEg5HIgjTm3AUVggS7MJJt0o2nLUfYKPhwp
	3QNSyAxcTVh0PGeZmFMV5lEWzGcDyQ1TTZ5FiMtR7B2eA3mjRkYK3ez64QcE8I46GT/UOvWPlfqPL
	Ivvl0hV9meXJZhtR8m3GSq4fxg/fBSavTyRUyBYuMssXAvLowYbrWQdgrSywU27m3k1D52YZ5oDLI
	/lakgLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0oQ-0000000HVGA-29eb;
	Fri, 01 Mar 2024 11:12:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0oN-0000000HVEV-0qLX;
	Fri, 01 Mar 2024 11:12:20 +0000
X-UUID: 8fbb3c30d7bc11eeb5c2bb47f3c01139-20240301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Q5WuaCMJDw1pbZ4ztPZ18MjsiyYlAPImik90vW7Ffm8=;
	b=UrkEDeyYB8C0tXbtAs6ECT+ZyTDSt/I9p6j4HpVXU3mXt7wK9D5/aUO4/HDN0FXvlxMKefC07hzbmlcPiDRnvHeBjx4u6VZnaAb4p7vlFd9JPD7O38bbeSGcbj4DbqLwrRKXXyG82KovOs4f/91cIDRPDz3oqbvYvGrOkiuIuGk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4cbd6c37-490e-41ff-9c34-0832369a2a86,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:7df764ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8fbb3c30d7bc11eeb5c2bb47f3c01139-20240301
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1863867586; Fri, 01 Mar 2024 04:12:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 19:11:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 19:11:39 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH 0/5] Add CMDQ API for upcoming ISP feature
Date: Fri, 1 Mar 2024 19:11:21 +0800
Message-ID: <20240301111126.22035-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_031219_282653_B10638EE 
X-CRM114-Status: UNSURE (   7.75  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

In order to support the upcoming ISP functions, some CMDQ APIs
need to be prepared:
- cmdq_pkt_mem_move(): for memory or register vaule copy
- cmdq_pkt_poll_addr(): extending cmdq_pkt_poll() to support polling
                        address of register 
- cmdq_pkt_acquire_event(): to support MUTEX_LOCK protection between
                            GCE threads
- cmdq_get_event()/cmdq_set_event(): to support ISP driver runtime control
                                     some GCE events.

Jason-JH.Lin (5):
  soc: mediatek: mtk-cmdq: Add specific purpose register definitions for
    GCE
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_mem_move() function
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_poll_addr() function
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_acquire_event() function
  mailbox: mtk-cmdq: Add support runtime get and set GCE event

 drivers/mailbox/mtk-cmdq-mailbox.c       | 37 +++++++++++
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 79 ++++++++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
 include/linux/soc/mediatek/mtk-cmdq.h    | 44 +++++++++++++
 4 files changed, 162 insertions(+)

-- 
2.18.0


