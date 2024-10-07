Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAC2CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtqXSW0/Q2zac9n3oW8JsHdhJ8qh8TUEmTMJ6DzB6wI=; b=xAS9+1TIG9uNj01vHX3hrljxo+
	umGStVx/vCdUlMnVP0MHtIwt6++S4t1cWrFopV4f2rJAgUb0Ocy8TEy8RiNEJKkYmFjAPsuvBtpIH
	dK5JQ65yOCvGjlV41z+sxi+I1CQo9of3qv+0cI72+00SucGwlJrIQfB6gq/EtF5eO15RqqPjl3Hwk
	IdauiXqQCLGUUB+dLHO/+sqRso25mpx02uLEX+FRwBuGqpkJHy3Obk55LNS9+pLMxwno6YBz57QJq
	9r3QWdV/R3rL+4vKMP93CzJ0bC99XLtaYk9CjvHN25fVRLt2EzQoSjIAy50K68t6tecfqLmJr3i72
	Dte7jtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjGx-00000001nVr-2XFH;
	Mon, 07 Oct 2024 08:39:19 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjFd-00000001nB2-16Lm;
	Mon, 07 Oct 2024 08:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728290266; x=1728895066; i=frank-w@public-files.de;
	bh=UtqXSW0/Q2zac9n3oW8JsHdhJ8qh8TUEmTMJ6DzB6wI=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=s7E/YDfiw0ikUvrnidHc9ZKgpRom3d4iGHarFK00g2jnkVVc2foxUCPF7MkRnQCo
	 LgDCrQZX8avKIR1+WxP771Jc/0zUM6whgoLTb10smRgTZJLOyUzOJa771wMG9pZUq
	 rvtQfRWqNv8VlkF7MIUaW+DVAls5Zttk8s8slXGXoweOuQ7GhXoHeJ9aIEjUjpOAY
	 7zQ4zyJzJJYefMJxBfHl62EZ0R64sSzbASA4vw5hicshqpGUYiFI9lWwuX7D/AYvg
	 Ji66ifxX/R2272+xOiqgRFkO+aB98ROpJCpAF2ayn6KbUAYUVDj2wZDdSCpyCjvvJ
	 EyXJkN/YYz9YxNJKqA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.101] ([217.61.153.101]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Mon, 7 Oct 2024
 10:37:46 +0200
MIME-Version: 1.0
Message-ID: <trinity-2ac8c3fe-ad19-424b-ab4f-da84c42c4ae1-1728290266613@3c-app-gmx-bap03>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, eladwf@gmail.com,
 ansuelsmth@gmail.com
Subject: Aw: Re: [PATCH v2 2/2] mmc: mtk-sd: add support for mt7988
Content-Type: text/plain; charset=UTF-8
Date: Mon, 7 Oct 2024 10:37:46 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <89e54baa-0f05-47d7-8d81-68862f822c59@collabora.com>
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-3-linux@fw-web.de>
 <89e54baa-0f05-47d7-8d81-68862f822c59@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:z4a5J2wLlWmjRI+/xOzyHBo8m7kd7rV/6DvFgeVonFs3TVL+zjoT3vEXNnJSjA1rRT0Sw
 +YC5u5d46gqNRMH/lBLtPV5bXJDuov14lACGuhU6imck/2+rJxgCoAj6wHDukpsmPXM/wSElyoWP
 qiCL7AlihMPsnGk449JOJVtw2GWsKc++ZfG71miseO0XWalAb0Ixe9yjBL2QCiwEohB09yNbW4YH
 YiSbwpAr0N2LfV6vT0DD1xJrNyKBm/XiXHand3daPhrb3onkyd6I1Lp5n64GLOpwMMFU9nSEHg9+
 1k=
UI-OutboundReport: notjunk:1;M01:P0:PBivFzyeUiM=;ItkuaBFr4/dqKmnih8O3plOgMr1
 RVebIRCT01GBGX6cqg/AIGULfwOfsA8hu4ysnw2NEL7DifcgKlj0Mlfx4eQdmnuJk2nbPSgi2
 mA9YFpW6K46kl2wh6HMJ46YU6/E4C1CCI6OPStjzm1+O6hS9pY8SvHNFxYfXqd8KDiUWITDrL
 sWZO/kplCHPidteWR/dueSuI8jG5I7JoMg1S21lX8xH6I8v1WCd2A6N2R6Ejz0gw7OXfytc4N
 kuisbsdcHQNrjab9b6lfELD0T5R/BgeI+1bvCYtR7RsBduRozl4zHKxZ3Ywvk1DXp8bAGYga9
 /i8cLC7zYlK4Rc/dxkMqa5N7ZppclUcxFhX0sIpWMde67s6vpmC/Tk1/6MAtFXyksqIJ4lrmC
 yhqjWTJfL7MoVl5jQEDCFupSMd3ZwQx7R0pQY0NdbIh700dvPglY/i/YCIzrASWhyfYxxzFD0
 xKHp9DxEIdMMfKsW9pmzQif71zGwZKEpfHGp6QvfxOIFinRJOwkWqICzdariBXvj74nhrsR1S
 A8PU/wfZf+bsIJZFNslTe0TuALmcrmURstmyml3Fp0KteEsrLlX4NP0no1LosIN1C5b0qaHxV
 HQNtKw1+bGVXb8DfjBOsXkmEcBU4IJoZt5fBSQ9yUBP+IZXdxm9EeV6/uWPK9oClLsRYukRPt
 Z4ExU3g6Myt8tt8v2gED9xVRD2v4z79wdmtoXJLxZg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_013757_783205_11B2D6C0 
X-CRM114-Status: GOOD (  19.56  )
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

Hi

> Gesendet: Montag, 07. Oktober 2024 um 09:58 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> Betreff: Re: [PATCH v2 2/2] mmc: mtk-sd: add support for mt7988
>
> Il 06/10/24 17:34, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add support for mmc on MT7988 SoC.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>
> There's no need to add yet one more duplicate mtk_mmc_compatible platfor=
m
> data, nor one more compatible string to this driver, as this is exactly
> the same as mt7986.
>
> Please reuse the MT7986 compatible; in DT you'll have:
>
> compatible =3D "mediatek,mt7988-mmc", "mediatek,mt7986-mmc";

as explained in binding, the clock config is completely different (except =
first 2 also required by driver - 3-7 are optional there). mt7988 uses axi=
 and ahb clocks.

but i could of course use the mt7988 compatible with mt7986 compat data...=
but looked dirty to me so just copied the block (to allow later changes if=
 needed).

> Cheers,
> Angelo
>
> > ---
> >   drivers/mmc/host/mtk-sd.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 89018b6c97b9..6d5afe51a61d 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -571,6 +571,19 @@ static const struct mtk_mmc_compatible mt7986_com=
pat =3D {
> >   	.support_64g =3D true,
> >   };
> >
> > +static const struct mtk_mmc_compatible mt7988_compat =3D {
> > +	.clk_div_bits =3D 12,
> > +	.recheck_sdio_irq =3D true,
> > +	.hs400_tune =3D false,
> > +	.pad_tune_reg =3D MSDC_PAD_TUNE0,
> > +	.async_fifo =3D true,
> > +	.data_tune =3D true,
> > +	.busy_check =3D true,
> > +	.stop_clk_fix =3D true,
> > +	.enhance_rx =3D true,
> > +	.support_64g =3D true,
> > +};
> > +
> >   static const struct mtk_mmc_compatible mt8135_compat =3D {
> >   	.clk_div_bits =3D 8,
> >   	.recheck_sdio_irq =3D true,
> > @@ -629,6 +642,7 @@ static const struct of_device_id msdc_of_ids[] =3D=
 {
> >   	{ .compatible =3D "mediatek,mt7620-mmc", .data =3D &mt7620_compat},
> >   	{ .compatible =3D "mediatek,mt7622-mmc", .data =3D &mt7622_compat},
> >   	{ .compatible =3D "mediatek,mt7986-mmc", .data =3D &mt7986_compat},
> > +	{ .compatible =3D "mediatek,mt7988-mmc", .data =3D &mt7988_compat},
> >   	{ .compatible =3D "mediatek,mt8135-mmc", .data =3D &mt8135_compat},
> >   	{ .compatible =3D "mediatek,mt8173-mmc", .data =3D &mt8173_compat},
> >   	{ .compatible =3D "mediatek,mt8183-mmc", .data =3D &mt8183_compat},
>
>

