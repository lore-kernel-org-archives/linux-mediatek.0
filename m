Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A0FC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 15:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAGBZ1PEBcf/fJDsVPro0tPE1WsZuaRgTUZ3iHIhxSQ=; b=kEFIklLYxbplINu+EC8DUMItJt
	6Bvh1rUhGfqQ9uzLkfYU0TdZ5kaTDPcn5rYHmzeaDGAYb1AB+1OCPY0iuF8J8Mx+I8PqGSL5n36+O
	1E96ePVhc9JxazJlzbEajnTyySCuzMZz9/CdSJXOlryApQxeuVCnaHzGUdiGn8id4Luvipt0N9JV9
	XVCO80LLubkqVqTJDDkl+OrcsH4Eov2sdJhdEq92xtpQq4mT6Vsw08ZMs91ubPqoxawLKLPIwe/tm
	hwRbwo930Ys/8gXTYZLfEhxqdML2pzOqh4CEYC4ih19R8YErBkyws0gq/zywD7EeoWImpevJogdIT
	Bw3feU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s952Y-0000000ErSP-2TBN;
	Mon, 20 May 2024 15:35:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s952U-0000000ErPl-1LOj
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 15:35:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-351da5838fcso2543384f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716219301; x=1716824101; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAGBZ1PEBcf/fJDsVPro0tPE1WsZuaRgTUZ3iHIhxSQ=;
        b=tY54VACqvZcfJOeC5dxB9JIbfFgXw07Tp7LHCDEYS1N6Q7JqL6y8EWXELG6YcTplYn
         vE9wCF9I+UKJ0/ujNvZab/X2seY45q+e4OGIW2MFqOrR3atlTWy6h8w4H5B5PBFhdOyt
         EoR+cS6kHhhASCXk5EeV4Qx1FcfP3P+Sdqvze6s6yPJrheuGsi/rzFqxSgjMDuu7sHSE
         d5dceh/G6BmvIwZz7zkzYnsh2ZmFBlIbfA2a4OQaA++/a62xQI7KclX2sTSjGx2fwBc3
         K9cTVBoA5AF/vsxng3psIzdkPGHkGoH+ToV6apmynYhLkz7HAjlJCk6efi5SAULTJ7xv
         5Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716219301; x=1716824101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAGBZ1PEBcf/fJDsVPro0tPE1WsZuaRgTUZ3iHIhxSQ=;
        b=P/McmR1k6lCV1a2Cm2bTqU6YZr0ciVnHyVYuclknQlVtqiOw0rRafr6msgMJRgxLxB
         6NVnUbqMvXBF9S+bPUxqrxZ69DKJ6seU1aqOUGrk0EjPy2teVziNTqSF0QUuRjUsTNJx
         oDaV06ZOusQARQA0lQLF3r13ZXBdwElFRS1C6RUU3mkZ8EUUneJnVu4k+60YuHYForEV
         3pFhPQcr+IpQHLJisFPcCJ4O7ybcOhjBmqwZaz2qua/lwqhUwjaD4dhhFL1N/7ECQ3nV
         3jeH9373iejWdDxyAfdsXlI+SQHerOHDHZlS9qGAiByykQK7RimiRWaq+G4nrEyX/IQ0
         JnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyp0iUcy1uMKdF9BjQKKBAgDkrxW7XQoUpyptDRSymNnuyrFPpMDdQd+2dV0n/S0bZl6DfLlEwvKBATrL3d7n4ty+pp3qcZS1V0zPy/G+NWsdu
X-Gm-Message-State: AOJu0YzPuoLX4BQzyLBpp96WO/c9v0cfMaE83w8oCOC3KhESRdXheMr/
	qlRKNt4xIlLm+AYwXmNuOzx0nXwMJykW9OZ9LoJVi/xiKAg33BAqFWIaDw7mvTI=
X-Google-Smtp-Source: AGHT+IFNk692k3RqaMXye+c2Qq79nAeUMEO50j29S1MXyLQIcYzL4B0x4R28xGbxScdBA6EWOGa/VA==
X-Received: by 2002:adf:e586:0:b0:34c:b2df:6f01 with SMTP id ffacd0b85a97d-3504a737f13mr21144851f8f.21.1716219300694;
        Mon, 20 May 2024 08:35:00 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bcedsm29225112f8f.19.2024.05.20.08.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 08:35:00 -0700 (PDT)
Message-ID: <1de9d53c-bfc3-4d10-bf9a-b89ce756836b@baylibre.com>
Date: Mon, 20 May 2024 17:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/mediatek: Implement OF graphs support for
 display paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240516081104.83458-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_083502_454446_CDC1F4E8 
X-CRM114-Status: GOOD (  13.56  )
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
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

On 16/05/2024 10:11, AngeloGioacchino Del Regno wrote:
> It is impossible to add each and every possible DDP path combination
> for each and every possible combination of SoC and board: right now,
> this driver hardcodes configuration for 10 SoCs and this is going to
> grow larger and larger, and with new hacks like the introduction of
> mtk_drm_route which is anyway not enough for all final routes as the
> DSI cannot be connected to MERGE if it's not a dual-DSI, or enabling
> DSC preventively doesn't work if the display doesn't support it, or
> others.
> 
> Since practically all display IPs in MediaTek SoCs support being
> interconnected with different instances of other, or the same, IPs
> or with different IPs and in different combinations, the final DDP
> pipeline is effectively a board specific configuration.
> 
> Implement OF graphs support to the mediatek-drm drivers, allowing to
> stop hardcoding the paths, and preventing this driver to get a huge
> amount of arrays for each board and SoC combination, also paving the
> way to share the same mtk_mmsys_driver_data between multiple SoCs,
> making it more straightforward to add support for new chips.

-- 
Regards,
Alexandre

