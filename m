Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5DAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWE+Vfpr/Rg8Slpgs7xQCU+/Hq09SKYTjoc0oFxFgGQ=; b=dsF3I+gN5fYHEf
	X8enuQK9j6XjmDJSy1W1mZzTl8aoG1a3RDUjBIYIQG97pwZkMsP6vX/oYH7z9TTLYzRMWYBPFXTsE
	4IlVRMMleA+lIiGTwQN/VxYNuqvQi8VsVvy8YBTm7V0Bs5xw3okpKrIu3E8qxWet8i6JrQvTzUwiB
	kDxraiIuKATj6uIoGe0uopNPetthzzyyBayqbxRNbcgAS75qz7w4LiCtyulqqcpfZGnmVGJw/7Ikv
	cpzibd42+Vy/B7xKpNZm9U3uQIbo9Fx4d7X45DgwBETx3oIZ4Z3q8LH2HM6xVpKLjjvbPrFEdFvjG
	8Hh8gy8bREh6r9TIWn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npXoc-00GnIq-9w; Fri, 13 May 2022 16:06:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npXoa-00GnIA-6l; Fri, 13 May 2022 16:06:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id w4so12010368wrg.12;
 Fri, 13 May 2022 09:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=yhcQPNoy9WhnaZmTJzUinmHoEkej97TxVsnONomq59c=;
 b=TRmbjfUTXeJkJ+OZ+tXKzsh8kvoq686vawu5tGqY0tkVT1/PY+O5mUASK39XupN2ye
 xlBQCrya8V+0xoEyG93u9cSr6uZH1GAp2+Hj/wWI/2LYcds4gDKMQFrAjSkLZHq6D3Tv
 b3j9YiUYuca4MXLDCOqf4NodeeoGgkicTbBea0rgX7n/wiLdZ7G/9jCkSAbFTxO94OoR
 7b5kvUe/eJkGCTGfFfUIVLoqjuBEO6Skt1elWMReM1g594QbjLvhpyZXwcsQDr4SJFpo
 ZgGmxvVWjqYzZvR70lguUUnRycTA54oZM6Ch3srKtBFbDddDqj/2ONa5FVrXSqv724/m
 zJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=yhcQPNoy9WhnaZmTJzUinmHoEkej97TxVsnONomq59c=;
 b=p1LSB94amTqV9n0vT7dHrnt3aOo4SsZCcqH0pqWxLyjcpg7OwgirgCvuDgfNSEjlTD
 RwXn1mlOcefQ4SSyemCnLxImsuyYvyxoDYsYyofF/UfQbdSRwIEWZmh4kFVpYovHJQ/Z
 IdxfRTOiNJQkvhaNVhhqFQt3QS4j4f8pKsnymi66x+YkW+3QNiD/yejCTtnS7cQJ/tAO
 NG2qB0CvrYg0QRdZ61iyHD4o/cT3Q/9RvhCmjB/HJF/Px4TeDDKFAjzm1YGVYt6SvrTv
 X8zrlaNfy3WdHoLUaqGLJhKSuhJztgadZJ9oWgg3EsRzPuqYzb8HwAdfD4Z81RVLXrDt
 iBaw==
X-Gm-Message-State: AOAM533Yo/Jm6GpyXenZOgSZhDY66uyz6PFhyDcaoIf5LfZFBssOVu6n
 cW20N2spveYw4CUJpzGdYgY=
X-Google-Smtp-Source: ABdhPJyEzc0OmDwq/e461v0akjH7YNOS5FX0OlQh/aIv4/QJBmBEkWzkRj2n9V00nSau183WNwjHgg==
X-Received: by 2002:a05:6000:1ac8:b0:20c:dced:2f6c with SMTP id
 i8-20020a0560001ac800b0020cdced2f6cmr4462443wry.107.1652458008948; 
 Fri, 13 May 2022 09:06:48 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 j1-20020adfc681000000b0020c5253d8ecsm2443410wrg.56.2022.05.13.09.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 09:06:48 -0700 (PDT)
Message-ID: <942eb0ea-3376-f891-e8b2-a57123ddccd7@gmail.com>
Date: Fri, 13 May 2022 18:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Yong Wu <yong.wu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Evan Green <evgreen@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
 <CAK8P3a0iFq3X6PrLggc=Av9GdWnJU=US659jaUXqH+X4GnbYTA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [GIT PULL] arm: mediatek: DT updates for v5.19
In-Reply-To: <CAK8P3a0iFq3X6PrLggc=Av9GdWnJU=US659jaUXqH+X4GnbYTA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_090652_333924_CC50A344 
X-CRM114-Status: GOOD (  26.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/05/2022 14:11, Arnd Bergmann wrote:
> On Fri, May 13, 2022 at 1:21 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>> Hi Arnd and Olof,
>>
>> Please have a look on the below 32 bit DT updates for v5.19. Apologies for the
>> late pull request but I got sick and needed my time to recover.
> 
>> Yong Wu (1):
>>         arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
> 
> Can you clarify what this means for backwards compatibility? I see old kernels
> used to parse these properties, does that mean that the updated DT is no
> longer compatible with them?
> 

My understanding is, that backwards compatibility is given when using older DT 
with newer kernel. This should be the common case, normally you update your 
software but nearly never your FW. No compatibility is given when using older 
kernel with newer DT.

I think that's an ongoing debate if we should provide backwards compatibility 
for both kernel and DT.

> If you break compatibility, this should only be done for exceptional reasons,
> and explain the tradeoffs. What is the oldest kernel that is still compatible
> with the updated DT files, and why can't we just keep the properties around?
> 

First kernel version that does not work with the old DT will be v5.18. This 
patch is the outcome of a change in the yaml file [1] which has a Acked-by from 
Rob. I double checked and I wasn't able to find the mail where Rob did give his 
Acked-by... Yong, can you provide a link to that email? I can see you added the 
Acked-by in v2 of the series.

One thing that comes to mind, that we mark the larb phandle as deprecated in the 
yaml file, instead of deleting it. Then we could keep that in the DT files, 
although newer kernels won't work with that. Another option is, to add the code 
deleted by
ba3cd6714aed ("media: mtk-jpeg: Get rid of mtk_smi_larb_get/put")

back as fallback for older DTs. Although I fear there is much more things to fix 
in a lot of drivers. DRM, mdp and memory/mtk-smi.c are some that I found in a 
'quick' look at the problem.

Taking into account that and the fact that we are talking mainly about 
chromebooks and the Bananapi R2 as public available HW, I think we can live with 
the compatibility breakage of newer DTs not working with older kernels.

Anyway as you can see, this patch is just the tip of the ice-berg. So if you 
feel that's something unacceptable we will need to chase people to fix backward 
compatibility.

Regards,
Matthias

[1] 
https://lore.kernel.org/linux-mediatek/20220117070510.17642-2-yong.wu@mediatek.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
