Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DFAC5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 02:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/4b6Fa5B/5D8CIvq27+rD7xKd5V7SopVAeiyzUdv4zA=; b=rii
	tm3P6nPXwZFsiyv95ElqpvWbReTWy1nXpamP9x0oLHo9Za/YWTLvLxM4pExNDoY6K7Wr+yjuCHXpE
	YCe3g9GiDdksvgmKKDf6oAo91Iqf2LFr4WP9mqfro4Gv1oCmWhiM1vXe7Suf1Cma79NCfwtvITMhB
	P8TE6fgmXxAn5ilR1eH96La7FN0tYgQvRaZ6MkkUd1d2MmPDaGiNspxF0+bAYIgHpyoRcRgq7VXaP
	Sfg6kuWNJzN2/ONt8bSZWs+U4emakt0VaZa0fV2Hl3/h97jsK+AFX7JJQslXYgQILSR2jwGIzzUBu
	2UpFdAeCemD9VSd616R9Gu0o2sLo4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWHT-0000000BlVO-2hv7;
	Thu, 29 Feb 2024 02:36:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWHF-0000000BlMN-0041;
	Thu, 29 Feb 2024 02:36:06 +0000
X-UUID: 473b45ded6ab11ee999fed2339b27864-20240228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/4b6Fa5B/5D8CIvq27+rD7xKd5V7SopVAeiyzUdv4zA=;
	b=WxLEzrzoBa6XiFC/6TkHMhSLEefUOVJBibjx4G1E4q8Kk0NTk3Zm6ik82T1Qkb2QFPDy6Yp6JiNkL5j/6UciW4iPIjTJDYKTine7bQuyuo8+0Ad177SE2ew3AoV2ZupGPw+Vx7yyK191+FJeIsD54EwUl/LjR0Gf0UkgsBItXKc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ec000849-da27-485d-aa11-b7a9db6466e3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:2ddded80-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 473b45ded6ab11ee999fed2339b27864-20240228
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1541259985; Wed, 28 Feb 2024 19:36:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Feb 2024 10:35:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Feb 2024 10:35:24 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
Subject: [PATCH 0/3] Add GAMMA 12-bit LUT support for MT8188
Date: Thu, 29 Feb 2024 10:35:19 +0800
Message-ID: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_183605_133671_E86DA5FA 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Since MT8195 supports GAMMA 12-bit LUT after the landing of [1] series,
we can now add support for MT8188.

[1] MediaTek DDP GAMMA - 12-bit LUT support
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=792516

Jason-JH.Lin (3):
  dt-bindings: display: mediatek: gamma: Change MT8195 to single enum
    group
  dt-bindings: display: mediatek: gamma: Add support for MT8188
  drm/mediatek: Add gamma support for MT8195

 .../bindings/display/mediatek/mediatek,gamma.yaml           | 6 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                      | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.18.0


