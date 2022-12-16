Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88425C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BheHA0Tcwm6n8ymyQljk2z1vC+8TH8hh+YD/X0C4MfE=; b=of2gpo45LnwhT0PTH1OlPFMeC2
	onJTiHpQxoFNV1gP8JJi4j/5kCcM/8kaEQ7r+QjEIcC5uZy4rOmFn398HZ5dWfmXUk1hX5fAbjfEU
	JZhdZUGbp/CPztWbL31FdbI+8hXUuLhSSRHiWTSx4ZL/EC9emrzUNKiZYpm63scq3GUp3qG5p/qDq
	PxTW+xMJDqPE/AwetQswMh6+h0fJzMMruXENpPI6f1QeU4JiiecMNO0YMyIp95KdeQq9ZmvWkR2KQ
	FWB4hvNF4r4kek1BtlDzJzpxkN9ErKmbguJtkIyIL7FzQwQ4xFCsTT91TgXFJbYVV7BRC2FeZT12R
	N3Iwcg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AD7-00F6Sa-5g; Fri, 16 Dec 2022 12:53:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AD4-00F6Ox-PK; Fri, 16 Dec 2022 12:53:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id m5-20020a7bca45000000b003d2fbab35c6so1673872wml.4;
        Fri, 16 Dec 2022 04:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BheHA0Tcwm6n8ymyQljk2z1vC+8TH8hh+YD/X0C4MfE=;
        b=AKseIkBZZBrqaCfkNwNc+eOqwfrvP1xB5qgAOduMfqvnWa/fl4el+6xifzPzoHdoMu
         dThO83kul7JlQEUalQSJI9PwHrXOloc9BXy1SaNNYS+GTaohbapvDJ2iA7c17ImUR/pL
         Uk2j6bXGXuATvNUy2eCZTxPY2QaZYRDXNaKGCW3EXp8C7VYgmqmHT3UDXn5ON4P5VoWj
         tODxHPhQ6dk0TlV8sn3u7JzozL5n+Gxdh7d+nJQj8+lj0M+EKpOCdv5zjTNYG56tqWzs
         T9KTGXJaolmbqw9gWZlSp+8ctPAfsp7jDTmRNpJnAxZQmafMXgXusal93noxxC/XvI/j
         nmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BheHA0Tcwm6n8ymyQljk2z1vC+8TH8hh+YD/X0C4MfE=;
        b=KUxPuGZBzoUIRwxjPWhhdQYdBeo4zVEmOI0BtxF58Z4qle8mibjixXbcryhi/hi7Hq
         yfM4LQF3BBW+SsSAu6zAQpL8tWH7DMrNQCbSYsLPBg1GdvRoyLtQShJGK9tUL9EE+BTY
         reHiOe5rUpGhTmTg++/z0vkCmXp1ULcmmYCx6GVKRvjgHElWtVHu2oOX5iS3M9eKvO+o
         rAlhQAbBbziS62Kew+9z09o0q/cFDOnz9PgIM56K8ISg9jfRwNh9fDTqlds+t/RfBgFm
         UU6WMDfagNIOAquF/dkJiRYf76lujkaYm0tADEiyKNehK5Fqa431B1tI+us/ha6xAyj6
         wAaA==
X-Gm-Message-State: ANoB5pn5P+00Fx3Yc0crSXeOH0Ps4X6Fzj7swwS+o6AAg6WO1ec97p0w
	CrdQykPtWpEcCUs2MbPVqR4=
X-Google-Smtp-Source: AA0mqf479L304eL8/K8VJH98TvI/FZlxuU1K4BcjUM7FJGorT7BHd3K5GAGOp5+Y4o4yWCg6c9hDig==
X-Received: by 2002:a7b:cd17:0:b0:3d2:2d2a:d58f with SMTP id f23-20020a7bcd17000000b003d22d2ad58fmr13121323wmj.2.1671195183537;
        Fri, 16 Dec 2022 04:53:03 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k11-20020a05600c0b4b00b003c5571c27a1sm2870571wmr.32.2022.12.16.04.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:53:02 -0800 (PST)
Message-ID: <0fc0217e-f1dd-d64c-d43c-cd47a8acbfd4@gmail.com>
Date: Fri, 16 Dec 2022 13:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v7 0/8] Add MediaTek MT6357 PMIC support
Content-Language: en-US
To: Kevin Hilman <khilman@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>,
 Fabien Parent <fabien.parent@linaro.org>,
 Tianping Fang <tianping.fang@mediatek.com>, Flora Fu
 <flora.fu@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-rtc@vger.kernel.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-leds@vger.kernel.org
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
 <7hr0xe56uf.fsf@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <7hr0xe56uf.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_045306_897466_C2233375 
X-CRM114-Status: GOOD (  13.38  )
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

Hi Kevin,
Hi Alexandre,

On 05/12/2022 14:16, Kevin Hilman wrote:
> Matthias,
> 
> Alexandre Mergnat <amergnat@baylibre.com> writes:
> 
>> This patch series adds MFD, PMIC keys, and regulator support for MT6357.
>> MT6357 is a MediaTek PMIC very similar to MT6358.
> 
> The regulator driver (and bindings) were merged by Mark.  Could you take
> the rest of this series via your mediatek tree?  The input driver (and
> bindings) are ack'd by Dmitry.
> 

Yes I can do that but 3/8 does not apply cleanly. Could you please rebase on top 
of v6.2-tmp/soc?

Thanks
Matthias

