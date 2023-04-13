Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFA2C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 04:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J9/3gRvZKQh9PBsv2u0f/zwWnC9OfkhakSj8L5mtnJ0=; b=TW4rPjhrSWKL0Ivfnxn1ab03Pd
	O6G/8BRhc1sKAheOCok+7kI/u119EGixTK0XRBAZCTBBvYZJHamMFCsxiFsxTtZHGYhotYy9+NOwo
	I7HxzRPPp+Q5GJ89dq8+NQ/qy3NYzqdlJzAEQapGOnLIh0xwXpHXgBOGDv9BgfekHNSDQWbLOr6Nx
	Nnmj8wAqtiuBrSidCeGGitWAlft0O3LKNVtoNKLbdBahK1gadak8cpuqruc7bgP1Ta2qZfmF2aByF
	X4ofzpko6du8ZH+b+yqSUbFCuzQBfqNEhqzLQT4ushvLTJEleWzhaRbaEk+SpdOLOC+lHDmZyV+Qq
	0sGxqxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmoEX-004xz2-07;
	Thu, 13 Apr 2023 04:06:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmoET-004xxa-1G;
	Thu, 13 Apr 2023 04:06:50 +0000
X-UUID: 9820d4e4d9b011edb7d8d11f642b8e78-20230412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=J9/3gRvZKQh9PBsv2u0f/zwWnC9OfkhakSj8L5mtnJ0=;
	b=gfy8+G8RnDoTOaUeZa1OyteREK6iu+vk4vX4CCI95SQMhlnKFFxEz6Z++uafiZ2/DiXjkIpjJbOxgCDWx76dDf3WhQ2+agPSvW5k1zTW+mTH9gVQ2k9UmhEpDoOJm91NkJlT8tiYFpZuW02f0cGflXbq7tIu98PgP1jhLxnYtvw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:dcd4ea9d-52e1-4af9-a920-09b4a878c3b9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.22,REQID:dcd4ea9d-52e1-4af9-a920-09b4a878c3b9,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:120426c,CLOUDID:d4212ba1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:230413120642XB6MOJBC,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 9820d4e4d9b011edb7d8d11f642b8e78-20230412
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1857710912; Wed, 12 Apr 2023 21:06:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 12:06:38 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 12:06:37 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH 0/2] Add compatible to increase MT8188 audio control
Date: Thu, 13 Apr 2023 12:06:23 +0800
Message-ID: <1681358785-6930-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_210649_571497_50D39AA4 
X-CRM114-Status: UNSURE (   7.86  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
Mainly add the following two flag:

1.The audio packet arrangement function is to only arrange audio
packets into the Hblanking area. In order to align with the HW
default setting of g1200, this function needs to be turned off.

2.Due to the difference of HW, different dividers need to be set.

Base on the branch of linus/master v6.3.

Xinlei Lee (2):
  dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
  drm/mediatek: dp: Add the audio control to mtk_dp_data struct

 .../display/mediatek/mediatek,dp.yaml         |  1 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 32 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  5 +++
 3 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.18.0


