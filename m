Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07956C433E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:00:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF71B20729
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rb4zTQfM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PV0tCjcu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF71B20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CYQNKnJAyNLBtB7VF5xhRLHsNcvSg25lP8Zpl+ezEl4=; b=rb4zTQfMhkZMUZei//yvH6Y4DJ
	40cATGiOi0T36531C6oTY+wUD/PuZXwZqy+1QVncqpn2RzIVQb8eVHGsnyRC1O6HKvtiAW1knPlkf
	l7jRMzestRhsXBb9InghXdKf8q4eAoeuTaSPdL03ZhSvZS1omB/x/uQ1OQZdoeM5KjEe/OUDq0f8O
	vX0y/1oU3VvsxSzA05JD0xlknvdoAdTlCpqWR7yjPWo0aUHlVb2YZcZHDMyUNC1c0xXkKJz/AmQtd
	bmivT38N6MVD3BjPxpm9FI1wtGQFoCrgW9z2qidOw6YxvVx+DNDwhaOQEOgdLttN0kWkQncg930ZC
	d/JXZqVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy8jo-0008VL-Tw; Wed, 22 Jul 2020 07:00:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy8jh-0008SY-HK; Wed, 22 Jul 2020 07:00:18 +0000
X-UUID: fd383d01540f483bb6ad3c3c2523ee89-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fG7DIePecIW+cwodnHQEQ2JNbYq/qFq9wVah4koGVsE=; 
 b=PV0tCjcuiZBMSU8oD6glfPMW8Dm98eTrsN3d/FJAAIagjqoUQkkCK1rfXsFlSdApVm1QkfoxSuvMPbvGLXHu8mnGZUtHJEVw1YVn/+o9/T/IZ88q1S/VXH8EObkMgNy/flb4c0jHYFNuE9XYTft2p0IeIJFgSkSSaLhycOA9JA8=;
X-UUID: fd383d01540f483bb6ad3c3c2523ee89-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1919316485; Tue, 21 Jul 2020 23:00:19 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 23:50:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 14:50:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Jul 2020 14:50:02 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 0/4] Mediatek MT8192 clock and scpsys support 
Date: Wed, 22 Jul 2020 14:49:57 +0800
Message-ID: <1595400601-26220-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_030017_805282_413BAED1 
X-CRM114-Status: GOOD (  10.22  )
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

Weiyi Lu (4):
  dt-bindings: ARM: Mediatek: Document bindings for MT8192
  clk: mediatek: Add dt-bindings for MT8192 clocks
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
 drivers/clk/mediatek/clk-pll.c                |   26 +-
 include/dt-bindings/clock/mt8192-clk.h        |  593 +++++++
 48 files changed, 4177 insertions(+), 4 deletions(-)
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
