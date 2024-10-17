Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FB8D37488
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOdq72Eyz5fliKe/ITZ+qWweux/QPvBun64ac46dsnc=; b=dOakODSCJT68B7YeBT0nKEDJrO
	CkqeaQUiUaUWKjFPW909VtARD8P6zxIbckSe5wnHcS0oUCaKR+SaWqCUc4MpfoWvPe/dpmsd0tNNz
	3F31fEy+Vl5JF/CMW+zmfMFnoC72ErOFnlaBbfbwlpjzmqi2BqFZ1bAI+QzM/ZGJGe5m54fFZ1/rt
	CYKb77WdGa0W3b814CmJx51Gn9KD2jhTrnESRpFugHNxgWFFdCdakLQY5EYZmqFvUmCApOrbK+v+J
	ImiB3eVv7M4j7ZH7+vE9kH1WRWm3cb4ocj0W3jx/xoMnEsopznjsfsDCMVMCDWPyqpDTnIASPviBQ
	nRY75fnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1REZ-0000000F3zh-0hOF;
	Thu, 17 Oct 2024 14:12:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RCI-0000000F3PC-43Lu;
	Thu, 17 Oct 2024 14:09:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20ce65c8e13so9312085ad.1;
        Thu, 17 Oct 2024 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729174189; x=1729778989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kOdq72Eyz5fliKe/ITZ+qWweux/QPvBun64ac46dsnc=;
        b=bKwfkiMNm12ftdDhR+I3c3k0/uagY6hIHNDeO6LjI/pOeLzzLBvX0eyK9rJ1X4B/b1
         yUOBcj+vsdCK+oWKY0y/CMRoqRfHE0pEqLyxNmihyDFZIRVculqofVUUixEg2TWIG4nX
         miEU20PrMrMEpx1XXCaYgCQvE9Nb0TmNplp2sqzkgVDS5Sc9yo86KnVnUWME1lGxLDHJ
         Z3kDuZpx3mxzDzkZBkNQoZ22eEbHyZS5xKBklUsThksPPTWY4kGvekELuVJe+eeehhZJ
         7GmzOQb8UQZerP7bxjGdiFr41Omg6Ck0kZhcVRtudhOo1dhEgX8fEMhve30E5UeuvyIV
         IXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174189; x=1729778989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOdq72Eyz5fliKe/ITZ+qWweux/QPvBun64ac46dsnc=;
        b=JZzrEqvTRSFi01mem5B0m6ucKHxI/BsfiuP18q+Ex3g5hOgZ4QeE/v4m7P8xcew8Xr
         ZEb1dH3CL9pKOpJYOsirYUO7ZqVVc28L/ZOnck3Zc+CMI3nXngMcGttuV3hv/PQ2p73f
         F4DXNEYKIshlalQJ9Z9ZwiJ5lHY6bTkZtBQIvcd0keurZbTrgh287dO+n7Kc7iz9J0i6
         CsAZbxjJYGW6M61r7GIt4v1+/AwIz8CeuwIosBWGRx2rw6vLwoemd73u9gPXQRRbfUIW
         of2cj+3pLLBP2zzn46n5mwZXvp6aoE+5+3/Gl1ESmihyu4aiA5qsywPKdxZ/fXnw2Utp
         2z5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2DXAQ9HEvlytGfAF2CqbnCuqwqPNJ882stQ2G8SM6FfKK8OkyYF+PDIR/fj1OuyolEjiSYKHjFmYmz4n30Co=@lists.infradead.org, AJvYcCWNyyTIkoaNHEsa6rMUjGpcI2COaA45OqiZtEENVhG3fRXqz6Pst2mPAKCx9uR2qAI31bbbt/OIeTzZheikS5wf@lists.infradead.org
X-Gm-Message-State: AOJu0YyKH9RRwy5ST737H24c7LuG/TY6Fbebr5CucqtDXYrkJEO0esfS
	N4QjZO+5skQDoGNXl24txIrTX2wO0ypEn9AuPTcIEHobn4BI29Kk
X-Google-Smtp-Source: AGHT+IExDgDSSArIdOLivGgAmDL4WqA8RdwCEDZ62ucf2tPOrBa22Ctmy1n/ZvkHT+fL+XTni0nsGA==
X-Received: by 2002:a17:902:e541:b0:20c:d469:ba95 with SMTP id d9443c01a7336-20cd469bdaemr196136315ad.16.1729174188976;
        Thu, 17 Oct 2024 07:09:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1806c6a9sm44510705ad.302.2024.10.17.07.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:09:47 -0700 (PDT)
Message-ID: <4e3545ce-5740-48b6-8c10-666548d31908@roeck-us.net>
Date: Thu, 17 Oct 2024 07:09:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: yassine.oudjana@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
 <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
 <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
 <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
 <WOMHLS.HLNVQWWVER5T1@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <WOMHLS.HLNVQWWVER5T1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_070951_044505_9CBD7635 
X-CRM114-Status: GOOD (  17.17  )
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

On 10/16/24 23:43, yassine.oudjana@gmail.com wrote:
...
>>>
>>> Say I don't want to use the watchdog (which I don't, all I need from TOPRGU is the resets, I don't care about the watchdog). Not starting the watchdog means I can't reset the system because all mtk_wdt_restart will do is make TOPRGU send me an IRQ that I have no use for.
>>
>> If you don't want to use the watchdog, then you don't need to care about bark
>> interrupts and you don't need any mtk_wdt_restart() functionality at all :-)
> 
> I need mtk_wdt_restart to restart my system. I shouldn't need to take off my phone's back cover and remove the battery every time :)
> 
>>
> I think what Guenter said makes sense. We should make sure the watchdog is started when calling mtk_wdt_restart or at least configured in such a way that we are sure it will issue a system reset.
> 

It is more than that. There is no limitation in the watchdog API that says
"you must only use the watchdog kernel driver to reset the system if the
watchdog has been activated from userspace". Such a limitation would be
completely arbitrary and not make any sense. It is perfectly fine to enable
the watchdog from the restart callback if needed. Actually, all restart
handlers in watchdog drivers have to do that if they indeed use a watchdog
to reset the system.

Actually, I am not entirely sure I understand what we are arguing about.

Guenter


