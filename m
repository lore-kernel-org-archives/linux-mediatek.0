Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFC4CCA47A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqCBBKJhjvVRevpKirub+RjdcNJhrbWsjFdQsoZidsM=; b=N0RH7dFncMYAE+ToRzTK+P14Kf
	1KlsFZ8d9itv4gp1FQ/IFYjVSjlGXhMhgG98NKlsUeIkPLjHkOL8QRv+DTtfIfyU09gqnndlnmRLS
	TTsyTbpVFBaYHVaDhYJZhol/YJiAauYvyi5VbadumO2b+/Axb1LWnIMV7+0zbCxY+5h0O5D1Co8ac
	FpFbsFg1Piwr0kt0/iTdiQeZ4qVbJRCaRylH320D8ktaSd9YmYLXhUTGzbLpsIDdYYtJ5hofQqEHN
	NzjHWjBrFlIy/2Mb6jrpGofUjQjp2YpuSUVi+meX1bGkaTq7gouvarcDm7IqSAkEH7UClEC7G4P/x
	+6nz6qCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pzJ-002dv0-Qg; Thu, 16 Jun 2022 13:56:45 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pxl-002d8o-Rq
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 13:55:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id a10so1486217pju.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AqCBBKJhjvVRevpKirub+RjdcNJhrbWsjFdQsoZidsM=;
        b=MLMlzJpHqLk2NTSkk+4CI6/9tDS/CcuAuC6dpww7mHmyJkrttmtnJO/CzsKVctLzxk
         uSWmtfHFtdcmmtcODHtKBEZjJDTXUKdKe+WmLecqFOF6zJKiqunDohh3PU0vQalFwjKA
         d7uiDUPkWwPHlwOvs19l2d58ZAWsYV0fw7sePeBQIPrYPZsiYO5IJW3+TGPBkwJCdCpZ
         TUBQgm+PUj2fx8W3A7arprSw311qJKS2AT37ChtVeYVsgIJHCEUXmpBrOLlt79rnM7iI
         clLazAQA26Ptz+LYSgDLQKTFIA8N4Iutdz2ZSrAPnlzZqxBBCdvCpomjVI7MWbyu93Wf
         ZrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AqCBBKJhjvVRevpKirub+RjdcNJhrbWsjFdQsoZidsM=;
        b=jmSn0tmZAg1ECuJMMHfUddxHLiIQ4ptQBcB0fomKyv3kMJqGHPyFdEQlbdyxcERdcP
         V5ZeBYnJO6ld1qoV0gogDC/h/6cBeaAtUns2dS+sAb9BJQSZ4ac5yDAaFmrhTRnvyPMm
         eIAihK4qIA7/C6Kd/NfOc3jISI9rgdckJwt8WHZW18o3o9dbMQi0BfPWFg630PPAC/Fd
         Hj384PfDTtoQrb7QjzMz9dSVlIeL8c5E/7B9Fk4SrCKboquHAAIPs67GwPhefzeshGyh
         u8L4utl9sLyrSmNT23a7BX22I1T1YRB0lqusnkkfV22Ea92X/hhoujuZsffiWmRKvQg7
         TI0A==
X-Gm-Message-State: AJIora/osmNZBw/RgNiNY9N3PNY+C+4YGZTe7J9Y6oiJAYOmNmi6kJRL
	d/hc2j1W8fbqC3aBxrU0HuVzoA==
X-Google-Smtp-Source: AGRyM1vD8xThX01mXSwdjH5o86512U3eYCtOXz7Tt7aA/zrrnyjP12qDLwKDYDuqb3ZyVxcfG86VdA==
X-Received: by 2002:a17:902:c94b:b0:168:fb7a:e5a0 with SMTP id i11-20020a170902c94b00b00168fb7ae5a0mr4755533pla.56.1655387708715;
        Thu, 16 Jun 2022 06:55:08 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p2-20020a62b802000000b0051bc3f9a1f6sm1823305pfe.55.2022.06.16.06.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 06:55:08 -0700 (PDT)
Message-ID: <629e761b-e3ad-0861-1937-ad660a8a900b@linaro.org>
Date: Thu, 16 Jun 2022 06:55:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/4] dt-bindings: dsp: mediatek: Use meaningful names
 for mbox
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
 <20220616073042.13229-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616073042.13229-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_065509_981723_B8D18035 
X-CRM114-Status: GOOD (  14.57  )
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

On 16/06/2022 00:30, Tinghan Shen wrote:
> Rename mbox according to actions instead of 'mbox0' and 'mbox1'.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> index b7e68b0dfa13..ca8d8661f872 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> @@ -50,13 +50,13 @@ properties:
>  
>    mboxes:
>      items:
> -      - description: ipc reply between host and audio DSP.
> -      - description: ipc request between host and audio DSP.
> +      - description: mailbox for receiving audio DSP requests.
> +      - description: mailbox for transmitting requests to audio DSP.
>  
>    mbox-names:
>      items:
> -      - const: mbox0
> -      - const: mbox1
> +      - const: rx
> +      - const: tx
>  

Commit msg lacks important piece - do you break any users with this? Do
you have any users of this binding?


Best regards,
Krzysztof

