Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D88BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuBVQzg2d6mxvm7wpaOmTNFZsQkjfArduEMYnNZOgU0=; b=Azn1VwijNnAi02
	WrvHCX3+berYxdTQNe4RCrq9czR3WV+K/jzh/Z+3krFBvvLc+XcRIdLi9YrlyfKSrJopZtBGjDw7I
	FqQw6aqgpRSvvV8MANJ7w99m4bMmRHd6r322iVVwCrUEu4IP8NwxqAw9qMuetQHGNW2jbDu+oeLDW
	QsIKhPp+hIWpw2XWYyQjv95mkQWNJQX3sru/XD1FG9E/DhfaazP8IMFCTEDl+EuXJEP50jcK6x3Ct
	Tdlxm4yR2KMZ5AsvCP0eoxr3dOQ33m91QexoXn7YTmI1ANd2A5RKRpQs7BB9WSTp3q02ZWUcpKU6s
	gSRcDfQ4rI5JcNVLiy3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msMjW-0085B0-FF; Wed, 01 Dec 2021 10:21:02 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msMjU-00859s-1k
 for linux-mediatek@lists.infradead.org; Wed, 01 Dec 2021 10:21:01 +0000
Received: by mail-ua1-f47.google.com with SMTP id l24so47890612uak.2
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 02:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urLNBsFGliR6FhvwlQWsAIf0ZWR7LeLf64IUUPE+zmE=;
 b=cDwKkCjUrGWVxqUIlmVJMyaHIQIKgb1KFOBTKFSDsf1IoW3dPhhkxxwexHKLg4Xn/A
 PUi4NDuvu0Cab9JZkLDug8kr59nPW7P2h72P5PiVs/xBkIZjtfiFTQAVMg3fi1wogj6t
 WV0EzEKKdunFMQV2MNGmFIp8Y+L9IJdwu656oXGSyS3uosugCqsx398pigW9HIGOD3GJ
 XanSOwvyWuHWMHG6/s7SyeawXx7CwzaJC0ItW9g5KqFFnG+2pVo3pgn1O5PH4c93p+Yf
 NPus6S0phuD46LjGq4XzWgc9GuwbM/cKR9GED9DU9swt8JLPcezKUNrYW2JUzM3PT92B
 WZbg==
X-Gm-Message-State: AOAM5330z+BDzE/3ilLyL2TTKvHPPqmuzb5FlkDmtTH6gwxSuNfI4De2
 UYC5pqRgkDCtysSikQI69Jw4k3hcPbqhmg==
X-Google-Smtp-Source: ABdhPJzGbERoQ0s5WmwSclmGbTR9JbejUt/2/I2Uhh4pWoJDvw673wJdGXXjVvELQ7VIO7KUEZln7w==
X-Received: by 2002:a05:6102:2835:: with SMTP id
 ba21mr5632588vsb.76.1638354056712; 
 Wed, 01 Dec 2021 02:20:56 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id v17sm12574431uar.15.2021.12.01.02.20.55
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 02:20:55 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id f7so15705931vkf.10
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 02:20:55 -0800 (PST)
X-Received: by 2002:a05:6122:2193:: with SMTP id
 j19mr5849899vkd.7.1638354055034; 
 Wed, 01 Dec 2021 02:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
 <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
 <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
 <YaZZzSPQDz0vHRQY@sirena.org.uk>
In-Reply-To: <YaZZzSPQDz0vHRQY@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Dec 2021 11:20:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5Lc9x4mnoKn2xUPku1tT1XM=ALY-vPtos=NBjcrzAWQ@mail.gmail.com>
Message-ID: <CAMuHMdU5Lc9x4mnoKn2xUPku1tT1XM=ALY-vPtos=NBjcrzAWQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@oss.nxp.com>, daniel.baluta@gmail.com, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, AjitKumar.Pandey@amd.com, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Julian.Schroeder@amd.com, 
 linux-mediatek@lists.infradead.org, Balakishore.pati@amd.com, 
 yc.hung@mediatek.com, vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, 
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_022100_119585_D2E25265 
X-CRM114-Status: GOOD (  22.34  )
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

Hi Mark,

On Tue, Nov 30, 2021 at 6:05 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, Nov 30, 2021 at 10:49:30AM -0600, Pierre-Louis Bossart wrote:
> > To Geert's point, there may be an additional need to add a
>
> > depends on SND_SOC_AMD_ACP
>
> > There are also a set of
>
> > SND_SOC_AMD_ACPyx options, not sure if any applies as a dependency here?
>
> Or put them in an if block (IIRC I thought they were which was why the
> dependency wasn't needed but I don't know what I was looking at if I did
> check that).

Probably you were looking at sound/soc/amd/acp/Kconfig, where all the
other ACP options live, and where you had applied my earlier patch
to wrap everything in a big "if".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
