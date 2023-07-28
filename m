Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4E8C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb3oJuceNFsIyuY2+c/BQpFgMtKHX3DFUwV7BlO22rQ=; b=fdv689tcVW/yufFGlACRLWBsaD
	9XlVcdz1BnHCOXT4ze4yWQ/ZKUJXZafGMf1yp1d3Zp/sj6thfvk+xJtp4gbXg0v9z9M4zRZpL/kzr
	FI2xr4ggYn7DaqKWn8v80+YblzDzc7c7DN64UBsNZHH9B+zSYbbaaYx5Q3T89YHKhpNRiCz9c2xJC
	6W33nRLO/Ut9w+g9zE9NsIIqwQyM5RTxiGIOdT9YK3DWqB/VFbXRAAsB51GcMoOhjRSQAnPhdgxQl
	vyRpKDdQHKZERNfgtuEMv5K/30VWnUpaOzoDeSC9tXLDeAPiKe0kLhzNXJsfj65XXKGLE3KS+s5hn
	+TlKVuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN6M-003U2O-0h;
	Fri, 28 Jul 2023 13:01:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN6H-003Tzt-0r
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 13:01:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso23344295e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 06:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549304; x=1691154104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jb3oJuceNFsIyuY2+c/BQpFgMtKHX3DFUwV7BlO22rQ=;
        b=xKFkf3KeKsEZ7MlGQXbss31BqYAtexCwGSFhibddZbapf6TQJRPQdZl0EH1lvY8NxG
         G8kOfa2vdunheArARTB+wyRiRVC2fGqyz0FffoadHHyxTaAUpzsygZMHFMjd8eWKXoii
         HR6AOfvCvDIlcYo4izDNPHLqsDqoaQ6eNwCGUH8D09oZvPzRrDyh8DmpVtcWbAMpFG7P
         x0Ok1ystdOp8Gb5sHGgdKjlO3biCA3lqMj/r2wWdTNiNBMMRgvvZpfKsrtQuffCcyfc+
         3Kvwy2AKNxM6rudl5W3pIDJ8o6I2Suw6M3aHKEFvJvBfTbOQoYTm9cY0mHDYlc6hLP8g
         Q2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549304; x=1691154104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jb3oJuceNFsIyuY2+c/BQpFgMtKHX3DFUwV7BlO22rQ=;
        b=EhwJVOv14K8wG6cqOdSvIClbtfGEUwjKJ3gy4ULaVGYkFLE3AWGswxyDudIjtb3RED
         pmnTBgdzsdWF3aw2dtS5WExfn9KnyNwpM/VyyKAYgBxG+XL2WW5obKaTf0UVzi4ptdeQ
         +UlDCPcIZzMLLLfBiwEk8YbkVTvZ1EuFKkA55Mv9ZH9OwL6VIc8nafCECIT0k5YuZp90
         qEaRMksWx3itdNI9KudKZ+UJNRKGKUq6y14EG/6FWrCLqf1lU2xX9+CcMjIqt5sk0kyo
         Z8ea/70vCvw6XWgEETPSMqcqR57vzn8njJNJR+dKxgqpEfbyCQU+PjctbDbM19ssufaH
         xa6Q==
X-Gm-Message-State: ABy/qLYdcMxXLYMH34N1FKRCTwBX96otNKw4Uf5l9dPr9kVr9sWPNmHn
	T8EmDhM7r8ZtMXFQiAV89oHAIQ==
X-Google-Smtp-Source: APBJJlGKWeFPOrR4SRapsGW6B0B45Wr3r3nXWLAfqntpnpIaERf19EDZd2fNRukT2WrEz3kObz6QYw==
X-Received: by 2002:a1c:f202:0:b0:3fb:a0fc:1ba1 with SMTP id s2-20020a1cf202000000b003fba0fc1ba1mr1846649wmc.35.1690549304029;
        Fri, 28 Jul 2023 06:01:44 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b003fb40ec9475sm4180321wml.11.2023.07.28.06.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 06:01:43 -0700 (PDT)
Message-ID: <ec9983bd-b9be-b672-8c26-d887f608de4c@baylibre.com>
Date: Fri, 28 Jul 2023 15:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 08/11] drm/mediatek: gamma: Support multi-bank
 gamma LUT
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
 <20230727094633.22505-9-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_060145_306592_22D2C876 
X-CRM114-Status: UNSURE (   7.48  )
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
> Newer Gamma IP have got multiple LUT banks: support specifying the
> size of the LUT banks and handle bank-switching before programming
> the LUT in mtk_gamma_set_common() in preparation for adding support
> for MT8195 and newer SoCs.

-- 
Regards,
Alexandre

