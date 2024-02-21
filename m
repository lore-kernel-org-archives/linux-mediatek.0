Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DA8C5478C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 22:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=; b=ssZvCcmAirc68WvEIosfbkc8ni
	qaul8XXVZy9ZRwqNgVekMeWNJEXJEjultj2Ti6+UbQBy2cvn6q00EeGpCGE9a7TEbEkZdyI1agLFq
	7sbKIqiF56ejinMKfl3cbQSrneV/YYrDFByyMunz3dSrmYENPo3m2bJYLwKM4ntB3kcrHZGRfzQKP
	3CtFng5EDjNe0Elv6nMSNrbTi7HbHmy+z56R4Z4TcML15dCDW0cw3IQ1FbWVceln38z3IekRUtb2w
	/lICXTSGzKWxAD4rlO5hESGzdQmD3KfmGL8HdIxYJrPUwqUkMk2DGKS0P2FP+8TOCKVsENvLWA5C/
	O8Fnx4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcupu-00000002lF0-3kOG;
	Wed, 21 Feb 2024 22:13:06 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcupq-00000002lCl-372c;
	Wed, 21 Feb 2024 22:13:04 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso7088293276.3;
        Wed, 21 Feb 2024 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708553571; x=1709158371; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=;
        b=W2+uLuLDecqy3neqnGZwQ/fj2wzz9vKkCLS8WATAEtZNOHCyTI9/w8aPHRc0I5jMlt
         MKPReH3mKMRjfbvl6g8Rv/mMaFIjYZIujVgnAcnwCuZzRrDNyYmgDHiZ20til58eW0oc
         nHZ+5BF3LaWIyk8dE/Q27IRNuM3vxVVTKeOalCnG2kC3INWY0vCm8ueRC2UM5ZtvU1YD
         ymkFSNUXdGNQF9z74XMA5nHsMmtEkE3v+7tskLDgBuQs9GTXFxLpptC1ubnCkD04Yw9G
         O8a4atEDLYg4jm1gELJcs5GkVaj0Ea+pmimk7YohPftStPpT7gFoj+QwnfNTJY3M3qGa
         +pvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708553571; x=1709158371;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=;
        b=Rpa+I4ioMo9tmwtWOfdZ+Wv3yEhk9ydL/lGwxiMHNknOq+XePlrJTOvs6APIVApM5w
         5gArcM1K7AFXAbtjtVeL7HSZwUlt+GZwp/fNaMi5cm8QmtpsDEeJ4el+b2E+LaVVpEn4
         OB59qELSRRj8OnCybFxOXjRJeBxB1YE6CGR/xmSvwjn0cl9MOyGq2LxhZepnwozuafvC
         dXoj4qME/2kQFsnVWsjg3VG5LCIjS55EbXbK/ZeLFEV9YKRPozgD3BjzVKZ8PWW1ElR/
         Hic/DfFsSg0kDe2qN3lx8OIFcmkfON+IFt6N8WCUZNQ/7uEjDa0IkomJAaK566Dt+2Bl
         p16g==
X-Forwarded-Encrypted: i=1; AJvYcCW4WXQsIgaaE8N2NZjy8/nZhKFOvmJdF3y2Qh0qWNaEtaWqCv+KcNV7H1Iuu8irnz1a0gDjdM0QopE1kjW+XvlWgFAHnzzHxoGNczqKzDwTFOIEUEfj/ffZPVltdOTkPRpfal/9uF3hP2bzUmkX/GIDjCCpRWd3edUh3o/qQSDI2o3CQ72je7FECJDnbIBJ0Goyw3/rPKTJkZwHFEpe5SJBxNmhmaLu1I+G2T5h1UGgAhhTDbU6exDLpP3YaOTaxoiVTnP7wMuQFx7s+PYgyrpqFp0o9nI6GYeWiqKxtSk=
X-Gm-Message-State: AOJu0Yw0m/wvSsdSxlC+oGHDMGUKoW+kudvJhqYe2TDO7+P1cddlbtbC
	zr/WyrMk9oZvUao0X+iPqaEWCy8ZQfukHpmbK3al7DY0LnBmrz3J
X-Google-Smtp-Source: AGHT+IF7kP+13CFMgvNV4rXPEp1sBAjlnfLwnWDRvHGUt3wwBoE4opoEpDnOPFhvcnuSrbWo1HtsDQ==
X-Received: by 2002:a25:9346:0:b0:dcc:76a0:503b with SMTP id g6-20020a259346000000b00dcc76a0503bmr692068ybo.13.1708553571608;
        Wed, 21 Feb 2024 14:12:51 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id i19-20020a05620a405300b007858c17df9csm4712295qko.96.2024.02.21.14.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 14:12:50 -0800 (PST)
Message-ID: <69a0df59-7d27-406b-b0a0-3e43f18b20bf@gmail.com>
Date: Wed, 21 Feb 2024 14:12:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_141302_789525_FB6A01D4 
X-CRM114-Status: UNSURE (   6.61  )
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

On 2/17/24 01:39, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> #Broadcom
-- 
Florian


