Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43D4C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlRZJO0ut9c74lCgp5ZPN8m5Etsewg93lsfpnPM+vgs=; b=evlnaJBrcFQ8oCO1v8viiIyj7S
	gmVRyGD11WJKB8f3Ypfj6TbYO7m588Yvf3dzCnmTeCiTq1Y0rLM6MJyjconmmE45A1lMPITLVeVdS
	D4IqGFksBqEAUujiVlIejohk1vBtCdZQsTG5wstOrFAfU3vYemne14/F+sLRxlIRteBO/5fTS+lpt
	qgOeDcL1dlVGJXB5OxhiX356HG2mg9fxjE8E4fN6CF18lDQVICaY2A4n4OrbueCi4YT3Ib0togbZb
	roC9NQzV4dGPuyz+Si6rIHykXSEw0ErfTDc4ZIE1T1T+ggpB3jZKy1sCl2CyNW7ZMNAnttGi4Fhbh
	XtKb63mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3eq5-00AwDz-1Z;
	Mon, 29 May 2023 15:31:17 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3eq1-00AwAj-2n;
	Mon, 29 May 2023 15:31:15 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30ae4ec1ac7so1185211f8f.2;
        Mon, 29 May 2023 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685374257; x=1687966257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BlRZJO0ut9c74lCgp5ZPN8m5Etsewg93lsfpnPM+vgs=;
        b=gVwf/G88eNzL0qMQ/1ivzvl0XsXj9sJU+DXJbHKD2rZ1Y3lY9YdYeswXKln8SHZ7X2
         /C76MlnE2px8HQNiJFFsJ3wXK6me4k3wBO3sPTrq9MQGyrbqdF2xSpNkmSv78B5XHt2X
         BZPgTJORGPoQUBH1nTO12pexC1/2LmztkouxBO4bKrnWpGVWU1IDY9WTmuSQp/ATLY0P
         d9FZpRrYvMOy43ARbAfTNNJLrlna2AITtydrEjN3BT6fHpSChUB2fwzFZjjN8JUv2RRn
         NirKI7vY/AWGXOYrGjyBGq5IEahNOBdzU2upvYtwTIvoDKJ5VNECDZB7N4vVnl7Fqm/r
         P4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685374257; x=1687966257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlRZJO0ut9c74lCgp5ZPN8m5Etsewg93lsfpnPM+vgs=;
        b=NrKaIneMLJgGtb8lIdfiGurktYiOsFYXYppuETwM3OGjZh+bV7GIzOSuJEAsRwmzqi
         LvQ7XBwVA/YpG2O1xKJy6Bzi1nwtUdIaG46Ycgg+IQklm/aNMT/UJ+KXTFidNgFo+BQa
         OFdkoxm3z5eCp4+grjfDqMVK7wUxZbiZjm2yUMomxFyR4StQtnUC+uyid+Jt7tcw2Pby
         57wOR2XwD46IatyKa0ndSNuraYkMt3LiX2DNQxKU/iKoftA6DXBXEk4KhsEbIv9nihAv
         tLAOqjI/x915T1Ru5SmCXlLtEuVWkI0qsY5u6Gf3wHwZTTdiO8mgmQ5xe+mByM8CSKmN
         4kvw==
X-Gm-Message-State: AC+VfDzL/N2xK12CpeLAeaadJdgttTEbGBjXRKA/dTgdibeJzfkdqG9M
	g9DF38XWfTSwUAEnqUNWOj4=
X-Google-Smtp-Source: ACHHUZ4eFqwTB/2th5OmqHEyTwPBCv726w0w/8V7tz0hfE2Ltuwtb7NySmndjYIQGPqp+TiWL8DI4w==
X-Received: by 2002:a5d:490b:0:b0:30a:e7c0:de86 with SMTP id x11-20020a5d490b000000b0030ae7c0de86mr5894515wrq.56.1685374256958;
        Mon, 29 May 2023 08:30:56 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x14-20020adff0ce000000b0030aedb8156esm258207wro.102.2023.05.29.08.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:30:55 -0700 (PDT)
Message-ID: <1ae2e760-a06f-f76f-689c-804df00ea5f8@gmail.com>
Date: Mon, 29 May 2023 17:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] soc: mediatek: mtk-mutex: Remove unnecessary .owner
Content-Language: en-US, ca-ES, es-ES
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20230505061950.25977-1-jiapeng.chong@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230505061950.25977-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_083113_910675_5DB626CF 
X-CRM114-Status: GOOD (  18.03  )
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



On 05/05/2023 08:19, Jiapeng Chong wrote:
> Remove .owner field if calls are used which set it automatically.
> 
> ./drivers/soc/mediatek/mtk-mutex.c:1054:3-8: No need to set .owner here. The core will do it.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4869
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 26f3d9a41496..4aa0913817ae 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -1051,7 +1051,6 @@ static struct platform_driver mtk_mutex_driver = {
>   	.probe		= mtk_mutex_probe,
>   	.driver		= {
>   		.name	= "mediatek-mutex",
> -		.owner	= THIS_MODULE,
>   		.of_match_table = mutex_driver_dt_match,
>   	},
>   };

