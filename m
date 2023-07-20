Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BAFEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDZiEbAryDtT6b4dJ7CPGyIFUH+xNqjsXBnjfT/64bw=; b=SwF5NatszwfG0Ha0YtQzv0xJcQ
	YiYR7KkKF65UXzePplxVAPzHzns4Y6NxSMuQNYZoQBUqQXVhxooU/Zl1xBOeaWitBOMzJ1H6GjcrA
	Ps2DcGIFBL1Tgu01RmaI5fXGGahjFYUtjccp9b/MXLSOPZUyXG7chUL6wnATJJxpzIvAczszNvy9q
	5evPIXqak+wtLaIs3zStWsIRtHZKPiWsWBwabhu3wt8Sqk4X4pKR/7qy/CDDgvsJs0TM29nnU4E1O
	omA9FWsNIBaIcjbuRsPFVcIzNIJDEwZOgFcAxeSjDLY8Wi7vYoLAn2opYmyuosF7gG1ki3+yA2/5Z
	Rm0D5wXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW0n-00BbYX-34;
	Thu, 20 Jul 2023 15:56:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMW0l-00BbSX-06
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 15:56:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso8016875e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868570; x=1690473370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cDZiEbAryDtT6b4dJ7CPGyIFUH+xNqjsXBnjfT/64bw=;
        b=cSR12mqNhibdO0PRFT43zOAR0T3KpTWjOTJf6mtMCd5S2VfDkUvrRiHzfUN+ysC76G
         1Vz/wz9kexOGjG/HNgqMJ/Yt+K3aiYoN6SAElL4uUDDmi2msQiHOt2NLoOTDE3K0WhJx
         UltMt+hDQOlriTB0Be7nM5Qe7LSAmx7WnrYcXbW/mzt7LGAQuaVDcsTOjJ57sfWMpZYv
         5xK/WXx174ScXkHqFQAJvisYnu3Pqf4O9XbgOkbWw92Xq3CcdiJtzXEWV39OQGwvbmj5
         Kb1xH8cLb8wgUYjhbDABBgs082b/3ReRSdMP8DXtMqdrahQd8YEY4KW6xjrxW3SjkxRK
         qAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689868570; x=1690473370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDZiEbAryDtT6b4dJ7CPGyIFUH+xNqjsXBnjfT/64bw=;
        b=F65cGj8GlwM/qTQNEM+AAxjBk8DvxgBS7YOoftBlO10uHS/JYgjjXnLn/oaCXbgzpq
         BeVfaiqGTQ03ydWtE3fzKQ2E1MJmsdsD/1M1yxSQbZstB1HLSkVUOTUclodfeBjvh4no
         Fkkef9nvPkjOCiuEFxSeZ+6uEihXJBixp/ggM/C3R1pSes3Gzy86WqKA/TC+30Zuwgm5
         1I5E5g/4+UwmplL4Jrtv00nZ1P880ZNV0/wDhjxwGXRpCgcXFqkV8SJpOL5f2kWm9tcZ
         u2oT5YKK9BsuBInORedrNiWsO6JJC/jwbRs8t8guYP7j5mlHZgxWh+EZR5USRPm1feNZ
         dwHg==
X-Gm-Message-State: ABy/qLYoqizOiFSKGhuKeCRdlCjemYkRZzh2vOyXB3uFYxiRrHXuA5m3
	S28eFZznp0u8RrmixV1yixsunA==
X-Google-Smtp-Source: APBJJlHkaJLHeTVodXnfjyaWtUl9ixUdRLHPGNnR93G3Z+1iFPPtUHNv6avOf2uwAq+mH+s77ZG5Kw==
X-Received: by 2002:a1c:7507:0:b0:3fc:f9c:a3e6 with SMTP id o7-20020a1c7507000000b003fc0f9ca3e6mr7462943wmc.9.1689868570376;
        Thu, 20 Jul 2023 08:56:10 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c00c600b003fbb5142c4bsm4285451wmm.18.2023.07.20.08.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 08:56:09 -0700 (PDT)
Message-ID: <21596789-71c0-351e-bfc7-8e81c7b1b175@baylibre.com>
Date: Thu, 20 Jul 2023 17:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 01/11] drm/mediatek: dp: Add missing error checks in
 mtk_dp_parse_capabilities
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_085615_071684_F82835E1 
X-CRM114-Status: UNSURE (   9.19  )
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
> If reading the RX capabilities fails the training pattern will be set
> wrongly: add error checking for drm_dp_read_dpcd_caps() and return if
> anything went wrong with it.
> 
> While at it, also add a less critical error check when writing to
> clear the ESI0 IRQ vector.

-- 
Regards,
Alexandre

