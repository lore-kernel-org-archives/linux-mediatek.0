Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1785C2FC04
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 06:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OvunkvNy8DkEJYgJvd+z2cTJ68TynjaGzW99dIUA88I=; b=ZAmkkU3xBn0ZdmVEf3NAhmjk2M
	F++T2i9iSoiaMudEispoQTVXXUT9Vv+ez7gw3KJQ3s+VcaHEjgsLqdAcz8z0Cy2GFH37zCr/UrxdB
	r3iXffcysjLZujLgkYYO/e7/bhUYCk6fTrRrxiYQnxOP2uTCwzvx973MUfLsGhDx/qcZddcCbWTrn
	2817ypm1OtkdME2l2kt3wp2SF+71lPrXuM6aywxcXUmzWxuC78V5JkEn1XxHNtQUerpX+quOdJYZQ
	VXh+blPM+2Gz+hsNWfew2/4uvjbBO89GyCx6L83wSMyz4hdTpLfGZSZneEuHTPzsCua2lUTc4nCgj
	pJ62jiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWWTI-005dxo-37;
	Thu, 17 Aug 2023 06:27:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWWTF-005dwk-2m;
	Thu, 17 Aug 2023 06:27:03 +0000
X-UUID: 114e953a3cc711ee912e1518a6540028-20230816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OvunkvNy8DkEJYgJvd+z2cTJ68TynjaGzW99dIUA88I=;
	b=u00NJQ7kKv1tWba7rEvssL0aWULu7L0zitFxsem1qYyF08lCY67oM8xEzd4cPsZIV1Rlu118PbwXa3+2ceKNrV5meF5KTNqFFT7dFVrhtmNgEQDsggZJw4PMNT00dfJqhH7hEJ6D1K4Rb+sCWdd9Ul7RgxBcp6Hu2DqebFHyup4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:08372411-3428-4691-b3d5-63809641951e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:818ba0ee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 114e953a3cc711ee912e1518a6540028-20230816
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1584879785; Wed, 16 Aug 2023 23:26:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 14:26:24 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 14:26:23 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>
Subject: [PATCH v5,0/4] Add compatible to increase MT8188 audio control 
Date: Thu, 17 Aug 2023 14:26:31 +0800
Message-ID: <20230817062635.8786-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_232702_257808_F3C19917 
X-CRM114-Status: UNSURE (   7.29  )
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

Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
Mainly add the following two flag:

1.The audio packet arrangement function is to only arrange audio
packets into the Hblanking area. In order to align with the HW
default setting of g1200, this function needs to be turned off.

2.Due to the difference of HW, different dividers need to be set.

Base on the branch of linus/master v6.4.

Shuijing Li (4):
  dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
  drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
  drm/mediatek: dp: Add the audio divider to mtk_dp_data struct
  drm/mediatek: dp: Add support MT8188 dp/edp function

 .../display/mediatek/mediatek,dp.yaml         |  2 ++
 drivers/gpu/drm/mediatek/mtk_dp.c             | 36 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 23 ++++++++----
 3 files changed, 54 insertions(+), 7 deletions(-)

-- 
2.40.1


