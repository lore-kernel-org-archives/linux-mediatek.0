Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBE5EEB59F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIVPdywrUFGG0FkWKS+0hdfToDR9IybfnZXJF/jGVNM=; b=SNyQ0HfFW2sLAAqUzXAhMk5MIK
	iLs4/NP7zscjrvqaAHOy6WPfdiqhaHuaJONzm3V1UnvDJW5hj3SH5/BIBEU2E4hlyaGpEtTtFuIbg
	HK29NeHVc1XdqZDcjJx2hBM4mWdWfc32+T01i8E2mGfygP2n5OVxrVYE+b7gbr21bbJp4HJX6Fge8
	1Pd2CwgLCfykZNxcpokUU1TiRiAwXIqTnML4QM3jq6PWt/ubHmgQpe9BwEKMEw99kFQoQ/TrNq4oi
	p61jdS+rxyaLsnGlfKwhr7k2ETUumnZhpkk7ndtF7EYuRaXyqmDE2lkoDU4kI2VRiMzyECbyddHDI
	VKJ1RthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soiox-0000000D0DU-16kk;
	Thu, 12 Sep 2024 12:21:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soiou-0000000D0Ce-07fn
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 12:21:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso7357295e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726143665; x=1726748465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIVPdywrUFGG0FkWKS+0hdfToDR9IybfnZXJF/jGVNM=;
        b=K8z3P/ZUNdUwjJiyDgwXmqSkhcYJiXtR8cE2R8tWBJ+vbbNjmSrLdrSsiVxVRjGiNU
         wDvvJ9G+z49UknDaaP6ivkE8eFIdX6zYRiUGtk2wfnISfVSacc7BBLJ5YsKFK3jVsreL
         HKX6imrzQ5ietaq4rPqgUmSfvEjw2jkF+/YHqQ+5vO1aarshR+IoGM7pEx1ldtrIMWMY
         63Sw7bjGzKvkJKsWL4WoG7DD2Q9M/vu7jDsKgLoKqbS3nM4XI/ilFNu13cmWofuIaGXx
         YrSXwIAqSfsZ5rqKVEOzwp0183h3Bp0ucbFKkGBa6BWsVTRo6oRIUNcldHuMQkUPsAuL
         MqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726143665; x=1726748465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIVPdywrUFGG0FkWKS+0hdfToDR9IybfnZXJF/jGVNM=;
        b=Hm/HtGzttdpwQs4CpIs9EYsvIwYWcNrislmKFgBI9BmbTjIQ/Dfev5B5tQMm9zMapo
         2ezcSH8N3qd8blxsfYOw3tAKVWUrUmqtnnQbsBndWJtwz6t/cVF8npSPBz70f7H18d/H
         s1r1w3a0VEtxeYInAjM2P3pwBAxbvXlAVbh/E+ImTuOYtx4J69FelMfexCryYPxRk8hj
         NOAseHNFZbvJqcAbO0PDI1A3GqM2369MGT0+UEALwYi3P8Zuy4Q/43xJj0AtkQezlu7m
         yA+svEF4gwtktAaYJgzsBtc96UAMtSxuWb4ANxuh9N9wOBkQBT2BpY2ZiBSGalJ1hP77
         cQdg==
X-Forwarded-Encrypted: i=1; AJvYcCXPhc2ek4Sf2abVVlnNoPRN2yTI8rg5DHcK24oziKqmOdCdfMUBnCHg0as0S54ghr/0ctqV3k6N0krMSVY9Ig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyiu1oInf96YCV4PzLKI6G6ugftzaO57bJxtplXplyu9fcQtCs3
	NSjZMzz0HV0GUMQ0VZimKH9pzaqF9NDxiRnNr28mUMznS5M7u4ky4W7aJCwfGUY=
X-Google-Smtp-Source: AGHT+IE6tn+Ot7sdV8Xz9YXERqzLMkoh4GL4PglAIIkRJBCPWuSCUxcEiM52/iHe7DMNk1u2EI2g2w==
X-Received: by 2002:a05:600c:1987:b0:42c:b4f1:f281 with SMTP id 5b1f17b1804b1-42cdb58f2bbmr21556165e9.34.1726143665103;
        Thu, 12 Sep 2024 05:21:05 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564aef9sm14294356f8f.5.2024.09.12.05.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 05:21:04 -0700 (PDT)
Message-ID: <88927a41-a49d-4560-ba73-f01d0c1601e8@baylibre.com>
Date: Thu, 12 Sep 2024 14:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoc: mediatek: mt8365: Remove unneeded assignment
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Belin <nbelin@baylibre.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240911123629.125686-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240911123629.125686-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_052108_191462_6CAA18A6 
X-CRM114-Status: UNSURE (   9.51  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 11/09/2024 14:36, Muhammad Usama Anjum wrote:
> The ret is being assigned, but not being used. Remove the assignment.
> One of the reviewer mentioned that dev_warn should be replaced with
> dev_info. Make this change as well.
> 
> Fixes: 1bf6dbd75f76 ("ASoc: mediatek: mt8365: Add a specific soundcard for EVK")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

-- 
Regards,
Alexandre

