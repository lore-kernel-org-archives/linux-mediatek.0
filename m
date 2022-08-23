Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D65C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 08:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvC1kycGZUq7/xp82owivjaLx63VVI1e7MB1fTwqes4=; b=fXwIgI7WmOoHX9DPs/0u5MQVtL
	hyHE5hGaD4XcUomXzyxx5UjIkWlZce7W7KZSjHYd1Rlu8IsbDWM33eu3M25dm8T4Gg6y3/pBk4ZZ0
	xGYNx1VTxoaxMkB+Jbe+h8CTUrzMfwVzGIPv9QhDoh/NIt5gN69fdfKazlnSuCTjj+LR6GpJP64ue
	ZZ8tST225RqD+OS6DuUU5TPw8F1VwVCAN3ejuEwE8L0VcU3XKHnBdnUYMi/U8Hv1MZVw1uXNjG2Uw
	Mm+4oK5u7m9hxPewXo8o5H2OuIZSon2Jjp/lQ9lhQb0ljtkLIAr4eob2bJEPZOZ3PFUmKtLfgPOqJ
	o0FlC1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPKb-0041Wf-Dd; Tue, 23 Aug 2022 08:32:17 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPKJ-0041JG-Pi
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 08:32:02 +0000
Received: by mail-lf1-x12f.google.com with SMTP id m5so8019696lfj.4
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XvC1kycGZUq7/xp82owivjaLx63VVI1e7MB1fTwqes4=;
        b=tRRDfaCQb1mENGjxM705CgplM7USLUwT0ZYlO01ujs7tE2GjS9WX5DWJy6dbIHYrWb
         EwOlH6OfSrUB6FUZe7+v9LyBryuYpQL2XogLPvTZlIjYYI1YuXsa/QZ4isRkVqYJNPwg
         Rz8lKFVsCzNvUtOu+z5+qjmD0nnfo81avth65SF91g3mEXVxF4VhoYMJ+TwteW4iC2Bk
         bESzTdhgAf6cf726g87KbXUqR3WqEpCRNxbrWhYI2ODDq1lUtZgF65gdbkSl2ib5UjbD
         hnQYfUWqg+/rcpjki3HQfr/LUSSnh0o4CQoHbSS7aiIVvYaydktPrizG3kbEjQsfWV5G
         XU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XvC1kycGZUq7/xp82owivjaLx63VVI1e7MB1fTwqes4=;
        b=j6LVuG/q+pik/8atk8sOUQNbWeQauXxamVG27IR554zQuVqZIeLZwA1fCsRKrN8VJT
         6lsREmlMKD6P5L3ZvX4yTCau/HvwffVTNcmYBP1R1V6berJRal57q67XbWdyooIUA/oC
         M7EBkLElvjEBHtKCUnPwEF1tYPN1CzXd3qSjQ51KvjPMXl5EIXwgRgWus7zpKZatavJU
         UK8UB874lEvtKbvd+4nTh/zG4t9F475Thtag3OeTUOm1MiiV2wtc6PsP5ZIZn6O0noTk
         t0s61itqGqdyrWgydMgS6UFqK/7VVih/iqigErozVl4xFjbW0MXs+RTKoOovFzuW8bvz
         fdVQ==
X-Gm-Message-State: ACgBeo3A1WNgD+Re9Thv24YTst/M5Zgl546T4fpB6u6AUtgpsyd8MJBf
	pb22gCox2pZqIrdFw6WQbprZow==
X-Google-Smtp-Source: AA6agR7aKl5wOZ3sSS/kNZcVIPkQYUN+thp3PfMhDVdyL3iVlU/KkhDk6u/PjJ7GFgmARdIS89q4oQ==
X-Received: by 2002:a05:6512:1045:b0:491:f371:ad5d with SMTP id c5-20020a056512104500b00491f371ad5dmr7760918lfb.425.1661243516070;
        Tue, 23 Aug 2022 01:31:56 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id t1-20020a056512208100b0048b28acab8csm2396695lfr.64.2022.08.23.01.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 01:31:55 -0700 (PDT)
Message-ID: <fd93efd4-30cf-f498-efe7-8db5b76167db@linaro.org>
Date: Tue, 23 Aug 2022 11:31:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH,1/2] dt-bindings: pwm: Add compatible for Mediatek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com>
 <1661239875-19841-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1661239875-19841-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_013200_040116_3EB67AE6 
X-CRM114-Status: UNSURE (   7.55  )
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

On 23/08/2022 10:31, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

