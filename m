Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF95C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 07:28:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF6923139
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 07:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF6923139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h+gCLKcPP7vf5UmkEohyJ9gLT1YtZmv5U3raxW611I4=; b=qBjeWBAaJ884azetfJxoquq+D
	l8MNENmH5hH07+kTQ/GlS7PJ83uaqXIWw8Jy+JcszznJyeymwzh0eFZ8fXQOeT2WF+/nzTdAoz/gS
	Arj1G6/4uI7oEgRaLITZ2MSV9FGJicwQI+IUMc2P5HNikfBYZJdHMaFKoou0WguBPDixJdeP1Ii2K
	/6UcyHwK/YGas/jQACtmv8WLDZ+OkQpjCrzNwiutTwYj6y2gbVsRjPpxCiJdsebkZ7mhgeuyLD6Fn
	H2ZJ/63JVXvnPzyeL+unPkOqnQGdlcNOB78L9yaBpmPtoL4NmIHLReOKyWmVMUpm4KwXVtIdtVN70
	Y849e5wjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzaa5-0006QB-U9; Wed, 13 Jan 2021 07:28:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzaa2-0006Om-AO; Wed, 13 Jan 2021 07:28:35 +0000
X-UUID: d9151e5d5b564d89a9a395a31a88e439-20210112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=V2QY4ISr3FU5R+e8pjEwcvT9G7BlJkDWriZVo+1cfW8=; 
 b=au+cPOGxgv494QqrxMGvCMzB5XIih8xmfZlOKKIVEGDIZeqaEVfBMJBBrMFcWjBk8/zA0BHlMZZqwkSO77JdcdyF2mLtvtUy0ZDSvieFsZGlJWo6yj6RIA13SHKna1BATd+QJaYhOw6jp0+70cJWSnSJzYulKICUcVP9GFgmBko=;
X-UUID: d9151e5d5b564d89a9a395a31a88e439-20210112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jamesjj.liao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 836134420; Tue, 12 Jan 2021 23:28:28 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 23:18:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 15:18:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 15:18:23 +0800
Message-ID: <1610522303.5827.2.camel@mtksdaap41>
Subject: Re: [PATCH v6 00/22] Mediatek MT8192 clock support
From: James Liao <jamesjj.liao@mediatek.com>
To: Weiyi Lu <weiyi.lu@mediatek.com>
Date: Wed, 13 Jan 2021 15:18:23 +0800
In-Reply-To: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_022834_645273_25685083 
X-CRM114-Status: GOOD (  19.32  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-22 at 21:09 +0800, Weiyi Lu wrote:
> This series is based on v5.10-rc1.
> 
> change since v5:
> - remove unused clocks by rolling Tinghan's patches[1][2] into series
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=398781
> [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405143
> - remove dts related patches from series
> 
> change since v4:
> - merge some subsystem into same driver
> - add a generic probe function to reduce duplicated code
> 
> changes since v3:
> - add critical clocks
> - split large patches into small ones
> 
> changes since v2:
> - update and split dt-binding documents by functionalities
> - add error checking in probe() function
> - fix incorrect clock relation and add critical clocks
> - update license identifier and minor fix of coding style
> 
> changes since v1:
> - fix asymmetrical control of PLL
> - have en_mask used as divider enable mask on all MediaTek SoC
> 
> Weiyi Lu (22):
>   dt-bindings: ARM: Mediatek: Add new document bindings of imp i2c
>     wrapper controller
>   dt-bindings: ARM: Mediatek: Add new document bindings of mdpsys
>     controller
>   dt-bindings: ARM: Mediatek: Add new document bindings of msdc
>     controller
>   dt-bindings: ARM: Mediatek: Add new document bindings of scp adsp
>     controller
>   dt-bindings: ARM: Mediatek: Document bindings of MT8192 clock
>     controllers
>   clk: mediatek: Add dt-bindings of MT8192 clocks
>   clk: mediatek: Fix asymmetrical PLL enable and disable control
>   clk: mediatek: Add configurable enable control to mtk_pll_data
>   clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers
>   clk: mediatek: Add MT8192 basic clocks support
>   clk: mediatek: Add MT8192 audio clock support
>   clk: mediatek: Add MT8192 camsys clock support
>   clk: mediatek: Add MT8192 imgsys clock support
>   clk: mediatek: Add MT8192 imp i2c wrapper clock support
>   clk: mediatek: Add MT8192 ipesys clock support
>   clk: mediatek: Add MT8192 mdpsys clock support
>   clk: mediatek: Add MT8192 mfgcfg clock support
>   clk: mediatek: Add MT8192 mmsys clock support
>   clk: mediatek: Add MT8192 msdc clock support
>   clk: mediatek: Add MT8192 scp adsp clock support
>   clk: mediatek: Add MT8192 vdecsys clock support
>   clk: mediatek: Add MT8192 vencsys clock support
> 
>  .../arm/mediatek/mediatek,apmixedsys.txt      |    1 +
>  .../bindings/arm/mediatek/mediatek,audsys.txt |    1 +
>  .../bindings/arm/mediatek/mediatek,camsys.txt |   22 +
>  .../bindings/arm/mediatek/mediatek,imgsys.txt |    2 +
>  .../arm/mediatek/mediatek,imp_iic_wrap.yaml   |   78 +
>  .../arm/mediatek/mediatek,infracfg.txt        |    1 +
>  .../bindings/arm/mediatek/mediatek,ipesys.txt |    1 +
>  .../arm/mediatek/mediatek,mdpsys.yaml         |   38 +
>  .../bindings/arm/mediatek/mediatek,mfgcfg.txt |    1 +
>  .../bindings/arm/mediatek/mediatek,mmsys.txt  |    1 +
>  .../bindings/arm/mediatek/mediatek,msdc.yaml  |   46 +
>  .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
>  .../arm/mediatek/mediatek,scp-adsp.yaml       |   38 +
>  .../arm/mediatek/mediatek,topckgen.txt        |    1 +
>  .../arm/mediatek/mediatek,vdecsys.txt         |    8 +
>  .../arm/mediatek/mediatek,vencsys.txt         |    1 +
>  drivers/clk/mediatek/Kconfig                  |   80 +
>  drivers/clk/mediatek/Makefile                 |   13 +
>  drivers/clk/mediatek/clk-mt8192-aud.c         |  118 ++
>  drivers/clk/mediatek/clk-mt8192-cam.c         |  107 ++
>  drivers/clk/mediatek/clk-mt8192-img.c         |   70 +
>  .../clk/mediatek/clk-mt8192-imp_iic_wrap.c    |  119 ++
>  drivers/clk/mediatek/clk-mt8192-ipe.c         |   57 +
>  drivers/clk/mediatek/clk-mt8192-mdp.c         |   82 +
>  drivers/clk/mediatek/clk-mt8192-mfg.c         |   50 +
>  drivers/clk/mediatek/clk-mt8192-mm.c          |  108 ++
>  drivers/clk/mediatek/clk-mt8192-msdc.c        |   85 ++
>  drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |   50 +
>  drivers/clk/mediatek/clk-mt8192-vdec.c        |   94 ++
>  drivers/clk/mediatek/clk-mt8192-venc.c        |   53 +
>  drivers/clk/mediatek/clk-mt8192.c             | 1326 +++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.c                |   23 +
>  drivers/clk/mediatek/clk-mtk.h                |   10 +
>  drivers/clk/mediatek/clk-mux.h                |   15 +
>  drivers/clk/mediatek/clk-pll.c                |   31 +-
>  include/dt-bindings/clock/mt8192-clk.h        |  585 ++++++++
>  36 files changed, 3310 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-cam.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-ipe.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mdp.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-scp_adsp.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-venc.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
>  create mode 100644 include/dt-bindings/clock/mt8192-clk.h
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

All patches in this series:

Reviewed-by: James Liao <jamesjj.liao@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
