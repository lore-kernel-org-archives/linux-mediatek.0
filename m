Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC78C7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh+AyXkdA/v/9kzVTrAL99NIpdi0mGHc3m8uGx6UR50=; b=TYFbDskQ1hfJKuJUi/wIcYYm8W
	jH0VBHx4zYYpQMj2xRUxr4lOaO/iBzVmk8FVhpXKCOeguTcB7Zl7FiOZvSryTkSZ6h41aMKkKSKGE
	h76mD5mm3WGDpyP3vTqkkWz/akXecBnz0t7o9Sic6Ap/BwGiQ8rlKStkBNtG2WVhpZd18p5tTu4+p
	VLPS2Jp6VJJNL3HWurBJNYC/emI/N7o50qI/FfVwKAA/s0qNiZZO1RqTKAFORrD36VLP2oTzyWjoN
	FdzQlgqDhEI44ymipFO+ZNfRRnu4XRxME+j8VqzfmKzZfxO2kCnMvguQkG0IiK3DUPVeMeJ6n0KJJ
	r7tiooYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7C0h-008hVy-2V;
	Thu, 08 Jun 2023 09:32:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7C0d-008hU6-2g
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 09:32:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f78a32266bso3019445e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686216764; x=1688808764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qh+AyXkdA/v/9kzVTrAL99NIpdi0mGHc3m8uGx6UR50=;
        b=2zfWTuEMe3vS7U9zuJsMP2vQfKn8N+zqkxv+/d/SAkFZXyxO/JlkYJDJfYLoU2SzYk
         HOFfN7F+urIh30E6sqIClU5tRfZTXUkCUe5PetIsu0eLjLOfYWfhzb2tTFKWHusiTsLa
         3C99D0XgCaxBQkWubyObQpI8fGvpsqVVnxy9I41a0tNssosTD5paCXmH0ORLOBGmZfeF
         SREg7sdTJ8a4fI3a0h3g/UuzMW6WFAtA2NNxlRMyMHnXhtlvuDZC2i0pjONTDk8A34Zk
         cgd9iHTXTqP4YkCLMJV1Wg+TESY2Ck6rPjmQHkeLZPiAhYPdDEAONBsrmPxEMrT3sAdq
         Ml5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216764; x=1688808764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh+AyXkdA/v/9kzVTrAL99NIpdi0mGHc3m8uGx6UR50=;
        b=Zsl6CVyzpyTnl1sSIuAuwmA7ESPZZyA65HZlv/vprFrInV0ZyRQ9Dj+pYFirX0QQ7v
         xf2oQHVyAJ1k7U26Jv4vBsqGthF61aAwGa3+7Kg8urSo2pTyNVfEfMuWRLLSnHpY+PNw
         /fu5egmGdZ5kBRFvOmE6TFPW8D7x1tiZ9C9qAQqctUQbZO4Tz9jqMwDLmoUFxRR/QrKq
         mCc6LUGtWDLXi8AfZsLor4RJa55JHKSn5O6gvFK0LW/j05k5RgvesqmJwBATCtZXL54y
         vztSPDuLsuarq0RBaGwRJxsrXP+t0mZKx49Fg2tKxq6EfGtn6dES1e4eAxeoWGSva/O7
         w/ag==
X-Gm-Message-State: AC+VfDwezN2SjKkH9EJn3oHjCEWBDTcLOH46l4zy7M6wN0Jrz44XlwAW
	xne4c+z/lLh0pCkJZCVNKesWxg==
X-Google-Smtp-Source: ACHHUZ4niH/W18GVbLuK2FNm3lOVu/Kuf0O3YTklSvQmuP4gcU0NpNfou88IFGerHEFcQg4ETn2BUw==
X-Received: by 2002:a7b:c5d5:0:b0:3f4:2ae5:b35d with SMTP id n21-20020a7bc5d5000000b003f42ae5b35dmr846586wmk.40.1686216763972;
        Thu, 08 Jun 2023 02:32:43 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l5-20020a7bc345000000b003f735d6fa74sm4719624wmj.9.2023.06.08.02.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:32:43 -0700 (PDT)
Message-ID: <c8976700-6d22-3f7a-73c8-6986504cebff@baylibre.com>
Date: Thu, 8 Jun 2023 11:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_023247_875232_4503A048 
X-CRM114-Status: UNSURE (   7.62  )
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

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> This code triggers a Smatch static checker warning and does sort of
> look like an error path.
> 
> sound/soc/mediatek/mt8188/mt8188-mt6359.c:597 mt8188_max98390_codec_init() warn: missing error code? 'ret'
> 
> However, returning 0 is intentional.  Make that explicit.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


