Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8602C531DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Aug 2024 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=; b=GcG8lYvVrcw2+6juhoS7sMEMqJ
	y3eWDZthHUfJBFYjvg8rNLAPJW6kHLwFd0aaV/vs3NnXkJIJbK8moQcc6H9k+Y3bbuXiHyv2vgWUJ
	gBuc414KA8M8btUFd8pv6vj1YvKrcWDXuyHEqZcflIbCOIcgLXJi+QbvMf3g00CKw231tBOi7gyBV
	nifAJPW3bXWv0csYe4bYvOuUU8Rd6RjmadvRpSG6looqF3OIbSYZB6BMlgMgvOh2mBkbTF5U71GHz
	954avQngHlxI/k/D03uTppfM8tkiguhrAT86+neK9Mxgt+k9bhzADxcHCxp4R68/5acKEK6ahQJ3l
	oxoNLAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAL4-00000006Oar-1StA;
	Wed, 14 Aug 2024 09:30:42 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9Hq-00000006EHj-1A0m
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Aug 2024 08:23:20 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-530d0882370so6185265e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Aug 2024 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723623795; x=1724228595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=;
        b=BRcbB4EgZGqfl689sRQUGSWOn3bOeZcWr5TopLsv1QvC9bwGxENCBX32WtMMgMlUVs
         a2+5NWRRgAlJ8kA1Fv7UrR2Pm/NcWCrgfXIAjGCcfeNsDFG79p8yxAPU7UxxvSe6k1jK
         1zUQQOA+WLXkHKxybUipedZ9174rRKBLDmxaQlo0JWqSfFT3kKfA13989MmprA6o4aOC
         6sINY2dKPcL7y6SpCJYdI8gH4xDG+pQ4Njg5DfMHRq2DVeyVyJw3XKoN1oLOmLkmxGny
         IgUT1NyrTqzqZ6TwgSiML5KPlDpVVReoSEUGTbS6wwvvcN9bUDmTnZPZ8ew6HbkQRrq1
         BZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623795; x=1724228595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=;
        b=A9sHYuHakl1pj9KlKTruW/NPR13LP/l0NkeoYi5tuPEYRDntfqmT5sBc1AfI7PiY7q
         AM9KPm++4VcoS1Sf00JBGC4vGzSm4hgyDUEYKDwSafU0YBo0eXN9T3lEautXa+MCJbd+
         +QH2QrsogKuxvV3NTJWTJbqnCooUlizjJKbsynwzh1r8TYipmD/CkftxS9e66kiyUzMw
         sjKtKEVNtBSoea5u9O97u4zSyAx5c+4AZP+BK4pGKCJ4gY0iy2pzfJtt6Bmk1Z55xKYX
         1FXVpSqohWPcfbBHUyWrfNVb79ueonuFwxg6ox2N11MTcnuyUMntcCrGwR+KvOgvnAg0
         OxlA==
X-Forwarded-Encrypted: i=1; AJvYcCU70K+ly6n6PxxDVbEvTOXrh1FkVSRiZs5HjtFUrqc7O+ARl7FmdCdngBDs+4F414YXGj8jLOH1NHyovt66DoZe7CgGZxOAolQ1xSRb6J/5zAYg
X-Gm-Message-State: AOJu0YzdIeVtWAFYLXtPhcxofWqKhV4P3Q/92+Dym8Jkp5B4oVk7Ivhh
	eA/GRAtP9Zc2iWG5cFwrWBSwfd9Q08iHLvb1or8C58cQBlAYzhD6/K5hA/Z5ASI=
X-Google-Smtp-Source: AGHT+IG6QSK40+UiY4L+iFUDmpExRkRbgPPw1TX9OKeTaKxcEceJXBh+o1azq0f3RjCLgFSJ+P0yEg==
X-Received: by 2002:a05:6512:3e0c:b0:530:ad8b:de11 with SMTP id 2adb3069b0e04-532eda8e5ddmr1174870e87.9.1723623795153;
        Wed, 14 Aug 2024 01:23:15 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51ebcdsm12266411f8f.78.2024.08.14.01.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:23:14 -0700 (PDT)
Message-ID: <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
Date: Wed, 14 Aug 2024 10:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] Add audio support for the MediaTek Genio 350-evk
 board
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: khilman@baylibre.com, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_012318_492675_31CBF9D6 
X-CRM114-Status: UNSURE (   6.70  )
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

Hi guys !

Simple gentle ping, the serie seems ready to be applied.
Thanks

-- 
Regards,
Alexandre

