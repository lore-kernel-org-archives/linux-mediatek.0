Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B720C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:55:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019DA2075D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:55:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RsgPsIkB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jcyj0QrF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019DA2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C/PawxHwnCt4iP9Fp7E3bsPRVVrBNP738N/2odjC3O0=; b=RsgPsIkBzsBwAYZGmB4hmQ81cR
	3wWFOnuXt87B6z6v6iWuJ4QIVlcWQBaAHKYpnuiIK4S4po95urCBD+CmoOYZrhMlCnyQzNiEr+/ru
	VIy1mP1p3wSmv3HB1NfhXlDr0Afp/6N7KD4aRKN6f8ieDlTY246dyJjofHBsAGPksraa9pPi761tS
	giXOUiLhDMYrfH5DnMZ2Uo6AudiVbBPp3l63zrjQdcYsBlExCZguq8S+sEWpUJx33miNSacZKcTjZ
	78Z9cl3WwqSKHYMCNC+KAxsggiSbZRDfkE0wVychR06JCyHysgc2I/qFwFM7Qwd66z2fDEHQqWf71
	HrBani1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hrK-00031S-4e; Wed, 29 Jul 2020 08:54:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hqn-0002n1-Ff; Wed, 29 Jul 2020 08:54:14 +0000
X-UUID: f7c579829f6f48b2a6649ed44da26f76-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hedGltKMo4S0AeSBkYndMMTausqUfwf6tK8YcqmKXRg=; 
 b=jcyj0QrF1pt4ock8PeFN09oUsN1ndrQIyTVxW+JpJDlhARudReQoGFjEVExakyYIBRIv6M3Z8TackDZ9OS0DcxuuB74kjLVbH21ipGQ9vsnMZks7KOXQ/OG6436M4a+TBW2JygqwVbjWUtHG92oBbeTVTUG3ekoXSweAY2Sz80Y=;
X-UUID: f7c579829f6f48b2a6649ed44da26f76-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 106451910; Wed, 29 Jul 2020 00:50:20 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 01:44:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 16:44:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Jul 2020 16:44:45 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 0/5] Mediatek MT8192 clock support  
Date: Wed, 29 Jul 2020 16:44:32 +0800
Message-ID: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9CE4D8E8E174BD6943C6B2B6AB7171B3C1681FC63B00A8C0C24F8618D1D30A012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_045413_704628_53CA8ECA 
X-CRM114-Status: GOOD (  12.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Wendell Lin <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.8-rc1

changes since v1:
- fix asymmetrical control of PLL
- have en_mask used as divider enable mask on all MediaTek SoC

Weiyi Lu (5):
  dt-bindings: ARM: Mediatek: Document bindings for MT8192
  clk: mediatek: Add dt-bindings for MT8192 clocks
  clk: mediatek: Fix asymmetrical PLL enable and disable control
  clk: mediatek: Add configurable enable control to mtk_pll_data
  clk: mediatek: Add MT8192 clock support

 .../arm/mediatek/mediatek,apmixedsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,audsys.txt |    1 +
 .../arm/mediatek/mediatek,camsys-raw.yaml     |   40 +
 .../bindings/arm/mediatek/mediatek,camsys.txt |    1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt |    2 +
 .../arm/mediatek/mediatek,imp_iic_wrap.yaml   |   43 +
 .../arm/mediatek/mediatek,infracfg.txt        |    1 +
 .../bindings/arm/mediatek/mediatek,ipesys.txt |    1 +
 .../arm/mediatek/mediatek,mdpsys.yaml         |   38 +
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt  |    1 +
 .../bindings/arm/mediatek/mediatek,msdc.yaml  |   39 +
 .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
 .../arm/mediatek/mediatek,scp-adsp.yaml       |   38 +
 .../arm/mediatek/mediatek,topckgen.txt        |    1 +
 .../arm/mediatek/mediatek,vdecsys-soc.yaml    |   38 +
 .../arm/mediatek/mediatek,vdecsys.txt         |    1 +
 .../arm/mediatek/mediatek,vencsys.txt         |    1 +
 drivers/clk/mediatek/Kconfig                  |  146 ++
 drivers/clk/mediatek/Makefile                 |   24 +
 drivers/clk/mediatek/clk-mt2701.c             |   26 +-
 drivers/clk/mediatek/clk-mt2712.c             |   30 +-
 drivers/clk/mediatek/clk-mt6765.c             |   20 +-
 drivers/clk/mediatek/clk-mt6779.c             |   24 +-
 drivers/clk/mediatek/clk-mt6797.c             |   20 +-
 drivers/clk/mediatek/clk-mt7622.c             |   18 +-
 drivers/clk/mediatek/clk-mt7629.c             |   12 +-
 drivers/clk/mediatek/clk-mt8173.c             |   42 +-
 drivers/clk/mediatek/clk-mt8183.c             |   22 +-
 drivers/clk/mediatek/clk-mt8192-aud.c         |  150 ++
 drivers/clk/mediatek/clk-mt8192-cam.c         |   69 +
 drivers/clk/mediatek/clk-mt8192-cam_rawa.c    |   56 +
 drivers/clk/mediatek/clk-mt8192-cam_rawb.c    |   56 +
 drivers/clk/mediatek/clk-mt8192-cam_rawc.c    |   56 +
 drivers/clk/mediatek/clk-mt8192-img.c         |   57 +
 drivers/clk/mediatek/clk-mt8192-img2.c        |   59 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_c.c  |   61 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_e.c  |   55 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_n.c  |   57 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_s.c  |   59 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_w.c  |   55 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c |   59 +
 drivers/clk/mediatek/clk-mt8192-ipe.c         |   61 +
 drivers/clk/mediatek/clk-mt8192-mdp.c         |   89 +
 drivers/clk/mediatek/clk-mt8192-mfg.c         |   54 +
 drivers/clk/mediatek/clk-mt8192-mm.c          |  108 ++
 drivers/clk/mediatek/clk-mt8192-msdc.c        |   54 +
 drivers/clk/mediatek/clk-mt8192-msdc_top.c    |   83 +
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |   55 +
 drivers/clk/mediatek/clk-mt8192-vdec.c        |   81 +
 drivers/clk/mediatek/clk-mt8192-vdec_soc.c    |   86 +
 drivers/clk/mediatek/clk-mt8192-venc.c        |   57 +
 drivers/clk/mediatek/clk-mt8192.c             | 1549 +++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h                |    2 +
 drivers/clk/mediatek/clk-mux.h                |   15 +
 drivers/clk/mediatek/clk-pll.c                |   20 +-
 include/dt-bindings/clock/mt8192-clk.h        |  593 +++++++
 57 files changed, 4284 insertions(+), 105 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys-soc.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawa.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawb.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img2.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_e.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_n.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc_top.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-scp_adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec_soc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8192.c
 create mode 100644 include/dt-bindings/clock/mt8192-clk.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
