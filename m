Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC7CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i2LlFw8WVF4H0xzEhlwFnSiQmiORKcCh2RxNQcsHNdk=; b=eg56tFDzyI0JAR
	ZrE3jgFkBhpexg48wido9tJ7/c3FGbw1rFCCRiHFBqbFlEckE215n6G0kOVZoweIltwS84tVA30Fm
	3SRyalFjmKnlwPa7BCJJIXnIQG2KC9nBWScnyElh3/iNnmGWJpEh2sg1DtSZk94Xj+Q1iyIDunIgY
	SvkVF12Rd36o1dwRgBuu/xGzow6ENGH18ZpbeCK//gLlSaGgTH3xBzV6FLgoIc/p8oD0Nm7e2HrxG
	TKLOUmZ+hZrGKtz2uOBIMlqTCnkCYeLo4f/Ee6vBAZJk90FnkKGjVp7YZZD1jnyH/NRcDF0SZDiQr
	rDC3QHJn22gveCFeTzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6uyV-00BZxO-0C; Mon, 10 Jan 2022 13:44:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6uyG-00BZsE-NP; Mon, 10 Jan 2022 13:44:28 +0000
X-UUID: 9d4f997cb7f04782bec1acb33fdb91aa-20220110
X-UUID: 9d4f997cb7f04782bec1acb33fdb91aa-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1076628100; Mon, 10 Jan 2022 06:44:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 05:44:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 10 Jan 2022 21:44:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 21:44:19 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v1 00/16] Mediatek MT8186 clock support
Date: Mon, 10 Jan 2022 21:44:00 +0800
Message-ID: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_054424_789223_77BD9ED9 
X-CRM114-Status: UNSURE (   9.40  )
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

this patch series is based on 5.16-rc6 and depends on
[1]"Integrate vppsys with mtk-mmsys in MT8195".

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=603955

Chun-Jie Chen (16):
  dt-bindings: ARM: Mediatek: Add new document bindings of MT8186 clock
  clk: mediatek: Add dt-bindings of MT8186 clocks
  clk: mediatek: Add MT8186 mcusys clock support
  clk: mediatek: Add MT8186 topckgen clock support
  clk: mediatek: Add MT8186 infrastructure clock support
  clk: mediatek: Add MT8186 apmixedsys clock support
  clk: mediatek: Add MT8186 imp i2c wrapper clock support
  clk: mediatek: Add MT8186 mfgsys clock support
  clk: mediatek: Add MT8186 mmsys clock support
  clk: mediatek: Add MT8186 wpesys clock support
  clk: mediatek: Add MT8186 imgsys clock support
  clk: mediatek: Add MT8186 vdecsys clock support
  clk: mediatek: Add MT8186 vencsys clock support
  clk: mediatek: Add MT8186 camsys clock support
  clk: mediatek: Add MT8186 mdpsys clock support
  clk: mediatek: Add MT8186 ipesys clock support

 .../arm/mediatek/mediatek,mt8186-clock.yaml   | 133 ++++
 .../mediatek/mediatek,mt8186-sys-clock.yaml   |  74 ++
 drivers/clk/mediatek/Kconfig                  |   8 +
 drivers/clk/mediatek/Makefile                 |   5 +
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  | 114 +++
 drivers/clk/mediatek/clk-mt8186-cam.c         |  89 +++
 drivers/clk/mediatek/clk-mt8186-img.c         |  67 ++
 .../clk/mediatek/clk-mt8186-imp_iic_wrap.c    |  66 ++
 drivers/clk/mediatek/clk-mt8186-infra_ao.c    | 215 +++++
 drivers/clk/mediatek/clk-mt8186-ipe.c         |  54 ++
 drivers/clk/mediatek/clk-mt8186-mcu.c         |  86 ++
 drivers/clk/mediatek/clk-mt8186-mdp.c         |  79 ++
 drivers/clk/mediatek/clk-mt8186-mfg.c         |  47 ++
 drivers/clk/mediatek/clk-mt8186-mm.c          |  97 +++
 drivers/clk/mediatek/clk-mt8186-topckgen.c    | 737 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8186-vdec.c        |  87 +++
 drivers/clk/mediatek/clk-mt8186-venc.c        |  50 ++
 drivers/clk/mediatek/clk-mt8186-wpe.c         |  50 ++
 include/dt-bindings/clock/mt8186-clk.h        | 445 +++++++++++
 19 files changed, 2503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8186-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-infra_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mcu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-wpe.c
 create mode 100644 include/dt-bindings/clock/mt8186-clk.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
