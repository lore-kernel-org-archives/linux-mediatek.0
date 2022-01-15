Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9763EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nme2edjxIQ+eHRC4yP0txWyW3Ff//3tCLUtLny294xw=; b=BCs/GPL6uI6uo3
	TDTBpLWj8EsslogxVZZQjvhPLledrLo6q7PABjc00a9zJ74uWCPlWl7SJ8KPGF/tsPwHhiKg0laTo
	MuUtAh6DXLkZaUrlc64ckuHn2SG2JobPP+ixyEsbSSTBsOO2pkx3cQsKlBqz/BVrvegRmoW5mtDnT
	OHrZGntTnivm1RrqnH8eSboHc2+pfNDmQ2sWA+HWyc7YzUqvNOzHoBZXvexOEknSIm3kqXPmw0q2v
	WFcVBEKOY32GSR5UwNFdVbvuAs2nr7isA29dvvRVNRSlPWGACtLPpHSWAp42p44LBeLXWMHlWabVy
	HTawpbkVwLZfw15deA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8kTt-00BBk0-1K; Sat, 15 Jan 2022 14:56:37 +0000
Received: from haggis.mythic-beasts.com ([2a00:1098:0:86:1000:0:2:1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8kTh-00BBiL-Ko; Sat, 15 Jan 2022 14:56:27 +0000
Received: from [81.101.6.87] (port=47186 helo=jic23-huawei)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <jic23@jic23.retrosnub.co.uk>)
 id 1n8kTV-0000NS-RE; Sat, 15 Jan 2022 14:56:14 +0000
Date: Sat, 15 Jan 2022 15:02:08 +0000
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Guodong Liu <guodong.liu@mediatek.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 2/2] iio: adc: mt8186: Add compatible node for mt8186
Message-ID: <20220115150208.15fb6284@jic23-huawei>
In-Reply-To: <292950d7-d057-4e66-5d0d-a5144f50f2ce@collabora.com>
References: <20220110084841.575-1-guodong.liu@mediatek.com>
 <20220110084841.575-2-guodong.liu@mediatek.com>
 <292950d7-d057-4e66-5d0d-a5144f50f2ce@collabora.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-BlackCat-Spam-Score: 19
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_065625_723713_95EA2615 
X-CRM114-Status: GOOD (  16.75  )
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

On Mon, 10 Jan 2022 11:01:28 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 10/01/22 09:48, Guodong Liu ha scritto:
> > This commit adds mt8186 compatible node.
> > 
> > Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>  
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Applied with a slight tweak to patch 2 as an earlier tidyup added
a bracket before the } in the table so make this line match as well.

Applied to the togreg branch of iio.git and pushed out as testing for
0-day to poke at it for us.  I'll be rebasing the tree after rc1 is out.

Thanks,
Jonathan

> 
> > ---
> >   drivers/iio/adc/mt6577_auxadc.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> > index d4fccd52ef08..fb08d761589a 100644
> > --- a/drivers/iio/adc/mt6577_auxadc.c
> > +++ b/drivers/iio/adc/mt6577_auxadc.c
> > @@ -46,6 +46,11 @@ struct mt6577_auxadc_device {
> >   	const struct mtk_auxadc_compatible *dev_comp;
> >   };
> >   
> > +static const struct mtk_auxadc_compatible mt8186_compat = {
> > +	.sample_data_cali = false,
> > +	.check_global_idle = false,
> > +};
> > +
> >   static const struct mtk_auxadc_compatible mt8173_compat = {
> >   	.sample_data_cali = false,
> >   	.check_global_idle = true,
> > @@ -334,6 +339,7 @@ static const struct of_device_id mt6577_auxadc_of_match[] = {
> >   	{ .compatible = "mediatek,mt2712-auxadc", .data = &mt8173_compat},
> >   	{ .compatible = "mediatek,mt7622-auxadc", .data = &mt8173_compat},
> >   	{ .compatible = "mediatek,mt8173-auxadc", .data = &mt8173_compat},
> > +	{ .compatible = "mediatek,mt8186-auxadc", .data = &mt8186_compat},
> >   	{ .compatible = "mediatek,mt6765-auxadc", .data = &mt6765_compat},
> >   	{ }
> >   };
> >   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
