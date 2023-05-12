Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24813C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQHkMWe3qdYU/HmvSBq3YXaycptjgX2aKr/mlQr6WCk=; b=n7rw/4dcK/SAAvnUlO9peLd+Rg
	cEmveT2fcaFDxf7aUXDOkSvzrPtvaHg7QUUKGW8Cx9Rf5endhVPUbm9WmYdtOdKmkSMxgPBq6Oc9B
	2xO5lxo3FZ31j/x0j6TSND/vkWH7t0X4ZuPlZFPXWFrGPi+of+GbHULpg+jzb5F5oK7Ly3rAVP9X5
	s7fFbdIGHy0waublsmTvRCpW5B3T1vmnk4Mwn9OJwRvjJmbAAZ+fQ5tiaoQJwaEC041uFgRpWSnZr
	vS93gCU43rZ4Kf2TpsteIRrRXY7Shw1sdkVMQBnyYbONTNOUp8SgkNzOqLmTcPpTgwekhhpeIN6QG
	KYTimECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxRJb-00Briq-1u;
	Fri, 12 May 2023 11:52:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxRJY-00Brgq-17;
	Fri, 12 May 2023 11:52:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f42bcf5df1so43769265e9.3;
        Fri, 12 May 2023 04:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683892312; x=1686484312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQHkMWe3qdYU/HmvSBq3YXaycptjgX2aKr/mlQr6WCk=;
        b=Pz0MdPIS8jASWVo90JrB5T/DQ/znfNThW0Bq9CdlI3Gs3RSAhLGRAH4BCFpQFL56bB
         DAe7RLXjAXOEmSjBL2RXfPTvK+GRb8g0S6+5R+SGLkLSj6aDuQL6+F0sKekVnhu0uv6n
         D9iF876dTor6FGYH7KbQDArWwdvawNDjgQeqtLkqyIuAqch2j+thy7hrH4SLzr66N3z/
         Vn3f98GQwPlGUBiEw6u97/kBBqtG7zKGVZoLma4yNLQG/Vypw5nl2hhQOqg1Ab12uiqk
         6+XChRU1ooE2dgXk/gW+TuWZc75nIkI1oSbxmqZhOIqLIKFNZ0zw0YOdpX0BNWXCqxpC
         ZeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683892312; x=1686484312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQHkMWe3qdYU/HmvSBq3YXaycptjgX2aKr/mlQr6WCk=;
        b=QZLbRtGvEUEtC5nn+WvmdELkmqqpl+vNXs9jWAX9ma5Hlin8ft1WjrAoJth+ytDYYZ
         xEPTSxFKzKBK2IA6JzaEG4U89Ti8D3w2yE1GxMf8Rtqv/s+HbguR5tomm+1prgbXC8lt
         dvSJBGjKDScc26oSW0PXM6v7FtF4UgDXYflhh8EaI5WIgJAm9ep14vKQGnSmaL8Lzngh
         hAhsZ9YmHATFBsb1H85VPBC07v/aPpbLJqntrZCy6nx1pNzCHbeiX25ECIlYYnI5/DTK
         itG0/H4VYShtg34Ry9oCF5mOLXKjyRDpFZZXibnXPRdpG07VPn0neuI8QnJsoUOyfNvj
         Sz3g==
X-Gm-Message-State: AC+VfDyehAdgAX36YB2ysq7+BxCzGmWsIm+MLWWsPQRiLRsCAE0SUa1V
	TtmqtHNUz43TGr30Qn+R0FI=
X-Google-Smtp-Source: ACHHUZ6v+ZT8Ft6DgwrE5EvkMuX5vTworuHq1/zgwezLGbuuvX17AEYqdQTqyi79LLu/cP3wGp/E3Q==
X-Received: by 2002:a7b:cbda:0:b0:3f4:2415:617c with SMTP id n26-20020a7bcbda000000b003f42415617cmr12020968wmi.6.1683892312291;
        Fri, 12 May 2023 04:51:52 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id a22-20020a1cf016000000b003f42d8dd7ffsm9013841wmb.19.2023.05.12.04.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 04:51:51 -0700 (PDT)
Message-ID: <8603c2b2-2a5b-48f6-9b08-9b3b518b716b@gmail.com>
Date: Fri, 12 May 2023 13:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Content-Language: en-US, ca-ES, es-ES
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230511133226.913600-1-msp@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230511133226.913600-1-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_045200_408558_9A9B1922 
X-CRM114-Status: GOOD (  15.29  )
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



On 11/05/2023 15:32, Markus Schneider-Pargmann wrote:
> The given operations are inverted for the wrong registers which makes
> multiple of the mt8365 hardware units unusable. In my setup at least usb
> did not work.
> 
> Fixed by swapping the operations with the inverted ones.
> 
> Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
> Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_gate clocks")
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clk/mediatek/clk-mt8365.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
> index 6b4e193f648d..6d785ec5754d 100644
> --- a/drivers/clk/mediatek/clk-mt8365.c
> +++ b/drivers/clk/mediatek/clk-mt8365.c
> @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
>   
>   #define GATE_TOP0(_id, _name, _parent, _shift)			\
>   	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +		 _shift, &mtk_clk_gate_ops_no_setclr)
>   
>   #define GATE_TOP1(_id, _name, _parent, _shift)			\
>   	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr)
> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>   
>   #define GATE_TOP2(_id, _name, _parent, _shift)			\
>   	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr)
> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>   
>   static const struct mtk_gate top_clk_gates[] = {
>   	GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),

