Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 01:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Cv8B2dvHUFgKOepDL9koU7Urgn6BRu3MhJ7UWWRj9A=; b=Kz1y3XpB3V7pfL
	vJx489leU8/kteKgiq3OaS7DfEkxY2AI5i++v1HlgfDCPVq+RSUsuwwFdwFKh3QqM/c+lvHmECzDf
	7Qb8u8Q7/dFb7hOqtqMO0Vi+0+6cUSNfRHQMaTt2RVklNguei28ytIw87EDSf/LRiYpzWWXQ6O71h
	hUf672ZN6AcYnLbVwliR9WW5i/jO63WmRu9OuOzQ7Y4Hqa1GQEfOL5uq/s6DA/NQf02fETVwNEdVq
	nWGOlllO5ITbUe77CX88Y//iVBzq9NKUbHIJ9p2/fwcFZmZXpMuTb9eZNWWdTG/D56AeS7tTIN39i
	jB2cXNf7n5AStnvTPOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAMIW-008BhF-Mu; Thu, 20 Jan 2022 01:31:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAMIS-008BgG-HR; Thu, 20 Jan 2022 01:31:31 +0000
X-UUID: 2b2ed0bf464b46688e11090702c11708-20220119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lu0pGA8iehHTjP6OAXM01HmUx2UP97BK0H85H6lBVS8=; 
 b=BwyZswt832oY/c6PFMo/gUU65+kLLd/UkHarVFQfjIIuVUoytrJgbsqayKUNRgqAWcvRHY1AlAFCswZCPR0t4/uM9q73xTL8v4wBFZXweYSR5AGSbhpDsoo1CRqYnRCOajX8XzJEWzVQAqnyeWpXVOkt3Mu0E5JvuCMUAs2nvs8=;
X-UUID: 2b2ed0bf464b46688e11090702c11708-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1890669426; Wed, 19 Jan 2022 18:31:26 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 17:22:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 20 Jan 2022 09:22:34 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Jan 2022 09:22:33 +0800
Message-ID: <0572e542b1a07db852c4af62d71b89ed19a1eb3b.camel@mediatek.com>
Subject: Re: [SPAM]Re: [PATCH v1 2/2] iio: adc: mt8186: Add compatible node
 for mt8186
From: Guodong Liu <guodong.liu@mediatek.com>
To: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhiyong Tao
 <zhiyong.tao@mediatek.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 20 Jan 2022 09:22:33 +0800
In-Reply-To: <20220115150208.15fb6284@jic23-huawei>
References: <20220110084841.575-1-guodong.liu@mediatek.com>
 <20220110084841.575-2-guodong.liu@mediatek.com>
 <292950d7-d057-4e66-5d0d-a5144f50f2ce@collabora.com>
 <20220115150208.15fb6284@jic23-huawei>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_173129_998038_CE8830FA 
X-CRM114-Status: GOOD (  19.04  )
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

-----Original Message-----
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com
>
Cc: Guodong Liu <guodong.liu@mediatek.com>, Lars-Peter Clausen <
lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <
matthias.bgg@gmail.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: [SPAM]Re: [PATCH v1 2/2] iio: adc: mt8186: Add compatible node
for mt8186
Date: Sat, 15 Jan 2022 15:02:08 +0000

On Mon, 10 Jan 2022 11:01:28 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 10/01/22 09:48, Guodong Liu ha scritto:
> > This commit adds mt8186 compatible node.
> > 
> > Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>  
> 
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Applied with a slight tweak to patch 2 as an earlier tidyup added
a bracket before the } in the table so make this line match as well.

Applied to the togreg branch of iio.git and pushed out as testing for
0-day to poke at it for us.  I'll be rebasing the tree after rc1 is
out.

Thanks,
Jonathan


Hi Jonathan

Thanks for you help.

Thanks,
Guodong

> 
> > ---
> >   drivers/iio/adc/mt6577_auxadc.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/mt6577_auxadc.c
> > b/drivers/iio/adc/mt6577_auxadc.c
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
> > @@ -334,6 +339,7 @@ static const struct of_device_id
> > mt6577_auxadc_of_match[] = {
> >   	{ .compatible = "mediatek,mt2712-auxadc", .data =
> > &mt8173_compat},
> >   	{ .compatible = "mediatek,mt7622-auxadc", .data =
> > &mt8173_compat},
> >   	{ .compatible = "mediatek,mt8173-auxadc", .data =
> > &mt8173_compat},
> > +	{ .compatible = "mediatek,mt8186-auxadc", .data =
> > &mt8186_compat},
> >   	{ .compatible = "mediatek,mt6765-auxadc", .data =
> > &mt6765_compat},
> >   	{ }
> >   };
> >   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
