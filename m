Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAEAC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mz8P8A145cMKwKse6W1eLLO9DhD8+e7R2Wf+MraeiEE=; b=cKrSTureYdgsA0ZT4daaXmvtG9
	nYDmPmfCFCVp8dgsBPRQ4myTl4Dw1WGerqjTXRbyKN5PW+BlyLXwL9HNmzVdqBKSaGQathU2O+L34
	45teKjUy1HlsafDW5aApuXVPA/Tz09/Ku/Dd8sUPHEcpxVnTG88BoAUrEs3y97SAXMrMVzkmRMHCY
	cvtudLfDhHgWIYsPsptrPjoBjRxZfpTML0eUMeGlqdCltNxhr0zvkwlyaocRuTD+OI7+3QdTNjhrf
	8DJ/A0LnaAiZqb/6i9fEv7dSbWl6v06VmnpJr42Hg9iV24ERY4tJ6D0IWdwvL5qxH1KE6lIfy9sN5
	jGjNsUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogSeJ-003JHk-Jc; Thu, 06 Oct 2022 15:18:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogSY1-003FnS-9m; Thu, 06 Oct 2022 15:12:30 +0000
X-UUID: fdf4571dc47c40c280a31926fbd02048-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mz8P8A145cMKwKse6W1eLLO9DhD8+e7R2Wf+MraeiEE=;
	b=KWRGzHBcUbg5d5+3RgUKXtlLPpmUYHGwYnkHYKjAtmdRxtFnHjExFyrsNFkp7VcFVr32kwyvAkV6vyzZyHdkz4cEXJl8TDE2U6pNkTZbsl/wpYKrdWvF5LDEfMKnV2oeLLkc82Gfgo+dEUufv6FpUv1bOvUVHo1bqIzzAY2Hbis=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b6c58b1c-86bc-4407-af83-f329c4490bb7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:5fc11ee1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fdf4571dc47c40c280a31926fbd02048-20221006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2044255003; Thu, 06 Oct 2022 08:12:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 22:42:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 6 Oct 2022 22:42:15 +0800
Message-ID: <6ca1eb83b7a776fd6b7e58e6940eab5ce5f7fb63.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] phy: mediatek: tphy: add debugfs files
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
	Tianping Fang <tianping.fang@mediatek.com>
Date: Thu, 6 Oct 2022 22:42:15 +0800
In-Reply-To: <09bc1393-dd30-3c96-3309-f822994f4aab@collabora.com>
References: <20220929080926.1272-1-chunfeng.yun@mediatek.com>
	 <20220929080926.1272-2-chunfeng.yun@mediatek.com>
	 <09bc1393-dd30-3c96-3309-f822994f4aab@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_081229_411963_4BDDC7B3 
X-CRM114-Status: GOOD (  23.03  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-09-29 at 11:02 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/09/22 10:09, Chunfeng Yun ha scritto:
> > These debugfs files are mainly used to make eye diagram test
> > easier,
> > especially helpful to do HQA test for a new IC without efuse
> > enabled.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: add CONFIG_PHY_MTK_TPHY_DEBUGFS suggested by AngeloGioacchino
> > ---
> >   drivers/phy/mediatek/Kconfig        |   5 +
> >   drivers/phy/mediatek/phy-mtk-tphy.c | 403
> > +++++++++++++++++++++++++++-
> >   2 files changed, 407 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/mediatek/Kconfig
> > b/drivers/phy/mediatek/Kconfig
> > index 3125ecb5d119..e9fdfe9f519f 100644
> > --- a/drivers/phy/mediatek/Kconfig
> > +++ b/drivers/phy/mediatek/Kconfig
> > @@ -27,6 +27,11 @@ config PHY_MTK_TPHY
> >   	  multi-ports is first version, otherwise is second version,
> >   	  so you can easily distinguish them by banks layout.
> >   
> > +config PHY_MTK_TPHY_DEBUGFS
> > +	bool "Add T-PHY Debugfs Files"
> > +	help
> > +	  Say Y here to add debugfs files mainly for T-PHY HQA test.
> > +
> >   config PHY_MTK_UFS
> >   	tristate "MediaTek UFS M-PHY driver"
> >   	depends on ARCH_MEDIATEK || COMPILE_TEST
> > diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
> > b/drivers/phy/mediatek/phy-mtk-tphy.c
> > index e906a82791bd..d9509e1314a4 100644
> > --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> > +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> > @@ -7,6 +7,7 @@
> >   
> >   #include <dt-bindings/phy/phy.h>
> >   #include <linux/clk.h>
> > +#include <linux/debugfs.h>
> >   #include <linux/delay.h>
> >   #include <linux/iopoll.h>
> >   #include <linux/mfd/syscon.h>
> > @@ -264,6 +265,8 @@
> >   
> >   #define TPHY_CLKS_CNT	2
> >   
> > +#define USER_BUF_LEN(count) min_t(size_t, 8, (count))
> > +
> >   enum mtk_phy_version {
> >   	MTK_PHY_V1 = 1,
> >   	MTK_PHY_V2,
> > @@ -310,6 +313,7 @@ struct mtk_phy_instance {
> >   	struct clk_bulk_data clks[TPHY_CLKS_CNT];
> >   	u32 index;
> >   	u32 type;
> > +	struct dentry *dbgfs;
> 
> Unused when !IS_ENABLED(CONFIG_PHY_MTK_TPHY_DEBUGFS)
Yes, it will be NULL.

> 
> >   	struct regmap *type_sw;
> >   	u32 type_sw_reg;
> >   	u32 type_sw_index;
> > @@ -332,10 +336,389 @@ struct mtk_tphy {
> >   	const struct mtk_phy_pdata *pdata;
> >   	struct mtk_phy_instance **phys;
> >   	int nphys;
> > +	struct dentry *dbgfs_root;
> 
> Same here
> 
> >   	int src_ref_clk; /* MHZ, reference clock for slew rate
> > calibrate */
> >   	int src_coef; /* coefficient for slew rate calibrate */
> >   };
> >   
> > +#if IS_ENABLED(CONFIG_PHY_MTK_TPHY_DEBUGFS)
> > +
> 
> ..snip..
> 
> > +
> > +static void tphy_debufs_init(struct mtk_tphy *tphy, struct
> > mtk_phy_instance *inst)
> 
> Please fix typo "debufs" -> "debugfs", 
Will fix it, thanks a lot

> here and everywhere else.
> 
> Apart from that, it looks good to me.
> 
> Regards,
> Angelo


