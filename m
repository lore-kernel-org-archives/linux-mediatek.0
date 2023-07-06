Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F6FEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 02:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlo3Ei/JjTN59JgLREbq5CT1Efs+sQtYpvHgUFM6xhA=; b=VEwLAscH4tHrGQhH0swPE+V/U8
	zGyGxJH0x4+rOL/Oe3vGJPfXUv7th/b7BBR0Fx0s63eAVrraNoVZ3hJrf27nKYGwbxHoB6ySKWAOj
	9hA7Z4CT4NZpQsLkcbsHQpazva1EyMdvaiTJxSESngLNXvEwzKp+iQNzgEZKjrfc0FB8izrejil4n
	KmZBjAOD2svxQGj97CUB+ezDxeSbUHe3cuXLM94B3NYve3uNMJcD1tIbhtp3tKxOZBix3bE/mA/84
	KhHAMG16xPRFA3G9dexLKQMTjzOLSO/di8EsNIt/YJ5zx45fjLQToijqd64vztcZWNBUCDwqXDatZ
	V2tCUTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHEWD-0005xW-0K;
	Thu, 06 Jul 2023 02:14:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHEWA-0005um-0T;
	Thu, 06 Jul 2023 02:14:51 +0000
X-UUID: de94282a1ba211ee912e1518a6540028-20230705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hlo3Ei/JjTN59JgLREbq5CT1Efs+sQtYpvHgUFM6xhA=;
	b=tNWJC8r4OJZJBp7sxRVtktYHMFhBMG1BPm9EHHk7MeTzrzAEm+3GQqawAFNXUltfYhiZg6lxIumnal+5igHlg44ATH34HaDgN8o90qq/L882wyGZoIlhxh/7TAYgPGgczRQXpc+bIW5K6vg4dLtrZVmHewHpCeHE1qz6HxM//RE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:290d82f9-4bd6-4c06-b507-0be46d0cc53b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:01c9525,CLOUDID:f4e7acda-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: de94282a1ba211ee912e1518a6540028-20230705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2056984487; Wed, 05 Jul 2023 19:14:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jul 2023 10:14:08 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jul 2023 10:14:07 +0800
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
Subject: [PATCH v2,0/2] Add compatible to increase MT8188 audio control
Date: Thu, 6 Jul 2023 10:14:23 +0800
Message-ID: <20230706021425.31735-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_191450_189964_89AAFDD0 
X-CRM114-Status: UNSURE (   7.39  )
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

Shuijing Li (2):
  dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
  drm/mediatek: dp: Add the audio control to mtk_dp_data struct

 .../display/mediatek/mediatek,dp.yaml         |  2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 47 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  6 +++
 3 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.40.1


