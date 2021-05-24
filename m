Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961E0C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 23:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC3861420
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 23:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC3861420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nPfhF4+WX/ypS2GwDY9zEDeyI2CPZ8aE+0y0Qrify78=; b=w5a4fIR8q+Lq/X
	GNqpQdtLw5+jdWS+2RSS7v7mNRuHAm0/ily/KkgbucWJcRfWOOISsgNLucgwWICe7BjIl6IrEds+4
	kpNaKnfsiN4ueIAMm6axKNPPsX89K2yv/ahyeB0qi4Y58ywvyRWIg7SB0zpdiQc0Zmgor5IADn66T
	NioXp9P4HCx2x/tLdmPysyFiiX0aY7MKQhDW4k51oX6rWBEqoXdwFbF5bOp7cAyoGZTc7G6Jx7EmS
	Hk0uKO5GsHicujGfofkYRNa77g+Pr5uQAMmSxWI26flAcCl3v1wnl62S1STRxzHYXaKOeix5oP20c
	oqPfT2/wlWhuZck0O1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llK85-002Mph-Fo; Mon, 24 May 2021 23:37:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll9rZ-000uwI-4e; Mon, 24 May 2021 12:39:19 +0000
X-UUID: bd54a0a5543b45ff9afcc832f72168c2-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=n0raGB9UPSADyLEcgo2AOUbcwDBwTC1WS6/lWQD3GwE=; 
 b=RwF0xPptP4QM27JKfz+FEzaPRmaOgDRKQaEq1A/z2eJ69CvCoL2TEtLxMMJA2ug+DcwJB/Ri5LBp5CXCYE0e4XBCefabTmgnYj/J3BdNXWFEEqCwqlDavrBkQMvX10GWkBC06OjkCoC5C3aObAKUAyuSn4dTlrBLxYUBZiqkuqs=;
X-UUID: bd54a0a5543b45ff9afcc832f72168c2-20210524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1472950312; Mon, 24 May 2021 05:39:13 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 05:29:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 20:29:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 May 2021 20:29:10 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 00/22] Mediatek MT8192 clock support
Date: Mon, 24 May 2021 20:20:31 +0800
Message-ID: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_053917_526444_EA48595A 
X-CRM114-Status: GOOD (  14.40  )
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

this patch series is based on 5.13-rc3.

change since v8:
- fix mm dt-binding file conflict.

reason for sending v8:
- due to this patch series including dt-binding file, so add
device tree reviewer to mail list, no change between [1] and v8.
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=454523

reason for resending v7:
- add review history from series below
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405295

change since v6:
- update from series below
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405295
- fix DT bindings fail
- fix checkpatch warning
- update mux ops without gate control

change since v5:
- remove unused clocks by rolling Tinghan's patches[1][2] into series
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=398781
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405143
- remove dts related patches from series

change since v4:
- merge some subsystem into same driver
- add a generic probe function to reduce duplicated code

changes since v3:
- add critical clocks
- split large patches into small ones

changes since v2:
- update and split dt-binding documents by functionalities
- add error checking in probe() function
- fix incorrect clock relation and add critical clocks
- update license identifier and minor fix of coding style

changes since v1:
- fix asymmetrical control of PLL
- have en_mask used as divider enable mask on all MediaTek SoC

chun-jie.chen (22):
  dt-bindings: ARM: Mediatek: Add new document bindings of imp i2c
    wrapper controller
  dt-bindings: ARM: Mediatek: Add new document bindings of mdpsys
    controller
  dt-bindings: ARM: Mediatek: Add new document bindings of msdc
    controller
  dt-bindings: ARM: Mediatek: Add new document bindings of scp adsp
    controller
  dt-bindings: ARM: Mediatek: Document bindings of MT8192 clock
    controllers
  clk: mediatek: Add dt-bindings of MT8192 clocks
  clk: mediatek: Fix asymmetrical PLL enable and disable control
  clk: mediatek: Add configurable enable control to mtk_pll_data
  clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers
  clk: mediatek: Add MT8192 basic clocks support
  clk: mediatek: Add MT8192 audio clock support
  clk: mediatek: Add MT8192 camsys clock support
  clk: mediatek: Add MT8192 imgsys clock support
  clk: mediatek: Add MT8192 imp i2c wrapper clock support
  clk: mediatek: Add MT8192 ipesys clock support
  clk: mediatek: Add MT8192 mdpsys clock support
  clk: mediatek: Add MT8192 mfgcfg clock support
  clk: mediatek: Add MT8192 mmsys clock support
  clk: mediatek: Add MT8192 msdc clock support
  clk: mediatek: Add MT8192 scp adsp clock support
  clk: mediatek: Add MT8192 vdecsys clock support
  clk: mediatek: Add MT8192 vencsys clock support

 .../arm/mediatek/mediatek,apmixedsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,audsys.txt |    1 +
 .../bindings/arm/mediatek/mediatek,camsys.txt |   22 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt |    2 +
 .../arm/mediatek/mediatek,imp_iic_wrap.yaml   |   80 +
 .../arm/mediatek/mediatek,infracfg.txt        |    1 +
 .../bindings/arm/mediatek/mediatek,ipesys.txt |    1 +
 .../arm/mediatek/mediatek,mdpsys.yaml         |   40 +
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt  |    1 +
 .../bindings/arm/mediatek/mediatek,msdc.yaml  |   48 +
 .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
 .../arm/mediatek/mediatek,scp-adsp.yaml       |   40 +
 .../arm/mediatek/mediatek,topckgen.txt        |    1 +
 .../arm/mediatek/mediatek,vdecsys.txt         |    8 +
 .../arm/mediatek/mediatek,vencsys.txt         |    1 +
 drivers/clk/mediatek/Kconfig                  |   80 +
 drivers/clk/mediatek/Makefile                 |   13 +
 drivers/clk/mediatek/clk-mt8192-aud.c         |  118 ++
 drivers/clk/mediatek/clk-mt8192-cam.c         |  107 ++
 drivers/clk/mediatek/clk-mt8192-img.c         |   70 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap.c    |  119 ++
 drivers/clk/mediatek/clk-mt8192-ipe.c         |   57 +
 drivers/clk/mediatek/clk-mt8192-mdp.c         |   82 +
 drivers/clk/mediatek/clk-mt8192-mfg.c         |   50 +
 drivers/clk/mediatek/clk-mt8192-mm.c          |  108 ++
 drivers/clk/mediatek/clk-mt8192-msdc.c        |   85 ++
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |   50 +
 drivers/clk/mediatek/clk-mt8192-vdec.c        |   94 ++
 drivers/clk/mediatek/clk-mt8192-venc.c        |   53 +
 drivers/clk/mediatek/clk-mt8192.c             | 1326 +++++++++++++++++
 drivers/clk/mediatek/clk-mtk.c                |   23 +
 drivers/clk/mediatek/clk-mtk.h                |   28 +-
 drivers/clk/mediatek/clk-mux.c                |    9 +-
 drivers/clk/mediatek/clk-mux.h                |   18 +-
 drivers/clk/mediatek/clk-pll.c                |   31 +-
 include/dt-bindings/clock/mt8192-clk.h        |  585 ++++++++
 37 files changed, 3335 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-scp_adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192.c
 create mode 100644 include/dt-bindings/clock/mt8192-clk.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
