Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49591C27C53
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 02:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzRS40U5/LPPmxXbUV5UdyzySjYYlr6Ws3i6/OCKy5w=; b=ZaFU0vJZUHJYRmcem+qKCs64Om
	FJ7/B7GRAJoUDz0hFHf7bUExI7d4wha5y2jCxm8+uo4uHXQEQozNOla37Y87Y13wbAPBDGOjI35Fj
	FhHWrV6T8Tuem5US2r232dhgp/r+fGiq+jMhpSKU3/OoyaR4fJztfVP+lf4IwOb3S1okmARsRg2NL
	tg5sbf9LGukrOLPup1ulGuR7MdbyVEZQFDCIsvEwqh+6yS/ktSem7+jMVixo+xvFjbIAOswrELBs1
	pFzEb8gKHbcWtvwKwacfwcsOFALxUr5/9uePxdTx8HPOXyb/lzaeSnPKEGJSer7TZuRZh1yvQjSlq
	0jnLeutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ24k-00000008qtB-1IbU;
	Mon, 17 Jun 2024 02:26:30 +0000
Received: from mail-177131.yeah.net ([123.58.177.131])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ24g-00000008qs5-1AdM;
	Mon, 17 Jun 2024 02:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UzRS40U5/LPPmxXbUV5UdyzySjYYlr6Ws3i6/OCKy5w=;
	b=YedPxTmONWBUG3jg8Fa85RpOdjBRHELvJNkIcKO6HV7zFcyPodFd9iTXzRBdZr
	q3yjw7r0GSNceXWKNvlqTW3J/y0BfpkZshwn0qpCfdifBXyiCFjuP4Sd+u9KBWzc
	ajJhXuE1iuF6yT/T6TZX2REjFPbIcIczTdNw6mjy+eBLQ=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrADnr0G9nm9mU0AMCA--.39214S3;
	Mon, 17 Jun 2024 10:26:06 +0800 (CST)
Date: Mon, 17 Jun 2024 10:26:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
Message-ID: <Zm+evaRZ6/6BOvAw@dragon>
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
X-CM-TRANSID: ClUQrADnr0G9nm9mU0AMCA--.39214S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWkur13tw1UJFyrtryxKrg_yoWkXrcEkr
	Wkt3yxuw17Jry8Cay5CF1kZF9F9Fn7X3ySqw1jgryrXrW7Zw1UJF4kur43Ga4UZw4xAF1D
	Ars7Xr1rJFWUZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8E1v3UUUUU==
X-Originating-IP: [114.216.76.201]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDx4BZVnxc0yUrgAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_192626_620137_B5682AA5 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 11, 2024 at 10:50:58PM -0700, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-npe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/meson-clk-measure.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> This is the last of the issues that I see in the soc directory
> ---
>  drivers/soc/amlogic/meson-clk-measure.c | 1 +
>  drivers/soc/imx/soc-imx8m.c             | 1 +

Acked-by: Shawn Guo <shawnguo@kernel.org>

>  drivers/soc/ixp4xx/ixp4xx-npe.c         | 1 +
>  drivers/soc/ixp4xx/ixp4xx-qmgr.c        | 1 +
>  drivers/soc/mediatek/mtk-cmdq-helper.c  | 1 +
>  5 files changed, 5 insertions(+)


