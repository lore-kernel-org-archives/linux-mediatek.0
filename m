Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bL3NPBKC1kEbuitJnnmPIhBYUVgSsigAUyYTUOdA+38=; b=sdkXQ/kisrNXiZ
	Ok0EKFUG8eiyRVMIZhNQbvqLr2+FivGCKLvki+HMZHqkNoKBHaiQBKTnKQBdpcN7mJg4qDTS+sRhg
	NrrgapkYr2PkyICKhW5S72zKgEy05Rwn+q8BqTSdj4y0kv8DXu50u92n4cdRvZvvCvgtfRYBm8n+f
	RCj5VtJ5ho6BPhFyQsxmbFM+KqC1JCaAuFxdqd11ZwOUx7TBgbNdFxhRbjRMXOKrPM+AOFzzEYeM5
	dZPwmb3np5xMxd8l8z30gppKnjcW7YwS5ePuBk5cO0Zdkhod4CPzay+tO1a07NQUTtYms31wX6bmg
	MfZ3uspuMknKkAQKaNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHVG-006WV6-JR; Wed, 16 Feb 2022 10:25:42 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHUa-006W71-NT
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 10:25:02 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8C02540811
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645007099;
 bh=YSlDRmR6HZ9aZKr/Lcfq0977piYhJk2IERAtVdzaOd4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=PxUTowp2/V4QZLg6Qk2tohPasx4HqRBl6J1bDLZqOt9MBt3wQzTwm+Yg8agyMvdGE
 Jh9CGvKYvnvXctYT5vRZyTTwQT0KK8J8oUkZg6SK6Y4gWWmkdSWolV6W5XcohFZSIR
 mmiPWvv+HHXY719q1o9aV6rclaRjx+wyujJOMSbm0Slm4PHY9eyxpULd7IIAftsaVd
 hcJ6+OesiNyBeE1lCc/ShOLk+8Kshha+B+ZcFWcrgW70PlV6yI4/ZMZNLLijm5t8mj
 d6Wd6pOstsZCTkZocVAN0JNZ4ph+H0c/cdyu920okrBUFBT3YISPhD95j+c/1VeBuA
 +yCW3d8iZXnlw==
Received: by mail-ed1-f71.google.com with SMTP id
 l3-20020a50cbc3000000b0041083c11173so1291624edi.4
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 02:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YSlDRmR6HZ9aZKr/Lcfq0977piYhJk2IERAtVdzaOd4=;
 b=iq4X9WV4VjhmY5cZIzP148QAljZlGhjsH3jw+RJB3uVxkDVa5jY5rdCIfo1mgUCPQ8
 7vfxoWPmPmxRBocm6jLCioqTM7M0x2PkhZ2yuq603yi+A7BglwK3GHsWUf1xQLr0xb95
 7jQT9q+GqF4UVBQs4VU+i9zuwAERJPYGRsqdX0EHiqXIbKcU/Wc6ou6uwej0YpnhTbAG
 eqfPKC+j2umH2/i4G+9v615OUxcJIXVowf1A+0mUYbVBjpdRwSp1CUC1ZII128+ugCY4
 Ac7BEdlfBttGlYU8tfHVzpoKlSl0KmjE7gHc6rYrQRCITavanhQRjtbw3w6ztpJzwT36
 pifQ==
X-Gm-Message-State: AOAM5308ixPsuqQfuhJ1sho9NOLdfa/LlqRaeLns1DeTktyzI2NBM0Iq
 hNlvAuQZjhQQ6wwpf9XAO2FPLhZYIgaPgYwX3YIC5doKnQi/cyYmlcSdIBF+inOx2OG2SB+9CSX
 TRevw4wRt15YCAwTGryuhBe63SQWR0I8ZE7ksguAc93Xuh/tfRw==
X-Received: by 2002:a05:6402:27d0:b0:410:b9d9:207b with SMTP id
 c16-20020a05640227d000b00410b9d9207bmr2244811ede.208.1645007099219; 
 Wed, 16 Feb 2022 02:24:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDh5xpNIVzVrjUqlDP7kPcm5NQeqk5G2s8lLOf/pc//q9vQC4/dfHu3xfES8jYs8Ppso/IYw==
X-Received: by 2002:a05:6402:27d0:b0:410:b9d9:207b with SMTP id
 c16-20020a05640227d000b00410b9d9207bmr2244780ede.208.1645007098993; 
 Wed, 16 Feb 2022 02:24:58 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t4sm1473803edd.7.2022.02.16.02.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:24:58 -0800 (PST)
Message-ID: <6807587c-7135-855b-a9b3-26a55f2125d1@canonical.com>
Date: Wed, 16 Feb 2022 11:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v2,3/4] dt-bindings: pwm: Add compatible for MediaTek MT8195
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: allen-kh.cheng@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-4-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1645003971-16908-4-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_022501_042997_3E2090E8 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/02/2022 10:32, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8195 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
