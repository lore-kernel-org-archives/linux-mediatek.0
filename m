Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB20C7EE2F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euKZ+WSAhXyrVn0AyoceS6rsEoXdp7CnlhslJOnii3c=; b=yeLkfAAa+A0/h8pPGTp2NN6rFQ
	vJfk2go8rC7zKUVF5KXSIXbYKAXdQVC7DWloDzvBUFa7zmEuaL8v814+O86BL5mO19IktNJKd81qq
	EYmZkgXm2HAyZgUgIK/T8cbDhdlJoxbnHAhplQFL2sMMvSwHsvonqIk0qRMU3qDe6UTW5+WP3oGKN
	HSFHYWkGrze5/mTGGUuXnKbggalSXTOEzq0xTBpxPkAWZcpsBD3cS7pM7UW1hLdh8of5uJ27OTeA/
	92X6oAMVx5WMCT7aNBixqVdmYp7amIggE7TdsONxgVOMpQIFkR0wSndNxrUdsQJD8WQqqhHTbdD+3
	EGce8vXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2TD8-001gWc-2e;
	Fri, 26 May 2023 08:54:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2TD6-001gUl-1G
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 08:54:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30957dd7640so237270f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 01:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685091246; x=1687683246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euKZ+WSAhXyrVn0AyoceS6rsEoXdp7CnlhslJOnii3c=;
        b=4Mm7af47pTxR8J3orNP08NtPkDhpbxyDPcERzqr+7U/N9u+uMixl2dJYKKbuHTmR86
         v+NDc0vAa6NNFOVw9ScYMGioN8DydRKZet4zZpk1nABJI/PzJUJYmzc8VyZ4sk+cdY9k
         JrI/McdCRlBbQ4IBhRNJTN7gx1AnDEPBuMmc/6F5+TQe2F1k5hHesJ4mwbQ3EzHwulUM
         9jCKozEpuyi5ofzSyhMQ2skTuXInpgS48bPPKQKdCnYCm/MFtiWZtT467tQkswk5Zm2R
         LSOgP+ah4r5PtfHCF7IGnCUE5ef/rDost6+fU+ioS34Z1vl8fbABqWdc5Z1zA2y6Kr94
         IrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685091246; x=1687683246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euKZ+WSAhXyrVn0AyoceS6rsEoXdp7CnlhslJOnii3c=;
        b=ULUAPzRO8LvmWToe+9uexKwco2Z/vqhv0aGFr4hmsxE0CoPCNbdtAiRs+9tNC4jatX
         maMzi2EEyEh4KhATSqdTPvP8hKZnwqJPSFF36uHJCN22FZzeQUomCmPuqQ0fNwTHF7MO
         OhFLgOuviezintxupW3Sab5RLJ3bpXYLqxXs0wKtj8D78S0vsHBS8/QJ9VmOTc2IPQoi
         LfjTtkc6NYdxS8SLh/E1pObtn041Gbkgf6kItjEDDKHxwxOCpHH147Qd+hWqgETftEsd
         zWOZX2vbXjA9UTxWGvY0JWf1fRI0CkUvJsSc21uASm2nIU3KfGaqRjqCp+gGdCjf88Hv
         C5tg==
X-Gm-Message-State: AC+VfDw0NdDggHQDCnsm8F59JyB+bkj/U0P+iN9qsF9JAjElK8a/D7u4
	UAXeRhatF65L4VSXh7zK+/8DlA==
X-Google-Smtp-Source: ACHHUZ7d59AY8hMyzp5lhJ8jqZmAoLniSNjqiPcXwIZvvpqz+lxlM0eOFDwJJVHGsHbG8WD1qsPlyQ==
X-Received: by 2002:a05:6000:9:b0:306:4125:5f61 with SMTP id h9-20020a056000000900b0030641255f61mr971698wrx.44.1685091246156;
        Fri, 26 May 2023 01:54:06 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l21-20020a1c7915000000b003f603b8eb5asm4564045wme.7.2023.05.26.01.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 01:54:05 -0700 (PDT)
Message-ID: <c1e706f3-9d80-3dd5-eeab-c24830f9ef03@baylibre.com>
Date: Fri, 26 May 2023 10:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: replace unusable
 clock
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
 <20230525-snuggle-twine-ed1bfc2aee51@spud>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230525-snuggle-twine-ed1bfc2aee51@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_015408_428544_E74964A9 
X-CRM114-Status: GOOD (  20.19  )
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

On 25/05/2023 19:51, Conor Dooley wrote:
> On Thu, May 25, 2023 at 04:50:27PM +0200, Alexandre Mergnat wrote:
>> The “mcu_pm_bclk_ck_cg” clock is used by co-processors and should not be
>> added to the kernel driver, otherwise the CPU just halt and the board is
>> rebooted by the wathdog.
>>
>> Instead, add the "aes_top0_bclk_ck_cg" missing clock to prevent
>> re-shuffling index and then preserve the ABI.
> 
> How does this preserve the ABI exactly? Please describe exactly what you
> mean by that.

I mean that reduce the impact of the change compared to the v1 where 
I've changed the index of the following defines to be clean.

> Also, what about any other users of these definitions, outside of Linux?

The clock driver and bindings are only a couple of kernel versions old, 
I'm pretty sure no one is using it. Also, if someone use 
CLK_IFR_MCU_PM_BK define, I'm wondering how his CPU is working since 
Mediatek told me that shouldn't be used, and after some try, I confirm.

I've a question: If something is wrong in the binding, you don't fix it 
to avoid ABI change ?

TBH, I just try to clean the binding. I can fix the driver index issue 
(patch 2/2) without fixing the binding if you prefer. But IMHO, keep an 
unusable define isn't great...

-- 
Regards,
Alexandre


