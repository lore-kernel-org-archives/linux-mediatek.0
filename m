Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p5oDc+MTWM6fmNdT6fee7WsO1neY6yG3oroC+2SKog=; b=l1vzF2oPR4XraWOY3FhJLakU4M
	YCCJydPUIVP2CcSAXrwuG/rDp8g9GIafE6msGAf1IV9WBmjqbWjdB9DwmGvmBRY3J1idIiaQRFGss
	7htgBqyW0B2t4dbRTpI/G6kI7kEjz0ucgX8G2ZAAxZAdtetBkoRf3tDv1mY2KZ8WD6tUqG5IDwNcO
	fx+fQcDZiiRYCDT+s+Ucj/uYfADWW/BphfeaV0vQ4Tz+OndyqH74aYoaA58EJU4L5vT9oaTXjD+zu
	Ccd76KCHtFcOYeRTUo8mWw7XU6Uh4M+062ePx2xz2LEao50n7XlFheaZeH9EU6KpmIwMmXz1ah2H5
	DTEHQdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDdM-008i9f-SJ; Wed, 20 Jul 2022 17:37:16 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDdK-008i85-N7
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:37:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id u19so22637086lfs.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7p5oDc+MTWM6fmNdT6fee7WsO1neY6yG3oroC+2SKog=;
        b=uBBjW1voxPKnjiUwz44hW4y0OUzcyPskpYpLmma9r982TTBOidFXfWEVU/AY1oGo/r
         BsSVH+28HZVm32tdTVBKorY9Xws+xoppKV8+DAEf2CF+HAWKQpNa+GST9Fj2MhscSFfB
         8IxE+rxjV/kcsEx7dsy1pSqzPDlRQTK0W425ZB2gM+fpTrZKtlJ3PU+1ep9pa3/JbJ9R
         QZYNPPMzEmWE6OkbS8MzRVsrJb9rD72jjGe9stQu0AAvWsB8BQ+XJyKjhBCuDiEjNt9W
         8KkmsZZVaqswHQJOg/lSN3BuT1XY8E69JTp33XS7s3m897Uv20neR+x+UnCch2PwB2hD
         /qYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7p5oDc+MTWM6fmNdT6fee7WsO1neY6yG3oroC+2SKog=;
        b=yukvxXwROGkbSWoEBwsp5VbxyjpBoutUToXDOVCoLN6eQbsYEHdEhdDRuSi+O1m96N
         b+lhGWkv11JebVbDcEVwCoWflKkc6J8R2hraz2Sk+cYGJjmS+OMKxlgMu2YhjtZv5dC7
         3PjzEu7HXUmyNPIB4fJpa3rXYcnnjHh84Ss9ggrXJa7ssTg995KAbSM9GlqvZ2qEDz0f
         ZxTD5axAMrdA7DlHVMUPO7YDd3Ay/YCb/Bi4+If8smKVymzdwMyDr48upYegnVyKJqX5
         xZKT8ZJCf43FdY8mJuMQfIlNNrxhzB++FXsQMhC21T6A4cb3iEIDcm8fffvzRmZwsCTl
         klwg==
X-Gm-Message-State: AJIora+oxJojJxxFMn/2lqcomohkdAt+A/okvRtNLQUrtoSbpD6ALHpF
	4PMKrvkojG2HhD5tHqoPZQKwxg==
X-Google-Smtp-Source: AGRyM1v2HimajV1UlLGM1askxczmPNc2mGqOexFrLo7JMSfp0SaXQyHids9tDu8eFzlC2wiwqbwLCw==
X-Received: by 2002:a05:6512:b2a:b0:48a:2aaf:2ad3 with SMTP id w42-20020a0565120b2a00b0048a2aaf2ad3mr13421059lfu.552.1658338633301;
        Wed, 20 Jul 2022 10:37:13 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id f14-20020ac2498e000000b00488d1acb7b0sm3910823lfl.130.2022.07.20.10.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:37:12 -0700 (PDT)
Message-ID: <68a30bbd-5f9d-17d2-59fa-7b0da06ee877@linaro.org>
Date: Wed, 20 Jul 2022 19:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/21] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>, Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-7-tinghan.shen@mediatek.com>
 <YtgDu70Lpl/uPOkf@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YtgDu70Lpl/uPOkf@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_103714_796083_F42BA316 
X-CRM114-Status: GOOD (  11.31  )
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

On 20/07/2022 15:31, Lee Jones wrote:
> On Wed, 20 Jul 2022, Tinghan Shen wrote:
> 
>> The System Control Processor System (SCPSYS) has several power
>> management related tasks in the system. Add the bindings for it.
>>
>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> 
> Why have you ignored my review comments from v2?

If you refer whether the binding is needed at all, then the answer is
yes, because this is not simple syscons but a device with children,
which we want to parse/match.

Anyway Tinghan should respond to you about way how he proceeds...

Best regards,
Krzysztof

