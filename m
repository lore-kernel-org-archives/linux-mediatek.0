Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F15C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=312fS1oJR1cQtbLwKbfZ99ADiDgZF/diWly3J0olSr4=; b=oGwVbNdhCZlpD1
	3g3zSe10DiTLb5/ww2xk68z9F5f31Rbw0qS8s0WMbc5lCfSat7frQDjIyWTCllW75lguhSpo4gKsb
	mb7bIt/Q4ACGSUUKYBFHTaaUJAGo+kOuLdxa3UT2ltfelSP/pdrF25Cnvi8PP3u+/ovtWH7ZeI/hF
	9MtUjg4GIAQfoqQ9gjGxlc4FTjRIzY0BvzUqyXeLLIqCyl+i0c34kI+vX6xvvn3+QizqWf8m+Pip0
	vrYm398wxSRLMVMioqdmMhvMfPqMRmS6nwKssDWIYuP1oUHNRDc5T7wHM9yNuWHsqSvyhUHYmCxlG
	2asKevjZmXkZTbBr5MQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSqY-00Cco7-Eo; Thu, 21 Apr 2022 09:11:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSnE-00Caql-Gj; Thu, 21 Apr 2022 09:08:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 90C341F45275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532083;
 bh=keF4Fz3OGotsfU3GInulCO4PoeVxbMwTjw3d7ZbAlvk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bb1MiLDt5WVRhc5pZQS6j2l7V3Hq4uHiDP+kCfIHKQuV+aqzqwjwxvIDAWQu97Lzh
 LfdVIirABReOnE3Hqa2Ebv9ZPH8R/SoHojTpqfPSdOvAHH3i7is1k0KSG5xjO64gwU
 zTv9w+MhorhEHNU1QJtAQcUiDAjyfEnjChnJm+ANNQik4bWt2fn865cvQ0S2Nm2rIN
 cifi7lYzgGPRKdltTgbi5YuO81S3l5lhwbQXuQAd/q4L8ycRcZCGkPp7c6zfPGbM+x
 d8EldGH3a4j1KWXNZ0dAWWgsgjG/0t0VfbOTMhGVdSNluigdh2CrTfQlx3Xq+sfbet
 oeUtk2OFWpRLQ==
Message-ID: <d833bb7f-ee48-602d-9793-5d717d3b5582@collabora.com>
Date: Thu, 21 Apr 2022 11:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 03/12] clk: mediatek: reset: Refine functions of set_clr
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020804_733845_D5871908 
X-CRM114-Status: GOOD (  13.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> To make driver more readable, revise functions of set_clr.
> - Add to_rst_data().
> - Extract common code within assert and deassert to
>    mtk_reset_update_set_clr().
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/reset.c | 32 +++++++++++++++++++++-----------
>   1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index 9110d0b4229f..6574b19daf0f 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -20,26 +20,36 @@ struct mtk_reset {
>   	struct reset_controller_dev rcdev;
>   };
>   
> -static int mtk_reset_assert_set_clr(struct reset_controller_dev *rcdev,
> -	unsigned long id)
> +static inline struct mtk_reset *to_rst_data(struct reset_controller_dev *rcdev)

to_mtk_reset() looks more consistent, as many developers are using the naming
"to_{struct_name}".

Also, can you please mention the indentation fixes in the commit description?

Thanks,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
