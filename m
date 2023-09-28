Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E89CE7B09
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLZwhKDgfdFsd3vZ+zpeV363DbF016coL6R25E3ugY4=; b=m4AZ+8EG+6beaQ
	Gr/4I3E2sa13dGp+fbuHYhSjcJi4Ig70BmL/g6OvXTeRhGaWcjXjPmQbmaVtLkRX2TpM6TPZPMN+d
	w2sPziDqQT97UDe4GPubRdDQmIT94pxIr1SfCM7WFn2/MH6oIdkJNknoRnzbJnL0AI97/8vr2i5ov
	p4CVQUTx/BJELIJ4Hg/Nh2HnZYQXarRjfcLrBtCvzzSoy5CJw9JVZESchnJZYOThpsQUmNmJeWEFw
	9gego8IdCiYoCfaCT+Bxy4HTzBMsWo1QokKCbD0W2Nmuc1Tm5IT/x6Jl9oGBSkplpp5+HJPYid01X
	gYZk1siXDmIAz+9h7Nsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllag-002XTZ-23;
	Thu, 28 Sep 2023 07:37:42 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllaZ-002XPU-1b
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 07:37:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32336a30d18so4643016f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 00:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695886649; x=1696491449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLZwhKDgfdFsd3vZ+zpeV363DbF016coL6R25E3ugY4=;
        b=F1vKN/p3kkVn3ac9oqSItqqvnJcScu5ZqWggDo0SfQQSVKOcHw1889hXcU1jpVxgxJ
         B+t8BiFgnpFzofuU7RTFsE7lIrPUwmWaaoTGBGljNC4yUbYp2y5wyaEGeKt2aKM6cEbf
         pE3q8d17Q9ou5qCJX8R/bkxKCm9Mg4B36j2h79850+SEfLyc5wF0b9lYTvhZVo1R8EUo
         wSaVQKEaMy+tiN+RgBqsMzLUCkfATULiD8iRqg/V9gfLCr44l8qxDmPCo+verX6QqpXV
         djKqe66BlJCDbtG2dJJpHt6cW+QoEm1zDRC3eR5V6KjwYLK0UZDRqI0w65A2DVl1kDyX
         /VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695886649; x=1696491449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLZwhKDgfdFsd3vZ+zpeV363DbF016coL6R25E3ugY4=;
        b=Fgrx675CBTJ6WHAmfFE23fMvCEb+hiroEFKIzqpW+1Lm6W4Gnv631UzJhf2RxzyOB3
         16DHz2bZpFmIO+C9rpFZln3ibThpn3yGC2OrwLxKk2qmgXWlWbt72lEeLfzoISsL0Cjb
         ZkLYYi6YwPZRB0Z2XhcsPQbKT7QQE4Yc70OKT9zazzQ1c26PK1WXZTeVVklGisgVw7vh
         4HIePKDcATIykX1eh08HrcPMQ3GXPvGGRtX9/ymEzKfqOvU1gdR/S63520L6b7OFbw6U
         5EFZA1qhINVIy7jqmyLZ0yx3SLnjpwpJoJj2pg/ulYZxl9Y62fLRsdcLYelrKaGw+Ub8
         Gk2A==
X-Gm-Message-State: AOJu0Yx0u9PJYdlIM+6Y2fASFcu/LL/JPKvzLYeOs9EyntHKQz7W7Cl4
	S2py8y6lONP5mOgQiAxWtjEXEw==
X-Google-Smtp-Source: AGHT+IEykS3sv6+IRCprkWFIYzQut6WfxhajwABJSA3a9n4e2P7oAuta+iEBJdwMvKYwA8NZgiIIoA==
X-Received: by 2002:a5d:4b43:0:b0:319:8430:f80f with SMTP id w3-20020a5d4b43000000b003198430f80fmr449720wrs.49.1695886649008;
        Thu, 28 Sep 2023 00:37:29 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id o11-20020a056000010b00b0031c52e81490sm18876523wrx.72.2023.09.28.00.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 00:37:28 -0700 (PDT)
Message-ID: <dc0460ff-9b72-d739-cc1b-ae6d3a2bfa82@linaro.org>
Date: Thu, 28 Sep 2023 09:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/4] add LVTS support for mt7988
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230922055020.6436-1-linux@fw-web.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230922055020.6436-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_003735_532622_205DA839 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/09/2023 07:50, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series makes allows soc specific temperature coefficients
> and adds support for mt7988 which has a different one.
> 
> Frank Wunderlich (4):
>    dt-bindings: thermal: mediatek: add mt7988 lvts compatible
>    dt-bindings: thermal: mediatek: Add LVTS thermal sensors for mt7988
>    thermal/drivers/mediatek/lvts_thermal: make coeff configurable
>    thermal/drivers/mediatek/lvts_thermal: add mt7988 support
> 
>   .../thermal/mediatek,lvts-thermal.yaml        |  1 +
>   drivers/thermal/mediatek/lvts_thermal.c       | 89 +++++++++++++++----
>   .../thermal/mediatek,lvts-thermal.h           |  9 ++
>   3 files changed, 82 insertions(+), 17 deletions(-)
> 

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


