Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C412E732D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhhlYA35JIyrxQlMTea1XefnagrA3i1o9FxEDIuqteo=; b=wrwSvTFtYrtOjJBKKlUHExJTS9
	BEV66cS/pOvUnYI90rIBVbkls9Sg2fp3CkxIZeQCD0owOt9l/Eapn3EQpLHTItu7x0AVazWmz9b72
	aK+MjQI/uEJP/NqYDpM8umPs0pprvyZG1lyyicoFbxiMQ1mXEGrgCjPlIDdCK2iOkU268G6Q0jajZ
	KAESuCvcYZYBJnYXwhAlMg7Uq4ZEVxLA64dHPaZoutD8fJlgH+savH9D/bmrt7/wftrKXYCmrzhiu
	mgiz0mKOL0G0gUJ0uJev4ANkALf5SYtefbvKQ3XGP6DOrxULxjjCXQfdLHimL3k3g4AbRDm4ie4Y4
	G/LKHRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlrYN-004cAN-0T;
	Thu, 28 Sep 2023 13:59:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlrYI-004c5u-2N
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 13:59:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40566f8a093so99120015e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695909576; x=1696514376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhhlYA35JIyrxQlMTea1XefnagrA3i1o9FxEDIuqteo=;
        b=q+hJCyt3gzsZNEITKUOhg7+btl9WJ0i9NydNwHLkIYRzRBVRZgdx3CXpETiROmwFiF
         YZmTbdYhMf7Flcahh65t7gybtuHSpqpXFZmAXok2ayJTUqtlgFHmzsY4ZjruNeXG0nYu
         q8pW5KPMDQfYYPjwtPRTIjcm6nobNAS/LczrS80yC7nYXJ8NuqYm1sG4Dzc+sWiwzgw3
         ikyS58HxjRi9enFk0NZvyTqC6owxnz+sOzCo974ESoqGs/ThJX/sV0qaSeyUQSycGR7m
         rO2Qa5SY7mYTsPidKvsu7n2tXJOG4jCF+KGOYM1PpWiGJbjPGQODlOi+byEPNGbVSGKr
         IdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695909576; x=1696514376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhhlYA35JIyrxQlMTea1XefnagrA3i1o9FxEDIuqteo=;
        b=A7ReD7hvPjzqSCzmYcs+UKf9WLFhf8VBBs4dfD39+xTA9z3grf/PSLbSf/yOak4Wgv
         pCXDQCzRbkpCCeztMLJaahl3JiB+FLYE5X7Vvu9zfcExTLRx6dUcj1XXSF/NcuDrUPO/
         r6e7rr+yEvsat5H3EgBpnfbKw6q5wTB+b8Cy/cEHaTY2aHAczZoOWpHQQlS5kjz4Hp2S
         biyBw9L1z/7UhpmPORmCxhKoqOQoLEabyIKxsbBGvh8fHmNH2AHUzfQi7HMA+EPz6hXk
         daJyy1kGDZU4oHeWUletcVTiCb7RBnyHwbGSei9ZdRUzCET7f2nWMvEcI6EQoAVJHiaC
         3Xqg==
X-Gm-Message-State: AOJu0YzEU30MKNXGmXjBco/njYITMODNbtEEzg47u0xQPaQarJehCp3Q
	LlPp5X0XC/+OwlCHOZ6aQxumUQ==
X-Google-Smtp-Source: AGHT+IFf0WMdJFrrwFCWhFWD8gg8bNzNZO+0q58x8serItqk+y/a0NXsekyGiLITmtbOMbiJWC1y4Q==
X-Received: by 2002:a7b:c7d2:0:b0:405:1dbd:f77 with SMTP id z18-20020a7bc7d2000000b004051dbd0f77mr1258665wmk.31.1695909575629;
        Thu, 28 Sep 2023 06:59:35 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id 14-20020a05600c230e00b00402f7b50517sm20323236wmo.40.2023.09.28.06.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 06:59:34 -0700 (PDT)
Message-ID: <419fda62-224b-cb20-ee78-7e0627c4ee9d@linaro.org>
Date: Thu, 28 Sep 2023 15:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] thermal/drivers/mediatek/lvts_thermal: fix error check
 in lvts_debugfs_init()
Content-Language: en-US
To: Minjie Du <duminjie@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Balsam CHIHI <bchihi@baylibre.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: opensource.kernel@vivo.com
References: <20230921091057.3812-1-duminjie@vivo.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230921091057.3812-1-duminjie@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_065938_774750_0F6CE65E 
X-CRM114-Status: UNSURE (   9.27  )
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

On 21/09/2023 11:10, Minjie Du wrote:
> debugfs_create_dir() function returns an error value embedded in
> the pointer (PTR_ERR). Evaluate the return value using IS_ERR
> rather than checking for NULL.
> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


