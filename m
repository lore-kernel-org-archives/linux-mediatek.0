Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B8C54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUemC1MXPL/JaIYDmlst3JLErWijJgIj3ok6l2ll1PU=; b=goAaOqAS6GFpddVgjw/BNCGD2b
	MhiGESZMILI0TvKPR0+nyv5ulP8QOsiUwy1IQ/uGPLt9HYqwKvAHdEuvBl/XII/5NZNyotmglv3Ag
	dc3LotrwS+U2UNbypVw5zJQKdZEZJm/wCa9JXe2YtIV7l9vQO7UdMMyR+KEoSkgL9BfdcUhk3Wds+
	HauU7i8P5y4htxFz3PxfDjQfmW/3XNxulDlSSHeWEgY0BxfdrHmpGqhOGcGIBdmQpa404SYAXkfy9
	7fqdNQsGhvVo4oerRwsywUPG606LX0dHv3d1xP7zBtv9tbAck07g8onDhzlj6wSvR3JvdXlk32Bw6
	q0BZfmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr26-00EYqg-0i; Sun, 18 Sep 2022 09:56:14 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr1u-00EYjI-KF
	for linux-mediatek@lists.infradead.org; Sun, 18 Sep 2022 09:56:03 +0000
Received: by mail-lf1-x131.google.com with SMTP id o2so40112471lfc.10
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yUemC1MXPL/JaIYDmlst3JLErWijJgIj3ok6l2ll1PU=;
        b=UZSdW8AZrZp6PBEjJjex53RP39Z2oiGownHfjQzCDL7fk7BReKrN3r+HMO2yuScvxH
         XbSsXkzA4aKSFDx+W7W8ZQjUP0ka/7zXAQAiONCaOKbJE4aBu8BzOZP7UZ+B6YKRQjMr
         Oo/FX3FU9A1XTKpwwq3tAVqdShSVzeYCQFW2z8FffBs01Y8lu3IHRHSiAeVurTugDx9Y
         Oj0dGl3cUBe3QD6dXLTBta1kqWS8gIb9yJc+sllwoGr1ghdWsGe1I470Gb7a6OJ5EkG7
         OYVCUhojlGkqTGkBsc2ImBSiJDTGWeJ9QnpYhN/5OJ8giqkte4LlimEhthcxPcHjPixc
         yj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yUemC1MXPL/JaIYDmlst3JLErWijJgIj3ok6l2ll1PU=;
        b=1FrW02I91WBHD+L6MLctC0COrFbCQW1dKqbhP9EhiCOcE6NRoNQTYMMPg3xyJHEgz7
         UWdxIbgK2G3nvqWyQ3SI1PfjwpUZ6HT6uYRvNwJZC2UdUWi7Kz2FQCgZ4X7fmFTMt2bo
         DgUm5NmsK44sIbBnav/+fOWBUgSlTJTjwL2K0i9Qc/ywFdKqDO/HnE6pEDrmTvYOnNak
         8Sx4672O7j/wpLwERY1C3sBtZd10pAaAlHVPIi8Rp/IgDzFtp41x9FOMtuL5Dpx24lZu
         wvWwTNUy/TtAf4b7CgB6rx0UvapIw6/xyMRp/k5z4y0UjhN2BIBcG//qqs4AsWrAfunf
         CBRw==
X-Gm-Message-State: ACrzQf0fXqgNhMuHKki6ZqhgVgH9/CwJvuUrcCX/VbOIf18ixTAUegF1
	Yz3O3sBkDv0XG9pbHsxq6kYlnw==
X-Google-Smtp-Source: AMsMyM7/EmyPdwCkxqsT81Z6iMAYE9zZw+b1gy8ishOWnnVcX90rMlLf0CUDpbGWHokoKce94U4E7A==
X-Received: by 2002:a05:6512:3047:b0:497:ab72:97f1 with SMTP id b7-20020a056512304700b00497ab7297f1mr3971683lfb.624.1663494960057;
        Sun, 18 Sep 2022 02:56:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id dt6-20020a0565122a8600b004976809d6a7sm4578812lfb.283.2022.09.18.02.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:55:59 -0700 (PDT)
Message-ID: <de3ea9cc-e8e3-71ea-707b-c9bce7166d0f@linaro.org>
Date: Sun, 18 Sep 2022 10:55:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/7] dt-bindings: leds: leds-mt6323: Document mt6332
 compatible
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sean.wang@mediatek.com
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
 <20220915091214.59673-7-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915091214.59673-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_025602_672234_5C173912 
X-CRM114-Status: UNSURE (   6.28  )
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

On 15/09/2022 10:12, AngeloGioacchino Del Regno wrote:
> Add support for MT6332 LEDs/WLEDs with compatible "mediatek,mt6332-led".
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

