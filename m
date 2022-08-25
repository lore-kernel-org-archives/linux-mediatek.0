Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92D2ECAA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv80AdlB+SsjBLoDIgwEjmBWdBKDGfqlqLNj3IFDEQs=; b=bPGXakNL+ESq7xPqPMDVt2QxRP
	baEOFa8WhI9zyGPtxt/5bqC7Tv8KAlsRXLVbpsg8+c4u4HUP+trIWWvE7dRlKoSsEf8F6+K0FY1yq
	PvvbkZSK39vP8tD9d0ZqewB0TmMOf6E0pZcFtDSQywefP8Z3TjJbqVJorblST8QGXQelRs++EE2qo
	3Wt+kEJSs0U1OwEUCt5o8D9VdqiYby2G/a31F2tpKLIFi5qVS2DsFZMQx01FwtFZEpM8J2XcDOAao
	qF6wzR9w9wWPg0H03z6csVy4qEhuMe1ezjlHhq9ZoM3f9hR7qsaLLbVEEzPyOa50GXuyniqin6cgc
	vWOI5Ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRGg4-00GsbM-Pw; Thu, 25 Aug 2022 17:30:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRGg2-00GsWB-0Z
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 17:29:59 +0000
Received: by mail-wr1-x432.google.com with SMTP id bq11so18914169wrb.12
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=xv80AdlB+SsjBLoDIgwEjmBWdBKDGfqlqLNj3IFDEQs=;
        b=MStK53Ak1Gk5mCSta3xroLD0KsZQ6DY4QsKYMe4pOrMp2u1HfYHa1m2wMVMyTSHmwb
         pS9G587JwlukyBLYXS4dWDK4ZJEBFfRRfMU8BIUXyps9qcHjYepPp5l9vtZCSA+FRQY7
         5Ym5jfikNtrThLCo6a8KYEHLolX5oMux7G5jVQ/qGES6XtoscQ3oyVgxP6SpqCsjANeL
         ntr7Jx/gfyYtsPd3d4Nhjqnaab+pID5+OPeW7AI7cgHR/PlrBmChuA8owNxA4iVdmd+D
         uR/ZT8N35oCgJRj2Q6wPHJ8zb4bs2hlkrqOdDJUnbKDR366whziUl3ha9uHOlgILoB9+
         BNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=xv80AdlB+SsjBLoDIgwEjmBWdBKDGfqlqLNj3IFDEQs=;
        b=2LUEooSOiC0owUQGN9thUQw9kiUewHoHj2gfJ6TYG9JmJX8lmAdfkYdnBFrIXdAkJv
         bRS0G8LAJt46GJBLnayJT5NWd2P8+KrxCGM+UhHPryFwljgJakeoQHtQCUwXZnqnwwNP
         8Di54JYs1zw0CDKW0B7PSbpfVJqMsXx4fH7ujtjRiOyku6atw55eQeiUcup+OfhoMMzn
         omZtz6j51eHN5J1HmZyHEMzglqyTcb1pjbSqYxW5V+A1RPl0BXvtBAAaTMTvlyHzn5iT
         00TAM52Od8wf/gER+2XSn82QPNHaGop2vEmEMc4jPsquq4NsgoZTg+Mm3AYGvjWp5/6H
         1oSA==
X-Gm-Message-State: ACgBeo2G2Tt5I1M6moF6sSGKiBqqNKsTAUFdp5XntEg5s+ic0/nxh4Ed
	PwO2f0Zl6fPggtIT3vXq0CE5pw==
X-Google-Smtp-Source: AA6agR6BAArwEMQHc3BN5JDrOtUJIEACpOEZOvDPNRStjOFBQDS3wXj0/ux78aI79Rkb/tnmA2dKtQ==
X-Received: by 2002:a05:6000:1446:b0:222:c466:58a0 with SMTP id v6-20020a056000144600b00222c46658a0mr2973130wrx.53.1661448593721;
        Thu, 25 Aug 2022 10:29:53 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g13-20020adfe40d000000b0021f15514e7fsm24976334wrm.0.2022.08.25.10.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 10:29:53 -0700 (PDT)
Message-ID: <05fa19f7-7997-51c3-767f-c40cb321d2a4@linaro.org>
Date: Thu, 25 Aug 2022 19:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9,4/7] thermal: mediatek: Add LVTS driver for mt8192
 thermal zones
Content-Language: en-US
To: bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-5-bchihi@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220817080757.352021-5-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_102958_093549_A4255113 
X-CRM114-Status: GOOD (  12.07  )
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


Hi Balsam,

On 17/08/2022 10:07, bchihi@baylibre.com wrote:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add LVTS v4 (Low Voltage Thermal Sensor) driver to report junction
> temperatures in MediaTek SoC mt8192 and register the maximum temperature
> of sensors and each sensor as a thermal zone.

Thanks for your work

First of all, the patch is way too big.

The organization of the data is hard to understand.

Could you give a description of the sensors, how they are organized ?

I can see the there are 'tc' and each have a group of sensing points? Is 
that correct? Do have the 'tc's a shared clock? etc ...

I have another email with the comments inline but without more insights 
on the hardware it is difficult to review accurately. This driver looks 
more complex than the other ones I've reviewed. At least that is what 
looks like with the different macros names found.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

