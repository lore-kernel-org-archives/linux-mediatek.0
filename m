Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B2C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EranyCDg/9rde0AKk+TrYZhj6TXyu+KiL6HFMU6m/Vc=; b=NXjj68v3n7MB13PTmtQEqyCFLA
	qTjB202PNBeRxFrr7GOaqc306+h1jwjhdyds6ynnhc2Lhc4B6gsnA2oT5nhntuc64lJpQ35gkGHAw
	YQfuG8OAacbFvU6yHCJRJUw58A+U0mOIsSzI9zBYy7aRWmrZZ2YWsSBwpsWpiY1ALm0RPMNHiy0HV
	xr1rdoFLYPUgymbCH16rWHooQviV5WJhyk+ChhWeHWm5qa1n1579BAYIrT43F/3pB+0KRAV8VDHmd
	xw8aqmNiTqJFoWha1oPj9mGkbXkskt5R9DaYKNH3Mr4+BeWkUsYVN5wjoY7gY61LU+w5NDJzFlaVL
	cG73ZIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1SuO-00AURo-0u;
	Tue, 23 May 2023 14:22:40 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1SuK-00AUQZ-1B
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 14:22:38 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3095557dd99so4729854f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684851751; x=1687443751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EranyCDg/9rde0AKk+TrYZhj6TXyu+KiL6HFMU6m/Vc=;
        b=lXbZ/4cY6bh3L0O0vsZya24TPX5PgkE3gNjG7MnLWafEXib47/oB4qvLn8NJ3Cvy9O
         65gp5VUR4VVO6Rb0xlq2zRNsqII4bD43n70CHWLWCANEMe9NEko3ozAjAvl+ZMTVCivi
         vPB3nRNrXEQKWin+2CNqHRyZTqmocNsH56DN7czvai7Gcv4zzNNhzMlwwDul6rXI4NcS
         UhaZn8CBqR7iUbyoSXuNxRnYRnep4ylMm+9cBuPcwAx7S3QBuyIFmw7CbsuU/iCeg4mk
         a42rjwNgz9owQe47UF31HD8u8a/8lxNXrj4GS7S9qijb1i2fo9ph//NRGaG+4lK0xKxI
         IJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684851751; x=1687443751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EranyCDg/9rde0AKk+TrYZhj6TXyu+KiL6HFMU6m/Vc=;
        b=TGS3c0XW4VdpfA6ulwX5Aa6jd/LhSH8KeSVchkZoqxR/5E221eGyfVoLUh9DYqBTdF
         ss/RIc1PMUvXXQBSV5rfsRvZb6k3PUQd+F+kncD2ig1weR1W/27bBT/eCCLoMiUAgBJX
         zCGr2+BaXpMM9UsWHofXpnzgQ05QNuHa8SiB2KqTwVdf+AXA1PlJ5npp4J34ZSq/7Ylw
         sRLEftvVfmZb/JWRKC6dqF/6AMSEELWGAe6XlYD+p3PMWu6bv/bfzuc167XhRlpgowWa
         BRL7dnGADVcLFlPSj50qz1AFnzX8bDMYRad8xC5+n4JGEsMgGqtpBN0u7zlP/DqwpoqC
         kheg==
X-Gm-Message-State: AC+VfDwmzev1ZvXAl206kYWqUFXSYDSN+/El6dGPTRLVsLagdOcarEOw
	cAop8M04May2zvbBwB8NPZTGGg==
X-Google-Smtp-Source: ACHHUZ4CeNjN6dEni8tyfgYEbyM8ejjEVm8OHV/gr0I9cOmBWMG6V5ywEC801CZKE/maISgSoiHhrQ==
X-Received: by 2002:adf:ee49:0:b0:306:3b78:fe33 with SMTP id w9-20020adfee49000000b003063b78fe33mr11199720wro.32.1684851751343;
        Tue, 23 May 2023 07:22:31 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c024a00b003f423dfc686sm10083928wmj.45.2023.05.23.07.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 07:22:30 -0700 (PDT)
Message-ID: <1d3ba1d6-ff91-eedf-90e1-4ef5b16354c2@baylibre.com>
Date: Tue, 23 May 2023 16:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/7] ASoC: mediatek: mt8188: separate ADDA playback dai
 from capture dai
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-2-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_072236_523022_06EEDA03 
X-CRM114-Status: UNSURE (   9.40  )
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

On 23/05/2023 04:19, Trevor Wu wrote:
> MT8188 will support SOF. In SOF, be_hw_params_fixup callback are used to

Can you write what is SOF please ? (Sound Open Firmware I guess ?)

> configure BE hardware parameters. However, playback and capture stream
> share the same callback function in which it can't know the stream type.
> 
> It's possible to require different paremters for playback and capture

paremters => parameters

Code looks good, after the commit messages fixes:

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


