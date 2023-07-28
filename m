Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C86DC001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQ7TENtsQkFhqj90o2fCA4gySBLYYAXohXgU0sJf+S4=; b=Z7LysPVvWiNheel4aXkqHTojzS
	Nc7dNJG6Ls+gvk6/ajEPy0HNdgBwaArMShcK5Sdp4tCczPZEWojrNW5rYH1N+7LOVzPCHiOrkLWZm
	9ST9BgUQSyYrdVQHuvXJiExHTZOOBAx/MpQlO0rwXQvrrI/4V+2857wpYZrr8Z/MNx6ieE8hR9al1
	0fDlAZRmVoTCUoHfzcMFEPjvrc4B1Satcpd01QoJ6zmTLQ8y+2v+x+rCeW2WLXIs0cXTPNvoHbLkH
	sAUzqNUMqdlPir0+PcBjjdTtT0Btc3ZjcL2pgP6rAoJ/uBxbE/3+AEHSVAjWRFgdvVCtLlzq0lTPP
	8ThOrPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN5Q-003Tew-0A;
	Fri, 28 Jul 2023 13:00:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN5N-003Tbd-0J
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:00:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so23467395e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549244; x=1691154044;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQ7TENtsQkFhqj90o2fCA4gySBLYYAXohXgU0sJf+S4=;
        b=TdgjYD7E5glMNvLk6eOm8Wy4ecM1zmFsHffYKx7OaFpA70eMULEUlnhr6EL5yhYphW
         ZXgzaO13Wjwqi+BroISZ6BxBCOYa39GX3b9vqNLkACsaxu4Rw0XUYwypzCS1i6uPP4fV
         BZHq9PktFfwqULKVHpjNjOachoMGI7Fs5IbtzmHdqJnmKvQpb3qyXiMYwQtZq5y7pmpP
         USfLCCn74J/L4j285lKh2BfAh3Q5EgT44fgFVkVj2SW737O2dF2yiCo7MVfUxL/apsgc
         k5/ZGfkKcLpKJuUzSK00u49bww46McJbYi3k57a/JbSlZObpfe+UmTNo4rJmsYOJRmzM
         38tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549244; x=1691154044;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQ7TENtsQkFhqj90o2fCA4gySBLYYAXohXgU0sJf+S4=;
        b=YnHKLLBqu098jo+x4RhhB8J6sAUNxM37sFKf5Z8Q+vb8JbC2eBFS6EOkBJ04OXD1FV
         QKyMUpk0YLbf3Ggk/EyA02v5sXXvmL2a7I7o/vobWfBMayqX9Xtt+RF6j7+1E58warRt
         GinaRNzdpiduYylC3ZeF/f9TQVGRB1IGz4/AuPAfr2yua5IoFkDMtRmNWkw4YeftgXGk
         neqOnzRt5E+NVVNtQwjliVtYW0ioAorXzSim/UaliINL74Be1LdcdO5ZJ7pvm0pQYztB
         nNeVftudOfyhSMeHgKoiNkCZdjGcQY8cbJEwDmLuyXITPN5v1frPg2vnDEUcOaXhsdCX
         9qJw==
X-Gm-Message-State: ABy/qLYCYb2eUfLW9manbrN/Kh35Crt2QJfag4AizM4XE5dTM91TKKCG
	5HlOVNegj0IXrpsJv/PFj9Az2A==
X-Google-Smtp-Source: APBJJlEOKfW1ZGAJOsrsnkH2CgAX1ClU5jm83vu2VnugwVvxyESowVTnZPErdgM6iYKniY4urP6VQA==
X-Received: by 2002:a7b:cd0c:0:b0:3f9:b244:c294 with SMTP id f12-20020a7bcd0c000000b003f9b244c294mr1858283wmj.35.1690549244305;
        Fri, 28 Jul 2023 06:00:44 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id g17-20020adfe411000000b0031437299fafsm4818155wrm.34.2023.07.28.06.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:00:43 -0700 (PDT)
Message-ID: <06162f85-bb38-d07a-38f6-e7303c80996c@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 04/11] drm/mediatek: gamma: Improve and simplify
 HW LUT calculation
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com, ehristev@collabora.com,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060049_141296_D6323E3F 
X-CRM114-Status: UNSURE (   8.10  )
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

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> Use drm_color_lut_extract() to avoid open-coding the bits reduction
> calculations for each color channel and use a struct drm_color_lut
> to temporarily store the information instead of an array of u32.
> 
> Also, slightly improve the precision of the HW LUT calculation in the
> LUT DIFF case by performing the subtractions on the 16-bits values and
> doing the 10 bits conversion later.

-- 
Regards,
Alexandre

