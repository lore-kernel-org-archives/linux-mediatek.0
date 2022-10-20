Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECAAC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k3wALfF9tSu/uQt3PB2kfmMFgLVgF9FHrguRjLAl7tE=; b=bsfeCLXJrnhyUSTYtHGPczfZMc
	atlTx97NB3b3Ze8/HvtgMD0fXMLIvLDe9rPjIjBuQNp+uHilQPwQNX5O7+FYuRLs4wgbzCax4dicq
	Xp13OUvhvIiRpzGQ1w8k3YRih2BPNQGQPpPlxBWo8G+POjewbtYMU5sTuCnm8x1J9R9IH0rUbLPi2
	1rgtMqDVBmf0ammvYYbIxCzt4B/uA0dPL2CzKQpZfIIIZzRlGtSxeCGlEE/wTUE9Q8Z08WJ+0DbDY
	Hv0hSEfL0iCzHrWhZ0AA89LsePyqKVvT1Wb15HCuMqrsyJ7tYUniv+P8chdP+mhLtfmuknYfu5H7u
	7jaUnPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPpL-00BaTh-0w; Thu, 20 Oct 2022 07:18:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPpD-00BaQu-DF
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 07:18:46 +0000
X-UUID: 4c3edce870ae4289a977d6ffce771cac-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k3wALfF9tSu/uQt3PB2kfmMFgLVgF9FHrguRjLAl7tE=;
	b=PN3JbO9TEs//MXcwtV9FqXF3SMT4WPkUuLg1gKf42gQPPMnLXKJBbcV1G9bHvda1kGQOQfYuEqire5GvncplIiy2sMidd7ebj8Y7QYM9+S4ZG2Al18M8elVF4gMcl8I3QX8jJeCy0ymmopFPvY5sD9DXozHOSXo7LUtDPosnUSQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:d26ff187-c8fd-432a-b9b6-78a0b32fc6df,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.12,REQID:d26ff187-c8fd-432a-b9b6-78a0b32fc6df,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:62cd327,CLOUDID:4a54e0ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:22102015183941PC9QVB,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4c3edce870ae4289a977d6ffce771cac-20221020
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 808180910; Thu, 20 Oct 2022 00:18:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 20 Oct 2022 15:18:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 15:18:01 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 0/3] Fix error handling for MDP3
Date: Thu, 20 Oct 2022 15:17:57 +0800
Message-ID: <20221020071800.20487-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_001843_512084_28D9C168 
X-CRM114-Status: UNSURE (   8.88  )
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

Changes since v2:
- Rebase on v6.1-rc1.
- Merge with the following series:
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=683526

Changes since v1:
- Rename goto label in mdp_comp_clock_on() from "err_unwind"
  to "err_revert" to make more readable.

Hi,
This series fixes some error handling in MDP3 in response to the bug report
submitted by Dan Carpenter (Message ID = YxB1E00e8D6P4W2e@kili)

Moudy Ho (3):
  media: platform: mtk-mdp3: fix error handling in mdp_cmdq_send()
  media: platform: mtk-mdp3: fix error handling about components
    clock_on
  media: platform: mtk-mdp3: fix error handling in mdp_probe()

 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 51 ++++++++++---------
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 24 ++++++---
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 15 +++---
 3 files changed, 53 insertions(+), 37 deletions(-)

-- 
2.18.0


