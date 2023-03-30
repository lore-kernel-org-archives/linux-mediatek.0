Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F1C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxXKhS9wYHWQInB5jxFKjqRzqsBiAg9IWI/b1YLumcc=; b=hI6yLaFZ48wFvY/LdKq+ffVF44
	NBFy6qYDoNlUdKYPiUR6MmzcDl5N27aVU5DQkS1YmWdd4gM0z7Ok4NazYdU6IfxpCz6SBx0OPgUmG
	TKlZMFvMEXOnKTmEr25jwPE2jp4e+YD8CD95DIt2eeS+nKUevVRPz4wZYLAndeHH1DMQL0kRECKzP
	xDDs39fa4WovlrnGz5LKB4KUMF0bOySCXQQANZ9Woj4d0yrpUHr6xKFB25KKmfDjq3oyGZwfAs77d
	PjvjzNOwUtk+u/TURZklstP23k5ZBSjjINCLNL9ggn1po1X1pJC5nYnRpTCSUpU6Z7+eowXTcDU8F
	97IVqzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phobt-003Hcf-2N;
	Thu, 30 Mar 2023 09:30:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phobq-003HbX-0E;
	Thu, 30 Mar 2023 09:30:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id s13so10470729wmr.4;
        Thu, 30 Mar 2023 02:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680168616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WxXKhS9wYHWQInB5jxFKjqRzqsBiAg9IWI/b1YLumcc=;
        b=o5UR1YKGDskY7lYN1CPA3sqcrsWktdXRTHgC3jsX9yd/RemyoJJhGoPqOV0V9Ske29
         /AV/2HYWYof4pYufYh7jV6blR4rPN7LHgG6yBv4pR9OPuxTcBBUaUjOemY0vz49bDPMd
         JrzpyAQf2fVoCpFXHgHourHjognNlZ9rUz0si3TYfQoE4Jos2GGfX4ItBCOEvX5A3mLZ
         HOVtpHENE2u11yedAN+JJOge3bv3Yf8/dfIe89NgeMLmel+jZiJkZHM8XT67kJJ+39XK
         WaWs+aIkitN3nD2kypexmNThLm8NAWur5ehf4w28iY8cf9XsHM3/aUbmOFI0ouS3ND3F
         vsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680168616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxXKhS9wYHWQInB5jxFKjqRzqsBiAg9IWI/b1YLumcc=;
        b=sxwbKDXO0UYY2EYc+APvuj5tJCEuGVUfeRJCTXWqFInaF/csrh0zE/9YWyxKTf+XAy
         2JwXpHn/WsAAlJINIWLAgjFlPYQAv/TFVy7pMWdX6D77/DOPtgTVA6YgLlygmg8xgLUf
         Gbh81FNW8AtbDm5ZUITtY2WfsU8FrpRli3pn24Uo17K+is3U/PO3SSKgYsJhsj143FYF
         gcsRcXWasHM8bv7txwSoKnVKXWp3KZN4cXq30r96lTB8lWqBXcQGdXUpq522c338GfSY
         Q0L71qD7YlHmYcjIKuLbjdUVXGjQeCsU3/k5IdWigRdUxVJmaGu/r6gMbxO7OxdJSBVY
         NqOQ==
X-Gm-Message-State: AAQBX9dCQYPnKOjX1Sv7d+ncZdYNz7mQB2O80eq57R62G48T+V6NBg+C
	6rtssD/A57JPqQfWAu6gQI0=
X-Google-Smtp-Source: AKy350ZBgLhNRR9TxRDx2aLTQWJRkGyCwyq3TOUYsvCakwonAbrsN83wbcfgg94RBbGOiSfUp+sXnA==
X-Received: by 2002:a7b:cd93:0:b0:3ed:346d:4534 with SMTP id y19-20020a7bcd93000000b003ed346d4534mr4173874wmj.0.1680168616343;
        Thu, 30 Mar 2023 02:30:16 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f18-20020a1c6a12000000b003ed2276cd0dsm5161439wmc.38.2023.03.30.02.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 02:30:15 -0700 (PDT)
Message-ID: <d6314775-0918-eb9a-d501-2f22db6a951c@gmail.com>
Date: Thu, 30 Mar 2023 11:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: soc: mediatek: mtk-svs: fix passing zero to 'PTR_ERR'
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230216132543.814-1-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230216132543.814-1-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_023018_107942_EA85E722 
X-CRM114-Status: GOOD (  14.44  )
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



On 16/02/2023 14:25, Roger Lu wrote:
> nvmem_cell_get() cannot return NULL so checking for NULL is wrong here.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Fixes: 6c7174fd90a4690 ("soc: mediatek: mtk-svs: use svs get efuse common function")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/r/202302160720.N64SWT4l-lkp@intel.com/

Applied, thanks.

> ---
>   drivers/soc/mediatek/mtk-svs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index a7eb019b5157..8127fb6d587b 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1726,7 +1726,7 @@ static int svs_get_efuse_data(struct svs_platform *svsp,
>   	struct nvmem_cell *cell;
>   
>   	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
> -	if (IS_ERR_OR_NULL(cell)) {
> +	if (IS_ERR(cell)) {
>   		dev_err(svsp->dev, "no \"%s\"? %ld\n",
>   			nvmem_cell_name, PTR_ERR(cell));
>   		return PTR_ERR(cell);

