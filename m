Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA008C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylS4KYcnz6zgUnk7J6zC70zT8oatpCWr1rIO6eciB1E=; b=RSEuI6w6rfiudYwZwAyjxIjG1V
	fJUxx0A2BzTdKzEu9TRU6a2jaD24J08NOZJo3n9AfET0Hu5vgGpz8pl2hqCCH+k/5hKAig6gdyKaE
	BqKM2pku88JTlgFKc/heqwJkkcO0EsySy/1EImsDJv4QaLYNX/Bx6hIL5AtHWSMzDbmHhrUuHFVrh
	J7MjolA7IvSCUIX6GHTRbyATmVJ7h5vcq6WBLhSU6i/vNeWE02NMQYZN4gwJg22STaHxynEkC8wNq
	Y3I5xXYOn/TWuEqEztC/YuYjmZjfUuRj7fhcUee/kkDiQ4n6HOnGVq0QrOniD73VG9uZXlkUNc7tQ
	W0/C/8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IYe-00EBVI-80; Thu, 23 Jun 2022 08:51:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IYT-00EBR5-Ju; Thu, 23 Jun 2022 08:51:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so1039993wms.3;
        Thu, 23 Jun 2022 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ylS4KYcnz6zgUnk7J6zC70zT8oatpCWr1rIO6eciB1E=;
        b=ozGokIM2DE8EhXhuCPuJqvKhj0nhAWB3Aa4za/fwCRvjcN5P/HYriOKzX/yNe1NgRq
         6eWujNDbI2LZC8iY7NKZhpX0tT1L8tliYgIliqnVEvOMIZKx1ityI0XnHLUHjCoWk1UT
         MtZLA3GJC4bg1lHglwrnEnrx0dDD2cTcJbOdurdJviEI50CLSes7UEBPLji3pSNyP4Um
         PyEj2eA5EiAVodIa27c0IAv08f6Iv1gKRok8le46zhwgHm5XpD3BRk5vglWu98KeYisa
         Zx8QgOgq+LMitS3tbSnzZB7Oh/IaRdItB0nhmxtm5CDsSlSLUtnxFSSjADmBO884zf2z
         gHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ylS4KYcnz6zgUnk7J6zC70zT8oatpCWr1rIO6eciB1E=;
        b=fkqfG2+QAwag7JApPStC1oTWOIj8I+0oa03tdzUG5KDJU/w07UdgThIrlUv6qOZRxr
         03vZo4mtlhXr4yITses/hP+Y89OsJfquDTgg8+MVX05j+0MFlF8YCOGwJNybe+S5u3gu
         Sv9dMq5zNObPv9HpXL4b0e6NhD3/zVtRy/IjJxDsxrq59rDHRuN6WtTl99D4fxmpMKwX
         QauoY8us45LHXqS7nRZNeiwbEibakrcr/oI9rtTxQEMP0Ut8JKuqraTNEFE2KcXF52gF
         vOendIolWAnYUXxK65fEid3S632k2RxyAJjS/CbhuwK07ni1WJBM4zUHt5i10uboKEJc
         iLYQ==
X-Gm-Message-State: AJIora9KuRIme+jfpFk9MecHKW9YEZFXPnc0EwgOC/o7ORp4MHh1rR2q
	M2MurUAG4vAXBSZNlny+Bos=
X-Google-Smtp-Source: AGRyM1u5qeXVGO1tvxIAbEoG86z8itNjxxGvYTqHh3hKkTQSz6pGim39H88wj31B7rpiRiM5RQMPAQ==
X-Received: by 2002:a1c:4409:0:b0:39e:f586:6fd8 with SMTP id r9-20020a1c4409000000b0039ef5866fd8mr2800542wma.157.1655974269794;
        Thu, 23 Jun 2022 01:51:09 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c1c0900b0039c7f790f6asm2561988wms.30.2022.06.23.01.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 01:51:08 -0700 (PDT)
Message-ID: <57cc70a9-1f70-66fb-3ed1-7c67a34f131b@gmail.com>
Date: Thu, 23 Jun 2022 10:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] soc: mediatek: fix missing clk_disable_unprepare() on
 err in svs_resume()
Content-Language: en-US
To: Peng Wu <wupeng58@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, liwei391@huawei.com
References: <20220623070240.63382-1-wupeng58@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220623070240.63382-1-wupeng58@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_015113_704889_F07341B6 
X-CRM114-Status: GOOD (  16.89  )
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



On 23/06/2022 09:02, Peng Wu wrote:
> Fix the missing clk_disable_unprepare() before return
> from svs_resume() in the error handling case.
> 
> Signed-off-by: Peng Wu <wupeng58@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>

Applied, thanks!

> ---
> v2:
> - Same holds for the error path of svs_init02().
> ---
>   drivers/soc/mediatek/mtk-svs.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 606a00a2e57d..87e05ab51552 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1526,16 +1526,20 @@ static int svs_resume(struct device *dev)
>   	ret = reset_control_deassert(svsp->rst);
>   	if (ret) {
>   		dev_err(svsp->dev, "cannot deassert reset %d\n", ret);
> -		return ret;
> +		goto out_of_resume;
>   	}
>   
>   	ret = svs_init02(svsp);
>   	if (ret)
> -		return ret;
> +		goto out_of_resume;
>   
>   	svs_mon_mode(svsp);
>   
>   	return 0;
> +
> +out_of_resume:
> +	clk_disable_unprepare(svsp->main_clk);
> +	return ret;
>   }
>   
>   static int svs_bank_resource_setup(struct svs_platform *svsp)

