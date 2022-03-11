Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CDAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tzRH9o3b1sScv/LyKDLKJAhQumJHpnUTUA5Q+qxKKZo=; b=ARotDhB0QRu/zP
	1XVClTtc3CdaxHZC0CE5veUxQL3TVL/Em2KBAC/3LJ+ha0pZVw+NOWvEvgI2eNQ2kNaZfp0vNQVzR
	Zxze+PLUUxnIPSjl2nM6u3Vgd0l37RRXzvg5T3BhuEGY6TzKzbwkMmMzQzmiYIEujFMtFMrpCH5fa
	lF0/Os8hbGvdFFy+gh/qiCH/dQ60YX8lt+ApmDxiT4DdmE+WuwxS7TjrruD52bey3bPixKuf832Sj
	LRSnPESpcbVakCQ+b79rHqglNRslhdUSEUVRNFRCf8XBGGy1PsMyGqd6ceuKBmNs9Yz0nS5J1O9bN
	0r3pu+MD8jMc3X4kry5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSdgX-00GD5A-UE; Fri, 11 Mar 2022 11:43:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSdg0-00GCrp-Fw; Fri, 11 Mar 2022 11:43:22 +0000
X-UUID: 015e7a919a0441358609daf054137011-20220311
X-UUID: 015e7a919a0441358609daf054137011-20220311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1966577411; Fri, 11 Mar 2022 04:43:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 03:42:58 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 11 Mar 2022 19:42:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Mar 2022 19:42:56 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 00/15] MediaTek MT8186 clock support
Date: Fri, 11 Mar 2022 19:42:14 +0800
Message-ID: <20220311114229.32504-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_034320_549173_50E9B4A8 
X-CRM114-Status: GOOD (  10.61  )
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

this patch series is based on 5.17-rc1 and depends on
[1]"clk: mediatek: Cleanups and Improvements - Part 1"

chagnes since v2:
- add '|' to preserve the formatting in binding document
- change 'Mediatek'to 'MediaTek'

changes since v1:
- combine dt-binding documents as a single patch
- remove redundant example in binding document
- change to dual license in binding document
- add more clock error handle based on interface provided in [1]

[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=612171

Chun-Jie Chen (15):
  dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock
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

 .../arm/mediatek/mediatek,mt8186-clock.yaml   |  56 ++
 .../mediatek/mediatek,mt8186-sys-clock.yaml   |  54 ++
 drivers/clk/mediatek/Kconfig                  |   8 +
 drivers/clk/mediatek/Makefile                 |   5 +
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  | 133 +++
 drivers/clk/mediatek/clk-mt8186-cam.c         |  90 ++
 drivers/clk/mediatek/clk-mt8186-img.c         |  68 ++
 .../clk/mediatek/clk-mt8186-imp_iic_wrap.c    |  67 ++
 drivers/clk/mediatek/clk-mt8186-infra_ao.c    | 216 +++++
 drivers/clk/mediatek/clk-mt8186-ipe.c         |  55 ++
 drivers/clk/mediatek/clk-mt8186-mcu.c         | 106 +++
 drivers/clk/mediatek/clk-mt8186-mdp.c         |  80 ++
 drivers/clk/mediatek/clk-mt8186-mfg.c         |  48 ++
 drivers/clk/mediatek/clk-mt8186-mm.c          | 111 +++
 drivers/clk/mediatek/clk-mt8186-topckgen.c    | 780 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8186-vdec.c        |  88 ++
 drivers/clk/mediatek/clk-mt8186-venc.c        |  51 ++
 drivers/clk/mediatek/clk-mt8186-wpe.c         |  51 ++
 include/dt-bindings/clock/mt8186-clk.h        | 445 ++++++++++
 19 files changed, 2512 insertions(+)
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
