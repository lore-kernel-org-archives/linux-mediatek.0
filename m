Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90128CE7B08
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 07:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdEvpR7e634F6Xq7gphI0yR6+BY3xXYw+rzm/HECnb4=; b=cQ8rdlCGn8QF2T
	8c32SvYYuNwdGPF3DhKi4gsESJihckc7G2f0luVSWx8hLWsR4beuMZ/mfe8Hmejgr/WMJCp1Ej9ox
	JX5jPBHAT5465dWSXRTMjC7WS8SR8t+PX80HTrabNpmyMk1xaosxuL4Bbo7pPW0m4KomuqdXtXpj3
	ZLBm5yCVmeyUfG17qa6NDQIHwRnzHMa6F68HrjWqeJrxtIvSeFSsDLzNGOXrGyFLIHsQg34Mf0LzE
	Ry0C/JOZqzi1URsVlrJX6/VJbbqr+R2TxbjU7iKa57lv4SlkBgyc6M9Iux11p43OawtR/KlgZ6pQ4
	jSC0/TeqYI9gyFqM2g9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllaT-002XPS-2s;
	Thu, 28 Sep 2023 07:37:29 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllaR-002XOB-0x
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 07:37:28 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-504809e4494so4521060e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695886639; x=1696491439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdEvpR7e634F6Xq7gphI0yR6+BY3xXYw+rzm/HECnb4=;
        b=GiY9Y74Hl9XruWsYlXfZGTlSH1WZcxNA7qoRwxm16NQXfRJCukuDETO/p8wzhGNxOH
         iTB7t+12+pfdTj4+p82GrayyIMLo/JH6DqZmrKeb1xoYTexfReF82mBbso017aXi/71+
         s23MkWIpICG7alOeMocolU6K7aaUv3o4xGf4xnSU8kjz8vJBN/Wgk6Lbl+jZ7fmN2YTT
         DRMnzZkd91nxFyeeJ7J5F4JlFxPLiOXVpfU71qqh0eQTMY9JU4R5Ndhqt26vhvhKVJv9
         qvcIiQV6lytftLfaoZrT1JL/KWlVzu12UceJYwZ1eAhE0OAXZtrS2BrZUsRm3tcpWo8D
         5aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695886639; x=1696491439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdEvpR7e634F6Xq7gphI0yR6+BY3xXYw+rzm/HECnb4=;
        b=BbbXRHIQnXV6PLlBgr2EVjGXuyevCWJUjJ9FezpiYh5jonZdqyFPxmgZ6E7YMHeuBH
         F1WVhvdnCZk8lbJJ7sRMs6jRsXE1uZkjhwUfJE1ljZUsOZrPex5PqvxFgWb3p3I9A+hU
         dr1eeTcC2te0ZYkTgywanvat06r2egw+Yf4Gom4D+8KD5A4w79arNCoE7x0aAQ7mWnWW
         U022ApRFP4N0wSxU7G6cJGqzpYACG1x9vftBSlqpq5S4iXkK6hsCGbhLYVV+C4n0yctC
         3WcCmQkDpM7FoaH9IxllFxii/9hIf4EJTt9pd39JVe662+UbC5u4Khw4yZ7ZEIjZhjGF
         nFRw==
X-Gm-Message-State: AOJu0YxaAaId2LBnaYS0JHB35Wa3cZ4hEI8N9WYMWZhm6FOdyJghINGI
	t2ozb07ICMo3zZxBrcclf6RdsA==
X-Google-Smtp-Source: AGHT+IEiAv4nqQ0UosPBmy5DqVigj7fS+2PeREuoogljv96EOrQq59RDc/DzJ9LREX0UxZnPslp5hA==
X-Received: by 2002:a05:6512:1103:b0:4fd:f84f:83c1 with SMTP id l3-20020a056512110300b004fdf84f83c1mr480905lfg.64.1695886639123;
        Thu, 28 Sep 2023 00:37:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d424d000000b0031f729d883asm18744112wrr.42.2023.09.28.00.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 00:37:18 -0700 (PDT)
Message-ID: <5828d18a-6ec3-68cd-b97e-3f4a181dc953@linaro.org>
Date: Thu, 28 Sep 2023 09:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/4] thermal/drivers/mediatek/lvts_thermal: add mt7988
 support
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <linux@fw-web.de>
References: <20230922055020.6436-1-linux@fw-web.de>
 <20230922055020.6436-5-linux@fw-web.de>
 <ZRTBFJPL3NwWpMSP@pidgin.makrotopia.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ZRTBFJPL3NwWpMSP@pidgin.makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_003727_335075_65B24A40 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28/09/2023 01:56, Daniel Golle wrote:
> On Fri, Sep 22, 2023 at 07:50:20AM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> Add Support for Mediatek Filogic 880/MT7988 LVTS.
>>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> 

Thanks for the testing tag

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


