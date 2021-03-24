Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEF5C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 10:41:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A4F61A01
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 10:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A4F61A01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8GPNViNqZP4dUxnCucs8LAYCC+QG2MiFXAXo5edW2CU=; b=m1mfOHLypgdxZNiq7l36EIStjk
	UPAyWDWFx5TLj5DfFa5coKGzKF0CFgxfJ7g9e2bQG4XUXQg1U8bhTW3MIydVsjVimhFYM/vMsm4OQ
	ZlzOmQLdvV2DSPRlYCM6WPnPVwBXuwvj208fAaRA3XPcBHqU9gVTOx3yG4GgOOFhUxfoM4adAGiHR
	jps1U9FPXfe5nTEA4QF7Jv+wai3gnNm2rFqRoVxYIjtNiN1eGCtkA1om0NAJrOjiLHO3ut+ulX1yr
	Vu1Hq9YaRoYH/7LFJDb9UZSGN8esISy4YUOQ+zZ8J+XCfsja39Mcoe3sR+pT/1U7TxGM8o17K6sTS
	ADQRrBiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP0xF-00Grbc-Ev; Wed, 24 Mar 2021 10:41:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP0x9-00GrZd-Im; Wed, 24 Mar 2021 10:41:35 +0000
X-UUID: 5940412367094a829bf9b5bfb379be87-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xvlPZlItfQIp43DTmg5mp/iAKSPCNc+xqO/fbYvXyuw=; 
 b=Uf0+C2Y6MxV2OqFFwu0N/NF6Zm+iQnCgSq0WBlXfQ7TZIgB6sSD//0hJ8KYjufpq8VUOHYWkoeNiR2DV64SM6kPdmjWtoq93yypKmQ+WC8W5+E5NoV8vPxcGfo69gVP6X3H8QO1RdmEDLIz1PJ3ymQy5qf0L3LZ+r13tuL0s2Po=;
X-UUID: 5940412367094a829bf9b5bfb379be87-20210324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 462993429; Wed, 24 Mar 2021 02:41:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 03:41:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 18:41:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 24 Mar 2021 18:41:24 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [RESEND PATCH v7 00/22] Mediatek MT8192 clock support
Date: Wed, 24 Mar 2021 18:40:48 +0800
Message-ID: <20210324104110.13383-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_104132_151853_CE5FC00E 
X-CRM114-Status: GOOD (  13.59  )
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
