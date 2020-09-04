Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43563C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 11:08:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1622087C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 11:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ttsmpl5+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hJEFGVhk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF1622087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CHaethFD3TWPK53mkoFKEzRA8gNQTKEolPmIcp8gkpg=; b=ttsmpl5+rEYjmWHnjYO7Z5OIG
	aR7SOojl+yW3DwVWroP42AIok197hzHxxVDR3EBnFUE51Uj5ZZQnYSkQeqrCX/3D+i7YtXlJLeWs6
	Cz3xrZQr2aW+rWGhUUsKo3NELagqYvZIsRhrYxlUJXILChABhFzscZJ01Q2QHgLb+MayxnJEnaG6V
	WEWCcIxGgQ4TgpQWYJO6zmtBOcwnvz0xjm1D9TkQy7/qG9DEDQo0oFVFqQB1XjUQWaZMG+NAFgTxF
	qtlqk3kDLc97xQ8Otku6+0uz8lVEQSR8rvzpQdtMxkC48vSHZEy5NUPen9efLguAhaETWVYyF7Ool
	HUCe2Gbqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE9ZR-0001ct-RP; Fri, 04 Sep 2020 11:07:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE9ZO-0001cB-Il
 for linux-mediatek@lists.infradead.org; Fri, 04 Sep 2020 11:07:51 +0000
Received: by mail-wm1-x344.google.com with SMTP id w2so5709158wmi.1
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2020 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YAvy/uLp7+cWVzWcV7xfgGlutHlCEWW9xHSoG33J/ZM=;
 b=hJEFGVhkBiKv0X9JtFq+P0TptyE7m8g1Hv8atN9oETRU18f720U2R9pjRGxc5WE6ru
 MNpnlEYeH/pHp8cQ+akgH7rNybAHXwbEE76XXgOVzriCuj7sPzPlpti/J8l3vVQRevS7
 RfOcFLZwsntcuwTRyQBOUkFdiT4bWpJRnvp2DC7DgoH5dlmXOynRNqMa6jslNPT8KVGf
 nVTsCyg+8M3HcXYFG6OZnj7KyAQzUjDCe3QMDnSFPRNEOfhaYdA1sn+CTb0P7/qePNCP
 fZTULBhyBnts/A40ISXfeNiv7ykKaZXJVjdM5V1DBIgkr05EKWAWo0wuF8hPowIm5weK
 kPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YAvy/uLp7+cWVzWcV7xfgGlutHlCEWW9xHSoG33J/ZM=;
 b=P/gKd8Bw7nUND7wvfi6+DZNtk46n3EJ/6Gf7GkkERi9HP/4w4X4pbl5RqesSm4G0w9
 QvOriyx8MnTP4h8GNWILK4xJLldOae+5HsMKOOY4JEXuG3uiwa7ODmKEi/cZfGG+m5k8
 IyVNmnVUwE9zfqmTS8eFUtkr/fyrJkykfnjWFyXNvgRX6f3w7iiLaHq06D+ZvBRJlxxM
 N5g4N45RqvPgR5Ni6wXj8b5tqr0p5m1wnN3gHZejAHNJ0fanIz2O+5f/x4lU0MbOpUQP
 ojs7RxuJPtUhq6dpLeiT6gS4O68PiH4C920yM8JPhcKWZV/fOYncMS4+NWYMUkW/KTgZ
 cz4A==
X-Gm-Message-State: AOAM530jv8ETH5U5Pux/i/RmRE/nOZ+esEIvT2fOot2UmYPcjIi4HwVe
 dSE9drVsLN0wp+MgCzhxW/GqiQ==
X-Google-Smtp-Source: ABdhPJyJMFbpGk2JfuZru3rTIMQyff/CzsQ264cZGW7mm28Ks3LDPLGUswtRAjDnUTNZ6YAtlD43aQ==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr7028460wmc.35.1599217667800;
 Fri, 04 Sep 2020 04:07:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id
 q186sm11566637wma.45.2020.09.04.04.07.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 04:07:47 -0700 (PDT)
Subject: Re: [PATCH v3] nvmem: mtk-efuse: Remove EFUSE register write support
To: Chih-En Hsu <chih-en.hsu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20200826083943.810-1-chih-en.hsu@mediatek.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <21d857b5-9b6a-7e77-a725-18a1adf3e92a@linaro.org>
Date: Fri, 4 Sep 2020 12:07:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200826083943.810-1-chih-en.hsu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_070750_660039_E38D9DF9 
X-CRM114-Status: GOOD (  18.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT.Chen@mediatek.com, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Michael.Mei@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 26/08/2020 09:39, Chih-En Hsu wrote:
> This patch is to remove function "mtk_reg_write" since
> Mediatek EFUSE hardware only supports read functionality
> for NVMEM consumers.
> 
> Fixes: ba360fd040e3 ("nvmem: mtk-efuse: remove nvmem regmap dependency")
> Signed-off-by: Chih-En Hsu <chih-en.hsu@mediatek.com>
> ---
>   drivers/nvmem/mtk-efuse.c | 14 --------------
>   1 file changed, 14 deletions(-)


Applied thanks!

--srini

> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 856d9c3fc38e..6a537d959f14 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -28,19 +28,6 @@ static int mtk_reg_read(void *context,
>   	return 0;
>   }
>   
> -static int mtk_reg_write(void *context,
> -			 unsigned int reg, void *_val, size_t bytes)
> -{
> -	struct mtk_efuse_priv *priv = context;
> -	u32 *val = _val;
> -	int i = 0, words = bytes / 4;
> -
> -	while (words--)
> -		writel(*val++, priv->base + reg + (i++ * 4));
> -
> -	return 0;
> -}
> -
>   static int mtk_efuse_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -61,7 +48,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	econfig.stride = 4;
>   	econfig.word_size = 4;
>   	econfig.reg_read = mtk_reg_read;
> -	econfig.reg_write = mtk_reg_write;
>   	econfig.size = resource_size(res);
>   	econfig.priv = priv;
>   	econfig.dev = dev;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
