Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75620C07CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsQvimBOnTjXGdKhEAnGYzR8KiGWDUYPadmCZZ7TXho=; b=nLSuo41aYJHybnFBKBYQdj6SvY
	SkWtuVPwHfgr6Gox2qzgA0/7a4QHt5b39NEG/gsPHH4Mmy+eQeS+l7nGnorbti8q8PjsHWiDqkTdt
	MyjPoAAM3VJh70pt/ZKet5QSJMkFaYHeLT5G0141TQ5t4GKNUg8cROR4bHOP3PrVEJDdIHRghDPQg
	a2jpN06/LI5GkM8244zm49FUmm97a3l19HJg0VyZTeuVvv8l/q3QUFRf5qK3B0RXGixpnN0Q3JX7y
	zp9Q+72Jbwq9TngxQtpud5h6wL4B8ZXj6jjtvEAf0fIOabk5UABqMmoVO3DApbwBirO3vTsobZBfk
	VQUg86Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JSW-008GRU-0l;
	Wed, 29 Nov 2023 12:14:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JSS-008GP7-19
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Nov 2023 12:14:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332ed02ccd9so3323183f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Nov 2023 04:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701260060; x=1701864860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsQvimBOnTjXGdKhEAnGYzR8KiGWDUYPadmCZZ7TXho=;
        b=GmrRUXTBh0iKdn6Cm5mT66h9fwedMHf/2Zwi8PjSwkky1FF55yKqbr1WDhq6FJT95B
         FLS9iHsqvDMWb9WjKLjUZdMAF/RBRXSPQef29crQju2oCGfc2il5nptUwmWtD95+uBgY
         Q7cMlLIRnaTaKs85bPREZDOX0KqjEPa2WeCNazF3NxuQyriW+mtMwvcNIOVLtAos86dO
         qUypnsdpGctQwZLeaBM1VF3dWMOHX2v4tqH225Oni4ZjRmGd+hJOvW9IWWb4UIrX60FG
         K31qS6yNQZ9orYtoNp1j8SUxG9oisg+RXEZWhhvGgwgnB9Bo83IGA66aMwJfkd8UD2cc
         uZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701260060; x=1701864860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsQvimBOnTjXGdKhEAnGYzR8KiGWDUYPadmCZZ7TXho=;
        b=mvjZi+raZpAbrambQv/vkccRdcEzBjaNuvvE/hMBtOWq2R45pWxjKFj//OAWDTcM0M
         e6DAxw/g7f3CBaa28oEO1KmHkvxPd6AUwqrSiFtNRIY9lN6kpNTOHrD6OmqaAi7mYbub
         Q4hdMP22wzeXDgk0PequcIFYnGJL+KWOcvUW5/+AN6Fhol9w0sQq+sdfkNOD8WdRbMcs
         loVgTwWp1PdoeI7muLhKVDzbrFrGVsH80TP2RruGHrgylVpe5F8FBbGbJZDDsrL+Zt2b
         5M1JGGeASgKTeKp1tz0m5eyFTpSy6WeI0CGOoZZy2i1Hr0Y/DjUkV1uWNuv5EF5OWFIT
         en9A==
X-Gm-Message-State: AOJu0YxyKOovn4UfoV4vHRWezXJhWm1lMFiulSIrV70dBYHxE1IkjLw5
	C28thdRhNebwAxoqqiIceQqOoA==
X-Google-Smtp-Source: AGHT+IH4VTkrd6SDnt/sTDh9R9XPApG7O61ItmfuFh5MunMzdqfZlrOGpBMpkKqBpf907RBXyT1V9A==
X-Received: by 2002:adf:eb41:0:b0:333:727:2ff5 with SMTP id u1-20020adfeb41000000b0033307272ff5mr5299207wrn.9.1701260059703;
        Wed, 29 Nov 2023 04:14:19 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:38f1:13b7:9b7a:2d6b? ([2a05:6e02:1041:c10:38f1:13b7:9b7a:2d6b])
        by smtp.googlemail.com with ESMTPSA id f5-20020adffcc5000000b003313a1e0ba1sm14998254wrs.89.2023.11.29.04.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 04:14:19 -0800 (PST)
Message-ID: <673c06e7-61a8-450f-96c9-35bb0e1fe111@linaro.org>
Date: Wed, 29 Nov 2023 13:14:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] dt-bindings: thermal: convert Mediatek Thermal to the
 json-schema
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231117052214.24554-1-zajec5@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231117052214.24554-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_041424_396374_A573A97B 
X-CRM114-Status: UNSURE (   7.39  )
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

On 17/11/2023 06:22, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Improved title
> 2. Simplified description (dropped "This describes the device tree...")
> 3. Dropped undocumented "reset-names" from example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Applied, thanks



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


