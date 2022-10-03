Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC71CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SeK8Sk/+yiZcfff3vIcmr/JFhl6MA/TK7AvFrNExFgQ=; b=XyysKb23VOW3czL56FNiLB9TlX
	Ctk+llJWYCJJfB9pBzvSNikrASNTEl3aSP4FoJYb1sFq0SSXmzJxgvbxI1vy4t3q4kgACWOOMSzCi
	EQuFeHf2qsOLTeXzBB2i0vHVN0kxZk0y1TnTgGrkE3+HyHc0fhGUL9kr8Cv/T+JbKlhrYNvGzBN13
	INA4f/Pspotj+ELSI2oH46qy2p+1+yADVuGH/lULWxtEEbvQR1SZaR/SiRAC68euyQl7Z65gA3hyD
	kznPmINqjVWuUWcObG04BraxdLiuKxTFuOVhKRVMciLqe9O5RiCPYzqGwde1LLDoFd4jT7T+/zyEU
	WPBITPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofFZi-004Jb4-Od; Mon, 03 Oct 2022 07:09:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofFZf-004JaD-Q3
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 07:09:13 +0000
X-UUID: aeaafdcb43fb43f89097a2bc21acfd04-20221003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SeK8Sk/+yiZcfff3vIcmr/JFhl6MA/TK7AvFrNExFgQ=;
	b=BG53+uh7uptuDhUZzLaPRcWqRWjcwXBdVEUN1zXRK+TYP+oMSEExWTJ+jK+H03J5Ns9xHm2LrtJwWK4IfPbGl2QOrgoaMvFvbWuiCezETmQQEtVmkd+TRdEcwKiXF3s/eNLiyegiqeO4uoks60rNxijVmdLtGheyH2S2WnS+TdI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a38d8c70-a9c3-45f0-bd9d-7f10dcc10330,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:9374d6a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: aeaafdcb43fb43f89097a2bc21acfd04-20221003
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1940419711; Mon, 03 Oct 2022 00:09:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 3 Oct 2022 15:08:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 3 Oct 2022 15:08:31 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v2 0/2] Fix error handling for MDP3
Date: Mon, 3 Oct 2022 15:08:28 +0800
Message-ID: <20221003070830.23697-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_000911_855930_DF0FCA48 
X-CRM114-Status: UNSURE (   7.69  )
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

Changes since v1:
- Rename goto label in mdp_comp_clock_on() from "err_unwind"
  to "err_revert" to make more readable.

Hi,
This series fixes some error handling in MDP3 in response to the bug report
submitted by Dan Carpenter (Message ID = YxB1E00e8D6P4W2e@kili)

Moudy Ho (2):
  media: platform: mtk-mdp3: fix error handling in mdp_cmdq_send()
  media: platform: mtk-mdp3: fix error handling about components
    clock_on

 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 51 ++++++++++---------
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 24 ++++++---
 2 files changed, 45 insertions(+), 30 deletions(-)

-- 
2.18.0


