Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499A6C25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpTS/UOJcc9WbuJR5vn3xPlMLUss9X8Ut2VcUbv1GcI=; b=ADK5cx7t9iCVZyFIE74Tv/eyAg
	GyUOAQ/QmmzB5sOEUBw7Cap148ClFRHpBrXTizhIGQblit1Alu/43gXS/I3m054XAT33056DSn7vt
	lEvf7twGxBsxZUDKjmiIyGCoOIHETtRsq8dfTVu3SI+CLjQvLzBv9Oem+Z3I/TrkIwy/yDZAchWeY
	Ix8LsLequ9BMvQKcC+Kfagw99+meGX4hgGVmRe4qVduePVJPV2rBwPwOBfs2/2yyE6yu1n/neLBM+
	tvGqkijfbOS9zyZnTvKEYPIkwrurXmwM1EwkANQqg0AjabQ0O7VdSpOa4hGw9pIkxvowEPG+eeQQG
	AUDIZdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92WV-0000000EVbx-0HB8;
	Mon, 20 May 2024 12:53:51 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92WR-0000000EVaf-2c8D
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 12:53:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-34dc8d3fbf1so1678090f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716209624; x=1716814424; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpTS/UOJcc9WbuJR5vn3xPlMLUss9X8Ut2VcUbv1GcI=;
        b=pJLPbmA94n9cTm8UEppaYn7KWo1SjmFLg0H3zs7yEPadm3Y/9RqLCTKP8/9jvntYHP
         vh3PglajUP9uZ1UG0hWydVSdWlmb0eVEfj2alP+9rvNISaIpUGHqyGST58NsWGMEwCd3
         PPWC6g2stSnphBKN/Q7c0Xy7A2wsP8Ve0iP20fZ76x5j7wC2CqqkIklL507el/aDSiTM
         FPss8jjscOImnYQtgICuXeHW4GtMUW7DCmc7a/+zLFz1YAvAQtE9PVd1eVQAoQbjY/Pp
         qR5mnFY0KhW/2s8AJxu+DpU+VeI/bEIHS/qQt2y9ikdMzITPsyefOPA458WQ30sdytjG
         f0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716209624; x=1716814424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XpTS/UOJcc9WbuJR5vn3xPlMLUss9X8Ut2VcUbv1GcI=;
        b=f3la3yS5xaL5dGDnBE6DjmcJsX/sMf5cOzh1yClO/qsO1E6T4p+nlFpAIROmXDN/QI
         U/BcdFelo+EERaxTb0Bd+htEmRl+Nd1jNSgVgWYufCFfyfnnnySRjV8sIwytnK40ylMy
         6vBR6ZasSUZkyH7w1U4GDm9IrNBHP7WglT5pDOnggqKdNhJs20Yd20/Pco/PBfX2rLU9
         2A0szpX4He45I7xBfu4VLABB2LixcQhscAyYvK47lzCVewUFZ/SUij1HP8UZAEYO5E39
         t+o8b2aHd0eMiOOukWqrSlr4bRiHbQminfZt8AmkVZ1DtOgMnBYGJsBQSStdwptg3GRt
         id2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU23st4Qf5O5FVYqItQhC+Ln5t73I9DEOxV2TgkDUaxPOfbQBid2++rvKpb05uP29On1KpqSECDBReuC2s+jrnosfERcc5F/p5cm00QmgQ1MO7q
X-Gm-Message-State: AOJu0YyxkW8rzUG3zj9n952qbCCBFdiEH9Aqg8twwDzJRC4y6t2st6x+
	wBcni1TyYfmJw522oxNSJeIfsIl9Gw7/rraM5JfK6oDSA6vl0CQEKedcwr/co/M=
X-Google-Smtp-Source: AGHT+IH3TUiR89Y7ynALFtrZoHqN4V0wClqNFYlgiy6j8bhsqgAWhVOwSDHKAiedHWew5HkCZs07ZA==
X-Received: by 2002:a05:600c:4e8c:b0:41a:408b:dbaa with SMTP id 5b1f17b1804b1-41fea539875mr229021755e9.0.1716209623945;
        Mon, 20 May 2024 05:53:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb1d:433:4e00:3518:6eec:d551:4012? ([2a01:cb1d:433:4e00:3518:6eec:d551:4012])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe004eae9sm407632325e9.1.2024.05.20.05.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 05:53:43 -0700 (PDT)
Message-ID: <eae892e8-f888-4d15-85a5-c89b6b6825f7@baylibre.com>
Date: Mon, 20 May 2024 14:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Mediatek thermal sensor driver support for
 MT8186 and MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <nico@fluxnic.net>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <981a8748-16d0-4744-b097-aa9dd14c63a8@collabora.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <981a8748-16d0-4744-b097-aa9dd14c63a8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_055347_885160_F15D4C65 
X-CRM114-Status: GOOD (  14.60  )
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

On 4/23/24 11:22, AngeloGioacchino Del Regno wrote:
> Il 02/04/24 05:25, Nicolas Pitre ha scritto:
>> This is a bunch of patches to support the MT8186 and MT8188 thermal
>> sensor configurations. Several changes are needed to cope with oddities
>> these SOCs implement.
>>
>> All values (calibration data offsets, etc.) were lifted and adapted from
>> the vendor driver source code.
>>
>
> I picked patches 7 and 12 (and also fixed them) introducing the nodes for the
> LVTS controllers, but will not pick 9 and 15, as they're either missing thermal
> zones and/or using the wrong names; let's wait for the next cycle for those, as
> I will also be able to add the SVS on top (needs a bit of time for testing),
> getting both SoCs complete on the LVTS side, without rushing.
>
> Cheers,
> Angelo
>

Hello Angelo.

I took over Nico's work, so I might have missed a few things, but I'm
a little bit confused with patches 7 and 13 (you wrote '12' but meant
'13' I guess, didn't you ?).

It seems to me that patches 7 and 13 were applied in next-20240503
(f5bcf8ab0950 and d3dbc472ac66). But I don't find them any more in
next-20240520. It's likely that I don't understand well the process, but
I prefer being sure...Should I resend them in next series ?

Just a comment about d3dbc472ac66. There's a typo error, I think:
nvmem-cell-names = "lvts-calib-data1";
...should be replaced with
nvmem-cell-names = "lvts-calib-data-1";
...according to the related yaml.

Julien




