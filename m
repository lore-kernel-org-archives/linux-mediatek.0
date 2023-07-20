Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13A2EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXEWaHqf0lWHOwfVBdFzP3gPi6ixm8kTT6knvLIOnrY=; b=VknBiMDxg+n6QUEswQXMWRIhpM
	Th2tElH/nzxxoNt4GHxuCQ3vcLf+UO9nQOAUAwi5uJGgXHx/kWGbPOYIXKOUMYxcvJEyYGwrMfjId
	3jINgCp2AehsoQLJWFvzCI8gyg7c32UFxS3RVFBMFcmag924gtoSs8ctQHz1o9/TynXFbedENyrmP
	ABJn8p6aJSVjsjN5u5SlwGxAdXKYxEumxmBtFRZAb8zRn25WbXO1ymHWzfvjex1b2lD5RMDhcHEMc
	JlZ0MVqSeuQA0YmNlEOOK/45e8IZGBZNj2mq21yfnF3niS0k/9l92tYmiQ3swmr1I7+nBnw4YsYlR
	96T1n/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTLA-00BD5r-2J;
	Thu, 20 Jul 2023 13:05:08 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTL7-00BD58-1m
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 13:05:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so1024451a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689858304; x=1690463104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXEWaHqf0lWHOwfVBdFzP3gPi6ixm8kTT6knvLIOnrY=;
        b=wT923Xj1PAqxw+yaDhNJ/nUV/1XxpP2YqGKBg93pGqqICwOMUb0dd2qWkGps0F3RWv
         A9BYnTGB8k2Ky18llb2v3KVscxfx2n4NbBZYQU/nOjTRUYeVcwKvrbIxDaW5nFs/0hTf
         UGUk7Fr17e1IEPgeF1Qzvuole9rel2kVwbOhNDixj/ikRtx5sIMldhYoKXFxzBIthrSh
         HgCaqAFjrzZqqcNquDtWyne4GU/oTbwe4otfgdZA1SZA1EwVN6MRKYsbgrko6pkWXyjg
         uMpLOexle7flElpiGnShLxE4u16lsZnmcYSklUTMtphFCpZ7tCCpARdDy9JR1qqSSoot
         l6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689858304; x=1690463104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXEWaHqf0lWHOwfVBdFzP3gPi6ixm8kTT6knvLIOnrY=;
        b=KgFyfig6RnZ5OnTYG+wJJORR5/pc0g+jDYhk+ODTpU/hJl41ZnGKJzucmUtbxhxBBM
         jpXbOjOyfhQlZRpQcksYrasMlBoo5kRA+FGWigGabFGOeEuOvy3B69GaoFBnfLJ/7ets
         I3r6SSheqiKTTCNq37JGN1rlkP8+0H+665BpDYgQRdHXBWfs4rDbl8TPpzrZXGnMsByV
         ro52C/w0WAh6yZ3UVY5ijAnGBa2Y9c4bWJoLEMdJ8CBF8vWMFmep+bcVVrRJHyJYcsr1
         YzT5rHiWZ+r/sHruNn3eAyv1NNtBJkegyvaMBBaI/G61IC7urh2fCAZzFjaiT/KqEXiC
         A7bg==
X-Gm-Message-State: ABy/qLYFiZRZmLKLQPbKOqS1BoDCHD+oVwPxZ5VAy3pgE/6MWFZb74S/
	m2RHbuMtKkeRh2ztghYO7hH0xg==
X-Google-Smtp-Source: APBJJlF3czr78AaBbYI9Dkak734DtCkiU5pcGw2eai4oYTX2OPvmfRHYRclHZY5ITbbeNeFmedVu8w==
X-Received: by 2002:aa7:c1cc:0:b0:51e:ca0:8a2e with SMTP id d12-20020aa7c1cc000000b0051e0ca08a2emr4997368edp.36.1689858304071;
        Thu, 20 Jul 2023 06:05:04 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x19-20020aa7d393000000b0051bec856cb4sm734747edq.50.2023.07.20.06.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:05:03 -0700 (PDT)
Message-ID: <9d73d7e8-98ae-e5f1-706d-8c6128f2877b@baylibre.com>
Date: Thu, 20 Jul 2023 15:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 07/11] drm/mediatek: dp: Avoid mutex locks if audio is
 not supported/enabled
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-8-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_060505_594555_44B86DDE 
X-CRM114-Status: GOOD (  10.77  )
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



On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> If a controller (usually, eDP!) does not support audio, or audio is not
> enabled because the endpoint has no audio support, it's useless to lock
> a mutex only to unlock it right after because there's no .plugged_cb().
> 
> Check if the audio is supported and enabled before locking the mutex in
> mtk_dp_update_plugged_status(): if not, we simply return immediately.
> 
> While at it, since the update_plugged_status_lock mutex would not be
> used if the controller doesn't support audio at all, initialize it
> only if `audio_supported` is true.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

