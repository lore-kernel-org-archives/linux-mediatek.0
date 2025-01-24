Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4194C02181
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2025 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KpLfynM31yo/shZxF3ZUy2NRwhB39YpYEBEOuQQVK5g=; b=Qf1bspPA7JJy6626n9ll2WEh9/
	CVqGHfgdId+uvYXgd+jNv0LK0cChCTj9gbtTNhpUQZ8Jmr94TUiAjqSlc8X1yD20yTpur8BGmFUJh
	Vkdi0mggUPBH7eZ0zps5M85nhYcMcLcnpep2IFLS5h97CweDK6tZs6fGuj4Wv3KFedE2USe7h8x1p
	SPssDI7GWZ2SWA/Fr9RZs5938Z0ayVKApznNj+o+jcFrkTNJwz778UHh1RH6NXHR2VpsEoHK00cV6
	8fJxZdFm27f6uzRe38xgdV78rfJxQX+v8ii/RFCJUxUBywBW/bnvTcde79/xP1MBzfNqqnVtyK0nz
	NK4immjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbL1D-0000000EtB1-0za5;
	Fri, 24 Jan 2025 14:50:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJvX-0000000EmHa-1sJl;
	Fri, 24 Jan 2025 13:40:52 +0000
X-UUID: cfa7ae7eda5811ef9048ed6ed365623b-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KpLfynM31yo/shZxF3ZUy2NRwhB39YpYEBEOuQQVK5g=;
	b=Q/bERLsfNbu1bhwMI7iCUJQr5/biIEBimb2r3bqVhx73pCqbXC3tBw2ZDdAVaUVxtLxjCH4TjAXJhIfghZZkHqWaE7mZIcXwruDYMzGAmxKgSmfciLrM4U1olcLsqoxx6Fg3aLHOe8sfE8MeA4tHrtKa0f9cbGYXn4rhqNQQtSA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cc03b8cb-3a73-45fd-aa0e-8e9ebfd2cf74,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:5068a53d-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: cfa7ae7eda5811ef9048ed6ed365623b-20250124
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1100366859; Fri, 24 Jan 2025 06:40:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 21:40:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 21:40:41 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH v3 0/2]
Date: Fri, 24 Jan 2025 21:40:12 +0800
Message-ID: <20250124134025.2666-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_054051_490238_A6F461AC 
X-CRM114-Status: UNSURE (   7.33  )
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

Change in v3:
1)Add error handling to prevent memory leaks
2)Move the eint pin assignment action to eint for processing
---
This patch depends on
[v3,2/2] pinctrl: mediatek: add mt8196 driver
[v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

Please also accept this patch together with [1]
to avoid build and dt binding check error.
[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=&submitter=215008&state=&q=v3&archive=&delegate=
---

Hao Chang (2):
  pinctrl: mediatek: update EINT base retrieval method
  pinctrl: mediatek: adapt to multi-base design

 drivers/pinctrl/mediatek/mtk-eint.c           | 38 +++++++++-----
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 50 +++++++++++++------
 2 files changed, 60 insertions(+), 28 deletions(-)

-- 
2.46.0


