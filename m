Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD554CE7A88
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNuBtdApmtdUf0XvIROq9J8oEW88H73TUSgaToXrYf4=; b=USAOuJuaEuMK2T8KkaOMp+hKvT
	tphk8uX9pGjm86d4IAzTlgICX5C/dMjBqTDITGvdCG3ORFHV1557LPF9u21FXHw2LRamTmVecSuhl
	A5I7TzX37r5eUwKJQWzVbXG5vSDRt7w9xa0HKj3HjHiDYiA+q0aVQTZRVg4cYA1mhMDKtD1QbcGBz
	EyC6cBqu3wFsJaYclL03qMfEON7ncpwoiG/TEwtNBWzkObLkHOHD6t1M4tpq5Wl+r/xUwIKmfzghV
	HxgwE/XeD9TDnsWgbt+hIBq559tRwDU1r57Gj/FzWz1P6FCFuDDFO0EFL/hRROxlwW0PNs4gE7MkT
	fFMlv0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk73u-00BJ1t-20;
	Sat, 23 Sep 2023 18:09:02 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk73r-00BJ0k-2L
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:09:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-405361bba99so34729255e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492538; x=1696097338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNuBtdApmtdUf0XvIROq9J8oEW88H73TUSgaToXrYf4=;
        b=cpbGu4293kbsdEDoF+FCO0pX2BflWPRCsfZIgvvNT8aYwY+wUePhx3Hc8jfIBorquy
         mG+6T/1eAwPdikKQj3NzC+dlAzAZY4e3C0bdqism1gCJC1eYBRevh+oZHjddz8jh8TUE
         ZaO2deQaTgj5OFuaI3BoBEtwYlpAYDKaoVakvN6GeeBfEaFip/rhavkVMZSTly6fnLU5
         tGH9aVxcV4HaTRxIwi/BTXKMZQG82REuUBFbJIkTFVVdy+VgaCWaUqIX3cpoZdXLlZTB
         GU6lMiy0bhhiHx7XQkHIHIfDUynVeSQYMK8ChIkfpZYy5btT61gO7hmIj7WlRb0cyql/
         D6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492538; x=1696097338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNuBtdApmtdUf0XvIROq9J8oEW88H73TUSgaToXrYf4=;
        b=kPm0q1NOEkRRzqL+j9Cbx+hGWYtC7aA0UUIWe4GctFBdFg/arQMHzdbwRphie8uiN9
         DUXs74mBoM1m0dwZk9u5QUi+n0jIEo/+rkAiEVuHL46z8oalT/dxPfvHZHSZMcFtbPlH
         IkCzO7Tz3nPuqNs/Lg8z3Vr3aeNNnnGzHvin6WAkTIl4QVOdazKiouaQr4N9+1EHuhAm
         WbF6qq5I8Gl9+W9aO/IV97CcpWNCcatFvLiNzCBcEj2BG4NVJx1to85HJYz4uHPKvdtL
         hLyVtVxJDpMtod4y65fU0b4F2NJRf4ga+ucehIFujVvB7DhGFCLa+vU78+4lbpaFjxbh
         /CPQ==
X-Gm-Message-State: AOJu0Yy3xEF9IVOCFquXSpGjs5WtMQdU9KLI5rqdDVFmzBVeocWMCucg
	nMh3AL8jDKL0Eb8y93FQEuhpNA==
X-Google-Smtp-Source: AGHT+IGKEp63EtWq7UClnEUTgxHKAz2asZi2uiPoLLgcA6MXNaQLGed3QzNZ6A9pBoZIGrf4AgNtFA==
X-Received: by 2002:a7b:c409:0:b0:405:3d83:2b76 with SMTP id k9-20020a7bc409000000b004053d832b76mr2293124wmi.13.1695492537810;
        Sat, 23 Sep 2023 11:08:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4f0a000000b0031f3ad17b2csm7485185wru.52.2023.09.23.11.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:08:57 -0700 (PDT)
Message-ID: <a1dbb788-d2c8-c358-9f9e-54ca664dc6df@linaro.org>
Date: Sat, 23 Sep 2023 20:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 14/15] mailbox: mediatek: Add mt8195 support for CMDQ
 secure driver
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-15-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-15-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_110859_766079_EEB8BD4F 
X-CRM114-Status: GOOD (  14.11  )
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

On 18/09/2023 21:22, Jason-JH.Lin wrote:
> Add mt8195 support for CMDQ secure driver.

How is it anyhow related to your patch content?

> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4e047dc916b9..d27d033c587d 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -735,6 +735,7 @@ static const struct gce_plat gce_plat_v6 = {
>  	.thread_nr = 24,
>  	.shift = 3,
>  	.control_by_sw = true,
> +	.has_sec = true,

Really, how?

Best regards,
Krzysztof


