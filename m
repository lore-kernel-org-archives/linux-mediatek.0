Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E413C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7CWCdwIAMzDd3zoduua/9CISn6ZHCpk120R6GZupfU=; b=cS+h0UFMCMDdgSZ7wXGp/e+oSy
	ek36AXt5ZPqrUiiJFQ21NT/gq+ddWFTKcnv+eU/9ZxdNKnNsOglVUO8tSnbtDXbUr/izcRqZzenNh
	LUT5VFDIp4GxdkrQBE0nTQZcsWMLhhMoTV9dRTawvhzRUTlXIa929dWrh/Xq1kr98IlnXQahuwPhV
	eugHW/fvYRLq10SS7DWgdoKY53a/WcnCZ/S/NXrXMzyywS9pGFkDa8pBnE1xF1v86DqQqQAVRFgM3
	+kdmo33TI/J1qktMVugCmd5rhYJm1sCgQG93xp+yCN4XkWPJRBDBUqlZa5WKmwej/L0X4jK1ovW+p
	0Bbg2+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEqKj-0033OO-6O; Fri, 22 Jul 2022 10:56:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEqKU-00339t-6i; Fri, 22 Jul 2022 10:56:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id k11so5532683wrx.5;
        Fri, 22 Jul 2022 03:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r7CWCdwIAMzDd3zoduua/9CISn6ZHCpk120R6GZupfU=;
        b=daCf6gqnNfKXGOXG4U9K3VJ1SMpSgDsL69EeAz7wKLtPUeX2UIMuxZF1AKdICoKVO2
         Wtfi+lXpQfgPTi4QRU30iiEHASaSDAu90vak0bNCm+rNiUFwVXJfztELV4aU5LmrsyCE
         0kfXC4zCzwhRNiTA74e8TjqFM3Z18MTECotY2xDUGLWLRXxcx/3v1f4ekDUNeVfpuaxR
         jnmT2aqK0GX3bqNkDtM+KxRDO94NteoUx/8AvajB34y2K2jQDlQEJVNrt1B9Bh8+F11J
         zujgDxizv3ziw8jwQ5QuMc25fsK4NTv6NC1IzD8LVKPqoyL958NGDMdQazL1OJa24xJW
         yHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r7CWCdwIAMzDd3zoduua/9CISn6ZHCpk120R6GZupfU=;
        b=QNuLnmM+SStadp3VwCsvgC9crFwnWbObDOn8G19cj6syE/YNhShGZQlZNNWdfw4eRL
         H5b9I9UuVL+BfDT/RzncePkkpR2cahjJQEimqrLr9oa2JH4O462QcuzGfQWHq/bLi2Da
         txAwSvss9oPOrDFQWMF5iYVaSQWRt2JkOVdwUa5tPlrP47ki97MZ/ELQ5pCI8Ki9CFm9
         MGveFbv/o5vnWPie/pWh2ab2cnWLOv/cQmiZHV8WYfSfTNh+2Zs8G/f5MbKJd7znLif3
         AWohiLTnMAyjpMSFZG28SLuLWsI/SCAqq/TasC8J6LxIBaTL/K4hc71gwhNTJeOzT+vb
         jLGg==
X-Gm-Message-State: AJIora/j1YTKN0wEmKCqftPluA+oX0/DqDhQsP4Cov3Iw24aoMeb+I89
	5HWqZgXkqsthykRufR1wD7U=
X-Google-Smtp-Source: AGRyM1vJqtnKC90hkOZHXGT5hyEFdcFIdaWrKndcd9fIZrAoauNgfrmdJBWpPy399943yQyhMvu/xw==
X-Received: by 2002:adf:f602:0:b0:21d:6662:f9e4 with SMTP id t2-20020adff602000000b0021d6662f9e4mr2268740wrp.353.1658487378481;
        Fri, 22 Jul 2022 03:56:18 -0700 (PDT)
Received: from [192.168.0.51] ([37.223.147.254])
        by smtp.gmail.com with ESMTPSA id q6-20020a1cf306000000b0039c5ab7167dsm8151740wmq.48.2022.07.22.03.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 03:56:17 -0700 (PDT)
Message-ID: <f6edd39f-3bca-d412-1140-e0a5b05200e4@gmail.com>
Date: Fri, 22 Jul 2022 12:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH linux-next] soc: mediatek:fix the compile warning which
 about svs_resume() and svs_suspend() When the static function are not be
 used,there gonna be a WARNNING for it. Ignore these will make the compile to
 sucess and should not effect any other thing.
Content-Language: en-US
To: cgel.zte@gmail.com, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ye xingchen <ye.xingchen@zte.com.cn>
References: <20220722054609.1501177-1-ye.xingchen@zte.com.cn>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220722054609.1501177-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_035622_338782_65ACDBD3 
X-CRM114-Status: GOOD (  14.62  )
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

Hi Ye Xingchen,

On 22/07/2022 07:46, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Reported-by: Zeal Robot<ye.xingchen@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Thanks for your patch. Unfortunately that got already fixed in my tree with this 
patch:
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.19-next/soc&id=c749d676a33d99ee4c40d69ac2bf280270d890ad

Regards,
Matthias

> ---
>   drivers/soc/mediatek/mtk-svs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index dee8664a12fd..f411fcda8c6d 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1478,7 +1478,7 @@ static int svs_start(struct svs_platform *svsp)
>   	return 0;
>   }
>   
> -static int svs_suspend(struct device *dev)
> +__maybe_unused static int svs_suspend(struct device *dev)
>   {
>   	struct svs_platform *svsp = dev_get_drvdata(dev);
>   	struct svs_bank *svsb;
> @@ -1512,7 +1512,7 @@ static int svs_suspend(struct device *dev)
>   	return 0;
>   }
>   
> -static int svs_resume(struct device *dev)
> +__maybe_unused static int svs_resume(struct device *dev)
>   {
>   	struct svs_platform *svsp = dev_get_drvdata(dev);
>   	int ret;

