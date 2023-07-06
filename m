Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94225EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lGRta1DFJWgP2Ka3XUK1qfLkVKYTy4OhAMOsxkgoyQ=; b=AmX25ODtWfHNRV80mL0s0IbS9u
	xWEIKe9lxy1//DO0xHfjnxI/1lrZAlDJdoOb+AnXdSbSxoqWwNZBKH1HnD7KhIvOfq7py3f1W6fNZ
	NZuZosQiyeDQb4PNxbZUeeItsD6TuSecwTx4pBZpz0oQr1F0WDqg9k2zth+nsyWEfEB4SqFehbuER
	ZJOnv6R9GMOXWGrYgykbIb6k3CFjdKVQKppqPVt5vTN401XtZ1Gf6onBJQkWZnMIc4LAZBNOqOhl0
	eBoET8As39fhKUwkcRH9lRccdKWX7tkqiiX96pKcmqNcnt731KAlQ1X5g0LcVS9yO1tLcNaTsU7oL
	HNF0FSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOCT-001eHo-0X;
	Thu, 06 Jul 2023 12:35:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOCQ-001eGU-1c
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jul 2023 12:35:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso6689015e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Jul 2023 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688646905; x=1691238905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2lGRta1DFJWgP2Ka3XUK1qfLkVKYTy4OhAMOsxkgoyQ=;
        b=t9T2EPPp9hbOjIHqqad9elRw73dzrHEK2qBF+VJuC8f9Y3/9oMFx31mNw37w8ibwcy
         52cdAg0Y7/Ozjn2LCoU9JJLD0kixWVjLFoeQwcSOWnSOGDJyiaHna6kf1NGSlP6EIHNB
         AWQQ573f791IbjtZMj4Pfai38KjablEBnkRW3fTVKJ9tmjDz+St1xrbdQjmcLwdKig/H
         wOIWU+6EHF/+4IvIFfRhyvcFdIwTfhJ5gK2gYQ4JfTH8N8yWiflC09nqE4vx2xuNmfLA
         W3KxngHtkuQWfYwyJN78GH7JZ3H3mggVoHkYCrGMzYmf0lEXaPqioQaGUnzRQqm6kN+g
         3I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688646905; x=1691238905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2lGRta1DFJWgP2Ka3XUK1qfLkVKYTy4OhAMOsxkgoyQ=;
        b=Wrpsyjqt7JTiGTSxBfAJDQsf+hsUem2NP0XXg+8GqK8LXImhKHfQttIHfykvbbNs96
         7EnttlU/GggL9eF8bc3nH4QA4zIeFcFZzyCO4NS5ZdBifxn6LBBrubZzpJrAqPebd9Uz
         0fPkKV+0QaFBgnoAahBSmtYqCKIeeshHtPDzMT27dNRXq8lFBDV478LiL0fjN58uEnqy
         SBGqLSnJWr2MdSJhy8qvsaQq9A+S14RKFnPA5zcZewaQpslq89xYHbcVawSLCYniRW2F
         YfekIXSYBgLMy6HGVJ3H6sjmlsdyc3G+o16h6KQDxqPfEm/6lcfT1LNwwMdj7QSXf0w2
         7+Lw==
X-Gm-Message-State: ABy/qLbpsfEFAH0bufmq6NQPzPm1A/3FpCK+3+vGXJMEFNnchm172YYr
	iiOKqcv6fXk7dRL5Do6r+C+4qw==
X-Google-Smtp-Source: APBJJlFztCovuW8wVvfjzKQVaVRs6Fs31fNA/tQYgjyyw5T1md8AvL7PKf82FqXbSOSfVivrPPxFsQ==
X-Received: by 2002:a5d:618d:0:b0:30f:c7e4:d207 with SMTP id j13-20020a5d618d000000b0030fc7e4d207mr1293596wru.61.1688646904933;
        Thu, 06 Jul 2023 05:35:04 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id j14-20020a056000124e00b0031274a184d5sm1764357wrx.109.2023.07.06.05.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 05:35:04 -0700 (PDT)
Message-ID: <67e02d84-3b51-9973-225a-cf11fcd1aaf2@baylibre.com>
Date: Thu, 6 Jul 2023 14:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix PM suspend/resume with
 venc clocks
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, yong.wu@mediatek.com, tinghan.shen@mediatek.com,
 weiyi.lu@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230706095841.109315-1-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230706095841.109315-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_053506_534138_9D07EE59 
X-CRM114-Status: GOOD (  11.65  )
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



On 06/07/2023 11:58, AngeloGioacchino Del Regno wrote:
> Before suspending the LARBs we're making sure that any operation is
> done: this never happens because we are unexpectedly unclocking the
> LARB20 before executing the suspend handler for the MediaTek Smart
> Multimedia Interface (SMI) and the cause of this is incorrect clocks
> on this LARB.
> 
> Fix this issue by changing the Local Arbiter 20 (used by the video
> encoder secondary core) apb clock to CLK_VENC_CORE1_VENC;
> furthermore, in order to make sure that both the PM resume and video
> encoder operation is stable, add the CLK_VENC(_CORE1)_LARB clock to
> the VENC (main core) and VENC_CORE1 power domains, as this IP cannot
> communicate with the rest of the system (the AP) without local
> arbiter clocks being operational.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

