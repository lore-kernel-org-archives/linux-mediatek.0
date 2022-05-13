Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 12:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFB5m27R0fGRNk5mxJSYkRqVQcpwjnQyt/QK6EaayTE=; b=CswELHlpqTMSep
	gFgCMnTblUwvMIAuNr5RcLCdoMRV0hHyW5TxGEHgtzFDnI0SblWpqc2X4defcPEUGtl9d1MDeEIrI
	Uyb+vTBmtDy0VDGbN0lOnDq3eopQ1vD04N4LI/O9XP4fqCj4sbEJ33UmVQDdHF8OkP5je/duZU2Qu
	VUyY9pP2ypOM6xLRO6JxmJrVP3OldrKggjmkfEuiR1nx1nN+EXOamd0rr06MOl4ffAyaJHL8v0vDM
	UOrXHXI4c6raaRiiIi07tWYlKGbWQ4AkeOKxx06GrGMKsBYtAzNMBgyBkk5VoEf4l7kjsYm55JGYA
	4pUQsYvAvGRcO7wYHQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npU56-00Fvtz-0T; Fri, 13 May 2022 12:07:40 +0000
Received: from mout-u-204.mailbox.org ([91.198.250.253])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npU4t-00FvrQ-QF; Fri, 13 May 2022 12:07:29 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4L06pL2502z9sQZ;
 Fri, 13 May 2022 14:07:22 +0200 (CEST)
Message-ID: <f6a6a581-638f-2ddf-5104-f52f11ff7dd3@denx.de>
Date: Fri, 13 May 2022 14:07:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH -next 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Cc: matthias.bgg@gmail.com, wsa@the-dreams.de
References: <20220513100819.2711845-1-yangyingliang@huawei.com>
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20220513100819.2711845-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_050728_058965_9E5F5588 
X-CRM114-Status: GOOD (  14.81  )
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

On 13.05.22 12:08, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from mtk_i2c_probe() in the error handling case.
> 
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 45fe4a7fe0c0..f117c3d9ca19 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -304,7 +304,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	if (i2c->bus_freq == 0) {
>   		dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_disable_clk;
>   	}
>   
>   	adap = &i2c->adap;
> @@ -322,10 +323,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	ret = i2c_add_adapter(adap);
>   	if (ret < 0)
> -		return ret;
> +		goto err_disable_clk;
>   
>   	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
>   
> +err_disable_clk:
> +	clk_disable_unprepare(i2c->clk);
> +
>   	return ret;
>   }
>   

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
