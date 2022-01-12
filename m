Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TS487fcOZJW/jHDLjXG419zfZeh5WlJMCkBLe8+zcP8=; b=IHknhKSQEtfkHq
	HQp+PPFafklP6Ar4DuQOpkkRsIQGN2y0VvnT3/ZY+Bs/TQo+k4R9HMTHEoC+JrmNZDrw4drvpK56d
	kgn0XTaw5nSTlfFw9dhFblMFluIi1PerwpGvKqHhDwZmtbS4t8W9UAlgX4+YqhJZ/9YHavWIWv5Hy
	W+KGsW68PTLJMB7kL58jrx4TQ82Jom93sMlUFyEg1kV9nZned81kEnFueRUnkV43LS1RcSB7TimTa
	XCfxNxDcP8Yl5yxytirUK1vuT8OpLkP6z1v5RkfTk5GMr4nHnDW/dZwCrMOo9Yyom1xMQni0BnluB
	7WlQfV4wrfs+c6uxG1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7cEc-002OOX-5w; Wed, 12 Jan 2022 11:56:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7cEN-002OKF-NA; Wed, 12 Jan 2022 11:55:57 +0000
X-UUID: acce4733abeb47ca95a4a80457c848e6-20220112
X-UUID: acce4733abeb47ca95a4a80457c848e6-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1844973061; Wed, 12 Jan 2022 04:55:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 03:55:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 12 Jan 2022 19:55:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 19:55:43 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v3 0/5] Update MT8192 Clock Setting
Date: Wed, 12 Jan 2022 19:55:37 +0800
Message-ID: <20220112115542.10606-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_035555_780337_6D6DD8D9 
X-CRM114-Status: UNSURE (   8.74  )
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
series "Mediatek MT8192 clock support"[1], [2] annd [3].
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023205.20319-2-chun-jie.chen@mediatek.com/
[3] https://lore.kernel.org/all/20210825011120.30481-1-chun-jie.chen@mediatek.com/

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
