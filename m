Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390A3C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWyaCH5kvW4ESs4M9KfJgiCk+SaUNMNInQ13HAztrpU=; b=MHbexh9mXK34pE
	FviWqtYtzgEPuK2wV5+Dph15dWpYQSDM7AXvcgMw0zEpj2KmPeFSttgrx1Q7KOMBHPs+mICb8dysZ
	zJ+KVe9nLVdiDZTuoseW6iIqBpE2Rzj/ys/GOaEBKDbknl0dU6hh0icMx71qT4o4yeLcUkaCrFCdd
	yJU0MEN+axrInRnbtBw2qe8FfJpnMjHzMEFbiQyVF4tf3t3Slab9i+haxF9YZ+ZNH6IZv0U1H0jHV
	EiFBJZG5GzqdQV34NaGRs61ZAZ+cGbgDi9VzB1YvSwHfpGWBIxePJhW7cwAcSiF6/zB7+z0H+X1aJ
	LTmctVC4vxoBS6v/rPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXO78-00000008E82-2n5x;
	Tue, 06 Feb 2024 16:16:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXN8v-000000081pL-13N5
	for linux-mediatek@bombadil.infradead.org;
	Tue, 06 Feb 2024 15:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QWyaCH5kvW4ESs4M9KfJgiCk+SaUNMNInQ13HAztrpU=; b=ZPaCht/oP7hdtgQU8sRxhu2+gW
	xWxsOvhB7SUWF+ThvaOBszsnUihXpdnV1iXqmW0y7y57x18whqNwGsqba7BvLFNikzXSW3SQxeWNY
	9TtskkA1qRtnSqf7EpyTrfAT9FZsNJRkqzr/MXYxEhjh7jejkgF6EQW92YlGls6f7M3Ph4jMFr7c3
	oZvpYjESmn71tTai2z+kh0TErjipIBgM10Efy3NMiRV6X82ejAz9OfgwY/wihyxJXuT/rzLr17HBU
	qw3+PTun2JHqtzSvUNt5LJcmT+vRBYEGgf6O1pbJjZmuzXI352oxrwUEQ9t1lRclJOPlbK70O5wj/
	uOL/uR2w==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXN8p-0000000CZft-3Vrs
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 15:13:47 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d094bc2244so41011751fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232421; x=1707837221; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWyaCH5kvW4ESs4M9KfJgiCk+SaUNMNInQ13HAztrpU=;
        b=yI18jGIxHlV/H0rzES/SdGnK6lOZppSM4G6n3yX/07ufOK8isjCBLSkr2X6Hh0T+PJ
         bsRwx0hINAQ8944wb5+Fqo8ZLbMgxHluQ0/V2uP7xKgFfO2Oxt/tBAxx4cBJrf2KLd8B
         9gzLHhDJhmnIjwl2N+qRTRn+SCymz3d72dB3qM+m0ndxZRRpS99R5HRAEmnh5L/v6eHa
         Lf4kjridM+PtNecqO35+prMVGzHgT1ld7Pyb+XNaeGurBDYTjyG63XGK7zD4/gSmZUQR
         hOSklQ4UJPKwtsqTnOOXvONMgozXH6CzfQFBixilO8DLowkFAjXZIlDPGQhxkEZxshsv
         da1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707232421; x=1707837221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWyaCH5kvW4ESs4M9KfJgiCk+SaUNMNInQ13HAztrpU=;
        b=GLJCdCrFY8gPVKgH9T5NwxtywbLf5CHSpIvgP6G0l+7bdkMulChqb5UZPIx0LetHTr
         UQ1QVCJo/bg39Qnjfq3RQjdjx5EVlN7TdDS4U1h/k3TInl3d81UE3y2zrmW+472vL7aL
         zjfkCz/KoqclxSvLsoICbkrWkIcxzYZKx51oWC3POrSgSP/9fiHb/pZs3mTxQjvjvkjA
         Ry7cfHCCCkvSEvtbqis0OsdH7y3PyXs0s8s6DEsTZC5cT8lYRHxarEMJ0RS24Fzkz0IT
         wfyPbyODIGO+/VYzE2/J6GMyauIM2MnCxiWjPnUexOYS8iO/Qt0Ny7zUwNpzmVaXXFQ8
         DNgQ==
X-Gm-Message-State: AOJu0Ywi8DOVuahTNpf9LOYfgAuaAhOaHcIgMyHCEsn7Xzuu+SbEA0Jk
	GuP6lbFGA8iMm2eTQgm3EbjVJA1WtvqhvOcRYRUS1CpU2yr5Vo8QKWkbIQC1reg=
X-Google-Smtp-Source: AGHT+IGixMnuJqGSOO1at9tSdlKV/uRXYeSHD7PzB5wvq+D88CIqZTbaqBdLuk5ykQQYRj9lYwj2oA==
X-Received: by 2002:a2e:911a:0:b0:2d0:94b8:72f6 with SMTP id m26-20020a2e911a000000b002d094b872f6mr1876981ljg.20.1707232420922;
        Tue, 06 Feb 2024 07:13:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWGUn9bDa/+cXpeDv22Bt5ksTKulOOn/dRxfCkNbPExvTOQ8/mbXtrpu7RRJZQHOjOXTlIM8+OEfU39pP0pdAIzfjNpdv3YOY6yhEe2++JI0Dx6STaNnH6EGMU2WZ6EpsX4e4JB5SXR3KzONHQfNt+IMQdI5zBMc5ssut3RJrb3jyiiDigMR7R+JW1iO2JXcwOw0e8a5QEI1d62NQqoN2rf9iJ7ftIsdZPxfsvHwDbREBQu0VCSUGL6h7m0A42MMmpKwontEOqmfvpHMRalFUFTYCQqxVseL+FkyQMl+4elp1rygVUk3j8yKETORIUp/cvJy92eTEsoSOtyj7MWyo8wN91AUX0p6/un/ouuxSlSWLnU1J5vWYPS+WiESocvAKoVuGF8shbNicLltg+Xw0gRolHIFHi2rSRkjQ==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p3-20020a05640243c300b0055c60ba9640sm1113733edc.77.2024.02.06.07.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 07:13:40 -0800 (PST)
Message-ID: <2d97df42-1d23-456e-9f0f-36b8aef08670@baylibre.com>
Date: Tue, 6 Feb 2024 16:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] drm/mediatek: dsi: Register DSI host after
 acquiring clocks and PHY
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-7-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_151344_040479_B4968750 
X-CRM114-Status: UNSURE (   7.11  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Registering the dsi host with its ops before getting dsi->regs is
> simply wrong: even though there's nothing (for now) asynchronously
> calling those ops before the end of the probe function, installing
> ops that are using iospace(s) and clocks before even initializing
> those is too fragile.
> 
> Register the DSI host after getting clocks, iospace and PHY.
> This wil also allow to simplify the error paths in a later commit.
wil => will

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

