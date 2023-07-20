Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966D7EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 14:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p4cBe1pMgniHvXw2LuLYSKKIqQxquV7AY6YDbEUJdE=; b=k0E3tjVRdbUN/cMuvsLutGRsx2
	K4hFvWQ17QuYjDWvceDZ1HvWQpp3RDShYyiWRIMzvM4yXIYqIygeIqWMs4yiABZRuocXyH/i87RIx
	/eTtakYwFl7iXBggZFkwg98kQqnIVJjwsBrxAsUI+RxbZyB9l6Seuci43UO1X80WTaizY29HUb9g4
	m2RZvUl3BGplpKnFFW0MXcEsez+hXcRclz/WCjyOmpIfv2+2TeltIeInbq0c4GNbGo7clAYd9cLO+
	JnL8jJ+x+jhoVzsE/3TJ0cBocTVYz4QlVJH1SHJNc8AAppRFwlS5zlLvSF/WfVyrwsKvciwCm/l/d
	sfZWvRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUgA-00BON7-1n;
	Thu, 20 Jul 2023 14:30:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUg7-00BOKy-0k
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 14:30:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so7028015e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689863447; x=1690468247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+p4cBe1pMgniHvXw2LuLYSKKIqQxquV7AY6YDbEUJdE=;
        b=oUUiGCS8pw8J7VoaCzy8JULE07XXLKQOywKwVV2oQdH9glG0suWrzfMxKYQOt3ySck
         Ts0lKmWd/zI8NUEFA7MocNG6AsBcCcndzq6dFmOETbgezPyI9Gt7rf2OlH64v+25Euau
         k9VG3h9NIkRhJXfLy3TxRJe9/sUX8C21mWgXHJYnipC/B0i+tTHZtGkiYoAC5Wa0BNTB
         6eJ3yjLPwsZqapd4dJadZng5ywjpfO4pFWOY51Zml2uoJZXQi29eGMyZhe/xuCT2mL5H
         YmT4g/d/TFxVLrKFvgheNOiI874jPDyzqzdVJJ2tOFcU+3kaW0OGccacJPta4HJuC8nb
         RDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689863447; x=1690468247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+p4cBe1pMgniHvXw2LuLYSKKIqQxquV7AY6YDbEUJdE=;
        b=LgwEESos2nhkqFzNPNFOGVDXOZ0vQldX9ctg6PONK9a8Pwo1NOCsf+KCWEkaxXbskx
         xJuk49LRrxyStT7d7lfda6iWLP/X02u1q1yFn3EwWGfTPu6FGw7/WadXQEzYueWjPqmQ
         lNlrsJaWsp3pARiu3IybsiOSk7SYU8v1njLkuxUmEF2hl1Xm7AN8ey1l/mYZxzEwR0ql
         Aa9dlvKFXuDwbJ9npM8T1e6rvdMN7I3ffyb7BOOawkYi9qu6tgJMrnObryQN9HipTcPB
         r/GCtPm1E3VYyIfU3RhpStr0+zzI82IgngYGfXA4Q28lM5o5WExBKeT9xskQM4m/4qSq
         8Cxw==
X-Gm-Message-State: ABy/qLaTu6o5Pi6m4QqmjTPZ8KfXRcSIfB1z6B9ZuHvZ0NW7FL/vW9TJ
	8JcipJUd16anlm91pwUwy5xaIA==
X-Google-Smtp-Source: APBJJlGvGEcc3bxXa6+U1YfrxHHtDMiie6SxWyukbcPySyU+1GaZAiblUjugsW40vgKcbhSAJV0t3A==
X-Received: by 2002:a1c:7507:0:b0:3fc:f9c:a3e6 with SMTP id o7-20020a1c7507000000b003fc0f9ca3e6mr7262763wmc.9.1689863446765;
        Thu, 20 Jul 2023 07:30:46 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bca4a000000b003fc00702f65sm4028031wml.46.2023.07.20.07.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 07:30:46 -0700 (PDT)
Message-ID: <a2bde8d7-8a30-3f29-b4bd-629416ae20c5@baylibre.com>
Date: Thu, 20 Jul 2023 16:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-10-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_073051_267127_8E51CCDE 
X-CRM114-Status: GOOD (  14.81  )
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
> For the eDP case we can support using aux-bus on MediaTek DP: this
> gives us the possibility to declare our panel as generic "panel-edp"
> which will automatically configure the timings and available modes
> via the EDID that we read from it.
> 
> To do this, move the panel parsing at the end of the probe function
> so that the hardware is initialized beforehand and also initialize
> the DPTX AUX block and power both on as, when we populate the
> aux-bus, the panel driver will trigger an EDID read to perform
> panel detection.
> 
> Last but not least, since now the AUX transfers can happen in the
> separated aux-bus, it was necessary to add an exclusion for the
> cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
> way to do this is to simply ignore checking that when the bridge
> type is eDP.

-- 
Regards,
Alexandre

