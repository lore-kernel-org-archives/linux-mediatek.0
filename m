Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DAyYhCQx/OMHMNkdxNhY+60RJe+vnZJswgdOhohQOOk=; b=aBYtUEoCfBXOMkKOkTUnK96sTA
	skSeMS1jif8b264Ins4DK/Z09qMEkwh74Tsb9N5J54QQUfLuWt9eMsnWZvPAv61l3ZfUgKpQ20Bmd
	2ocKVl3xlk8WwJDwz06sb8GfSs5Wg3g4/LeZT1XRLIAMpRe7A97XPZ+V9Vwa+qTXWwzZxoZSAf51j
	J0RdOI2gHI/TAYjO5c35YV0HL+51wTcKHN4O5zlZJrz1dbSe7TXu3W8gRJyDMH0kv+uiBFFoZaWmk
	iHZ2GMSuuBZOTkAe3SZtQv8bFTImFk303cW7KJfE6B+40RH8Ryb/vomSoSXJWQOEMG5nJRy9eoc0E
	jj13hCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohrnO-000ona-SE; Mon, 10 Oct 2022 12:22:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohrnM-000omt-Nr; Mon, 10 Oct 2022 12:22:10 +0000
X-UUID: 02204839ad0c4ffab8e0bd54d5a31ce1-20221010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DAyYhCQx/OMHMNkdxNhY+60RJe+vnZJswgdOhohQOOk=;
	b=dIbMuRd8EN8I7NSc7PVq3Z2U9PBifbzYEhI7mkWMwHbm9Nz9EySZhKeToLpgpX3tzbrRUpPyOyJBCzbIaXGMCVJix0CRIhK0dw++CdOsjKaPTaPJ5cXqX60s/p+L6toQAzgCqNbDo6oUI+iE1S7z8v+rNQBQvuo0dyrv5oXrdVU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f7523cd4-9e6d-4d55-858a-1dd346c02b3e,IP:0,U
	RL:0,TC:0,Content:76,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:76
X-CID-META: VersionHash:39a5ff1,CLOUDID:73386ee1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 02204839ad0c4ffab8e0bd54d5a31ce1-20221010
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 587388490; Mon, 10 Oct 2022 05:22:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 10 Oct 2022 19:31:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 10 Oct 2022 19:31:59 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v10, 0/4] mailbox: mtk-cmdq: add MT8186 support
Date: Mon, 10 Oct 2022 16:50:19 +0800
Message-ID: <20221010085023.7621-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_052208_816988_74A679DE 
X-CRM114-Status: UNSURE (   6.54  )
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

base linux-next/master

change since v9:
1. improve register GCE_GCTL_VALUE write method reviewd in v9

Yongqiang Niu (4):
  mailbox: mtk-cmdq: Use GCE_CTRL_BY_SW definition instead of number
  mailbox: mtk-cmdq: add gce software ddr enable private data
  mailbox: mtk-cmdq: add gce ddr enable support flow
  mailbox: mtk-cmdq: add MT8186 support

 drivers/mailbox/mtk-cmdq-mailbox.c | 45 +++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

-- 
2.25.1


