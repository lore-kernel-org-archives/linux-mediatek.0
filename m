Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50036C04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 11:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KX9hqV0zskRK5OaD5DugwhktsOLn+sDNYThqE6fMwQc=; b=ar0MLe4wvq4cfT23uR5mlNRBwr
	O3Ut0PbJ6IRZTECWINagH4EXYN7cu5xG3lEEJNelf7aG0uCGzsXihig7shwUknHfmKslQej8jhLd3
	AkO8blaZTPZLGkjfh9MsvBe3O/MLTenzHGcMZmhy4xeGXijpuTqq5yoqKAVXBJjjGPTMCd7CNpIxT
	oLFUPEqusp+T9OmCk8BTULTxNV0icMBT/gktSDaw8jOhNlWsocLc36Xx1Ey80o3qVjIlnjUsc9aqF
	7AF2Ikgv6h5Y9bJUicazoKXVxb+NKuIZqYGoOsYABW6qQloUeWREgkafqhQsB5OdaZBZfV5rhbON7
	TeZDC66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQ1E-00AOPs-0m;
	Fri, 11 Aug 2023 11:09:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQ1B-00AOOg-1w
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Aug 2023 11:09:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe501e0b4cso17291675e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Aug 2023 04:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691752159; x=1692356959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KX9hqV0zskRK5OaD5DugwhktsOLn+sDNYThqE6fMwQc=;
        b=g6mgQru0bhMZCH1A8HevYnzTiKTOaXTOS7u4uZG61NUaEDA80dYEhY9SDNJoRRX2Nj
         Q354eqZZWpvDvdE+UfhcwAWI3NsgjCJa0YX++RKzte7Ekc4eb83ossEMmJ+4/1MPUf5q
         bucxgvncF5O7ogC8V73p9zCsGlH3oU8h5zX5SuItreyF0x/8z2T2S9GUl/H+so6eoPeV
         vTl1GEocXtOWLr1NlZJsJ93g8ktXxZ0XA1LLC2RXjpUqhEhUdT4dK9pfAVddybqm+vUk
         +kMecwfxIFbBfn0eSFOPAlYoS1bwHHTg+naW+VCrOHB1jxm6SQukaaCrgsmEwYs+vIoO
         G/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691752159; x=1692356959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KX9hqV0zskRK5OaD5DugwhktsOLn+sDNYThqE6fMwQc=;
        b=VrtQLjvfLvSe5VEAxV92gNi1wVl/oCVdoZNRR0IdrKeQtKAQ0ni5b3MmFyfZ7bd4/P
         KLgl5K8LMhGsUeKVaRyHPdpKigBzQuXyC83uzttB2FUh7F8TDmlc29Cm7vk4VYgPeEAE
         sMgBQJXbgzFtZ/UDPJeLOBOQLvnuB3GEiAfCW3FjrCupDuVW/598Bkn3sPqTZyS4rg+c
         lxpurFt13tJkPugs/4k5MXC0IDrkJY4/MlkxsKy4IBacnVd3uTdBOKH7buUm/vjeaCPV
         +MftzaaYYbM/9w4t59eIOBt1oCXsc2NpieHJVIjeFvxpryoOml4wtJBzF1Hn+SY31rgo
         8C/g==
X-Gm-Message-State: AOJu0YyOhywYlxOaWjeZy04Rr1CTXBiY4XaUeR6m9oK+/0n+rB7zBhol
	2QG+14LRA8g8PXoXhR3WO/KjtQ==
X-Google-Smtp-Source: AGHT+IHcNm4hdhkNSFEzx0s9rsAiJpNxzgPz/RG9vyafP/LWZuKwRYte/96gHS7ydYnStSxDYks07g==
X-Received: by 2002:a7b:c453:0:b0:3fc:1bd:95a6 with SMTP id l19-20020a7bc453000000b003fc01bd95a6mr1318137wmi.31.1691752158817;
        Fri, 11 Aug 2023 04:09:18 -0700 (PDT)
Received: from [192.168.3.194] ([89.226.188.33])
        by smtp.gmail.com with ESMTPSA id o11-20020a056000010b00b0031431fb40fasm5082632wrx.89.2023.08.11.04.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 04:09:18 -0700 (PDT)
Message-ID: <22fd0d8e-ef10-8ce5-09d1-ff136f594c8c@baylibre.com>
Date: Fri, 11 Aug 2023 13:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] spmi: mtk-pmif: Serialize PMIF status check and
 command submission
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@google.com>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 James Lo <james.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230724154739.493724-1-nfraprado@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230724154739.493724-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_040921_644100_F3608866 
X-CRM114-Status: GOOD (  17.91  )
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

On 24/07/2023 17:47, Nícolas F. R. A. Prado wrote:
> Before writing the read or write command to the SPMI arbiter through the
> PMIF interface, the current status of the channel is checked to ensure
> it is idle. However, since the status only changes from idle when the
> command is written, it is possible for two concurrent calls to determine
> that the channel is idle and simultaneously send their commands. At this
> point the PMIF interface hangs, with the status register no longer being
> updated, and thus causing all subsequent operations to time out.
> 
> This was observed on the mt8195-cherry-tomato-r2 machine, particularly
> after commit 46600ab142f8 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for
> drivers between 5.10 and 5.15") was applied, since then the two MT6315
> devices present on the SPMI bus would probe assynchronously and
> sometimes (during probe or at a later point) read the bus
> simultaneously, breaking the PMIF interface and consequently slowing
> down the whole system.
> 
> To fix the issue at its root cause, introduce locking around the channel
> status check and the command write, so that both become an atomic
> operation, preventing race conditions between two (or more) SPMI bus
> read/write operations. A spinlock is used since this is a fast bus, as
> indicated by the usage of the atomic variant of readl_poll, and
> '.fast_io = true' being used in the mt6315 driver, so spinlocks are
> already used for the regmap access.

-- 
Regards,
Alexandre

