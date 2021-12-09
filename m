Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AE6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKkzboA3jygmYZylK90tT3Sd6oUpu8tid+5jKzM6DCs=; b=T9g+crcCi2HWQtGWW5GuDttgbd
	g7a46oMqcsMcY4SPyZiH3RBoCwMXgw+j2c/ttAH3/xeI2MY/5nYCWGeKRDxCb4Cs/gG0zT5J8HE+r
	akiT9oh8e9+ADwLj51vANOGithlkioZZKMt+HkHJ+EAatFKx4kgx/SY7ruFT/WTzPsWIEKQTsrCDq
	iQUYkQI9Gwh87J7aS/8fBJVQvVVwXRjhfhUUQdpM0lm9xkwWPhIiqgcU4Cg0BUBrq4ZXWIKyO2XkV
	rZ9CFUns7yGXh8AcseVXY/CHmgiOaIgYRWosG+729Flz4/y/CZOHOAhGsfEFPBTyr5+T4oLw0E2pO
	4BVkZDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKmc-00GRJU-7S; Thu, 09 Dec 2021 14:52:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKmP-00GRHI-9g; Thu, 09 Dec 2021 14:52:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 19D251F46A5C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639061535; bh=+X4qc0MHZgIQKkLg3q3gABPukA4A7ooEBBpVESi636k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DCd2+0AbpWvH9uGgn66Q+FpYzgAr1vK5bnGaOJ4L1uDk2Ig6G9f8bfzJAoGnEbMkF
 UaaqoPUVo4h9mvV6FRVjBrwYybgxCXXoIUXUMqiHu0AmoDIS9Dh6PDIIdMPJth+/6v
 0N48/QdUY3hRS3uEFZTBcPh+VqrY6uGVn6rNQgVpwjA0lQ+iLxXfPYYHUsfKbl+iJ0
 SVtjwDn3GocO2WzfK26zkOikP5yGgErDdX4CDWccrO/eT4s37X7Q3P9K61U+hFuRep
 k69Gp7WWTEGl8glycQbfppxOu00qctBQTfmFDS6C3vYXMq9AuQjng2WH1eVHeV470e
 FKp2elH02CErA==
Subject: Re: [PATCH] mailbox: mtk-cmdq: Silent EPROBE_DEFER errors for clks
To: Hsin-Yi Wang <hsinyi@chromium.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211209065948.1796663-1-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4080b8a4-5256-5680-1d70-017f2fed5117@collabora.com>
Date: Thu, 9 Dec 2021 15:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211209065948.1796663-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_065217_641047_B5E9F014 
X-CRM114-Status: GOOD (  18.30  )
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

Il 09/12/21 07:59, Hsin-Yi Wang ha scritto:
> Silent the error if it's EPROBE_DEFER for clks.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 

Hello! Thanks for the patch!
However, there's something to improve...

> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index a8845b162dbf..087fb7334166 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -573,7 +573,10 @@ static int cmdq_probe(struct platform_device *pdev)
>   				cmdq->clocks[alias_id].id = clk_names[alias_id];
>   				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
>   				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
> -					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
> +					dev_err_probe(dev,
> +						PTR_ERR(cmdq->clocks[alias_id].clk),
> +						"failed to get gce clk: %d\n",
> +						alias_id);

You can just return dev_err_probe(...)

>   					return PTR_ERR(cmdq->clocks[alias_id].clk);

...so this return gets removed.

>   				}
>   			}
> @@ -582,7 +585,8 @@ static int cmdq_probe(struct platform_device *pdev)
>   		cmdq->clocks[alias_id].id = clk_name;
>   		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, clk_name);
>   		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
> -			dev_err(dev, "failed to get gce clk\n");
> +			dev_err_probe(dev, PTR_ERR(cmdq->clocks[alias_id].clk),
> +				"failed to get gce clk\n");
>   			return PTR_ERR(cmdq->clocks[alias_id].clk);

Same here:
return dev_err_probe(dev, PTR_ERR(cmdq->clocks[alias_id].clk),
		     "failed to get gce clk\n");

>   		}
>   	}
> 

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
