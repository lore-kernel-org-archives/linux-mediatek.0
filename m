Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE543ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxFHxw5tUjZxCZ2GBgc9GYMmh2Gtq2Cyp8o30geZz5o=; b=mJndsNKAS3Di6IOIkv6XzZxKll
	o6VAMFMheHeSZ6T/T6h7XvjQ4i9MGTNf99L4rmruxalFz5U+2b9wsnFG9nTLGZz7ZkABd5yq8XxS4
	+4bVEMCmH+JMwfxLNKl8iv6+vaDpq8ns6F7I+9n73LhZkNqLrrqUVWgBZkKNt3quMmhl5Fle1YCVQ
	NHtliMg4fApNDro5lLcbhZtLRlrAqo6n9e21tG6wBD4CyC1pjlVEVswgS9qEegUjq/MPNYQUdpznx
	Thhl6r0AC+KfZyLUelnbt8iMPLxyQYO2itX5dD9W97hIb/zjdNJ6XFTLPbQbyYrk6J4lb522FNDG1
	kXy+aFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScc9-007ruk-D0; Mon, 29 Aug 2022 11:07:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScbn-007rfu-0R; Mon, 29 Aug 2022 11:07:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id d5so4064757wms.5;
        Mon, 29 Aug 2022 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kxFHxw5tUjZxCZ2GBgc9GYMmh2Gtq2Cyp8o30geZz5o=;
        b=MA697DqQnMRrj6wgc66/A7msIAa4J9t7qWMk4UU6vZlGylRqlyl1K39To1Un5SrE1t
         gbzkXv25oTELyejHii9cCIhCpCpg5WI9Ml7I0E39Df4Uy4gOYwbNw7Gaqgbe+g1b6d10
         6VmVqpthoJpxDAnk7ELjKF0d4i25zbI8ZMrJvgb0N7uyUT9dMPpQnfbveBY0CUNQWX1j
         zbtfTeQvp7QlfZ3awSHBT4YWYklV0KSO2NYAu/YwJ5ZAg80nPdxUqZi+cMk2mUmeRiKk
         e4DS3+qEaz1BoJB/i5R3Ma7aTJl4cn/qw5UZ4M8VV3+vgOYaBwlhpZsjm6VPVQQ9r1wH
         doZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kxFHxw5tUjZxCZ2GBgc9GYMmh2Gtq2Cyp8o30geZz5o=;
        b=7xPQYhkU2Yz3RCG9d38YA2sFlu2IanhX90eX5wV6fLdpldxpiojyHYGrYzlj4i4gPB
         a97gjdshnMI3s0eRb8rwhVIPFvpxNGWpN36HnL50bPACRvDmhvFU6OtCX/L0yYPoz1Aw
         JW9F//VppSDr5+/V83sa0FTNYFvgfsw0GMUNsOjEq2aJD3LUr+wnGaBHqmA7XzWQc2Dl
         oeukk8aP0sWbQ445EoniAhntUkKbU5q3yasN/AAeenzOn84SWa3XM6RCiJ2Jb19Ez+ov
         dVAis3Kn8kooeT0hKwj1UBvijlTRr7fU8yZSb8AET2DCjKnrDmUFdehL57lzwAiE83zK
         zg6A==
X-Gm-Message-State: ACgBeo0JwAYT6oqnvcb79z8Kkdxj+R0dEsns7YzhpjTm3mljJYmS0pSC
	fpAo74wmL5y0nr3+qKXwiCs=
X-Google-Smtp-Source: AA6agR4b6FUzmJBDIZ/3/4jEr5QLoLgJC9eT6kBwOwTgAV4f0sHGu25uZEhVI+lmiHK5yZIKCNDmWA==
X-Received: by 2002:a05:600c:4f92:b0:3a5:f545:a6ce with SMTP id n18-20020a05600c4f9200b003a5f545a6cemr6268545wmq.149.1661771225707;
        Mon, 29 Aug 2022 04:07:05 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id w17-20020a5d6091000000b002237fd66585sm6710878wrt.92.2022.08.29.04.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 04:07:04 -0700 (PDT)
Message-ID: <778646cb-1b25-52d7-abd5-274757f40e93@gmail.com>
Date: Mon, 29 Aug 2022 13:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 1/4] spi: mt7621: Fix an error message in
 mt7621_spi_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, broonie@kernel.org,
 gregkh@linuxfoundation.org, neil@brown.name, blogic@openwrt.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
 <928f3fb507d53ba0774df27cea0bbba4b055993b.1661599671.git.christophe.jaillet@wanadoo.fr>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <928f3fb507d53ba0774df27cea0bbba4b055993b.1661599671.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_040711_149202_653E5938 
X-CRM114-Status: GOOD (  18.46  )
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



On 27/08/2022 13:42, Christophe JAILLET wrote:
> 'status' is known to be 0 at this point. The expected error code is
> PTR_ERR(clk).
> 
> Switch to dev_err_probe() in order to display the expected error code (in a
> human readable way).
> This also filters -EPROBE_DEFER cases, should it happen.
> 
> Fixes: 1ab7f2a43558 ("staging: mt7621-spi: add mt7621 support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/spi/spi-mt7621.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
> index b4b9b7309b5e..351b0ef52bbc 100644
> --- a/drivers/spi/spi-mt7621.c
> +++ b/drivers/spi/spi-mt7621.c
> @@ -340,11 +340,9 @@ static int mt7621_spi_probe(struct platform_device *pdev)
>   		return PTR_ERR(base);
>   
>   	clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(clk)) {
> -		dev_err(&pdev->dev, "unable to get SYS clock, err=%d\n",
> -			status);
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
> +				     "unable to get SYS clock\n");
>   
>   	status = clk_prepare_enable(clk);
>   	if (status)

