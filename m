Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3297C0502C
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC2z2S0UwWbCBQWC61peReEpzfQqE30gd7vkm5v9A+Y=; b=tcoAeYXDloNTbTOe+XYgE8Fm6G
	gYaPdN8ifPWOvzmK7zeLjX/M0t6ZYxWNDjLTanzRM/CwwGPSEZlgLKOceWaVXXL1B6nSzhODZxait
	kTzkkNTXuEvR1oAOflQRdS4r182oQXj9bUG/gnAz+u+kmKigVoKrd900FqRPaIMW+KudjpxWPYy94
	e5PL+cOhcPTR2FFdoeu6NuZP2WwXQHu6Xv7uT0iJ+j1O+GxSWFVFtXkWaVLEb3cGFbpwDpi32jnKO
	/w+6fINkDW8QXAKHEF2jQ5BY1ime98T47CcpKlihmwv/OEfxXRauXWHLxu5I355oEZzjLtee2FMUR
	awWu5avw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScl1-007zVd-8R; Mon, 29 Aug 2022 11:16:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSckm-007zI2-Tn; Mon, 29 Aug 2022 11:16:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id bs25so9752898wrb.2;
        Mon, 29 Aug 2022 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bC2z2S0UwWbCBQWC61peReEpzfQqE30gd7vkm5v9A+Y=;
        b=TT8TUuHWP/Ind+i6ru55YUCFWkRSLo4/NeccX8TZMsM0K6Pw5Fb7RTvCqfWvHQ3xZw
         gz4rfqX6fE/rofQHoqIXEppjNGDW15/LDakiyY75YKaLMtMAuH+FFkyVodMb1EN1isee
         p6gr5ne2qN3XOeWRyyvuZt3YCIsy6HVQ6FSnzZ8leiR+STMIHg/i5kLT+xF3x1yuQPxp
         REOYMnWKyE2yQo8RhZ/9hDaRozzKjexoSMKsoxNm2KyVy0pTP62IptYVvSfJvWg7+4kn
         YVm3sjcaH/amZ5yGwDEvZ+1JBL3rzDX/lU9D5HSXvxPKhB6wx4rNfTf+U9qnTBtCBMN2
         /nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bC2z2S0UwWbCBQWC61peReEpzfQqE30gd7vkm5v9A+Y=;
        b=22wBM+Kw0EbQHrrkVG6KL0tdsbCf1kZhUqx/bJQiakxEOkSIhlsHNCpMZatFiTrbnt
         38fR0aANEfTVIeqIHZON8V/+ESPKvo/pZ/24f0bvf5j4FjjEk49vkbJK+hHIapn8vgkC
         7gY0Gp25J2nBiSyK++b1VCTJRib1AFkKC2H6Pe2u2hlFy4HQRSd69WEsor832YU23g9m
         1VqCxG9N2l2ouHWayC9QChIsA6yMASbw0IxMULVfQsntaZfZAv4LspHLMsfWxLkfWNVd
         IK2Gc97jTI/GgB6G6Ya30dj3zxpEn8uj6bUqJTzpMcI3metXvyJ0QqBcihgUJi4Ekd6o
         L0Qw==
X-Gm-Message-State: ACgBeo3xAfooiAH1t7bLFaQUr8FV6G8yv5vv+dn33oBjzDe7WwTFJUv4
	n/lZDPfSz//2pwn1tjzvW1Q=
X-Google-Smtp-Source: AA6agR7PSgMWNHrHKcWwOB6Urkzu6yVZIv/Yqowk8TuQVkdXc8snDh6sKeWbPumgi3r5vtLwp35CKg==
X-Received: by 2002:a5d:4302:0:b0:225:5303:39e5 with SMTP id h2-20020a5d4302000000b00225530339e5mr6193061wrq.380.1661771786388;
        Mon, 29 Aug 2022 04:16:26 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id h15-20020a5d548f000000b0020e6ce4dabdsm6660033wrv.103.2022.08.29.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 04:16:25 -0700 (PDT)
Message-ID: <8761d5a8-8044-3568-6ec9-30ea2ba30829@gmail.com>
Date: Mon, 29 Aug 2022 13:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 3/4] spi: mt7621: Use devm_spi_register_controller()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, broonie@kernel.org,
 gregkh@linuxfoundation.org, neil@brown.name, blogic@openwrt.org
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
 <b7698e198acc998d99e7e7c895a2910f14f89443.1661599671.git.christophe.jaillet@wanadoo.fr>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <b7698e198acc998d99e7e7c895a2910f14f89443.1661599671.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_041629_915445_10BB2AF9 
X-CRM114-Status: GOOD (  22.10  )
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
> Now that clk_disable_unprepare(clk) is handled with a managed resource,
> we can use devm_spi_register_controller() and axe the .remove function.
> 
> The order between spi_unregister_controller() and clk_disable_unprepare()
> is still the same.
> (see commit 46b5c4fb87ce ("spi: mt7621: Don't leak SPI master in probe
> error path") to see why it matters)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> I guess that the dev_set_drvdata() in the probe can be removed as-well.
> But it is also harmless to leave it as-is.
> ---
>   drivers/spi/spi-mt7621.c | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
> index 2580b28042be..114f98dcae5e 100644
> --- a/drivers/spi/spi-mt7621.c
> +++ b/drivers/spi/spi-mt7621.c
> @@ -373,20 +373,7 @@ static int mt7621_spi_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	ret = spi_register_controller(master);
> -
> -	return ret;
> -}
> -
> -static int mt7621_spi_remove(struct platform_device *pdev)
> -{
> -	struct spi_controller *master;
> -
> -	master = dev_get_drvdata(&pdev->dev);
> -
> -	spi_unregister_controller(master);
> -
> -	return 0;
> +	return devm_spi_register_controller(&pdev->dev, master);
>   }
>   
>   MODULE_ALIAS("platform:" DRIVER_NAME);
> @@ -397,7 +384,6 @@ static struct platform_driver mt7621_spi_driver = {
>   		.of_match_table = mt7621_spi_match,
>   	},
>   	.probe = mt7621_spi_probe,
> -	.remove = mt7621_spi_remove,
>   };
>   
>   module_platform_driver(mt7621_spi_driver);

