Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C9CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AN1cVLBgugs37jRMdi1EYQcUllYuzRoRoeYvDPh8Gd8=; b=kTXGecVI9Hs678
	xRDIVvFzNfcPJVX+dfsXvUyCYQ/g6Vea1agJnV5L5y5eqAuZ7F51X4zJ0g65iJEzd4asv99lDKfMg
	xOJZT77+dTfDAhKvN2iRLlK3GorgJuRnmdK6uJHu3PuS4iM41bHj+GhWGST/I9oIQYmhYt2enNFac
	JcdxbS93WnjQbP0uHq7GiIwi+wl5UYhTJka18QBoNO0DTkRIV8O/0PPQyD0W9SD0QwPUF2VOq+LTb
	jO//NbHEAWcvMvkC8cqmqAlR7+Y2LZ4eWC1P4aFV38RHSIg4c5MU1RIINbbH+SWOmQl7Sx3Jul+xi
	+68vjIh9IEaTaIjhKj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSow-00Cbmf-Hm; Thu, 21 Apr 2022 09:09:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSn4-00Cal0-EJ; Thu, 21 Apr 2022 09:07:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AED2A1F45275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532072;
 bh=YhirVsiU72VmlViC0qF9dJVu+SZvUIko/Y4uOCGf3MI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AYLSWEI419fRBsa/VH6DZe33qRGRWn+AvtYeJmCTbyhRxr7uRbmfEpoOKftWN7RYN
 BeyJmuzVrRfedyxDyZ5R89L6PJh6Pp0x/lxraEqvz/kvlCfU1F3kcUiWCAX4g0Y54e
 hEG3EMstHWlXTu30rwEO5Bi2IGI7w6g+bhi1UJ+xTD3JGNDmqgdTIn1RbCm+jkUcXJ
 wptat8V+y4M7tnFn8g3t+pQFoaQOIie0b96DbhP8VSdnmCZ6LS6+KxnttmUfE7zmhn
 OKJqNQxVSM6maCH3/Sf0KRP5zb7rilWYixPLnCsbF4vb5qlLPZiMsJAJ7yCiw+EAzD
 0EQ622FZGi8fw==
Message-ID: <dc2018a0-d981-acf3-9822-f01529782aa6@collabora.com>
Date: Thu, 21 Apr 2022 11:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 07/12] clk: mediatek: reset: Add return for clock reset
 register function
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
 <20220420130527.23200-8-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-8-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020754_716396_2467847D 
X-CRM114-Status: GOOD (  12.49  )
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
> To make error handling, we add return for mtk_clk_register_rst_ctrl().
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/reset.c | 14 ++++++++------
>   drivers/clk/mediatek/reset.h |  4 ++--
>   2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index d67c13958458..b164b1da7dd3 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c

..snip..

> @@ -103,6 +103,8 @@ void mtk_clk_register_rst_ctrl(struct device_node *np,
>   		pr_err("could not register reset controller: %d\n", ret);
>   		kfree(data);

If you return for all error conditions, you can return 0 at the end, so here:

		return ret;

>   	}
> +
> +	return ret;

and here:

	return 0;

>   }
>   
>   MODULE_LICENSE("GPL");


Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
