Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB54EC87FCF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Aug 2025 07:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjn7iFOjPRb8qVGhwqQkhAl0V4bzxrYAWCtxnBYOqC4=; b=Lv1sczPwnNEjANckJTD1MP00Gg
	+REaSZYY3akHLl5Wm8gdFOA35jvQm/dCOZQt5kQ6BMIir6T7ijkFZA+KwvLrjq4mAbqIOz+GJm5PC
	ubuX3hcvy38pGIaTiZnOAsBdZfR6dU0D8DsX8552RJT3LUfZHJO+oWJVkAUJLuCUUm8t2GyhbQQJj
	eJHV5VoaTKQscGEAzS+KfQJJ0kKm1C4Me1bkbp4qZsKZtqW4iAn0ZNJys5sA7l3Gk6fNC8q8yQHkZ
	aS7ZeUJALslFFDdvGRjBCAh6GgM9rKw5CRcIA9YgyhLiWf7hDF0XjULuXyeS1ew1RYqnkisz4c00c
	1mYiznbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujudc-0000000HPtG-0IuL;
	Thu, 07 Aug 2025 07:02:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujua0-0000000HPI5-2R7v;
	Thu, 07 Aug 2025 06:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF050437A3;
	Thu,  7 Aug 2025 06:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3474EC4CEEB;
	Thu,  7 Aug 2025 06:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754549903;
	bh=tNf8yXWpoqOnHiYWPw3fqpNsTnL+1s/P0u4Xeao7oac=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=FiIz5oVgOYMO6q4869RWcOtlVdu9nL+0h0TxLPttL1GsnNHj8WeGZvdTa0hQ9g2IF
	 b2wpXZEdscZwcYTFUfD3Vak7J29IVobTHxanKkkz14AEYU/ukIZ++vsVvVAw99umRg
	 fszGhSjaHM5r+e6TZDl+fqCQot/inXgAQ76e8uSvp7C7I/EYbVds7D778J5GQxDrvP
	 K/8R8NLvCgWzWtfarV/vXEHBez0mayIYSmeKfaDsccXFY1Pe71Jfa20pHWGtm9MUgF
	 6fVTDAxHrEq3NGzLwa0Z2/p/Q8or6h4Ic4LhSq8VFOMX6ph8bptUk/1SV7iMmp4cMZ
	 528aoa8dBtCjQ==
Message-ID: <d8875dea-aa04-41fc-b1b4-519d06ed6cba@kernel.org>
Date: Thu, 7 Aug 2025 08:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 58/65] media: zoran: Remove access to __fh
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar
 <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-58-eb140ddd6a9d@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250802-media-private-data-v1-58-eb140ddd6a9d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_235824_668734_E2EE0631 
X-CRM114-Status: GOOD (  20.65  )
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

On 02/08/2025 11:23, Jacopo Mondi wrote:
> The __fh parameter is assigned to an unsued variable. Remove it
> and remove the unused struct zoran_fh type.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/pci/zoran/zoran.h        | 6 ------
>  drivers/media/pci/zoran/zoran_driver.c | 3 +--
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
> index 1cd990468d3de9db8b14b72483972041c57bfee2..d05e222b392156bf1b3b4c83c6591db642c3c377 100644
> --- a/drivers/media/pci/zoran/zoran.h
> +++ b/drivers/media/pci/zoran/zoran.h
> @@ -154,12 +154,6 @@ struct zoran_jpg_settings {
>  
>  struct zoran;
>  
> -/* zoran_fh contains per-open() settings */
> -struct zoran_fh {
> -	struct v4l2_fh fh;
> -	struct zoran *zr;
> -};
> -
>  struct card_info {
>  	enum card_type type;
>  	char name[32];
> diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
> index f42f596d3e6295e31e3b33cd83c5f7243911bd30..ec7fc1da4cc02f5a344cb49bb9a783c41c758195 100644
> --- a/drivers/media/pci/zoran/zoran_driver.c
> +++ b/drivers/media/pci/zoran/zoran_driver.c
> @@ -511,12 +511,11 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,

This driver uses __fh as the name for the second argument of the ioctl
callbacks. Can you take this opportunity to rename it to either 'fh' or 'priv'?

Generally it's not a good idea to prefix variables with __ for no good reason.

Grepping for __fh also shows two other drivers:

drivers/media/platform/chips-media/coda/coda-common.c:#define fh_to_ctx(__fh)   container_of(__fh, struct coda_ctx, fh)
drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h:#define fh_to_ctx(__fh) container_of(__fh, struct s5p_mfc_ctx, fh)

I think it is a good idea to rename __fh to fh there as well.

Regards,

	Hans

>  			       struct v4l2_format *fmt)
>  {
>  	struct zoran *zr = video_drvdata(file);
> -	struct zoran_fh *fh = __fh;
>  	int i;
>  	int res = 0;
>  
>  	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
> -		return zoran_s_fmt_vid_out(file, fh, fmt);
> +		return zoran_s_fmt_vid_out(file, __fh, fmt);
>  
>  	for (i = 0; i < NUM_FORMATS; i++)
>  		if (fmt->fmt.pix.pixelformat == zoran_formats[i].fourcc)
> 


