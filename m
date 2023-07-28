Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602B6C001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0IweAoRlrs81Hqx3ju5nKOAZc7hekwdByAQiZx3BgI=; b=tny60ocxtqUDpZF+hZxwzNp+9i
	bjOHL5BpcQb0d562kOCl5AW/P/INlhq+j1gdeD7/G7qQaz8gXSWqNOhvqvOmleJ0KUAepBwe4IAtN
	+K82pxFwfxLv3WttK+jfJqHHxGhtoh3HALjPFzmK5J3zi8LVVTqV8TP1tXyxokmyYV5NS08kgN8zV
	uUg4vv1At8rUPtEVD0Xe90F9WJTI9SqDwJPykNFxjCKtDfDFR62Qrm5kxbS77geDqegLswAK8TolA
	nuSewLkHMbeHX9V28VwaVsX8QudSv4S1UrjyqbMN7INSIomIZLWTR9XYhuk4jp33egifdb77lEvll
	HeFkJ+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN6p-003UFg-1K;
	Fri, 28 Jul 2023 13:02:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN6n-003UEA-0N
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:02:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so22641735e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549336; x=1691154136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0IweAoRlrs81Hqx3ju5nKOAZc7hekwdByAQiZx3BgI=;
        b=MFIkdh2MxKwZLX00E+7feiCDIvAAfb+BjKqW1IYNP9UN+HZbLXUXjV3zIGMQtXOjrz
         ljVocwo7jsA+CZLnvltvU+cqIYP7zwcGnDSI6GA0W7czWDL19UmROBhbo6JtVK5wkW2H
         r6MKh85kYkdzrREN+SPXU2ctkr5nS3Vsxu/o93KCsqmdis81mV9pcHtq9KooPM1d5L3K
         ExdpkIK/rh/dDXyYxwhmq5POxbiTmkfMg4wa01ZMPXlB38xDJ0I5739PFy6ujC8yHVvt
         JA95yIC6iHks4izPJBfwVj5HfqT28YGi5BKfjwhaCBKY+IOF4AvoA+UHhMVk/HbjBHzi
         6YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549336; x=1691154136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0IweAoRlrs81Hqx3ju5nKOAZc7hekwdByAQiZx3BgI=;
        b=AooCYitNX38RyAMN2yDgG7uRyv1FdghxrD5rI9T31+hzW0Lxsiv8/k7TFf0yC4un3x
         esyGDzJakcqmb11GAB3ci0upIuFlW3KNNIDtt3QVVP7vanJ00RSe1a8m+8Z3b9jFUXFm
         ngc5leFz6uXznjgYk3BR2tZ3XoFgdf7dLYn7Zz5xJNs8zQffBe3mZ2zGpUMsVDXyNbwF
         xT9Ona1dBN2eYWDapSGIw+DLOhhipxoRw7/qc5lG1S6jrqGAV5oebUS22GPJ8lqI5zDD
         3Wny4utSoPQwsJy5kmsqgR7tFmTVDdF1WBNEbhsKqKMv6cLoj64DqpBIS2jUGaYm8tYc
         Vdbw==
X-Gm-Message-State: ABy/qLaMvExflVeNGzqaEzaX/Gk8gvzMM7NAepmW3dSLBrokSIE9Fkjr
	X2ydfUQSvZHhOSaLvhy2gZMGVw==
X-Google-Smtp-Source: APBJJlE6Qtmoe8hIQ8IB/hjAI5S514771NnW9Mpe7jo8MzfBMxn3T4fQGMpr8MjUP0wB+/7mlCn3Bw==
X-Received: by 2002:a05:600c:2288:b0:3f6:9634:c8d6 with SMTP id 8-20020a05600c228800b003f69634c8d6mr1572683wmf.18.1690549335836;
        Fri, 28 Jul 2023 06:02:15 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c025200b003fd2d33f972sm6925221wmj.38.2023.07.28.06.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:02:15 -0700 (PDT)
Message-ID: <b6c962ad-d5f5-bcb2-42b6-7d956b0ec3de@baylibre.com>
Date: Fri, 28 Jul 2023 15:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 11/11] drm/mediatek: gamma: Program gamma LUT
 type for descending or rising
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
 <20230727094633.22505-12-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060217_158957_01E4AF49 
X-CRM114-Status: UNSURE (   8.44  )
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
> All of the SoCs that don't have dithering control in the gamma IP
> have got a GAMMA_LUT_TYPE bit that tells to the IP if the LUT is
> "descending" (bit set) or "rising" (bit cleared): make sure to set
> it correctly after programming the LUT.

-- 
Regards,
Alexandre

