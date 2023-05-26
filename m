Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E255C77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQDPpbfKxYac4dFfl3UOiv7iiv3UKto2YwW9RD/lJd4=; b=TvXIP/EfxX5ZiqOztq5wiHx+m7
	SLWAFzpMk/CGxwQwUvb/1ff6KpN7cotw+7wzLdu5YY9CPf+taiwX+0AYDfgYHjknxY5It2JI9D+J/
	8V7XETlNDy7Dc16YhQTd5dQkSfbdL3Mh3XmmUs2s/4Bea8bLVz/mTlnZc25fhFSK276N0v7nEOM/7
	OGU+CisMn19N2P1fCcjCbvCh5RbSyFdFhgCJaUm0j4GH1O92/HJAlFJGdk274xVZwkJFoqkVQol1I
	vkKFWqGjyWghAcIRvjvQqdNEtXG5LlowktH1InMS35/Qx4yeHHMHYbn/utUJ81H0bmHUlOgLcM99P
	QVOx/6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Z3p-002v1o-0G;
	Fri, 26 May 2023 15:08:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Z3l-002uyO-2D
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 15:08:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30ad752f433so480283f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685113728; x=1687705728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQDPpbfKxYac4dFfl3UOiv7iiv3UKto2YwW9RD/lJd4=;
        b=D8329d5gDBuupuw18ee7CiQedAqaHbalYu/5ad/0HLx8pzNJB/B/nXPqeXbg3zAn47
         UPrnWRMAm7bG90BMHhmY3n+VpBQQlENz9uTjY0+zpdv1cT8jbn49d562/eYMTZuYqhaE
         jYA1F+tj07JByXOexpqVnp32QWw6tjLsztNKTrHvXKu3Davn4xKVGIH1Y57SOpVjD20W
         OMAE1twiDb3hwtTTAn3q+ncHQjS6yUWcoP8TeAY32wV4CwfQ8TRSn904UgqFpjjw7VBD
         bzKazNedaXMHzxlBYF69bMm/ufjJ/1nFo4ejX/7ZVnMxqnyj/xDsr55nL9Aq142D8x7l
         6whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113728; x=1687705728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQDPpbfKxYac4dFfl3UOiv7iiv3UKto2YwW9RD/lJd4=;
        b=F8frauLyG6WVqsfKQ7VUywmk0WFMhLM15/Yade1IwejqIR+S1H2X6zf91DkNk7QApk
         bScchv6xaGclwmPnDG8fYKPO/d72WSXkWObr06dZR25bt2ZrNhzg9TnRBLn9eD/4ci5/
         qigDCdO/do13Dwqxu65YNYaXrTbT4xZy8pJbJiH5CCV1IY4nS+9EvzocOAokJ7CXhRcZ
         aNrrAvbExGJi4vokqQXIPgKcFcMU1WsvdevE2f7XzA/KUaeXReQrT7XJ4z0vZzDXGmE+
         CKvYwfAD56JoRVSTs0jVNQ4UqBDgTNm1AwhFXixp1uYf+xlXTqtlr3xl5lA5r9Nxlxnq
         I2yA==
X-Gm-Message-State: AC+VfDwgFAQ33oR4NMnl2NnvD9loeVJ/5BWTMr+o0YRxIGL7bHMhhp3L
	gJWnAD28IDGMhyZIldnR3uwUEg==
X-Google-Smtp-Source: ACHHUZ6Ur52z92yD9zQLf8/rpAwoOXof7X3dA6SmUIkLpPmI1FzD2sW7X7Z8flkFpqVtem4zLqfZ0w==
X-Received: by 2002:a5d:6ac4:0:b0:309:e24:57b0 with SMTP id u4-20020a5d6ac4000000b003090e2457b0mr1955408wrw.30.1685113728030;
        Fri, 26 May 2023 08:08:48 -0700 (PDT)
Received: from [10.1.4.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c228a00b003f42461ac75sm9055828wmf.12.2023.05.26.08.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:08:47 -0700 (PDT)
Message-ID: <f605a653-ba94-7a8c-1bfa-4c18f5d25da7@baylibre.com>
Date: Fri, 26 May 2023 17:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/7] drm/apu: allow platform driver to implement their own
 mmap function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jstephan@baylibre.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, nbelin@baylibre.com,
 bero@baylibre.com
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-6-abailon@baylibre.com>
 <032699a0-9a43-953a-60e9-59a515a26cef@linaro.org>
Content-Language: en-US
From: Alexandre Bailon <abailon@baylibre.com>
In-Reply-To: <032699a0-9a43-953a-60e9-59a515a26cef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_080853_727167_F585C377 
X-CRM114-Status: GOOD (  12.29  )
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



On 5/17/23 21:45, Krzysztof Kozlowski wrote:
> On 17/05/2023 16:52, Alexandre Bailon wrote:
>> From: Julien Stephan <jstephan@baylibre.com>
>>
>> By default we will call drm_gem_mmap() unless the apu driver has
>> declared it's own mmap handler.
>>
>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> 
> One does not have to review own code. We all assume that we send good
> code which we do not have to review by ourselves (by the author). We
> also assume we make mistakes, which we cannot find, thus other person's
> review is important.
I am sorry, I am the one who made the misstake.
I squashed this patch with another one I made, lost my signedof and left 
the reviewed by which indeed doesn't make any sense.

Best Regards,
Alexandre
> 
> Adding own review tag suggests you added them mechanically, so I doubt
> that they really happened.
> 
> Anyway, your SoB is missing.
> 
> Best regards,
> Krzysztof
> 

