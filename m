Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D33C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QW6VR0xbVDGg7YcGByTjYohe8SAyF9UA/FukyNaJluU=; b=Tu+dtrXrTy/+VDb31veM1h9axd
	XR1KUV33Dg/YpjFTDnVu1PyhBD34q6LoqX0FbIxD8SJKFeZp7laeEXQiKOwnK+STqoxXFkSEl3/5E
	CjHRsS5e8fQWo4PRH6wzAO7ONtFvzOVDE2IxNaEp8Hr/HAnLbc9UWHK7kNN3yHrMisXpMgeqZUjiQ
	evipyqSXV9w3txitLuy8W7TOZ3Xf/FSjYn6kcsERXKGrNG8BZ18gDH+IF4qfPwnrtRIiiYf2HO6Kb
	L08izioZv4LP9azIZNmymD2TgDaWvE9o63MwgIZkW3kT7HSyoa5fHfRBynCn28g7BUC6ayXQOwjbS
	n1chixrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN5r-003Tqb-1P;
	Fri, 28 Jul 2023 13:01:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN5o-003Tnv-00
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:01:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so22986915e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549274; x=1691154074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QW6VR0xbVDGg7YcGByTjYohe8SAyF9UA/FukyNaJluU=;
        b=b6qmhCDLZx5ial+sDOWJFOT0dV5I0NmjgWyc+CLCN8TsuuB36X6UJ0KD1m46xSOI0G
         N+pgOSfKpGRLawHGfwESWZL7mLOF1GchjCOMiMkwk3rF1SIgMja4SGgc1YfebArTkVOT
         dfQz1DhOsQJb+UaVx7UMOUCfMRbEZdGpsCdSJc/SVNO+izFKzscpcFoWB1+t+d/Pcr/J
         Z+uzbSJHD5H+9vzoGZsRCZva5wktpM7d17yKww7w560AaNfOxRO5bduB7aLyysjDy/2Q
         J+L5MIbOpk9Em5q0B2E5dweFMsikV/Es4rZZq36NLKE09DgTisBf0erR74kH/0wdgO6O
         F7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549274; x=1691154074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QW6VR0xbVDGg7YcGByTjYohe8SAyF9UA/FukyNaJluU=;
        b=Z4w0pb6FHWl4/DzI5H2z0RvdumjNk36UxtMo9wNqmu6KWla0Yx1/SnzPfd8vpzJT9V
         1QsExqdbCnGTJbkEo7rAcYbnccxMF1qfZBJiAik/XgKv6P8K6ern2cG8fmNQirFZiouK
         gIe4fTho2aL77QRiOzA8oTMoZhnkWjjRIO/q/27L49MsX/W1FaW/VVNlfRkfUj5TgVtZ
         kY3hBgvXue6WkaFs7TNnY/jcL5hm8zsp+PGB4ssq0/Gfe3oN3s8jcxTDyZoxP3d6xtE+
         4jqVOUluPuOzaiU5Fh57tkvfk7wBR920uDfRP7JjSfy2VLJqLVFmlf4HBDIZ3Meu4nac
         tkJg==
X-Gm-Message-State: ABy/qLaTpulpsbmI9mDdjLK4+lpgHFKhN7RDI7+/On5j/Yhzou8vs2ql
	9mg4FP9Vn1Oe85kS/xmDgEHb3w==
X-Google-Smtp-Source: APBJJlEmvDuoO6G/U6S079+Ig7EF8C9rgaePYvCOkc4Rlvpl1lXKFgFL1zUobv0qcSK4Q5YppqbAbA==
X-Received: by 2002:a05:600c:22c4:b0:3fb:c9f4:1506 with SMTP id 4-20020a05600c22c400b003fbc9f41506mr1917683wmg.1.1690549273790;
        Fri, 28 Jul 2023 06:01:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c215200b003fe0bb31a6asm1216079wml.43.2023.07.28.06.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:01:13 -0700 (PDT)
Message-ID: <764aa9af-fbf2-5dfe-9816-bab8568a925d@baylibre.com>
Date: Fri, 28 Jul 2023 15:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 06/11] drm/mediatek: gamma: Use bitfield macros
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
 <20230727094633.22505-7-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060116_033563_5E29F59F 
X-CRM114-Status: UNSURE (   6.90  )
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
> Make the code more robust and improve readability by using bitfield
> macros instead of open coding bit operations.
> While at it, also add a definition for LUT_BITS_DEFAULT.

-- 
Regards,
Alexandre

