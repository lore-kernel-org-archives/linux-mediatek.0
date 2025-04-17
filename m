Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4D6C369C9
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJO4GXL7dOZjeP6V87YS4vJmfeGtcMABTZh3kn2uUsg=; b=eQKudesdXU8Z1/Iv5MP5nK/53o
	nM3RchB8iXXRE311QIi2+pW1jyLCKsvv7LGDD5Uc+msFavybbh9+GiYaMhuYO3mWKWWC3/r5Eruvc
	4uygRYN6mkMMW6d+abassRbG9EWt42A038MTtK3JuFbKPaT0yoV2FiRUVmEkhPMtKi/zsIYlaCnV8
	9FW9ET6BtOyy1N7xBw6YfGLEgfpQgNhaEL4FrmK5hAapN46fY+iBAwQ0nhyqz+gHvssYkfsJcPzsx
	zkCZGMZC9z4Qic8PjIOPpapVFTdwyCp+19RlaOvNvDkjGYcbBUOWIVkT2THnB2YevqoNBcXX2KrAB
	l13AEGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5StY-0000000DozY-3p38;
	Thu, 17 Apr 2025 17:19:24 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SiE-0000000DmMQ-1D97
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Apr 2025 17:07:43 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-605ff8aa9d2so24559eaf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Apr 2025 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744909661; x=1745514461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJO4GXL7dOZjeP6V87YS4vJmfeGtcMABTZh3kn2uUsg=;
        b=TMtlaQwFXTcfP8+ZqdcGGAN0q+8L1MrHDibYGk7fdrHWGaPkVdGJv/dx8qi6CakeM2
         28c8tGCieel/bVW+P60nNzeTXbINx1YGT+dDNe7wKh/Ru96yuPh9IjMYayLbhueKaZ3w
         OLiM55uRaXARpa9yAdRoLBx/5ibWRDvUrCcljKFBzPtwlPy+RLkF3MCcs3t39qLW30Vr
         quRVuYd6eLpjk75dOAAsNPkB6gSdCjf3G4wSTV7VHl4TnQQP96Vv+vtIjkhSo5Qg7Xn0
         jROIla6Ho1WsezzlSqRQQzyJXrIbgbjprfcK4EbG9/wrr+UZ84Wcgs/tlB8O5UsJztF5
         OSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744909661; x=1745514461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJO4GXL7dOZjeP6V87YS4vJmfeGtcMABTZh3kn2uUsg=;
        b=wTLOV01BjYqy/jzcToUrzMdMAFrZT0/+gRhsXWaZMc4bV/F91UyF43frjNi4+uQYBn
         Uhr3IIVhsnWXyKY6jTSo6w8OvhU2syo7i7PJUfBcVtr0O6/2zAVvk99Nvx817McWBvmB
         BJtZk1tAHnJkhqZwHDU3jnHVnK0ZOdN2O85LzFfJeT+dMp/EjBjPPjFIaj0ahV1u5LwY
         uI/ZLM6Vk4X8UIoeIat34xhuWp4utn5jJSr6Z3eOLohv90c8Wvubi0lTbVFj2SeYUtJq
         njZHxP37rE491Z1YE5JKQhHy2t95Gt34NTsRM319krYPOstxyjYXINb0aGNHhRJhlVKA
         8/ig==
X-Forwarded-Encrypted: i=1; AJvYcCXIuDy9xcGjGwxo0gz34YJ73/m+9P4/9AmZKJHn7wFchGgP7olLyssTM1xyTmfEw6FzCafhwI37VJQ94o1Pgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSqSygQTiXWhMv3WWbYvewFtRaVAIwPS7OSLY2jvicRzkyBvKp
	NCJJqGg3aCgzEP2JVZiZPKvSG6XV8/3THdy0qD1Aig0xiBeL1oLR6Ij4veZG7vw=
X-Gm-Gg: ASbGncuuDZaH9nG4HqHJ00zahkUDo8REUyAnvIrX7X9f9olZhp4LRawzF93NmQKpEPQ
	7RVaPhUJduB67ty2MzDwEZJouwn0uaZR15kvhdLwWHfWgD6kndGmbwCvQWW5Myj2k8jU0FVtO1c
	tMpsbKoPDhAytb/EdoXNBlTAGhR7A996m4c4UbmtnGZg2ngzUsbE3m1Vc0F4bWEH59xHk+y0N1e
	FdpNZNx9VrsE4reqM2EcvW+b3pJBa3fxy/ZRldOjN6BBMuE3OgQCCYtW+EIkLcOoHR7CGJR3It0
	yk0q65CPiArEcoP+q77IxG/UYht34JqfBWRy4tD5kqZYWPFIDc3McixqORWopEQLNqtplmlGidY
	zapfYpDRZIN9oP3TP4g==
X-Google-Smtp-Source: AGHT+IHbLABiWinLwjfZ0DTmEnAkfAixBYu8A7EcycIAgYoLkSVTlOq/Pw+F15KcRSPJ7k1qWk67rg==
X-Received: by 2002:a05:6820:180c:b0:603:fada:ac47 with SMTP id 006d021491bc7-604a91e814cmr3847196eaf.1.1744909661228;
        Thu, 17 Apr 2025 10:07:41 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff5d8c40sm33099eaf.3.2025.04.17.10.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:07:39 -0700 (PDT)
Message-ID: <f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
Date: Thu, 17 Apr 2025 12:07:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
 <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_100742_325124_4EC1BC4E 
X-CRM114-Status: GOOD (  12.14  )
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

On 4/17/25 11:59 AM, Andy Shevchenko wrote:
> On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:
>> Align the buffers used with iio_push_to_buffers_with_timestamp() to
>> ensure the s64 timestamp is aligned to 8 bytes.
>>
>>  drivers/iio/accel/bmc150-accel.h | 2 +-
>>  drivers/iio/imu/adis16550.c      | 2 +-
> 
> Looks like a stray squash of the two independent commits.

Oops, sure enough.

> 
> ...
> 
>>  	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
>>  	struct mutex mutex;
>>  	u8 fifo_mode, watermark;
>> -	s16 buffer[8];
>> +	s16 buffer[8] __aligned(8);
> 
> As for the code, would it be possible to convert to actually use a sturcture
> rather than an array?

I do personally prefer the struct pattern, but there are very many other drivers
using this buffer pattern that I was not tempted to try to start converting them.

> 
> ...
> 
>>  	struct iio_poll_func *pf = p;
>> -	__be32 data[ADIS16550_MAX_SCAN_DATA];
>> +	__be32 data[ADIS16550_MAX_SCAN_DATA] __aligned(8);
>>  	struct iio_dev *indio_dev = pf->indio_dev;
>>  	struct adis16550 *st = iio_priv(indio_dev);
> 
> Ditto.
> 


