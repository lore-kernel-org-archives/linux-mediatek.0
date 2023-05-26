Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EADCC7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nat2dXg+UOzIavY+WSMDfeXKleU0IIvcUkgX31+SwQ0=; b=LEsldE36w8dvOu5u8DAILmclvZ
	9PNmadicvmUl+rPQGpRjChg13GDWmf+Q1bizEgmAF7O49flbEhiC58TjuJbBE8MGWsl0hSFtaoz5z
	G6uEQh/fhp6Iiz6hGj5488gsLhNj3xAo7ZcQqeRXpQ/DFqe7JU2+6mdn/n2YOINt4Cl7wa4zlReX6
	YJP8MA178FZr3Hpqwo0xKnSLsZYgFp/K2oXrGeS+k4MpnNlL/VKx5pWNuKFlRM6vDHd34Y/xtV75j
	j4yEwfAuv4FhocYQnZYhlQDvv+puHdgt3kUpGik9cl7loXwX+3yiaBFt+xwyriZTy05iNuRLkCNEx
	4c9a3LgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2U2C-001sJf-2O;
	Fri, 26 May 2023 09:46:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2U28-001sIi-2U
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 09:46:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f60e536250so11103035e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685094411; x=1687686411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nat2dXg+UOzIavY+WSMDfeXKleU0IIvcUkgX31+SwQ0=;
        b=QClPu3uwppIpWhb4E3uBUouUHuGMdCDCap+TS3E6hGmLnA4VjA4bKSBHIHelGx0ccW
         FEr0tengi50fv5JkQcvgU1KTRffYujLtgVjvOOvZFIGz7/sclzkeUoKurDBYRU7U4O+E
         SqZapO1awa/OnzqqYNJX4m6EBvNJHwiV0MmIk2Fg6KECJgzQiaRlFOAckqdKWBEhO/rr
         Zw2s3DnpcD0f9Xqt48cK4kdPbfgP6+ls3uZmqN3D0SfZahD/EwRw0v+HDDU6oOj8wjYV
         Acdo8a+1fB2+ZoPrSuE8Lf6gCE7iWPqS8QXsj3t50cBRwpqKw4Lme7PRmLQwPNJLszhT
         KLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685094411; x=1687686411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nat2dXg+UOzIavY+WSMDfeXKleU0IIvcUkgX31+SwQ0=;
        b=ZxotmlntKfEcF6CXgJ1aeILyBUx0bS8aoEr1A65Z6DfoEOhc59SF1gTyXNdXARHqIU
         cz7oAGPYcTZZYO4y2lJGBl6RJh5qtDdt8wdP/Xedqslo0/zNrIGTZKVmiPoYNOcRMq73
         EVNUpsv4YbPVIWXbtvgoWL23VnprJIDT0p6xTJExYL5TXi0ZxPF7Kz/dTYbJjlbBDl4z
         D6F3GFTlWeJ8mF0UcdllvA+o5I3jTMsyHXQUi025KmVPQiA6DyBQVSTonHvxNw6fX0ad
         hpthRKixy6wmlYZlYYeNRrECBehQmPZftWNy+k0WveJWoafbM+JYeeKI9ABaMl5WdPU1
         VCUA==
X-Gm-Message-State: AC+VfDyMUvZ6SbCpwy4gphRvqD6cICdQJyOgS1IIjoxvOjN3X+fqI21Z
	wrFKx4XOKrm4LrLlRQj7rWYH9g==
X-Google-Smtp-Source: ACHHUZ7zzzPEEncZvQtOFznUC+/7QoK+Qxxmiu8AfkXUIs6gj8Ym6jXeyUI0v0C9XmNiOfMiKm+5OQ==
X-Received: by 2002:a5d:5506:0:b0:309:491b:39ca with SMTP id b6-20020a5d5506000000b00309491b39camr1037698wrv.33.1685094410926;
        Fri, 26 May 2023 02:46:50 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u10-20020a5d514a000000b00307b5376b2csm4463662wrt.90.2023.05.26.02.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 02:46:50 -0700 (PDT)
Message-ID: <160d8ea5-81bd-ece6-a4a6-b93a62b4d749@baylibre.com>
Date: Fri, 26 May 2023 11:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: replace unusable
 clock
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
 <f3f7df94-74f1-dd41-00d7-0ab4fa2e4d61@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <f3f7df94-74f1-dd41-00d7-0ab4fa2e4d61@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_024652_808163_83FFE773 
X-CRM114-Status: GOOD (  12.70  )
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

On 26/05/2023 10:30, AngeloGioacchino Del Regno wrote:
> Il 25/05/23 16:50, Alexandre Mergnat ha scritto:
>> The “mcu_pm_bclk_ck_cg” clock is used by co-processors and should not be
>> added to the kernel driver, otherwise the CPU just halt and the board is
>> rebooted by the wathdog.
>>
>> Instead, add the "aes_top0_bclk_ck_cg" missing clock to prevent
>> re-shuffling index and then preserve the ABI.
> 
> It's still a breakage. Besides, have you tried to add it as 
> CLK_IS_CRITICAL? :-)

As I said to Conor, I can fix the driver index issue (patch 2/2) without 
fixing the binding (using CLK_IGNORE_UNUSED but CLK_IS_CRITICAL works too).

-- 
Regards,
Alexandre


