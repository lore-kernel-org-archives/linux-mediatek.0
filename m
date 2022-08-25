Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65846C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fe3qO+g9J+l3GlHLyNAAJaJBk5cDlmle87a/iuxSEg=; b=b3keZEsgvgpS7QOIWxSbb0h+NE
	saL6wN6iYPVcsLoOXs3mQ8DYwM/dGVhjgLInBxb/yx+nC9CgtkEUEerRujxkWIyPHTX+P+K32TKVc
	PS/VCANlsIY1JM36Xdm+q8T4gMDbChAPaGfkizEWSw1UIJNsCFSoUUmHyLJjK6ZCMiQek/JQOODgG
	HmMss0IQXCMSNlMY8M5/NkS5fVJ84bLywFgUHx4N/LoQA0oAQ5/fuuDcD7+F9X1PcD48mYwFQ9IjA
	Mv7jUS3wwqvpPPfOY1Nq3mS1ohjazw5K0EUFYgCsjYtjbdDpxGdOw8dUX8VZ/2uoFyOhzPIsVrUTT
	hlgwfqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCbi-00ESbK-JT; Thu, 25 Aug 2022 13:09:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCbf-00ESHf-NT; Thu, 25 Aug 2022 13:09:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id h24so24559028wrb.8;
        Thu, 25 Aug 2022 06:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=6fe3qO+g9J+l3GlHLyNAAJaJBk5cDlmle87a/iuxSEg=;
        b=HrYjJQHH4UNfHir+6sbLkd8xKcOuyL9rnFxbzSxD82Vo55TqgER5xIoQCQjLwM+mOM
         ozyno0lTMmEgfM0Gn+LWgzNiIDo9Frkp4xho0pLrq2L89a1SAyNY8HgwnttwGvQPvMgm
         gtewMPDUQDp0txBorhiBcFAPfenSj0K6UoJV9zudWZlTVslpt+v0LleOeJLz1nPxnRys
         AFe19H+UQZ4Q1Mj5ejD261sAGPMd5NIJvCMmdLKfX92tkJvTYg+zVGa5o+FbFtLOzqE6
         iRCDaFDtx4P/LGbWQUtWdSYKJhQi6HeacqvtwGTfxKI/gmAa5srG5NknZXgO4oSYgpPg
         M14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=6fe3qO+g9J+l3GlHLyNAAJaJBk5cDlmle87a/iuxSEg=;
        b=GgjP4g/4FkB/h65xxjKcpt2Z7RTUCKOk6fQ+U3vKGrauxBsIOi2zad/TRwjvbdeXMp
         tmzt9OgqvSZ/NyTackH4MGfD5X2rgehWH9a8cCjHNCjQUp15/4ep+d1bhXIVzkWwdQG9
         uhckJMrhDKWho8/ktpEDY5m1jdYvuAjcp8I7gpKTkdZOwMI1lbGRKpx2vS2LeUWZ4kUR
         evXHiVu8Mb5sH9yMzO/ZwX8FR9Hm7JZOqfz3nJJ9V07nYIlUt/7zPTxbrYmbFFscxtan
         Amc4ss87biTzBDrtD+xSwAT/o0uKEGPLX3Yko6eKpTw+8eYkKvGdpoBzMa8AU8DNcmhG
         mU5Q==
X-Gm-Message-State: ACgBeo3hBwOg8vbuO8ehRRD/CgfjKPBjrzVtsxP/jOA6ESB2+SGSoWji
	HieqPboltoCHLuOafas9OT4=
X-Google-Smtp-Source: AA6agR7UBlXOM+WUEhxxVABpntMRNdTQcy0g5wbICDVhGOTHepjy5kESxjIou7bia/gOsg5yeG8yrw==
X-Received: by 2002:a05:6000:23c:b0:225:1a3a:2524 with SMTP id l28-20020a056000023c00b002251a3a2524mr2156101wrz.489.1661432944741;
        Thu, 25 Aug 2022 06:09:04 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b18-20020a5d6352000000b002252751629dsm19455364wrw.24.2022.08.25.06.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:09:03 -0700 (PDT)
Message-ID: <e60c979d-4d54-86a8-8981-9587b3f271a6@gmail.com>
Date: Thu, 25 Aug 2022 15:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH linux-next v2] drm/mediatek: Remove the unneeded result
Content-Language: en-US
To: cgel.zte@gmail.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_060911_804527_7FA29FA9 
X-CRM114-Status: GOOD (  15.68  )
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



On 25/08/2022 09:23, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value drm_mode_config_helper_suspend() directly instead of
>   storing it in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

I thought I already did this in v1, anyway here we go again:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v1 -> v2
> Add all the mailinglists that get_maintainers.pl give.
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5f02f8d0e4fc..91f58db5915f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -833,11 +833,8 @@ static int mtk_drm_sys_prepare(struct device *dev)
>   {
>   	struct mtk_drm_private *private = dev_get_drvdata(dev);
>   	struct drm_device *drm = private->drm;
> -	int ret;
> -
> -	ret = drm_mode_config_helper_suspend(drm);
>   
> -	return ret;
> +	return drm_mode_config_helper_suspend(drm);
>   }
>   
>   static void mtk_drm_sys_complete(struct device *dev)

