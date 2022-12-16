Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAD6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZfHYT0dprqImc1Uk5LH4ld/kDbj0LXQMAuGNeIQ9Gg=; b=grRsmqg5dLXoc0ZMoeQoZBh9sS
	9K0NHUhJwiyz9gQDNjVEWlU0nxGASRWS+LnZES+skJ+oKQoPOvzGnFHbkAp6mtG3/LgAuTVklVEfk
	nx6KZmHTx/Tiq04tiiNHxK9K95SWOycpJg1vhNGwatCwCUt5hlO3Ts2wMJfLxCe/t/9HpkVyIbbHr
	g+NOSg0Kjut83DL66NERF4Qvwug8ABdgH+m9FQBBLfk0mB7X3tGNSmDA+Ai7HytqpQvzkDpQJCRga
	mZ4BTcM2nqCCkbjmbgIQ17sLUsiuJjbeCtGzI9n/gFc2JqJFvR0GjOSkAl9+EEXO6Rb28pcvA/T3a
	LUtlVaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6A8C-00F3J3-M7; Fri, 16 Dec 2022 12:48:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6A81-00F3F1-Fb; Fri, 16 Dec 2022 12:47:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h7so2382116wrs.6;
        Fri, 16 Dec 2022 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VZfHYT0dprqImc1Uk5LH4ld/kDbj0LXQMAuGNeIQ9Gg=;
        b=aYzV7VoSX6CuKs/G7KICpjbENvVAl9kfCsG7lfepzO6zY75eNnm6plOKLQqcTEFmfD
         OgjdM/uj2KgJZLa9Edu2anjN3+CVPe4Rt1VRQLqyK0gAMIgjN02W4CY4ku2k+ajeQHTc
         X5xOA0f/x498AwFOEpQ5A8YtXKf1kT3Jcl3xW5hW9CEDFVlDAxV+TDkwlqU2ced+6E2F
         hwn7Zt9safszm3aRB9/JSRbJAcvCy/ZevUZcMFNDhxZMhOPiZmORsk385I7YARk2NAwB
         ZIY1Ti3cK6+DQEyY8bxt14Rghqmfvp4czFsIxk9tI+uPn5ABOBvlxR8S84jBZujZvBLp
         xh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZfHYT0dprqImc1Uk5LH4ld/kDbj0LXQMAuGNeIQ9Gg=;
        b=XZfrus9JtCWvyChjIhM4oz4iQDorPsslG08P0Ma9SR8yRTukHdIdry0Tbe8GbU8jjW
         G/U8RU2lZEV8+uK4OaZPBAucHJ0zkReBbKkQFHArXjWCtuaRjWb0+JKiMnDcAhTtPnGT
         EbpE1yfq6iDgbYO9IBTdOuL1JM9H50Jb5EfiTCT8GW4tI+fIcEYQo75FInHIEOkG2944
         ie2OV/9y4vdTWP3ndcdyXf9zEihkMeSXJ4wJsqtR2AuMeRVwiTQ7i45zSW0CV9FmjiPN
         CFM88GIc977s/4vefiVMk7eK9+g2SnrIXwnrLz/Yc7cfRbJ9hbLfi+Cs5uoDH49GgfaB
         QkjQ==
X-Gm-Message-State: ANoB5pnUmdJOINgX+TrASlq8lBHHM1m4CO1Z9inpap7eORe5uAz9Rbef
	5Z/rolb3yyuewerVwGK1fgNNv/iKD/M=
X-Google-Smtp-Source: AA0mqf7ER8zAilcdCKnATmIWE4aKgTRGPT7fIFrqqaIyJhI1ToDaAFN9VsJN2oqyqmgBez6oUFBe2g==
X-Received: by 2002:a5d:5043:0:b0:242:87d0:bf30 with SMTP id h3-20020a5d5043000000b0024287d0bf30mr19657888wrt.4.1671194872027;
        Fri, 16 Dec 2022 04:47:52 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600000c900b0024228b0b932sm2550487wrx.27.2022.12.16.04.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:47:50 -0800 (PST)
Message-ID: <b8b14bcb-845f-aa18-f8aa-ad0bed9fb0bb@gmail.com>
Date: Fri, 16 Dec 2022 13:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Enable the IRQ later
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221127-mtk-svs-v1-0-7a5819595838@chromium.org>
 <d683a2e7-b886-9bf6-27df-d8c67cedbbdd@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <d683a2e7-b886-9bf6-27df-d8c67cedbbdd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_044753_543484_69723A9B 
X-CRM114-Status: UNSURE (   8.70  )
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



On 30/11/2022 12:00, AngeloGioacchino Del Regno wrote:
> Il 27/11/22 21:22, Ricardo Ribalda ha scritto:
>> If the system does not come from reset (like when is booted via
>> kexec()), the peripheral might triger an IRQ before the data structures
>> are initialised.
>>
>> Fixes:
>>
>> [    0.227710] Unable to handle kernel NULL pointer dereference at virtual 
>> address 0000000000000f08
>> [    0.227913] Call trace:
>> [    0.227918]  svs_isr+0x8c/0x538
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 

Applied thanks!

