Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCF6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aZVnc9AgDV6+iECXJWjMTt3cI2AykKcbaOkGhYYgovc=; b=s76vjsXCJ7HHISPRrvIExhZ2/h
	/5R+u07geJuGnVLiTaXOCRh80tTUuhDkz4/hOHqQMRKCBhTekKXXGkU1qNyBpBYzL7oCyWyKDn5Y8
	mYGO+j78GfvzqeeO0u4aPquTZGQXd+Wv0nHyNtoG32tbFqoc7qR8IJixLdhPReTIUumvgIeLRlEB9
	rTJaWorJkHF4wEkYd0wDWot8xrS/aoLCTAHYLsRs3DNboG/VTT3E/xMu/mNO4RqucSTUDU7kumy0G
	vgOeLr2xFCMywbt44KvgxRKaasr8siObuWg5zXT0jHS0cQbaa/LvqYUHNU8hMgYHY9gvFdnZ33+B8
	05KmGyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10TF-005dVW-35;
	Thu, 09 Nov 2023 08:33:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10TD-005dUy-2R;
	Thu, 09 Nov 2023 08:33:01 +0000
X-UUID: 934272787eda11ee9b7791016c24628a-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aZVnc9AgDV6+iECXJWjMTt3cI2AykKcbaOkGhYYgovc=;
	b=pgjJNeh7MswOwM/063ikvU7Tgb+CTxgvPjLAEUz+dn+RndVTzsPZAgmXHQpsh6jDzxO+hoN4hjo74oaTb43QLXipBc2degCTCjev3iVv+3Wi1rxxMU+wygkwGAOIZj/RPebC5MOFCrve0XlMd/dtkOjCsN6w2/vgXyeSKAZCG1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:845c3f7c-0148-4fa3-b31c-30c74c58ebf8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:b0813295-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 934272787eda11ee9b7791016c24628a-20231109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1183652009; Thu, 09 Nov 2023 01:32:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Nov 2023 16:22:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Nov 2023 16:22:02 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH 0/3] Migrate MT8188 VPPSYS 0/1 to mtk-mmsys driver
Date: Thu, 9 Nov 2023 16:21:58 +0800
Message-ID: <20231109082201.7698-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_003259_813509_36C6EC25 
X-CRM114-Status: UNSURE (   9.52  )
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

Hi,

This series is to reflect VPPSYS' dependency on mtk-mmsys driver for
mediatek MT8188 platform. The MT8188 VPPSYS 0/1 should be probed 
from the "mtk-mmsys" driver, which then starts its own clock driver
as the platform driver.

Refer to the suggestion in the following patch
https://patchwork.kernel.org/project/linux-mediatek/list/?series=796808
https://patchwork.kernel.org/project/linux-mediatek/list/?series=798392

yu-chang.lee (3):
  soc: mediatek: mmsys: Add support for MT8188 VPPSYS
  dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
  dt-bindings: arm:mediatek: mmsys: Add VPPSYS compatible for MT8188

 .../bindings/arm/mediatek/mediatek,mmsys.yaml        |  2 ++
 .../bindings/clock/mediatek,mt8188-clock.yaml        |  2 --
 drivers/soc/mediatek/mtk-mmsys.c                     | 12 ++++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.18.0


