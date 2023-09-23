Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89202CE7A89
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RYcBLgXi2Usyjv8O8F7jTAVsfiwldX4rLiaCjIZSoY=; b=aUWfp5LtTKZKC6M+ce3UAaPlbP
	v7t2acfcM2EsAG40i4xhEUpQXwt0vLAv34dpps/wbU58xI6lTUBWK1RY32SLJq96mcGY0kR0RZSoj
	PcYi46SJWIhBw4Odb2DOg3F1nd7pR2hyw7Ll0vNfU8XBduaZAzqSJdAO85phrmpCfYkGU1io1GUKU
	PwqTssIIADrJy8sY+a261kkEyNW6PAGIDpexJ22DpwICU0wcG9VeH2q9DlFwiWThGpHCpt1DFaDHe
	TI3ELu8SqEeYslb9lSggpwZsVAWVLDjUphfdUka9zJFaqIgSo6KKg7tYdSe/eWWrbG2Lo8ZTO+6Gt
	pqN5EIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk73J-00BIv9-1Z;
	Sat, 23 Sep 2023 18:08:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk73G-00BIuJ-2x
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:08:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4053c6f0e50so29938185e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492501; x=1696097301; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RYcBLgXi2Usyjv8O8F7jTAVsfiwldX4rLiaCjIZSoY=;
        b=HNxs+PyMwiunM40I2h3XHQDy1+/yR9TlrNUZQ5h/gKpczTMrfxfnsH5jSXmneeKzck
         nxGZoGw5jewpsyvCo9e9yVRZOALTBYWSKOruL8b8woKokjidc9vGqoPGjPoScO0O5yEn
         NDyT39gVcLCsLzsPaJA7LDZxMAymo2psL1+3ZJWT2zge4z1RqC92gb30V6FoKcocI4Mq
         +dAObAQmo9faBReTVJLqJ7az0Qqh2+rTD65YKiuwYKRiTVJhbc16rPUGPyrFDXSGmIim
         I6m3cs3M7LyXBkAMdpFG7B+9E+8L9c/z5uohfC+GKdv4Shd/tnPt1QpBUvsMjZ5kbwUD
         /87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492501; x=1696097301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RYcBLgXi2Usyjv8O8F7jTAVsfiwldX4rLiaCjIZSoY=;
        b=shUCmn7lfylkvdzEtGkmSpJPtUDJjokAUOLTR33ZIvYgukVcPZdCGRiJIIUpVA9LQM
         JqUjlLt5KwYLTS71zUFUS593IJSHB0z5CNRd4V2KAuANVYxXYQFzBplBjwK7STbqSShq
         vRwLYCDSB2G5eXfmule5t4AjVAjBfF8f4+f5QuIL5t4sEzmd8GwGlueyoZobUCdddogA
         6169EbkXAKLCZ4ZRj7m5+YuIARYaltKiyHHGQYnp3CROL4Xscv7TeYXzVXtbSpuB5XRR
         VFX1HaBH53yJJaWrN5EmiQIAY4bsjYscp6fVrAG6s/grRlJUHLHnqeGSi2gPn4AL429H
         Olrg==
X-Gm-Message-State: AOJu0Ywj1y3iVH/Zttq5ylXG4eTOIFNI8Nse+J3O1/nbE5Q8yo/aCPrq
	pNIZmJPUbECnx/Ar8OTdPcTIoA==
X-Google-Smtp-Source: AGHT+IHgTWwCB7z8DnJNi+Zreo84MahTyxYFZoaRGkQRiDLl6+zBS9mKeFPkwSsb23KkMMbqczLODw==
X-Received: by 2002:a5d:6b51:0:b0:31f:d95d:20a6 with SMTP id x17-20020a5d6b51000000b0031fd95d20a6mr2321405wrw.12.1695492500957;
        Sat, 23 Sep 2023 11:08:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id m12-20020a056000008c00b0031f3b04e7cdsm7440226wrx.109.2023.09.23.11.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:08:20 -0700 (PDT)
Message-ID: <ecda52ed-1d17-45e8-ab90-a9070ceb2d1c@linaro.org>
Date: Sat, 23 Sep 2023 20:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 08/15] soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ
 driver
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
 <20230918192204.32263-9-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-9-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_110822_956422_327499DD 
X-CRM114-Status: GOOD (  17.50  )
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

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> Add cmdq_pkt_finalize_loop to CMDQ driver.
> 
> cmdq_pkt_finalize_loop appends end of command(EOC) instruction and
> jump to start of command buffer instruction to make the command
> buffer loopable.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 23 +++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  |  8 ++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 4be2a18a4a02..bbb127620bb3 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -475,6 +475,29 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_finalize);
>  
> +int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +	int err;
> +
> +	/* insert EOC and generate IRQ for each command iteration */
> +	inst.op = CMDQ_CODE_EOC;
> +	inst.value = CMDQ_EOC_IRQ_EN;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err < 0)
> +		return err;
> +
> +	/* JUMP to start of pkt */
> +	err = cmdq_pkt_jump(pkt, pkt->pa_base);
> +	if (err < 0)
> +		return err;
> +
> +	pkt->loop = true;
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(cmdq_pkt_finalize_loop);

NAK. No users (and please carefully think before you answer that your
other patch uses it).

Best regards,
Krzysztof


