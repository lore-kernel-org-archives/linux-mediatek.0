Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A2DC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqgv7yIBNNsJeAJrSv/GZVE5mKpT/DHNaAW4eqYsjYk=; b=jlwEAWq1t87W2J
	OxvFhS80YgwUI1lOJxJfyw4nO7Y93rsx0d8W95LV/UnH5+8aBbIFrB6oEHl2HrhwaydxQPdA4Qdcb
	QmPgxOxdUWu9FVH0LxJgFGLjG27nexnmY5Uw8qqbXrEI/N4Nc11gRks1C42ZTgz9AjqO0DNd6luq/
	85aqxiujLK8PATz3hHh1mH6YTqPW/4BGOc+bpmN238m0yiONnmcknDhW+A4hQCm/5i4uJ2Sk3f1Fc
	74VtfETaiZ41pg5Kql9QzEZub1NE7HUEetUBG6I0jVpX0brgRr0Q82p58LYZYCpvz9Wz5/rUGVhhS
	YvK63t8qcdqkSzb9WC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZD4y-00CWlc-Pg; Tue, 29 Mar 2022 14:44:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZD4m-00CWiS-Eg; Tue, 29 Mar 2022 14:44:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u16so25173796wru.4;
 Tue, 29 Mar 2022 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=f1hZOQmmNmyJ7U7nVAiaQQ0lwaiu4vRuIQsNB/VIsek=;
 b=LFwUL3ZRs6RYhHzf2Bdq3dc2ZslNWBxkB1yhR+wEGS6JH1CAINYO8yj+nLkeMHE24p
 P5+HJJ9yWBhuBXgX/vfmtySqT1FV/U6hp7W7fVDw/xJ6jwxk/ymbYXTVT92XWs/O9E/6
 4VMhn4h7OzWX2RHnlJoqHAlaRNFPgU0R/cWjA/iT6aFYEDbkImo4/pFTNs7KsML/jku8
 ntEHwcuSkgx2jmUNHIsUhxwdHWu7KtNBW51dNBC/v6uAH43kyQmKk9tgQA7WSS3AuHRI
 XQCrFbf2xcxV4JEHdrv7XDvtf4ESDi19uZAe4x4q2HQr2zgwlTFm8e1/vjvZY8wpc3dx
 1TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=f1hZOQmmNmyJ7U7nVAiaQQ0lwaiu4vRuIQsNB/VIsek=;
 b=mD2MpAqgmCuM13ix00qpGNCAsJ19CIIeqyaLI5KIMlspy4TLhNADJ/qhrKOo3pz8Cl
 Cg59hOs/IW7iJ1UByMIJLvGvmfUtZklIqs6pVqI9m12qqBsJt2vso4ZnKKK7GbubhDTW
 5VCscchjSCv6mPCtb9THhOhdMv7Z3v8TcLsVcu1lbU5UFtuPwKwb7Q0yOBaMQDkJQmmv
 YyNoCqoG6UjSHiknkSoSSOUHa+CXNWULV7qawca/Z22ZzNgOGNCUPTudKw6ev8QFqvp8
 Y/1X39qkk438A/oie4t9zbwVTRVqfP04ELeP6lzulSZ46i0axOdakpG1cDNsWMzXBW7K
 rGeA==
X-Gm-Message-State: AOAM530Ca6mGZm7Ws9UYCbQDQsr09JfLuGz4j5orjDCfQ4aPXF1tY+e5
 E0fNHZsUp3T1uv+v1DkkJuw=
X-Google-Smtp-Source: ABdhPJzMwHCsnpQQtTp4CjjZBj9sm+ezIYCdnM4RPz8U92H0vmmgiVSarO5uo1zeXs7VamaIsqqIkw==
X-Received: by 2002:adf:ec41:0:b0:1ed:beee:6f8f with SMTP id
 w1-20020adfec41000000b001edbeee6f8fmr30629170wrn.110.1648565042644; 
 Tue, 29 Mar 2022 07:44:02 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b0038cc9bfe6a4sm2288573wmk.37.2022.03.29.07.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 07:44:01 -0700 (PDT)
Message-ID: <d3b8f78b-24b0-d0f1-f5cd-c3cb29ee25d7@gmail.com>
Date: Tue, 29 Mar 2022 16:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 hsin-hsiung.wang@mediatek.com, sean.wang@mediatek.com,
 macpaul.lin@mediatek.com, wen.su@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220329115824.13005-1-zhiyong.tao@mediatek.com>
 <20220329115824.13005-2-zhiyong.tao@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] pwrap: mediatek: fix wait time out issue
In-Reply-To: <20220329115824.13005-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_074404_532630_126A322A 
X-CRM114-Status: GOOD (  19.09  )
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



On 29/03/2022 13:58, Zhiyong Tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 
> add sleep delay before read "jiffies"
> 
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>   mode change 100644 => 100755 drivers/soc/mediatek/mtk-pmic-wrap.c
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> old mode 100644
> new mode 100755
> index 952bc554f443..ac7139a67e87
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -12,6 +12,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/reset.h>
> +#include <linux/delay.h>
>   
>   #define PWRAP_MT8135_BRIDGE_IORD_ARB_EN		0x4
>   #define PWRAP_MT8135_BRIDGE_WACS3_EN		0x10
> @@ -1197,10 +1198,13 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
>   	timeout = jiffies + usecs_to_jiffies(10000);
>   
>   	do {
> -		if (time_after(jiffies, timeout))
> -			return fp(wrp) ? 0 : -ETIMEDOUT;
>   		if (fp(wrp))
>   			return 0;
> +
> +		usleep_range(10, 11);
> +

You need to explain this change. Why is it needed, are you sure it does not 
break other platforms etc.

I can guess why you need that patch here. In any case in the code you provide, 
it would make sense to move the first if out of the do loop and only after this 
wait 10 us before reading again. Right now the code does usleep only after every 
other read.

Regards,
Matthias

> +		if (time_after(jiffies, timeout))
> +			return fp(wrp) ? 0 : -ETIMEDOUT;
>   	} while (1);
>   }
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
