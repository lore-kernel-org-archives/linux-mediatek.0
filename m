Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA6AC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uljV3lePHX2dT1PWNMh/ljjLSAl+kOPIh8cm/LkNac=; b=1kdckNEDvKCvIvPu/4u1dmPoU2
	1bvd90R+S5ccM0/7Mv6AHZ01nYFtbUqxUKXLbGzLyl2ml9CyIpH7jllk+NV9q5B80uSLqr4zo367D
	510UR6c5PoM4PgHBB8SupdrqhsPgWNSw5Qnz2TI6jtHiXvik/hE6rjYt9YmJu6gjKmYrKH6817NdL
	NMq91oLWlclyXoq4toWPz1q48YnrbWiJrkXz5/xktkXg5gvIyu0FGk5grF18vFRiOrZPRSI8p5rVT
	zYYmly/c6cmcvrXoRmeXNUSMoGgPBd77NMCapnJzFYMGMoqAJa3NYLmAKnL8DXXNwwMReubgOqtih
	j+tl7riQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oe9-00Da42-2V;
	Wed, 24 May 2023 13:35:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oe6-00Da2k-2V
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 13:35:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30948709b3cso568853f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 06:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684935315; x=1687527315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9uljV3lePHX2dT1PWNMh/ljjLSAl+kOPIh8cm/LkNac=;
        b=SO63kmKtSJT+rMuOzFfavtHtUqylLnOJdFFicK5cp/eceA89/zf3PQyUFaH5Rs63cz
         Pzm3JQnfxT3+MD7uHfDR/yLU+U7Gus5FSM9tHP9+ZSaIBDkq7XNwTso4yaPGZ2wllepE
         8f2xSrMVugmNS8uSy9Xxzu1Y+Soi4C+n56BPnZmw2VBq1j0GfYnWQtoNo+vDlNMMcodH
         JAG66GqoBj/9ugfDnaBciDx9Sy8+uZF4SM79v+Wyf5ADftBvUlHrLVB+2zv4q2hOVLSs
         xeSHkWEaN0XiPEOEbWMW344h9yvsp89mo7ke0mBbrLS8FhyqVQTXksnBIplcSe6w+D7u
         UwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684935315; x=1687527315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uljV3lePHX2dT1PWNMh/ljjLSAl+kOPIh8cm/LkNac=;
        b=RfU3kUOcnGXYWctVy3nYYw0E/x5FaPUyUa0hTkfMWfKx0h1c08UA0W5wF9gSSDHHy0
         2r3ZFlOXRC+oiIWMd5nDmNvaZ3+Fn9vRBqpK6+5vgyfG7uNOr9yJAoCM+rqW68y3Wgdj
         2MKksyQimcQWguS/9dkPlY53eAOHtqBCI8SL8oWgQMd/CLdvSd+gWf0zC6Myk55tBncn
         zr/YPltWrwZE2MYY/vyh/tPgxoMG7RTwrzi4cnXahdwY/bjBgzshDlyjG5QhUUfXJ1SY
         wxxKAJutj+E3YLUuFY2qD/4XUngKs4MJaIPY0CknUCDb3tOF2i4NISCkSs/5wlOdstq+
         NSxQ==
X-Gm-Message-State: AC+VfDy9AMDgI9fVOEzSUBtEByobsNNt99yF8UY/AOPfxlP0NtXTpQ00
	67Yuq0jn4wVYt4fnShRKMrMLfA==
X-Google-Smtp-Source: ACHHUZ5RZ7Bo5fpNypNWTBFfgonGWh7gKVvBN1SdijZkeoUQ8x/A+0ydKs+34LVC2FAgeWHBgFnIfw==
X-Received: by 2002:a5d:45c4:0:b0:306:39a8:6fa2 with SMTP id b4-20020a5d45c4000000b0030639a86fa2mr13135682wrs.61.1684935315016;
        Wed, 24 May 2023 06:35:15 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id a2-20020a056000100200b0030903d44dbcsm14555695wrx.33.2023.05.24.06.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 06:35:14 -0700 (PDT)
Message-ID: <1ee72aae-46ec-dfad-f68e-f9189c84d148@baylibre.com>
Date: Wed, 24 May 2023 15:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/7] ASoC: mediatek: mt8188-mt6359: register hdmi/dp
 jack pins
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-4-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_063518_821669_465336DD 
X-CRM114-Status: UNSURE (   6.77  )
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

On 23/05/2023 04:19, Trevor Wu wrote:
> Some userspace applications need jack control events, so register hdmi
> and dp jack pins to activate jack control events.
> 
> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


