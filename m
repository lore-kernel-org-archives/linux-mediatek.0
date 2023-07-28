Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2D9C001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHiawQpngVfU3Z6lAbvF/XFA4hRpbcAvvOhJloZt9Vs=; b=ggBg4P/Xfsbgu3hQK2r1n0SIj6
	mq12hd6C+hvnGVdysdQm/Gqp+12KBCYlcgQ2bzmv9ZFoIr/GennJHrxsWR58rEMvmwfqdGcKZ8z0d
	q0MNXBPj6gtzRTnHEH3nfJV0yh2yzlUynRQE528iDSE4QhwqfoO0fjaYAfMLy6W7etrm3Dnl8M1Qh
	WOUdCzDgsuoglf4Lapvu5EGDbqse/tii0HiPTyLzYPNGWi5MnlMqIUapG9h+uC/2IebUL8nHbwqk7
	GeR52FawztLLnN4cEMcWQtlSo1jkk0HTpBvMMkJjmBRy0Qim3oMsOQOknSHAIT1sXAEWjYoP7/W69
	lun4yZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN69-003Twn-1W;
	Fri, 28 Jul 2023 13:01:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN66-003TvU-2e
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:01:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso21681865e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549293; x=1691154093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHiawQpngVfU3Z6lAbvF/XFA4hRpbcAvvOhJloZt9Vs=;
        b=awllWdar0JnfZi5DTXXYlC2hQRqstsq4OagnOvDE4Y4dgS1nuIGsHmsgsIPkFO1t3J
         iCFiJqPRuQWI6hod3BhObT+26Y5r1Vjfu4ukCouCZ4VrA8E6CwMY6ZjA3o+l1hMb4AHF
         8GXsGhKOFGuM6+b/QIH3Jk5vpy6aKpIvO2sUafOsqqCerx9CRGYvA1MXUDz/DRrCv+Pb
         DLe9t7/gpBaIrYcFkAS+YAH0WuiKkFibdTsU7EfQKI/zfvZT55kbifsD83OV/+NiA9By
         c5mMuMTGuDSRi3A8iM4UxN5sx6ZQ/ZbJSa/pWb+5xqGErG61MWGbvkHSDNHoS588BwGx
         5mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549293; x=1691154093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHiawQpngVfU3Z6lAbvF/XFA4hRpbcAvvOhJloZt9Vs=;
        b=O0kJZShtIJtcjfaoutqTrxSN/A+PkB36l07VPuMvdZOo/L0Q2M+gbWX8q5c3iRIDJk
         VbeUQk7SmSOopJ5lrO0zXQURxGD66zIWAt6J8QQux9LSDmK5IVLcmrMiIx0wW++pzZ8X
         1R+wKWQR8C12b6LXvs352gxPIw2AP/FeBlhXmLxd5hIEXjseyLiK6wxxGrCkRE3to6DR
         MS7AOEJbUsL90qNqYh45j4qdaatp+hnvZyXoCCAGhDblYOWhWBnxD6tnxLSRucPVMPrY
         SJFeFJO2IDm7kmnZuEJojihx5FyL4OP5ZWpEUCmWYEhLpg4aPxTxTL38NzTLP7IaIrwq
         2jkg==
X-Gm-Message-State: ABy/qLZisS7dA+B1JxV7zz8gkyqH0ScOtBmE2lEX/Q+D8wZGnmQWZXpv
	4MkFpZUHZpZEJuW9fPS/GqZooQ==
X-Google-Smtp-Source: APBJJlFsN+yCMtYDAo87KgEo3nUVITs5qB6btu/td2eWZ7u9kpNIrrhvdquppQoWVobCDh5dBZDZAQ==
X-Received: by 2002:a7b:cc17:0:b0:3fd:2e93:c524 with SMTP id f23-20020a7bcc17000000b003fd2e93c524mr1690329wmh.26.1690549292943;
        Fri, 28 Jul 2023 06:01:32 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p24-20020a05600c205800b003fc01189b0dsm4174594wmg.42.2023.07.28.06.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:01:32 -0700 (PDT)
Message-ID: <8b47f7ed-9d21-c244-716d-5a9c3cabd16e@baylibre.com>
Date: Fri, 28 Jul 2023 15:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 07/11] drm/mediatek: gamma: Support specifying
 number of bits per LUT component
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
 <20230727094633.22505-8-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060134_863207_D9481CF0 
X-CRM114-Status: UNSURE (   7.31  )
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
> New SoCs, like MT8195, not only may support bigger lookup tables, but
> have got a different register layout to support bigger precision:
> support specifying the number of `lut_bits` for each SoC and use it
> in mtk_gamma_set_common() to perform the right calculation.

-- 
Regards,
Alexandre

