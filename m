Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEE6C43461
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:24:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D589207D3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YIXIMqYV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HyXTjZY4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D589207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h8R1gpXW3mTg6bTSBM98GVeotMaJzWIMPLQpwMYq8tk=; b=YIXIMqYVAbzbXmGlgNOiLUjHyx
	NVhgPlqlZAKXSgZTvZDLRdvE7vVfRwW6Qn+rhPgZiT4+yBLwE/sEnYW9LynpjD555P523EC1lMxDS
	f9d0jE9GImDYCgOby9keb5eJecSfl2CPupILS9vJCTYchqxCvWYG0KtBNzikrTFsNhP21e144WGki
	4hsKDAkEt+L7ddnh1OlNV3tzNretBDDiLNmF/Dack9zEGpwdfXriO17Ct9a4zyMlhR6gAeAhAOoBc
	8WjSYC40Be4JHmqdTQEZbmC+kz5cG5q+pA6BHbNS+8tzzxphzFcFJL8zXThgFkJVUfLXxv47eqAnk
	m7FjLqZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDfqr-0003pa-R4; Thu, 03 Sep 2020 03:23:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDfqZ-0003hr-H0; Thu, 03 Sep 2020 03:23:36 +0000
X-UUID: f0cf20e0fc2445b2a696492643bcd630-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZzVWqmZ4hmCEX+Rs3hKA1UeFqdRACpfHBjBNpXFsk+g=; 
 b=HyXTjZY4ExCO2twfBPJF9RqATgkL7hygrHBFch+TTn8AOOAn4huMqj7CcDNUwMgjMyAaWewtTccP+DZ/1hWFEPA2sTkD9VxRBNssZbWzlwbn4cB4fBomwU9hU2A41qdmsbwQ+c+HXiY9y/G+NfnAvpvfv+j/H/O64mQd/zHXgDs=;
X-UUID: f0cf20e0fc2445b2a696492643bcd630-20200902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 673427322; Wed, 02 Sep 2020 19:23:26 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:23:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:23:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Sep 2020 11:23:23 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v3 0/9] Mediatek MT8192 clock support 
Date: Thu, 3 Sep 2020 11:22:51 +0800
Message-ID: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_232335_766786_786D49CA 
X-CRM114-Status: GOOD (  13.13  )
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

This series is based on v5.9-rc1 and MT8192 dts[1].

[1] https://patchwork.kernel.org/cover/11713555/

changes since v2:
- update and split dt-binding documents by functionalities
- add error checking in probe() function
- fix incorrect clock relation and add critical clocks
- update license identifier and minor fix of coding style

changes since v1:
- fix asymmetrical control of PLL
- have en_mask used as divider enable mask on all MediaTek SoC

Weiyi Lu (9):
  dt-bindings: ARM: Mediatek: Document bindings for MT8192 BSP
  dt-bindings: ARM: Mediatek: Document bindings for MT8192 Audio
  dt-bindings: ARM: Mediatek: Document bindings for MT8192 Multimedia
  dt-bindings: ARM: Mediatek: Document bindings for MT8192 Camera
  dt-bindings: ARM: Mediatek: Document bindings for MT8192 APU and GPU
  clk: mediatek: Add dt-bindings for MT8192 clocks
  clk: mediatek: Fix asymmetrical PLL enable and disable control
  clk: mediatek: Add configurable enable control to mtk_pll_data
  clk: mediatek: Add MT8192 clock support

 .../arm/mediatek/mediatek,apmixedsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,audsys.txt |    1 +
 .../arm/mediatek/mediatek,camsys-raw.yaml     |   54 +
 .../bindings/arm/mediatek/mediatek,camsys.txt |    1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt |    2 +
 .../arm/mediatek/mediatek,imp_iic_wrap.yaml   |   78 +
 .../arm/mediatek/mediatek,infracfg.txt        |    1 +
 .../bindings/arm/mediatek/mediatek,ipesys.txt |    1 +
 .../arm/mediatek/mediatek,mdpsys.yaml         |   38 +
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt  |    1 +
 .../bindings/arm/mediatek/mediatek,msdc.yaml  |   46 +
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
 drivers/clk/mediatek/clk-mt8173.c             |   28 +-
 drivers/clk/mediatek/clk-mt8183.c             |   22 +-
 drivers/clk/mediatek/clk-mt8192-aud.c         |  118 ++
 drivers/clk/mediatek/clk-mt8192-cam.c         |   72 +
 drivers/clk/mediatek/clk-mt8192-cam_rawa.c    |   59 +
 drivers/clk/mediatek/clk-mt8192-cam_rawb.c    |   59 +
 drivers/clk/mediatek/clk-mt8192-cam_rawc.c    |   59 +
 drivers/clk/mediatek/clk-mt8192-img.c         |   60 +
 drivers/clk/mediatek/clk-mt8192-img2.c        |   62 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_c.c  |   61 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_e.c  |   58 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_n.c  |   59 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_s.c  |   60 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_w.c  |   58 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c |   60 +
 drivers/clk/mediatek/clk-mt8192-ipe.c         |   64 +
 drivers/clk/mediatek/clk-mt8192-mdp.c         |   89 ++
 drivers/clk/mediatek/clk-mt8192-mfg.c         |   57 +
 drivers/clk/mediatek/clk-mt8192-mm.c          |  108 ++
 drivers/clk/mediatek/clk-mt8192-msdc.c        |   57 +
 drivers/clk/mediatek/clk-mt8192-msdc_top.c    |   71 +
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |   57 +
 drivers/clk/mediatek/clk-mt8192-vdec.c        |   82 +
 drivers/clk/mediatek/clk-mt8192-vdec_soc.c    |   82 +
 drivers/clk/mediatek/clk-mt8192-venc.c        |   60 +
 drivers/clk/mediatek/clk-mt8192.c             | 1340 +++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h                |    2 +
 drivers/clk/mediatek/clk-mux.h                |   15 +
 drivers/clk/mediatek/clk-pll.c                |   28 +-
 include/dt-bindings/clock/mt8192-clk.h        |  592 ++++++++
 57 files changed, 4116 insertions(+), 108 deletions(-)
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
