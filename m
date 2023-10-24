Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C4C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHLz8PPjT5hmB2yN6aVrR9CV+tu/9PbMfn39Dru7aRI=; b=WGYd/M5SZC2W77XHBoy92s7cxQ
	Ap34zMAVT4LRysQfcHeetHS/ii2qLnHrD+sWwIT8Tb625idUvvX/4VJg8XPJXTQiuBM6JS73Te1n1
	EgMfjqEeIR8+PabLgk4dyPNrjO6DO3Wd+3arRPRHPSUcoFrzIegGoARwWgmuXiUR+YtI6DnNJzEay
	GOrkaZZxy1L6sbCCFKZK5k1ZrtMD/SF2m44g/R/E6hSvacYawFfnIu1J+m75H45dfrNIoZjPULXXH
	feFnlNugvBdEChqsimNUrO9tFr6Ro8ebxwiBP+hjj141xFzW+vJnV8bFUKEPoGc40X7OHsIA1PgG/
	IUcV+MjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDbh-009IGQ-32;
	Tue, 24 Oct 2023 09:21:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDbe-009IEz-1f
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 09:21:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40859c466efso22611705e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698139303; x=1698744103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHLz8PPjT5hmB2yN6aVrR9CV+tu/9PbMfn39Dru7aRI=;
        b=Jm8YhfEEGahFeHGHXkvYEDiUSGOuKc1FA/VSCKC74xS6Ur+3HDOHK6JE+rgDK0+HPY
         GnLh67jtrRH17z+vrcxvHBzSrqO5+FtbUP2LroPiW2bokqAaaAm7PXSaxOV06tQ/1Xg9
         KZV6quqBtnv7/5c7DRA+dFo63YY8OLPmup7ffZC0BRPnUHfwL1nzjactC1bFgcnlt4p4
         oLG1hNhxKNr5BYHu+P3JbkPC2cZoBgTKs/1ZXd2iqlH0OqUFDKb3HUpxg91SIuuZkC7s
         iuuF7aEaBjoS8qkD6VuttuwXakspcfPORQFQb/X0V0P2cGPDYmo/wVluqQVnp2AnW4WM
         TGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698139303; x=1698744103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHLz8PPjT5hmB2yN6aVrR9CV+tu/9PbMfn39Dru7aRI=;
        b=ibwY0GAIO8LvPv2DttYNKVfdZIR2IrVBxGUwSTUb8g5JlzI44dVn8nzbx2F53Pks3w
         HozB+FJQ9lGIxEcADxnRkD14xW4dgjw/mxOT+0ILzyarRD9ut60FM2b+f+/a9d/L4Wbo
         DIYowiLp0c2RSECRX3XWezn2TgWPrUpOcgORl/PCYacMOxUBXVinUrcmmOAfa+n7VzTt
         akWXxOODWlIO/a9V6mA59H/QJM4oQCQCx0D1tHfMRI/QcCsB/3RiS2rZu0asQ0CMyw2v
         x+ETLt+SwuY7zLk6qGfIioUbKbIIzb0D35GXgSMJeQ8nV5z18MbL3ZLsL/9VUtFdfjmI
         LhjQ==
X-Gm-Message-State: AOJu0Yz/KAvJZfcnyuFoDd+12byApEpHwXmP5979Q90+sdhroIXskAfm
	Gasrkg3aXE6sgxbbrh/v2BSFCA==
X-Google-Smtp-Source: AGHT+IGmTE7S8Bn22t6axk51MnY+srHjcF3lXhxJM8aBvQIoNaSPW1U6i8mvZVzOD+mypNBfwpseVw==
X-Received: by 2002:a05:600c:3b99:b0:407:5ad0:ab5b with SMTP id n25-20020a05600c3b9900b004075ad0ab5bmr9181918wms.8.1698139303217;
        Tue, 24 Oct 2023 02:21:43 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id q19-20020a05600c46d300b0040836519dd9sm11523045wmo.25.2023.10.24.02.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 02:21:42 -0700 (PDT)
Message-ID: <ec7c16ef-5878-488c-af7e-10138783f726@baylibre.com>
Date: Tue, 24 Oct 2023 11:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/18] dt-bindings: pwm: add power-domains property
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-11-5c860ed5c33b@baylibre.com>
 <20231023-oppose-tamper-36d526ece102@spud>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023-oppose-tamper-36d526ece102@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_022146_773399_2E485F60 
X-CRM114-Status: GOOD (  11.95  )
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

Hello Conor

On 23/10/2023 19:38, Conor Dooley wrote:
> Yo,
> 
> On Mon, Oct 23, 2023 at 04:40:11PM +0200, Alexandre Mergnat wrote:
>> According to the Mediatek datasheet, the display PWM block has a power
>> domain.
> 
> Datasheet for which soc? The mt8173? Is it valid for all devices in this
> binding?

I can't verify for other SoC. Then, I fix the commit message
and remove the example changes.

> 
> Cheers,
> Conor.
> 
>>

..snip..

>> -- 
>> 2.25.1
>>

-- 
Regards,
Alexandre

