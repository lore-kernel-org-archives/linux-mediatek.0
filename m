Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707BFC3ABCC
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzH7d+l+7UapIjPhhBZ1DFv41GO7ARQVP3TgvTdkaus=; b=erIIGH3vs8bFUN8EenrzCmWNhq
	kGgwi1clKMyqmG7zvAkBvCUnI6iqtwEukRIXstc++OANnFJcs1kuFd7XEEL6TEixkSjcG52QUFMbk
	CNxCivj94vSTqRhlXATQlHKsMTAjUf64ZOS04u3smQ2INtm85I8PRkPSNv5bUsR221m2ljaDvoNpo
	0dsFQC9s4fDvpO10hdySOFDc/Bwfnbg2kUQRugy46Djgbva4tIaqO/Btye2jvDg6Ng16PPxosvQa6
	WV/9Hwxd5YTAG988UyA+RKacFdCMWAa3iAuJUNIMX7dQ6QBQWBhsst1R+X6yTFPJMssLjtjaVGtY4
	0MEkkSvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFD9s-0000000FQCw-1gW5;
	Wed, 14 May 2025 14:32:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCWh-0000000FGbS-3fLR
	for linux-mediatek@lists.infradead.org;
	Wed, 14 May 2025 13:52:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so7546035e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 May 2025 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747230721; x=1747835521; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzH7d+l+7UapIjPhhBZ1DFv41GO7ARQVP3TgvTdkaus=;
        b=ZtQ8wU8nXCjKZPmao4WQZNYP45St4CvQU+Df4ASOlW6+bTOSn+DRnBBLHzPg+Vsnp9
         aEOAR7SXPU8TNk/sxXhGMsw3IhhVUHk3PFGt1AsSgPLKAxrir9QMWbj/DDq2RKPdI0DZ
         uQmS4MDj1rQYyFH/sBo22SQ4VOhr2jBAb8u3n8eh1ar9ketwd176+9YDgzZxeha+LjrD
         6ovpXd3wyXPptTV2fjBVLXiPFq4rTJ9UASLozWFsqn6F4W2oyWwJFCYdrsr2kE2gRq5p
         N81iA1Q44TUBUK2uazzHT1R+g43/V7CVKBtcbzkjOnNT+XJQXpoeVCc1Op+LX8jhafCg
         6yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230721; x=1747835521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzH7d+l+7UapIjPhhBZ1DFv41GO7ARQVP3TgvTdkaus=;
        b=OqPnG5Kb/O5a34w/Tq0HXbnMwyPT3beTai9SC8ZDIOwN4G1d9aRwm9Y3JSYAU9d872
         zKSlVC5ZgwCvttsIjDEpAl5sMsYBnDiNmlsNzL7B3OEbXoK+aa+YW+DTwT1MiOkoS1uY
         R8JlvLGUT28eNgQKyZycQMQgGr16KNJaS+GEkIVY/TeOoAOZvn1MzIODiRcvyZUUMsQJ
         MLFaOZmPhBjEV29dZOROEw7354YAKse+6EWn1nIW2Obbmrdpklg/FDJIbR4XzRRVE62S
         DwfGFFPYIXmXp9lRKiGJSNHT14YoF/mk74sya4TA8qTrfJYcHaP+WLyK/Udj7hbVvR4o
         HDQA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Na5z66l+FusHpNgX5w8TOMVNKirzMYVwedp9vypfIwcB0KGtE9ryfhe97/Jl86JpAi4/5MXPUJykiyyvyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyslVO73Be2/tdenVsEaLvJD5o0oKpNM7vO9I4hCCB1q3moHhmj
	Jys+6q3X2Zmm2Fwk/aof4gNSRiFPUnyTcO2flC2zp/ZT5jtVXQ0P+w9E06cNzA0=
X-Gm-Gg: ASbGncsMafjgvRfIjLbDyFbMAkgWZsajKU4TIrsY8E3M5VlhZ00yuvTswTaT2ixGNkl
	h0xxqsv2dT3+CYXVgxpm30/2YS2eJcz2jbVaGQ5SDjeBfjDo8wJhrD7H4+8pbmwiZFFWaLLXkQQ
	9y0EL36scBnmnzbRdz7QCNTBG9lew6TiZf4Tx/fvjauyYhcWEgA3zuSI+ZYyWV8exr/Z5Ksuq2a
	KMgTxS+UP3uUKeraU58l7Hca4fi5HaQpGsXhzAEHUGZrpBY/Yjv533DUc0MND+q4qhl2LPFRO/F
	Qb3RzmC6h3UaBhuZUfpO1et9XSd3Dyhm21HSYfRrqrT6I3Gemq5do6cibQ0wndjNE2tEwLVzI1n
	TipQsB6T8uV89
X-Google-Smtp-Source: AGHT+IFj9i5QTyKcpRv7+tejxsKkLmxlMRzgDUG9rJki22dIq9ouqJs9twLL4571+qHl8gfmhK4eAA==
X-Received: by 2002:a05:600c:8707:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-442f1a42318mr38467255e9.8.1747230721455;
        Wed, 14 May 2025 06:52:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f397b6fbsm31591395e9.39.2025.05.14.06.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 06:52:00 -0700 (PDT)
Message-ID: <b4c704d9-c94e-4e89-b3ed-f715bef4e379@linaro.org>
Date: Wed, 14 May 2025 15:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org,
 tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu,
 linux-mediatek@lists.infradead.org
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org> <aCNhVw7oMRhHQNq_@alpha.franken.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aCNhVw7oMRhHQNq_@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_065203_918719_8AED437C 
X-CRM114-Status: UNSURE (   9.53  )
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

On 5/13/25 17:12, Thomas Bogendoerfer wrote:
> On Tue, May 13, 2025 at 04:24:51PM +0200, Daniel Lezcano wrote:
>> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
>>> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
>>> processors. They are found in xDSL and xPON modems, and contain PCM
>>> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
>>>
>>> The EcoNet MIPS SoCs are divided broadly into two families, the
>>> EN751221 family based on the 34Kc, and the EN751627 family based on
>>> the 1004Kc. Individual SoCs within a family are very similar, only
>>> with different peripherals.
>>>
>>> This patchset adds basic "boots to a console" support for the EN751221
>>> family and adds SmartFiber XP8421-B, a low cost commercially available
>>> board that is useful for testing and development.
>>>
>>> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
>>> peripherals, and for historical reasons Airoha chips are sometimes
>>> referred to with the EN75xx prefix. However this is a different
>>> platform because Airoha chips are ARM based.
>>>
>>> This patchset is against mips-next.
>>>
>>> v4 -> v5
>>> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>>>    * Improve explanation of HPT timer in changelog
>>>    * Move pr_info to pr_debug per recommendation
>>>    * Remove pointless debug on spurious interrupt
>>>    * Small code-style change
>>
>> Shall I pick the clocksource + bindings changes through my tree ?
> 
> please do, I'll take the remaining patches.


Applied patch 1 et 2, thanks!


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

