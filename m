Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A77C7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKsqJloU0YBMoV3i0X0WKgMs82pe/pvJwGVG1B5dvuQ=; b=Eik2o75hXezWS9zQ/+DnjqMUwQ
	AKBG68pt4Qfw1Q/OP14ozsaK0oRUWQxGYxRztz5lZ4S+Auz+Yck4LszlDAJkMNpNKqg7rKeoRIxWP
	E9bWEPbzeGLDNowDEpnBS1vOTGr48vmhyzX2OsK7D1wwIbcPZ6TPutPWsGeTfbHLAaIyiV/1OFMNC
	K0viJKhIdeiqm/GkoEsF1WnAh1k2sMm0FbJbIHSTNj2VWQJ3x45erKKj69BcsQCrZAi0BA3C93OHV
	1wZW4YArzmCbfExjcxG4r+v9aUtnnfICLDTwVVBwOvaNUcEHlUpwNJkAv02cI7uyIJj4qpMc6mubx
	fIe6NRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6AFT-00Fc2l-10;
	Mon, 05 Jun 2023 13:27:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6AFP-00Fc1X-2L
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 13:27:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso49173055e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jun 2023 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685971665; x=1688563665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yKsqJloU0YBMoV3i0X0WKgMs82pe/pvJwGVG1B5dvuQ=;
        b=QeU3q9/jsyk58gL5sa26StZVON3JbuBqt9Nb52eU+8RxPdI6qLMECpE1uKsvUn+FzE
         PSNLLarc31GkgZlUgl1U8ZDIjUjiO5ixz1IJIb5pJselR4t9UI2qCWbIz1bKmc772pJi
         3TlMufzV4+d6M2gOF1/2csgEhQnZeAbH+OqgEVaq9ySSiJ9P1woR9ikC5HkPb0V36HWD
         3tc+xdwssa0LKTyPA1s+2qKg2bFw3fhKJsbX8hQB+uhkVmXbOm9ccc8CFT9W6HPwc0Bq
         69E2MZKnDx152ko8OFpqYDuIS/zpyn5sbJZ0AaJvMTlE3tXLCv/LN61gP9urV6Ly+zJM
         v1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685971665; x=1688563665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKsqJloU0YBMoV3i0X0WKgMs82pe/pvJwGVG1B5dvuQ=;
        b=GWWwkxInVT7UnCb3CjOftmrWn6g6TgNXHZ8M2wQk/utZTRxjqMAcb/jRouCPec61ks
         2blvA0lHIjXHdhoAiW1dcrW0y46Bm9nCwEfUFWoHqU4QAbWIBSkYTChTfExCWmmYqakR
         zRaRVD5NUEKtD0RbQhy29gjfP2ZD6Jp5agAPBpJZ8smj/kVEkXkq5kCUJXLJCxXxxNc8
         jQUq6R8SVC26379+BEpRfL6fcOD6cNoxETBecfa4Tt60DMsw/NcDY4J6iQJ5mo2FS9Ec
         WUOlQMy2ec9/PTCYF0MxBf3no/w/wqU738Xx+jzjQ9q8r31aNdisloKqfpT9zU8MBvJ+
         qohA==
X-Gm-Message-State: AC+VfDxh60lSBcAkTT8AO28Ex01UPb6c73V2LzhE4GiDeNCoEHYs+99s
	g0INq9zLi7pLZ2QvTOLPDwDMuw==
X-Google-Smtp-Source: ACHHUZ5szxWU0mg13BybwFHk4fZIjbLh1tqAUhrF9z1CMgnFJZCaLz5CiJur6zNPASDwHNrYHI+/xQ==
X-Received: by 2002:adf:fb42:0:b0:306:2ef0:d223 with SMTP id c2-20020adffb42000000b003062ef0d223mr6185401wrs.62.1685971664845;
        Mon, 05 Jun 2023 06:27:44 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d4c48000000b00301a351a8d6sm9779056wrt.84.2023.06.05.06.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 06:27:44 -0700 (PDT)
Message-ID: <a66c9e7c-3a8b-f32a-7ac2-5717024599a4@baylibre.com>
Date: Mon, 5 Jun 2023 15:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: mt8195: fix use-after-free in
 driver remove path
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dianders@chromium.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
 <20230601033318.10408-3-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230601033318.10408-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_062747_765547_2BDD61B4 
X-CRM114-Status: GOOD (  11.76  )
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

On 01/06/2023 05:33, Trevor Wu wrote:
> During mt8195_afe_init_clock(), mt8195_audsys_clk_register() was called
> followed by several other devm functions. At mt8195_afe_deinit_clock()
> located at mt8195_afe_pcm_dev_remove(), mt8195_audsys_clk_unregister()
> was called.
> 
> However, there was an issue with the order in which these functions were
> called. Specifically, the remove callback of platform_driver was called
> before devres released the resource, resulting in a use-after-free issue
> during remove time.
> 
> At probe time, the order of calls was:
> 1. mt8195_audsys_clk_register
> 2. afe_priv->clk = devm_kcalloc
> 3. afe_priv->clk[i] = devm_clk_get
> 
> At remove time, the order of calls was:
> 1. mt8195_audsys_clk_unregister
> 3. free afe_priv->clk[i]
> 2. free afe_priv->clk
> 
> To resolve the problem, we can utilize devm_add_action_or_reset() in
> mt8195_audsys_clk_register() so that the remove order can be changed to
> 3->2->1.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


