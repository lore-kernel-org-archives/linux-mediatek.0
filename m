Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46769C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf2mVoVflay+UuUZTM6QyCoyU7R8Oct66Mg/IJM6lZU=; b=YIB4qRjuWIt4lJ2SREYzdAeNLZ
	fdVi0K4RMSber//omMobNVFukDen55krtycw27HmKVxrWP28rvc5b3l4LJpJO8Y/SOLIMQdXwiaiI
	i2YdZETHPkZg5ARtBws2hoVPBP+xSdsCJDIbtrXuhXpxT/zLDuEUyjQA9xVgMWnYccEkBredTDCfm
	eARWMPprp+xnBnd8RNx2/luJd767bRdNkn7gpsvaV0dhgH9+kXfU16B+Mv8xTVzT8H1N31D9ITGfg
	E5RrMmczTnggvTtZ3uRoh4LcgYX6+FxAuKGx9vQu5+4x1gx01WdWi6zY3KU70BkFG9uTDrya77sa0
	HwC1RWtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN5g-003Tm3-0q;
	Fri, 28 Jul 2023 13:01:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN5a-003Tiq-2H
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:01:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3177f520802so1372834f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549261; x=1691154061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bf2mVoVflay+UuUZTM6QyCoyU7R8Oct66Mg/IJM6lZU=;
        b=JME2b3NVifOSLmvYqpLZ6dYV47f3XRbiSi+7NW889mMqzoXpdDGEKdZWATqZ7ftWdW
         4QWqynSN7bqiM8sQyoTErVMsn/rG7A2MKbUZPyqjqZVGf9D5S1RFFphW0fLwAFwG+bS3
         VS16Jzgi129OW50T+WKR6QWKjI2kmfRp5k/rUK0w3WHXJX8mUsw75CKr9kvDgn/tjXj5
         Vw0+jkIWkzGyjfAdvbhUtv2pG88ihXQEyhshq0MGMI050Ul05iL+DM4oPI9ZHQ+Bt/u3
         ytD+hMbSidKRGWarh7IvfUVqrcJBjwrQYFa+cYgIqW0TIFfuGftfuibIsLfBh9R/Bnw+
         SsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549261; x=1691154061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bf2mVoVflay+UuUZTM6QyCoyU7R8Oct66Mg/IJM6lZU=;
        b=ROUoh0Li0Q63DKKdnyLmmjJ77P2mgm/0K/EeZKAuZaVQ6LxHbkGgLTSjgu6mrIEr3L
         +gq6I45najCpEZ1/Z0+Cyos0FgAsOHkO7rKDAW4sB4iPlAwVMEsZh/IW4+e3egvMO06a
         8abEC0aEep+GU/kXmbwjnsQq5EiYgsD1PZQlgSSRzdRkQyQO8xDWMNs0RWmKMaAG7THn
         hPz0C4Fup0LHSeEH7AwEfAIF6NoiTjblZ5mO7No7hJpssCenfJ69UG53sVsHG6Ju+Dsx
         sfzP3jo8knbU6H1esjNMgkAtdYYvoPk4aalbNUjVPx2F8r61wPE/WUwYRPkrUPe/euVw
         2f9g==
X-Gm-Message-State: ABy/qLYlhkFc5JyuOequJvX4g2Z9R1fsf6sXChRNgB/RkF/8iRJq+vRg
	dKnbkiY7i6WkaXoixAPBl/hteg==
X-Google-Smtp-Source: APBJJlGVqDRGmbAbM0+sd1YryU2znrhwu0i4M4Xf/2epgtob/BhmHayOa5M7HaMRl38LctbCDO00tg==
X-Received: by 2002:adf:e489:0:b0:317:5f35:854a with SMTP id i9-20020adfe489000000b003175f35854amr4674582wrm.13.1690549260939;
        Fri, 28 Jul 2023 06:01:00 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id k8-20020a056000004800b003141a3c4353sm4809226wrx.30.2023.07.28.06.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:01:00 -0700 (PDT)
Message-ID: <05b6bfd6-5227-b146-f5c1-d47881300e6a@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 05/11] drm/mediatek: gamma: Enable the Gamma LUT
 table only after programming
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
 <20230727094633.22505-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060104_308268_0C775214 
X-CRM114-Status: GOOD (  10.05  )
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
> Move the write to DISP_GAMMA_CFG to enable the Gamma LUT to after
> programming the actual table to avoid potential visual glitches during
> table modification.
> 
> Note:
> GAMMA should get enabled in between vblanks, but this requires many
> efforts in order to make this happen, as that requires migrating all
> of the writes to make use of CMDQ instead of cpu writes and that's
> not trivial. For this reason, this patch only moves the LUT enable.
> The CMDQ rework will come at a later time.

-- 
Regards,
Alexandre

