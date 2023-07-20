Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199D1EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APInPB7RqnE96OD+GVxCziUT6IhjtDsuJ0KQfyBikKg=; b=Kr31dFg5uFwgmJDOpCngszFc2O
	fUPC22oQcWH5W0oN6o9yYFbcLrUgpmBl5EuGDIFR8f6CC6ifqw4ivO2XNv/XGY6P6JBPtAT6eEWGx
	Pxc7E9oYFPE+zCSiBTaZjZCvGk5tMkLpbs3Gi6HVNwdY6JXdgZT2SFycOY3S9bCpPa+1N2Lpw5qvY
	QYUuci5JAJ5pJBoUNXeMaolIR4qbw+gGmy68F4SROEwY/Nb0T45KaN3NqlP01A0lQ0qazIBCUOpmz
	r22x/t/fMrqfPsvubuztybtZKt0F9PaPsN8Mu9FSeaVKs0XDyzqsD8EcDa38iENAUe9Skv8nwBASh
	kW0h3Ggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW3M-00BcTR-0d;
	Thu, 20 Jul 2023 15:58:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW3I-00BcRT-2y
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 15:58:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so7734755e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868729; x=1690473529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APInPB7RqnE96OD+GVxCziUT6IhjtDsuJ0KQfyBikKg=;
        b=U1XvacrrAcEXhZMWOEs1D1gXdFvBG7S7/Gx3vXiguI8p3v2ePMaObAOQ7V/JaoDCJI
         Zyq1cH0GP6m4oMOI7VO7yJVL8tXcSswAfJUq4SO9ns5tuc4WsG8tMzncIpDosSnDEsme
         mQvBAFW9njBOLCIDbUob6/xrsbHPsibQratHN3Ktorg+l54KFs8vdnUb8MOKdm2LngBE
         HnemVN/pMIrZCTt4kW0igczwYXEwMylgWAhiZ6Q7U9FddzkCmvrNk25w91N2Mt2Bc4GA
         Dp5DBrajp4H05GmZvGAPxZeRuJBOkyZRGsEvLIA6nHFznDWNPiyRkpGBA9fXa1FKl8W5
         JbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689868729; x=1690473529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APInPB7RqnE96OD+GVxCziUT6IhjtDsuJ0KQfyBikKg=;
        b=bVB9mOQxkG2Uoyn2q++rMd+SeQgs3Onr6LYLDOePpV6vmu3vh6N4r2k+4Djt9EE3Nq
         uXEDtrDUX4eMgxqmxw/MfbrtLy0yahA3bh2XqOfsdjwzJv5Jpb+zkyTB02oCPklQBvI3
         UZblUW0uDf0yquvGtFsp1dnCIMk9G5vQcqxla8LgE4r2m2+nQsJidJVt0G3o/D2gJxHw
         sGLlG2pVUrdyzg7ipCtL5Q1tpru7s3LGR0DFuc+lDDl8LTW1W0Z5EFWvLNuGrL4TJN33
         tSmtTTPoyBNGhYU+Dw1gSlLQ0XAW5st1bAoalfyoxGytwctrJ6RInAGz3WPIvPRhBApb
         psDw==
X-Gm-Message-State: ABy/qLZ9j7nBpBbXbSkBy7Di5HPOUrXqcnlMjucZChv8y3Zpt4RYtLTY
	W05TQo5HzEUOEnAv/iSSsdvkvQ==
X-Google-Smtp-Source: APBJJlEW6ehSEwNUSYMtsbgzoCe6bXnwpN2+DywULbS7KdO346A4Zad5/hmiohby/H5JtNgF88pe6w==
X-Received: by 2002:a1c:7501:0:b0:3fc:21:2c43 with SMTP id o1-20020a1c7501000000b003fc00212c43mr2181991wmc.13.1689868728760;
        Thu, 20 Jul 2023 08:58:48 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c22-20020a05600c0ad600b003fa98908014sm4228769wmr.8.2023.07.20.08.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 08:58:48 -0700 (PDT)
Message-ID: <6a1218a6-5825-2366-f3cf-d44e1e9956ed@baylibre.com>
Date: Thu, 20 Jul 2023 17:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 04/11] drm/mediatek: dp: Use devm variant of
 drm_bridge_add()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_085852_955924_2150F458 
X-CRM114-Status: UNSURE (   7.66  )
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

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for aux-bus, which will add a code
> path that may fail after the drm_bridge_add() call, change that to
> devm_drm_bridge_add() to simplify failure paths later.

-- 
Regards,
Alexandre

