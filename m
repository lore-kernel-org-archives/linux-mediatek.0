Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632D8CD98D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YClLX0yEzKDd8bl1cK6HeZnm+stLvAtsb923iZjql8k=; b=Qs8MW89TnnxL4DOkpY6emXFc4E
	wti+3LkBkqiR9xTqnmeog5ftZtmAtYYlxVXQilPbh1Nkzjy4VaLSwSY21rHqO/Z3u/IQztmyvHOc1
	fDo/AEh48McxbtZorap1RH3O2XlA4zV23qUn4bidGe7LnZt2ItRXKnv/T6H5pL5SKoCT3ingllcCC
	7tDaB/c9bWcU5B0HxEYqPYFfGt+YsBdKDlaKRESa962aQUHBtxTJcDb6LVShIvReYGhxwOZ4XsRa8
	JjTjmifiPfjBLT/7mhm93VcuF5jdkCorHAKtxdHIN8e2VkPLNBEaZYwCV+oME4C8L+ch3kfKUzjh8
	MP+dt6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYRR4-0000000CQPo-2gzT;
	Sat, 13 Jun 2026 16:42:18 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYRR0-0000000CQOy-2m1E
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 16:42:17 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7e701435806so1859303a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781368933; x=1781973733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YClLX0yEzKDd8bl1cK6HeZnm+stLvAtsb923iZjql8k=;
        b=VsEl+rD2qxm1in3Aq5lgAj7xv39tWLrVEV7eDICNnMMHvXErGTAAumm2SBCNBn0gyT
         mNdAjkfOh4nDp1mV9+Y2tOF82WRy4oth0aadrkbiHX04hQtGYSljS8RJa3Zs5G6Kr9o+
         7fBPDuimxS4P/kCrjtIY73Tzodz3BbI9UqILMYsXD9SlMc33Nad3blk4hFcKxoi5B4SS
         /u1KSgek3t8tx1hoVckNYYNQgozRN79PTbJ+xe5rDMkmIU72rSu8APwJB6CGKhdGYHne
         5LZ8NHzK/3udut7ex1LE0k6sg1yig51hWMy5wtGHXRbFxfQE8q4LcrhJ/JYh7ZfxV6Gn
         Ditg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781368933; x=1781973733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YClLX0yEzKDd8bl1cK6HeZnm+stLvAtsb923iZjql8k=;
        b=Y5G1C3NGVysM0tJK4o48dX+4xsr9Lo4PvvoFNdF0a/N0+RXUEBWi0rMds33ilUWBVF
         qelNYJ8z6CraG1O7kssJfgRTKGjPv00+1BvjkrXynMwDr6GkLHEV20VdpewC078+/hzr
         2bqmy27z6rO3/y/COmpL1mDw2UB0B8xerpTRURqXdsc/TLW8onpM5w0Fb9KbFE7uwNOq
         pEEUgxbMGr1EujNDDlQRCeefxp+g2uENUAFUJhd0r4zMCYVu1Y66iCVc53DfhgyNE0sJ
         gwaWIc2Chv7B0XR0UXn0E70UoqrktYIUcxZVtLokfnZZUPf9W/3jvNre85tvQO1p2m/R
         RtfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FG8VDehIbeOQUWaCqQgenG+tis8xd0rnp6hElMi23K+iu++g01TawBhNRYwOSqHKoHWndgC+SqLlJMAJTeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAIME6F/sgdX3HxZ70Qzq5FeJVwABZRo+x/yakyAgPNLQVgocA
	w0rlFtrZBBBCTiaNhEdybV4+pIrw+SKmw1eoSps/aXveQWJNtMpUn/epltFZ+TFJLEY=
X-Gm-Gg: Acq92OH2cfOFURzWvEfYXuvFKCR5gjMk/rs8fH1nwAHPc8fgKOejCI/U5OdLVpUQl86
	SWflLYnz1EOnl4LOAxAQ6Aj9Qlx39sBx2PVIBdGch5V01AhXkj2hTv5hXMjxbG8lQBoeydDjIY4
	lKdD/AwtB1mzmLzoKnC2oCRVCcGK3+pliuLPB+gX7oSdKHOy3lKho57xgQZ1KlDL6Mk2BEzceO0
	iEX7cqfa8iqd67czwjMf/spUbf6AxH84Ic0a+CVE7T2id/rIywF8r/rWLxbc7UL66eMDGQ74o35
	bD1TVSmW58H7Bo2ef8zXLvPdKAsVQDNAYfbnJa5LD/Y+F9LM+NHo10/X2w/dolIxGox+NDjT/KU
	anv1g5T/gOHCseGn3n0t2tTpVh+xGM3OIFplwMuCxqFHyQdZc8O1nY0LB8LyNYfUPn2BrUWPh2G
	InjcqvzFp3YH90/sMtdfcT41+swGvugq7Ywz8A1ICwdTrUOOXkCibMpFhwJ7XIPkCrTvmCfmJ0X
	A==
X-Received: by 2002:a05:6830:6e1f:b0:7e7:9493:dc3e with SMTP id 46e09a7af769-7e794a32092mr1230912a34.3.1781368932957;
        Sat, 13 Jun 2026 09:42:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:cb9a:87cc:1314:fef5? ([2600:8803:e7e4:500:cb9a:87cc:1314:fef5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e78125d3e3sm4346652a34.0.2026.06.13.09.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 09:42:12 -0700 (PDT)
Message-ID: <8ddb4c1e-d105-49be-a6e0-30c220af98c3@baylibre.com>
Date: Sat, 13 Jun 2026 11:42:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
To: Roman Vivchar <rva333@protonmail.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ben Grisdale <bengris32@protonmail.ch>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
 <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
 <2df4cad5e29fbcb4c5c5f59ea0bf322c7a301bdc.camel@gmail.com>
 <RRvh9UBBrqdfKoCLaqgfcQ06UY-BSM2hQ0F6F1YkdB2k2RXYMQmlCG4phXk72oGY03t1g1kDI4z-SDeKlYkUv84-AjNLaWK7tDQlpEFQVKk=@protonmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <RRvh9UBBrqdfKoCLaqgfcQ06UY-BSM2hQ0F6F1YkdB2k2RXYMQmlCG4phXk72oGY03t1g1kDI4z-SDeKlYkUv84-AjNLaWK7tDQlpEFQVKk=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_094214_988130_91B6DFD1 
X-CRM114-Status: GOOD (  17.27  )
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

On 6/3/26 6:24 AM, Roman Vivchar wrote:
> Hi Nuno,
> 
> On Tuesday, June 2nd, 2026 at 7:42 PM, Nuno Sá <noname.nuno@gmail.com> wrote:
> 
>> On Tue, 2026-06-02 at 15:46 +0300, Roman Vivchar via B4 Relay wrote:
> 
> ...
> 
>>>
>>> +MEDIATEK MT6323 PMIC AUXADC DRIVER
>>> +M:	Roman Vivchar <rva333@protonmail.com>
>>> +L:	linux-iio@vger.kernel.org
>>> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>>> +S:	Maintained
>>> +F:	drivers/iio/adc/mt6323-auxadc.c
>>> +F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
>>
>> The above file was not added in this patch
> 
> The header file is added in patch 1 (dt-bindings). Following Krzysztof's
> feedback on the previous version, I squashed the MAINTAINERS into this patch.
> Please let me know if I misunderstood anything.

Usually, we want the MAINTAINERS entry in the same patch that
the file was added. It is fine to include MAINTAINERS changes
in the dt-bindings patch.

>>> +	case IIO_CHAN_INFO_RAW:
>>> +		scoped_guard(mutex, &auxadc->lock) {

We can avoid extra indent by making this:

	case IIO_CHAN_INFO_RAW: {
		guard(mutex)(&auxadc->lock);

		...
		
		return IIO_VAL_INT;
	}

>>> +			ret = mt6323_auxadc_prepare_channel(auxadc);
>>> +			if (ret)
>>> +				return ret;
>>> +
>>> +			ret = mt6323_auxadc_request(auxadc, chan->channel);
>>> +			if (ret)
>>> +				return ret;
>>> +
>>> +			/* Hardware limitation: the AUXADC needs a delay to become
>>> ready. */
>>> +			fsleep(300);
>>> +
>>> +			ret = mt6323_auxadc_read(auxadc, chan, val);
>>> +			if (ret)
>>> +				return ret;
>>
>> Could be return mt6323_auxadc_read(...)
> 
> The mt6323_auxadc_read returns 0, while IIO expects IIO_VAL_INT (defined as 1).
> Should the mt6323_auxadc_read function return 1 for success?

mt6323_auxadc_read() would need to return IIO_VAL_INT.


