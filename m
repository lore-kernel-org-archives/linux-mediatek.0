Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649DDC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQCf+qv5bd4ElCdzVZ3jNTOUbAb4CRaR/pYBuk0Bj3Q=; b=Bpcgm7XIGlU+9DC2FZpAN+KwhH
	qcXmW/BHjpZJs24O83Ti8l0cgDlDcA4bIrScZx6k968UBc43WaoWXJ8Hb7vqPFJVmxDDolGRQUFFJ
	iaENB+h9cbHdV9NtXJX0HIh9Pau4Nqyxhm/jRHi1k9ZTboCOeDSKJiqfDprIAHuFGwKyy21h9ig0C
	YmfUDqi5n6RKmlGgvziDzcieiIsav5KVUj9oxNo1tZt7nnV1hGsQSGTP85Hl7fPtgM1m7aeevq7pq
	up4dN/oZ7qACaoKrm7nvVzTT+VUTJwfcbHUtUOcR2pdRJUkknR8UtTW2hl12C5fsSD9e1sFoNpm8S
	9SjumChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AsT-00FL0o-72; Fri, 16 Dec 2022 13:35:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AsF-00FKsa-SG; Fri, 16 Dec 2022 13:35:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id v7so1928187wmn.0;
        Fri, 16 Dec 2022 05:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQCf+qv5bd4ElCdzVZ3jNTOUbAb4CRaR/pYBuk0Bj3Q=;
        b=WiX8W2ruP+9YIPUcE2mF7jpRd3+tQbG6B2pisNWD/F60SYsz/mLlJkPZKeDevbWyRR
         K3KWOQt5JlSPIGHJ03kmpT/LleN/eJ4Ljj1BXCrk7hPDWmmg0xQdx6u03lmd4xjNjWfE
         BjZ3Vw+3gB7y+hLUsh9GD67YNKZD9pa2fKi4RiI6m53Q9XH2XTujXEFIwY+qBIDmBvA+
         koZnM84R/FLjnl3Y2ViXf/7Wv7J2Ku7Mz/t7vuYdkf7fc7ggibO4dwch/u8M0+uCQ4Pq
         TlpTwQnR/j9wUl+DutoY9257humQH0Zg6MVNqP6ZvVVbxY6JFpKMSFlA3VzUINIkEKUj
         O+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQCf+qv5bd4ElCdzVZ3jNTOUbAb4CRaR/pYBuk0Bj3Q=;
        b=lnb4WGpCxnJ1kHRTf7cAqGKlfB5lBSJGUAM2g8B7IaNlDLTUHELJX6KNb/+LAbKk7B
         y9cj0IWCWx+Ki+jTcoHe0gCJf1A4FOVdveJB5KVUqMdf/f08yrHAjE6dbmSx/NKaI/eP
         KFKtsCjKFx783XCAS4wtLLeE8dDk5h/9qArT28uFcjZYJKysDTGtsSGLvdC1Thka/iWF
         0y6dqYQvaRCq1/OiogEkRXsdczaZ2nbOJ7M2u/6hFgUrHwFNDrAbLyH1xLBXALcI0saQ
         tXnl0y2UHm8tVUkN0mYd4NusDqMZqQvXF3e/a2KRJrBLnnxUgp8XSHUwINJsLjavGMhu
         34sw==
X-Gm-Message-State: ANoB5pm/Y51vcvHwBVYYkH/BH98xzWRZEWgblyD99yHD3Zjsp/4sBYuB
	KLOQczx8iFuUbIaNUdjsBypWXqybPvA0zA==
X-Google-Smtp-Source: AA0mqf5cIONd+2x+L2MXCRiqZq2/EcC0pk+sRNVlYXBgoIRtXYMkzbVBjpJ730j3x5UYsqwZQ1EoJg==
X-Received: by 2002:a05:600c:3592:b0:3d1:bc32:2447 with SMTP id p18-20020a05600c359200b003d1bc322447mr25311006wmq.21.1671197736187;
        Fri, 16 Dec 2022 05:35:36 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c510d00b003c6f8d30e40sm11757007wms.31.2022.12.16.05.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 05:35:35 -0800 (PST)
Message-ID: <52a9924a-aaea-ed31-672f-fdf8e1ef2881@gmail.com>
Date: Fri, 16 Dec 2022 14:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org
Cc: nancy.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221111082912.14557-1-matthias.bgg@kernel.org>
 <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com>
 <CAGXv+5FORS=iGe55StxR_1E3sdtk9cvitfvNa1SydqCjWGcubg@mail.gmail.com>
 <CAGXv+5GfZYdhSCkhdGXRvbprwhceMJy9a9j+cNxsyUFYhMNZOw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5GfZYdhSCkhdGXRvbprwhceMJy9a9j+cNxsyUFYhMNZOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_053539_944646_392A580E 
X-CRM114-Status: GOOD (  16.66  )
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



On 01/12/2022 12:25, Chen-Yu Tsai wrote:
> On Thu, Dec 1, 2022 at 7:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> On Mon, Nov 14, 2022 at 7:59 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Il 11/11/22 09:29, matthias.bgg@kernel.org ha scritto:
>>>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>>>
>>>> For backward compatibility we add the deprecated compatible.
>>>>
>>>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>> ...And tested on MT8195 Cherry Chromebook.
>>
>> This now seems like a bad idea. In the dtsi we have two nodes (vdosys0 and
>> vdosys1) that both currently use the -mmsys compatible, which in the driver
>> maps to vdosys0. So not only do we have vdosys1 incorrectly probing as
>> vdosys0, we also have duplicate clks being registered and duplicate DRM
>> pipelines. On my device vdosys1 ends up winning the duplicate clock race.
>>
>> I suggest just reverting this. The display stuff won't be useful unless
>> the drivers are able to distinguish themselves from one another.
> 
> That and try to fix the vdosys0 node ASAP.

I'm not sure what you mean? If there are any patches that are in my queue that 
needs attention, please let me know.

Regards,
Matthias

