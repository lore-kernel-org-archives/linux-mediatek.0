Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF57EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/vajSz0EMzHxMTH4BJFALvBAcvnPkERwUPuHlbHS8Y=; b=YXYnkF/au5Xphtj4cgsTO3K5E7
	Jnsu8eOTCjmdJKND3vBE0M9Doz+o29N/oYZt+a3BdCLWluTuP4hyJ2J7C6dAZzt8mo3sHnEbG7rTH
	/YAkSmSb7+R7LLtZY/Oeed5n62glMyIEQFpibPVcCc7Ls+zV6FmUUeCIWNnZclhMBAZoVaTH9+ZGX
	3dOX1DaR6qi3LvIJ5mcQhWqiNBlkCbJYEQGRJ3LQ3+jm9AvBKR5lD2Dc8QriNeg4gQeLKv4UCTb0o
	z4Ru++Uwn7lx+zBGdSQqBjtQzmRYo2DyeX+YtH6c3q7iNy+fECiaOX6+0jcNnsVvbHft58y3x8BjZ
	V0xZtZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVzl-00BbF8-2N;
	Thu, 20 Jul 2023 15:55:13 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVzi-00BbDy-1n
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 15:55:12 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f122ff663eso1446198e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 08:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868509; x=1690473309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/vajSz0EMzHxMTH4BJFALvBAcvnPkERwUPuHlbHS8Y=;
        b=GMKGYC43J5tI4ZHdzTaBI/o/alJd9YdIhB6mQCzf0Ewrhd6/KZNv4tDsSkOsaZ20qN
         O4K5O35MUgU4VN6yPLYbkNZXEiD0s7mpvRkzYRnUyzwDKQWITr1tTAO9JtRx1mmIvkWS
         KqoW72N6eu6cVUlR/nc7dTg2sKLp49PIsN2ocLCIca7vvwSW6ET/iXtFkh2EuL7kxcm5
         92R1jXNGkeHRXvuJCY+bKOeNBMCqXSKSYj9CE2lrkExjAOCzkMtC26JDlEQ8HU2LlJJr
         6iBgbKzPD5PkQyxmfjhj/5exLb6hJ7WTRc3c0idlcIx0AqNf61XVJdpdvZC7q/GDJMKk
         qvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689868509; x=1690473309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/vajSz0EMzHxMTH4BJFALvBAcvnPkERwUPuHlbHS8Y=;
        b=NmkDfMAbzdGxMwCaGvV4OXnh344x3gtdDoFv0mUvsW74ZMm4Qnphmw5tqBw60fMbzX
         j3TcjEHxH7sro5TbLxo24YHT4mk5C9+m1lnZQv/nOVku+jQNj+UHaSLiONDY7Y8+LpMo
         CMMH4z3bt90z4fGgchAueVU0ybE0HwMUGNM3qyUq54iPvxXIEZfUL1WB7assBm7wNR7T
         pfmc/Ajd5oJTzy0rR9LQ7L4OVx9C3LhD48H7WoNs0KCVL8/b4xAimXGlLzBu5RU60rIg
         V0ZdYL8xKetFFpMwPtHKUNXmgGSzJnqG7CL0Nw3I4lzI7SdrYoR7rb3Y5CkD48zBkWRn
         edwQ==
X-Gm-Message-State: ABy/qLbX8sMnGKUAAPogC2mAYRgTKnfu6eXnTyb1TXq98MJiw+pUPi6s
	wWiLYYwtxvkhnF/b6g3LvHKpVw==
X-Google-Smtp-Source: APBJJlEBIY1TvT6KLSO+AQ7zN+qW0dTIKxqy0mEXcL2xvmxKlSGoTfz+JsEur/+Zh4XZ44l7bzIJlA==
X-Received: by 2002:a05:6512:3443:b0:4fb:8a0a:31f2 with SMTP id j3-20020a056512344300b004fb8a0a31f2mr2428594lfr.69.1689868508680;
        Thu, 20 Jul 2023 08:55:08 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q17-20020adff511000000b0031272fced4dsm1695889wro.52.2023.07.20.08.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 08:55:08 -0700 (PDT)
Message-ID: <f7234a53-2449-426c-4cff-91c89bada258@baylibre.com>
Date: Thu, 20 Jul 2023 17:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 11/11] drm/mediatek: dp: Don't register HPD interrupt
 handler for eDP case
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-12-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_085510_767703_7E51F1D8 
X-CRM114-Status: UNSURE (   9.11  )
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
> The interrupt handler for HPD is useful only if a display is actually
> supposed to be hotpluggable, as that manages the machinery to perform
> cable (un)plug detection, debouncing and setup for re-training.
> 
> Since eDP panels are not supposed to be hotpluggable we can avoid
> using the HPD interrupts altogether and rely on HPD polling only
> for the suspend/resume case, saving us some spinlocking action and
> the overhead of interrupts firing at every suspend/resume cycle,
> achieving a faster (even if just slightly) display resume.

-- 
Regards,
Alexandre

