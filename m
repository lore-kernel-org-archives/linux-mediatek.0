Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CE4C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcKLSf6eqeHNfF6j88elstYU7E8m3+v2pua4wp1GvKY=; b=va7SJ7pCUJuYvusKVk3GSP2eTw
	FrtPyGbol6UtyK78ylwa7Lu4VQunUsqdf0z5n4H4T3ZLqlFGDz+O5EuM9u/ocvSyu92ApGWDb6L64
	RqyoOEB3s77S3kPG5djTvwyP18U8dqFFgZP7IPHleoDjyPsUDbGvyAmynu3oyDWM122f8rfuQoAOQ
	T0PmVDWd5Q8bkrHde1SFCjHr2Y27y+9XZMaomrRAPxvfP7iuKflqlwZImuFLRs4CQ2oTmGSpgzaU5
	sxIqhl6I6OIYOsn2nV+84dhz9Q/I24EAwI8kAp4UFBOdtV3UBqOkoYM4+Zx0uiFtV0ks+cHYJeAyk
	J3Zv1A3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN4n-003TQp-0z;
	Fri, 28 Jul 2023 13:00:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN4k-003TOL-05
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:00:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fde57684d7so21111325e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549206; x=1691154006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcKLSf6eqeHNfF6j88elstYU7E8m3+v2pua4wp1GvKY=;
        b=Id2I/uZXCxhGf9uU5JGy2ExbghV75fhZ6VryidaP0Rm4p/HFiINjNvsZTqW+TTwG6E
         xj5V3JZ8OvvX0HZw97ct2sh03vk2b3UBBfYXsNgjdUlYMN6aAsT3fWCOjrnUIoVyUViR
         0/ippRm7XO4dhfIKpj4S7ygUnn/CIaj8OnC+DUUfs2s/qReboPkYT8Hroxqep3LqWTkP
         d8+C3wL3wehXODPOj2iuqhos8FMdR2Wz4RWw3oy78kdyHYjuth5tSYTbp03kmyoANkad
         /gTZ3QWuAJhDuLbXwsMGXRgr5MqfvF/wk9VdiXKr7u1uaoQRWsSUR5rDm5xGgQ9cl0iS
         MxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549207; x=1691154007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcKLSf6eqeHNfF6j88elstYU7E8m3+v2pua4wp1GvKY=;
        b=R44dSGEJYoFlXvj9pRhLNanJj/uc0SIz1Vl2gG1uq5l5xYoFRWmoJaP69/nmNQqQFk
         rnkLBCCBG2qAspQAQUQUwEGW+rAEkdpu1numvRUtebc0l0qpX3WMxfNO28zQ5FknmTWK
         LXfTRGpLGuiSQQk9bastbnWpunR+Q27Qrh7UiL9kfEGOjm6V5nF1eAY+sqoP/A3UDI4V
         DmvwTJV8xFfmaDSEhpx6XFz3qZ/t2/li06eQ1CL2I2tCbC+lfwtCIzBzL38RWEkftLTq
         hpVA1gPpv0NgZ5JMpVJ3FfjY+hTPpuargguoYf4v+iTNOSm92xZcZzDVspbZIzCtbDfn
         xOtA==
X-Gm-Message-State: ABy/qLbbD1FN8uZR8fBlWVijfotbToU1sloWL6Ifv6aSmsNP0t0SwcXR
	q6aSg3C1nhXXhCefUmRNnM+5Gg==
X-Google-Smtp-Source: APBJJlGuVwTkep94/YrL0o8XuTMW4QyNix57ZU5EauEPig4YFvwYocrHTQEry9NYmVRz7W36RYtFog==
X-Received: by 2002:a05:600c:2946:b0:3fe:6f7:60aa with SMTP id n6-20020a05600c294600b003fe06f760aamr1514434wmd.12.1690549206657;
        Fri, 28 Jul 2023 06:00:06 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c22-20020a7bc856000000b003fbd0c50ba2sm6994646wml.32.2023.07.28.06.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:00:06 -0700 (PDT)
Message-ID: <e695ddf2-b129-3671-2aec-6e96da3f8be5@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 01/11] drm/mediatek: gamma: Adjust
 mtk_drm_gamma_set_common parameters
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com, ehristev@collabora.com,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060010_069616_62F463DE 
X-CRM114-Status: UNSURE (   8.32  )
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
> From: "Jason-JH.Lin"<jason-jh.lin@mediatek.com>
> 
> Adjust the parameters in mtk_drm_gamma_set_common()
>    - add (struct device *dev) to get lut_diff from gamma's driver data
>    - remove (bool lut_diff) and use false as default value in the function

-- 
Regards,
Alexandre

