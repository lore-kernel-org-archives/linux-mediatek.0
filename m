Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C702C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+s0Tr88i0EZKnilT/p+vaANkUpAI81qU/b+DskZC9I=; b=Ax9Dv4Jeveq5YXZXeP2P1YKOzp
	lTK5zZmNX2soPgd++jH479wjvNgqm0T6eVwH3Frob/qY8QfkBg6zoYGVlAoA/o7vwlpukBqRHTFSL
	fKefjP1RbP1X2mqvZ+WzFfIBs5ISbuc0sn8NB52zI3TDgeFa7MDA7XEselEEJBSz8zcW33GSwHr5J
	Q+k4OwChKTMuJZ2PjOsV6jSRbz0bMtjU6o1yyEjLO8/4JHK3ny+mY1TLdsN9RyXdEFUHEzL/XBy9D
	V9PMOX3JhBcIOpJ1I2EwMamcpTOmCx5vdUJ6m6nR+pyMQbn/FQzngE+3gunW4A9jTxv0EoT+bsqFn
	gjd4S0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjRa-006COR-86; Mon, 13 Mar 2023 14:46:34 +0000
Received: from gofer.mess.org ([88.97.38.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjR8-006C7c-6R; Mon, 13 Mar 2023 14:46:09 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
	id A56CC100072; Mon, 13 Mar 2023 14:45:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1678718756; bh=SPJRtiBE7xPZNdaMyjvNHQcheMbaGg07J1nGRebzO/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZu0MaM6/9PwI7AHozOATv7eGrTxNeV50Xoh89ZkGO4ifvbHdiz18hxsTuO/yLBco
	 9XadZ5vQD/DCbTF+8ZCCrWVgbfwELO3+bhsRDfRZEP3XCnCdTlA/+qzrzBIM/QgLhn
	 3MsOUVw3ALieLxUWWnzkKQAbfC4XdR/jypFaqKaPqX+AMIYNQoD3RGO9diwJt3l/rR
	 8/M03eGACPOFX5yRWWdRx364KxUAzgP4zSnkbvTm88278RJo4hf21KruaTd2mshojs
	 lvbuEpw1LHJzQZuGzTNuD6VhZYm0203UhIP1ruuNkyMgJfsOvIXoa6UUNIVM8u/4db
	 6hxECZ1Wh78wQ==
Date: Mon, 13 Mar 2023 14:45:56 +0000
From: Sean Young <sean@mess.org>
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 05/28] media: rc: gpio-ir-tx: drop of_match_ptr for ID
 table
Message-ID: <ZA83JBcG46hjPp5w@gofer.mess.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312131318.351173-5-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_074606_398255_CCB4BBDB 
X-CRM114-Status: GOOD (  19.03  )
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

On Sun, Mar 12, 2023 at 02:12:55PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
> 
>   drivers/media/rc/gpio-ir-tx.c:24:34: error: ‘gpio_ir_tx_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Sean Young <sean@mess.org>

Thanks
Sean

> ---
>  drivers/media/rc/gpio-ir-tx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
> index 2b829c146db1..1a8fea357f14 100644
> --- a/drivers/media/rc/gpio-ir-tx.c
> +++ b/drivers/media/rc/gpio-ir-tx.c
> @@ -199,7 +199,7 @@ static struct platform_driver gpio_ir_tx_driver = {
>  	.probe	= gpio_ir_tx_probe,
>  	.driver = {
>  		.name	= DRIVER_NAME,
> -		.of_match_table = of_match_ptr(gpio_ir_tx_of_match),
> +		.of_match_table = gpio_ir_tx_of_match,
>  	},
>  };
>  module_platform_driver(gpio_ir_tx_driver);
> -- 
> 2.34.1

