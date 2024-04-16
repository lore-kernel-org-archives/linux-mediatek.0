Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE67C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0TwC4jTFZQFcvPHoRsQ3cnPpheXhD0mrnYwFfdBLMw=; b=usZySpfhRYWLH9BCWitDgs9wpg
	X7OEf5vhP5eZzTUhLJ/QKuT0GHav6f9ZLyH+vXfouykygjyMMrrqx9FLsppflBkr0rGrBncgJShbA
	VuaF82vdCqp5E3YTHGHaviYnKbJGiF904eq13LDtQ3RiEJILipKKuO/5le4AVygF7FwqhqI5T/pDZ
	3zft7J5vviN+C/zyujslY8AwuaP00ijg5DCRc5cNW2BTHjdJEvWn5JhKXs+Ylgd+6nNo8SJOLW26a
	Gi8gEfo2Ndc3AHKT7uvj+QnNXClwDv/XsFlgTlxxGe59qwpaON0ne6POmJMlU0+vE4Iz5Th/lvXJA
	YAd9IZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwh1E-0000000ByET-2Fxw;
	Tue, 16 Apr 2024 11:30:32 +0000
Received: from mx.gpxsee.org ([37.205.14.76])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwh1A-0000000By9y-271y;
	Tue, 16 Apr 2024 11:30:30 +0000
Received: from [192.168.4.14] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 9583E3B254;
	Tue, 16 Apr 2024 13:30:06 +0200 (CEST)
Message-ID: <0bea915c-ddad-44b6-ade1-187307da504b@gpxsee.org>
Date: Tue, 16 Apr 2024 13:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] media: pci: mgb4: Refactor struct resources
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-1-477afb23728b@chromium.org>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20240415-fix-cocci-v1-1-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_043028_723055_8BC16D88 
X-CRM114-Status: GOOD (  15.84  )
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

On 15. 04. 24 21:34, Ricardo Ribalda wrote:
> The struct resource end field is inclusive not exclusive, this is, the
> size is (end - start) +1.
> 
> Update the definitions and use the generic resource_size() function.
> 
> Fixes cocci check:
> drivers/media/pci/mgb4/mgb4_regs.c:13:22-25: WARNING: Suspicious code. resource_size is maybe missing with res
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/pci/mgb4/mgb4_core.c | 4 ++--
>   drivers/media/pci/mgb4/mgb4_regs.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
> index 9bcf10a77fd3..60498a5abebf 100644
> --- a/drivers/media/pci/mgb4/mgb4_core.c
> +++ b/drivers/media/pci/mgb4/mgb4_core.c
> @@ -493,13 +493,13 @@ static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	struct mgb4_dev *mgbdev;
>   	struct resource video = {
>   		.start	= 0x0,
> -		.end	= 0x100,
> +		.end	= 0xff,
>   		.flags	= IORESOURCE_MEM,
>   		.name	= "mgb4-video",
>   	};
>   	struct resource cmt = {
>   		.start	= 0x1000,
> -		.end	= 0x1800,
> +		.end	= 0x17ff,
>   		.flags	= IORESOURCE_MEM,
>   		.name	= "mgb4-cmt",
>   	};
> diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
> index 53d4e4503a74..31befd722d72 100644
> --- a/drivers/media/pci/mgb4/mgb4_regs.c
> +++ b/drivers/media/pci/mgb4/mgb4_regs.c
> @@ -10,7 +10,7 @@
>   int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)
>   {
>   	regs->mapbase = res->start;
> -	regs->mapsize = res->end - res->start;
> +	regs->mapsize = resource_size(res);
>   
>   	if (!request_mem_region(regs->mapbase, regs->mapsize, res->name))
>   		return -EINVAL;
> 

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>


