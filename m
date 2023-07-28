Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED68EC0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gedJLHyl9jYC/USPCijx0sE3um9fSLBbzPsw2ixUmqY=; b=w0WSqkoLUZ3nq0y5wAUijejfbr
	/L7NNS2OJtBKSKPBcv1LBkyRlFpNb4R6YiptvfZKLG94WxMpjkvyNHh72WvUdFWkcGKhiuor/Dbpu
	6uIsInDxg6nn67PePzxSsbBPIlcMBfF3BjrsUM3z9wg7f6mz7uzgSOxb+0IdZ7cea09ni0NGruSJY
	MlbeHBZfprhJVbFR4KTRbDy8KG3e9Pbthv0x3sIaPW3DjZfL0Oc2SF/7E/Yst+KyttW0+g2UOxGnI
	CXC8irMgPgeyE4jWN0FrZgqx8jIadSCoUVP1fj6X0YtNEY9T5W/GlO9Iw5s2mzP1KOWwwPb3Wh5ke
	8dbITrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMwT-003NpY-1z;
	Fri, 28 Jul 2023 12:51:37 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMwP-003Nns-1G
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 12:51:35 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52256241b76so2673971a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690548689; x=1691153489;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gedJLHyl9jYC/USPCijx0sE3um9fSLBbzPsw2ixUmqY=;
        b=wZkbNGqQ3uw7mcIwc1dl7W5fqIdyvKuQUlDtB8gOcchltE1RNPokOIfX3a/CvA/g5t
         mw2xEn50S9OLn2pNFVCuTMP86YFrvZKsDIBDutAbKKuSiTQPY8/b4MCrKdJQYFfOKVv/
         Ty3Lw8A0HAfx+lgEd/6uJxOqks62xu8+dJP4KoIOWfeIZFIK1rb2giVKIpibsczYWqqU
         7k0zJTnEguhscCH+pXhGphDy2A0CNjWyoqyxlXMi54Vl+hVfx6m9a3Zt8jdwrObAQcnt
         S/tQrXjg6JBJYzZih7sFc1ERLc5iEP5Uq26CzNJrJcWUunD0PCgjfVnRAEgG4GAUcgk3
         KGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548689; x=1691153489;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gedJLHyl9jYC/USPCijx0sE3um9fSLBbzPsw2ixUmqY=;
        b=S8caZyscZCk84YOiiFTdRBUQJI8KgfFYnwH3ZnAu0bk4X6V2nEomLdWrQYGv/SED/3
         G/mLapNYJEhpsMZLFQaePbG/z41v1ci01qlTp7OSzAZp2lPDesxJqWz1EUA/Bd5kerYI
         ULxjp2KTLIHWanW+rx2g7Fe9e0HZa+tgiftiSmRBxLSKwyGZSL62FQ6zVvtgUkkkpIgE
         fidkToQy4lkU44WQEtuz42mNfhGRULI9MAQu5ZxC157gsVZQY0MrPOQCX0xbQbe+YUzc
         a7iccbLMD3PM4AYVDRBViYSytYaFOlciVCsMoNSiDiwXKCxgdInpNgCrtqb4hXwxqtPn
         gtMA==
X-Gm-Message-State: ABy/qLaMlC3lMGrO57oAbpnqwecCeRTC3N5rAWPMgYaC4JUDFJLZFgI7
	GApwYBB+OXsV+xF+SIZqvsZ/KA==
X-Google-Smtp-Source: APBJJlHax6AsxJudUM5VqzR8XMQAFX9jqhmnuuAP0jJ/YQ0xu9Ni7Sg1fWIzJHA9rNtfwWtbo3ixhQ==
X-Received: by 2002:a17:906:319a:b0:994:34a2:8727 with SMTP id 26-20020a170906319a00b0099434a28727mr2157378ejy.41.1690548688933;
        Fri, 28 Jul 2023 05:51:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id sd26-20020a170906ce3a00b0099bc08862b6sm2054522ejb.171.2023.07.28.05.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:51:28 -0700 (PDT)
Message-ID: <a4f071a0-9e41-4de1-6721-f8d47475f41e@linaro.org>
Date: Fri, 28 Jul 2023 14:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-7-maso.huang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728090819.18038-7-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_055134_263242_469BFD35 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

On 28/07/2023 11:08, Maso Huang wrote:
> Add mt7986 audio afe document.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>

Thank you for your patch. There is something to discuss/improve.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents

You should constrain your clocks per variants. I doubt that they are
really so flexible/optional on each SoC... or maybe missing clocks are
result of unimplemented parts in the driver? But then this should not
really affect bindings. Bindings still should require such clocks. Your
DTS can always provide a <0>, if needed.


> +
> +additionalProperties: false


Best regards,
Krzysztof


