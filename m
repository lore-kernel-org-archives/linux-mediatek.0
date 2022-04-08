Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 01:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NP80H6huKgIe1lYVQJS2kvjg4QagdJqo4OPHSIt9W4M=; b=wzlxTMk0H8Wlaj
	YIsBKGBqEibhBeNxdwLRb62yAtVnQCt8Zjax1f9ECL93Rbnyr9tmYghNGUahCl/KmqNDeTa18U6v+
	K2WEQzDtZoLsZtHnIc0anTA8nJX1JlcwrfidHa3/j+gEKMYhX4KVwSNRoBzPtqJtPnShpW4SX7jbN
	aV/FsWnxPJ2Tq7y7p9vXP+jFr2dvPz9Qyl4aDTyhW5+MSv95WXMmKKX7KcxacNp2qpmCgB1sqtgIz
	d6jKlxSC7Gwaww9Lq4py5ZDtJRoj636bHfhEJ1T9iIkeyAY7dAO4dBEUphS7WNWnMBiZr/dNd3+ZN
	5TaPlPeux4qGn/MQuG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncdf5-00EZdq-AM; Fri, 08 Apr 2022 01:43:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncdet-00EZZg-Vg; Fri, 08 Apr 2022 01:43:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 313121F42799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649382210;
 bh=Kgjk0PMTnxKr4o7yne9XJVv+nnOoS8+3S6jBLjJ/RhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TgTfyumEKjt0cCM/ZqjoWMw4qAfPE810ZDss67mhG4U3BZwSRIPPbZeYBpHzpsonD
 SBrX0+vXz4qsGEHj9UsJKH5bl+f/YQs8/7jx3DB84uQHk7lWPmkEa+8WCA7QrtbhNN
 z4a4n7r77ZC3DR+u2DpHDsHRjSzJS17WAJu1AdRFxdjXrgQuzRaRXyNIKC2KfDaOkr
 uq1nujFa8JTATay3Tdr64cYzm/9ytAWEyACWIiEW2DNnocsX2shBRjfUghTUwwHClX
 u1K+BvaU0iQRkNz6D3PCrWcPHtRaP5gaweQniGubIE4kJ2x6VBKT02tn2btTEFF9+4
 pt5+O3BKOX3PQ==
Date: Thu, 7 Apr 2022 21:43:23 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, jitao.shi@mediatek.com,
 rex-bc.chen@mediatek.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: dpi: Use mt8183 output formats for mt8192
Message-ID: <20220408014323.k5imykh7btbqc4c2@notapiano>
References: <20220408011907.672120-1-nfraprado@collabora.com>
 <6afe7366ceffb77674d34c48f84aa85b1c088bc3.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6afe7366ceffb77674d34c48f84aa85b1c088bc3.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_184332_188651_7D2FAB57 
X-CRM114-Status: GOOD (  22.36  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 08, 2022 at 09:36:17AM +0800, CK Hu wrote:
> Hi, Jitao & Rex:
> =

> Please help to comment on this patch.

Hi Chuang,

I already sent a v2 of this patch [1] because I forgot to add the Fixes tag.
Sorry for the noise.

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/20220408013950.674477-1-nfraprado@collabora=
.com/

> =

> On Thu, 2022-04-07 at 21:19 -0400, N=EDcolas F. R. A. Prado wrote:
> > The configuration for mt8192 was incorrectly using the output formats
> > from mt8173. Since the output formats for mt8192 are instead the same
> > ones as for mt8183, which require two bus samples per pixel, the
> > pixelclock and DDR edge setting were misconfigured. This made
> > external
> > displays unable to show the image.
> > =

> > Fix the issue by correcting the output format for mt8192 to be the
> > same
> > as for mt8183, fixing the usage of external displays for mt8192.
> > =

> > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > =

> > ---
> > =

> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4554e2de1430..e61cd67b978f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -819,8 +819,8 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
> >  	.cal_factor =3D mt8183_calculate_factor,
> >  	.reg_h_fre_con =3D 0xe0,
> >  	.max_clock_khz =3D 150000,
> > -	.output_fmts =3D mt8173_output_fmts,
> > -	.num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> > +	.output_fmts =3D mt8183_output_fmts,
> > +	.num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
> >  };
> >  =

> >  static int mtk_dpi_probe(struct platform_device *pdev)
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
