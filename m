Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5473DC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sjUJ0Lv8YbzrsDMEv/6vWsls81TZYcnrrQllYbRbgg=; b=G0BiW5u1s2IxE6
	CVNuckVN4b46mbH883Pp8z6haQeVLZ1WWIhGQ5CeiY7Fn0AGJH92y3pvYR9L02fbOy9J0BfiDcrm+
	l+zgn4q7ncZA58RPfcP056oauDDAF4U19Ef5y+0WHey1jk8UmPsm+M+hPs7Ow7arDkvR5a/drXxag
	VFKFRi/ZOecHvZ6uK1kMrrkMuy0rOaVl+fDQjjUdCFQpi53lDWqpXk0c2DaefnhXRw9haB5X3Y97d
	WcT/CFRBcGopWPfceLVizibm1odGmw+oJEWdDzWfp770REicf5Oh2XQSX/NmO1LZxD8DSCRUAhPPx
	9JI1BSRCd8zTc7WCM4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ8ka-00Bltd-S0; Tue, 29 Mar 2022 10:06:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ8kN-00BlqE-Au; Tue, 29 Mar 2022 10:06:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 i131-20020a1c3b89000000b0038ce25c870dso964776wma.1; 
 Tue, 29 Mar 2022 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gJYdJOur1iY6XbbeGXFj0ECGEHoJkzCeSnRWw+1akAE=;
 b=g1SGsbd/jLtCfDq6yzASjQLg1D1Di4TRzjMb5UiIfrE9WiDmnp4ps8sIblZUNtYLhl
 BEYp/E3cwcQ3Zx0+p3QoptHL3A/ppqsLefEG80tXSSwr+mpdP4i1AcDwb/671KD/V7Or
 SrBc47ULMLUb19cniOzsSHJIDLc2hutPluz+X07qok/90+UjDzhv6DSHFkWqgCReRafg
 8hQGGxrcX5P2AlRlhAUeG7o275fLN5UY/luSiQ/PippZc5scePfD88DWfB5YY4mbajP2
 /wEv07hBPdodolgvcwPf/ryO4mcjf2pm6CqHleQKRp4LwbU9hZS+Lg1pg+jJITwfzWUK
 5rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gJYdJOur1iY6XbbeGXFj0ECGEHoJkzCeSnRWw+1akAE=;
 b=fYgjcfWRWNsFGZdOOHRpki1Xl9+cFawqmV6ttT7oSjRM71+ih7GgmzEvH2al+MWydd
 PAe6im/fko5BC9w9fFlLI1b4CWcxAuy6cCN84HpnnlYPEflW+lP+iYeW2vKlxDBRakYn
 rEFYWRLA71CqQkkR1Uoy+ClQbkyeT1Tp0hnxn4d6j/4Xnc24z8uFc4gxun0pxNzEiey4
 ipnM9Y7kahO8gLmVLeQfuIbM+gHda2KnUbntzwhYW33hETm3AS4v8ZNeb6PA73p0iSxJ
 O45kyC8wADxoiCs8GKSsYu3f130bbaUZZm1G7C/Xka46kMosn2JEhQuvvWaD5sU1fLKW
 9G9A==
X-Gm-Message-State: AOAM532DPQZRJj28dIdJH1EF2SuwWzE1Ae7/Co/f0e9RKZGpzfKOpuES
 I/iwNTohefsGi0cPvNStCGU=
X-Google-Smtp-Source: ABdhPJw/yl37bo84CH0/pwnTrqSkLHICdBHbZfyNAKleJ5pkLbBWcMtajlzC2TVgbnU7tHyn6wt30Q==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id
 c7-20020a05600c0a4700b0037c09652b6fmr5636166wmq.31.1648548400811; 
 Tue, 29 Mar 2022 03:06:40 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a5d456b000000b0020406ce0e06sm14201716wrc.94.2022.03.29.03.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:06:39 -0700 (PDT)
Message-ID: <6dafde7d-17c6-bd25-dbe8-7f7acf80fd91@gmail.com>
Date: Tue, 29 Mar 2022 12:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra <linux-tegra@vger.kernel.org>, linux-oxnas@groups.io,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-unisoc@lists.infradead.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
 <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
 <YkLXTWdZ3zASxr4H@atomide.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YkLXTWdZ3zASxr4H@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_030643_435410_27FD510C 
X-CRM114-Status: GOOD (  11.40  )
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



On 29/03/2022 11:54, Tony Lindgren wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [220329 09:02]:
>> On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
>>> For example, I have a pile of pending omap clock clean-up dts patches
>>> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
>>> redoing or fixing up the patches with sed :)
>>
>> Git merge/rebase/cherry-pick should handle renames fine?
> 
> Possibly.. Not sure I'd count on that based on my earlier experiences
> though :)
> 

Yes. If this could be split up in per silicon-vendor patches, the maintainer 
could take them. Although it might be a pain to soc maintainers to resolve small 
conflicts when merging that branches.

Just my 5 cents.

Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
