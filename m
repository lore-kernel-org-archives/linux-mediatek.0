Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04383C001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yic5Bry11hKn18+YDDsJcZ+oLXRJ3te0nRA7jPdDSuk=; b=WzBdGRBtFj+5egnM0zNG6YCcuN
	zUkCf8xXba+CnhvoXowRzZmz2qb4WsTm06AGWfZ+Jewc9lF4hrthcD+hlG/P23MfEqRqvXtBvbyTG
	lyou4xszhX6ghZ74uBJEiciezPC1F+eIJbPWRwSbA7KZIDUsKRdiznwor1UT6K/lJQ7Ld6JxgUK+N
	OFLt1w2T6nV2mAWMo+2Aoa+3DVEbXpt0HVevCBJLQ6Q9CNvMiOZXSzypi2zEuj0WpLNlKOoR46xDb
	zuvwzX0xYYuxI1pMwRDYmKbLtQfifKsX4larT4UCa+AWNOo/p8BCy21tNLiS3GDkOvALsJDP0L5Hq
	LdZp/LUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN4y-003TUT-39;
	Fri, 28 Jul 2023 13:00:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN4w-003TTh-1D
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:00:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso23125285e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549221; x=1691154021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yic5Bry11hKn18+YDDsJcZ+oLXRJ3te0nRA7jPdDSuk=;
        b=C8SH7e13yDBuQNlBegZNj6Cjo6qnz1S13aPtEuLkjrMSfJ/0x/3F4YieBmzJhEWtsG
         /WJrO00RPtlKCp7uKiMh1NNnrW6LYFmXCwf2hY7xEIljqnJnBaMsWk6ZFfsu2azWTzA4
         8PGLxI1vVKylGrycsWVcmzdQo5EWwy/4oMwTvWIw5kLn4pNN5kta7bx4HGCzmNpL52td
         n1gYMGEFJVEnRXT3jB8/B8XSHloB05w8X+FJy5Ly8JUFit6OgWAo0mHSV4Ddwo6YkoSZ
         P4GvqfLxTUTFulnPzeXRPQhtIlheI3vn3rVPTddbHax7wUfqnfcv04KipcDfJ0dg3+IJ
         0ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549221; x=1691154021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yic5Bry11hKn18+YDDsJcZ+oLXRJ3te0nRA7jPdDSuk=;
        b=fGbBik0pF/dSiyS60sFNi7HOLV05cJWk39l44k2ceoSgELGrZWe97YjkAE9GR27OgH
         W9vRrJvk0GgLQmkAg5GynkSCz2FsjgmdKLsiFihGnNQvyAGrrgC4Yy9yCxE+7zSakUzZ
         RewRLg5TNmCgehLyGVABBQiRaY/I92vug0rXYO+j/UaxH67EkXzfeuuZX8xb4HRrR5Lq
         415MEDyHzb17bBvGDd/Mqk9OTDi9ejhSFZ0gKMkUq6LQHKbX8G20lCEtgN+sxbQvqInS
         flnyh1szCH/uBjKbrpv03HioEBIv6QhRr/ahX/LvcJcvGkaPluMRyVL8pCHOcRuOgvss
         vy1w==
X-Gm-Message-State: ABy/qLYz1hc2+9Erg2tmeYgr9aeAE5IoqXFbMEmxdz4hRf5UpNmPNWuy
	dlp2cfqX/ScymlJOOdjTJzJV5w==
X-Google-Smtp-Source: APBJJlFc/T42hioLjioKgeh5+0Y8oQql3aNGb6cv0TdhzPmmOfEvCeU7I9mo8PbPpDI5/FunIizlbA==
X-Received: by 2002:a7b:c7d0:0:b0:3fc:a5:2c3a with SMTP id z16-20020a7bc7d0000000b003fc00a52c3amr1638513wmk.41.1690549221035;
        Fri, 28 Jul 2023 06:00:21 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c230900b003fbe561f6a3sm6950289wmo.37.2023.07.28.06.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:00:20 -0700 (PDT)
Message-ID: <49e7661c-a3f9-9f6c-3f34-5104ac60eca2@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 02/11] drm/mediatek: gamma: Reduce indentation
 in mtk_gamma_set_common()
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
 <20230727094633.22505-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060022_411619_D97C08D4 
X-CRM114-Status: UNSURE (   8.02  )
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
> Invert the check for state->gamma_lut and move it at the beginning
> of the function to reduce indentation: this prepares the code for
> keeping readability on later additions.
> 
> This commit brings no functional changes.

-- 
Regards,
Alexandre

