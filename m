Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AB9ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 13:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXyPGs1xzbqWLyCKCXFzzY2n7w6S19U4Yvty6n2m3xI=; b=gEfHFd0W86y3RjloNTgOHYsiCl
	v/RYF4GMPISkLVI4PLBKojuMi1+EjvcysKTkOFmVlVwR2ZUMqNfG9r3xKYzDUk7N5csDzQUeNbxHg
	la8d7ISS+nEdd9UOyA3N7LsE4ksftoYgNGgcwOxtulMOyPt4IGzu6COWbqmyLh5TeIrheaOZItuF/
	79MtY++5mtiWVMNE8zMvZYxljJYrgpiYP2lh/sjIA1QMacWteXcj8+kV5v2zJ4F7qRgqJTjd3R91n
	Tk7mCXoeiCw4vhrWvmzbY4cr5F97dpXPEn/o4U/iU249OiZ0U29LIEpo1P1JYs6j79iRvAZLWF5xL
	kirNjfLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNeO-006KFj-85; Wed, 31 Aug 2022 13:21:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNeM-006KEB-4G
	for linux-mediatek@lists.infradead.org; Wed, 31 Aug 2022 13:20:59 +0000
Received: by mail-lj1-x230.google.com with SMTP id bx38so14578139ljb.10
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Aug 2022 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gXyPGs1xzbqWLyCKCXFzzY2n7w6S19U4Yvty6n2m3xI=;
        b=BS+iR4ydREy9MZ7gRYr2l+ma3DWnH9f+1BrJTWu2kpJujnIGn4ylhL9yE3RjvSFbs3
         qJeKzs1i7Lq8Tz2IzKqcT+joLyZ9cnHgdOu+UMz8Lfp3JZqVTg6oc2ha464C7c1nmMld
         fIrKQy0orkywCqiBh34WVfTq/TsyyiIgzoJhGZOap2Kp6iEtSjbQSSj4S8szXBp4G1gX
         sfyQBFgzd3aUxXyPuscbnqzTqTLjdBq7uhoPqmJd1Qx76soaiyNL7yaRkM3iBf42g69D
         HrMoVFeSA1yyEk512f/rdp5TL5v2k35zviPsyAd3ecqgHJyfiwbwE/qE8gNUFYObckMM
         MV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gXyPGs1xzbqWLyCKCXFzzY2n7w6S19U4Yvty6n2m3xI=;
        b=onZncPhdGMUwkCnzO6VQ/elSt8V8XVdtA0RXgbHSnkkJ2ZcsR0bjkctL8KK3ynS82T
         ZjhqCbhgeBlla7KbubLnifmNWqRAoaXCrzvxWfRJ43oc9UDS4s2M9BZBz9NPbH8ETHuX
         o0jgngmz5bFTjV7Slqy8zyBaJ+Fy/NoUHarUFV8mvYEB6KqbbWRYjK44A3Ul3IfSqxH4
         Q66d4gOdLZ4nFp+S+3C/iGkMtW1b2XXWK6Erw85KIsMFz1eJnkHFbVCxG2BS3Qn6r9xy
         b/zpLg23EYDZqKk5y+XV5afy1+ikK1HWhnLIGvu2CJ1ddhzoXlKc8TFVo8co+llpYP6P
         J/GQ==
X-Gm-Message-State: ACgBeo3ZJnqW85DDyfvMFGxMEtmHwfq4/9ENHvSdU+P/2A5vszyDxupy
	y9E3zHZ1jsRPWIDzxyr+YzWxog==
X-Google-Smtp-Source: AA6agR68vhI8/CXEZ3hYaem0vpetajctNycqN1PQYVoVf9YCRz4ASjoY0Ha1A8CPSwcomrieT8YKWw==
X-Received: by 2002:a05:651c:1942:b0:268:9b0d:e15c with SMTP id bs2-20020a05651c194200b002689b0de15cmr582532ljb.479.1661952055897;
        Wed, 31 Aug 2022 06:20:55 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u26-20020ac258da000000b00493050d6bcesm1987686lfo.122.2022.08.31.06.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 06:20:55 -0700 (PDT)
Message-ID: <330d1f46-0e3c-f58e-b916-9e8644e7b4a1@linaro.org>
Date: Wed, 31 Aug 2022 16:20:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/4] Introduce MediaTek frequency hopping driver
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com,
 sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831124850.7748-1-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_062058_209630_040A1D37 
X-CRM114-Status: UNSURE (   6.11  )
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

On 31/08/2022 15:48, Johnson Wang wrote:
> Introduce MediaTek frequency hopping and spread spectrum clocking control
> for MT8186.

With one line introduction, you do not help us to understand this. :(

Best regards,
Krzysztof

