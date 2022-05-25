Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 01:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OfoOdtjW+p1h/OjoJHDwg9pGhLzPmnJ3UazlZk2/LQ=; b=fi/DfIErlLcHR7
	HEfMTiSKikwcZkel1Ec1JDQBZ7ogzf+bqY1xM8xeHEn2MhvXCsi0EJ2+hxha6/uVduNk1o5S46zXh
	WygbmBCt+G4UweJoFpfiJ6B4rvTIFtPZM01rRJIPdEcuIHKOk2mmvLgF5G9l9nhQXo1+9nY2Iruwj
	dyhKfiXW7VnKrGtkx7qETIEosXrBuXzWKv2Y98o4rTNfm3rd1aXAOaJaxcDcmfqLaMTsd4BQ6npKa
	M1tPPWsXNT40S0zXKRhPZD43M9Qjz0AELWzuW3qkvtxsbfh/Sjgl5QvnprKn2z2HZc61sN1XhrrVs
	Sp6EUT4rcc4qm+DJunfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntgD2-009gMs-Ui; Wed, 25 May 2022 01:53:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntgCC-009fxw-Ld; Wed, 25 May 2022 01:52:22 +0000
X-UUID: 6edcfbcc4aba41e7b1492c6284669a09-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:294101bf-7058-452e-9d2d-ea0861fde8bd, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:ce785747-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
 l,QS:0,BEC:nil
X-UUID: 6edcfbcc4aba41e7b1492c6284669a09-20220524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1562698065; Tue, 24 May 2022 18:52:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 18:45:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 09:45:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 25 May 2022 09:45:48 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <lkp@intel.com>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <kbuild-all@lists.01.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <wenst@chromium.org>
Subject: Re: [PATCH v2 4/7] clk: mediatek: mt6779: use mtk_clk_simple_probe to
 simplify driver
Date: Wed, 25 May 2022 09:45:48 +0800
Message-ID: <20220525014548.19749-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <202205242129.DezL7Tp0-lkp@intel.com>
References: <202205242129.DezL7Tp0-lkp@intel.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_185220_761568_34DE0D83 
X-CRM114-Status: GOOD (  12.75  )
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

> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/imx/clk-imxrt1050.o
> ERROR: modpost: "vmf_insert_pfn" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!
> >> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-aud.ko] undefined!
> >> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-aud.ko] undefined!
> >> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-vdec.ko] undefined!
> >> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-vdec.ko] undefined!
> >> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-cam.ko] undefined!
> >> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-cam.ko] undefined!
> >> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-ipe.ko] undefined!
> >> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-ipe.ko] undefined!
> ERROR: modpost: "imx_clk_hw_pfd" [drivers/clk/imx/clk-imxrt1050.ko] undefined!
> WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

Thanks for the testing.
This patch depends on another patch [1], so I will just ignore this report.

thanks,
Miles

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
>    Depends on HAS_IOMEM && DRM && MMU
>    Selected by
>    - DRM_SSD130X && HAS_IOMEM && DRM
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
