Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D46BC7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqET99kWQwPTEkmEaCDERWkshoo1jtg8YaUv2xNlnJQ=; b=eWdcR1bZ2W4GVhwxNTod/vMV4L
	dzOmULub3uSqwQxhcyycTn84Cs8GwkjfaTtADlrbNmhEeiZYF763N03FeEthauWA5vKQqBi9OLCAD
	hmpAiTzhhfillEud69xM/VBCp5zpXdkcW8KbzzYsAWH04UPXlpjx1S5c5S+bChXOxZlGB7MHkeXyv
	7cxcxddVuolbmvMf0/trtFhygzOzAt48wwQvNal+XFHAmmA+HKvREVHdHAgeAGT+kvMI/HKPGYuuZ
	MB67YSQhqnWqExcdCDgO2D54169UzCKyZaDl8o/AMhQRM2SRXKrgxGIjBJM5bzcaDRCVH57QUfU6H
	DJiKHXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPrX-007QuE-2Q;
	Thu, 06 Apr 2023 13:41:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPrU-007QtC-1Z
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 13:41:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e18so39555352wra.9
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680788469; x=1683380469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqET99kWQwPTEkmEaCDERWkshoo1jtg8YaUv2xNlnJQ=;
        b=WP5gv/X8cSXZVUV9KYAdcq3K++8SEsc+tb1qtM2T02yTfhVhdiySCUbPfNiZNqIoMj
         odbIjmo7meW+8WKIJSp4UbF2tWnn6oC6/PTI5654szFFcMjbg+gV09Rd79PIZ5f+/S21
         iyMHYSqM0c3W+yfDYo8qyWH35jW+twcyXkkM0GTNfyVKnm4Eydi5qoVZ80YisX1nkcOF
         63LHSjVs+T+1tmo6tgtIrsVnSjO36UGQT5udGl02q9W4t3bI98N1dSmJgqxX5AtJFpu0
         EFdHqfrkr7c7scweP+PXFZev4W5p6phZZIpoES6Wnmw7hSp9/c8oLfRmJn9H79FLxx0y
         9L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680788469; x=1683380469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqET99kWQwPTEkmEaCDERWkshoo1jtg8YaUv2xNlnJQ=;
        b=r1JTN9gOi1TGVPT+P5tdtB49QB9ZLjHR4mZj1XvQG2KGwCVYJRisz2DqHkKmLHj/mb
         h8Zv7dJDmjHubwa/zRm8D+IyU8BGpAwXwmugWKyM7NGFdFJTtjIkzBJo/8kpT/E5jenZ
         62pwBB3URQdEB7NjrsYelpIQkQ/qOFsCMtuTkJtiSSD41PyHqmwvB4sY76AemCmMa5Hw
         Fz9qZulQUpjNoPZhX8nxA7+0wH0EsoQcupV/QkIIYwbGHGgueGwcAIMniIvFDMONZVih
         yWpe4YLag/5B0dqz5HIfTLj8svYMtg+3Zx1SmeIYjEjqQLGeWzJYcRuasadgiET2CVrs
         MbEw==
X-Gm-Message-State: AAQBX9dqfyzYRQvbdxeMRnMTospx8ECKEBJOzIJ+9mM6Ksagw53F8dN4
	iPa3NTLn5+nihsA9f15HFMpMPw==
X-Google-Smtp-Source: AKy350ZhLf4OyCO8fIg/dFWqIh8YWnY4krXkUYeBlyc6m45ugflq4UfuLeUBNN56Dqn+JbojgRBt9w==
X-Received: by 2002:adf:dd8d:0:b0:2d7:d4b:b33 with SMTP id x13-20020adfdd8d000000b002d70d4b0b33mr7248014wrl.21.1680788468769;
        Thu, 06 Apr 2023 06:41:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6630:ee96:3710:24c8? ([2a05:6e02:1041:c10:6630:ee96:3710:24c8])
        by smtp.googlemail.com with ESMTPSA id c14-20020a5d4f0e000000b002c56af32e8csm1814424wru.35.2023.04.06.06.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 06:41:06 -0700 (PDT)
Message-ID: <c17f1dbb-ad81-b64e-48c9-d89d3e170b38@linaro.org>
Date: Thu, 6 Apr 2023 15:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Split out CPUXGPT
 timers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: tglx@linutronix.de, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Walter.Chang@mediatek.com
References: <20230309103913.116775-1-angelogioacchino.delregno@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230309103913.116775-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_064112_537753_29DA5552 
X-CRM114-Status: GOOD (  11.12  )
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

On 09/03/2023 11:39, AngeloGioacchino Del Regno wrote:
> On MediaTek platforms, CPUXGPT is the source for the AArch64 System
> Timer, read through CNTVCT_EL0.
> 
> The handling for starting this timer ASAP was introduced in commit
> 327e93cf9a59 ("clocksource/drivers/timer-mediatek: Implement CPUXGPT timers")
> which description also contains an important full explanation of the
> reasons why this driver is necessary and cannot be a module.
> 
> In preparation for an eventual conversion of timer-mediatek to a
> platform_driver that would be possibly built as a module, split out
> the CPUXGPT timers driver to a new timer-mediatek-cpux.c driver.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


