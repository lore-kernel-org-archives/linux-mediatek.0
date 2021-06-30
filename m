Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458ADC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 11:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F32F061920
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 11:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F32F061920
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nmRLxEjuo5D/rjvgIjRdyxxglajlX1rU3S6yt5W9M/w=; b=mUrSXSxNVdEupENghFYG0h8cx6
	upXoZ9OUFjASrA5VvdsJCJ84HEV+5+WAzrU18xTbbQHsi+lj6tVrJcDltM8qkoiNt/OjuiHYw7amu
	8eyvBaDNeV2Q26lzWLePyljOZt9FgJOwuWO7tWPrxPE9BdXeOYg1eaS2F/F3AwUPV9iyX2wi56viX
	dM4OcEYy9ACOvzaQdc+gNy050qOoIbP6Mm7rotqMRzE0jO9pBs63FITvHNXdWyFFuyNrTMVO+5j49
	1AkfUxkR+vr5s0r17DipYEu+9yESXczg1aLcmABqHBHUZqMkl3t0KGrj6+oJrQBFGVvZZsxXGle0/
	QKCqs8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyYcn-00DkBz-8V; Wed, 30 Jun 2021 11:43:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyYck-00DkB1-3u; Wed, 30 Jun 2021 11:43:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso1335584wmj.4; 
 Wed, 30 Jun 2021 04:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iODbWiouD0QpY2BGF1bz2zvH9cqIAWCPddrbkXWdpQM=;
 b=KJMKkEGNHAUHuk5D6X3LEbETeBJhBvD8t6AyN5xPMN8srDc19A0OEVyK5h+xIWRhjn
 sf96TLzwxbXF2IY2vE2ECZ+vYVA9vfrlK9+UMV2mRXlEkQ2CwUNlTgX+4pV+Dk0lPlSl
 gXcWGkkcQiAPfKb/9RbJN8cRbxFZQttUuDM9F0rfT5fOv9svEOYc5/t8EjqEI7wBQslv
 4BIyQ/qDfMdZU+sDbMcXWdqpPhD03cuH0md405YHkXj0WVR71Dp3I9b8m16zYqVzMWvr
 GqXAbjG7DXFE5RGXs6aLsphoD4lVqSdPD2smTytZ0yNJvrmlzFkvxdURMbmfFYM7ZEab
 6mEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iODbWiouD0QpY2BGF1bz2zvH9cqIAWCPddrbkXWdpQM=;
 b=DkhQUqwko6C4zyonmbqLVPCyd7VX2Pu1XEGAY6rAoMuUmOfi7nYrHHWCzrzMpaEpyi
 hYXgDUV8Xm+v4y5vng2pybsOrYIWvy7fGmIc6C8jgG6Vfiri5Z2NX4ndcNQ1y+EvW22z
 BhZqEtwStJkVIrAdBnHS/RHO0LwdQrC/7gyACkpgWz3Exv5U5bnL5mQmZ/H/VL+95H/u
 6PzmN53or8EyM2v/jPCgZvJmZN33i9S7tpZLYbkYsYg0cXi13uFqdgXfRx9oTa7qXB2P
 rGuEJRRGQg/ZXv/6WSZn+7fE4G5WK+obYiMIFCHxvZk6MjtM8By/pJQbEK2unPPH/+/F
 ocpg==
X-Gm-Message-State: AOAM532CLAXKeZXI3KpA0vYAAImtJ/h2vUVvDRpjZYSCBmCejBP0rYDG
 K9zdeY+dIf/At6fqSmPpDwrewKv4w3YgvQ==
X-Google-Smtp-Source: ABdhPJyXaz/kDNmiMTIsGgDK7ph+Gfm+KdTCvu18y18r0ZCf+HsuoVtRyW3YnpWwR3RqHGNmyYOezw==
X-Received: by 2002:a05:600c:3b8b:: with SMTP id
 n11mr3977228wms.159.1625053400497; 
 Wed, 30 Jun 2021 04:43:20 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id k5sm21380301wmk.11.2021.06.30.04.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 04:43:19 -0700 (PDT)
Subject: Re: [PATCH 03/22] clk: mediatek: Fix corner case of tuner_en_reg
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-4-chun-jie.chen@mediatek.com>
 <CAGXv+5F2zTcqnjH2ud38vUD149KJtgxhPQME2Mk6-vGtQv+2YQ@mail.gmail.com>
 <ff6179e8-06f9-fbba-c704-a74381c2149a@gmail.com>
 <CAGXv+5FXuMnhsnytLYKKA9YE97bps7KnkDNADvv8f_wdTqnrfg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <be824462-4c2f-3bde-0a3d-c5470a5b0fbb@gmail.com>
Date: Wed, 30 Jun 2021 13:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAGXv+5FXuMnhsnytLYKKA9YE97bps7KnkDNADvv8f_wdTqnrfg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_044322_222484_1C8B21A7 
X-CRM114-Status: GOOD (  20.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/06/2021 13:09, Chen-Yu Tsai wrote:
> On Wed, Jun 30, 2021 at 6:53 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 30/06/2021 09:31, Chen-Yu Tsai wrote:
>>> On Thu, Jun 17, 2021 at 7:01 AM Chun-Jie Chen
>>> <chun-jie.chen@mediatek.com> wrote:
>>>>
>>>> On MT8195, tuner_en_reg is moved to register offest 0x0.
>>>> If we only judge by tuner_en_reg, it may lead to wrong address.
>>>> Add tuner_en_bit to the check condition. And it has been confirmed,
>>>> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
>>>> clock square control.
>>>>
>>>> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
>>>
>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>>
>>> Though you might want to consider converting these types of checks into feature
>>> flags.
>>>
>>
>> Yes I think adding a feature flag is the way to go. Luckily there are only a few
>> SoCs that will need updates at the same time.
> 
> I also see that the different clock modules are tied together using only clock
> names written in the drivers, instead of clock references in the device tree.
> 

Not sure I understand what you mean. Do you refer to something like [1]? That's
because the clock is probed by the DRM driver, as they share the same compatible
and IP block.

Regards,
Matthias

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/mediatek/clk-mt8173-mm.c?h=v5.13#n139

> Unfortunately reworking this would likely require a lot more work. I previously
> did a bit of internal reworking for the sunxi drivers. While not the same, I
> think the plumbing required is comparable.
> 
> ChenYu
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
