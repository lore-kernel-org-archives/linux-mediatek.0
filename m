Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3FIWvZ8Zq/DAdqRKGP12pJU5lYJrQsWuaKamIik/EE=; b=BvkvxCgI3mpTGk
	NmmVkDi4lTiW2TgoHewn9dft75kClYAjQXNFOpRf7jEwRrUzzuLzKh0nbFuO4BVwCLU2ItGkgu7Sb
	Lef4hjbRrfosajvyovRp5Tn1fch5p5gj1YULpqtjg1QYrmUTts/ZgZ/WNZveGBLsrDQSQZeuFyuDN
	uu9QRYzHwy6kyUxjBGgLVmvTbpbV9ZIygFR96XEJatmMKZI+k2TH0MooyLgSI1LlTbqIrInaskW45
	Ibgjpq3w7dz7C588a3+zdfWynBQ0ZEzxRsldursror1WYfweUtTbpKPtdVgLnKEOdsCgOxR3jBun1
	ceEEiF4ptcZmEA2ej58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7uE7-004wV0-R2; Thu, 13 Jan 2022 07:08:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7uDn-004wS5-R9; Thu, 13 Jan 2022 07:08:33 +0000
X-UUID: a7b78c31b2a14bbfa1b175493dcc9835-20220113
X-UUID: a7b78c31b2a14bbfa1b175493dcc9835-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1012280559; Thu, 13 Jan 2022 00:08:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 22:58:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 14:58:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Jan 2022 14:58:23 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v4 0/5] Update MT8192 Clock Setting
Date: Thu, 13 Jan 2022 14:58:17 +0800
Message-ID: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_230831_904910_F6943460 
X-CRM114-Status: UNSURE (   7.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

This patch is base on v5.16-rc8,

changes since v3:
 - update that list(remove already upstream patch)

changes since v2:
 - add missing "clock" at the end of commit message

changes since v1:
 - update the commit message

Allen-KH Cheng (5):
  arm64: dts: mediatek: Correct uart clock of MT8192
  arm64: dts: mediatek: Correct SPI clock of MT8192
  arm64: dts: mediatek: Correct Nor Flash clock of MT8192
  arm64: dts: mediatek: Correct I2C clock of MT8192
  arm64: dts: mediatek: Correct system timer clock of MT8192

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 92 +++++++++++++-----------
 1 file changed, 52 insertions(+), 40 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
