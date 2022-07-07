Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A28CCCA479
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vme1WD+iWy/YBwYhXVZ5Fyl3XOzLIAAM2gpN+oRGDyA=; b=Q5EZd6Z3lfxVeB2KBbwCmjft9U
	aW2m9eDKINFN19MnYztfCvTbE3kZuGheC2d/0h+zYD7dv9d9MQRydQntzW8BYYOjMgOwNv5pkqxkz
	qM0RxY2dlsCOWn6TMKp7tJ14Pm75lBhenxDh+V0OZQgKHy0W/FJwz3M7l+/uD43KbBEyx85w+6w2m
	fOY69ePNm/GqgjLurOrzpQnoBAQtOzYDSnDmID09CaQ8bKSt0i3HjO0vmhEN6DpN08SmAH6pVya79
	QBdpvNNHUxyVqaYBkCfb5f4ffdtDTyeyMVkDf/zXTA00nPuBp00aYMh+Zd/omvR4BO09zCz4KDRzN
	COVdM7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9P8F-00FgDz-LQ; Thu, 07 Jul 2022 10:53:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9P84-00FgAZ-RX
	for linux-mediatek@lists.infradead.org; Thu, 07 Jul 2022 10:53:06 +0000
Received: by mail-pf1-x436.google.com with SMTP id j3so5941941pfb.6
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Jul 2022 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vme1WD+iWy/YBwYhXVZ5Fyl3XOzLIAAM2gpN+oRGDyA=;
        b=CHhXBdKrPgAdIE/UFI3/0M6OBcDh66dbcuv7oZMlg7z3qZk11c8xDpPMusruE50NJM
         5BVcPEsL6yaU++TO9AB9UVgP7+RFsF6OhjLMz53uSvPq0yX7LB7MD1cqlfMuqsu56/Jq
         0Au9AL5gZ82Y912D4Sl0K2cnGZapN5QZNAB957w/zQyf+CGqMg/IiuGhkR6lS1Pr/slC
         +oBvcfrOwnFYLpsqXlrRIUo9vaSgyiAIiB+mGqXrqFlUtS3I0kVrAyFzw3z5VnD4jrby
         cFXuhWc3UPQX0xNg1igLGA5aHi0YDmzIHag2jsjqx4U/aGDrD0yLIR8hKPtgfEX3q2ik
         yyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vme1WD+iWy/YBwYhXVZ5Fyl3XOzLIAAM2gpN+oRGDyA=;
        b=ddOo52sCJcNSRj8KN4JWanSUzDPxBBtOiBzDZQ7Z+EaRhVUWUk7GfheKFHUsJ+GF+5
         xVJQPGgsHsjohnqzLgofo5o24WAhZL6NIUj5WTC2X5CGdavDmOjaJySWI+qMyN+H4Sgu
         AIf95TFEJAgt2p8Oj5fJ0TAusVKlqSBTnLKuz61GOJyeek4/BjUBLo0AlsGDCxkt7tGG
         UThO+CfnTt+KVpCOueRzS/WkF5qS8FfQ+ZkMPPgigq0fF2RoZBJsRriGsPNhg4ddbW9S
         bWZykeiuycPvHEntZC8WDMgBI5TIF1aOZ7Oyq6e4DLpefqu1u6afWJ1kxzAWISxWsZPf
         QRYg==
X-Gm-Message-State: AJIora/N69sAJcprpaksDQfthpObA9MqHdG1xsFFiTN3Yi5I8v1AxHoI
	Q1RQfPP72wPIGUC0W7fkHONXRw==
X-Google-Smtp-Source: AGRyM1uiL/1NSSmW4kr5Bqvpj4UnhCSl4Nsiie+u+ka5NvNDUAzLdq3b18xSNR8cpsvmwnksbU4guA==
X-Received: by 2002:a65:4b82:0:b0:412:4346:f594 with SMTP id t2-20020a654b82000000b004124346f594mr19277469pgq.593.1657191179791;
        Thu, 07 Jul 2022 03:52:59 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id h14-20020aa796ce000000b005281d926733sm13925071pfq.199.2022.07.07.03.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 03:52:59 -0700 (PDT)
Date: Thu, 7 Jul 2022 16:22:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
	rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com,
	sboyd@kernel.org, sudeep.holla@arm.com, cristian.marussi@arm.com,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] cpufreq: scmi: Support the power scale in
 micro-Watts in SCMI v3.1
Message-ID: <20220707105257.wgqbgoumwvbonvml@vireshk-i7>
References: <20220707071555.10085-1-lukasz.luba@arm.com>
 <20220707071555.10085-5-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707071555.10085-5-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_035304_916410_CE0C961F 
X-CRM114-Status: GOOD (  10.84  )
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

On 07-07-22, 08:15, Lukasz Luba wrote:
> The SCMI v3.1 adds support for power values in micro-Watts. They are not
> always in milli-Watts anymore (ignoring the bogo-Watts). Thus, the power
> must be converted conditionally before sending to Energy Model. Add the
> logic which handles the needed checks and conversions.
> 
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/cpufreq/scmi-cpufreq.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

