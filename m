Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5496CC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06xW1jLI62seO9Abhqf7FvVwnPtCd5zQbyZloWjUVF8=; b=a3WHUzT7aUdVD4xKPIknhjXoBu
	IimDyeF5z60QAgWktRWSrp7Cj1XwR8i9pBrOH29rFYSOIXq5Z5w1LwqoFBHkVBzyCXbh4FjhhPcYE
	RQQ0emymICMD7yF7EBCJ0qzhkIoY/cuzPPz34tuHlbHuqatU2k+5KDJt61voYOLesX3eKY83N79a/
	ZixADjNOTjbL7uGo88eynLUCLzaHzw1xIIwqWEh9KTwmj7n/wYUxg+DaWFwjKuFdeLyh3MQwsZfPA
	KRxH03huZMA2hzJrpuiCbt1+o2jAxji2M0QBRa8neYCJ2b/BhbY0tfjOh5UM6U9A3ir2s4ZZlMHAd
	wcA55kKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6Nk-007srB-5b; Thu, 25 Aug 2022 06:30:24 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6NY-007sm3-7p
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 06:30:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id d23so22571253lfl.13
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 23:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=06xW1jLI62seO9Abhqf7FvVwnPtCd5zQbyZloWjUVF8=;
        b=Xp1VJitjfneppA5ItyJbrwobLKiJktUPWTA3Y1e1m8wRQrWcEUDLziByK6pc4otLjj
         WfLxaGtsT9q2g+Pf/M9H6mCz9mwaVGySTC2KCsil15m19xi0KzeJQmmaZGg1evoc5IxO
         mcuVCcZ8H+ZAksS/LnZNZGjsOdf4mrk7+wtqUvSsD2XfExoNatAshEygSvmYd90xKNyC
         +73IxW2mSkX/spKZzU80B48EZ5YPWpnVhbUVx7VjEMGb9FMeRVsOQiMv3r5ueN9aPhMP
         JhpO2ZCNHy80Dk8qZgubo0tF1HwcqmaaCDZ05OX01xcbFrXXR9bFHiGdzTRrvaqfH3yM
         /GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=06xW1jLI62seO9Abhqf7FvVwnPtCd5zQbyZloWjUVF8=;
        b=y5PAakVq89WrACLsnThgf9KHOer5wgYNkCr5+kIwt7NTo8fj/SLOq46scOaOmKls/u
         qT9z+8I043VJ2CoK8bD3yC940SzC9D1rMCItxURIfK+vE8JSrJlVNcjXK1A4XCR3eJlm
         PTIZCo4+FcTLm59LMUSkSIYX0yLTZvlDmze1K6SqHJtahqtAo2NmhXGt9s0LFtvpCW1s
         2J23hdJuGTSG1eDBV35M4kXoRJ5AadyuWhkTvNHKQHX+f6k0R1TVYiYm1vvrdIBIfYjV
         BEWbAgIWPwK4j0el/6ibx9eaqziTi2Q3uIvA6BUQS+rruI8u/w9oW/ZCBkalBF+8aDEc
         JaDQ==
X-Gm-Message-State: ACgBeo1ichp2xsHgHR3w6uW945Ffl0mQKBodc0LSkTfd9wRBwYc0XWwb
	33qJeOjDm1gzIOChB32uUdHl7axmhjS+8ckukDY=
X-Google-Smtp-Source: AA6agR5voLFMZFTTgJvhNlxJQbRcDTQfj4hRCUGwRZmiTfWs0TLDdpCmpd7u6VEOeHEanOx6DfWmwA==
X-Received: by 2002:a05:6512:c12:b0:48d:231c:3099 with SMTP id z18-20020a0565120c1200b0048d231c3099mr634468lfu.462.1661409010359;
        Wed, 24 Aug 2022 23:30:10 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id x4-20020ac24884000000b00492c2394ea5sm321001lfc.165.2022.08.24.23.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:30:09 -0700 (PDT)
Message-ID: <7c502652-983b-f282-f989-b224942f27bb@linaro.org>
Date: Thu, 25 Aug 2022 09:30:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Add missing
 (unevaluated|additional)Properties on child nodes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andy Teng <andy.teng@mediatek.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220823145649.3118479-6-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-6-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_233012_293446_1A64D285 
X-CRM114-Status: UNSURE (   7.95  )
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

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

