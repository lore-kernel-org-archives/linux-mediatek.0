Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71B7C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71oJ12BexAxBLwTBNsEMg163ErQlFG2G4IQL0JA3vsQ=; b=IumFQ7vh89M0biiErDIwQVFN+5
	gCZmmSFPPsXZF8QmOBtjmq7uDunsX8Sl6Nm35mGWWt8boD+RMx+zI5XPb2Y0pp8JB2wULx/RjRXkM
	bQIxfmCsrMMUv/iGZ9TTtW9JdYxcU6CSjkoPJLDTGG+GEpYHuStacJEcWun6qccwz/cHSiP7RmnyK
	xHun8LGmfvlo+YOIv9lj0+ASLkUt43WGETVBh9y0KJQLTmsxzmBlotIDhP2eKvKOFWVNlXcayGtQX
	43yQGSDtQ8Heaegz8iZB84kMDxYRmjLx5lnQRy8gzP1OAXyYrOI5KNBAKb3uew85wc+Vcq+FaaaAF
	sWTmVQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYk9R-0000000Ejpj-0otj;
	Tue, 30 Jul 2024 10:32:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYk9C-0000000EjhH-33er
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jul 2024 10:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722335521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71oJ12BexAxBLwTBNsEMg163ErQlFG2G4IQL0JA3vsQ=;
	b=eKuRmiHA2ruiisb4GRtBI4qEkqkdhvOxOY3TPJ7F7x2h8gpQfysmkavejj5uRpixXlUWwr
	xziCAAIWjfdv2gikBaXPgZeh8xKnQ2GaMfXXvBlcEPtFE8sf6idpwwMg8/GXQ3RcOtFifl
	HAmfXw0y/zPuaox4gnCWSl1AQpmdw3A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-g0IhxCHzNzeAt4RniW_sOQ-1; Tue, 30 Jul 2024 06:30:07 -0400
X-MC-Unique: g0IhxCHzNzeAt4RniW_sOQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-428086c2187so2164505e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 03:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335406; x=1722940206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71oJ12BexAxBLwTBNsEMg163ErQlFG2G4IQL0JA3vsQ=;
        b=X0bF7HCr7hiRXavmHBH72F55vJdAupMWN3Sbp8/UUvcD7CoIvrQP2niS6tJAbamSJ6
         34DMKTf7xtNfO17rPEfQaOzSa0ZWCwq20KIrqu6xx7Ajqnrm9MzwADo/FKkYpmlwt1As
         4ks82haw9p5m7FeV7wQvnBupF+SCiLuUE7h4BWh8+C9cJRIbKejDxShMNsk0xQUprLwQ
         pAg091X7agIQ7188/myJ/VD4Ved4sX/cWkfWGcF0qtncZkI9jX5u7W89mhR7Lkzy6q1p
         k+5kyNUihl45PSYGznDtORjuJlmPWG5Iv0iRZ1kRJ6k0+zi6EQH31NqSTCWJ9abB36o1
         b21g==
X-Forwarded-Encrypted: i=1; AJvYcCXHi6ih4lJQjYtzq7J4syxu4AdzHiLLuQtYGj0GZKyOmzJW6oh9rzhoLabT9rpy1ogBC8Z3ZHbTt/PLxDOmBvMN9Ga6FMQDFWFkVSgJZdww0Urr
X-Gm-Message-State: AOJu0YxpASTqcU7lM7/MrtyzJ/4T9i0SB+YLxcjVNeGEoysevLRHw52W
	0mM+mLYC5jSpXOSBtiCfn8DqOS+VQujtUOy0h0Y5MMXKYwKQnbLoxg0M194s5gAFx+TE5sG3dXr
	lhPGiaVJpAaGqedxRG+RJy6EXBFvyzfd0Fp+6zeFkhUHYgJ7Hqo2k8dKz1x/VoHBi8UMEQg==
X-Received: by 2002:a05:600c:5113:b0:428:18d9:4654 with SMTP id 5b1f17b1804b1-42818d94831mr34713945e9.6.1722335405983;
        Tue, 30 Jul 2024 03:30:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE78IgR8WxTBbit7KcSMrv8J8w859v4JL3/v1Vk6XrSheVtSe3hh+vqkGPAcKITQxqhvXEW6A==
X-Received: by 2002:a05:600c:5113:b0:428:18d9:4654 with SMTP id 5b1f17b1804b1-42818d94831mr34713765e9.6.1722335405555;
        Tue, 30 Jul 2024 03:30:05 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410:9110:ce28:b1de:d919? ([2a0d:3344:1712:4410:9110:ce28:b1de:d919])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857dc2sm14269596f8f.77.2024.07.30.03.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 03:30:05 -0700 (PDT)
Message-ID: <37af317c-a40c-4af3-840a-5bbedad2e31b@redhat.com>
Date: Tue, 30 Jul 2024 12:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: drop clocks unused by
 Ethernet driver
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <5f7fc409ecae7794e4f09d90437db1dd9e4e7132.1722207277.git.daniel@makrotopia.org>
 <20240729190634.33c50e2a@kernel.org>
 <738f69e6-1e8d-4acc-adfa-9592505723fe@redhat.com>
 <Zqi-zr32ZXl0AyzR@makrotopia.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Zqi-zr32ZXl0AyzR@makrotopia.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_033202_924368_0CA4F2D5 
X-CRM114-Status: GOOD (  13.43  )
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



On 7/30/24 12:22, Daniel Golle wrote:
> On Tue, Jul 30, 2024 at 10:53:19AM +0200, Paolo Abeni wrote:
>> On 7/30/24 04:06, Jakub Kicinski wrote:
>>> On Mon, 29 Jul 2024 00:00:23 +0100 Daniel Golle wrote:
>>>> Clocks for SerDes and PHY are going to be handled by standalone drivers
>>>> for each of those hardware components. Drop them from the Ethernet driver.
>>>>
>>>> The clocks which are being removed for this patch are responsible for
>>>> the for the SerDes PCS and PHYs used for the 2nd and 3rd MAC which are
>>>> anyway not yet supported. Hence backwards compatibility is not an issue.
>>>
>>> What user visible issue is it fixing, then?
>>
>> Indeed this looks like more a cleanup than a fix. @Daniel why net-next
>> without fixes tag is not a suitable target here?
> 
> There is no user visible issue. I didn't know that this would be the
> condition for going into 'net'. I will resend the patch to net-next.

See:

https://elixir.bootlin.com/linux/v6.10.2/source/Documentation/process/maintainer-netdev.rst#L68

The main point here is the patch looks more a cleanup than a fix.

If so, please also drop the fixes tag when re-posting, thanks!

Paolo


