Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ACBC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ytq0Oo7HEBwVwlcYfKpnL3CTax18r1U5YqO94Iax+L0=; b=QwwoCuzeXDZH8vxcd3ji3o/SPk
	vUZ0HNgnBFkZ2lzaqNcCfjRZe6R4fRxs3SCTRXs7E2iQSLhGoPczuQT6QL/x7Hy7gsN7UAwqT5jBy
	+C+InKczzh1lv+QEABtQk3AVX2vSl/jn3d9+mvNSEjv35Eub6f3bfkEpMnNmCZThEZND2K8pOBTIy
	v2Xr1kriU/sjUkpSu6kv12dm9iSjxOXQWvYCqjW0OQaSZhWxwts36bi0AqS810J9tGq5W7G5kyZyh
	/oJR37aQYeUbfmZCfb8PuBdYy6gwd4loA+MKDSHlWicSGYmlEnAm4i/hGbOwiYIQSxwkMJGR+JZcA
	QbjWJwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYDe-00000003Mer-2WuF;
	Tue, 04 Jun 2024 17:45:10 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYDa-00000003McK-2Z3Z
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 17:45:08 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so18382171fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717523104; x=1718127904; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ytq0Oo7HEBwVwlcYfKpnL3CTax18r1U5YqO94Iax+L0=;
        b=Qh9bEBMBFHd/Cm9D6d13+r3quNAyOez/zit4p92U1+NPSR5WvMSkmytNct2S1Mi/ld
         yitbZVX1Tb4Ramb5j8xSneXPESOfgcsPEJrgD6uTKoxnaSnNgJJUAIgnCD/LJJk4NCgP
         vBp9cISrIV88l4+yKWZhGwdBkE72/5yjV56D6Yqm3VQys/ZRKdI8TgqygyqisA6eIhG6
         1IF/4k236gxtdS9m7QnSV5lgJke1Nk0tF7H6/F9tAlZx49nGXclXZpdwnio6rPc6V3CC
         D9ULgYmCObyZobB1u9kMsGIlHgUaLAlw6jir0ln4lArZOxINhxgN4iBpxqTCYAeGLHop
         +6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717523104; x=1718127904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytq0Oo7HEBwVwlcYfKpnL3CTax18r1U5YqO94Iax+L0=;
        b=ouvgUsJv0jHmFE126aK8wDrbNbsrSY9WCe0nn3W4O3Qtx7TehyCZnrkeWn/95t2avk
         It4IdFArvPbtft9uJByFbF9nZwoPV/8m2VkcJRHtImTMXnF7M+GKLCjG2wDXl4nMWtVj
         STVloWa2EzSVYfq99/YXx7uF097zME/X1p7zfmqM8MZxsFc1fL376ANjNfDjxndyi6jC
         YOzBhzUyPBEHbFTzQn4+oa2EsqrPCdNwMkRS6bK8gouyrD87DpDTTAXoKtqLOPLkg+cv
         ej28W5iqy7SHKrHtKbvSLSH9S5J/D1Mz8LPYIyErRUxscLjH8C2bfg4jdQ7tuHwzEHcK
         gvrw==
X-Forwarded-Encrypted: i=1; AJvYcCVoJZiwA8MZO3eP7NHd3CXJ8Ib+2WMb7hUZKELkd+HV106pWX+eY65TH9hXPrD7qDKN2TOg3UcnlpWhsgDtmLr3S8CZbgY9C0d7lOScBQLY3GhS
X-Gm-Message-State: AOJu0Yzpd20sZljyA/XBzQU9uTghwdyoXx41bC/p/rVKr7C/uKzAympi
	YNLI1cQrFfcVJEDyTUeLj42oFvcEbICQPnCnXivhgfhXgTs31GIfRwcGqcPFbcg=
X-Google-Smtp-Source: AGHT+IEEU4GODvXNmuOAaDu40512E0+kzwzk/nx1qRfocHGkyEprhLia63Wonh+Hi1Lwq+VCgrVf2Q==
X-Received: by 2002:a2e:8e7c:0:b0:2e9:841a:814d with SMTP id 38308e7fff4ca-2ea950e9c37mr81938541fa.21.1717523104333;
        Tue, 04 Jun 2024 10:45:04 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e559:5ee:5c4:82bc? ([2a05:6e02:1041:c10:e559:5ee:5c4:82bc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4214a4aab93sm21423665e9.0.2024.06.04.10.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 10:45:03 -0700 (PDT)
Message-ID: <145ba1e5-628c-4e07-bae7-039d1655885d@linaro.org>
Date: Tue, 4 Jun 2024 19:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240604-mtk-thermal-calib-check-v2-1-8f258254051d@baylibre.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240604-mtk-thermal-calib-check-v2-1-8f258254051d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_104506_686798_65C95A3E 
X-CRM114-Status: UNSURE (   9.10  )
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

On 04/06/2024 18:46, Julien Panis wrote:
> This patch prevents from registering thermal entries and letting the
> driver misbehave if efuse data is invalid. A device is not properly
> calibrated if the golden temperature is zero.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
> Guard against invalid calibration data, following this discussion:
> https://lore.kernel.org/all/ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com/
> ---

Applied for v6.10-rc3

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


