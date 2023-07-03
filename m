Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6C0C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBBrl2yRmSkTrSTgs6u/GAQ2TomFF1IMcnAHdsHESwo=; b=XWbQs+ylgCidrMd4p7EOOL3XlL
	diJTP8LJxikjxfNfcer2H5nb4kG0UolBmhtB1KxtmqkJsDT8LM5a6ZTqKA5EbWof69mASAGoPl8KO
	qNJneWpFR0/WnU7CURSXyCNt93w4NMiGQmJUC5BN1qLN/ofS2KeKZGv3RWIfIr7SbOcbQ3Ve7o8wl
	cFZCooKayN0iyDOaFgELGtk5UkwgTbiIM5spn3LvtTpLSihnTtSNikUxUrrwG1b/xUuiS3u49B+Ps
	CXi8+fAC2D6rmCtvEkV9leDFHJxaGspqiPIcnVPK15Y41vrB23k8Fkpz+v/y/t6VDyYJAwSjwRW+B
	FGvHFOhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIWB-00AShP-00;
	Mon, 03 Jul 2023 12:18:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIW8-00ASg0-04;
	Mon, 03 Jul 2023 12:18:57 +0000
Received: from pendragon.ideasonboard.com (85-160-45-219.reb.o2.cz [85.160.45.219])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A02C2512;
	Mon,  3 Jul 2023 14:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1688386689;
	bh=fHLoFwnP7N99CrLDMZJdiDw1fOyEzuyRgMPQdQXI1bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BeL/PXXMRb5rPrT9rJQ8tmN4prPUpakUuz4df5PMhJs27sLZ7P4kNDeafB1Icx4tX
	 eBuib0hIyGK/MxkYdkwj1F13VU5uOxsYcdn7PeldXy1lTut1BVoJhmuxSBwR7H6oFO
	 QMPMnGdAJiZKAczkIOUqB8QKQVApL8w3eoNFfLV0=
Date: Mon, 3 Jul 2023 15:18:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Message-ID: <20230703121853.GA16531@pendragon.ideasonboard.com>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-3-jstephan@baylibre.com>
 <CAAOTY_-qu2RWr496wXxc1Cp14eZfzKt4QgEH8fJns2LOjpwi8Q@mail.gmail.com>
 <CAAOTY_9SFRMb7d3c62SVDnZY00hRAZ=9wBi9QCcv1UKuc8iBtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAOTY_9SFRMb7d3c62SVDnZY00hRAZ=9wBi9QCcv1UKuc8iBtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_051856_234217_9FCAC88D 
X-CRM114-Status: GOOD (  17.63  )
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

On Sun, Jul 02, 2023 at 05:20:25PM +0800, Chun-Kuang Hu wrote:
> Chun-Kuang Hu <chunkuang.hu@kernel.org> 於 2023年7月2日 週日 上午7:35寫道：
> > Julien Stephan <jstephan@baylibre.com> 於 2023年6月30日 週五 下午6:05寫道：
> > >
> > > From: Louis Kuo <louis.kuo@mediatek.com>
> > >
> > > This will add the mediatek ISP3.0 seninf (sensor interface) driver found
> > > on several Mediatek SoCs such as the mt8365.
> > >
> > > Then seninf module has 4 physical CSI-2 inputs. Depending on the soc they
> > > may not be all connected.
> > >
> > > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > >
> >
> > [snip]
> >
> > > +
> > > +static const struct mtk_seninf_conf seninf_8365_conf = {
> > > +       .model = "mtk-camsys-3.0",
> > > +       .nb_inputs = 4,
> > > +       .nb_muxes = 6,
> > > +       .nb_outputs = 4,
> > > +};
> > > +
> > > +static const struct of_device_id mtk_seninf_of_match[] = {
> > > +       {
> > > +               .compatible = "mediatek,mt8365-seninf",
> > > +               .data = &seninf_8365_conf,
> >
> > Now only support one SoC, so it's necessary to select the SoC data and
> > you could directly place the data in the code. After support other
> 
> Typo.
> 
> Now only support one SoC, so it's not necessary to select the SoC data
> and you could directly place the data in the code.

I think Julien has visibility on other SoCs that could use the same
driver, and has designed the mtk_seninf_conf structure accordingly. I'll
let Julien confirm (or tell I'm wrong).

> > SoC, so we could know what should be placed in struct mtg_seninf_conf
> > (Now we have no any information).
> >
> > > +       },
> > > +       {
> > > +       },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);

-- 
Regards,

Laurent Pinchart

