Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102EFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXw7gPwpzggIVAqXBXArcvU5ahrCA+6QfRk6vRxcSoo=; b=ZqkXPDnqtny7Eo
	gq+w85YJ9oKoqyhQ4jwsMqG+8/MJa112Dvwem0aHdr+vhnuDS46JJtXiwkNqZa51JuFVEX0+vE14H
	Bi6/Youuh4cKGrX7kn2htF3IRMOw+BDo70nSw4r3NAyhJI18wZx5v7stgQhiV0+YY9cLxvYtPBozj
	KKEVCOo49f88Wwkorp0GwhTzIv+rpA3SuwOzNkwshfKNNs7L1cZzf3mBJx8MqK7jpxg+1iRZGWwI2
	TsOjub+CMCSR1IYpttlY305BoKkhl+RsrpH4GOlSGpz2jhT0QPEMfG33yM9Cuzd1oOyeDgf9eUnga
	2PoOThTNNpsD5h1DMZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqc4k-008Sr3-Ga; Mon, 16 May 2022 14:51:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqc4b-008Sjo-6Y
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 14:51:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id g6so29213654ejw.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 May 2022 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uOxNWh7yabHDrbMrM0Z54oCYMU6X2Tmhhr4bpaZlq8s=;
 b=fRNJSoxj7giRSyQy0TVYlxEPinl12dnHdkFzDvk1D/dHyFl1VZXFh4KWjRwx8lB8lr
 m4jpauyK4bAZcNzAWg+/V4WUux4FUyrEQka080XO4bipiNeA9kzXpEvqqC2dTINgx3oa
 RuWuz1NvyuJ/arOWE63/iU3+BpG8Z96CoPVntmaPbEO/7+3/jiChIGPDuKds61vUTwM0
 +NPNeOCoqvtwV4qQAX+ZwplH+WT/0o1tRCeufiOslW7dlU5GwY/cSPM1nPWVtxF8IfGs
 E8ub98BW4pYJ7a9i+4Dh25pMUsT8SQ+Bt1NbE4VUhd3MJTC3TvWaeLRfnBU4Sj3mqnPO
 6SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uOxNWh7yabHDrbMrM0Z54oCYMU6X2Tmhhr4bpaZlq8s=;
 b=KbMUop5DNDiFA3b63Oa+wCaI6JzokkQd5TPx6OA3qd3gjVO53gHBwqe+k/aAwZ4uDN
 0OuJ/uIkOs7pLLC9XrloSt+ZkdjeNUH3Oc7I6jcg6Gkj8UxONj52Fs3bBj9rQvLCY842
 qY/3tGWzLaXGHcuhB7YQ8MJNi7KVefAzpvBcdS1YF734xWfOYcSemnZpUvwB7s1K93mO
 Il4yUwIXu2RflYirFdIUfkQsSBpPmC8UUMshZvc4ofHXpM2d6yeAPdn16trorqXN9pbo
 iEnSl7XeAQqZlKv4d2epKMOE77hdMqiZTnlDKqHbe9a6JYVHwKxds8OgNcfkdUql8F43
 uDDQ==
X-Gm-Message-State: AOAM532hA2H6C0UD5yUexvinciehE4M7/9B5TKXH3qKeUr5v34czYWbR
 QzR1UMKqs9uK+o7JRCdpUsn2xg==
X-Google-Smtp-Source: ABdhPJxaAJZbuIA8SR9ZufnKLS++8KuZsJE84jXP4tu+xwDtfpKQXu3jisHIZIVRufznRUYH6G6c4A==
X-Received: by 2002:a17:906:4cd8:b0:6db:372:c4ba with SMTP id
 q24-20020a1709064cd800b006db0372c4bamr15448039ejt.57.1652712702161; 
 Mon, 16 May 2022 07:51:42 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 3-20020a170906100300b006f3ef214e40sm3733974ejm.166.2022.05.16.07.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:51:41 -0700 (PDT)
Message-ID: <d78e1936-a0ab-663d-1381-b537bfd7f07d@linaro.org>
Date: Mon, 16 May 2022 16:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt6795: Add fixed clocks for
 32kHz and 26MHz XOs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
 <20220513171617.504430-6-angelogioacchino.delregno@collabora.com>
 <03e99a02-1233-3882-e1e5-24ab1bbaf257@linaro.org>
 <0f303425-3b12-7573-b201-030d4d044db8@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0f303425-3b12-7573-b201-030d4d044db8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_075149_287715_4E38F9B6 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/05/2022 10:51, AngeloGioacchino Del Regno wrote:

>>
>>
> 
> I should reword the commit description to be clearer, sorry about that: I
> went with "exactly what I've done", but looking at the actual diff, it is
> just a rename. What my brain was ticking on here was about removing clocks
> that didn't really exist (uart_clk is not a fixed clock, etc), and adding
> the ones that do exist.... but then again, the result, casually, is a rename.

Yes, some better explanation would help.

> 
> In any case... no, these clocks are not board-specific for two reasons:
> 1. AFAIK, these fixed clock outputs are from the SoC itself, not from
>     external components placed on the board, and

This would be fine.

> 2. Even if these were from external components, the SoC *needs* these
>     ones to work and any board that doesn't have these fixed XOs simply
>     wouldn't be able to work.

This is common pattern and Mediatek is not different here. In all cases
these are needed by SoC and in (almost?) all cases these should be
provided by board DTS. The DTS describes here the hardware, the board
has the clock thus the board DTS should define it.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
