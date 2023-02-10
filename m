Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BAAC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZAhfBQYquLF1qnZYO3CTH5oSKC+08iiTknQihvWDiA=; b=Lepv/DadiISCaz//avSl+XVxAg
	0Ee3xilGqL+gSgTIVXKGGmvZHCD2kX00wEJDRkze3z+mGM3/AmnNZrx/R7UfU65Xl4RnCBHD9vjEV
	0pYXy64f/l1xfgnCSXzkA0DT1HWHkQgakkPJ4RcUvtDNaJDDf+c0c5LjQiN2I7G8hLNU3OaoW3Yfj
	kvghJXFIDphIlN4zS1zlbp8NqqgI4HZkhgTp93Wm1AZdrQe325OYQhKz9UcEQZNM+KHLVGuakUVNl
	33D9M33a//AHC5rSfoNd0gzqkhTelMQNv/3i3eqgdYVvID71Qo2j2pch283xX9xExlrHhXgQW8uRI
	cLsLSxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQP8X-004qZv-Hz; Fri, 10 Feb 2023 08:52:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQP8T-004qYP-SK
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 08:52:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id z13so3279890wmp.2
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Feb 2023 00:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YZAhfBQYquLF1qnZYO3CTH5oSKC+08iiTknQihvWDiA=;
        b=fwGE+8ZXY4Cqp7eooYZ0dYLd+1x3muucfpFXGjo9lEDwCb9aW536kfIl5wvOL9ukDK
         ZPOW4f5iyqFYvMSxowTCoJKZebalcQT5tqGc4gg+WWV/O1Xlqhry3TsT/jfvogtix2ou
         VsVh/c8fKkXC3yf2bGsdgSUScN0i1uIdjU2hgzAHyeRqmW0IAhHho218gODY5fUtUORK
         /pSadvC4Q6tD01pE63iGs0cxFKNdc3CgZKIyKjPSTraWX//sx/g1A2eqBxAZa/1vCVc8
         +KspIoqrJ4Weklwd0UDwAUv+/YQGT5bROiuQb1WBScSPXC6T2RBAqKqoJ2C2wihh9Bpy
         BLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZAhfBQYquLF1qnZYO3CTH5oSKC+08iiTknQihvWDiA=;
        b=n0WRFhUze3paYdq+McYbekRIGAyxmcblSBqcjEj8e/X7vTLt6xVsQjpHlUJrHejstI
         uHL/C9kVUnWUtpmgSFSJehhjywkIIYG91EnjRVvK0Y7jG3N6i3OYyeHd9ERHhMEIr8OS
         JMOezqN8OagitevQ6u25hd61153OIN2EJ1YvMgc+ea6xx349e441FHmmuqNUNhwMqN9N
         Zzga+O9sOvZIELOi9lgt0rYN/2ChSHFuZOkLj9trzxuqai3mW5TQzHhSX5yPrSfHnS3p
         syeasjBc39+e6uvha6cHjqRJo8YgjzAsi6e+s4dkLUj+qCy+VUch1YkpQENM8wpenooK
         vKKg==
X-Gm-Message-State: AO0yUKW7kYNR9EH9VoBiI11XJ8GIoej9KvV5dJ3zlY+DgVoX9CTPuuSN
	BxtXvMhPGV1/l8r8xlsqPFkUXQ==
X-Google-Smtp-Source: AK7set/OKo4yEv07P848igeq6Jgq0peHDJLiD5bvtcLGw5Ybo81esX+fCq4M7Yn6i8m3EQT/mZjzEA==
X-Received: by 2002:a05:600c:4386:b0:3df:94c3:4725 with SMTP id e6-20020a05600c438600b003df94c34725mr12272914wmn.38.1676019120422;
        Fri, 10 Feb 2023 00:52:00 -0800 (PST)
Received: from linaro.org (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b003dc434900e1sm4771255wms.34.2023.02.10.00.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 00:52:00 -0800 (PST)
Date: Fri, 10 Feb 2023 09:51:57 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: John Stultz <jstultz@google.com>
Cc: walter.chang@mediatek.com, Thomas Gleixner <tglx@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>, wsd_upstream@mediatek.com,
	stanley.chu@mediatek.com, Chun-hung.Wu@mediatek.com,
	Freddy.Hsin@mediatek.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] Support timer drivers as loadable modules
Message-ID: <20230210085157.GA175687@linaro.org>
References: <20230208094813.20874-1-walter.chang@mediatek.com>
 <fdcea75c-1ddf-c4f4-5d46-f32a6619b66d@linaro.org>
 <CANDhNCp6esdor4kDDTDowkKRfRN9QW8Au7uJMhsxyw0eAG4i8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCp6esdor4kDDTDowkKRfRN9QW8Au7uJMhsxyw0eAG4i8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_005201_959664_C2AEA1D2 
X-CRM114-Status: GOOD (  22.32  )
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

On Thu, Feb 09, 2023 at 11:50:49AM -0800, John Stultz wrote:
> On Thu, Feb 9, 2023 at 7:36 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> >
> > On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
> > > From: Walter Chang <walter.chang@mediatek.com>
> > >
> > > This patch exports functions in kernel so that timer drivers,
> > > such as timer-mediatek.c can become loadable modules in GKI.
> >
> > What for ?
> 
> In general, it's the same reason why modules exist: We want to be able
> to support a wide array of devices with a single kernel, but we don't
> want all devices to pay the memory cost of code that will never be
> used there. So being able to support loading device-specific bits like
> clocksources (along with other device specific logic) helps.

Agree, that is why modules are for.

> Obviously it still has to make sense, and others have raised concerns
> of stability issues if the hardware support is needed before we can
> get to module loading, but I think if this allows drivers (such as
> timer-mediatek) to be loadable safely, I see it as beneficial.

From a technical point of view, it is arguable.

But my main concern is the real reason of changing this to the module
format. I see that as a way to overcome the effort to upstream the
drivers. And the GKI is an alibi to justify the module conversion.

Given the timers is a base brick of the core subsystems, without
proper support of the timer (eg. bug fixes), the platform support will
be wobbly.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

