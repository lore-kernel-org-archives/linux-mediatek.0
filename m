Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA700C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 04:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VhJt4H7m25HdTeiGoiaZmPXbeNUjQW89pMMXO+LSutM=; b=CJ4njTu7vqcFiRTWYhL9gLkh5D
	inNpAHbKhX0gOKfAZ6S9U7RaQbRYjkh7K65/uwtDCt9SLfNVGJoWVXC4R9h0nEFgvifb0FqBXpZnk
	bfvZUlnfeWiCGd9sWymsT6otop4YVQbW2V4bjkozdaoJP5Z2l6IH0BjrC4/WRosVTxVZe0m1yqxXh
	nSLZ8xlt1aJKKoovpNj2q42LWxLx0703Fsh2p/HT0gCcUevp9Je9z+uJMUD+j+wntsmWOG5fBnFIq
	WsEwURHIOgYtrIDkcTp0TgkQhK/LXjK8IBsON9RqCcvrX7fXxjokA9S4NiZLfw4M707qrs0D2dwo9
	9NjGgSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHy8m-00000001LWK-29G8;
	Fri, 14 Jun 2024 04:02:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHy8j-00000001LUr-1BDE;
	Fri, 14 Jun 2024 04:02:14 +0000
X-UUID: df4174842a0211efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VhJt4H7m25HdTeiGoiaZmPXbeNUjQW89pMMXO+LSutM=;
	b=FzFJHs2fbME1+B98DQ+nHHha/My7zd6irMgF5fj0nojQUpvd9IjtMAl0AlId76lkEe+nTYeu0xorvZDBwzKPIOw3IaLsvmWnCVth+Odo2aJfcgJyf1eXUTEmWxaDAeRNH5UVRkZppwn4tsqRx6M8wNDaVKR6IgPE9dL0aWYiECM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:152c6e1c-11b0-40ed-bdaf-9baf5892600a,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:393d96e,CLOUDID:4fbaf993-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: df4174842a0211efaf04eb0598667787-20240613
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1347129484; Thu, 13 Jun 2024 21:02:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 21:01:34 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 12:01:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/2] Fix sleeping function called from invalid context
Date: Fri, 14 Jun 2024 12:01:31 +0800
Message-ID: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_210213_389560_70D0C57D 
X-CRM114-Status: UNSURE (   8.70  )
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

We found that there is a spin_lock_irqsave protection in msg_submit()
of mailbox.c and it is in the atomic context.
So when the mailbox controller driver calls pm_runtime_get_sync() in
mbox_chan_ops->send_data(), it will get this BUG report.
"BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164"

Add API to mbox_chan_ops to make mailbox takes into account that a driver
may need PM done.

Jason-JH.Lin (2):
  mailbox: Add power_get/power_put API to mbox_chan_ops
  mailbox: mtk-cmdq: Move pm_runimte_get and put to mbox_chan_ops API

 drivers/mailbox/mailbox.c          | 55 ++++++++++++++++++++++++++++++
 drivers/mailbox/mtk-cmdq-mailbox.c | 37 ++++++++++----------
 include/linux/mailbox_controller.h | 11 ++++++
 3 files changed, 84 insertions(+), 19 deletions(-)

-- 
2.18.0


