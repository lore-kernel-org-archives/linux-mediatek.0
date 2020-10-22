Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2F5C55179
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA2D223FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UIf4PUMC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Yew5/s22"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA2D223FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EZTgRnPFL/6HaUGDPokPF6r/8ZuWdzrBkoJP6yv4BgM=; b=UIf4PUMCr8rliZRo4BHkK2h4hd
	vkTxex8mtzOjiJJWTAuGae2+8uOeZk4RWJqN7edf74nqc6aAgCGLFqD6GEnduc3OXvnRptIZo+tnY
	FK9yYlr/XVZGtHSOiAQRtnFdyCNslitPN0CE0BtwHRo9taWryFwmB7K1DBldo9fON77vdYmnBkdfi
	ztZRaHsBScQvY/1/pUSJ6KPdHYoFteSU83AlSDc9j5s/DFARRHJf5M5gpDtD/kqUY1/SZCr9vSqlL
	3WZFpfWWLFeUY7wI8FHukllKNgQyuTlhg9xr/Yk8McLGY6Z2FLKSzrQAk7c7bdh5aMHfrx/4QMVUs
	LNkasF8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa1P-0007Va-PB; Thu, 22 Oct 2020 12:48:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0Z-00079L-Tl; Thu, 22 Oct 2020 12:47:57 +0000
X-UUID: 9b2031749fe44eb8954fb0c084f7176f-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NXtnk5V4ItBOGYeN/Z9GlZO1uWYyaw+gCkpcnBe52MI=; 
 b=Yew5/s22j9AknGmnonJud9brFLo3IhHdjJ+Aff4WLSCWRWXJ7nHw/gxJPAAItsg+UmI9FbSGNfmbTrnDkjT5jKbZS3JHmukmUC0bbp34WSjjmNBq89gkxQ/w+Xpo6DB/RRcmTA42g5MXnUEIL9luCvAM8vwUA9f9XbD7A0kGZTg=;
X-UUID: 9b2031749fe44eb8954fb0c084f7176f-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1048387074; Thu, 22 Oct 2020 04:47:50 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:44 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 00/34] Mediatek MT8192 clock support 
Date: Thu, 22 Oct 2020 20:36:53 +0800
Message-ID: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084756_104336_2B78A256 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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


Weiyi Lu (34):
  dt-bindings: ARM: Mediatek: Add new document bindings of camsys raw
    controller
  dt-bindings: ARM: Mediatek: Add new document bindings of imp i2c
    wrapper controller
  dt-bindings: ARM: Mediatek: Add new document bindings of mdpsys
    controller
  dt-bindings: ARM: Mediatek: Add new document bindings of msdc
    controller
  dt-bindings: ARM: Mediatek: Add new document bindings of scp adsp
    controller
  dt-bindings: ARM: Mediatek: Add new document bindings of vdecsys soc
    controller
  dt-bindings: ARM: Mediatek: Document bindings of MT8192 clock
    controllers
  clk: mediatek: Add dt-bindings of MT8192 clocks
  clk: mediatek: Fix asymmetrical PLL enable and disable control
  clk: mediatek: Add configurable enable control to mtk_pll_data
  clk: mediatek: Add MT8192 basic clocks support
  clk: mediatek: Add MT8192 audio clock support
  clk: mediatek: Add MT8192 camsys clock support
  clk: mediatek: Add MT8192 camsys rawa clock support
  clk: mediatek: Add MT8192 camsys rawb clock support
  clk: mediatek: Add MT8192 camsys rawc clock support
  clk: mediatek: Add MT8192 imgsys clock support
  clk: mediatek: Add MT8192 imgsys2 clock support
  clk: mediatek: Add MT8192 imp i2c wrapper c clock support
  clk: mediatek: Add MT8192 imp i2c wrapper e clock support
  clk: mediatek: Add MT8192 imp i2c wrapper n clock support
  clk: mediatek: Add MT8192 imp i2c wrapper s clock support
  clk: mediatek: Add MT8192 imp i2c wrapper w clock support
  clk: mediatek: Add MT8192 imp i2c wrapper ws clock support
  clk: mediatek: Add MT8192 ipesys clock support
  clk: mediatek: Add MT8192 mdpsys clock support
  clk: mediatek: Add MT8192 mfgcfg clock support
  clk: mediatek: Add MT8192 mmsys clock support
  clk: mediatek: Add MT8192 msdc top clock support
  clk: mediatek: Add MT8192 msdc clock support
  clk: mediatek: Add MT8192 scp adsp clock support
  clk: mediatek: Add MT8192 vdecsys clock support
  clk: mediatek: Add MT8192 vdecsys soc clock support
  clk: mediatek: Add MT8192 vencsys clock support

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
 drivers/clk/mediatek/clk-mt8192-aud.c         |  118 ++
 drivers/clk/mediatek/clk-mt8192-cam.c         |   72 +
 drivers/clk/mediatek/clk-mt8192-cam_rawa.c    |   59 +
 drivers/clk/mediatek/clk-mt8192-cam_rawb.c    |   59 +
 drivers/clk/mediatek/clk-mt8192-cam_rawc.c    |   59 +
 drivers/clk/mediatek/clk-mt8192-img.c         |   60 +
 drivers/clk/mediatek/clk-mt8192-img2.c        |   62 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_c.c  |   62 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_e.c  |   59 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_n.c  |   60 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_s.c  |   61 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_w.c  |   59 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c |   61 +
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
 drivers/clk/mediatek/clk-mt8192.c             | 1350 +++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h                |    2 +
 drivers/clk/mediatek/clk-mux.h                |   15 +
 drivers/clk/mediatek/clk-pll.c                |   31 +-
 include/dt-bindings/clock/mt8192-clk.h        |  592 ++++++++
 48 files changed, 4036 insertions(+), 7 deletions(-)
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
