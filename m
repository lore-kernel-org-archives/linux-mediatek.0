Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16602C4167D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ae3NgNwi5jbYlghW361nXVBAg4ZT3Zsh9YIiZ0bSJr8=; b=hoCxgmTHAM7LvESxfCED9H8g5J
	Uwjy+YN9Vr7hCfyzwMCxST8iXZzm4nCY3na8TF+FvxW8GHr1aFTQvpxAffvtNQ2fQDScDg2+yHhTJ
	pgU4pnH8KTNFh0xriuzaZRQ33Cpg0q/cTz9Y0T1g6ih24DLMe63L9Fh+3O+FyZvhX/t0qEryxfN+6
	Jmunv74DOPi8Zuqp3Sfbd5s6WonzdimJqUKg5LW3R9vyAXxku1K7f1HuNJt8a6UwkvhShKe14t6cY
	CsKoDBclfEGqXZ6vE9JmdxeDmFhEdXq/DsV4pSbLTxHGlvUCsoJnF9uDZphdLrCyinxYOH2itSmBg
	ClFhiCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GLd-007aeh-0J;
	Fri, 10 Nov 2023 01:30:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GLZ-007aci-15;
	Fri, 10 Nov 2023 01:30:10 +0000
X-UUID: a9e100747f6811ee86758d4a7c00f3a0-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ae3NgNwi5jbYlghW361nXVBAg4ZT3Zsh9YIiZ0bSJr8=;
	b=JB0W8ZVoFu1JlA1tLm4Ep5Yc233T3vuCHAKJoLkNg+yuxvhlwHS0sVhE6O4bk1D+Vr+MwpawPWo1eh11kdBA6o1NAbA+gEDY2UDxXvybBXws2cDYSAVm/hxXzLEVRS5UILQnhfZhUSpkR1McNzEPfFuGhC0NeVYxd4aKfYp0kxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:0ff1ecfe-8df2-4195-9517-0587f7633857,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:96717b72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a9e100747f6811ee86758d4a7c00f3a0-20231109
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <stuart.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 253057317; Thu, 09 Nov 2023 18:29:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Nov 2023 09:29:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Nov 2023 09:29:24 +0800
From: Stuart Lee <stuart.lee@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Stuart Lee <stuart.lee@mediatek.com>,
	Lancelot Wu <lancelot.wu@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH 0/1] Fix access violation in mtk_drm_crtc_dma_dev_get
Date: Fri, 10 Nov 2023 09:29:13 +0800
Message-ID: <20231110012914.14884-1-stuart.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_173009_373921_CF448F37 
X-CRM114-Status: UNSURE (   8.96  )
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

Add error handling to check NULL input in
mtk_drm_crtc_dma_dev_get function.

While display path is not configured correctly, none of crtc is
established. So the caller of mtk_drm_crtc_dma_dev_get may pass
input parameter *crtc as NULL, Which may cause coredump when
we try to get the container of NULL pointer.

Stuart Lee (1):
  drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.18.0


