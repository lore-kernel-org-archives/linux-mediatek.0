Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE96C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 19:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRpLd5PJ+XenuRD+8DugZABg2Pl8bD7Mo7YwHPJDXwM=; b=OS9BLzMw9J/0b+QOGY5qB9G24K
	sutnKYDjay4g3tNX14Da+v2imBnsUMTzcjFKMxmCpkh6kgzCQRmqWxdtL1JPWps63s+ius5NA1tQS
	P973znCtFTNQgsQejgSpxkK0ZlMSrB2ZFd7ACayiwvk0NMUKum09L2Rb4ZtrJJNIP+XFh5BLTcvuf
	GRCi2uyjGE8uMQX/cuLVNsN4JAnJf45Vg+KWNxCI87vTU+Bnofq73barpUG0zRUtLw5oOVMDf+I69
	s4L49lF9Kndg5erFfJlPI5KTUb/bEwFjB1qLvPSL5uVbcFDkIT1yOY5rVyUFKKx9r7nXqEggnbSC7
	x9LeQAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTzV-007iHd-6T; Tue, 08 Nov 2022 19:10:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTzK-007iFA-Dk; Tue, 08 Nov 2022 19:10:24 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 820AC6600368;
	Tue,  8 Nov 2022 19:10:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667934616;
	bh=+x4MJ+AKsMXulMyAxgCPfV7Jwz5088uT1madjdL8Tz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRDC25qS/b9DoOMeS9+X1xOhzrYzjJ0K+UMCDrdd5CzVCjVAppxTOHAWslva/SSu9
	 NL9nUjDGzLJZJpr+wMKKP9RIdrM7AaUWuJfEeWZRCIHN+eHEUsnb0EvACqTkv6W8Jp
	 4dntC6xlVsxRTOCRGoipLyVa4zRcMfGQzTqKM8Xn/11GTIkxDal0kLBGUkDnUBwt+t
	 +opiUMga30d7GKHUBZAWoImtcmjGW1RVtmNOskstabT0EELCuWZ8LQoeA2XFkk7XEc
	 teXnZwEdUPUZsMHtlNFFRq4f+Nf7dSENPvwVC6XuyIdlKeqZTtnXW2daF6ybhkdotC
	 41306fZsagfkQ==
Date: Tue, 8 Nov 2022 14:10:08 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v28 04/11] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys1
Message-ID: <20221108191008.lsasjskm7tzvpa42@notapiano>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-5-nancy.lin@mediatek.com>
 <90d8dfb1-2a37-e79a-b912-c77076e493c6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90d8dfb1-2a37-e79a-b912-c77076e493c6@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_111022_720895_0ECAB32A 
X-CRM114-Status: GOOD (  12.48  )
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

On Tue, Nov 08, 2022 at 06:46:54PM +0100, Matthias Brugger wrote:
> On 07/11/2022 08:22, Nancy.Lin wrote:
[..]
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -80,6 +80,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> >   };
> > +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
> > +	.clk_driver = "clk-mt8195-vdo1",
> > +	.routes = mmsys_mt8195_vdo1_routing_table,
> > +	.num_routes = ARRAY_SIZE(mmsys_mt8195_vdo1_routing_table),
> > +};
> > +
> >   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8365-mm",
> >   	.routes = mt8365_mmsys_routing_table,
> > @@ -292,6 +298,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
> >   		.compatible = "mediatek,mt8195-vdosys0",
> >   		.data = &mt8195_vdosys0_driver_data,
> 
> It seems we are missing a patch in the series. vdosys0 also correct was
> never introduced in the driver...

Hi Matthias,

as mentioned in the cover letter, this series is based on the series "Change
mmsys compatible for mt8195 mediatek-drm" [1], which introduces vdosys0. This
compatible entry specifically is added on patch 3 of that series [2].

[1] https://lore.kernel.org/all/20220927152704.12018-1-jason-jh.lin@mediatek.com/
[2] https://lore.kernel.org/all/20220927152704.12018-4-jason-jh.lin@mediatek.com/

Thanks,
Nícolas

> 
> >   	},
> > +	{
> > +		.compatible = "mediatek,mt8195-vdosys1",
> > +		.data = &mt8195_vdosys1_driver_data,
> > +	},
> >   	{
> >   		.compatible = "mediatek,mt8365-mmsys",
> >   		.data = &mt8365_mmsys_driver_data,

