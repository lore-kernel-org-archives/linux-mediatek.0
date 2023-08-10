Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666B9C04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 07:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhpGgdbtPxtlzBnzGvNtLx/+CntVAPL8Getc9S/EtvE=; b=sGm9toRwue8Td2+8ODz7ntSTVe
	Ko3c6GC9lDicbhIp00DQFq1mcGl6rXXcBnqTrN9bjSLlafaWYPd3kZyUCMI9fHaKj5WsKJNNkn1o2
	Lpk/gYo7JLT3Xg72U3Rkv8Ml011/EXSmTGD+qZNBa1wo2OF+HsPIP62v4sIB8PVUEaqDrqg/9wXmX
	QW22YIeLDr4blQHRunm0mTZnkmn+ABmhbgJfhwhqR4MsxpoaS3Er7u9GX78u5WsZFtmSLWTW74C8o
	BdbHlXL2x9UHVG6TKicg0wBz02a3Sa5hx+F+J1mvI9Vxo27Gu4wf+/lD8QqoqK7Vu7/fVr4l9o52K
	c3SW80Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0OL-006mYS-2p;
	Thu, 10 Aug 2023 07:47:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0OJ-006mXV-2V
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 07:47:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52340d9187aso693459a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 00:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691653647; x=1692258447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhpGgdbtPxtlzBnzGvNtLx/+CntVAPL8Getc9S/EtvE=;
        b=TCouXo8hPM/jVxiHx4HiCypCk6rJQPbI9AuhBPVcn/DeoHQoGs0K/qmCBg/fXBxrnm
         x9ndiKsg6ceAeVt7oq4Ax2tf5qYsxftiA8FXg4oYaev50pnzZ0Ndp7Q5YOHJqxUNhVod
         qyQi4hFrls3IYYHvBlt23AoWpVRhRZnIhEm6+jfNyVfgIKcmJD7VmucVkf172J7NdzpT
         U497GQCzvnuf6QEpie6uMYEQDyvoVDoisfnAMpwkqdfcq6xl+xKIgUtw8M/p2sM5uLkM
         WTcUgemTcfTqlK7Yij1gZunpx3csb95oeh96TtGz7ByTAQRAZNyRkHay/kkaLS5hAU4N
         jkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691653647; x=1692258447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhpGgdbtPxtlzBnzGvNtLx/+CntVAPL8Getc9S/EtvE=;
        b=hN4q5+t0THYdLe0UB3FPI4hx7E1IT0L2rrcqyT95wgGzsu8B+PNk+TRvA0MBj28HX+
         vOV5ltuJH5tkt+J7lroeGR9iGldEITqSFpb2jwnmEwANAe7f5kXHkH3OokpCJaGBlWCy
         0U8V6pZIzXOwlGhvkE77bv9MFf/P/Hl0d1o9JOC+A4tJ5mlNqSGofQ/l/wVUVTW3UbXT
         vrOKVmknvDU2LNm3A3u2c+MZLY0U9P3SOIeaOorX0bHTlD2XYOF7BOZKibngIXcptVKP
         VDFEHvza7Aiewoq5nSoom4V13p7mGrthu4c0lymg8q/vohmRCp0tVdXiNvnJasiF+Tcr
         669w==
X-Gm-Message-State: AOJu0Yw2JJreVQCHLIIjkkHa6MrYazvmxOTanUT2ZHQyzZd4PgZ/usl7
	3ZkHk7mwH71uesEZMzfejplyGg==
X-Google-Smtp-Source: AGHT+IF9zsTmioOuHxTFGoxEizbPFEc/AaHn3qyFS7Ire5UldEq2+XXEFPOCEZP4aWihn4A+p0JOyg==
X-Received: by 2002:a17:906:2189:b0:99b:cf0c:2cb1 with SMTP id 9-20020a170906218900b0099bcf0c2cb1mr1357849eju.66.1691653647608;
        Thu, 10 Aug 2023 00:47:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id w20-20020a170906385400b0097404f4a124sm560321ejc.2.2023.08.10.00.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 00:47:27 -0700 (PDT)
Message-ID: <137a734e-0e5a-5fcb-f0d3-1fdbb5e8da34@linaro.org>
Date: Thu, 10 Aug 2023 09:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Judy Hsiao
 <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela
 <perex@perex.cz>, Rao Mandadapu <srivasam@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Mark Brown <broonie@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
 <20230810063300.20151-2-krzysztof.kozlowski@linaro.org>
 <169165201641.3911557.18445521260746432395.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <169165201641.3911557.18445521260746432395.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_004731_815701_BF8A8491 
X-CRM114-Status: GOOD (  14.72  )
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

On 10/08/2023 09:20, Rob Herring wrote:
> 
> On Thu, 10 Aug 2023 08:32:50 +0200, Krzysztof Kozlowski wrote:
>> The mediatek,mt8188-mt6359 Linux sound machine driver requires the
>> "model" property, so binding was incomplete.  Reference the common sound
>> card properties to fix that which also allows to remove duplicated
>> property definitions.  Leave the relevant parts of "audio-routing"
>> description.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/sound/mediatek,mt8188-mt6359.yaml  | 17 +++++++----------
>>  1 file changed, 7 insertions(+), 10 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 

I think the bot responds like this if the patch could not be applied.
Probably we can ignore it.

Best regards,
Krzysztof


