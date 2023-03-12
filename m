Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5085FC6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFm6yXTAg8tphMrF+vb/W7hhEmjPxUyEGDwj6do8ZUE=; b=Yed4iSYLxTq3S5StHKR+9tI1xa
	kSPVJa3A0wpwhajJDHaTPAhL0hBRDo9BXfFD3hrp7wRVKVdpccagXMHdAegDTQyN/N8ij+NNnh+qI
	1IWx7Mt0CLW5iuNadpNWpq3qMtfoBrOjomKbbGa8S2oYo6Bnzb9JKGilqd1Em1jd+suD6jox0SAiV
	5DCxNdIqUCnlBbOLGcaGOOKD+0+ExbqK1KUlqxCWdjoeSWYKxUcaz3/POAr7ia3jJBn2TfvrLJLN2
	Ae9EdDSNdTjFebki9ce0KoslKLUwHq5PrJKcr7nEkslrF3c2dzVTE7MVP+w+hKLy0W/oNuQgM58/E
	9Ia3+org==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM0C-002Vpm-E1; Sun, 12 Mar 2023 13:44:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLzB-002VL3-0M; Sun, 12 Mar 2023 13:43:42 +0000
Received: from pendragon.ideasonboard.com (85-76-21-162-nat.elisa-mobile.fi [85.76.21.162])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF8CD814;
	Sun, 12 Mar 2023 14:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1678628618;
	bh=M3+2iadqGPWpajU73rzJOfscL/vSRK4MRXJAHhM3Vwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S94E3bY7StoQHAgj4Ene3ZegV2UW70uJapggOmnnq5BOLviJUieoQR8vK8iwSl4mO
	 nB7/HV5FvVhNrNav/Fa7DCJ28ZI4Ge8PLvjWiSCH37yTbot58V3FwpG2xrGmlCYlzV
	 N/5h+69TBJLuAxEGxTdow4/6Ep+WKBDw4muOuYUQ=
Date: Sun, 12 Mar 2023 15:41:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 11/28] media: platform: ti: am437x: drop of_match_ptr for
 ID table
Message-ID: <20230312134116.GL2545@pendragon.ideasonboard.com>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_064341_334381_0DA93C17 
X-CRM114-Status: GOOD (  20.81  )
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

Hi Krzysztof,

Thank you for the patch.

On Sun, Mar 12, 2023 at 02:13:01PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This

"might not be relevant" is a bit of an understatement in this case :-)

> also fixes !CONFIG_OF error:
> 
>   drivers/media/platform/ti/am437x/am437x-vpfe.c:2620:34: error: ‘vpfe_of_match’ defined but not used [-Werror=unused-const-variable=]

This driver should probably depend on CONFIG_OF, but that's a separate
issue.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 2dfae9bc0bba..fe89b8e250e7 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2629,7 +2629,7 @@ static struct platform_driver vpfe_driver = {
>  	.driver = {
>  		.name	= VPFE_MODULE_NAME,
>  		.pm	= &vpfe_pm_ops,
> -		.of_match_table = of_match_ptr(vpfe_of_match),
> +		.of_match_table = vpfe_of_match,
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

