Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E9EC5AD7B
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIKS9VjKOlpGWAuKOmHa0uAoIuM+Lm6GbejliVNCX/c=; b=bjivwret5Eym6obGvO1OASnWqX
	USFvRdGzWcyw+l1UBx6Lx8n4DMOSahwc0L3D0bm0UtFnquGRfPX5lpFFy5TdW36k8MqYBXKi49l8m
	zfpq4vAeVt2x5Fb7goy02KDnWGn2WDYZIJUSW7gMeHfyOFrIvRFHbGQASDe6pRUT8/XD9vN6v7z3K
	PBbW7+ikBiUFvomSZpL33xOLhwQU89zgdUfs98f5UXZKNMk2jPmp1cJBJm0LK4eaUm9plklvwLZBY
	J7jQFZI3HBb16uME7mmROgOnCir4npeYHpQDKeUOaq4mzbe2toZkd2/GBBxnhRYHVktVi9cHf5Z3g
	H9o3kQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7e9-0000000AYYK-1KQJ;
	Sun, 09 Aug 2026 17:49:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7e6-0000000AYXA-39D4
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 17:49:16 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e347638adso1213631a91.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786297754; x=1786902554; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIKS9VjKOlpGWAuKOmHa0uAoIuM+Lm6GbejliVNCX/c=;
        b=rWyiTX05KRSwwG/DVtErfhG7r89QKnAHNC0xN9wJsXn++d8E8O8IWbIcZkxvliDEbB
         z4cocXOPCxiLcEi48yA/19hUreik4FwXuwhRtdV8NdsI0T3LfMJ/7LMDoRDrgaNCUxol
         GxmGP7cAHPA8nZA+1VZcJoKKtALNfvW1+ZOuTmEy3tNxPWBSREPSzRLfGsEEOllm9ybS
         RLBfztvhPgxe/vDYjw/ERggYSvFwxhiNoaIyUhTDWqx/tHc11ZTvgnBWjnBNbvsML7Am
         a0krt4O+MxgHrmQNhwAqjJkE1xSxiOtQY5u+51gs2N/5iWctWD/ug/v4EI6nZ4FKOn4g
         mJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786297754; x=1786902554;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RIKS9VjKOlpGWAuKOmHa0uAoIuM+Lm6GbejliVNCX/c=;
        b=f+ME5cs+VMWxLuGXHVTHzGI1Ga1ms78yBPe54EhA10AUeedCbCPHgjY/2CSKG5WbnQ
         AtJ6KsExwHf2DpFBuGUDFxKj4oQcUOro1JHKRSW9v8tABfiooWCpe264Ak45/EUee4Lw
         tPtK1zH3nqczqHlpsGsr6pnM3wIRAY8LEHkiq6I+5f68Su2m5KbKkt08h3sV9rx+bsmE
         2PDLZFLCKveoIqvP5b5OF6So9cNUoT6Q/NZTbJ0HuG049/Ae0AZBv/YYDTXNdRBgoE94
         wzHJLQ+gDx1iHniz2/0Ckw0XYb4e0F0oZL97P+IzK3gBlj2d4MEOvkVawKwPs8zH+Mg8
         39Ag==
X-Gm-Message-State: AOJu0YwRLYKmnA9tkrnE5M9giA816phxqSM4jvVGfsBoqZmzGwdSvjYe
	8biB0KSYVD+OMGCXM0F2FcqWSDcVxsOBKpvmZgOagTtRFNYLsvzAjHzW
X-Gm-Gg: AR+sD121T6kmZ8h2M7E/RLEgpFCyxD7DrpJ9D2EaV83qDO48sqtok6wwIzXA9EqCIEX
	EhXdPpb5zFWqmhN47pY/g1fBZRaOvqaRKPHJVeZXQOuEJJqUA610UjnVgpmnGRCiLWbm6M5mm7U
	rAz7mApuWFFvlo8mCDXxC37+lEoOCKRkGDbPGkvXlqwpkcp8Giy9Knz+IvKCMABZ7D5yKJXyaWG
	efuOyNE3l0ZiwNQzLASox4MPUA9/rqIE9hxRgBZo1g0sIDW6Bcnq8+TT6TsUYq7qa+C6l7shwrc
	eLD238/No38ZwN8Qhzq8n7KOncbyAZQ86j69XGgZo+1mHXrke0D2wcHYgJeI9My5i39lWlqvfKS
	16ocZ2G8CmmOSmJVpDnaLLKQClCSIpo9Vvi16jEvMCu5wVl6ZImE1YoDCJkgmctEB/kDEMmpXDy
	22cXecnlKxnsJ+42zmuYaDz9rN+C8wjOynEVGWBi7a4QlA2thcuSxTqNRoqXfLoUT1tDZ3OFpML
	dYzEpw0BpFTqHYE8O25AINWo7QE4tOB7qPu3WAQPBdyyzmR
X-Received: by 2002:a17:90b:2585:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-39282579c06mr14693252a91.21.1786297753881;
        Sun, 09 Aug 2026 10:49:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b136c67bsm4534781a91.0.2026.08.09.10.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 10:49:13 -0700 (PDT)
Message-ID: <0e4dfe8b-af67-4dcf-92fc-cd564d7c3744@roeck-us.net>
Date: Sun, 9 Aug 2026 10:49:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset
 controller
To: Akari Tsuyukusa <akkun11.open@gmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260809160643.33991-1-l.scorcia@gmail.com>
 <20260809160643.33991-4-l.scorcia@gmail.com> <aniv5B4jz07mI70D@buffalo-ssd>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aniv5B4jz07mI70D@buffalo-ssd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_104914_830903_C61AB65B 
X-CRM114-Status: GOOD (  11.60  )
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

On 8/9/26 10:04, Akari Tsuyukusa wrote:
> On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
>> Enable the toprgu reset controller feature for the mt6589 SoC. This
>> allows generating reset signals for the 12 subsystems managed by its
>> top reset generation unit.
>>
>> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>> ---
>>   arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> I provided "Acked-by", not "Signed-off-by"...
> https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
> 
> PS: I am also fine with this patch carrying my Signed-off-by.
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> 

That is completely inappropriate and unacceptable. You are not in the
Sign-off chain.

Guenter


