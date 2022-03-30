Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 08:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGE2louLzir5NYDR7HeMDXagNMsGDBNpkY2EMmpu+6Y=; b=y21RIaKRSES3v2
	7d1+nZy13LwGfWnvWttr06+OGUBYcuMHdBFy37dpuFumLbK8XoXgUc8Y5xCdz2rdSP0K3kugJyWIP
	HuRoTSrQIlnjGN9kuLrUOz4iNwTPubFfBkd0spmQ/dK6gnd5JQV996IDGAprdo7bMbSsCAgGW+9pb
	qCBhBrUb/Ef9FlQF9UoHoba/ltq35V08OBOYwd7cqCYhNMUjztVx2DELT3bTgSDJ6dGc7XnsY5eWD
	5ZvfRYyFFz381pviFmrSdhTtGSOUOZUJlDvBivGNN6ndKsqjl4OoN43LM7k1xwPvdFkF2/E++4fVV
	ukqpA4VWkGpoPERBR5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTIm-00Eg42-4a; Wed, 30 Mar 2022 08:03:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTIW-00Efx0-Rg; Wed, 30 Mar 2022 08:03:22 +0000
X-UUID: 53786f68ff9748fc8712389bf7617b0a-20220330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7FMydj6GnNvXa5kYOeWCe3n0PhnDs2gYPBiQbEa5L88=; 
 b=UQp4uLO2ISEbza5Fbe4XGpTm3bPkE4hdt+n+QQc9buIJn8AichZqnJ4HaLG3gOHLVaqiQfdSAwnOkstR8fUIsi4Xg3b+NP7EeT3GbDm7n7R/B6gYtga8Y0Uq2hBV1RzHqdMaiegKcId+7i/heVovjpF87CIXdLhKtAxWufAaFDE=;
X-UUID: 53786f68ff9748fc8712389bf7617b0a-20220330
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 682766011; Wed, 30 Mar 2022 01:03:13 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 01:03:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 30 Mar 2022 16:03:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 16:03:09 +0800
Message-ID: <e0a6e55bdcb4cb2f4d862c7fe6d9757cd559936f.camel@mediatek.com>
Subject: Re: [PATCH v9 2/3] mmc: core: Add support for SDIO wakeup interrupt
From: Axe Yang <axe.yang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian
 Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 30 Mar 2022 16:03:09 +0800
In-Reply-To: <e9daf657-2a29-a4b1-158a-86f2a98a8900@collabora.com>
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-3-axe.yang@mediatek.com>
 <e9daf657-2a29-a4b1-158a-86f2a98a8900@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_010320_924292_590440D6 
X-CRM114-Status: GOOD (  12.78  )
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

On Tue, 2022-03-29 at 12:33 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/03/22 05:29, Axe Yang ha scritto:
> > If wakeup-source flag is set in host dts node, parse EAI
> > information
> > from SDIO CCCR interrupt externsion segment for in-band wakeup. If
> > async interrupt is supported by SDIO card then enable it and set
> > enable_async_irq flag in sdio_cccr structure to 1. The parse flow
> > is
> > implemented in sdio_read_cccr().
> > 
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> 
> Hello Axe,
> there was a mistake about my tag (my fault, sorry), can you please
> change it from
> Acked-by to Reviewed-by?
> 

Sure, will update that in next version.

Regards,
Axe Yang
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
