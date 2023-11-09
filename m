Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA29C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aZVnc9AgDV6+iECXJWjMTt3cI2AykKcbaOkGhYYgovc=; b=ZdbnGABxcV7m2Sz1gL9XrIK5rT
	HJ7G2F4tEQOX0jT7uAg0mQfqsv2pxl7JQqgFUs2jwZ3BVKO/1M0lO4VoENJo/bPtzBkMGcbMOsz4U
	0bxXoxE19AFmz113cXKckZs4D+Sh8Q/KCAKNtOFcGjDHN/SeKdaCEX3lswfLhbrtHKLNRzwTtgtIP
	jmjnzI7EoNGwpsWyomZ2yj1YFUtbkDZekiKeTzlePUZcizijLBqW3zYSBhqqE8Di7jOf6i4Ycklvb
	O+kfVODraU81uqUX7ME7swfrdFntIVIWRS6ydNuHyAuJLJr+deRKopw8oaMgXvZHFP/qgarVvCpVI
	M160LdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12wp-0061mY-0E;
	Thu, 09 Nov 2023 11:11:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12wl-0061kN-0g;
	Thu, 09 Nov 2023 11:11:40 +0000
X-UUID: bd52d6507ef011ee86758d4a7c00f3a0-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aZVnc9AgDV6+iECXJWjMTt3cI2AykKcbaOkGhYYgovc=;
	b=UUssYuZ7OdW0wyoRa5KtaiJW7vCbuOUkzNvRnR06P5zOlmXQSNwBFLGZ3Bmrk2sI2XDLgxHdZ4V4UZlynl5INatRwopXekeeubpd6+J+eUsGA1Y+hdJt4A6UHoc8oXlQuLH1MxV4oTlYyB+cXiG+OY/R/E2FaExOWz7XxvRQg5s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:856e797e-e46e-4e4a-a9df-b6bab83e0136,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:ec7857fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: bd52d6507ef011ee86758d4a7c00f3a0-20231109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 423468843; Thu, 09 Nov 2023 04:11:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Nov 2023 19:11:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Nov 2023 19:11:29 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Garmin Chang <garmin.chang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, yu-chang.lee
	<yu-chang.lee@mediatek.com>
Subject: [RESEND 0/3] Migrate MT8188 VPPSYS 0/1 to mtk-mmsys driver
Date: Thu, 9 Nov 2023 19:11:19 +0800
Message-ID: <20231109111122.371-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.212400-8.000000
X-TMASE-MatchedRID: exF9zuYVkeR9PhHWTNJFHbU+IyHhkXf1KFFZAe4nyZ5ZLD9SNJ9sEowR
	9ju5YZeAtogp0YMuOCEMyw6hMrtYUCY0eULsNBXlngIgpj8eDcAZ1CdBJOsoY9mzcdRxL+xwKra
	uXd3MZDULlJ6umVKSHkcPSpLzSbqBGSXMELWf9jPNQ6M+1naT9PRAKn4+zi3ZtM3RsT5sQM0lhu
	QRO7Ihs5S8eRTa3jOvy1YU20+cmhxBLAb/FTpmUnQE0HbT5LEft/yYljnuhl10loENhqV3WW8X3
	5fYYQgc
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.212400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DFEAF532F7F6EAD651F3B0AE86316EBB29B32302E3EB4D4F7B2831A7D8F3AA302000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_031139_286904_36084136 
X-CRM114-Status: UNSURE (   9.69  )
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


